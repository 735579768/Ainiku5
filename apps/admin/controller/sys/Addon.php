<?php
namespace app\admin\controller\sys;

class Addon extends Base {
	public function lis() {
		$this->pages([
			'table' => 'Addon',
			// 'where' => ['a.status' => 1],
			// 'order' => 'sort asc',
		]);
		$this->assign([
			'meta_title' => '已装插件',
			// '_list'      => [],
			// '_page'      => '',
		]);
		return $this->fetch();
	}

	//实现安装
	public function install() {
		if (request()->isAjax()) {
			$name = input('param.name', '');
			$info = \think\Db::name('Addon')->where(['name' => strtolower($name)])->find();
			if ($info) {
				$this->error('插件已经安装');
			}
			$obj    = $this->getAddon($name);
			$result = $obj->install();
			if ($result === true) {
				$config = $obj->getConfig();
				// //添加一个插件的设置菜单
				$data = [
					'pid'         => 2,
					'title'       => $config['title'],
					'url'         => $name . '/set',
					'group'       => '插件管理',
					'status'      => 1,
					'create_time' => time(),
					'update_time' => time(),
				];
				$menu_id = \think\Db::name('Menu')->insertGetId($data);
				// $menu_id = 22;
				//保存插件信息到数据库
				$data = [
					'name'        => $name,
					'menu_id'     => $menu_id,
					'title'       => $config['title'],
					'version'     => $config['version'],
					'author'      => $config['author'],
					'descr'       => $config['descr'],
					'status'      => 1,
					'param'       => '',
					'create_time' => time(),
					'update_time' => time(),
				];
				$id = \think\Db::name('Addon')->insertGetId($data);
				\think\Cache::clear('mainchildmenu');
				$this->success('安装成功');
			} else {
				$this->error('插件安装失败');
			}
		} else {
			$dirlist   = get_dir_list(SITE_PATH . '/addons');
			$addonlist = cache('newaddon');
			if (!$addonlist || APP_DEBUG) {
				$addonlist = [];
				foreach ($dirlist as $key => $value) {
					$info = \think\Db::name('Addon')->field('addon_id')->where(['name' => strtolower($value)])->find();
					if (!$info) {
						$obj = $this->getAddon($value);
						if ($obj) {
							$conf         = $obj->getConfig();
							$conf['name'] = $value;
							$addonlist[]  = $conf;
						}
					}
				}
				cache('newaddon', $addonlist);
			}
			// dump($addoninfo);
			$this->assign([
				'meta_title' => '安装插件',
				'_list'      => $addonlist,
				'_page'      => '',
			]);
			return $this->fetch();
		}
	}

	//卸载插件方法
	public function unInstall() {
		$name = input('param.name', '');
		$info = \think\Db::name('Addon')->field('addon_id,menu_id')->where(['name' => strtolower($name)])->find();
		if ($info) {
			$obj = $this->getAddon($name);
			if ($obj) {
				$result = $obj->unInstall();
				if ($result === true) {
					\think\Db::name('Addon')->where(['addon_id' => $info['addon_id']])->delete();
					\think\Db::name('Menu')->where(['menu_id' => $info['menu_id']])->delete();
					\think\Cache::clear('mainchildmenu');
					$this->success('卸载成功', url('lis'));
				} else {
					$this->error('卸载失败');
				}
			} else {
				$this->error('卸载失败,插件文件可能已丢失');
			}
		}

	}

	/**
	 * 返回一个插件的实例
	 * @return [type] [description]
	 */
	private function getAddon($name = '') {
		if (empty($name)) {
			return null;
		}
		$name       = strtolower($name);
		$addon_path = SITE_PATH . '/addons' . '/' . $name . '/' . ucfirst($name) . 'Admin.php';
		if (file_exists($addon_path)) {
			include $addon_path;
			$name = "\\addons\\{$name}\\" . ucfirst($name) . 'Admin';
			return new $name();
		} else {
			return null;
		}

	}

}

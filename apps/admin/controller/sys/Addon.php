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
			'meta_title' => '已装扩展',
			// '_list'      => [],
			// '_page'      => '',
		]);
		return $this->fetch();
	}

	//实现安装
	public function install() {
		if ($this->request->isAjax()) {

			$name = input('param.name', '');
			$info = \think\Db::name('Addon')->where(['name' => strtolower($name)])->find();
			if ($info) {
				$this->error('扩展已经安装');
			}
			$obj    = \app\common\controller\Addon::getAddonInstance("/addons/{$name}/{$name}Admin");
			$result = $obj->install();
			if ($result === true) {
				$config = $obj->getConfig();
				// //添加一个扩展的设置菜单
				$data = [
					'pid'         => 2,
					'title'       => $config['title'],
					'url'         => $name . '/set',
					'group'       => '已装扩展',
					'status'      => 1,
					'create_time' => time(),
					'update_time' => time(),
				];
				$menu_id = \think\Db::name('Menu')->insertGetId($data);
				\think\Cache::clear('menu');
				// $menu_id = 22;
				//保存扩展信息到数据库
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
				\think\Cache::clear('menu');
				add_user_log('安装扩展', input('param.'));
				$this->success('安装成功');
			} else {
				$this->error('扩展安装失败');
			}
		} else {
			$dirlist   = get_dir_list(SITE_PATH . '/addons');
			$addonlist = cache('newaddon');
			if (!$addonlist || config('app_debug')) {
				$addonlist = [];
				foreach ($dirlist as $key => $value) {
					$info = \think\Db::name('Addon')->field('addon_id')->where(['name' => strtolower($value)])->find();
					if (!$info) {
						$obj = \app\common\controller\Addon::getAddonInstance("/addons/{$value}/{$value}Admin");
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
				'meta_title' => '安装扩展',
				'_list'      => $addonlist,
				'_page'      => '',
			]);
			return $this->fetch();
		}
	}

	//卸载扩展方法
	public function unInstall() {
		$name = input('param.name', '');
		$info = \think\Db::name('Addon')->field('addon_id,menu_id')->where(['name' => strtolower($name)])->find();
		if ($info) {
			$obj = \app\common\controller\Addon::getAddonInstance("/addons/{$name}/{$name}Admin");
			if ($obj) {
				$result = $obj->unInstall();
				if ($result === true) {
					\think\Db::name('Addon')->where(['addon_id' => $info['addon_id']])->delete();
					\think\Db::name('Menu')->where(['menu_id' => $info['menu_id']])->delete();
					\think\Cache::clear('mainchildmenu');
					\think\Cache::clear('menu');
					add_user_log('卸载扩展', input('param.'));
					$this->success('卸载成功', url('lis'));
				} else {
					$this->error('卸载失败');
				}
			} else {
				$this->error('卸载失败,扩展文件可能已丢失');
			}
		}

	}

}

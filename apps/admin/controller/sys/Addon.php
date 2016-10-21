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
			$name   = input('param.name', '');
			$result = $this->runAddonMethod($name, 'install');
			if ($result === true) {
				$this->success('安装成功');
			} else {
				$this->error('安装失败');
			}
		} else {
			$dirlist   = get_dir_list(SITE_PATH . '/addons');
			$addonlist = [];
			foreach ($dirlist as $key => $value) {
				$conf         = $this->runAddonMethod($value, 'getConfig');
				$conf['name'] = $value;
				$addonlist[]  = $conf;
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
		if (request()->isAjax()) {
			$name   = input('param.name', '');
			$result = $this->runAddonMethod($name, 'unInstall');
			if ($result === true) {
				$this->success('卸载成功');
			} else {
				$this->error('卸载失败');
			}
		} else {
			$this->error('访问错误');
		}
	}

	/**
	 * 运行插件的方法
	 * @return [type] [description]
	 */
	private function runAddonMethod($name = '', $method = '') {
		if (empty($name) || empty($method)) {
			return '';
		}
		$name       = strtolower($name);
		$addon_path = SITE_PATH . '/addons';
		include $addon_path . '/' . $name . '/' . ucfirst($name) . 'Admin.php';
		$name = "\\addons\\{$name}\\" . ucfirst($name) . 'Admin';
		$obj  = new $name();
		return $obj->$method();
	}

}

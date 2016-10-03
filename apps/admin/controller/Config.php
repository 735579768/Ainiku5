<?php
namespace app\admin\controller;
use think\Db;

class Config extends Base {
	public function index() {
		return $this->fetch();
	}
	public function group() {
		if (request()->isPost()) {
		} else {
			$list = Db::name('Config')->select();
			$data = [];
			foreach ($list as $key => $value) {
				$data[$value['name']] = $value['value'];
			}
			$this->assign('data', $data);
			return $this->fetch();
		}

	}
}

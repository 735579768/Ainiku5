<?php
namespace app\admin\controller;

class Pub extends \app\common\Controller\Base {
	public function index() {
		// var_dump(config(''));
		return $this->fetch();
	}
	/**
	 * 用户登陆
	 * @return [type] [description]
	 */
	public function login() {
		if (request()->isPost()) {
			$this->success('登录成功');
		} else {
			if (is_login()) {
				$this->redirect('Index/index');
			} else {
				return $this->fetch();
			}

		}

	}
	/**
	 * 退出登录
	 * @return [type] [description]
	 */
	public function loginOut() {
		$this->redirect('Pub/login');
	}
}

<?php
namespace app\admin\controller;

class Base extends \app\common\Controller\Base {
	/**
	 * 后台登录检测
	 * @return [type] [description]
	 */
	public function _initialize() {
		$this->assign('meta_title', '首页');
		$uid = is_login();
		$uid ? define('UID', $uid) : $this->redirect('Pub/login');
	}
	public function returnResult($status = 1, $success = '操作成功', $fail = '操作失败') {
		if ($status) {
			$this->success($success);
		} else {
			$this->error($fail);
		}
	}
}

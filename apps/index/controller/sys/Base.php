<?php
namespace app\index\controller\sys;

class Base extends \app\index\Controller\Base {
	public function _initialize() {
		parent::_initialize();
		if (!is_login()) {
			$this->error('请先登陆!', url('/'));
			// $this->redirect('pub/login');
		}
	}
}
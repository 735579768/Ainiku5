<?php
namespace app\index\controller;

class Base extends \app\common\Controller\Base {
	public function _initialize() {
		parent::_initialize();
		//使用模板主题
		$theme    = 'default';
		$tpl_path = APP_PATH . request()->module() . '/view/';
		$this->view->config('view_path', $tpl_path . $theme . DS);
	}
}
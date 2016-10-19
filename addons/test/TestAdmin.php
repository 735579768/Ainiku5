<?php
namespace addons\test;

/**
 * 后台默认访问带Admin后缀的类
 */
class TestAdmin extends \app\common\controller\Addon {
	public function index() {
		reg_css('reset,common');
		reg_js('jquery-1.9.1.min,ank');
		echo $this->fetch();
	}
}
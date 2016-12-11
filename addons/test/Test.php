<?php
namespace addons\test;

/**
 * 除啦后台默认访问类
 */
class Test extends \app\common\controller\Addon {
	public function index() {
		echo $this->fetch();
	}
}
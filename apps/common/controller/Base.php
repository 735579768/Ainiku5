<?php
namespace app\common\controller;
use think\Controller;

class Base extends Controller {
	/**
	 * 模块共用空操作方法
	 * @param  [type] $name [description]
	 * @return [type]       [description]
	 */
	public function _empty($name) {
		die('404');
	}
}

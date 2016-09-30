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
		// die('404');
		throw new \think\Exception('没有此方法:' . $name, 100006);
	}
	/**
	 * 验证码
	 * @return [type] [description]
	 */
	public function verify() {
		$conf = array(
			'imageH'   => 50,
			'imageW'   => 200,
			'fontSize' => 20,
			'bg'       => array(255, 255, 255),
			'useNoise' => false, // 是否添加杂点
			'length'   => 4,
		);
		$v = new \verify\Verify($conf);
		$v->entry(1);
	}
}

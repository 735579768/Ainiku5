<?php
namespace addons\test;

/**
 * 后台默认访问带Admin后缀的类
 */
class TestAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => '插件作者',
		'title'   => '插件名字',
		'descr'   => '插件描述',
		'param'   => []
	);
	public function index() {
		reg_css('reset,common');
		reg_js('jquery-1.9.1.min,ank');
		echo $this->fetch();
	}
	public function set() {
		if (request()->isPost()) {
			$this->saveParam();
		} else {
			$formarr = [
				[
					'type'    => 'checkbox',
					'name'    => 'nickname',
					'title'   => '姓名',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'checkbox',
					'name'    => 'name',
					'title'   => '邮箱',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'checkbox',
					'name'    => 'name',
					'title'   => '地址',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '',
					'is_show' => 3,
				],
			];
			$this->assign([
				'formarr' => $formarr,
				'data'    => $this->getParam(),
			]);
			echo $this->fetch();
		}
	}
}
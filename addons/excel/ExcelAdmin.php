<?php
namespace addons\excel;

/**
 * 后台默认访问带Admin后缀的类
 */
class ExcelAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => 'qiaokeli',
		'title'   => 'Excel表格导出',
		'descr'   => 'excel表格处理',
		'param'   => []
	);
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
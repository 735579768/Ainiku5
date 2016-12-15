<?php
namespace addons\excel;

/**
 * 后台默认访问带Admin后缀的类
 */
class ExcelAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => 'qiaokeli',
		'title'   => 'Excel表格',
		'descr'   => 'excel表格处理',
		'param'   => []
	);
	/**
	 * 导入excel文件示例
	 * @return [type] [description]
	 */
	public function sample() {
		$this->assign('data', $this->importExcel());
		return $this->fetch('content');
	}
	public function __construct() {
		parent::__construct();
		include __DIR__ . '/api/Excel.php';
	}
	public function __call($name, $args) {
		$excel = new \Excel();
		if (method_exists($excel, $name)) {
			return call_user_func_array([$excel, $name], $args);
		} else {
			return false;
		}
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
			return $this->fetch('admin_note');
		}
	}
}
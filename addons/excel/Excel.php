<?php
namespace addons\excel;

/**
 * 除啦后台默认访问类
 */
class Excel extends \app\common\controller\Addon {
	public function index() {
		echo $this->fetch();
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

}
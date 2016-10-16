<?php
namespace app\common\controller;
use think\Request;

/**
 * 自定义控件表单
 * 使用方法
 */
class Custom extends \think\Controller {
	private $_method = ''; //生成表单调用的方法
	private $_name   = ''; //表单的name值
	private $_value  = ''; //表单的value值
	public function __construct($method, $name, $value) {
		$this->_method = $method;
		$this->_name   = $name;
		$this->_value  = $value;
	}
	/**
	 * 当自定义方法不存在的时候会调用这个方法
	 * 可以参考这个方法自定义自己的表单控件
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function index() {
		//注册要用到的js和css
		// reg_css('');
		// reg_js('');
		return [
			'str' => '这里是自定义的表单字符串',
			'js'  => "alert('custom form {$this->_method} is not exist!');\r\n//这里是表单初始化要用到的js",
		];
	}

}
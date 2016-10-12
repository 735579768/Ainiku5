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
		if (APP_DEBUG) {
			throw new \think\Exception('没有此方法:' . $name, 100006);
		} else {
			return $this->fetch(APP_PATH . 'common/view/404.html');
		}

	}
	/**
	 * 初始化配置项
	 * @return [type] [description]
	 */
	public function _initialize() {
		parent::_initialize();
		//初始化系统配置
		config(get_sys_config());
		// dump(config(''));
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
	protected function ajaxReturn($data, $type = 'JSON', $json_option = 0) {
		switch (strtoupper($type)) {
		case 'JSON':
			// 返回JSON数据格式到客户端 包含状态信息
			header('Content-Type:application/json; charset=utf-8');
			exit(json_encode($data, $json_option));
		case 'XML':
			// 返回xml格式数据
			header('Content-Type:text/xml; charset=utf-8');
			exit(xml_encode($data));
		case 'JSONP':
			// 返回JSON数据格式到客户端 包含状态信息
			header('Content-Type:application/json; charset=utf-8');
			$handler = isset($_GET['callback']) ? $_GET['callback'] : 'callback';
			exit($handler . '(' . json_encode($data, $json_option) . ');');
		case 'EVAL':
			// 返回可执行的js脚本
			header('Content-Type:text/html; charset=utf-8');
			exit($data);
		default:
			// 用于扩展其他返回格式数据
			// Hook::listen('ajax_return', $data);
		}
	}
	/**
	 * 解析和获取模板内容 用于输出
	 * @param string    $template 模板文件名或者内容
	 * @param array     $vars     模板输出变量
	 * @param array     $replace 替换内容
	 * @param array     $config     模板参数
	 * @param bool      $renderContent     是否渲染内容
	 * @return string
	 * @throws Exception
	 */
	public function fetch($template = '', $vars = [], $replace = [], $config = [], $renderContent = false) {
		$content = parent::fetch($template, $vars, $replace, $config, $renderContent);
		//替换静态资源文件
		$js      = \assets\Assets::getInstance()->getSource('js');
		$css     = \assets\Assets::getInstance()->getSource('css');
		$content = str_replace(['{__ASSETS_CSS__}', '{__ASSETS_JS__}'], [$css, $js], $content);
		//去空白行
		$content = preg_replace(['/\n\s*\r/'], '', $content);
		echo $content;
	}
}

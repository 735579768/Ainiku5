<?php
namespace app\index\controller;

class Base extends \app\common\Controller\Base {
	public function _initialize() {
		parent::_initialize();
		// //使用模板主题
		// $theme    = 'default';
		// $tpl_path = APP_PATH . request()->module() . '/view/';
		// $this->view->config('view_path', $tpl_path . $theme . DS);
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
		$js      = \ank\Assets::getInstance()->getSource('js');
		$css     = \ank\Assets::getInstance()->getSource('css');
		$content = str_replace(['{__ASSETS_CSS__}', '{__ASSETS_JS__}'], [$css, $js], $content);
		//去空白行
		$content = preg_replace(['/\n\s*\r/'], '', $content);
		return $content;
	}
}
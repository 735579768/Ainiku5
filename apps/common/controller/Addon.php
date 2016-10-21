<?php
namespace app\common\controller;

/**
 * 插件的基类
 */
class Addon extends \think\Controller {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => '插件作者',
		'title'   => '插件名字',
		'descr'   => '插件描述',
		'param'   => []
	);
	// 视图类实例
	protected $view;
	// Request实例
	protected $request;
	public function __construct() {
		$conf              = \think\Config::get('template');
		$controllerName    = request()->controller();
		$conf['view_path'] = SITE_PATH . '/addons/' . $controllerName . '/view/';
		$this->view        = new \think\View($conf, \think\Config::get('view_replace_str'));
		// 控制器初始化
		$this->_initialize();
	}
	// 初始化
	protected function _initialize() {

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
		$content = preg_replace('/<\!\-\-(.*?)\-\->/i', '', $content);
		$content = preg_replace(['/\n\s*\r/'], '', $content);
		return $content;
	}
	/**
	 * 获取插件的配置信息
	 */
	public function getConfig($name = '') {
		// $conf = \think\Db::name('Addon')->where(['name' => strtolower(__CLASS__)])->find();
		// if (!$conf) {
		// 	return null;
		// } else {
		// 	$this->config = $conf;
		// }
		if ($name && isset($this->config[$name])) {
			return $this->config[$name];
		} else {
			return $this->config;
		}

	}
	//必须实现安装
	public function install() {}

	//必须卸载插件方法
	public function unInstall() {}

	//必须插件后台菜单设置
	public function set() {}
}
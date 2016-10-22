<?php
namespace app\common\controller;

/**
 * 插件的基类
 */
class Addon extends \think\Controller {
	use \app\common\traits\controller\Common;

	protected $config = array(
		'version' => '1.0.0',
		'author'  => '插件作者',
		'title'   => '插件名字',
		'descr'   => '插件描述',
		'param'   => []
	);
	private $addonName = ''; //当前的插件标识
	// 视图类实例
	protected $view;
	// Request实例
	protected $request;
	public function __construct() {
		$name            = get_class($this);
		$name            = explode('\\', $name);
		$name            = strtolower($name[count($name) - 1]);
		$name            = str_replace('admin', '', $name);
		$this->addonName = $name;

		$conf           = \think\Config::get('template');
		$controllerName = request()->controller();

		$conf['view_path'] = SITE_PATH . '/addons/' . $name . '/view/';
		$this->view        = new \think\View($conf, \think\Config::get('view_replace_str'));
		// 控制器初始化
		$this->_initialize();
	}
	// 初始化
	protected function _initialize() {
		parent::_initialize();
		//初始化系统配置
		config(get_sys_config());

		$module = request()->module();
		if ($module == 'admin') {
			$theme = config('admin_theme');
		} else {
			$theme = config('admin_index');
		}
		$theme || ($theme = 'default');
		//替换模板中的字符串
		$replace_str = [
			'__STATIC__' => STATIC_DIR . '/static',
			'__IMG__'    => STATIC_DIR . '/' . $module . '/' . $theme . '/images',
			'__CSS__'    => STATIC_DIR . '/' . $module . '/' . $theme . '/css',
			'__JS__'     => STATIC_DIR . '/' . $module . '/' . $theme . '/js',
		];
		$this->view->config('tpl_replace_string', $replace_str);
		config('view_replace_str', $replace_str);
		$this->assign([
			'meta_title' => '插件配置',
		]);
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
		//更改当前控制器名,为啦查找插件的模板
		$conName = request()->controller();
		request()->controller($this->addonName);
		$content = parent::fetch($template, $vars, $replace, $config, $renderContent);
		//替换静态资源文件
		$js      = \assets\Assets::getInstance()->getSource('js');
		$css     = \assets\Assets::getInstance()->getSource('css');
		$content = str_replace(['{__ASSETS_CSS__}', '{__ASSETS_JS__}'], [$css, $js], $content);
		//去空白行
		$content = preg_replace('/<\!\-\-(.*?)\-\->/i', '', $content);
		$content = preg_replace(['/\n\s*\r/'], '', $content);
		request()->controller($conName);
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
	public function getParam($key = '') {
		$name = get_class($this);
		$name = explode('\\', $name);
		$name = strtolower($name[count($name) - 1]);
		$name = str_replace('admin', '', $name);
		$conf = \think\Db::name('Addon')->field('param')->where(['name' => $name])->find()['param'];
		if (!$conf) {
			return null;
		}
		$conf = json_decode($conf, true);
		if ($key && isset($conf[$key])) {
			return $conf[$key];
		} else {
			return $conf;
		}
	}
	//必须实现安装
	public function install() {
		return true;
	}

	//必须卸载插件方法
	public function unInstall() {
		return true;
	}
	protected function saveParam() {
		// $name = input('param.name', '');
		$data = input('param.');
		if (!isset($data['name'])) {
			$this->error('name不能为空');
		}
		$result = \think\Db::name('Addon')->where('name', $data['name'])->update(['param' => json_encode($data), 'update_time' => time()]);
		$result ? $this->success('保存成功') : $this->error('保存失败');
	}
	//必须插件后台菜单设置
	public function set() {
		echo '此插件没有配置项';
	}
	// /**
	//  * 分页类
	//  * @param  array  $conf [description]
	//  * @return [type]       [description]
	//  */
	// protected function pages($conf = []) {
	// 	$join   = isset($conf['join']) ? $conf['join'] : [];
	// 	$table  = isset($conf['table']) ? $conf['table'] : $this->error('数据表不能为空!');
	// 	$table1 = strtolower(preg_replace('/([A-Z].*?)/', '_$1', lcfirst($table)));
	// 	$whe    = isset($conf['where']) ? $conf['where'] : [];
	// 	$field  = isset($conf['field']) ? $conf['field'] : '*';
	// 	// $default_order = strtolower($table1 . '_id') . ' desc';
	// 	$order = isset($conf['order']) ? $conf['order'] : '';
	// 	$rows  = isset($conf['rows']) ? $conf['rows'] : config('list_rows');
	// 	$url   = isset($conf['url']) ? $conf['url'] : '';
	// 	$pobj  = \think\Db::name(ucfirst($table))->alias('a');
	// 	$join && ($pobj = $pobj->join($join));
	// 	// //循环where
	// 	// if ($whe) {
	// 	// 	foreach ($whe as $key => $value) {
	// 	// 		$pobj = call_user_func_array([$pobj, 'where'], $value);
	// 	// 	}
	// 	// }
	// 	$list = $pobj
	// 		->where($whe)
	// 		->field($field)
	// 		->order($order)
	// 		// ->fetchSql()
	// 		->paginate($rows);
	// 	// echo $list;
	// 	// 获取分页显示
	// 	$page = $list->render();
	// 	$this->assign('_list', $list);
	// 	$this->assign('_page', $page);
	// 	return [$list, $page];
	// }
	// protected function ajaxReturn($data, $type = 'JSON', $json_option = 0) {
	// 	switch (strtoupper($type)) {
	// 	case 'JSON':
	// 		// 返回JSON数据格式到客户端 包含状态信息
	// 		header('Content-Type:application/json; charset=utf-8');
	// 		exit(json_encode($data, $json_option));
	// 	case 'XML':
	// 		// 返回xml格式数据
	// 		header('Content-Type:text/xml; charset=utf-8');
	// 		exit(xml_encode($data));
	// 	case 'JSONP':
	// 		// 返回JSON数据格式到客户端 包含状态信息
	// 		header('Content-Type:application/json; charset=utf-8');
	// 		$handler = isset($_GET['callback']) ? $_GET['callback'] : 'callback';
	// 		exit($handler . '(' . json_encode($data, $json_option) . ');');
	// 	case 'EVAL':
	// 		// 返回可执行的js脚本
	// 		header('Content-Type:text/html; charset=utf-8');
	// 		exit($data);
	// 	default:
	// 		// 用于扩展其他返回格式数据
	// 		// Hook::listen('ajax_return', $data);
	// 	}
	// }
	// /**
	//  * 验证码
	//  * @return [type] [description]
	//  */
	// public function verify() {
	// 	$conf = array(
	// 		'imageH'   => 50,
	// 		'imageW'   => 200,
	// 		'fontSize' => 20,
	// 		'bg'       => array(255, 255, 255),
	// 		'useNoise' => false, // 是否添加杂点
	// 		'length'   => 4,
	// 	);
	// 	$v = new \verify\Verify($conf);
	// 	$v->entry(1);
	// }
}
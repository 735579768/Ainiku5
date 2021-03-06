<?php
namespace app\common\controller;
use think\Controller;

class Base extends Controller {
	use \app\common\traits\controller\Common;
	// /**
	//  * 模块共用空操作方法
	//  * @param  [type] $name [description]
	//  * @return [type]       [description]
	//  */
	// public function _empty($name) {
	// 	// die('404');
	// 	if (config('app_debug')) {
	// 		throw new \think\Exception('没有此方法:' . $name, 100006);
	// 	} else {
	// 		return $this->fetch(APP_PATH . 'common/view/404.html');
	// 	}

	// }
	/**
	 * 初始化配置项
	 * @return [type] [description]
	 */
	public function _initialize() {
		parent::_initialize();
		//初始化系统配置
		config(get_sys_config());
		//黑名单
		$denied_domain = explode(',', config('denied_domain'));
		$laiip         = get_client_ip();
		// dump($_SERVER);
		$referdomain = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
		if (in_array($laiip, $denied_domain) || ($referdomain && in_array($referdomain, $denied_domain))) {
			throw new \think\exception\HttpException(403, 'Access denied!');
		}
		// dump(config());
		//加上模板主题的支持
		$theme  = 'default';
		$module = request()->module();
		if ($module == 'admin') {
			$theme = config('admin_theme');
		} else {
			$theme = config('index_theme');
		}
		$theme || ($theme = 'default');
		$tpl_path = APP_PATH . $module . '/view/';
		$this->view->config('view_path', $tpl_path . $theme . DS);
		//替换模板中的字符串
		$replace_str = [
			'__STATIC__' => STATIC_DIR . '/static',
			'__IMG__'    => STATIC_DIR . '/' . $module . '/' . $theme . '/images',
			'__CSS__'    => STATIC_DIR . '/' . $module . '/' . $theme . '/css',
			'__JS__'     => STATIC_DIR . '/' . $module . '/' . $theme . '/js',
		];
		$this->view->config('tpl_replace_string', $replace_str);
		config('view_replace_str', $replace_str);
		// dump(session('uinfo'));
		// die();
		$uid = is_login();
		if ($uid) {
			$uinfo = \think\Db::name('User')->find($uid);
			$uinfo = array_merge(session('uinfo'), $uinfo);
			defined('UID') or define('UID', $uid);
			session('uinfo', $uinfo);
			$this->assign('uinfo', $uinfo);
		}
		// dump(config('view_replace_str'));
		// dump(config(''));
		// $map = [
		// 	'think\Log'      => LIB_PATH . 'think\Log.php',
		// 	'org\util\array' => LIB_PATH . 'org\util\Array.php',
		// ];
		// Loader::addClassMap($map);
	}
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
	// // /**
	// //  * 解析和获取模板内容 用于输出
	// //  * @param string    $template 模板文件名或者内容
	// //  * @param array     $vars     模板输出变量
	// //  * @param array     $replace 替换内容
	// //  * @param array     $config     模板参数
	// //  * @param bool      $renderContent     是否渲染内容
	// //  * @return string
	// //  * @throws Exception
	// //  */
	// // public function fetch($template = '', $vars = [], $replace = [], $config = [], $renderContent = false) {
	// // 	$content = parent::fetch($template, $vars, $replace, $config, $renderContent);
	// // 	//替换静态资源文件
	// // 	$js      = \ank\Assets::getInstance()->getSource('js');
	// // 	$css     = \ank\Assets::getInstance()->getSource('css');
	// // 	$content = str_replace(['{__ASSETS_CSS__}', '{__ASSETS_JS__}'], [$css, $js], $content);
	// // 	//去空白行
	// // 	$content = preg_replace(['/\n\s*\r/'], '', $content);
	// // 	echo $content;
	// // }
	// /**
	//  * 重载error返回函数
	//  * @param  string  $msg    [description]
	//  * @param  string  $url    [description]
	//  * @param  string  $data   [description]
	//  * @param  integer $wait   [description]
	//  * @param  array   $header [description]
	//  * @return [type]          [description]
	//  */
	// protected function error($msg = '', $url = null, $data = '', $wait = 3, array $header = []) {
	// 	return parent::error($msg, $url, $data, $wait, $header);
	// }
	// /**
	//  * 分页类
	//  * @param  array  $conf [description]
	//  * @return [type]       [description]
	//  */
	// protected function pages($conf = []) {
	// 	$join          = isset($conf['join']) ? $conf['join'] : [];
	// 	$table         = isset($conf['table']) ? $conf['table'] : $this->error('数据表不能为空!');
	// 	$table1        = strtolower(preg_replace('/([A-Z].*?)/', '_$1', lcfirst($table)));
	// 	$whe           = isset($conf['where']) ? $conf['where'] : [];
	// 	$field         = isset($conf['field']) ? $conf['field'] : '*';
	// 	$default_order = strtolower($table1 . '_id') . ' desc';
	// 	$order         = isset($conf['order']) ? ($conf['order'] . ',' . $default_order) : $default_order;
	// 	$rows          = isset($conf['rows']) ? $conf['rows'] : config('list_rows');
	// 	$url           = isset($conf['url']) ? $conf['url'] : '';
	// 	$pobj          = \think\Db::name(ucfirst($table))->alias('a');
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
	// 	return $list;
	// }
}

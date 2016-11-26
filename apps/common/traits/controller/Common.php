<?php
namespace app\common\traits\controller;
use think\Controller;

trait Common {
	/**
	 * 模块共用空操作方法
	 * @param  [type] $name [description]
	 * @return [type]       [description]
	 */
	public function _empty($name) {
		// die('404');
		if (config('app_debug')) {
			throw new \think\Exception('没有此方法:' . $name, 100006);
		} else {
			return $this->fetch(APP_PATH . 'common/view/404.html');
		}

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
		$type = strtolower($type);
		if ($type == 'json') {
			return json($data)->send();
		} else {
			return jsonp($data)->send();
		}
		exit();
	}
	/**
	 * 重载error返回函数
	 * @param  string  $msg    [description]
	 * @param  string  $url    [description]
	 * @param  string  $data   [description]
	 * @param  integer $wait   [description]
	 * @param  array   $header [description]
	 * @return [type]          [description]
	 */
	protected function error($msg = '', $url = null, $data = '', $wait = 3, array $header = []) {
		return parent::error($msg, $url, $data, $wait, $header);
	}
	/**
	 * 分页类
	 * @param  array  $conf [description]
	 * @return [type]       [description]
	 */
	protected function pages($conf = []) {
		$join   = isset($conf['join']) ? $conf['join'] : [];
		$table  = isset($conf['table']) ? $conf['table'] : $this->error('数据表不能为空!');
		$table1 = strtolower(preg_replace('/([A-Z].*?)/', '_$1', lcfirst($table)));
		$whe    = isset($conf['where']) ? $conf['where'] : [];
		$field  = isset($conf['field']) ? $conf['field'] : '*';
		// $default_order = strtolower($table1 . '_id') . ' desc';
		// $order         = isset($conf['order']) ? ($conf['order'] . ',' . $default_order) : $default_order;
		// $default_order = strtolower($table1 . '_id') . ' desc';
		$order = isset($conf['order']) ? $conf['order'] : '';

		$rows = isset($conf['rows']) ? $conf['rows'] : config('list_rows');
		$url  = isset($conf['url']) ? $conf['url'] : '';
		$pobj = \think\Db::name(ucfirst($table))->alias('a');
		$join && ($pobj = $pobj->join($join));
		// //循环where
		// if ($whe) {
		// 	foreach ($whe as $key => $value) {
		// 		$pobj = call_user_func_array([$pobj, 'where'], $value);
		// 	}
		// }
		array_shift($_GET);
		$list = $pobj
			->where($whe)
			->field($field)
			->order($order)
			// ->fetchSql()
			->paginate($rows, false, [
				'query' => $_GET,
			]);
		// echo $list;
		// 获取分页显示

		$page = $list->render();
		$list = $list->toArray();
		$list = $list['data'];

		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return [$list, $page];
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
		$content = preg_replace('/<\!\-\-(.*?)\-\->/i', '', $content);
		$content = preg_replace(['/\n\s*\r/'], '', $content);
		return $content;
	}
}

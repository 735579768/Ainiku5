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
		if (APP_DEBUG) {
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
		$list = $pobj
			->where($whe)
			->field($field)
			->order($order)
			// ->fetchSql()
			->paginate($rows);
		// echo $list;
		// 获取分页显示
		$page = $list->render();
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return [$list, $page];
	}
}

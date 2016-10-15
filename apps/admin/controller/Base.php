<?php
namespace app\admin\controller;

class Base extends \app\common\Controller\Base {
	protected $uinfo = null;
	/**
	 * 后台登录检测
	 * @return [type] [description]
	 */
	public function _initialize() {
		parent::_initialize();
		$uid = is_login();
		$uid ? (defined('UID') or define('UID', $uid)) : $this->redirect('Pub/login');
		$this->uinfo = session('uinfo');
		if ($this->uinfo['user_group_id'] == 1) {
			defined('IS_ADMIN') OR define('IS_ADMIN', true);
		} else {
			defined('IS_ADMIN') OR define('IS_ADMIN', false);
		}
		$this->_checkRule();
		$this->assign([
			'meta_title' => '首页',
			'uinfo'      => session('uinfo'),
		]);
	}
	public function returnResult($status = 1, $success = '操作成功', $fail = '操作失败') {
		if ($status) {
			$this->success($success);
		} else {
			$this->error($fail);
		}
	}
	/**
	 * 检查是否有访问权限
	 * @return [type] [description]
	 */
	private function _checkRule() {
		$au = \auth\Auth::getInstance();
		if ($au->check()) {
			return true;
		} else {
			$this->error('没有访问权限!');
		}
	}
	/**
	 * 分页类
	 * @param  array  $conf [description]
	 * @return [type]       [description]
	 */
	protected function pages($conf = []) {
		$join          = isset($conf['join']) ? $conf['join'] : [];
		$table         = isset($conf['table']) ? $conf['table'] : $thier->error('数据表不能为空!');
		$table1        = strtolower(preg_replace('/([A-Z].*?)/', '_$1', lcfirst($table)));
		$whe           = isset($conf['where']) ? $conf['where'] : [];
		$field         = isset($conf['field']) ? $conf['field'] : '*';
		$default_order = strtolower($table1 . '_id') . ' desc';
		$order         = isset($conf['order']) ? ($conf['order'] . ',' . $default_order) : $default_order;
		$rows          = isset($conf['rows']) ? $conf['rows'] : config('list_rows');
		$url           = isset($conf['url']) ? $conf['url'] : '';
		$pobj          = \think\Db::name(ucfirst($table))->alias('a');
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
	}
	/**
	 *后台模块通用改变状态
	 **/
	public function updateField() {
		$table = input('param.table');
		$id    = input('param.id');
		$field = input('param.field');
		$value = input('param.value');
		if (empty($table) || empty($id) || empty($field)) {
			$this->error('参数不能为空');
		}
		$table   = ucfirst($table);
		$na      = preg_replace('/([A-Z])/s', '_$1', lcfirst($table));
		$id_name = strtolower($na) . '_id';
		// $id_value = input('param.' . $id_name);

		$data = array(
			$field        => $value,
			'update_time' => time(),
		);
		$result = \think\Db::name($table)
			->where($id_name, $id)
			->update($data);
		$result ? $this->success('操作成功') : $this->error('操作失败');
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
		$au      = \auth\Auth::getInstance();
		echo $au->replaceUrl($content);
		// echo $content;
	}
}

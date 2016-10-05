<?php
namespace app\admin\controller;

class Base extends \app\common\Controller\Base {
	/**
	 * 后台登录检测
	 * @return [type] [description]
	 */
	public function _initialize() {
		parent::_initialize();
		$uid = is_login();
		$uid ? (defined('UID') or define('UID', $uid)) : $this->redirect('Pub/login');
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
	 * 分页类
	 * @param  array  $conf [description]
	 * @return [type]       [description]
	 */
	protected function pages($conf = []) {
		$whe   = isset($conf['where']) ? $conf['where'] : '';
		$join  = isset($conf['join']) ? $conf['join'] : '';
		$field = isset($conf['field']) ? $conf['field'] : '';
		$order = isset($conf['order']) ? $conf['order'] : '';
		$rows  = isset($conf['rows']) ? $conf['rows'] : 15;
		$url   = isset($conf['url']) ? $conf['url'] : '';
		$User  = preg_match('/[a-zA-Z0-9]+View/', $model) ? D($model) : M($model);
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('Form')->where('status', 1)->paginate(10);
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
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
}

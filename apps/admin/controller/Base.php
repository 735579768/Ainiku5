<?php
namespace app\admin\controller;

class Base extends \app\common\Controller\Base {
	/**
	 * 后台登录检测
	 * @return [type] [description]
	 */
	public function _initialize() {
		$this->assign('meta_title', '首页');
		$uid = is_login();
		$uid ? define('UID', $uid) : $this->redirect('Pub/login');
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
}

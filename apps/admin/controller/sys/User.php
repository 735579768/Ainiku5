<?php
namespace app\admin\controller\sys;
use \think\Db;

class User extends Base {

	/**
	 * 用户列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '用户列表');
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('User')->where('status', 'gt', -1)->paginate(config('list_rows'));
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
	}
	/**
	 * 添加用户信息
	 */
	public function add() {
		$this->assign([
			'meta_title' => '添加用户',
			'formstr'    => chuli_form('User'),
		]);
		return $this->fetch('logic/form_edit_tpl');
	}
	/**
	 * 编辑用户
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign([
			'meta_title' => '编辑用户',
			'formstr'    => chuli_form('User', true),
		]);
		return $this->fetch('logic/form_edit_tpl');
	}
	/**
	 * 删除用户
	 * @return [type] [description]
	 */
	public function del() {

	}
	public function recycle() {
		$this->assign('meta_title', '用户回收站');
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('User')->where('status', -1)->paginate(config('list_rows'));
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
		return $this->fetch();
	}
	/**
	 * 更新用户密码
	 * @return [type] [description]
	 */
	public function updatePwd() {
		$user_id = input('param.user_id');
		controller('User', 'logic')->updatePwd($user_id);
	}
}

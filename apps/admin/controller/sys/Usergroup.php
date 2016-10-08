<?php
namespace app\admin\controller\sys;
use \think\Db;

class Usergroup extends Base {
	/**
	 * 用户组列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '用户组列表');
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('UserGroup')->where('status', 1)->paginate(config('list_rows'));
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
	}
	/**
	 * 添加用户组
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign([
			'meta_title' => '添加用户组',
			'formstr'    => chuli_form('UserGroup'),
		]);
		return $this->fetch('logic/form_edit_tpl');

	}
	/**
	 * 编辑用户组
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign([
			'meta_title' => '编辑用户组',
			'formstr'    => chuli_form('UserGroup', true),
		]);
		return $this->fetch('logic/form_edit_tpl');
	}
	/**
	 * 删除用户组
	 * @return [type] [description]
	 */
	public function del() {

	}
}

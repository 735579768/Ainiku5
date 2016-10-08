<?php
namespace app\admin\logic;
use think\Controller;

class Usergroup extends Controller {
	// /**
	//  * 添加用户组
	//  * @return [type] [description]
	//  */
	// public function add() {
	// 	$this->assign([
	// 		'meta_title' => '添加用户组',
	// 		'formstr'    => chuli_form('UserGroup'),
	// 	]);
	// 	return $this->fetch('logic/form_edit_tpl');

	// }
	// /**
	//  * 编辑用户组
	//  * @return [type] [description]
	//  */
	// public function edit() {
	// 	$this->assign([
	// 		'meta_title' => '编辑用户组',
	// 		'formstr'    => chuli_form('UserGroup', true),
	// 	]);
	// 	return $this->fetch('logic/form_edit_tpl');
	// }
	/**
	 * 删除用户组
	 * @return [type] [description]
	 */
	public function delete() {
		$user_group_id = input('param.user_group_id');
		$user_group_id || $this->error('用户组id不能为空!');
		$list = \think\Db::name('UserGroup')
			->where('user_group_id', $user_group_id)
			->find();
		$list && $this->error('此用户组下还有用户,故不能删除!');
		controller('Data', 'logic')->delete('UserGroup', $user_group_id);
	}
}

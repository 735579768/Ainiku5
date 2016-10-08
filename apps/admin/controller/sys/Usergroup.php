<?php
namespace app\admin\controller\sys;

class Usergroup extends Base {
	/**
	 * 用户组列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '用户组列表');
		$this->pages([
			'table' => 'UserGroup',
			'where' => ['a.status' => ['gt', -1]],
			'field' => 'user_group_id,title,status',
		]);
		return $this->fetch();
	}
	/**
	 * 添加用户组
	 * @return [type] [description]
	 */
	public function add() {
		// return controller('Usergroup', 'logic')->add();
		return controller('Data', 'logic')->add('UserGroup');

	}
	/**
	 * 编辑用户组
	 * @return [type] [description]
	 */
	public function edit() {
		// return controller('Usergroup', 'logic')->edit();
		return controller('Data', 'logic')->edit('UserGroup');
	}
	/**
	 * 删除用户组
	 * @return [type] [description]
	 */
	public function delete() {
		return controller('Usergroup', 'logic')->delete();
	}
}

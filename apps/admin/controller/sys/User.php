<?php
namespace app\admin\controller\sys;

class User extends Base {

	/**
	 * 用户列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '用户列表');
		$this->pages([
			'table' => 'User',
			'where' => ['a.status' => ['gt', -1]],
			'join'  => [
				['user_group b', 'a.user_group_id=b.user_group_id'],
			],
			'field' => 'a.*,b.title',
		]);
		return $this->fetch();
	}
	/**
	 * 用户回收站
	 * @return [type] [description]
	 */
	public function recycle() {
		$this->assign('meta_title', '用户回收站');
		$this->pages([
			'table' => 'User',
			'where' => ['a.status' => -1],
			'join'  => [
				['user_group b', 'a.user_group_id=b.user_group_id'],
			],
			'field' => 'a.*,b.title',
		]);
		return $this->fetch();
	}
	/**
	 * 添加用户信息
	 */
	public function add() {
		return controller('Data', 'logic')->add('User');
	}
	/**
	 * 编辑用户
	 * @return [type] [description]
	 */
	public function edit() {
		return controller('Data', 'logic')->edit('User');
	}
	/**
	 * 移动用户到回收站
	 * @return [type] [description]
	 */
	public function del() {
		return controller('User', 'logic')->del();
	}
	/**
	 * 彻底删除用户
	 * @return [type] [description]
	 */
	public function delete() {
		return controller('Data', 'logic')->delete('User');
	}

	/**
	 * 更新用户密码
	 * @return [type] [description]
	 */
	public function updatePwd() {
		controller('User', 'logic')->updatePwd();
	}
}

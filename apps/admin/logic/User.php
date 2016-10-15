<?php
namespace app\admin\logic;
use think\Controller;

class User extends Controller {

	// /**
	//  * 移动用户到回收站
	//  * @param  integer $user_id [description]
	//  * @return [type]           [description]
	//  */
	// public function del($user_id = 0) {
	// 	$user_id || ($user_id = input('param.user_id', 0));
	// 	$user_id || $this->error('用户id不能为空');
	// 	($user_id == 1) && $this->error('超级管理员不能删除1');
	// 	$result = \think\Db::name('User')
	// 		->where('user_id', 'in', $user_id)
	// 		->isUpdate(true)
	// 		->save(['status' => -1]);
	// 	if ($result) {
	// 		$this->success('成功移动到回收站');
	// 	} else {
	// 		$this->error('操作失败');
	// 	}
	// }

	/**
	 * 更新指定用户id的密码
	 * @param  integer $user_id 用户id
	 * @return [type]           [description]
	 */
	public function updatePwd($user_id = 0) {
		$user_id || ($user_id = input('param.user_id', 0));
		$user_id || $this->error('请输入用户id');
		if (request()->isPost()) {
			$password   = input('post.password');
			$repassword = input('post.repassword');
			if (empty($password)) {
				$this->error('密码不能为空!');
			}
			if ($password != $repassword) {
				$this->error('两次输入的密码不一样!');
			}
			$result = $this->validate(input('post.'), 'User.updatepwd');
			if (true === $result) {
				// $password = ank_ucenter_md5($password);
				$result = model('User')
					->allowField(true)
					->isUpdate(true)
					->save(['password' => $password], ['user_id' => $user_id]);
				if ($result) {
					// controller('sys.other')->loginOut();
					// session(null, config('session.prefix'));
					// cookie(null, config('cookie.prefix'));
					$this->success('密码更新成功!');
				} else {
					$this->error('密码修改失败');
				}
			} else {
				$this->error($result);
			}
		} else {
			$user = \think\Db::name('User')
				->field('username,user_group_id')
				->find($user_id);
			$usergroup = \think\Db::name('UserGroup')
				->field('title')
				->find($user['user_group_id']);
			$this->assign([
				'meta_title'       => '修改密码',
				'username'         => $user['username'],
				'user_group_title' => $usergroup['title'],
				'user_id'          => $user_id,
				'formarr'          => [
					[
						'title'      => '新密码',
						'name'       => 'password',
						'type'       => 'password',
						'note'       => '', //对标题的说明性文字
						'extra'      => [],
						'value'      => '',
						'is_show'    => 3,
						'is_require' => 1, //是否必填
					],
					[
						'title'      => '再次输入密码',
						'name'       => 'repassword',
						'type'       => 'password',
						'note'       => '', //对标题的说明性文字
						'extra'      => [],
						'value'      => '',
						'is_show'    => 3,
						'is_require' => 1, //是否必填
					],
				],
			]);
			$this->success('ok', '', $this->fetch());
		}

	}
}

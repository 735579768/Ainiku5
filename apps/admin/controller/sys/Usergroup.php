<?php
namespace app\admin\controller\sys;

class Usergroup extends Base {
	/**
	 * 权限设置
	 * @return [type] [description]
	 */
	public function authset() {
		$user_group_id = input('param.user_group_id', 0);
		$user_group_id || $this->error('id不能为空');
		if ($this->request->isPost()) {
			$auth_rule = implode(',', input('param.auth_rule_id/a', []));
			// $auth_rule = implode(',', $_POST['auth_rule_id']);
			$result = \think\Db::name('UserGroup')
				->where('user_group_id', $user_group_id)
				->update([
					'update_time' => time(),
					'auth_rule'   => $auth_rule,
				]);
			if ($result) {
				add_user_log("更新用户组权限", input('param.'));
				$this->success('设置成功');
			} else {
				$this->error('设置失败');
			}
		} else {
			$map['status'] = 1;
			$map['pid']    = 0;
			$list          = \think\Db::name('AuthRule')
				->where($map)
				->field('auth_rule_id,title,name,note')
				->order('sort asc,auth_rule_id asc')
				->select();
			foreach ($list as $key => $value) {
				$map['pid'] = $value['auth_rule_id'];
				$list2      = \think\Db::name('AuthRule')
					->where($map)
					->field('auth_rule_id,title,name,note')
					->order('sort asc,auth_rule_id asc')
					->select();
				$list[$key]['child'] = $list2;
			}
			//设置默认值
			$value = \think\Db::name('UserGroup')->field('auth_rule')->where(['user_group_id' => $user_group_id])->find();
			$this->assign([
				'meta_title'    => '用户组权限设置',
				'_list'         => $list,
				'user_group_id' => $user_group_id,
				'value'         => $value['auth_rule'],
			]);
			return $this->fetch();
		}
	}
	/**
	 * 用户组列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '用户组列表');
		$this->pages([
			'table' => 'UserGroup',
			'where' => ['a.status' => ['gt', -1]],
			'field' => 'user_group_id,title,status,sort',
			'order' => 'sort asc,user_group_id asc',
		]);
		return $this->fetch();
	}
	/**
	 * 添加用户组
	 * @return [type] [description]
	 */
	public function add() {
		return controller('Data', 'logic')->add('UserGroup');

	}
	/**
	 * 编辑用户组
	 * @return [type] [description]
	 */
	public function edit() {
		return controller('Data', 'logic')->edit('UserGroup');
	}
	/**
	 * 删除用户组
	 * @return [type] [description]
	 */
	public function delete() {
		$user_group_id = input('param.user_group_id');
		$user_group_id || $this->error('用户组id不能为空!');
		($user_group_id == 1) && $this->error('管理员组不能删除!');
		$list = \think\Db::name('UserGroup')
			->where('user_group_id', $user_group_id)
			->find();
		$list && $this->error('此用户组下还有用户,故不能删除!');
		controller('Data', 'logic')->delete('UserGroup', $user_group_id);
	}
}

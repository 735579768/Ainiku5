<?php
namespace app\admin\controller;
use think\Db;

class Pub extends \app\common\Controller\Base {
	public function index() {
		// var_dump(config(''));
		return $this->fetch();
	}
	/**
	 * 用户登陆
	 * @return [type] [description]
	 */
	public function login($autologin = false) {
		if (request()->isPost()) {
			$verify   = input('post.verify');
			$username = input('post.username');
			$password = input('post.password');
			// 检测验证码
			if (!check_verify($verify) && !$autologin) {
				$this->error('验证码输入错误！');
			}
			//自动判断用户名是哪个字段的
			$map['username']      = $username;
			$map['password']      = ank_ucenter_md5($password);
			$map['status']        = 1;
			$map['is_adminlogin'] = 1;

			$user = Db::view('User', '*')
				->view('UserGroup', 'user_group_id,title,auth,admin_index,denied,status,is_adminlogin', 'UserGroup.user_group_id=User.user_id')
				->where($map)->find();
			if (empty($user)) {
				//登录失败
				cookie('__uid__', null);
				return $autologin ? false : $this->error('用户名或密码错误!');
			} else {
				//登陆成功
				//登陆成功
				/* 记录登录SESSION和COOKIES */
				$auth = array(
					'uid'             => $user['user_id'],
					'username'        => $user['username'],
					'last_login_time' => $user['update_time'],
				);
				session('user_auth', $auth);
				session('uinfo', $user);
				session('user_auth_sign', data_auth_sign($auth));
				$this->success('登录成功', 'Index/index');
			}
		} else {
			if (is_login()) {
				$this->redirect('Index/index');
			} else {
				return $this->fetch();
			}

		}

	}
	/**
	 * 退出登录
	 * @return [type] [description]
	 */
	public function loginOut() {
		$this->redirect('Pub/login');
	}
}

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
	public function login($username = '', $password = '', $isauto = false) {
		if (request()->isPost() || $isauto) {
			$verify = input('post.verify');
			$username || ($username = input('post.username'));
			$password || ($password = input('post.password'));
			$remember = input('post.remember', 1);
			// 检测验证码
			if (!check_verify($verify) && !$isauto) {
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
				return $isauto ? false : $this->error('用户名或密码错误!');
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

				//把用户密码加密保存到cookie中
				if (!$isauto) {

					//如果有验证码的话就再次设置记录时间cookie
					$b = 0;
					switch ($remember) {
					case 1:$b = 24 * 3600;
						break;
					case 2:$b = 24 * 3600 * 7;
						break;
					case 3:$b = 24 * 3600 * 30;
						break;
					default:$b = -1;
					}
					$u['u'] = $username;
					$u['p'] = $password;
					cookie('token', ank_encrypt(json_encode($u)), $b);
				}
				// $this->success('登录成功', url('Index/index'));
				// $uri = $user['admin_index'] ? $user['admin_index'] : 'Index/index';
				$uri = 'index/index';
				return $isauto ? $user['user_id'] : ($this->success('登录成功！', url($uri)));
			}
		} else {
			if (is_login() || $this->autoLogin()) {
				$user = session('uinfo');
				// $uri  = $user['admin_index'] ? $user['admin_index'] : 'Index/index';
				$uri = 'index/index';
				$this->redirect(url($uri));
				// $this->redirect('Index/index');
			} else {
				return $this->fetch();
			}

		}

	}
	public function autoLogin() {
		$u = ank_decrypt(cookie('token'));
		// var_dump($u);
		// die();
		if ($u) {
			$u = json_decode($u, true);
			return $this->login($u['u'], $u['p'], true);
		}
	}
}

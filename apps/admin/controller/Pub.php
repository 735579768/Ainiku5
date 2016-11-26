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
		//是否已经进行啦验证码验证,不能同时进行两次验证码验证
		static $is_verify = false;
		if ($this->request->isPost() || $isauto) {
			$verify = input('post.verify');
			$username || ($username = input('post.username'));
			$password || ($password = input('post.password'));
			$remember = input('post.remember', 1);
			$username || $this->error('请输入用户名!');
			$password || $this->error('请输入密码!');

			$login_error = session('login_error');
			if ($login_error == '') {
				$login_error = 0;
				session('login_error', 0);
			}

			//会话中错误次数大于3就验证,这种方法只能防止用户企图从浏览器暴力登陆时出错
			if ($login_error > 3) {
				$is_verify = true;
				// 检测验证码
				if (!check_verify($verify) && !$isauto) {
					$this->error('验证码输入错误！<script>$(\'#verify-wrap,#verify-image\').show();</script>');
				}
			}

			$map1['username'] = $username;
			$map1['status']   = 1;
			// $map['is_adminlogin'] = 1;
			$us = \think\Db::name('User')->field('password,login,login_error,error_msg')->where($map1)->find();
			if ($us) {
				//从数据库中错误次数进行验证,可以防止用户企图用工具类软件暴力破解
				if (!$is_verify && intval($us['login_error']) > 3) {
					// 检测验证码
					if (!check_verify($verify) && !$isauto) {
						$this->error('验证码输入错误！<script>$(\'#verify-wrap,#verify-image\').show();</script>');
					}
				}
			} else {
				//用户名和密码全错误的情况 记录错误次数
				session('login_error', ++$login_error);
				\think\Db::name('User')->where($map1)->update([
					'login_error' => $login_error,
					'error_msg'   => '用户名和密码全错误',
					'update_time' => time(),
				]);
				return $isauto ? false : $this->error('用户名或密码错误!');
			}

			//验证密码是否正确
			if ($us['password'] == ank_ucenter_md5($password)) {
				//登陆成功
				$map['username'] = $username;
				// $map['password']      = ank_ucenter_md5($password);
				$map['status']        = 1;
				$map['is_adminlogin'] = 1;

				$user = Db::view('User', '*')
					->view('UserGroup', 'user_group_id,title,auth_rule,admin_index,denied,status,is_adminlogin', 'UserGroup.user_group_id=User.user_id')
					->where($map)->find();
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
					case 1:$b = 1 * 3600;
						break;
					case 2:$b = 24 * 3600;
						break;
					case 3:$b = 24 * 3600 * 7;
						break;
					case 4:$b = 24 * 3600 * 30;
						break;
					default:$b = -1;
					}
					$u['u'] = $username;
					$u['p'] = $password;
					cookie('token', ank_encrypt(json_encode($u)), $b);
				}
				//清空错误次数
				session('login_error', 0);
				\think\Db::name('User')->where($map1)->update([
					'login'         => ++$us['login'],
					'last_login_ip' => get_client_ip(),
					'login_error'   => 0,
					'error_msg'     => '登陆成功',
					'update_time'   => time(),
				]);
				$uri = url('index/index');
				return $isauto ? $user['user_id'] : ($this->success('登录成功！', $uri));
			} else {
				//登录失败
				cookie('__uid__', null);
				//记录错误次数
				session('login_error', ++$login_error);
				\think\Db::name('User')->where($map1)->update([
					'login_error' => $login_error,
					'error_msg'   => '用户密码错误',
					'update_time' => time(),
				]);
				return $isauto ? false : $this->error('用户名或密码错误!');

			}
		} else {
			if (is_login() || $this->autoLogin()) {
				$user = session('uinfo');
				$uri  = url('index/index');
				$this->redirect($uri);
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

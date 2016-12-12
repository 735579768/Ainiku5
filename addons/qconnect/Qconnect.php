<?php
namespace addons\qconnect;

/**
 * 除啦后台默认访问类
 */
class Qconnect extends \app\common\controller\Addon {
	public function index() {
		echo $this->fetch('home_index');
	}
	public function __construct() {
		parent::__construct();
		$data    = $this->getParam();
		$callurl = $data['callback'] . url('qconnect/qcallfunc');
		define('Q_APPID', $data['appid']);
		define('Q_APPKEY', $data['appkey']);
		define('Q_CALLBACK', $callurl);
	}
	public function qcon() {
		include __DIR__ . '/api/qqlogin.php';
	}
	//登陆回调地址
	function qcallfunc() {
		// $data = $this->getParam();
		// define('Q_CALLBACK', $data['callback'] . url('qconnect/qcallfunc'));
		include __DIR__ . '/api/qqcallfunc.php';
		if (session('openid') != '') {
			$uid = $this->QQregister(session('openid'));
			if ($uid) {
				$uid = $this->login(session('openid'), '', 5);
				if (0 < $uid) {
					//UC登录成功
					//redirect(U('/'));
					$data = json_encode(session('uinfo'));
					echo '<script>window.opener.qqlogin.success(' . $data . ');window.close();</script>';
					die();
				}
			} else {
				die('error');
			}

		} else {
			die('error');
		}
	}
	public function QQregister($openid) {
		$uinfo                 = session('uinfo');
		$data['openid']        = $openid;
		$data['user_group_id'] = 2;
		//$data['account']         = create_account();
		$data['nickname'] = $uinfo['qqname'];

		$mem = \think\Db::name('User');
		$re  = $mem->field('user_id')->where("openid='$openid'")->find();
		if ($re) {
			//保存或更新qq的信息到数据库
			$mem->where(['user_id' => $re['user_id']])->update($data);

			//已经是登陆用户
			return $re['user_id'];
		} else {
			/* 添加用户 */
			$data['last_login_ip'] = get_client_ip();
			$data['account']       = $this->create_account();
			$data['username']      = $data['account'];
			//生成用户名
			$uid = $mem->insertGetId($data);
			return $uid ? $uid : 0; //0-未知错误，大于0-注册成功
		}

	}
	/**
	 *生成账号
	 **/
	function create_account() {
		while (true) {
			$num            = rand(10000000, 99999999);
			$map['account'] = $num;
			$info           = \think\Db::name('User')->where($map)->select();
			if (empty($info)) {
				return $num;
			}
		}
	}
	/**
	 * 用户登录认证
	 * @param  string  $username 用户名
	 * @param  string  $password 用户密码
	 * @param  integer $type     用户名类型 （1-用户名，2-邮箱，3-手机，4-UID）
	 * @return integer           登录成功-用户ID，登录失败-错误编号
	 */
	private function login($username, $password, $type = 1) {
		$map = array();
		switch ($type) {
		case 1:
			$map['username'] = $username;
			break;
		case 2:
			$map['email'] = $username;
			break;
		case 3:
			$map['mobile'] = $username;
			break;
		case 4:
			$map['id'] = $username;
			break;
		case 5:
			$map['openid'] = $username;
			break;
		default:
			return 0; //参数错误
		}

		/* 获取用户数据 */
		$user = \think\Db::name('User')->where($map)->find();
		if ($user && $user['status'] == '1') {
			/* 验证用户密码 */
			/* 记录登录SESSION和COOKIES */
			$auth = array(
				'uid'             => $user['user_id'],
				'username'        => $user['username'],
				'last_login_time' => $user['last_login_time'],
			);

			session('user_auth', $auth);
			session('uinfo', $user);
			session('user_auth_sign', data_auth_sign($auth));

			$this->updateLogin($user['user_id']); //更新用户登录信息
			return $user['user_id']; //登录成功，返回用户ID
		} else {
			return '用户不存在或被禁用';
		}
	}
	/**
	 * 更新用户登录信息
	 * @param  integer $uid 用户ID
	 */
	protected function updateLogin($uid) {
		$data = array(
			'last_login_time' => time(),
			'last_login_ip'   => get_client_ip(),
			'create_time'     => time(),
			'update_time'     => time(),
		);
		\think\Db::name('User')->where(['user_id' => $uid])->update($data);
	}
}
<?php
namespace ank;
use think\Db;

class Auth {
	static private $_instance = null;
	private $_nolist          = null; //不能被访问的节点
	private $uid              = null;
	private function __construct() {
		$this->uid     = UID;
		$uinfo         = session('uinfo');
		$this->_oklist = cache('okrulelist' . $uinfo['user_group_id']);
		$this->_nolist = cache('norulelist' . $uinfo['user_group_id']);
		if (empty($this->_nolist) || config('app_debug')) {
			$uinfoauth = Db::name('UserGroup')
				->field('auth_rule')
				->find($uinfo['user_group_id']);
			$rule_idlist   = $uinfoauth['auth_rule'];
			$map['type']   = 1;
			$map['status'] = 1;
			$rule_idlist && ($map['auth_rule_id'] = ['in', $rule_idlist]);
			$this->_oklist = Db::name('AuthRule')
				->where($map)
				->field('auth_rule_id,name')
				->select();
			$rule_idlist && ($map['auth_rule_id'] = ['not in', $rule_idlist]);
			$this->_nolist = Db::name('AuthRule')
				->where($map)
				->field('auth_rule_id,name')
				->select();
			cache('okrulelist' . $uinfo['user_group_id'], $this->_oklist);
			cache('norulelist' . $uinfo['user_group_id'], $this->_nolist);
		}

	}
	/**
	 * Description:私有化克隆函数，防止外界克隆对象
	 */
	private function __clone() {
	}
	static public function getInstance() {
		if (self::$_instance === null) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	/**
	 * 验证当前用户访问地址是否在允许访问的列表
	 * @param  string $name 如果不为空就检测当前地址是否符合
	 * @return [type]       [description]
	 */
	function check($name = '') {
		if (IS_ADMIN) {
			return IS_ADMIN;
		}
		//当前请求的控制器/操作?参数
		$controller = '';
		$action     = '';
		$param      = [];
		if ($name) {
			$tem        = explode('?', $name);
			$tem1       = explode('/', $tem[0]);
			$controller = $tem1[0];
			$action     = $tem1[1];
			if (isset($tem[1])) {
				parse_str($tem[1], $param);
			}
		} else {
			// $re_url = request()->path();
			$param = request()->param();
			//删除掉第一个路径信息
			array_shift($param);
			$param = array_change_key_case($param);
			ksort($param);
			// $param      = array_keys($param);
			$controller = strtolower(request()->controller());
			$action     = strtolower(request()->action());
			// dump($re_url);
			// return true;
			// dump($controller);
			// dump($action);
			// dump($param);
		}

		//正则匹配
		foreach ($this->_oklist as $auth) {
			$contr = '';
			$act   = '';
			$par   = [];
			//解析控制器/操作?参数
			$auth  = strtolower($auth['name']);
			$auth  = explode('?', $auth);
			$tem   = explode('/', $auth[0]);
			$contr = $tem[0];
			$act   = $tem[1];
			if (count($auth) > 1) {
				parse_str($auth[1], $par);
				ksort($par);
				// $par = array_keys($par);
			}
			//取请求参数和规则中参数重复一样的部分值
			$intersect = array_intersect_assoc($param, $par);
			// dump($contr);
			// dump($act);
			// dump($par);

			if ($controller == $contr && $action == $act && $par == $intersect) {
				// echo 'success';
				// die();
				return true;
			}
		}
		return false;

	}
	//把没有权限的链接替换掉
	function replaceUrl($str = '') {
		//return $str;
		if (IS_ADMIN) {
			return $str;
		}
		$authlist = [];
		preg_match_all('/<\!\-\-authstart\-\->(.*?)<\!\-\-authend\-\->/si', $str, $authlist);
		// dump($authlist);
		$contr = request()->controller();
		if ($authlist[0]) {
			foreach ($authlist[0] as $key => $value) {
				if ($this->_nolist) {
					// dump($this->_nolist);
					// die();
					foreach ($this->_nolist as $val) {
						$pattern = '';
						$uri     = trim($val['name']);
						if (!$uri) {
							break;
						}
						// trace($val);
						// $pattern = '/';
						//把不带/的当成整个模块都不让访问
						if (strpos($uri, '/') === false) {
							$uri = url(request()->controller() . '/' . $uri);
						} else {
							$uri = url($uri);
						}

						// $uri = trim($uri, '.' . config('url_html_suffix'));
						$uri = str_replace('.' . config('url_html_suffix'), '', $uri);
						// $uri = preg_quote($uri);
						// $uri = str_replace('/', '\/', $uri);

						if (strpos($value, $uri) !== false) {
							trace($uri);
							$str = str_replace($value, '', $str);
							break;
						}
					}
				}
			}
		}
		return $str;
		// if ($this->_nolist) {
		// 	//正则替换链接
		// 	$are = '(.*?)';
		// 	$are = '((?!\<\!\-\-auth)*?)';
		// 	foreach ($this->_nolist as $val) {
		// 		$pattern = '';
		// 		$uri     = trim($val['name']);
		// 		// $pattern = '/';
		// 		//把不带/的当成整个模块都不让访问
		// 		if (strpos($uri, '/') === false) {
		// 			$uri = url($contr . '/' . $uri);
		// 		} else {
		// 			$uri = url($uri);
		// 		}
		// 		// $uri = trim($uri, '.' . config('url_html_suffix'));
		// 		$uri = str_replace('.' . config('url_html_suffix'), '', $uri);
		// 		$uri = preg_quote($uri);
		// 		$uri = str_replace('/', '\/', $uri);
		// 		$pattern .= '<\!\-\-authstart\-\->[tag]' . $uri . '[tag]<\!\-\-authend\-\->';
		// 		$pattern = str_replace('[tag]', $are, $pattern);
		// 		$pattern = '/' . $pattern . '/si';
		// 		// echo $pattern . '<br>---------';

		// 		// $str = preg_replace($pattern, '', $str);
		// 	}

		// }
		// return $str;
	}
}
?>
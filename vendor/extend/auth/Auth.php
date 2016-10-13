<?php
namespace auth;
use think\db;

class Auth {
	//private $nodelist=null;
	//private $accessnodelist=null;
	private $_nolist = null; //不能被访问的节点
	private $uid     = null;
	function __construct() {
		$this->uid     = UID;
		$uinfo         = session('uinfo');
		$this->_nolist = cache('okrulelist' . $uinfo['user_group_id']);
		if (empty($this->_nolist) || APP_DEBUG) {
			$uinfoauth     = Db::name('UserGroup')->field('auth_rule')->find($uinfo['user_group_id']);
			$node_idlist   = implode(',', json_decode($uinfoauth['auth'], true));
			$node_idlist   = empty($node_idlist) ? '*' : $node_idlist;
			$this->_nolist = Db::name('AuthRule')->where(array(
				'name'         => array('neq', ''),
				'status'       => 1,
				'auth_rule_id' => array('not in', $node_idlist),
			))->select();
			cache('okrulelist' . $uinfo['user_group_id'], $this->_nolist);
		}

	}
//检测当前地址是否在允许访问的列表
	function check() {
		$rebool = true;
		if (IS_ADMIN) {
			return $rebool;
		} else {
			//正则匹配
			$tembool = true;
			//var_dump($this->_nolist);
			foreach ($this->_nolist as $val) {
				$pattern = '';
				$url     = str_replace('.' . C('URL_HTML_SUFFIX'), '', U($val['name'] . '/ALL_ACTION'));
				$url     = str_replace('ALL_ACTION', '', $url);
				$url     = preg_quote($url);
				$url     = preg_replace('/\//i', '\/', $url);
				if ($val['is_all'] == 1) {
					$pattern = '/^' . $url . '$/i';
				} else {
					$pattern = '/(.*)' . $url . '(.*)/i';
				}
				$tembool = preg_match($pattern, __SELF__);
				// var_dump(__SELF__);
				// var_dump($pattern);
				// var_dump($tembool);
				if ($tembool) {
					$rebool = false;
					break;}
			}
			return $rebool;
		}
	}
	//把没有权限的链接替换掉
	function replaceurl($str = null) {
		//return $str;
		if (IS_ADMIN) {
			return $str;
		} else {
			if (!empty($this->_nolist)) {
				$reg_arr = [];
				//正则替换链接
				$are = '([^<|^>]*?)';
				foreach ($this->_nolist as $val) {
					$url = trim($val['name']);
					if (!empty($url)) {
						$pattern = '/';
						//把不带/的当成整个模块都不让访问
						if (strpos($url, '/') === false) {
							$url1 = U("{$url}/index");
							$url  = preg_replace('/\&a\=.*/', '', $url1);
							$url  = preg_quote($url);
							$url  = substr($url, 1);
							$pattern .= '<[tag]' . $url . '[tag]>[tag]<[tag]>';
							$pattern .= '/';
							$pattern   = str_replace('[tag]', '([^<|^>]*?)', $pattern);
							$reg_arr[] = $pattern;
							// $str       = preg_replace($pattern, '', $str);
						} else {
							$url = U($url);
							$url = str_replace(array('.' . C('URL_HTML_SUFFIX')), array(''), $url);
							$url = preg_quote($url);
							$url = str_replace('/', '\/', $url);
							//把链接按钮(带有btn的操作)替换掉
							if ($val['is_all'] == 1) {
								$pattern .= '<[tag]' . $url . '[tag]>[tag]<[tag]>';
								$pattern .= '|<([^<|^>|^\/]*?)>[tag]<[tag]' . $url . '[tag]>[tag]<\/[tag]>[tag]<\/[tag]>';
							} else {
								//$url=preg_replace('/(\?)|(\=)|(\/)|(\.)/i','\\\$1$2$3$4',$url);
								$pattern .= '<[tag]' . $url . '[tag]>[tag]<[tag]>';
								$pattern .= '|<([^<|^>|^\/]*?)>[tag]<[tag]' . $url . '[tag]>[tag]<\/[tag]>[tag]<\/[tag]>';
							}
							$pattern .= '/i';
							$pattern   = str_replace('[tag]', '([^<|^>]*?)', $pattern);
							$reg_arr[] = $pattern;
							// $str       = preg_replace($pattern, '', $str);
						}
						//echo $pattern.'--<br>';

					}
				}
				$str = preg_replace($reg_arr, '', $str);
			}
			return $str;
		}
	}
}
?>
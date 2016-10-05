<?php
namespace app\common\model;

use think\Model;

class User extends Model {
	protected $auto   = [];
	protected $insert = ['status' => 1, 'username', 'reg_ip', 'password'];
	protected $update = [];

	protected function setUsernameAttr($value) {
		return strtolower($value);
	}

	protected function setReg_ipAttr() {
		return get_client_ip();
	}

	protected function setPasswordAttr($value) {
		return ank_encrypt($value);
	}
}
<?php
namespace app\common\model;

use think\Model;

class UserLog extends Model {
	protected $auto   = ['uid', 'ip', 'address'];
	protected $insert = [];
	protected $update = [];

	protected function setUidAttr($value) {
		return $value ? $value : UID;
	}
	protected function setIpAttr($value) {
		return request()->ip();
	}
	protected function setAddressAttr($value) {
		return $value ? $value : '';
	}

}
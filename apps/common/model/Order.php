<?php
namespace app\common\model;

use think\Model;

class Order extends Model {
	public function profile() {
		return $this->hasOne('Profile');
	}
}
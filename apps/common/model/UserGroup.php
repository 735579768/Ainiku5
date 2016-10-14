<?php
namespace app\common\model;

use think\Model;

class UserGroup extends Model {
	protected $auto = [];
	//默认是后台首页index/index
	protected $insert = ['auth_rule' => '40', 'denied' => ''];
	protected $update = [];
}
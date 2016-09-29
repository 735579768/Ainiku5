<?php
namespace app\admin\controller;

class UserGroup extends Base {
	public function index() {
		// var_dump(config(''));
		return $this->fetch();
	}
}

<?php
namespace app\admin\controller\sys;

class Usergroup extends Base {
	public function index() {
		// var_dump(config(''));
		return $this->fetch();
	}
}

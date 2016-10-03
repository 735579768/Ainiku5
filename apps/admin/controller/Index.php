<?php
namespace app\admin\controller;

class Index extends Base {
	public function index() {
		// var_dump(config(''));
		config('app_trace', false);
		return $this->fetch();
	}
}

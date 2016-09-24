<?php
namespace app\admin\controller;
use think\View;

class Index {
	public function index() {
		$view = new View();
		var_dump(config(''));
		return $view->fetch();
	}
}

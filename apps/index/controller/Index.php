<?php
namespace app\index\controller;

class Index extends Base {
	public function index() {
		// config('template.view_path', 'default');
		// $this->view->config('view_path', 'default');
		// dump($this->view);
		return $this->fetch();
	}
}

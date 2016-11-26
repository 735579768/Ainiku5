<?php
namespace app\home\controller;

class Index extends Base {
	public function index($feilei = 0) {
		$map['status'] = 1;
		$map['pic']    = array('neq', '0');
		$this->pages(array(
			'table' => 'Article',
			'where' => $map,
			'rows'  => 5,
			'order' => 'article_id desc',
			'url'   => '/',
		));
		return $this->fetch();
	}
}

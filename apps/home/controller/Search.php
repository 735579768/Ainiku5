<?php
namespace app\home\controller;

class Search extends Base {
	public function index() {
		$keywords      = input('param.keywords', '');
		$map['status'] = 1;

		empty($keywords) || $map['title'] = array('like', "%{$keywords}%");
		$this->pages(array(
			'table' => 'Article',
			'where' => $map,
			'rows'  => 8,
			'order' => 'article_id desc',
			//'url'   => '/',
		));
		return $this->fetch();
	}
}

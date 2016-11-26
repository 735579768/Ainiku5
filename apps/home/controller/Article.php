<?php
namespace app\home\controller;

class Article extends Base {
	public function index($fenlei = '') {
		$info = get_category($fenlei);
		//if (empty($info)) {$this->_empty();}
		//$tpl = empty($info['list_tpl']) ? 'index' : $info['list_tpl'];
		$map['status']                      = 1;
		empty($info) || $map['category_id'] = $info['category_id'];
		$this->pages(array(
			'table' => 'Article',
			'where' => $map,
			'rows'  => 10,
			'order' => 'article_id desc',
			'url'   => '/',
		));
		$this->assign('category', $info);
		return $this->fetch();
	}
	function taglist($tagid = 0) {
		$map    = "status=1 and find_in_set('$tagid',position)";
		$order  = 'update_time desc';
		$field  = '*,article_id as id';
		$rows   = 6;
		$tagarr = get_tag_arr('article_tag');
		$this->assign('tagtitle', $tagarr[$tagid]);
		$this->pages(array(
			'table' => 'Article',
			'where' => $map,
			'order' => $order,
			'field' => $field,
			'rows'  => $rows,
		));
		return $this->fetch();
	}
	public function detail() {
		$article_id = input('param.article_id');
		if (empty($article_id)) {
			$this->error('没有此文章');
		}

		$map['status']     = 1;
		$map['article_id'] = $article_id;
		$info              = \think\Db::name('Article')->where($map)->find();
		if (empty($info)) {
			$this->error('没有此文章');
		}

		$category = get_category($info['category_id']);
		$tpl      = empty($category['detail_tpl']) ? 'detail' : $category['detail_tpl'];
		$info     = get_article($article_id);
		$this->assign('arcinfo', $info);
		$this->assign('category', $category);
		return $this->fetch($tpl);
	}
}

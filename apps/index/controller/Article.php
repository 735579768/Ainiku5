<?php
namespace app\index\controller;

class Article extends Base {
	public function index() {
		// config('template.view_path', 'default');
		// $this->view->config('view_path', 'default');
		// dump($this->view);
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

		M('Article')->where("article_id=$article_id")->setInc('views');
		$this->assign('arcinfo', $info);
		$this->assign('category', $category);
		$this->display($tpl);
		return $this->fetch();
	}
}

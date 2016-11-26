<?php
namespace app\home\widget;

class Article extends \app\home\Controller\Base {
/**
 * 取分类文章列表
 * @param  integer $category_id [description]
 * @param  integer $rows        [description]
 * @param  string  $title       [description]
 * @return [type]               [description]
 */
	function lists($category_id = 0, $rows = 10, $title = '') {
		$key  = $category_id . $rows;
		$list = cache($key);

		if (empty($list) || config('app_debug')) {
			$category = get_category($category_id);
			$map      = array();
			if (!empty($category)) {
				$map['category_id'] = $category['category_id'];
			}

			$map['status'] = 1;
			$list          = \think\Db::name('Article')->where($map)->limit($rows)->order('article_id desc')->select();
			$this->assign('_list', $list);
			$this->assign('title', $title);
			$this->assign('category', $category);
			$list = $this->fetch('Widget:lists_article');
			cache($key, $list, 600);
		}
		echo $list;
	}
	function hotlists($rows = 10) {
		$key  = 'hotarticle' . $rows;
		$list = cache($key);

		if (empty($list) || config('app_debug')) {
			$map           = array();
			$map['status'] = 1;
			$list          = \think\Db::name('Article')->where($map)->limit($rows)->order('views desc')->select();
			$this->assign('_list', $list);
			$this->assign('title', '浏览排行');
			// $this->assign('category', $category);
			$list = $this->fetch('Widget:lists_hot');
			cache($key, $list, 600);
		}
		echo $list;
	}
	function tagyun() {
		// $lists = getModelAttr('Article', 'position', 'extra');
		$tags = get_tag_arr('article_tag');
		$this->assign('_list', $tags);
		$list = $this->fetch('Widget:tagyun');
		echo $list;
	}
}

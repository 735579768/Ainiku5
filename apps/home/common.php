<?php
// dump(get_category('jiayong', 'name'));
/**
 * 取文章信息
 * @param  string $id    id
 * @param  string $field 字段
 * @return [type]
 */
function get_article($id = '', $field = '') {
	$map['article_id'] = $id;

	$info = \think\Cache::tag('article')->get('article' . $id);
	if (!$info || config('app_debug')) {
		$info = \think\Db::name('Article')->where($map)->find();
		\think\Cache::tag('article')->set('article' . $id, $info, 600);
	}
	return $field ? (isset($info[$field]) ? $info[$field] : $info) : $info;
}
/**
 * 取文章列表
 */
function get_article_list($map = [], $rows = 10) {
	$key           = md5(json_encode($map));
	$map['status'] = 1;
	$info          = \think\Cache::tag('article')->get('article' . $key);
	if (!$info || config('app_debug')) {
		$info = \think\Db::name('Article')
			->where($map)
			->field('article_id,category_id,title,content,pic,position,views,meta_title,meta_keywords,meta_descr,create_time,update_time')
			->order('article_id desc')
			->limit($rows)
			->select();
		\think\Cache::tag('article')->set('article' . $key, $info, 600);
	}
	return $info;
}
/**
 * 导航树
 * @return [type] [description]
 */
function digui_nav_tree($pid = 0) {
	empty($pid) && ($pid = 0);
	// static $sdd     = 0;
	// $navtree = [];

	$list = \think\Db::name('Nav')
		->field('nav_id,pid,title,target,url,sort')
		->where(['pid' => $pid])
		->order('sort asc,nav_id asc')
		->select();
	foreach ($list as $key => $value) {
		$list[$key]['child'] = digui_nav_tree($value['nav_id']);
	}
	return $list;
}
function get_nav_tree($pid = 0) {
	$relist = \think\Cache::get('nav_tree');
	if (!$relist || config('app_debug')) {
		$relist = digui_nav_tree($pid);
		\think\Cache::tag('nav')->set('nav_tree', $relist);
	}
	return $relist;

}
/**
 * 生成seo标题
 */
function get_seo_title($category, $single, $article) {
	$title          = config('web_meta_title');
	$category_title = '';
	$single_title   = '';
	$article_title  = '';
	if ($category) {
		if (empty($category['meta_title'])) {
			$category_title = $category['title'];
		} else {
			$category_title = $category['meta_title'];

		}
		$category_title .= '_';
	}
	if ($single) {
		if (empty($single['meta_title'])) {
			$single_title = $single['title'];
		} else {
			$single_title = $single['meta_title'];

		}
		$single_title .= '_';
	}
	if ($article) {
		if (empty($article['meta_title'])) {
			$article_title = $article['title'];
		} else {
			$article_title = $article['meta_title'];

		}
		$article_title .= '_';
	}
	return $single_title . $category_title . $article_title . $title;
}

/**
 * 生成seo关键字
 */
function get_seo_keywords($category, $single, $article) {
	$keywords          = config('web_meta_keywords');
	$category_keywords = '';
	$single_keywords   = '';
	$article_keywords  = '';
	if ($category) {
		if (empty($category['meta_keywords'])) {
			$category_keywords = $category['title'];
		} else {
			$category_keywords = $category['meta_keywords'];

		}
	}
	if ($single) {
		if (empty($single['meta_keywords'])) {
			$single_keywords = $single['title'];
		} else {
			$single_keywords = $single['meta_keywords'];

		}
	}
	if ($article) {
		if (empty($article['meta_keywords'])) {
			$article_keywords = $article['title'];
		} else {
			$article_keywords = $article['meta_keywords'];

		}
	}
	if (!empty($single_keywords) || !empty($category_keywords) || !empty($article_keywords)) {
		return $single_keywords . $category_keywords . $article_keywords;
	} else {
		return $keywords;
	}

}
/**
 * 生成seo描述
 */
function get_seo_descr($category, $single, $article) {
	$descr          = config('web_meta_descr');
	$category_descr = '';
	$single_descr   = '';
	$article_descr  = '';
	if ($category) {
		if (empty($category['meta_descr'])) {
			$category_descr = $category['meta_descr'];

		}
	}
	if ($single) {
		if (empty($single['meta_descr'])) {
			$single_descr = $single['meta_descr'];

		}
	}
	if ($article) {
		if (empty($article['meta_descr'])) {
			$article_descr = remove_html($article['content'], 0, 100);
		} else {
			$article_descr = $article['meta_descr'];

		}
	}
	if (!empty($single_descr) || !empty($category_descr) || !empty($article_descr)) {
		return $single_descr . $category_descr . $article_descr;
	} else {
		return $descr;
	}

}
function remove_html($str, $start = 0, $length, $charset = "utf-8", $suffix = true) {
	//$str=strip_tags($str);
	$str = preg_replace(array('/<.*?>/i', '/[\s|\t|\n|\r]+/i'), '', $str);
	return msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = true);
}
/**
 * 取出标签数组
 * @return [type] [description]
 */
function get_tag_arr($category_type = 'article_tag') {
	$tags = \think\Cache::get('tags');
	if (!$tags || config('app_debug')) {
		$tags                 = [];
		$map                  = [];
		$map['category_type'] = 'article_tag';
		$map['status']        = 1;
		$list                 = \think\Db::name('Category')
			->field('title,category_id')
			->where($map)
			->select();
		$tags = [];
		foreach ($list as $key => $value) {
			$tags[$value['category_id']] = $value['title'];
		}
		\think\Cache::tag('category')->set($category_type, $tags);
	}
	return $tags;
}
/**
 * 格式化文章标签
 */
function format_tag($tagid = '') {
	$tags   = get_tag_arr('article_tag');
	$tagarr = explode(',', $tagid);
	$str    = '';
	foreach ($tagarr as $key => $value) {
		if ($value != 0 && isset($tags[$value])) {
			$str .= '<a href="' . url('tag/' . $value) . '">' . $tags[$value] . '</a>';
		}
	}

	return empty($str) ? '无' : $str;
}
/**
 * 取广告位置的代码
 */
function get_module_pos_code($modulepos_id = 0) {
	// $map = array();
	// if (is_numeric($modulepos_id)) {
	// 	$map['modulepos_id'] = $modulepos_id;
	// } else {
	// 	$map['name'] = $modulepos_id;
	// }
	// $key  = 'modulepos' . $modulepos_id;
	// $code = F($key);
	// if (empty($code) || APP_DEBUG) {
	// 	$rows = M('Modulepos')->field('tplcode,name')->where($map)->find();
	// 	$code = empty($rows) ? '' : $rows['tplcode'];
	// 	F($key, $code);
	// }
	// return $code;
	return '';
}
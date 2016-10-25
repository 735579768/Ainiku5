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
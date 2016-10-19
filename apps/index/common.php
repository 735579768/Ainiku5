<?php
/**
 * 取分类信息
 * @param  string $id    id
 * @param  string $field 字段
 * @return [type]
 */
function get_category($id = '', $field = '') {
	$map = [];
	if (is_numeric($id)) {
		$map['category_id'] = $id;
	} else {
		$map['name'] = $id;
	}
	$info = \think\Cache::tag('category')->get('category' . $id);
	if (!$info || APP_DEBUG) {
		$info = \think\Db::name('Category')->where($map)->find();
		\think\Cache::tag('category')->set('category' . $id, $info);
	}
	return $field ? (isset($info[$field]) ? $info[$field] : $info) : $info;
}
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
	if (!$info || APP_DEBUG) {
		$info = \think\Db::name('Article')->where($map)->find();
		\think\Cache::tag('article')->set('article' . $id, $info, 600);
	}
	return $field ? (isset($info[$field]) ? $info[$field] : $info) : $info;
}
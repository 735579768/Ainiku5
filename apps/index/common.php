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

/*********************************************
 * 订单相关函数
 */
/**
 *取订单产品列表
 */
function get_order_detail_list($order_id = '') {
	if (empty($order_id)) {
		return '';
	}

	$cachekey = 'getOrderGoodsList' . $order_id;
	$data     = cache($cachekey);
	if (empty($data) || config('app_debug')) {
		// $data = model('OrderDetail')->where("order_id=$order_id")->select();
		$data = \think\Db::view('OrderDetail', '*')
			->view('Goods', 'title,pic', 'OrderDetail.goods_id=Goods.goods_id')
			->where(['OrderDetail.order_id' => $order_id])
			->select();
		cache($cachekey, $data);
	}
	return $data;
}
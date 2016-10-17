<?php
/**
 * 取当前下拉form
 * @return [type] [description]
 */
function select_form() {
	$list   = \think\Db::name('Form')->where('status', 1)->field('form_id,title')->select();
	$relist = cache('sys_form');
	if (APP_DEBUG || !$relist) {
		foreach ($list as $key => $value) {
			$relist[$value['form_id']] = $value['title'];
		}
		cache('sys_form', $relist);
	}
	return $relist;
}
/**
 * 菜单下拉框
 * @return [type] [description]
 */
function select_menu($pid = 0) {
	empty($pid) && ($pid = 0);
	static $sd       = 0;
	static $menutree = [0 => '顶级菜单'];
	$list            = \think\Db::name('Menu')
		->field('menu_id,pid,title,url,sort')
		->where(['pid' => $pid])
		->order('sort asc,menu_id asc')
	// ->fetchSql()
		->select();
	// echo $list;
	// die();
	foreach ($list as $key => $value) {
		$menutree[$value['menu_id']] = get_space($sd) . $value['title'];
		$sd++;
		// $relist = array_merge($relist, select_menu($value['menu_id']));
		select_menu($value['menu_id']);
		$sd--;

	}
	return $menutree;
}
/**
 * 分类下拉框
 * @return [type] [description]
 */
function select_category($pid = 0, $category_type = 'article') {
	empty($pid) && ($pid = 0);
	static $sdd      = 0;
	static $catetree = [0 => '顶级分类'];
	$category_type || ($category_type = 'article');
	$map['pid']           = $pid;
	$map['category_type'] = $category_type;
	$list                 = \think\Db::name('Category')
		->field('category_id,pid,title,sort')
		->where($map)
		->order('sort asc,category_id asc')
		->select();
	foreach ($list as $key => $value) {
		$catetree[$value['category_id']] = get_space($sdd) . $value['title'];
		$sdd++;
		select_category($value['category_id'], $category_type);
		$sdd--;

	}
	return $catetree;
}
/**
 * 权限规则下拉框
 * @return [type] [description]
 */
function select_auth_rule($pid = 0) {
	empty($pid) && ($pid = 0);
	static $sdd      = 0;
	static $ruletree = [0 => '顶级规则'];

	$list = \think\Db::name('AuthRule')
		->field('auth_rule_id,pid,sort,title')
		->where(['pid' => $pid])
		->order('sort asc,auth_rule_id asc')
		->select();

	foreach ($list as $key => $value) {
		$ruletree[$value['auth_rule_id']] = get_space($sdd) . $value['title'];
		$sdd++;
		select_auth_rule($value['auth_rule_id']);
		$sdd--;

	}

	return $ruletree;
}
/**
 * 取分类类型下拉框
 * @return [type] [description]
 */
function select_category_type() {
	return get_status('category_type', true);
}
/**
 * 取用户组下拉框
 * @return [type] [description]
 */
function select_user_group() {
	$list = \think\Db::name('UserGroup')
		->where('status', 1)
		->field('user_group_id,title')
		->select();
	$relist = cache('sys_user_group');
	if (APP_DEBUG || !$relist) {
		foreach ($list as $key => $value) {
			$relist[$value['user_group_id']] = $value['title'];
		}
		cache('sys_user_group', $relist);
	}
	return $relist;
}
// /**
//  * 取对应表单的编辑和添加表单html字符串,如果是post直接处理数据
//  * @param  string  $model 对应的数据模型
//  * @param  boolean $edit   当前操作是添加还是更新,false是添加,true更新
//  * @return [type]         返回值
//  */
// function chuli_form($model = '', $edit = false) {
// 	return controller('Data', 'logic')->addEditForm($model, $edit);
// }
//
/*
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 * @author 枫叶 <735579768@qq.com>
 */
function format_bytes($size, $delimiter = '') {
	$units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
	for ($i = 0; $size >= 1024 && $i < 5; $i++) {
		$size /= 1024;
	}

	return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 导航下拉框
 * @return [type] [description]
 */
function select_nav($pid = 0) {
	empty($pid) && ($pid = 0);
	static $sdd     = 0;
	static $navtree = [0 => '顶级导航'];

	$list = \think\Db::name('Nav')
		->field('nav_id,pid,title,sort')
		->where(['pid' => $pid])
		->order('sort asc,nav_id asc')
		->select();
	foreach ($list as $key => $value) {
		$navtree[$value['nav_id']] = get_space($sdd) . $value['title'];
		$sdd++;
		select_nav($value['nav_id']);
		$sdd--;

	}
	return $navtree;
}
/**
 * 导航下拉框
 * @return [type] [description]
 */
function select_single($pid = 0) {
	empty($pid) && ($pid = 0);
	static $sdd        = 0;
	static $singletree = [0 => '顶级单页'];

	$list = \think\Db::name('Single')
		->field('single_id,pid,title,sort')
		->where(['pid' => $pid])
		->order('sort asc,single_id asc')
		->select();
	foreach ($list as $key => $value) {
		$singletree[$value['single_id']] = get_space($sdd) . $value['title'];
		$sdd++;
		select_single($value['single_id']);
		$sdd--;

	}
	return $singletree;
}
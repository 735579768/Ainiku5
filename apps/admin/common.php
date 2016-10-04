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
	static $sd     = 0;
	$relist        = [];
	$sd || $relist = [0 => '顶级菜单'];
	$list          = \think\Db::name('Menu')
		->field('menu_id,pid,title,url,sort')
		->where(['pid' => $pid])
		->order('sort asc,menu_id asc')
		->select();
	foreach ($list as $key => $value) {
		$relist[$value['menu_id']] = get_space($sd) . $value['title'];
		$sd++;
		$relist = array_merge($relist, select_menu($value['menu_id']));
		$sd--;

	}
	return $relist;
}

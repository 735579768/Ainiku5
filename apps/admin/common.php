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
	static $sd       = 0;
	static $menutree = [];
	$relist          = [];
	$sd || $relist   = [0 => '顶级菜单'];
	$list            = \think\Db::name('Menu')
		->field('menu_id,pid,title,url,sort')
		->where(['pid' => $pid])
		->order('sort asc,menu_id asc')
		->select();
	foreach ($list as $key => $value) {
		$menutree[$value['menu_id']] = get_space($sd) . $value['title'];
		$sd++;
		// $relist = array_merge($relist, select_menu($value['menu_id']));
		select_menu($value['menu_id']);
		$sd--;

	}
	// dump($relist);
	return $menutree;
}
/**
 * 取对应表单的编辑和添加表单html字符串,如果是post直接处理数据
 * @param  string  $model 对应的数据模型
 * @param  boolean $edit   当前操作是添加还是更新,false是添加,true更新
 * @return [type]         返回值
 */
function chuli_form($model = '', $edit = false) {
	return controller('Data', 'logic')->addEditForm($model, $edit);
}
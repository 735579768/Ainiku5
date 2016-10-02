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

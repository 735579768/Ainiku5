<?php
/**
 * 取系统的状态文本
 * @param  integer $status [description]
 * @param  string  $type   [description]
 * @return [type]          [description]
 */
function get_status($status = 0, $type = 'status') {
	$arr = config('systemstatus');
	if (isset($arr[$type])) {
		return $arr[$type][$status];
	} else {
		return '--';
	}
}
/**
 * 取系统的配置信息
 * @return [type] [description]
 */
function get_sys_config() {
	$data = cache('sys_config');
	if (!$data || APP_DEBUG) {
		$info = \think\Db::name('Config')->field('value')->find(1);
		$data = json_decode($info['value'], true);
		cache('sys_config', $data);
	}
	return $data;
}
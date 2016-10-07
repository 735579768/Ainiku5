<?php
/**
 * 取系统的状态文本
 * @param  integer $status [description]
 * @param  string  $type   [description]
 * @return [type]          [description]
 */
function get_status($status = 0, $type = 'status') {
	$arr = config('systemstatus');
	//判断是不是要返回状态数组
	if (is_string($status) && is_bool($type)) {
		return $arr[$status];
	}
	//返回状态文本
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
/**
 * 回几个空白字符串
 * @param  [type] $num [description]
 * @return [type]      [description]
 */
function get_space($num) {
	$str = '';
	if ($num) {
		for ($i = 0; $i < $num; $i++) {
			$str .= '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		}
		$str .= '┗━━━';
	}
	return $str;
}
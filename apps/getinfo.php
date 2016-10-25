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
/**
 * 返回一个目录中的目录列表(只返回一级)
 * @param string $path
 */
function get_dir_list($dir) {
	$dirArray[] = null;
	if (false != ($handle = opendir($dir))) {
		$i = 0;
		while (false !== ($file = readdir($handle))) {
			//去掉"“.”、“..”以及带“.xxx”后缀的文件
			if ($file != "." && $file != ".." && !strpos($file, ".")) {
				$dirArray[$i] = $file;
				$i++;
			}
		}
		//关闭句柄
		closedir($handle);
	}
	return $dirArray;
}
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
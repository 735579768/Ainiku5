<?php
use think\Cache;
/**
 * 取当前下拉form
 * @return [type] [description]
 */
function select_form() {
	$list   = \think\Db::name('Form')->where('status', 1)->field('form_id,title')->select();
	$relist = Cache::get('form_select');
	if (APP_DEBUG || !$relist) {
		foreach ($list as $key => $value) {
			$relist[$value['form_id']] = $value['title'];
		}
		cache('sys_form', $relist);
		Cache::tag('form')->set('form_select', $relist);
	}
	return $relist;
}
/**
 * 菜单下拉框,递归调用
 * @return [type] [description]
 */
function digui_select_menu($pid = 0) {
	empty($pid) && ($pid = 0);
	static $sd       = 0;
	static $menutree = [0 => '顶级菜单'];
	$list            = \think\Db::name('Menu')
		->field('menu_id,pid,title,url,sort')
		->where(['pid' => $pid])
		->order('sort asc,menu_id asc')
		->select();
	foreach ($list as $key => $value) {
		$menutree[$value['menu_id']] = get_space($sd) . $value['title'];
		$sd++;
		// $relist = array_merge($relist, select_menu($value['menu_id']));
		digui_select_menu($value['menu_id']);
		$sd--;

	}
	return $menutree;
}

function select_menu($pid = 0) {
	$relist = Cache::get('menu_select');
	if (!$relist || APP_DEBUG) {
		$relist = digui_select_menu($pid);
		Cache::tag('menu')->set('menu_select', $relist);
	}
	return $relist;

}
/**
 * 分类下拉框
 * @return [type] [description]
 */
function digui_select_category($pid = 0, $category_type = 'article') {
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
		digui_select_category($value['category_id'], $category_type);
		$sdd--;

	}
	return $catetree;
}
function select_category($pid = 0, $category_type = 'article') {
	$relist = Cache::get('category_select');
	if (!$relist || APP_DEBUG) {
		$relist = digui_select_category($pid, $category_type);
		Cache::tag('category')->set('category_select', $relist);
	}
	return $relist;

}
/**
 * 权限规则下拉框
 * @return [type] [description]
 */
function digui_select_auth_rule($pid = 0) {
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
function select_auth_rule($pid = 0) {
	$relist = Cache::get('authrule_select');
	if (!$relist || APP_DEBUG) {
		$relist = digui_select_auth_rule($pid);
		Cache::tag('authrule')->set('authrule_select', $relist);
	}
	return $relist;

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
	$relist = Cache::get('usergroup_select');
	if (APP_DEBUG || !$relist) {
		foreach ($list as $key => $value) {
			$relist[$value['user_group_id']] = $value['title'];
		}
		Cache::tag('usergroup')->set('usergroup_select', $relist);
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
function digui_select_nav($pid = 0) {
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
function select_nav($pid = 0) {
	$relist = Cache::get('nav_select');
	if (!$relist || APP_DEBUG) {
		$relist = digui_select_nav($pid);
		Cache::tag('nav')->set('nav_select', $relist);
	}
	return $relist;

}
/**
 * 导航下拉框
 * @return [type] [description]
 */
function digui_select_single($pid = 0) {
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
function select_single($pid = 0) {
	$relist = Cache::get('single_select');
	if (!$relist || APP_DEBUG) {
		$relist = digui_select_single($pid);
		Cache::tag('single')->set('single_select', $relist);
	}
	return $relist;

}
/**
 * 添加用户日志
 * @param string $note      日志备注
 * @param array  $json_data 备忘数据
 */
function add_user_log($note = '', $json_data = []) {
	$log = model('UserLog');
	$log->data([
		'note'      => $note,
		'json_data' => json_encode($json_data),
	]);
	$log->save();
}
/**
 * 取系统模板主题列表
 * @return [type] [description]
 */
function select_theme($name = 'admin') {
	$rearr = [];
	$path  = APP_PATH . $name . '/view/';
	$list  = get_dir_list($path);
	foreach ($list as $key => $value) {
		$filepath = $path . $value . '/tpl.ini';
		if (file_exists($filepath)) {
			$con           = file_get_contents($filepath);
			$con           = json_decode($con, true);
			$rearr[$value] = $con['name'];
		} else {
			$rearr[$value] = $value;
		}
	}
	return $rearr;
}
/**此方法用来删除某个文件夹下的所有文件
 *@param string $path为文件夹的绝对路径如d:/tem/
 *@param string $delself 是否把自己也删除,默认不删除
 *@param string $delfolder 删除所有文件夹默认为true,
 *                           如果为false,则只删除所有目录中的文件
 *@返回值为 删除的文件数量(路径和大小)
 *清理缓存很实用,哈哈
 *@author qiaokeli <735579768@qq.com>  www.zhaokeli.com
 */
function del_all_file($fpath, $delself = false, $delfolder = true) {
	defined('YPATH') OR define('YPATH', $fpath);
	$files    = array();
	$filepath = iconv('gb2312', 'utf-8', $fpath);
	if (is_dir($fpath)) {
		if ($dh = opendir($fpath)) {
			while (($file = readdir($dh)) !== false) {
				if ($file != '.' && $file != '..') {
					$temarr = del_all_file($fpath . '/' . $file);
					$files  = array_merge($files, $temarr);
				}
			}
			closedir($dh);
		}
		if ($delfolder) {
			//过虑删除自己的情况
			if ($fpath === YPATH) {
				if ($delself) {
					$files[] = array('path' => $fpath, 'size' => filesize($fpath));
					@rmdir($fpath);
				}
			} else {
				$files[] = array('path' => $fpath, 'size' => filesize($fpath));
				@rmdir($fpath);
			}
		}
	} else {
		if (is_file($fpath)) {
			$files[] = array('path' => $fpath, 'size' => filesize($fpath));
			@unlink($fpath);
		}
	}
	return $files;
}
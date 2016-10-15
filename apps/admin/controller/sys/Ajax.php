<?php
namespace app\admin\controller\sys;

class Ajax extends Base {
	/**
	 * 取系统左边的菜单
	 * @param  integer $pid [description]
	 * @return [type]       [description]
	 */
	public function getLeftMenu($pid = 0) {
		// if ($pid == 1) {
		// 	$list = config('admin_custom_menu');
		// 	foreach ($list as $key => $value) {
		// 		foreach ($value as $k => $v) {
		// 			$result = \auth\Auth::getInstance()->check($v['url']);
		// 			if ($result) {
		// 				$list[$key][$k]['url'] = url($v['url']);
		// 			} else {
		// 				unset($list[$key][$k]);
		// 			}
		// 		}
		// 	}
		// 	return $this->success('ok', '', $list);
		// }
		$map['status'] = 1;

		if ($pid == 1) {
			$map['home'] = 1;
		} else {
			$map['pid'] = $pid;
		}
		$key  = 'sys_childmenu' . $pid;
		$data = \think\Cache::get($key);
		if (!$data || APP_DEBUG) {
			$data = [];
			$list = \think\Db::name('Menu')
				->field('menu_id,title,url,group')
				->where($map)
				->order('sort asc,menu_id asc')
				->select();
			foreach ($list as $key => $value) {
				$result = \auth\Auth::getInstance()->check($value['url']);
				if ($result) {
					$group = $value['group'];
					$group || ($group = '默认');
					$data[$group][] = ['title' => $value['title'], 'url' => url($value['url'])];
				}
			}
			\think\Cache::tag('childmenu')->set($key, $data);
		}
		return $this->success('ok', '', $data);
	}
}

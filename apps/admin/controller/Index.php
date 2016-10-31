<?php
namespace app\admin\controller;

class Index extends Base {
	public function index() {
		// var_dump(config(''));
		$ckey = 'sys_childmenu0';
		$list = \think\Cache::tag('menu')->get($ckey);
		if (!$list || config('app_debug')) {
			$list = \think\Db::name('Menu')
				->field('menu_id,title,url,icon_class')
				->where(['status' => 1, 'pid' => 0])
				->order('sort asc,menu_id asc')
				->select();
			\think\Cache::tag('menu')->set($ckey, $list);
		}
		$this->assign('mainmenu', $list);
		config('app_trace', false);
		return $this->fetch();
	}
}

<?php
namespace app\admin\controller\sys;

class Index extends Base {
	public function index() {
		// var_dump(config(''));
		$list = \think\Db::name('Menu')
			->field('menu_id,title,url')
			->where(['status' => 1, 'pid' => 0])
			->order('sort asc,menu_id asc')
			->select();
		$this->assign('mainmenu', $list);
		config('app_trace', false);
		return $this->fetch();
	}
}

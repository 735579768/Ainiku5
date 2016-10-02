<?php
namespace app\admin\controller;
use think\Db;

class Menu extends Base {

	/**
	 * 菜单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '菜单列表');
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('Menu')->where('status', 1)->paginate(10);
		// 获取分页显示
		$page = $list->render();
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
	}
	/**
	 * 添加菜单
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign('meta_title', '添加菜单');
		if (request()->isPost()) {
			$menu = model('Menu');
			// $result = $menu->allowField(true)->save();
			var_dump($menu->allowField(true)->fetchSql());
			$this->returnResult($result, '添加成功', '添加失败');
		} else {
			$this->assign('formitem', config('menu'));
			return $this->fetch('edit');
		}

	}
	/**
	 * 编辑菜单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign('meta_title', '编辑菜单');
		return $this->fetch('edit');
	}
	/**
	 * 删除菜单
	 * @return [type] [description]
	 */
	public function del() {

	}
}

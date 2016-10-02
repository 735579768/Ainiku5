<?php
namespace app\admin\controller;

class Menu extends Base {

	/**
	 * 菜单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '菜单列表');
		$this->assign('formitem', config('form'));
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

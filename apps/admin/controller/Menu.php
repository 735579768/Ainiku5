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
		$this->assign('formitem', config('form'));
		return $this->fetch('edit');
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

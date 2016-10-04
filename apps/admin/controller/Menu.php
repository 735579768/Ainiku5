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
		$list = Db::name('Menu')->where(['pid' => 0])->paginate(10);
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
		$this->assign([
			'meta_title' => '添加菜单',
			'formstr'    => chuli_form('Menu'),
		]);
		return $this->fetch('edit');

	}
	/**
	 * 编辑菜单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign([
			'meta_title' => '编辑菜单',
			'formstr'    => chuli_form('Menu', true),
		]);
		return $this->fetch('edit');
	}
	/**
	 * 删除菜单
	 * @return [type] [description]
	 */
	public function del() {
		//清除掉childmenu标签的数据
		\think\Cache::clear('childmenu');
	}
}

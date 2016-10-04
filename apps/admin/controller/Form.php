<?php
namespace app\admin\controller;
use think\Db;

class Form extends Base {

	/**
	 * 表单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '表单列表');
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('Form')->where('status', 1)->paginate(10);
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
	}
	/**
	 * 添加表单
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign([
			'meta_title' => '编辑表单',
			'formstr'    => chuli_form('Menu'),
		]);
		return $this->fetch('edit');
	}
	/**
	 * 编辑表单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign([
			'meta_title' => '编辑表单',
			'formstr'    => chuli_form('Menu', true),
		]);
		return $this->fetch('edit');

	}
	/**
	 * 删除表单
	 * @return [type] [description]
	 */
	public function del() {

	}
}

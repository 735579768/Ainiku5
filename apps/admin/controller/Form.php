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
		$list = Db::name('Form')->where('status', 1)->paginate(config('list_rows'));
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
			'formstr'    => chuli_form('Form'),
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
			'formstr'    => chuli_form('Form', true),
		]);
		return $this->fetch('edit');

	}
	/**
	 * 删除表单
	 * @return [type] [description]
	 */
	public function delete() {
		$form_id = input('param.form_id');
		$form_id || $this->error('id不能为空!');
		// //删除所有表单项
		// \think\Db::name('FormItem')
		// 	->where('form_id', $form_id)
		// 	->delete();
		$list = \think\Db::name('FormItem')
			->where('form_id', $form_id)
			->find();
		$list && $this->error('此表单下还有表单项,故不能删除!');
		controller('Data', 'logic')->delete('Form', $form_id);
	}
}

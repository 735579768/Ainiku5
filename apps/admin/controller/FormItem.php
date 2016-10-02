<?php
namespace app\admin\controller;

class FormItem extends Base {

	/**
	 * 表单项列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '表单项列表');
		return $this->fetch();
	}
	/**
	 * 添加表单项
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign('meta_title', '添加表单项');
		$this->assign('formitem', config('form'));
		return $this->fetch('edit');
	}
	/**
	 * 编辑表单项
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign('meta_title', '编辑表单项');
		return $this->fetch();
	}
	/**
	 * 删除表单项
	 * @return [type] [description]
	 */
	public function del() {

	}
}

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
		$form_id = input('param.form_id');
		$form_id || $this->error('表单id不能为空!');

		if (request()->isPost()) {
			$result = $this->validate(input('post.'), 'FormItem');
			if (true === $result) {
				$mod    = new \app\common\model\FormItem(input('post.'));
				$result = $mod->allowField(true)->save();
				$this->returnResult($result, '添加成功', '添加失败');
			} else {
				$this->error($result);
			}
		} else {
			$this->assign('meta_title', '添加表单项');
			$formarr = require_once './apps/formarr.php';
			// dump($formarr);
			$this->assign('formitem', $formarr['formitem']);
			$this->assign('data', null);
			return $this->fetch('edit');
		}

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

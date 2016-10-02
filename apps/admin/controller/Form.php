<?php
namespace app\admin\controller;

class Form extends Base {

	/**
	 * 表单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '表单列表');
		return $this->fetch();
	}
	/**
	 * 添加表单
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign('meta_title', '添加表单');
		if (request()->isPost()) {
			$result = $this->validate(input('post.'), 'Form');
			if (true === $result) {
				$mod    = new \app\common\model\Form($_POST);
				$result = $mod->allowField(true)->save();
				// var_dump($form->allowField(true)->fetchSql());
				$this->returnResult($result, '添加成功', '添加失败');
			} else {
				$this->error($result);
			}

		} else {
			$this->assign('formitem', config('form'));
			return $this->fetch('edit');
		}
	}
	/**
	 * 编辑表单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign('meta_title', '编辑表单');
		return $this->fetch();
	}
	/**
	 * 删除表单
	 * @return [type] [description]
	 */
	public function del() {

	}
}

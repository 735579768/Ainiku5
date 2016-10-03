<?php
namespace app\admin\controller;
use think\Db;

class FormItem extends Base {

	/**
	 * 表单项列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '表单项列表');
		$form_id = input('param.form_id');
		$form_id || $this->error('表单id不能为空!');

		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('FormItem')->where('form_id', $form_id)->paginate(10);
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
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
		if (request()->isPost()) {
			$result = $this->validate(input('post.'), 'FormItem');
			if (true === $result) {
				// $mod    = new \app\common\model\Form();
				$result = model('FormItem')->update(input('post.'));
				$this->returnResult($result, '更新成功', '更新失败');
			} else {
				$this->error($result);
			}
		} else {
			$form_item_id = input('param.form_item_id');
			$formarr      = require_once './apps/formarr.php';
			$this->assign('formitem', $formarr['formitem']);
			$this->assign('data', Db::name('FormItem')->where('form_item_id', $form_item_id)->find());
			return $this->fetch('edit');
		}
	}
	/**
	 * 删除表单项
	 * @return [type] [description]
	 */
	public function del() {

	}
}

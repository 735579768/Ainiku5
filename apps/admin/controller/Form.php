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
		$this->assign('meta_title', '添加表单');
		if (request()->isPost()) {
			$result = $this->validate(input('post.'), 'Form');
			if (true === $result) {
				$mod    = new \app\common\model\Form(input('post.'));
				$result = $mod->allowField(true)->save();
				$this->returnResult($result, '添加成功', '添加失败');
			} else {
				$this->error($result);
			}

		} else {
			$formarr = require_once './apps/formarr.php';
			$this->assign('formitem', $formarr['form']);
			$this->assign('data', null);
			return $this->fetch('edit');
		}
	}
	/**
	 * 编辑表单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign('meta_title', '编辑表单');
		if (request()->isPost()) {
			$result = $this->validate(input('post.'), 'Form');
			if (true === $result) {
				// $mod    = new \app\common\model\Form();
				$result = model('Form')->update(input('post.'));
				$this->returnResult($result, '更新成功', '更新失败');
			} else {
				$this->error($result);
			}
		} else {
			$form_id = input('param.form_id');
			$formarr = require_once './apps/formarr.php';
			$this->assign('formitem', $formarr['form']);
			$this->assign('data', Db::name('Form')->where('form_id', $form_id)->find());
			return $this->fetch('edit');
		}

	}
	/**
	 * 删除表单
	 * @return [type] [description]
	 */
	public function del() {

	}
}

<?php
namespace app\admin\logic;

class Data extends Base {
	/**
	 * 用户列表
	 * @return [type] [description]
	 */
	public function lists() {

	}
	/**
	 * 添加编辑信息
	 */
	public function addEditForm($model = null, $edit = false) {
		$model || $this->error('模型为空!');
		$model    = ucfirst($model);
		$na       = lcfirst($model);
		$na       = preg_replace('/([A-Z])/s', '_$1', $na);
		$id_name  = strtolower($na) . '_id';
		$id_value = input('param.' . $id_name);
		if ($edit && !$id_value) {
			//编辑状态下id不能为空
			$this->error('id不能为空');
		}
		if (request()->isPost()) {
			if ($id_value) {
				//编辑
				$result = $this->validate(input('post.'), $model . '.edit');
				if (true === $result) {
					$result = model($model)
						->allowField(true)
						->isUpdate(true)
						->save(input('post.'), [$id_name => $id_value]);
					$this->returnResult($result, '更新成功', '更新失败');
				} else {
					$this->error($result);
				}
			} else {
				//添加
				$result = $this->validate(input('post.'), $model);
				if (true === $result) {
					$result = model($model)
						->data(input('post.'))
						->allowField(true)
						->save();
					$this->returnResult($result, '添加成功', '添加失败');
				} else {
					$this->error($result);
				}
			}

		} else {
			$data = null;
			if ($id_name && $id_value) {
				$data = \think\Db::name($model)
					->where($id_name, $id_value)
					->find();
			}
			$this->assign('id', ['name' => $id_name, 'value' => $id_value]);
			$this->assign('model', $model);
			$this->assign('data', $data);
			return $this->fetch('logic/form_edit');
		}
	}
	/**
	 * 编辑信息
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign('meta_title', '编辑表单');
		$form_id = input('param.form_id');
		$form_id || $this->error('表单id为空!');
		if (request()->isPost()) {
			$result = $this->validate(input('post.'), 'Form.edit');
			if (true === $result) {
				$result = model('Form')
					->allowField(true)
					->isUpdate(true)
					->save(input('post.'), ['form_id' => $form_id]);
				$this->returnResult($result, '更新成功', '更新失败');
			} else {
				$this->error($result);
			}
		} else {
			// $form_id = input('param.form_id');
			$this->assign('data', Db::name('Form')->where('form_id', $form_id)->find());
			return $this->fetch('edit');
		}
	}
	/**
	 * 删除用户
	 * @return [type] [description]
	 */
	public function del() {

	}
}

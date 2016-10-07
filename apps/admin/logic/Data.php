<?php
namespace app\admin\logic;

class Data extends Base {
	/**
	 * 添加编辑信息
	 * @param string  $model 此参数代表模型(数据表)
	 * @param boolean $edit  是否是编辑数据,默认为false
	 * @return [type] 如果是get请求会返回一个表单字符串,如果是post请求,会判断是add还是edit状态,进行对应的操作
	 */
	public function addEditForm($model = '', $edit = false) {
		$model || $this->error('模型为空!');
		$model    = ucfirst($model);
		$na       = preg_replace('/([A-Z])/s', '_$1', lcfirst($model));
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
			if ($edit) {
				$data = \think\Db::name($model)
					->where($id_name, $id_value)
					->find();
			}
			// $data = null;
			// if ($id_name && $id_value) {

			// }
			$this->assign('id', ['name' => $id_name, 'value' => $id_value]);
			$this->assign('model', $model);
			$this->assign('data', $data);
			return $this->fetch('logic/form_edit');
		}
	}

	/**
	 * 删除信息
	 * @param  string $table 数据表名字
	 * @param  string $id    主键id值(可以是','分隔的字符串)
	 * @return [type]        [description]
	 */
	public function delete($table = '', $id = '') {
		$id || $this->error('id不能为空!');
		is_string($id) && ($id = explode(',', $id));
		$result = \think\Db::table(ucfirst($table))->delete($id);
		$this->returnResult($result, '删除成功', '删除失败');
	}
}

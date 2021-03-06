<?php
namespace app\admin\logic;

class Data extends Base {
	/**
	 * 添加编辑信息
	 * @param string  $model 此参数代表模型(数据表)
	 * @param boolean $edit  是否是编辑数据,默认为false
	 * @return [type] 如果是get请求会返回一个表单字符串,如果是post请求,会判断是add还是edit状态,进行对应的操作
	 */
	private function addEditForm($model = '', $edit = false) {
		$model || $this->error('表单或模型标识符不能为空!');
		$title = get_form($model, 'title');
		$this->assign([
			'meta_title' => ($edit ? '编辑' : '添加') . $title,
		]);

		$id_name  = $this->_getTable($model) . '_id';
		$id_value = input('param.' . $id_name);
		if ($edit && !$id_value) {
			//编辑状态下id不能为空
			$this->error('id不能为空');
		}
		if ($this->request->isPost()) {
			$edit ? add_user_log('编辑' . $title, input('param.')) : add_user_log('添加' . $title, input('param.'));
			\think\Cache::clear(strtolower($model));
			$postdata = input('param.');
			if ($id_value) {
				//编辑
				$result = $this->validate($postdata, $model . '.edit');
				if (true === $result) {
					$result = model($model)
						->allowField(true)
						->isUpdate(true)
						->save($postdata, [$id_name => $id_value]);
					return $this->returnResult($result, '更新成功', '更新失败');
				} else {
					return $this->error($result);
				}
			} else {
				//添加
				$result = $this->validate($postdata, $model);
				if (true === $result) {
					$result = model($model)
						->data($postdata)
						->allowField(true)
						->save();
					return $this->returnResult($result, '添加成功', '添加失败');
				} else {
					return $this->error($result);
				}
			}

		} else {
			$data = null;
			if ($edit) {
				$data = \think\Db::name($model)
					->where($id_name, $id_value)
					->find();
			}
			$this->assign('id', ['name' => $id_name, 'value' => $id_value]);
			$this->assign('model', $model);
			$this->assign('data', $data);
			return $this->fetch('logic/form_edit_tpl');
		}
	}
	/**
	 * 添加表单
	 * @param string $name 表单的标识符
	 */
	public function add($name = '') {
		return $this->addEditForm($name);
	}
	/**
	 * 编辑表单
	 * @param  string $name 表单的标识符
	 * @return [type]       [description]
	 */
	public function edit($name = '') {
		return $this->addEditForm($name, true);
	}

	/**
	 * 从回收站恢复数据(设置指定状态到1)
	 * @param  string $table 数据库名字
	 * @param  string $id    主键id值(可以是','分隔的字符串)
	 * @param  string $field 表示状态的字段,默认为status
	 * @return [type]        [description]
	 */
	public function huifu($table = '', $id = '', $field = 'status') {
		$idname = $this->_getPrimaryKey($table);
		$id || ($id = input('param.' . $idname));
		$id || ($id = input('param.id'));
		$table || $this->error('数据表为空!');
		$id || $this->error('id不能为空');
		$field || $this->error('状态字段不能为空');
		$result = \think\Db::name(ucfirst($table))
			->where($idname, 'in', $id)
			->update([
				$field        => 1,
				'update_time' => time(),
			]);

		$info = \think\Db::name('Form')
			->field('title')
			->where(['name' => $table])
			->find();
		add_user_log('恢复' . $info['title'], input('param.'));
		$this->returnResult($result, '已经恢复成功', '恢复失败');
	}
	/**
	 * 移动到回收站(设置指定状态到-1)
	 * @param  string $table 数据库名字
	 * @param  string $id    主键id值(可以是','分隔的字符串)
	 * @param  string $field 表示状态的字段,默认为status
	 * @return [type]        [description]
	 */
	public function del($table = '', $id = '', $field = 'status') {
		$idname = $this->_getPrimaryKey($table);
		$id || ($id = input('param.' . $idname));
		$id || ($id = input('param.id'));
		$table || $this->error('数据表为空!');
		$id || $this->error('id不能为空');
		$field || $this->error('状态字段不能为空');
		$result = \think\Db::name(ucfirst($table))
			->where($idname, 'in', $id)
			->update([
				$field        => -1,
				'update_time' => time(),
			]);
		$info = \think\Db::name('Form')
			->field('title')
			->where(['name' => $table])
			->find();
		add_user_log($info['title'] . '移动到回收站', input('param.'));
		$this->returnResult($result, '已经移动到回收站', '移动失败');
	}
	/**
	 * 删除信息
	 * @param  string $table 数据表名字
	 * @param  string $id    主键id值(可以是','分隔的字符串)
	 * @return [type]        [description]
	 */
	public function delete($table = '', $id = '') {
		$idname = $this->_getPrimaryKey($table);
		$table || $this->error('数据表为空!');
		$id || ($id = input('param.' . $idname));
		$id || ($id = input('param.id'));
		$id || $this->error('id不能为空!');
		is_string($id) && ($id = explode(',', $id));
		$result = \think\Db::name(ucfirst($table))
			->where($idname, 'in', $id)
			->delete();
		$info = \think\Db::name('Form')
			->field('title')
			->where(['name' => $table])
			->find();
		add_user_log('删除' . $info['title'], input('param.'));
		$this->returnResult($result, '删除成功', '删除失败');
	}
	/**
	 * 清空数据库中状态为-1的记录
	 * @param  string $table 数据库名字
	 * @param  string $id    主键id值(可以是','分隔的字符串)
	 * @param  string $field 表示状态的字段,默认为status
	 * @return [type]        [description]
	 */
	public function clearUp($table = '', $field = 'status') {
		$table || $this->error('数据表为空!');
		$result = \think\Db::name(ucfirst($table))
			->where($field, -1)
			->delete();
		$info = \think\Db::name('Form')
			->field('title')
			->where(['name' => $table])
			->find();
		add_user_log('清空回收站的' . $info['title'], input('param.'));
		$this->returnResult($result, '全部删除成功', '没有数据被清理');
	}
	/**
	 * 由表名反回一个主键id名字
	 * @param  [type] $table [description]
	 * @return [type]        [description]
	 */
	private function _getPrimaryKey($table = '') {
		$table = $this->_getTable($table);
		if (!$table) {
			return '';
		}
		return $table . '_id';
	}
}

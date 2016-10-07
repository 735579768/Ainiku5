<?php
namespace app\admin\controller\sys;
use think\Db;

class Category extends Base {

	/**
	 * 分类列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '分类列表');
		// // 查询状态为1的用户数据 并且每页显示10条数据
		// $list = Db::name('Category')->where(['pid' => 0])->paginate(10);
		// // 获取分页显示
		// $page = $list->render();
		// // 模板变量赋值
		// $this->assign('_list', $list);
		// $this->assign('_page', $page);
		return $this->fetch();
		$this->tree();
	}
	/**
	 * 取分类列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0) {
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('Category')
			->where(['pid' => $pid])
			->field('category_id,pid,title,name,sort,status')
			->order('status desc,sort asc')
			->select();
		foreach ($list as $key => $value) {
			$list2 = Db::name('Category')
				->where(['pid' => $value['category_id']])
				->field('category_id,pid,title,name,sort,status')
				->order('status desc,sort asc')
				->select();
			$list[$key]['child'] = $list2;
		}
		$this->assign('_list', $list);
		return $this->fetch('tree');
	}
	/**
	 * 添加分类
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign([
			'meta_title' => '添加分类',
			'formstr'    => chuli_form('Category'),
		]);
		return $this->fetch('logic/form_edit_tpl');

	}
	/**
	 * 编辑分类
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign([
			'meta_title' => '编辑分类',
			'formstr'    => chuli_form('Category', true),
		]);
		return $this->fetch('logic/form_edit_tpl');
	}
	/**
	 * 删除分类
	 * @return [type] [description]
	 */
	public function delete() {
		$category_id = input('param.category_id');
		($category_id == 1) && $this->error('首页分类不能删除!');
		$list = \think\Db::name('Category')
			->where('pid', $category_id)
			->find();
		$list && $this->error('请先删除此分类下的子分类!');
		//清除掉childcategory标签的数据
		\think\Cache::clear('childcategory');
		controller('Data', 'logic')->delete('Category', $category_id);
	}
}

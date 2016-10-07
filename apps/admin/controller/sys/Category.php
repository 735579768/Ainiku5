<?php
namespace app\admin\controller\sys;
use think\Db;

class Category extends Base {

	/**
	 * 分类列表
	 * @return [type] [description]
	 */
	public function lis() {
		$category_type  = input('param.category_type', 'article');
		$category_title = get_status($category_type, 'category_type');
		$this->assign([
			'meta_title'     => $category_title . '分类列表',
			'category_type'  => $category_type,
			'category_title' => $category_title,
		]);
		return $this->fetch();
		// $this->tree();
	}
	/**
	 * 取分类列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0, $category_type = 'article') {
		// 查询状态为1的用户数据 并且每页显示10条数据
		// $category_type        = input('param.category_type', 'article');
		$map['pid']           = $pid;
		$map['category_type'] = $category_type;
		$list                 = Db::name('Category')
			->where($map)
			->field('category_id,pid,title,name,sort,status')
			->order('status desc,sort asc')
			->select();
		foreach ($list as $key => $value) {
			$map['pid'] = $value['category_id'];
			$list2      = Db::name('Category')
				->where($map)
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

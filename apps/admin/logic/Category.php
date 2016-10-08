<?php
namespace app\admin\logic;
use think\Controller;

class Category extends Controller {
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

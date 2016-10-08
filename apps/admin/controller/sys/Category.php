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
	}
	/**
	 * 取分类列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0, $category_type = 'article') {
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
		return controller('Data', 'logic')->add('Category');

	}
	/**
	 * 编辑分类
	 * @return [type] [description]
	 */
	public function edit() {
		return controller('Data', 'logic')->edit('Category');
	}
	/**
	 * 删除分类
	 * @return [type] [description]
	 */
	public function delete() {
		return controller('Category', 'logic')->delete();
	}
}

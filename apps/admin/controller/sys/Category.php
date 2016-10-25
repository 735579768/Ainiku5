<?php
namespace app\admin\controller\sys;
use think\Cache;
use think\Db;

class Category extends Base {

	/**
	 * 分类列表
	 * @return [type] [description]
	 */
	public function lis() {
		$category_type  = input('param.category_type', 'article');
		$category_title = get_status($category_type, 'category_type');

		$map['pid']           = 0;
		$map['category_type'] = $category_type;
		$list                 = $this->pages([
			'table' => 'Category',
			'where' => $map,
			'order' => 'sort asc',
		]);
		$list = $list[0];
		foreach ($list as $key => $value) {
			$list2 = Db::name('Category')
				->where(['pid' => $value['category_id']])
				->field('category_id,pid,title,name,sort,status')
				->order('status desc,sort asc')
				->find();
			$list[$key]['child'] = $list2;
		}
		$this->assign([
			'meta_title'     => $category_title . '列表',
			'category_type'  => $category_type,
			'category_title' => $category_title,
			'_list'          => $list,
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
		$list                 = Cache::tag('category')->get('category' . $pid);
		if (!$list || config('app_debug')) {
			$list = Db::name('Category')
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
			Cache::tag('category')->set('category' . $pid, $list);
		}
		$this->assign([
			'_list'         => $list,
			'category_type' => $category_type,
		]);
		$this->success('ok', '', $this->fetch('tree'));
	}
	/**
	 * 添加分类
	 * @return [type] [description]
	 */
	public function add() {
		Cache::clear('category');
		return controller('Data', 'logic')->add('Category');

	}
	/**
	 * 编辑分类
	 * @return [type] [description]
	 */
	public function edit() {
		Cache::clear('category');
		return controller('Data', 'logic')->edit('Category');
	}
	/**
	 * 删除分类
	 * @return [type] [description]
	 */
	public function delete() {
		Cache::clear('category');
		$category_id = input('param.category_id');
		($category_id == 1) && $this->error('首页分类不能删除!');
		$list = \think\Db::name('Category')
			->where('pid', $category_id)
			->find();
		$list && $this->error('请先删除此分类下的子分类!');
		//清除掉childcategory标签的数据
		Cache::clear('childcategory');
		controller('Data', 'logic')->delete('Category', $category_id);
	}
}

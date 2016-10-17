<?php
namespace app\admin\controller\com;
use think\Cache;
use think\Db;

class Single extends Base {

	/**
	 * 单页列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '单页列表');
		return $this->fetch();
		$this->tree();
	}
	/**
	 * 取单页列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0) {
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Cache::tag('single')->get('single' . $pid);
		if (!$list || APP_DEBUG) {
			$list = Db::name('Single')
				->where(['pid' => $pid])
				->field('single_id,pid,title,name,sort,status')
				->order('status desc,sort asc')
				->select();
			foreach ($list as $key => $value) {
				$list2 = Db::name('Single')
					->where(['pid' => $value['single_id']])
					->field('single_id,pid,title,name,sort,status')
					->order('status desc,sort asc')
					->select();
				$list[$key]['child'] = $list2;
			}
			Cache::tag('single')->set('single' . $pid, $list);
		}
		$this->assign('_list', $list);
		return $this->fetch('tree');
	}
	/**
	 * 添加单页
	 * @return [type] [description]
	 */
	public function add() {
		Cache::clear('single');
		return controller('Data', 'logic')->add('Single');

	}
	/**
	 * 编辑单页
	 * @return [type] [description]
	 */
	public function edit() {
		Cache::clear('single');
		return controller('Data', 'logic')->edit('Single');
	}
	/**
	 * 删除单页
	 * @return [type] [description]
	 */
	public function delete() {
		Cache::clear('single');
		$single_id = input('param.single_id');
		($single_id == 1) && $this->error('首页单页不能删除!');
		$list = \think\Db::name('Single')
			->where('pid', $single_id)
			->find();
		$list && $this->error('请先删除此单页下的子单页!');
		//清除掉childsingle标签的数据
		\think\Cache::clear('childsingle');
		controller('Data', 'logic')->delete('Single', $single_id);
	}
}

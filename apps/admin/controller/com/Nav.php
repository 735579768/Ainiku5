<?php
namespace app\admin\controller\com;
use think\Cache;
use think\Db;

class Nav extends Base {

	/**
	 * 导航列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '导航列表');
		return $this->fetch();
		$this->tree();
	}
	/**
	 * 取导航列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0) {
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Cache::tag('nav')->get('nav' . $pid);
		if (!$list || APP_DEBUG) {
			$list = Db::name('Nav')
				->where(['pid' => $pid])
				->field('nav_id,pid,title,url,sort,status,target')
				->order('status desc,sort asc')
				->select();
			foreach ($list as $key => $value) {
				$list2 = Db::name('Nav')
					->where(['pid' => $value['nav_id']])
					->field('nav_id,pid,title,url,sort,status,target')
					->order('status desc,sort asc')
					->select();
				$list[$key]['child'] = $list2;
			}
			Cache::tag('nav')->set('nav' . $pid, $list);
		}
		$this->assign('_list', $list);
		return $this->fetch('tree');
	}
	/**
	 * 添加导航
	 * @return [type] [description]
	 */
	public function add() {
		Cache::clear('nav');
		return controller('Data', 'logic')->add('Nav');

	}
	/**
	 * 编辑导航
	 * @return [type] [description]
	 */
	public function edit() {
		Cache::clear('nav');
		return controller('Data', 'logic')->edit('Nav');
	}
	/**
	 * 删除导航
	 * @return [type] [description]
	 */
	public function delete() {
		Cache::clear('nav');
		$nav_id = input('param.nav_id');
		($nav_id == 1) && $this->error('首页导航不能删除!');
		$list = \think\Db::name('Nav')
			->where('pid', $nav_id)
			->find();
		$list && $this->error('请先删除此导航下的子导航!');
		//清除掉childnav标签的数据
		\think\Cache::clear('childnav');
		controller('Data', 'logic')->delete('Nav', $nav_id);
	}
}

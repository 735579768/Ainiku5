<?php
namespace app\admin\controller\sys;
use think\Cache;
use think\Db;

class Menu extends Base {

	/**
	 * 菜单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$map['pid'] = 0;
		$list       = $this->pages([
			'table' => 'Menu',
			'where' => $map,
			'order' => 'sort asc',
		]);
		$list = $list[0];
		foreach ($list as $key => $value) {
			$list2 = Db::name('Menu')
				->where(['pid' => $value['menu_id']])
				->field('menu_id,pid,title,url,sort,status,group,home')
				->order('status desc,sort asc')
				->find();
			$list[$key]['child'] = $list2;
		}

		$this->assign([
			'meta_title' => '菜单列表',
			'_list'      => $list,
		]);
		return $this->fetch();

	}
	/**
	 * 取菜单列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0) {
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Cache::tag('menu')->get('menu' . $pid);
		if (!$list || config('app_debug')) {
			$list = Db::name('Menu')
				->where(['pid' => $pid])
				->field('menu_id,pid,title,url,sort,status,group,home')
				->order('status desc,sort asc')
				->select();
			foreach ($list as $key => $value) {
				$list2 = Db::name('Menu')
					->where(['pid' => $value['menu_id']])
					->field('menu_id,pid,title,url,sort,status,group,home')
					->order('status desc,sort asc')
					->select();
				$list[$key]['child'] = $list2;
			}
			Cache::tag('menu')->set('menu' . $pid, $list);
		}
		$this->assign('_list', $list);
		$this->success('ok', '', $this->fetch('tree'));

	}
	/**
	 * 添加菜单
	 * @return [type] [description]
	 */
	public function add() {
		Cache::clear('menu');
		return controller('Data', 'logic')->add('Menu');

	}
	/**
	 * 编辑菜单
	 * @return [type] [description]
	 */
	public function edit() {
		Cache::clear('menu');
		return controller('Data', 'logic')->edit('Menu');
	}
	/**
	 * 删除菜单
	 * @return [type] [description]
	 */
	public function delete() {
		Cache::clear('menu');
		$menu_id = input('param.menu_id');
		($menu_id == 1) && $this->error('首页菜单不能删除!');
		$list = \think\Db::name('Menu')
			->where('pid', $menu_id)
			->find();
		$list && $this->error('请先删除此菜单下的子菜单!');
		controller('Data', 'logic')->delete('Menu', $menu_id);
	}
}

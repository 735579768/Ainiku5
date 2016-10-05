<?php
namespace app\admin\controller\sys;
use think\Db;

class Menu extends Base {

	/**
	 * 菜单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '菜单列表');
		// // 查询状态为1的用户数据 并且每页显示10条数据
		// $list = Db::name('Menu')->where(['pid' => 0])->paginate(10);
		// // 获取分页显示
		// $page = $list->render();
		// // 模板变量赋值
		// $this->assign('_list', $list);
		// $this->assign('_page', $page);
		return $this->fetch();
		$this->tree();
	}
	/**
	 * 取菜单列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0) {
		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('Menu')
			->where(['pid' => $pid])
			->field('menu_id,pid,title,url,sort,status')
			->order('status desc,sort asc')
			->select();
		foreach ($list as $key => $value) {
			$list2 = Db::name('Menu')
				->where(['pid' => $value['menu_id']])
				->field('menu_id,pid,title,url,sort,status')
				->order('status desc,sort asc')
				->select();
			$list[$key]['child'] = $list2;
		}
		$this->assign('_list', $list);
		return $this->fetch('tree');
	}
	/**
	 * 添加菜单
	 * @return [type] [description]
	 */
	public function add() {
		$this->assign([
			'meta_title' => '添加菜单',
			'formstr'    => chuli_form('Menu'),
		]);
		return $this->fetch('logic/form_edit_tpl');

	}
	/**
	 * 编辑菜单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->assign([
			'meta_title' => '编辑菜单',
			'formstr'    => chuli_form('Menu', true),
		]);
		return $this->fetch('logic/form_edit_tpl');
	}
	/**
	 * 删除菜单
	 * @return [type] [description]
	 */
	public function delete() {
		$menu_id = input('param.menu_id');
		($menu_id == 1) && $this->error('首页菜单不能删除!');
		$list = \think\Db::name('Menu')
			->where('pid', $menu_id)
			->find();
		$list && $this->error('请先删除此菜单下的子菜单!');
		//清除掉childmenu标签的数据
		\think\Cache::clear('childmenu');
		controller('Data', 'logic')->delete('Menu', $menu_id);
	}
}

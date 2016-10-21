<?php
namespace app\admin\controller\sys;
use think\Cache;
use think\Db;

class Authrule extends Base {
	/**
	 * 权限规则列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '权限规则列表');
		return $this->fetch();
		$this->tree();
	}
	/**
	 * 取权限规则列表
	 * @param  integer $pid 上级id
	 * @return [type]       [description]
	 */
	public function tree($pid = 0) {
		$list = Cache::tag('authrule')->get('authrule' . $pid);
		if (!$list || APP_DEBUG) {
			// if (!$list) {
			// 查询状态为1的用户数据 并且每页显示10条数据
			$list = Db::name('AuthRule')
				->where(['pid' => $pid])
				->field('auth_rule_id,pid,title,name,sort,status')
				->order('status desc,sort asc')
				->select();
			foreach ($list as $key => $value) {
				$list2 = Db::name('AuthRule')
					->where(['pid' => $value['auth_rule_id']])
					->field('auth_rule_id,pid,title,name,sort,status')
					->order('sort asc,status desc')
					->select();
				$list[$key]['child'] = $list2;
			}
			Cache::tag('authrule')->set('authrule' . $pid, $list);
		}
		$this->assign('_list', $list);
		return $this->fetch('tree');
	}
	/**
	 * 添加权限规则
	 * @return [type] [description]
	 */
	public function add() {
		// dump(input('pid'));
		Cache::clear('authrule');
		return controller('Data', 'logic')->add('AuthRule');

	}
	/**
	 * 编辑权限规则
	 * @return [type] [description]
	 */
	public function edit() {
		Cache::clear('authrule');
		return controller('Data', 'logic')->edit('AuthRule');
	}
	/**
	 * 删除权限规则
	 * @return [type] [description]
	 */
	public function delete() {
		Cache::clear('authrule');
		$auth_rule_id = input('param.auth_rule_id');
		($auth_rule_id == 1) && $this->error('首页权限规则不能删除!');
		$list = \think\Db::name('AuthRule')
			->where('pid', $auth_rule_id)
			->find();
		$list && $this->error('请先删除此权限规则下的子权限规则!');
		//清除掉childmenu标签的数据
		\think\Cache::clear('mainchildmenu');
		controller('Data', 'logic')->delete('AuthRule', $auth_rule_id);
	}
}

<?php
namespace app\admin\controller\sys;
use think\Db;

class Formitem extends Base {

	/**
	 * 表单项列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '表单项列表');
		$form_id = input('param.form_id');
		$form_id || $this->error('表单id不能为空!');

		// 查询状态为1的用户数据 并且每页显示10条数据
		$list = Db::name('FormItem')
			->where('form_id', $form_id)
			->order('tab_id asc,sort asc')
			->paginate(config('list_rows'));
		// 获取分页显示
		$page = $list->render();
		// var_dump($page);
		// 模板变量赋值
		$this->assign('_list', $list);
		$this->assign('_page', $page);
		return $this->fetch();
	}
	/**
	 * 添加表单项
	 * @return [type] [description]
	 */
	public function add() {
		$form_id = input('param.form_id');
		$form_id || $this->error('表单id不能为空!');
		$this->addNewField();
		$this->assign([
			'meta_title' => '添加表单项',
			'formstr'    => chuli_form('FormItem'),
		]);
		return $this->fetch('logic/form_edit_tpl');

	}
	/**
	 * 编辑表单项
	 * @return [type] [description]
	 */
	public function edit() {
		$this->addNewField();
		$this->assign([
			'meta_title' => '编辑表单项',
			'formstr'    => chuli_form('FormItem', true),
		]);
		return $this->fetch('logic/form_edit_tpl');
	}
	/**
	 * 删除表单项
	 * @return [type] [description]
	 */
	public function del() {

	}
	/**
	 * 判断这个数据表有没有这个字段
	 * @param [type] $tableid        Form表中的id
	 * @param [type] $tablefield     数据表字段
	 * @param [type] $tablefieldtype 字段类型
	 * @param [type] $title          字段备注
	 */
	private function addNewField() {
		if (!request()->isPost()) {
			return false;
		}
		$tableid        = input('param.form_id');
		$tablefield     = input('param.name');
		$tablefieldtype = select_form_type(input('param.type'), true);
		$title          = input('param.title');

		$info = \think\Db::name('Form')->field('name')->find($tableid);
		$info || $this->error("ID为{$tableid}数据表不存在");
		$prefix       = config('database.prefix');
		$tablename    = strtolower($info['name']);
		$tablefield   = strtolower($tablefield);
		$defaultvalue = input('param.value');

		$sql = "Describe {$prefix}{$tablename} `{$tablefield}`";
		$res = \think\Db::query($sql);

		//$res成功array(1) { [0]=> array(6) { ["Field"]=> string(5) "title" ["Type"]=> string(11) "varchar(50)" ["Null"]=> string(2) "NO" ["Key"]=> string(0) "" ["Default"]=> string(0) "" ["Extra"]=> string(0) "" } }
		//$res失败array(0) {};

		if ($res) {
			//修改字段
			$sql = "alter table {$prefix}{$tablename} MODIFY `{$tablefield}` " . $tablefieldtype . ' COMMENT \'' . $title . '\'';
			if ($defaultvalue) {
				$sql = preg_replace('/DEFAULT \'.*?\'/', 'DEFAULT \'' . $defaultvalue . '\'', $sql);
			}
			$res = \think\Db::execute($sql);
		} else {
			//添加字段
			$sql = "alter table {$prefix}{$tablename} add `{$tablefield}` " . $tablefieldtype . ' COMMENT \'' . $title . '\'';
			if ($defaultvalue) {
				$sql = preg_replace('/DEFAULT \'.*?\'/', 'DEFAULT \'' . $defaultvalue . '\'', $sql);
			}
			$res = \think\Db::execute($sql);
		}
	}
}

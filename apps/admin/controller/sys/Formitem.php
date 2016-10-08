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

		$this->pages([
			'table' => 'FormItem',
			'where' => ['a.form_id' => $form_id],
			'join'  => [
				['form b', 'a.form_id=b.form_id'],
			],
			'field' => 'a.*,b.title as form_title',
			'order' => 'tab_id asc,a.sort asc',
		]);
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
		return controller('Data', 'logic')->add('FormItem');

	}
	/**
	 * 编辑表单项
	 * @return [type] [description]
	 */
	public function edit() {
		$this->addNewField();
		return controller('Data', 'logic')->edit('FormItem');
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
		$auto_greate = input('param.auto_greate', 0);
		if (!request()->isPost()) {
			return false;
		}
		if (!$auto_greate) {
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

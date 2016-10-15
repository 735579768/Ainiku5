<?php
namespace app\admin\controller\sys;
use think\Db;

class Form extends Base {

	/**
	 * 表单列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '表单列表');
		$this->pages([
			'table' => 'Form',
			'where' => ['a.status' => 1],
			'order' => 'sort asc',
		]);
		return $this->fetch();
	}
	/**
	 * 添加表单
	 * @return [type] [description]
	 */
	public function add() {
		$this->addNewTable();
		return controller('Data', 'logic')->add('Form');
	}
	/**
	 * 编辑表单
	 * @return [type] [description]
	 */
	public function edit() {
		$this->addNewTable();
		return controller('Data', 'logic')->edit('Form');

	}
	/**
	 * 删除表单
	 * @return [type] [description]
	 */
	public function delete() {
		$form_id = input('param.form_id');
		$form_id || $this->error('id不能为空!');
		// //删除所有表单项
		// \think\Db::name('FormItem')
		// 	->where('form_id', $form_id)
		// 	->delete();
		$list = \think\Db::name('FormItem')
			->where('form_id', $form_id)
			->find();
		$list && $this->error('此表单下还有表单项,故不能删除!');
		controller('Data', 'logic')->delete('Form', $form_id);
	}
	/**
	 * 判断有没有这个数据表没有的话添加
	 * @param [type] $table_name [description]
	 */
	private function addNewTable() {
		$auto_greate = input('param.auto_greate', 0);
		if (!request()->isPost()) {
			return false;
		}
		if (!$auto_greate) {
			return false;
		}

		$tablename = input('param.name');
		$note      = input('param.note');
		$tablename = lcfirst($tablename);
		$tablename = preg_replace('/([A-Z].*?)/', "_$1", $tablename);
		$tablename = $this->_getTable($info['name']);
		$prefix    = config('database.prefix');
		$sql       = "SHOW TABLES LIKE '{$prefix}{$tablename}'";
		$res       = \think\Db::query($sql);
		// echo $prefix . $tablename;
		// var_dump($res);
		// die();
		//成功$res{ ["Tables_in_ainiku5 (kl_form)"]=> string(7) "kl_form" } }
		//失败{}
		if ($res) {
			$sql = "ALTER TABLE `{$prefix}{$tablename}` COMMENT '{$note}';";
			$res = \think\Db::execute($sql);
		} else {
			$sql = <<<sql
	CREATE TABLE `{$prefix}{$tablename}`(
		`{$tablename}_id` int UNSIGNED NULL AUTO_INCREMENT,
		`create_time`  int(10) UNSIGNED NULL DEFAULT 0 ,
		`update_time`  int(10) UNSIGNED NULL DEFAULT 0 ,
		 PRIMARY KEY (`{$tablename}_id`)
	 )ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='{$note}';
sql;
			$res = \think\Db::execute($sql);
		}
	}
	/**
	 * 由表名反回一个主键id名字
	 * @param  [type] $table [description]
	 * @return [type]        [description]
	 */
	private function _getTable($table = '') {
		if (!$table) {
			return '';
		}
		return strtolower(preg_replace('/([A-Z].*?)/', '_$1', lcfirst($table)));
	}
}

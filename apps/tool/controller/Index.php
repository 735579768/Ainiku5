<?php
namespace app\tool\controller;
use think\Db;

class Index {
	public function index() {
		return 'ok';
	}
	private function getAllField($table_name) {
		$con_yc    = 'mysql://root:123456@localhost:3306/yc_oxisi';
		$fieldlist = Db::connect($con_yc)->query("SHOW COLUMNS FROM $table_name ");
		$flist     = [];
		foreach ($fieldlist as $k => $v) {
			$flist[] = $v['field'];
		}
		return $flist;
	}

	private function moveTableData($table_name) {
		$con_lc = 'mysql://root:123456@localhost:3306/oxisi';
		$con_yc = 'mysql://root:123456@localhost:3306/yc_oxisi';
		//转移用户表数据
		$ctable = strtolower(preg_replace('/([A-Z])/', "_$1", $table_name));
		// echo ($ctable);
		$flist    = $this->getAllField('oasis' . $ctable);
		$datalist = Db::connect($con_yc)->query();
		$adddata  = null;
		foreach ($datalist as $key => $value) {
			$tem = null;
			foreach ($flist as $k => $v) {
				$tem[$v] = empty($value[$v]) ? '' : $value[$v];
			}
			$adddata[] = $tem;
		}
		$result = M($table_name, 'oasis_', $con_lc)->addAll($adddata);
		return $result;
	}
	/**
	 * 从旧数据库导入数据到新数据库
	 * 转移地址http://oasis.loc/kefu.php?m=Admin&c=Ostool&a=moveData
	 */
	public function moveData() {
		$con_lc = 'mysql://root:123456@localhost:3306/oxisi';
		$con_yc = 'mysql://root:123456@localhost:3306/yc_oxisi';
		//先清空本地数据表
		$deltable = ['Userinfo', 'Userfb', 'Fangan', 'Fanganmx', 'Order', 'Adminlogs', 'Cart', 'Loginlogs', 'Logs', 'Logsid', 'Msg', 'Msgdemo', 'Notepad', 'Notice', 'Seo', 'Sms', 'Tuidan', 'Userlog', 'Usertpl', 'Orderinfo', 'Userid', 'KfActionlog', 'KfFile', 'KfMemberLog', 'KfPicture', 'KfFile'];
		foreach ($deltable as $key => $value) {
			$result = M($value, 'oasis_', $con_lc)->where('1=1')->delete();
		}
		//需要转移数据的用户表
		$movetable = ['Userid', 'Order', 'Orderinfo', 'Tuidan', 'Userinfo', 'Usertpl', 'Userfb', 'KfPicture', 'Fangan', 'Fanganmx'];
		foreach ($movetable as $key => $value) {
			//清除本地数据
			M($value, 'oasis_', $con_lc)->where('1=1')->delete();
			var_dump($value . ' : ' . $this->moveTableData($value));
		}

	}
}

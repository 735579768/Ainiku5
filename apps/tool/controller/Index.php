<?php
namespace app\tool\controller;
use think\Db;

class Index {
	private $config = [
		'db1' => [
			// 数据库类型
			'type'     => 'mysql',
			// 数据库连接DSN配置
			'dsn'      => '',
			// 服务器地址
			'hostname' => '127.0.0.1',
			// 数据库名
			'database' => 'thinkphp',
			// 数据库用户名
			'username' => 'root',
			// 数据库密码
			'password' => '',
			// 数据库连接端口
			'hostport' => '',
			// 数据库连接参数
			'params'   => [],
			// 数据库编码默认采用utf8
			'charset'  => 'utf8',
			// 数据库表前缀
			'prefix'   => 'think_',
		],
		'db2' => [
			// 数据库类型
			'type'     => 'mysql',
			// 数据库连接DSN配置
			'dsn'      => '',
			// 服务器地址
			'hostname' => '127.0.0.1',
			// 数据库名
			'database' => 'thinkphp',
			// 数据库用户名
			'username' => 'root',
			// 数据库密码
			'password' => '',
			// 数据库连接端口
			'hostport' => '',
			// 数据库连接参数
			'params'   => [],
			// 数据库编码默认采用utf8
			'charset'  => 'utf8',
			// 数据库表前缀
			'prefix'   => 'think_',
		],
	];
	public function index() {
		return 'ok';
	}
	private function getAllField($table_name) {
		// $con_yc    = 'mysql://root:123456@localhost:3306/yc_oxisi#utf8';
		$fieldlist = Db::connect($this->config['db1'])->query("SHOW COLUMNS FROM $table_name ");
		$flist     = [];
		foreach ($fieldlist as $k => $v) {
			$flist[] = $v['field'];
		}
		return $flist;
	}

	private function moveTableData($table_name) {
		// $con_lc = 'mysql://root:123456@localhost:3306/oxisi#utf8';
		// $con_yc = 'mysql://root:123456@localhost:3306/yc_oxisi#utf8';
		//转移用户表数据
		$ctable = strtolower(preg_replace('/([A-Z])/', "_$1", $table_name));
		// echo ($ctable);
		$flist    = $this->getAllField('oasis' . $ctable);
		$datalist = Db::connect($this->config['db1'])->query();
		$adddata  = null;
		foreach ($datalist as $key => $value) {
			$tem = null;
			foreach ($flist as $k => $v) {
				$tem[$v] = empty($value[$v]) ? '' : $value[$v];
			}
			$adddata[] = $tem;
		}
		$result = Db::connect($this->config['db1'])->addAll($adddata);
		return $result;
	}
	/**
	 * 从旧数据库导入数据到新数据库
	 * 转移地址http://oasis.loc/kefu.php?m=Admin&c=Ostool&a=moveData
	 */
	public function moveData() {
		// $con_lc = 'mysql://root:123456@localhost:3306/oxisi#utf8';
		// $con_yc = 'mysql://root:123456@localhost:3306/yc_oxisi#utf8';
		//先清空本地数据表
		$deltable = ['Article'];
		foreach ($deltable as $key => $value) {
			$result = Db::connect($this->config['db1'])->name($value)->where('1=1')->delete();
		}
		//需要转移数据的用户表
		$movetable = ['Article'];
		foreach ($movetable as $key => $value) {
			//清除本地数据
			Db::connect($this->config['db1'])->name($value)->where('1=1')->delete();
			var_dump($value . ' : ' . $this->moveTableData($value));
		}

	}
}

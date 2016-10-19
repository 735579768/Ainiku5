<?php
namespace app\common\api;
use think\Db;

class GetData {
	static private $_instance = null;
	private $_table           = ''; //数据表
	private $_byfield         = ''; //通过什么field取数据
	private $_getfield        = ''; //取哪个field数据
	/**
	 * Description:私有化克隆函数，防止外界克隆对象
	 */
	private function __clone() {
	}
	static public function getInstance() {
		if (self::$_instance === null) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}

	/**
	 * 通过类似getNameById 这样的函数取数据
	 * @param  [type] $function_name [description]
	 * @param  [type] $args          [description]
	 * @return [type]                [description]
	 */
	public function __call($funname, $args) {
		if (!$this->_table) {
			// 使用think自带异常类抛出异常
			throw new \think\Exception('没有定义数据表', 100006);
		}
		$funname = substr($funname, 3);
		$funname = str_replace('By', '####', $funname);
		$funname = strtolower(preg_replace('/([A-Z])/', '_$1', $funname));
		$funname = explode('####', $funname);

		$this->_getfield = trim($funname[0], '_');
		$this->_byfield  = trim($funname[1], '_');
		if ($this->_getfield == 'info') {
			return $this->_getInfo($args, true);
		} else {
			return $this->_getInfo($args);
		}

	}
	public function table($name = '') {
		$this->_table = $name;
		return $this;
	}
	private function _getInfo($args, $all = false) {
		if ($all) {
			$info = Db::name($this->_table)
				->where($this->_byfield, $args[0])
				->field('*')
				->find();
			$this->_table = '';
			return $info;
		} else {
			$info = Db::name($this->_table)
				->where($this->_byfield, $args[0])
				->field($this->_getfield)
				->find();
			$this->_table = '';
			return $info[$this->_getfield];
		}
	}
}

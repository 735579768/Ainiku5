<?php
/* PHP SDK
 * @version 2.0.0
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */

require_once CLASS_PATH . "ErrorCase.class.php";
class Recorder {
	private static $data;
	private $inc;
	private $error;

	public function __construct() {
		$this->error = new ErrorCase();

		//-------读取配置文件
		$incFileContents = file(CLASS_PATH . "../comm/inc.php");
		$incFileContents = $incFileContents[1];
		$incFileContents = preg_replace(array('/__APPID__/', '/__APPKEY__/', '/__CALLBACK__/'), array(Q_APPID, Q_APPKEY, Q_CALLBACK), $incFileContents);
		$this->inc       = json_decode($incFileContents);
		if (empty($this->inc)) {
			$this->error->showError("20001");
		}
		$userdata = session('QC_userData');
		if (empty($userdata)) {
			self::$data = array();
		} else {
			self::$data = $userdata;
		}
	}

	public function write($name, $value) {
		self::$data[$name] = $value;
	}

	public function read($name) {
		if (empty(self::$data[$name])) {
			return null;
		} else {
			return self::$data[$name];
		}
	}

	public function readInc($name) {
		if (empty($this->inc->$name)) {
			return null;
		} else {
			return $this->inc->$name;
		}
	}

	public function delete($name) {
		unset(self::$data[$name]);
	}

	function __destruct() {
		session('QC_userData', self::$data);
	}
}

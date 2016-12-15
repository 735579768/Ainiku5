<?php
namespace addons\qconnect;

/**
 * 后台默认访问带Admin后缀的类
 */
class QconnectAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => 'qiaokeli',
		'title'   => 'QQ互联',
		'descr'   => 'QQ登陆',
		'param'   => []
	);
	public function index() {
		echo $this->fetch();
	}
	public function install() {
		$prefix = config('database.prefix');
		$sql    = "Describe {$prefix}user `openid`";
		$res    = \think\Db::query($sql);

		//$res成功array(1) { [0]=> array(6) { ["Field"]=> string(5) "title" ["Type"]=> string(11) "varchar(50)" ["Null"]=> string(2) "NO" ["Key"]=> string(0) "" ["Default"]=> string(0) "" ["Extra"]=> string(0) "" } }
		//$res失败array(0) {};

		if (!$res) {
			//添加字段
			$sql = "alter table {$prefix}user add `openid`  varchar(255) NOT NULL default ''  COMMENT  'QQ互联id'";
			$res = \think\Db::execute($sql);
		}
		return true;
	}
	public function set() {
		if (request()->isPost()) {
			$this->saveParam();
		} else {
			$formarr = [
				[
					'type'    => 'string',
					'name'    => 'appid',
					'title'   => 'APPID',
					'note'    => '（QQ互联APP ID）',
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'string',
					'name'    => 'appkey',
					'title'   => 'APPKEY',
					'note'    => '（QQ互联APP KEY）',
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'string',
					'name'    => 'callback',
					'title'   => 'CALLBACK',
					'note'    => "（QQ互联 回调域名例: 'http://www.ainiku.com'）",
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
			];
			$this->assign([
				'formarr' => $formarr,
				'data'    => $this->getParam(),
			]);
			return $this->fetch('admin_set');
		}
	}
}
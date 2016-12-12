<?php
namespace addons\alipay;

/**
 * 后台默认访问带Admin后缀的类
 */
class AlipayAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => 'qiaokeli',
		'title'   => '支付宝',
		'descr'   => '支付宝付款',
		'param'   => []
	);
	public function index() {
		// reg_css('reset,common');
		// reg_js('jquery-1.9.1.min,ank');
		echo $this->fetch();
	}

	public function set() {
		if (request()->isPost()) {
			$this->saveParam();
		} else {
			$formarr = [
				[
					'type'    => 'string',
					'name'    => 'alipayuname',
					'title'   => '支付宝账号',
					'note'    => '标识:alipayuname',
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'string',
					'name'    => 'alipaysafeid',
					'title'   => '合作者身份ID',
					'note'    => '标识:alipaysafeid',
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'string',
					'name'    => 'alipayverify',
					'title'   => '支付宝检验码',
					'note'    => "标识:alipayverify",
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'string',
					'name'    => 'return_url',
					'title'   => '支付结果前台回调跳转地址',
					'note'    => "标识:return_url,带域名的全路径",
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'string',
					'name'    => 'notify_url',
					'title'   => '支付结果后台异步通知地址',
					'note'    => "标识:notify_url,带域名的全路径",
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'radio',
					'name'    => 'api',
					'title'   => '选择接口类型',
					'note'    => '',
					'extra'   => [
						'shuang' => '双接口',
						'danbao' => '担保交易',
						'jishi'  => '即时到账',
						'bank'   => '网银支付',
					],
					'value'   => 'jishi',
					'is_show' => 3,
				],
			];
			$this->assign([
				'formarr' => $formarr,
				'data'    => $this->getParam(),
			]);
			echo $this->fetch('admin_set');
		}
	}
}
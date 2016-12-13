<?php
namespace addons\alipay;

/**
 * 除啦后台默认访问类
 */
class Alipay extends \app\common\controller\Addon {
	public function index() {
		echo $this->fetch('home_index');
	}
	public function __construct() {
		parent::__construct();
		$data = $this->getParam();
	}
	//测试支付功能
	public function testpay() {
		$this->display('testpay');
		die();
	}
	//实现支付功能
	public function dopay($money = 0.01, $order = '201612130123654', $ordername = 'ordername', $aliarr = '') {

		empty($money) && $money         = doubleval(input('money'));
		empty($order) && $order         = input('order');
		empty($ordername) && $ordername = input('ordername');
		//$money=100;
		//$order='1512051222437';
		//$ordername='1512051222437';
		if (empty($order)) {
			$this->error('请输入单号');
		}
		if (empty($ordername)) {
			$this->error('请输入单号名称');
		}
		if (empty($money) || !is_numeric($money) || $money < 0) {
			$this->error('输入的金额不合法请重新输入');
		}
		//取插件配置参数
		$conf       = $this->getParam();
		$alipayconf = array(
			//必填
			'sellerid'    => $conf['alipaysafeid'], //合作身份者pid
			'sellerkey'   => $conf['alipayverify'], //安全检验码
			'selleruname' => $conf['alipayuname'], //收款账号

			'order'       => $order, //单号
			'ordername'   => $ordername,
			'orderdescr'  => '',
			'money'       => $money, //交易金额
			'return_url'  => $conf['return_url'],
			'notify_url'  => $conf['notify_url'],
			//必填
		);
		include __DIR__ . '/api/Pay.php';
		$alipayconf = array_merge($alipayconf, (array) $conf);
		$alipay     = new \Pay($alipayconf);
		return $alipay->dopay();

	}
	private function yanzheng($type = 1) {
		//取插件配置参数
		$conf                               = $this->getParam();
		$alipay_config['partner']           = $conf['alipaysafeid'];
		$alipay_config['seller_id']         = $conf['alipayuname'];
		$alipay_config['key']               = $conf['alipayverify'];
		$alipay_config['notify_url']        = $conf['notify_url'];
		$alipay_config['return_url']        = $conf['return_url'];
		$alipay_config['sign_type']         = strtoupper('MD5');
		$alipay_config['input_charset']     = strtolower('utf-8');
		$alipay_config['cacert']            = __DIR__ . '/api/cacert.pem';
		$alipay_config['transport']         = 'http';
		$alipay_config['payment_type']      = "1";
		$alipay_config['service']           = "create_direct_pay_by_user";
		$alipay_config['anti_phishing_key'] = '';

// 客户端的IP地址 非局域网的外网IP地址，如：221.0.0.1
		$alipay_config['exter_invoke_ip'] = "";
		//计算得出通知验证结果
		import('Ainiku.Alipay.core');
		import('Ainiku.Alipay.md5');
		import('Ainiku.Alipay.notify');
		import('Ainiku.Alipay.submit');
		$alipayNotify = new \AlipayNotify($alipay_config);
		if ($type == 1) {
			return $alipayNotify->verifyReturn();
		} else {
			return $alipayNotify->verifyNotify();
		}

	}
	public function return_url() {
		if ($this->yanzheng()) {
			//验证成功后把信息添加到你的数据库
			$order_sn             = input('out_trade_no'); //商户订单号
			$data['trade_no']     = input('trade_no'); //支付宝交易号
			$data['trade_status'] = input('trade_status'); //交易状态//各个状态请查看api或插件下面的示例处理函数
			$money                = input('total_fee', 0, 'floatval');
			//$money = input('post.price', 0, 'floatval');

			$data = array(
				'status'   => 1,
				'pay_type' => '支付宝',
				'str'      => '验签成功',
				'money'    => $money,
				'order_sn' => $order_sn,
			);
			return $data;
		} else {
			return array(
				'status'   => 0,
				'pay_type' => '支付宝',
				'str'      => '验签失败',
			);
		}
	}
	public function notify_url() {
		if ($this->yanzheng(2)) {
			//验证成功后把信息添加到你的数据库
			$order_sn     = input('out_trade_no'); //商户订单号
			$trade_no     = input('trade_no'); //支付宝交易号
			$trade_status = input('trade_status'); //交易状态//各个状态请查看api或插件下面的示例处理函数
			if ($trade_status == 'TRADE_SUCCESS' || $trade_status == 'TRADE_FINISHED' || $trade_status == 'WAIT_SELLER_SEND_GOODS') {
/*				//设置为已经支付
$info = M('Order')->where("order_sn=$order_sn")->save(array(
'pay_time'     => NOW_TIME,
'pay_type'     => '支付宝',
'pay_trade_no' => $trade_no,
'order_status' => 2,
));*/
				$money = input('post.total_fee', 0, 'floatval');
				//$money = input('post.price', 0, 'floatval');
				return array(
					'status'   => 1,
					'str'      => '验签成功',
					'pay_type' => '支付宝',
					'money'    => $money,
					'order_sn' => $order_sn,
					'extra'    => '',
				);
			}
		} else {
			return array(
				'status'   => 0,
				'pay_type' => '支付宝',
				'str'      => '验签失败',
			);
		}
	}

/*	//接口通知页面
public function suc($ordernum = "2014100422482039314", $tradestatus = 'no') {
if (empty($ordernum)) {
$this->error('非法请求');
}

$info = D('order')->where("ordernum='$ordernum' and chongzhi=0")->find();
if (empty($info)) {
$this->error('非法请求');
}

$status = array(
'no'                       => '未知状态',
'WAIT_BUYER_PAY'           => '等待买家付款',
'WAIT_SELLER_SEND_GOODS'   => '等待卖家发货',
'WAIT_BUYER_CONFIRM_GOODS' => '卖家已发货，等待买家确认收货',
'TRADE_FINISHED'           => '充值成功',
'TRADE_SUCCESS'            => '充值成功',
);
if ($info['chongzhi'] == '0' and ($info['status'] == 'TRADE_SUCCESS' or $info['status'] == 'TRADE_FINISHED')) {
//添加在线充值日志
addlog(UID, '在线充值', $info['money']);

//会员添加钱数
$result = M('member')->where("id=" . UID)->setInc('points', $info['money']);
if (0 < $result) {
//当前订单状态完成
D('order')->where("ordernum='$ordernum'")->setField('chongzhi', 1);
}
}
$this->assign('info', $info);
$this->assign('status', $status[$info['status']]);
$this->display();
}
////////////////////各个接口的通知函数/////////////////////////////////////////////////////////////////////////////
public function tradenNotifyurl() {
//计算得出通知验证结果
$alipayNotify  = new \AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyNotify();
if ($verify_result) {
//验证成功
$out_trade_no = $_POST['out_trade_no']; //商户订单号
$trade_no     = $_POST['trade_no']; //支付宝交易号
$trade_status = $_POST['trade_status']; //交易状态
//初始化模型更新订单状态
$model = D('order');
$model->where("ordernum='$out_trade_no'")->save(array('status' => $trade_status, 'alipaynum' => $trade_no));

if ($_POST['trade_status'] == 'WAIT_BUYER_PAY') {
//该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款
} else if ($_POST['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
//该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
} else if ($_POST['trade_status'] == 'WAIT_BUYER_CONFIRM_GOODS') {
//该判断表示卖家已经发了货，但买家还没有做确认收货的操作
} else if ($_POST['trade_status'] == 'TRADE_FINISHED') {
//该判断表示买家已经确认收货，这笔交易完成
} else {
//其它状态
}
} else {
//验证失败
echo "fail";
}
}
public function tradeReturnurl() {
//计算得出通知验证结果
$alipayNotify  = new \AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyNotify();
if ($verify_result) {
$out_trade_no = $_GET['out_trade_no']; //商户订单号
$trade_no     = $_GET['trade_no']; //支付宝交易号
$trade_status = $_GET['trade_status']; //交易状态
//验证成功
if ($_GET['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
} else {
echo "trade_status=" . $_GET['trade_status'];
}
$success = A('Alipay');
$suc->suc($out_trade_no, $trade_no);
echo "验证成功<br />";
echo "trade_no=" . $trade_no;
} else {
echo "验证失败";
}
}

public function directNotifyurl() {
//计算得出通知验证结果
$alipayNotify  = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyNotify();

if ($verify_result) {
//验证成功
$out_trade_no = $_POST['out_trade_no'];
$trade_no     = $_POST['trade_no'];
$trade_status = $_POST['trade_status'];
//初始化模型更新订单状态
$model = D('order');
$model->where("ordernum='$out_trade_no'")->save(array('status' => $trade_status, 'alipaynum' => $trade_no));
if ($_POST['trade_status'] == 'TRADE_FINISHED') {
//该种交易状态只在两种情况下出现
//1、开通了普通即时到账，买家付款成功后。
//2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。
} else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
//该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后
}

echo "success";
} else {
//验证失败
echo "fail";
}
}
public function directReturnurl() {
//计算得出通知验证结果
$alipayNotify  = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyReturn();
if ($verify_result) {
//验证成功
$out_trade_no = $_POST['out_trade_no'];
$trade_no     = $_POST['trade_no'];
$trade_status = $_POST['trade_status'];
if ($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程序
} else {
echo "trade_status=" . $_GET['trade_status'];
}
$success = A('Alipay');
$suc->suc($out_trade_no, $trade_no);
echo "验证成功<br />";
} else {
echo "验证失败";
}
}

public function shuangNotifyurl() {
//计算得出通知验证结果
$alipayNotify  = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyReturn();
if ($verify_result) {
//验证成功
$out_trade_no = $_POST['out_trade_no'];
$trade_no     = $_POST['trade_no'];
$trade_status = $_POST['trade_status'];
//初始化模型更新订单状态
$model = D('order');
$model->where("ordernum='$out_trade_no'")->save(array('status' => $trade_status, 'alipaynum' => $trade_no));
if ($_POST['trade_status'] == 'WAIT_BUYER_PAY') {
//该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款

//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程
echo "success";
} else if ($_POST['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
//该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货

//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程序
echo "success";
} else if ($_POST['trade_status'] == 'WAIT_BUYER_CONFIRM_GOODS') {
//该判断表示卖家已经发了货，但买家还没有做确认收货的操作

//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程序
echo "success";
} else if ($_POST['trade_status'] == 'TRADE_FINISHED') {
//该判断表示买家已经确认收货，这笔交易完成

//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程序
echo "success";
} else {
//其他状态判断
echo "success";
}
echo "验证成功<br />";
} else {
echo "验证失败";
}

}
public function shuangReturnurl() {
//计算得出通知验证结果
$alipayNotify  = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyReturn();
if ($verify_result) {
//验证成功
$out_trade_no = $_POST['out_trade_no'];
$trade_no     = $_POST['trade_no'];
$trade_status = $_POST['trade_status'];
if ($_GET['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程序
} else if ($_GET['trade_status'] == 'TRADE_FINISHED') {
//判断该笔订单是否在商户网站中已经做过处理
//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//如果有做过处理，不执行商户的业务程序
} else {
echo "trade_status=" . $_GET['trade_status'];
}
} else {
echo "验证失败";
}
}*/
}
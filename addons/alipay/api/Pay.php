<?php
if (!defined("ACCESS_ROOT")) {
	die("Invalid access");
}
class Pay {
	public function __construct() {
		include __DIR__ . '/api/core.php';
		include __DIR__ . '/api/md5.php';
		include __DIR__ . '/api/notify.php';
		include __DIR__ . '/api/submit.php';
	}
	//支付示例功能
	public function testpay() {
		$this->display();
	}
	public function dopay($conf = array()) {
		$paytype = trim($conf['api'][1]);
		if ($paytype === 'shuang') {
			//双接口
			return $this->doShuangPay($conf);
		} else if ($paytype === 'danbao') {
			//担保交易
			return $this->doTradePay($conf);
		} else if ($paytype === 'jishi') {
			//即时到账
			return $this->doDirectPay($conf);
		} else if ($paytype === 'bank') {
			//支付宝网银
			return $this->doBankPay($conf);
		} else {
			return 'alipay error';
		}

	}
	/********************担保交易***************************/
	public function doTradePay($conf = array()) {
		$alipayconf = array(
			//必填
			//'sellerid'=>C('ALIPAYSAFEID'),//合作身份者pid
			//'sellerkey'=>C('ALIPAYVERIFY'),//安全检验码
			//'selleruname'=>C('ALIPAYUNAME'),//收款账号

			'order'         => $order, //商户订单号
			'ordername'     => $ordername, //订单名称
			'money'         => $money, //金额
			'goodsnum'      => 1, //商品数量
			//必填

			//选填
			'orderdescr'    => $orderdescr, //订单描述
			'goodsurl'      => $goodsurl, //订单详情地址
			'receivename'   => $receivename,
			'receiveadr'    => $receiveadr,
			'receivezip'    => $receivezip, //邮编
			'receivephone'  => $receivephone,
			'receivemobile' => $receivemobile,
			//选填

		);
		$alipayconf = array_merge($alipayconf, $conf);

		$alipay_config['partner']       = $alipayconf['sellerid']; // ;//合作身份者id
		$alipay_config['key']           = $alipayconf['sellerkey']; // ;//安全检验码
		$alipay_config['sign_type']     = strtoupper('MD5'); //签名方式 不需修改
		$alipay_config['input_charset'] = strtolower('utf-8');
		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$alipay_config['cacert']    = __DIR__ . '/cacert.pem';
		$alipay_config['transport'] = 'http';

		//必填
		$payment_type = "1"; //支付类型
		$notify_url   = $conf['notify_url']; //服务器异步通知页面路径
		$return_url   = $conf['return_url']; //页面跳转同步通知页面路径
		$seller_email = $alipayconf['selleruname']; //;//卖家支付宝帐户

		$out_trade_no = $alipayconf['order']; //商户订单号
		$subject      = $alipayconf['ordername']; //订单名称
		$body         = $alipayconf['orderdescr']; //订单描述

		$price             = $alipayconf['money']; //付款金额
		$quantity          = $alipayconf['goodsnum']; //商品数量
		$logistics_fee     = "0.00"; //物流费用即运费
		$logistics_type    = "EXPRESS"; //物流类型
		$logistics_payment = "SELLER_PAY"; //物流支付方式
		//，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）

		//必填

		//选填
		$show_url        = $alipayconf['orderdescr']; //商品展示地址
		$receive_name    = $alipayconf['receivename']; //收货人姓名
		$receive_address = $alipayconf['receiveadr']; //收货人地址
		$receive_zip     = $alipayconf['receivezip']; //收货人邮编
		$receive_phone   = $alipayconf['receivephone']; //收货人电话号码
		$receive_mobile  = $alipayconf['receivemobile']; //收货人手机号码
		//选填

		//构造要请求的参数数组，无需改动
		$parameter = array(
			"service"           => "create_partner_trade_by_buyer",
			"partner"           => trim($alipay_config['partner']),
			"payment_type"      => $payment_type,
			"notify_url"        => $notify_url,
			"return_url"        => $return_url,
			"seller_email"      => $seller_email,
			"out_trade_no"      => $out_trade_no,
			"subject"           => $subject,
			"price"             => $price,
			"quantity"          => $quantity,
			"logistics_fee"     => $logistics_fee,
			"logistics_type"    => $logistics_type,
			"logistics_payment" => $logistics_payment,
			"body"              => $body,
			"show_url"          => $show_url,
			"receive_name"      => $receive_name,
			"receive_address"   => $receive_address,
			"receive_zip"       => $receive_zip,
			"receive_phone"     => $receive_phone,
			"receive_mobile"    => $receive_mobile,
			"_input_charset"    => trim(strtolower($alipay_config['input_charset'])),
		);

		//建立请求
		$alipaySubmit = new \AlipaySubmit($alipay_config);
		$html_text    = $alipaySubmit->buildRequestForm($parameter, "get", "确认");
		return $html_text;

	}
	/********************即时到账***************************/
	function doDirectPay($conf = array()) {
		$alipayconf = array(
			//必填
			//'sellerid'=>C('ALIPAYSAFEID'),//合作身份者pid
			//'sellerkey'=>C('ALIPAYVERIFY'),//安全检验码
			//'selleruname'=>C('ALIPAYUNAME'),//收款账号

			'order'      => $order, //商户订单号
			'ordername'  => $ordername, //订单名称
			'money'      => $money, //金额
			//必填

			//选填
			'orderdescr' => $orderdescr, //订单描述
			'goodsurl'   => $goodsurl, //订单详情地址
			//选填

		);
		$alipayconf = array_merge($alipayconf, $conf);

		$alipay_config['partner']       = $alipayconf['sellerid']; // ;//合作身份者id
		$alipay_config['key']           = $alipayconf['sellerkey']; // ;//安全检验码
		$alipay_config['sign_type']     = strtoupper('MD5'); //签名方式 不需修改
		$alipay_config['input_charset'] = strtolower('utf-8');
		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$alipay_config['cacert']    = __DIR__ . '/cacert.pem';
		$alipay_config['transport'] = 'http';

		//必填
		$payment_type = "1"; //支付类型
		$notify_url   = $conf['notify_url']; //服务器异步通知页面路径
		$return_url   = $conf['return_url']; //页面跳转同步通知页面路径
		$seller_email = $alipayconf['selleruname']; //;//卖家支付宝帐户

		$out_trade_no = $alipayconf['order']; //商户订单号
		$subject      = $alipayconf['ordername']; //订单名称
		$body         = $alipayconf['orderdescr']; //订单描述

		$total_fee         = $alipayconf['money']; //付款金额
		$anti_phishing_key = ""; //防钓鱼时间戳
		$exter_invoke_ip   = ""; //客户端的IP地址
		//必填
		$show_url = $alipayconf['orderdescr']; //商品展示地址

//构造要请求的参数数组，无需改动
		$parameter = array(
			"service"           => "create_direct_pay_by_user",
			"partner"           => trim($alipay_config['partner']),
			"payment_type"      => $payment_type,
			"notify_url"        => $notify_url,
			"return_url"        => $return_url,
			"seller_email"      => $seller_email,
			"out_trade_no"      => $out_trade_no,
			"subject"           => $subject,
			"total_fee"         => $total_fee,
			"body"              => $body,
			"show_url"          => $show_url,
			"anti_phishing_key" => $anti_phishing_key,
			"exter_invoke_ip"   => $exter_invoke_ip,
			"_input_charset"    => trim(strtolower($alipay_config['input_charset'])),
		);

//建立请求
		$alipaySubmit = new \AlipaySubmit($alipay_config);
		$html_text    = $alipaySubmit->buildRequestForm($parameter, "get", "确认");
		return $html_text;

	}
	/********************双标准接口***************************/
	public function doShuangPay($conf = array()) {
		$alipayconf = array(
			//必填
			//'sellerid'=>C('ALIPAYSAFEID'),//合作身份者pid
			//'sellerkey'=>C('ALIPAYVERIFY'),//安全检验码
			//'selleruname'=>C('ALIPAYUNAME'),//收款账号

			'order'         => $order, //商户订单号
			'ordername'     => $ordername, //订单名称
			'money'         => $money, //金额
			'goodsnum'      => 1, //商品数量
			//必填

			//选填
			'orderdescr'    => $orderdescr, //订单描述
			'goodsurl'      => $goodsurl, //订单详情地址
			'receivename'   => $receivename,
			'receiveadr'    => $receiveadr,
			'receivezip'    => $receivezip, //邮编
			'receivephone'  => $receivephone,
			'receivemobile' => $receivemobile,
			//选填

		);
		$alipayconf = array_merge($alipayconf, $conf);

		$alipay_config['partner']       = $alipayconf['sellerid']; // ;//合作身份者id
		$alipay_config['key']           = $alipayconf['sellerkey']; // ;//安全检验码
		$alipay_config['sign_type']     = strtoupper('MD5'); //签名方式 不需修改
		$alipay_config['input_charset'] = strtolower('utf-8');
		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$alipay_config['cacert']    = __DIR__ . '/cacert.pem';
		$alipay_config['transport'] = 'http';

		//必填
		$payment_type = "1"; //支付类型
		$notify_url   = $conf['notify_url']; //服务器异步通知页面路径
		$return_url   = $conf['return_url']; //页面跳转同步通知页面路径
		$seller_email = $alipayconf['selleruname']; //;//卖家支付宝帐户

		$out_trade_no = $alipayconf['order']; //商户订单号
		$subject      = $alipayconf['ordername']; //订单名称
		$body         = $alipayconf['orderdescr']; //订单描述

		$price             = $alipayconf['money']; //付款金额
		$quantity          = $alipayconf['goodsnum']; //商品数量
		$logistics_fee     = "0.00"; //物流费用即运费
		$logistics_type    = "EXPRESS"; //物流类型
		$logistics_payment = "SELLER_PAY"; //物流支付方式
		//，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）

		//必填

		//选填
		$show_url        = $alipayconf['orderdescr']; //商品展示地址
		$receive_name    = $alipayconf['receivename']; //收货人姓名
		$receive_address = $alipayconf['receiveadr']; //收货人地址
		$receive_zip     = $alipayconf['receivezip']; //收货人邮编
		$receive_phone   = $alipayconf['receivephone']; //收货人电话号码
		$receive_mobile  = $alipayconf['receivemobile']; //收货人手机号码
		//选填
		//构造要请求的参数数组，无需改动
		$parameter = array(
			"service"           => "trade_create_by_buyer",
			"partner"           => trim($alipay_config['partner']),
			"payment_type"      => $payment_type,
			"notify_url"        => $notify_url,
			"return_url"        => $return_url,
			"seller_email"      => $seller_email,
			"out_trade_no"      => $out_trade_no,
			"subject"           => $subject,
			"price"             => $price,
			"quantity"          => $quantity,
			"logistics_fee"     => $logistics_fee,
			"logistics_type"    => $logistics_type,
			"logistics_payment" => $logistics_payment,
			"body"              => $body,
			"show_url"          => $show_url,
			"receive_name"      => $receive_name,
			"receive_address"   => $receive_address,
			"receive_zip"       => $receive_zip,
			"receive_phone"     => $receive_phone,
			"receive_mobile"    => $receive_mobile,
			"_input_charset"    => trim(strtolower($alipay_config['input_charset'])),
		);

//建立请求
		$alipaySubmit = new \AlipaySubmit($alipay_config);
		$html_text    = $alipaySubmit->buildRequestForm($parameter, "get", "确认");
		return $html_text;

	}
	//支付宝网银
	function doBankPay($conf) {
/**************************请求参数**************************/

		//支付类型
		$payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		$notify_url = $conf['notify_url'];
		//需http://格式的完整路径，不能加?id=123这类自定义参数

		//页面跳转同步通知页面路径
		$return_url = $conf['return_url'];
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

		//商户订单号
		$out_trade_no = $conf['order'];
		//商户网站订单系统中唯一订单号，必填

		//订单名称
		$subject = $conf['ordername'];
		//必填

		//付款金额
		$total_fee = $conf['money'];
		//必填

		//订单描述

		$body = $conf['orderdescr'];
		//默认支付方式
		$paymethod = "bankPay";
		//必填
		//默认网银
		$defaultbank = $conf['api'][2];
		//必填，银行简码请参考接口技术文档

		//商品展示地址
		$show_url = 'javascript:;';
		//需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html

		//防钓鱼时间戳
		$anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数

		//客户端的IP地址
		$exter_invoke_ip = "";
		//非局域网的外网IP地址，如：221.0.0.1

/************************************************************/

		$conf['partner']       = $conf['sellerid']; // ;//合作身份者id
		$conf['key']           = $conf['sellerkey']; // ;//安全检验码
		$conf['sign_type']     = strtoupper('MD5'); //签名方式 不需修改
		$conf['input_charset'] = strtolower('utf-8');
		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$conf['cacert']    = __DIR__ . '/cacert.pem';
		$conf['transport'] = 'http';

//构造要请求的参数数组，无需改动
		$parameter = array(
			"service"           => "create_direct_pay_by_user",
			"partner"           => trim($conf['partner']),
			"seller_email"      => trim($conf['selleruname']),
			"payment_type"      => $payment_type,
			"notify_url"        => $notify_url,
			"return_url"        => $return_url,
			"out_trade_no"      => $out_trade_no,
			"subject"           => $subject,
			"total_fee"         => $total_fee,
			"body"              => $body,
			"paymethod"         => $paymethod,
			"defaultbank"       => $defaultbank,
			"show_url"          => $show_url,
			"anti_phishing_key" => $anti_phishing_key,
			"exter_invoke_ip"   => $exter_invoke_ip,
			"_input_charset"    => trim(strtolower($conf['input_charset'])),
		);

//建立请求
		$alipaySubmit = new \AlipaySubmit($conf);
		$html_text    = $alipaySubmit->buildRequestForm($parameter, "get", "确认");
		return $html_text;
	}
}
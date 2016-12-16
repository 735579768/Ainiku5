<?php
namespace app\index\controller\sys;

class User extends Base {
	/**
	 *会员中心
	 **/
	function portal() {
		$this->assign('member_title', '会员中心');
		return $this->fetch();
	}
	/**
	 *我的全部订单
	 **/
	public function order($order_status = 1) {
		$this->orderguoqi();
		$this->assign('member_title', '全部订单');
		$map['order_status'] = $order_status;
		$map['uid']          = UID;
		$this->pages(array(
			'table' => 'Order',
			'where' => $map,
			'order' => 'order_status asc,order_id desc',
			'rows'  => 5,
		));
		return $this->fetch();
	}
	/**
	 * 订单过期
	 * @return [type] [description]
	 */
	private function orderguoqi() {
		$map['uid']          = UID;
		$map['order_status'] = 1;
		$map['create_time']  = array('lt', time() - (2 * 3600));
		\think\Db::name('Order')->where($map)->setField('order_status', 0);
	}
	/**
	 *查看订单
	 **/
	public function checkorder($order_id = '') {
		empty($order_id) && $this->error('参数错误!');
		$this->assign('member_title', '订单详情');
		$map['uid']      = UID;
		$map['order_id'] = $order_id;
		$info            = \think\Db::name('Order')->where($map)->find();
		//查询订单中的商品信息
		$list = \think\Db::view('OrderDetail', '*')
			->view('Goods', 'title,pic', 'OrderDetail.goods_id=Goods.goods_id')
			->where(['OrderDetail.order_id' => $order_id])
			->select();
		$this->assign('info', $info);
		$this->assign('_list', $list);
		return $this->fetch();
	}
	/**
	 *收货
	 **/
	function shouhuo($order_id = '') {
		empty($order_id) && $this->error('参数错误!');
		$map['uid']      = UID;
		$map['order_id'] = $order_id;
		$info            = \think\Db::name('Order')->where($map)->setField('order_status', 5);
		($info > 0) ? $this->success('交易成功', ' ') : $this->error('操作失败!');
	}
	/**
	 *修改密码
	 **/
	public function modpwd($new_password = '', $re_password = '') {
		$this->assign('member_title', '修改密码');
		if ($this->request->isPost()) {
			if (empty($new_password) || empty($re_password)) {
				$this->error('密码不能为空');
			}
			if ($new_password !== $re_password) {
				$this->error('两次输入的密码不一样！');
			}
			if (!preg_match('/[\w]{6,15}/', $new_password)) {
				$this->error('密码格式不正确！');
			}
			$new_password = ainiku_ucenter_md5($new_password);
			$result       = M('Member')->where("member_id=" . UID)->save(array(
				'password'    => $new_password,
				'update_time' => time(),
			));

			($result > 0) ? $this->success('修改成功') : $this->error('修改失败');
		} else {
			return $this->fetch();
		}

	}
	/**
	 *收货地址
	 **/
	public function address() {
		$map['uid'] = UID;
		$list       = \think\Db::name('ConsigneeAddress')->where($map)->select();
		$this->assign('member_title', '收货地址');
		$this->assign('_list', $list);
		return $this->fetch('consigneeaddress');
	}
	/**
	 *邮箱激活
	 **/
	public function emailactivate($yz = '') {
		$uinfo = $this->uinfo;
		if (empty($yz)) {
			$yzm = ainiku_ucenter_md5($uinfo['username'] . $uinfo['password'] . date('Y/m/d H:i:s'));
			$url = C('WEBDOMIN') . url("Member/emailactivate", array('yz' => $yzm));
			$str = <<<eot
		此链接10分钟内有效
		<a target="_blank" href="{$url}">点击以激活邮箱</a>或复制这个链接并打开
		{$url}
eot;
			$result = send_mail(array(
				'to'       => $uinfo['email'],
				'toname'   => $uinfo['email'],
				'subject'  => C('WEB_SITE_TITLE') . '的邮件验证', //主题标题
				'fromname' => C('WEB_SITE_TITLE'),
				'body'     => $str . date('Y/m/d H:i:s'), //邮件内容
				//'attachment'=>'E:\SVN\frame\DataBak\20141126-003119-1.sql.gz'

			));
			if ($result) {
				S('emailactivate' . UID, $yzm, 600);
				$this->success('激活邮件已经发送成功!');
			} else {
				$this->error('邮件发送失败!');
			}
		} else {
			if ($yz === S('emailactivate' . UID)) {
				S('emailactivate' . UID, null);
				M('Member')->where("member_id=" . UID)->save(array('email_activate' => 1));
				$this->success('邮箱验证成功!', url('Member/portal'));
			} else {
				$this->success('邮箱验证失败!', url('Member/portal'));
			}
		}
	}
}

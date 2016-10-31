<?php
namespace app\admin\controller\sys;

class Notice extends Base {

	/**
	 * 测试发送邮件
	 * **/
	public function testEmail($type = 'img') {
		if ($this->request->isAjax()) {
			$conf = array(
				'host'      => config('mail_smtp_host'),
				'port'      => config('mail_smtp_port'),
				'username'  => config('mail_smtp_user'),
				'password'  => config('mail_smtp_pwd'),

				'fromname'  => config('mail_smtp_fromname'), //发件人
				'fromemail' => config('mail_smtp_fromemail'),
				'toemail'   => config('mail_smtp_receiveemail'),
				'toname'    => config('mail_smtp_receiveemail'),
				'subject'   => config('mail_smtp_subject'), //主题标题

				'body'      => config('mail_smtp_test'), //邮件内容
			);
			$result = send_mail($conf);
			if ($result === true) {
				add_user_log("发送测试邮件", input('param.'));
				$this->success('邮件发送成功!', '');
			} else {
				$this->error($result);
			}
		} else {
			$this->error('非法访问');
		}
	}
}

<?php
namespace app\index\controller;

class Index extends Base {
	public function index() {
		create_qrcode('测试内asdfasdfasf容asd 中中中中中中吕国国 ；中是日 ； 日', 150, 'd:/logo.png');
		// $phpexcel  = new \PHPExcel();
		// $objReader = \PHPExcel_IOFactory::createReader('Excel5');
		// dump($objReader);
		// config('template.view_path', 'default');
		// $this->view->config('view_path', 'default');
		// dump(config(''));
		// dump(get_article_list());

		// $conf = array(
		// 	'host'      => config('mail_smtp_host'),
		// 	'port'      => config('mail_smtp_port'),
		// 	'username'  => config('mail_smtp_user'),
		// 	'password'  => config('mail_smtp_pwd'),

		// 	'fromname'  => config('mail_smtp_fromname'), //发件人
		// 	'fromemail' => config('mail_smtp_fromemail'),
		// 	'toemail'   => config('mail_smtp_receiveemail'),
		// 	'toname'    => config('mail_smtp_receiveemail'),
		// 	'subject'   => config('mail_smtp_subject'), //主题标题

		// 	'body'      => config('mail_smtp_test'), //邮件内容
		// );
		// dump($conf);
		// $result = send_mail($conf);
		// if ($result === true) {
		// 	echo 'send mail success';
		// } else {
		// 	echo $result;
		// }
		return $this->fetch();
	}
}

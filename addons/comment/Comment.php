<?php
/**
 * 留言前台调用控制器
 */
namespace addons\comment;
class Comment extends \app\common\controller\Addon {

	//钩子默认的调用方法
	public function run($arc_id = 0) {
		$this->add($arc_id);
	}
	public function ajaxlist($arc_id = 0, $pid = 0) {
		// empty($arc_id)&&die('没有评论');
		$map['status'] = 1;
		$map['pid']    = $pid;
		$map['arc_id'] = input('get.arc_id');
		$list          = $this->pages(array(
			'model' => 'PluginComments',
			'where' => $map,
			'order' => 'create_time desc',
			'rows'  => 2,
		));
		if (empty($list)) {
			die('没有评论');
		} else {
			$this->assign('_list', $list);
			$this->_page = preg_replace('/href\=\"(.*?)\"/i', 'href="javascript:;" data-url="$1"', $this->_page);
			$info        = $this->fetch('index_ajaxlist');
			$this->ajaxreturn(array('status' => 1, 'data' => $info));
		}
		die();
	}
	public function gettree($pid = 0) {
		if ($pid === 0) {return '';}
		$info          = M('PluginComments')->field('name')->find($pid);
		$map['pid']    = $pid;
		$map['status'] = 1;
		$list          = M('PluginComments')->where($map)->order('create_time desc')->select();
		$this->assign('pname', $info['name']);
		$this->assign('_list', $list);
		if (empty($list)) {
			echo '';
		} else {
			echo $this->fetch('index_tree');
		}

	}
	public function add($arc_id = 0) {

		if (request()->isPost()) {
			$verify = input('verify');
			if (empty($verify)) {$this->error('请输入验证码!');}
			if (!check_verify($verify)) {
				$this->error('验证码输入错误！');
			}
			$model = new \Plugins\Comments\PluginCommentsModel();
			if ($model->create()) {
				$model->url = preg_replace('/http\:\/\//i', '', $model->url);
				cookie('comment_name', $model->name, 3600 * 24 * 365);
				cookie('comment_email', $model->email, 3600 * 24 * 365);
				cookie('comment_url', $model->url, 3600 * 24 * 365);
				$result = $model->add();
				if (0 < $result) {
					$list[] = M('PluginComments')->find($result);
					$this->assign('_list', $list);
					$str = $this->fetch('ajaxlist');
					//检测发送邮件
					$this->sendemail();
					$this->success(array(
						'content' => $str,
						'msg'     => '留言成功',
						'pid'     => input('post.pid'),
					));
				} else {
					$this->error('留言失败');
				}
			} else {
				$this->error($model->geterror());
			}
		} else {
			reg_css('addon/comment/css/comment');
			reg_js('addon/comment/js/comment');
			//取插件配置参数
			$data = cache('plugin_comment');
			if (empty($conf) || APP_DEBUG) {
				$data = $this->getParam();
				cache('plugin_comment', $data);
			}
			$this->assign('arc_id', $arc_id);
			$this->assign('conf', $data);
			// dump(\assets\Assets::getInstance());
			// dump(\assets\Assets::getInstance()->getSource('CSS'));
			echo $this->fetch('index_add');
		}
	}
	/**
	 * 有留言时回复
	 * @return [type]       [description]
	 */
	private function sendemail() {
		$pid = input('post.pid', 0);
		$url = C('WEBDOMIN') . "/article/{$rows['arc_id']}.html";
		//给站长发邮件
		$site_email = C('SITE_EMAIL');
		$site_title = C('WEB_SITE_TITLE');
		if (!empty($site_email)) {
			$result = send_mail(array(
				'to'       => $site_email,
				'toname'   => $site_title . '站长你好',
				'subject'  => "你有一条最新留言 ( $site_title )",
				'fromname' => $site_title,
				'body'     => "文章留言链接 <a target='_blank' href='$url'>点击查看: $url</a>",

			));
		}
		//给被回复的人发邮件
		if ($pid != 0) {
			$rows = M('PluginComments')->field('name,arc_id,email,email_notify')->find($pid);
			if (empty($rows) || empty($rows['email'])) {
				return;
			} else {
				if ($rows['email_notify'] != '1') {
					return;
				}
				$result = send_mail(array(
					'to'       => $rows['email'],
					'toname'   => '你好' . $rows['name'],
					'subject'  => '你好' . $rows['name'] . ': 赵克立博客有您的留言回复',
					'fromname' => $site_title,
					'body'     => "回复链接 <a target='_blank' href='$url'>点击查看回复: $url</a>",

				));
				if ($result !== true) {
					\Think\log::write('留言发送发送邮件时出错:' . $result, 'WARN');
				}
			}
		}
	}

	public function redirect($url, $params = array(), $delay = 0, $msg = '') {
		$url = input('url');
		empty($url) ? ($url = C('WEBDOMIN')) : ($url = ainiku_decrypt($url));
		$url = preg_replace('/http\:\/\//i', '', $url);
		redirect('http://' . $url);
		die('');
	}

}
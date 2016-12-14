<?php
/**
 * 留言前台调用控制器
 */
namespace addons\comment;
if (!class_exists('\addons\comment\Comment')) {
	class Comment extends \app\common\controller\Addon {

		//钩子默认的调用方法
		public function run($arc_id = 0) {
			$this->add($arc_id);
		}
		public function ajaxlist($arc_id = 0, $pid = 0) {
			// empty($arc_id)&&die('没有评论');
			$map['status'] = 1;
			$map['pid']    = $pid;
			$map['arc_id'] = input('param.arc_id', 0);
			$data          = $this->pages(array(
				'table' => 'AddonComment',
				'where' => $map,
				'order' => 'create_time desc',
				'rows'  => 2,
			));
			// var_dump($map);
			if (empty($data[0])) {
				die('没有评论');
			} else {
				$this->assign([
					'_list' => $data[0],
					'_page' => preg_replace('/href\=\"(.*?)\"/i', 'href="javascript:;" data-url="$1"', $data[1]),
				]);
				$info = $this->fetch('index_ajaxlist');
				// dump(['status' => 1, 'data' => $info]);
				return json(['status' => 1, 'data' => $info]);
			}
			die();
		}
		public function gettree($pid = 0) {
			if ($pid === 0) {return '';}
			// $info          = M('PluginComments')->field('name')->find($pid);
			$info          = $this->getParam();
			$map['pid']    = $pid;
			$map['status'] = 1;
			$list          = \think\Db::name('AddonComment')->where($map)->order('create_time desc')->select();
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
				$verify = input('param.verify');
				if (empty($verify)) {$this->error('请输入验证码!');}
				if (!check_verify($verify)) {
					$this->error('验证码输入错误！');
				}
				include SITE_PATH . '/addons/comment/validate/Comment.php';
				$name         = input('param.name', '');
				$email        = input('param.email', '');
				$url          = input('param.url', '');
				$content      = input('param.content', '', 'htmlspecialchars');
				$pid          = input('param.pid', 0);
				$arc_id       = input('param.arc_id', 0);
				$email_notify = input('param.email_notify', 1);
				$data         = [
					'pid'          => $pid,
					'arc_id'       => $arc_id,
					'email_notify' => $email_notify,
					'name'         => $name,
					'email'        => $email,
					'url'          => $url,
					'content'      => $content,
					'create_time'  => time(),
				];
				$vali = new \addons\comment\validate\Comment();
				if ($vali->check($data)) {
					$data['url'] = preg_replace('/http\:\/\//i', '', $data['url']);
					cookie('comment_name', $name, 3600 * 24 * 365);
					cookie('comment_email', $email, 3600 * 24 * 365);
					cookie('comment_url', $url, 3600 * 24 * 365);
					$result = \think\Db::name('AddonComment')->insertGetId($data);
					if (0 < $result) {
						$data['comment_id'] = $result;
						$list[]             = $data;
						$this->assign('_list', $list);
						$str = $this->fetch('index_ajaxlist');
						//检测发送邮件
						// $this->sendemail();

						$this->success('留言成功', '', ['content' => $str, 'pid' => input('param.pid')]);

					} else {
						$this->error('留言失败');
					}
				} else {
					$this->error($vali->getError());
				}
			} else {
				reg_css('addon/comment/css/comment');
				reg_js('addon/comment/js/comment');
				//取插件配置参数
				$data = $this->getParam();
				// if (empty($conf) || config('app_debug')) {
				// 	$data = $this->getParam();
				// 	cache('plugin_comment', $data);
				// }
				// dump($arc_id);
				// die();
				$this->assign('arc_id', $arc_id);
				$this->assign('conf', $data);
				// dump(\ank\Assets::getInstance());
				// dump(\ank\Assets::getInstance()->getSource('CSS'));
				echo $this->fetch('index_add');
			}
		}
		/**
		 * 有留言时回复
		 * @return [type]       [description]
		 */
		private function sendemail() {
			$pid = input('post.pid', 0);
			$url = config('web_domain') . "/article/{$rows['arc_id']}.html";
			//给站长发邮件
			$site_email = config('SITE_EMAIL');
			$site_title = config('WEB_SITE_TITLE');
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

		public function reurl() {
			$url = input('url');
			empty($url) ? ($url = config('WEBDOMIN')) : ($url = ank_decrypt($url));
			$url = preg_replace('/http\:\/\//i', '', $url);
			$this->redirect('http://' . $url);
			// die('$url');
		}

	}
}
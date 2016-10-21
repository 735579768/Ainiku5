<?php
/**
 * 留言后台调用控制器
 */
namespace addons\comment;
class CommentAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => 'zhaokeli',
		'title'   => '留言评论',
		'descr'   => '留言',
		'param'   => []
	);

	public function install() {
		$prefix = config('database.prefix');
		$sql    = <<<sql
				DROP TABLE IF EXISTS `{$prefix}addon_comment`;
				CREATE TABLE `{$prefix}addon_comment` (
				  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
				  `pid` int(11)  NULL DEFAULT 0 ,
				  `arc_id` int(11)  NULL DEFAULT 0 ,
				  `title` varchar(255) DEFAULT NULL,
				  `content` varchar(255) DEFAULT NULL,
				  `name` varchar(255) DEFAULT NULL,
				  `mobile` varchar(255) DEFAULT NULL,
				  `email` varchar(255) DEFAULT NULL,
				  `url` varchar(255) DEFAULT NULL,
				  `qq` varchar(255) DEFAULT NULL,
				  `status` tinyint(1)  NULL DEFAULT 1 ,
				  `email_notify` tinyint(1)  NULL DEFAULT 1 ,
				  `ip` varchar(255) DEFAULT NULL,
				  `location` varchar(255) DEFAULT NULL,
				  `create_time` int(11) DEFAULT NULL,
				  PRIMARY KEY (`comment_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;
sql;
		$arr = explode(';', $sql);
		foreach ($arr as $val) {
			if (!empty($val)) {
				\think\Db::execute($val);
			}

		}
		return true;
	}
	public function lis() {
		$name = input('name');
		// $map['name'] = array('like', '%' . $name . '%');
		$map['status'] = array('egt', 0);
		$this->pages(array(
			'table' => 'AddonComment',
			'where' => $map,
			'order' => 'status asc,comment_id desc',
		));
		$this->assign([
			'meta_title' => "留言列表",
		]);
		echo $this->fetch('admin_lis');
	}

	public function check() {
		$id = input('param.comment_id');
		empty($id) && die('ID不能为空');
		$data = \think\Db::name('AddonComment')->where('comment_id', $id)->find();
		$this->assign([
			'meta_title' => "查看留言",
			'info'       => $data,
		]);
		echo $this->fetch('admin_check');
	}
	function delete() {
		$id = input('param.comment_id');
		if (empty($id)) {
			$this->error('请先进行选择');
		}

		$result = \think\Db::name('AddonComment')
			->where("comment_id", "in", $id)->delete();
		if ($result) {
			$this->success('已经彻底删除');
		} else {
			$this->error('操作失败');
		}
	}
	function clearUp() {
		$result = \think\Db::name('AddonComment')
			->where("1=1")->delete();
		if ($result) {
			$this->success('已经清空', url('lis'));
		} else {
			$this->error('操作失败');
		}
	}
	public function uninstall() {
		$prefix = config('database.prefix');
		$sql    = <<<sql
						DROP TABLE IF EXISTS `{$prefix}addon_comment`;
sql;
		$arr = explode(';', $sql);
		foreach ($arr as $val) {
			if (!empty($val)) {
				\think\Db::execute($val);
			}

		}
		return true;
	}
	public function config() {
		$this->meta_title = '留言设置';
		if (request()->isPost()) {
			$this->saveParam();
		} else {
			$formarr = [
				[
					'type'    => 'radio',
					'name'    => 'nickname',
					'title'   => '姓名',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '1',
					'is_show' => 3,
				],
				[
					'type'    => 'radio',
					'name'    => 'email',
					'title'   => '邮箱',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '1',
					'is_show' => 3,
				],
				[
					'type'    => 'radio',
					'name'    => 'address',
					'title'   => '地址',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '1',
					'is_show' => 3,
				],
			];
			$this->assign([
				'formarr' => $formarr,
				'data'    => $this->getParam(),
			]);
			echo $this->fetch('comment/admin_set');
		}
	}
	/**
	 * 后台菜单调用的入口
	 */
	public function set() {
		$this->lis();
	}
}
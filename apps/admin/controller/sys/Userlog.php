<?php
namespace app\admin\controller\sys;

class Userlog extends Base {

	/**
	 * 用户日志列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '用户日志列表');
		$this->pages([
			'table' => 'UserLog',
			// 'where' => ['a.status' => ['gt', -1]],
			'join'  => [
				['__USER__ b', 'a.uid=b.user_id'],
				['__USER_GROUP__ c', 'b.user_group_id=c.user_group_id'],
			],
			'field' => 'a.*,b.username,b.nickname,c.title',
			'order' => 'user_log_id desc',
		]);
		return $this->fetch();
	}

	/**
	 * 清空用户日志回收站
	 * @return [type] [description]
	 */
	public function clearUp() {
		// return controller('Data', 'logic')->clearUp('UserLog');
		// $table || $this->error('数据表为空!');

		$result = \think\Db::name('UserLog')
			->where('1=1')
			->delete();
		add_user_log("清空日志", input('param.'));
		$this->returnResult($result, '日志已经清空', '没有数据被清理');
	}

	/**
	 * 彻底删除用户日志
	 * @return [type] [description]
	 */
	public function delete() {
		return controller('Data', 'logic')->delete('UserLog');
	}
	/**
	 * 查看日志
	 * @return [type] [description]
	 */
	public function checkLog() {
		$user_log_id = input('param.user_log_id', 0);
		if (!$user_log_id) {
			die('error');
		} else {
			$info = \think\Db::name('UserLog')->where(['user_log_id' => $user_log_id])->field('json_data')->find();
			$str  = dump(json_decode($info['json_data'], true), false);
			echo "<div style='padding:10px;'>{$str}</div>";
		}
	}
}

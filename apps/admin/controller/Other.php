<?php
namespace app\admin\controller;

class Other extends Base {
	/* 退出登录 */
	public function loginOut() {
		if (is_login()) {
			session(null);
			cookie(null);
			$this->success('退出成功！', url('Pub/login'));
		} else {
			$this->redirect(url('Pub/login'));
		}
	}

	/**
	 * 清空系统缓存目录
	 * **/
	public function clearCache($type = 'img') {
		$arr = array();

		$arr[] = del_all_file(RUNTIME_PATH);
		//运行时目录缓存
		if (is_array($arr)) {
			//统计缓存大小
			$siz = 0;
			foreach ($arr as $aa) {
				foreach ($aa as $aaa) {
					$siz += $aaa['size'];
				}
			}
			$this->success("缓存已经清理完成,共计 " . ($siz / 1000) . " k", '', 6);
		}
	}
}

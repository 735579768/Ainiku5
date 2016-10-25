<?php
namespace app\admin\controller\sys;

class Other extends Base {
	/* 退出登录 */
	public function loginOut() {
		if (is_login()) {
			add_user_log("退出登陆", input('param.'));
			session(null, config('session.prefix'));
			cookie(null, config('cookie.prefix'));
			$this->success('退出成功！', url('Pub/login'));
		} else {
			$this->redirect(url('Pub/login'));
		}
	}

	/**
	 * 清空系统缓存目录
	 * **/
	public function clearCache($type = 'img') {
		add_user_log("清理缓存", input('param.'));
		$arr      = array();
		$jscss    = SITE_PATH . config('greate_cache_path.jscss') . '/';
		$imgcache = SITE_PATH . config('greate_cache_path.imgcache') . '/';
		// dump($jscss);
		// dump($imgcache);
		// dump(RUNTIME_PATH);
		$arr[] = del_all_file(RUNTIME_PATH);
		$arr[] = del_all_file($jscss);
		$arr[] = del_all_file($imgcache);
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

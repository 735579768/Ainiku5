<?php
namespace app\common\controller;
use think\Request;

/**
 * 模块共用空控制器
 */
class Error extends \think\Controller {
	public function _empty() {
		return $this->index();
	}
	public function index() {
		//不存在的控制器就当成插件去调用
		//根据当前控制器名来判断要执行那个城市的操作
		return \app\common\controller\Addon::runAddonMethod(request()->controller() . '/' . request()->action());
		// /**
		//  * 找不到的控制器就当成是扩展来加载
		//  * @var string
		//  */
		// $info = \think\Db::name('Addon')->field('addon_id')->where('name', strtolower($controllerName))->find();
		// if (!$info) {
		// 	if (config('app_debug')) {
		// 		// 使用think自带异常类抛出异常
		// 		$errstr = "无法找到插件或控制器:{$controllerName}/{$actionName}";
		// 		throw new \think\Exception($errstr, 100006);
		// 	} else {
		// 		throw new \think\exception\HttpException(404, '页面不存在');
		// 		// abort(404, '页面不存在');
		// 		// $this->assign('static_dir', STATIC_DIR);
		// 		// return $this->fetch(APP_PATH . 'common/view/404.html');
		// 	}
		// }
		//插件已经安装的情况
		// $name = "\\addons\\" . strtolower($controllerName) . "\\" . ucfirst($controllerName);
		// if (strtolower(request()->module()) == 'admin') {
		// 	if (!is_login()) {
		// 		$this->redirect(url('pub/login'));
		// 	}
		// 	$name .= "Admin";
		// }

		// $cpath = str_replace('\\', '/', SITE_PATH . $name . '.php');
		// // dump($cpath);
		// if (file_exists($cpath)) {
		// 	include $cpath;
		// 	if (class_exists($name)) {
		// 		$addon = new $name();
		// 		// return $addon->$actionName();
		// 		if (method_exists($addon, $actionName)) {
		// 			return $addon->$actionName();
		// 			// exit();
		// 		} else {
		// 			$errstr = "无法找到插件类{$controllerName}的方法:{$actionName}";
		// 			throw new \think\Exception($errstr, 100006);
		// 		}
		// 	} else {
		// 		$errstr = "无法找插件类:{$controllerName}";
		// 		throw new \think\Exception($errstr, 100006);
		// 	}

		// } else {
		// 	//插件已经安装但文件丢失
		// 	if (config('app_debug')) {
		// 		// 使用think自带异常类抛出异常
		// 		$errstr = "无法找到插件或控制器:{$controllerName}/{$actionName}";
		// 		throw new \think\Exception($errstr, 100006);
		// 	} else {
		// 		$this->assign('static_dir', STATIC_DIR);
		// 		return $this->fetch(APP_PATH . 'common/view/404.html');
		// 	}
		// }

	}

}
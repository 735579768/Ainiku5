<?php
namespace app\common\controller;
use think\Request;

/**
 * 模块共用空控制器
 */
class Error {
	public function index(Request $request) {
		//根据当前控制器名来判断要执行那个城市的操作
		$controllerName = $request->controller();
		$actionName     = $request->action();
		// 使用think自带异常类抛出异常
		$errstr = "无法找到控制器:{$controllerName}/{$actionName}";
		throw new \think\Exception($errstr, 100006);
	}

}
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
		return "当前控制器{$controllerName}/{$actionName}";
	}

}
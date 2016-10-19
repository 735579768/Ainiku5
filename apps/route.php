<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 完整域名绑定到admin模块
// \think\Route::domain('ainiku5.loc', 'admin');
return [
	//域名绑定
	'__domain__'            => [
		''     => 'admin',
		//后台
		'user' => 'admin',
		//前台
		'www'  => 'index',
		// 泛域名规则建议在最后定义
		// '*.user' => 'user',
		// '*'      => 'book',
	],
	'__pattern__'           => [
		'name' => '\w+',
	],
	'[hello]'               => [
		':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
		':name' => ['index/hello', ['method' => 'post']],
	],

	'/'                     => 'index', // 首页访问路由
	'my'                    => 'Article/detail', // 静态地址路由
	'blog/:id'              => 'Blog/read', // 静态地址和动态地址结合
	'new/:year/:month/:day' => 'News/read', // 静态地址和动态地址结合
	':user/:blog_id'        => 'Blog/read', // 全动态地址

];

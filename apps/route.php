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
//加载调试文件
if (file_exists(SITE_PATH . '/debug.php')) {
	$conf = include SITE_PATH . '/debug.php';
	if (isset($conf['route'])) {
		return $conf['route'];
	}
}
return [
	//域名绑定
	'__domain__'          => [
		//后台
		'user' => 'admin',
		//前台
		'www'  => 'home',
		// 泛域名规则建议在最后定义
		// '*.user' => 'user',
		// '*'      => 'book',
	],
	'__pattern__'         => [
		'name' => '\w+',
	],
	// '[hello]'               => [
	// 	':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
	// 	':name' => ['index/hello', ['method' => 'post']],
	// ],

		//博客路由
		'cat/:fenlei'         => 'home/article/index',
		'fenlei/:fenlei/p/:p' => 'home/article/index',
		'tag/:tagid'          => 'home/article/taglist',
		'p/:p'                => 'home/index/index',
		'article/:article_id' => 'home/article/detail', // 静态地址路由
		'color/tiaose'=>'home/tool/tiaose',
		'format/index'=>'home/tool/css',

		'alist/:category_id'  => 'home/article/index',
		'glist/:category_id'  => 'home/goods/index',
		'adetail/:article_id' => 'home/article/detail', // 静态地址路由
		'gdetail/:goods_id'   => 'home/goods/detail', // 静态地址路由
		// 'blog/:id'              => 'blog/read', // 静态地址和动态地址结合
		// 'new/:year/:month/:day' => 'news/read', // 静态地址和动态地址结合
		// ':user/:blog_id'        => 'blog/read', // 全动态地址
	// 'alist/:category_id'  => 'article/index',
	// 'glist/:category_id'  => 'goods/index',
	// 'adetail/:article_id' => 'article/detail', // 静态地址路由
	// 'gdetail/:goods_id'   => 'goods/detail', // 静态地址路由
	// 'blog/:id'              => 'blog/read', // 静态地址和动态地址结合
	// 'new/:year/:month/:day' => 'news/read', // 静态地址和动态地址结合
	// ':user/:blog_id'        => 'blog/read', // 全动态地址

];
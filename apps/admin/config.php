<?php
//配置文件
return [
	// 扩展函数文件
	// 'extra_file_list'  => [THINK_PATH . 'helper' . EXT, APP_PATH . 'form.php', APP_PATH . 'form.php'],
	// +----------------------------------------------------------------------
	// | 会话设置
	// +----------------------------------------------------------------------

	'session'           => [
		'id'             => '',
		// SESSION_ID的提交变量,解决flash上传跨域
		'var_session_id' => '',
		// SESSION 前缀
		'prefix'         => 'ank_admin_',
		// 驱动方式 支持redis memcache memcached
		'type'           => '',
		// 是否自动开启 SESSION
		'auto_start'     => true,
	],

	// +----------------------------------------------------------------------
	// | Cookie设置
	// +----------------------------------------------------------------------
	'cookie'            => [
		// cookie 名称前缀
		'prefix'    => 'ank_admin_',
		// cookie 保存时间
		'expire'    => 0,
		// cookie 保存路径
		'path'      => '/',
		// cookie 有效域名
		'domain'    => '',
		//  cookie 启用安全传输
		'secure'    => false,
		// httponly设置
		'httponly'  => '',
		// 是否使用 setcookie
		'setcookie' => true,
	],
	// 视图输出字符串内容替换
	'view_replace_str'  => [
		'__STATIC__' => '/public/static',
		'__IMG__'    => '/public/admin/images',
		'__CSS__'    => '/public/admin/css',
		'__JS__'     => '/public/admin/js',
	],
	//后台菜单
	'admin_custom_menu' => [
		'默认'       => [
			['title' => '系统首页', 'url' => 'Index/index'],
			['title' => '网站设置', 'url' => 'sys.config/group'],
			['title' => '导航列表', 'url' => 'Nav/index'],
			['title' => '文章列表', 'url' => 'Article/index'],
			['title' => '单页列表', 'url' => 'Single/index'],
			['title' => '产品列表', 'url' => 'Goods/index'],
			['title' => '广告位列表', 'url' => 'Modulepos/index'],
			['title' => '用户列表', 'url' => 'Member/index'],
			['title' => '用户组列表', 'url' => 'Membergroup/index'],
		],
		'系统分类' => [
			['title' => '文章分类', 'url' => 'Category/index?category_type=article'],
			['title' => '产品分类', 'url' => 'Category/index?category_type=goods'],
		],

	],
];
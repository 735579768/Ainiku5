<?php
//配置文件
return [
	// 扩展函数文件
	// 'extra_file_list'  => [THINK_PATH . 'helper' . EXT, APP_PATH . 'form.php', APP_PATH . 'form.php'],
	// +----------------------------------------------------------------------
	// | 会话设置
	// +----------------------------------------------------------------------

	'session'          => [
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
	'cookie'           => [
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
	'view_replace_str' => [
		'__STATIC__' => '/public/static',
		'__IMG__'    => '/public/admin/images',
		'__CSS__'    => '/public/admin/css',
		'__JS__'     => '/public/admin/js',
	],
];
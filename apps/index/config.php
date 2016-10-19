<?php
//配置文件
return [
	// 视图输出字符串内容替换
	'view_replace_str' => [
		'__STATIC__' => STATIC_DIR . '/static',
		'__IMG__'    => STATIC_DIR . '/index/images',
		'__CSS__'    => STATIC_DIR . '/index/css',
		'__JS__'     => STATIC_DIR . '/index/js',
	],
	// 'template'         => [
	// 	'view_path' => 'default/',
	// ],
];
<?php
return [
	// 应用调试模式
	'app_debug' => true,
	// 应用Trace
	'app_trace' => true,
	'template'  => [
		// 模板引擎类型 支持 php think 支持扩展
		'type'            => 'Think',
		// 模板路径
		'view_path'       => '',
		// 模板后缀
		'view_suffix'     => 'html',
		// 模板文件名分隔符
		'view_depr'       => DS,
		// 模板引擎普通标签开始标记
		'tpl_begin'       => '{',
		// 模板引擎普通标签结束标记
		'tpl_end'         => '}',
		// 标签库标签开始标记
		'taglib_begin'    => '{',
		// 标签库标签结束标记
		'taglib_end'      => '}',
		// 是否去除模板文件里面的html空格与换行
		'strip_space'     => false,
		// 是否开启模板编译缓存,设为false则每次都会重新编译
		'tpl_cache'       => false,
		// 预先加载的标签库
		'taglib_pre_load' => '\app\common\taglib\Ank',
		'taglib_build_in' => 'cx,\app\common\taglib\Ank',
	],
	'database'  => [
		// 数据库类型
		'type'           => 'mysql',
		// 服务器地址
		'hostname'       => 'mysql.loc',
		// 数据库名
		'database'       => 'ainiku5',
		// 用户名
		'username'       => 'root',
		// 密码
		'password'       => 'adminrootkl',
		// 端口
		'hostport'       => '3306',
		// 连接dsn
		'dsn'            => '',
		// 数据库连接参数
		'params'         => [],
		// 数据库编码默认采用utf8
		'charset'        => 'utf8',
		// 数据库表前缀
		'prefix'         => 'kl_',
		// 数据库调试模式
		'debug'          => true,
		// 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
		'deploy'         => 0,
		// 数据库读写是否分离 主从式有效
		'rw_separate'    => false,
		// 读写分离后 主服务器数量
		'master_num'     => 1,
		// 指定从服务器序号
		'slave_no'       => '',
		// 是否严格检查字段是否存在
		'fields_strict'  => true,
		// 数据集返回类型 array 数组 collection Collection对象
		'resultset_type' => 'array',
		// 是否自动写入时间戳字段
		'auto_timestamp' => true,
		// 是否需要进行SQL性能分析
		'sql_explain'    => false,
	],
];

<?php
return [
	// 默认模块名
	'default_module'    => 'index',
	// 应用调试模式
	'app_debug'         => false,
	// 应用Trace
	'app_trace'         => true,
	// 域名部署,此配置开启后生成的url地址会带有域名
	'url_domain_deploy' => true,
	'route'             => [
		//域名绑定
		'__domain__'          => [
			//后台
			'user' => 'admin',
			//前台
			'www'  => 'index',
			// 泛域名规则建议在最后定义
			// '*.user' => 'user',
			// '*'      => 'book',
		],
		'__pattern__'         => [
			'name' => '\w+',
		],
		//路由分组
		// '[hello]'               => [
		// 	':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
		// 	':name' => ['index/hello', ['method' => 'post']],
		// ],
		//原路由
		// 'blog/:id'   => ['Blog/read', ['method' => 'get'], ['id' => '\d+']],
		// 'blog/:name' => ['Blog/read', ['method' => 'post']],

		'cat/:fenlei'         => 'home/article/index',
		'fenlei/:fenlei/p/:p' => 'home/article/index',
		'tag/:tagid'          => 'home/article/taglist',
		'p/:p'                => 'home/index/index',
		'article/:article_id' => 'home/article/detail', // 静态地址路由
		'color/tiaose'        => 'home/tool/tiaose',
		'format/index'        => 'home/tool/css',

		'alist/:category_id'  => 'home/article/index',
		'glist/:category_id'  => 'home/goods/index',
		'adetail/:article_id' => 'home/article/detail', // 静态地址路由
		'gdetail/:goods_id'   => 'home/goods/detail', // 静态地址路由
		// 'blog/:id'              => 'blog/read', // 静态地址和动态地址结合
		// 'new/:year/:month/:day' => 'news/read', // 静态地址和动态地址结合
		// ':user/:blog_id'        => 'blog/read', // 全动态地址

	],
	'template'          => [
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
	'database'          => [
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

<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
define('ACCESS_ROOT', true);
//站点入口文件根路径
define('SITE_PATH', __DIR__);
define('APP_DEBUG', true);
// 定义应用目录
define('APP_PATH', __DIR__ . '/apps/');
// 绑定当前访问到模块
define('BIND_MODULE', 'admin');

//应用运行时目录
define('RUNTIME_PATH', SITE_PATH . '/data/runtime/');
//扩展目录位置
define('EXTEND_PATH', SITE_PATH . '/vendor/extend/');
define('STATIC_DIR', '/public');
// 加载框架引导文件
require __DIR__ . '/tp5/start.php';

::使用下面的指令生成类库映射文件，提高系统自动加载的性能。
php think optimize:autoload
::如果你的应用定义了比较多的路由规则，可以使用下面的指令生成路由缓存文件，提高系统的路由检测的性能。
php think optimize:route
::可以为应用或者模块生成配置缓存文件
php think optimize:config
::可以通过生成数据表字段信息缓存，提升数据库查询的性能，避免多余的查询。命令如下：
php think optimize:schema
pause
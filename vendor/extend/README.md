thinkphp5 扩展第三方库目录

类的命名规范遵循PSR-2及PSR-4规范，例如，如果有一个扩展类库的命名空间是 first.second.Foo，类定义如下：

namespace first\second;

class Foo
{
}

那么实际的类文件位置应该是：

extend/first/second/Foo.php

使用first.second.Foo类的时候，直接实例化即可使用，例如：

$foo = new \first\second\Foo();
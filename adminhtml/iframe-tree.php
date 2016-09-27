<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>管理后台</title>
    <meta name="keywords" content="管理后台" />
    <meta name="description" content="管理后台" />
    <?php include "./include/head.php";?>
</head>

<body>
    <div class="iframe-con">
            <?php include "./include/main-title.php";?>
        <!--按钮和搜索区域-->
        <div class="tool-area cl">
            <?php include "./include/btn-tool.php";?>
            <?php include "./include/search-tool.php";?>
        </div>

        <div class="cate-tree">
            <dl class="c-h-item cl">
                <dt class="cl">
                    <div class="c-inp c-h-ico">折叠</div>
                    <div class="c-inp c-h-id">ID</div>
                    <div class="c-inp c-h-paixu">排序</div>
                    <div class="c-inp c-h-title">标题</div>
                    <div class="c-inp c-h-action">操作</div>
                </dt>
            </dl>
            <dl class="c-item cl">
                <dt class="cl">
                    <div class="c-inp c-ico"><i class="fa fa-plus-square-o"></i></div>
                    <div class="c-inp c-id">46</div>
                    <div class="c-inp c-paixu">
                        <input type="text" class="form-control" name="paixu" value="88" />
                    </div>
                    <div class="c-inp c-title">
                    <i class="fa fa-plus-square"></i>
                    <input type="text" class="form-control" name="title" value="分类标题" />
                    </div>
                    <div class="c-inp c-action">
                        <a href="javascript:;" class="btn">编辑</a>
                        <a href="javascript:;" class="btn btn-warning">删除</a>
                    </div>
                </dt>
            </dl>
        </div>
    </div>
</body>

</html>

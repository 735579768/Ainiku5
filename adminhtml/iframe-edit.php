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
        <!--主标题-->
            <?php include "./include/main-title.php";?>
        <!--添加编辑内容区域-->

        <div class="from-block">
            <form class="autosubmit" action="/kefu.php?m=Admin&amp;c=Menu&amp;a=edit" method="post">
                <div class="form-group cl pid">
                    <div class="form-label"><b class="form-title">所属的上级分类</b><span class="form-tip"></span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <select name="pid" class="form-control input-middle">
                            <option value="0">请选择----</option>
                            <option value="1454">爱情说说</option>
                            <option value="84">其它说说</option>
                            <option value="85">个性说说</option>
                            <option value="80">QQ说说</option>
                            <option value="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━━搞笑说说</option>
                            <option value="506">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━━情侣说说</option>
                            <option value="740">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━━励志说说</option>
                            <option value="932">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━━空间说说</option>
                            <option value="1634">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━━经典说说</option>
                            <option value="1">QQ签名</option>
                            <option value="67">其它分类</option>
                        </select>
                    </div>
                </div>
                <div class="form-group cl name">
                    <div class="form-label"><b class="form-title">分类标识符</b><span class="form-tip">用于生成分类友好地址'</span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="form-wrap">
                            <div class="autoyz-wrap" style="position:relative;display:inline-block;">
                                <input type="text" class="form-control input-large  autoyz" data-reg="^.+?$" data-ts="此项为必填项" data-ok="格式正确" data-err="内容不能为空" placeholder="请输入分类标识符" name="name" value="other"><span></span></div>
                        </div>
                    </div>
                </div>
                <div class="form-group cl title">
                    <div class="form-label"><b class="form-title">分类名称</b><span class="form-tip"></span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="form-wrap">
                            <div class="autoyz-wrap" style="position:relative;display:inline-block;">
                                <input type="text" class="form-control input-large  autoyz" data-reg="^.+?$" data-ts="此项为必填项" data-ok="格式正确" data-err="内容不能为空" placeholder="请输入分类名称" name="title" value="其它说说"><span></span></div>
                        </div>
                    </div>
                </div>
                <div class="form-group cl list_tpl">
                    <div class="form-label"><b class="form-title">分类列表页模板</b><span class="form-tip">list_tpl</span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="form-wrap">
                            <div class="autoyz-wrap" style="position:relative;display:inline-block;">
                                <input type="text" class="form-control input-large  autoyz" data-reg="^.+?$" data-ts="此项为必填项" data-ok="格式正确" data-err="内容不能为空" placeholder="请输入分类列表页模板" name="list_tpl" value=""><span></span></div>
                        </div>
                    </div>
                </div>
                <div class="form-group cl detail_tpl">
                    <div class="form-label"><b class="form-title">分类详情页模板</b><span class="form-tip">detail_tpl</span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="form-wrap">
                            <div class="autoyz-wrap" style="position:relative;display:inline-block;">
                                <input type="text" class="form-control input-large  autoyz" data-reg="^.+?$" data-ts="此项为必填项" data-ok="格式正确" data-err="内容不能为空" placeholder="请输入分类详情页模板" name="detail_tpl" value=""><span></span></div>
                        </div>
                    </div>
                </div>
                <div class="form-group cl sort">
                    <div class="form-label"><b class="form-title">排序</b><span class="form-tip"></span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="form-wrap">
                            <div class="autoyz-wrap" style="position:relative;display:inline-block;">
                                <input type="text" data-reg="^\d+?$" data-ts="请输入整数" data-ok="格式正确" data-err="格式错误,请输入整数" class="form-control input-small  autoyz" placeholder="请输入排序" name="sort" value=""><span></span></div>
                        </div>
                    </div>
                </div>
                <div class="form-group cl status">
                    <div class="form-label"><b class="form-title">状态</b><span class="form-tip"></span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="controls">
                            <label class="form-radio">
                                <input type="radio" name="status" value="0"><span>禁用</span>
                            </label>
                            <label class="form-radio">
                                <input type="radio" name="status" value="1" checked="checked"><span>启用</span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group cl category_type">
                    <div class="form-label"><b class="form-title">分类类型标识符</b><span class="form-tip">标识分类是文章还是产品</span><span style="color:red;">(必填)</span></div>
                    <div class="form-area">
                        <div class="form-wrap">
                            <div class="autoyz-wrap" style="position:relative;display:inline-block;">
                                <input type="text" class="form-control input-large  autoyz" data-reg="^.+?$" data-ts="此项为必填项" data-ok="格式正确" data-err="内容不能为空" placeholder="请输入分类类型标识符" name="category_type" value="article"><span></span></div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>

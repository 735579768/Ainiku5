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
        <div class="main-title">
            <i class="fa fa-bars"></i>
            <span class="">文章列表</span>
            <b>></b>
            <span onclick="window.history.go(-1);">返回</span>
        </div>
        <!--按钮和搜索区域-->
        <div class="tool-area cl">
            <div class="btn-tool">
                <a href="javascript:;" class="btn">添加</a>
                <a href="javascript:;" class="btn">添加</a>
                <a href="javascript:;" class="btn">添加</a>
            </div>
            <div class="search-tool">
                <form class="form-h form-group-h form-tip-hidden" action="" method="post">
                    <div class="form-group cl category_id">
                        <div class="form-label"><b class="form-title">分类</b><span class="form-tip"></span><span style="color:red;">(必填)</span></div>
                        <div class="form-area">
                            <select name="category_id" class="form-control input-middle">
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
                    <div class="form-group cl title">
                        <div class="form-label"><b class="form-title">标题</b><span class="form-tip"></span></div>
                        <div class="form-area">
                            <div class="form-wrap">
                                <input type="text" class="form-control input-small " placeholder="请输入标题" name="title" value="">
                            </div>
                        </div>
                    </div>
                    <a class="sch-btn fa fa-search" href="javascript:;" id="search"><i class="btn-search"></i></a>
                </form>
            </div>
        </div>
        <table width="100%">
            <tr class="th">
                <th class="td-id">Id</th>
                <th>标题</th>
                <th class="td-time">时间</th>
                <th class="td-status">状态</th>
                <th>操作</th>
            </tr>
            <tr>
                <td>100</td>
                <td class="td-left">最近的新闻动态</td>
                <td>2016-09-26 12:01:54</td>
                <td>正常</td>
                <td class="td-btn"><a href="javascript:;" class="btn">编辑</a></td>
            </tr>
            <tr>
                <td>100</td>
                <td class="td-left">最近的新闻动态</td>
                <td>2016-09-26 12:01:54</td>
                <td>正常</td>
                <td class="td-btn"><a href="javascript:;" class="btn">编辑</a></td>
            </tr>
            <tr>
                <td>100</td>
                <td class="td-left">最近的新闻动态</td>
                <td>2016-09-26 12:01:54</td>
                <td>正常</td>
                <td class="td-btn"><a href="javascript:;" class="btn">编辑</a></td>
            </tr>
            <tr>
                <td>100</td>
                <td class="td-left">最近的新闻动态</td>
                <td>2016-09-26 12:01:54</td>
                <td>正常</td>
                <td class="td-btn"><a href="javascript:;" class="btn">编辑</a></td>
            </tr>
            <tr>
                <td>100</td>
                <td class="td-left">最近的新闻动态</td>
                <td>2016-09-26 12:01:54</td>
                <td>正常</td>
                <td class="td-btn"><a href="javascript:;" class="btn">编辑</a></td>
            </tr>
        </table>
    </div>
</body>

</html>

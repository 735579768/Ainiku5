<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>后台登录</title>
<meta name="keywords" content="后台登录" />
<meta name="description" content="后台登录" />
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<script type="text/javascript" src="./js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/ank.js"></script>
<script type="text/javascript" src="./layer/layer.js"></script>
</head>
<body>
    <div id="login-form" class="login form-group-h">
                <div class="login-title center">
                    <i class="fa fa-home"></i><span>管理平台</span>
                </div>
        <form action="">
                <div class="form-group input-div cl">
                    <div class="form-label"><i title="用户名" class="fa fa-user"></i><b class="form-title">用户名</b></div>
                    <div class="form-area">
                        <div class="form-wrap">
                                <input type="text" class="form-control"  placeholder="请输入用户名" name="username" value="">
                        </div>
                    </div>
                </div>
                <div class="form-group input-div cl">
                    <div class="form-label"><i title="密码"  class="fa fa-unlock"></i><b class="form-title">密 码</b></div>
                    <div class="form-area">
                        <div class="form-wrap">
                                <input type="password" class="form-control"  placeholder="请输入密码" name="password" value="">
                        </div>
                    </div>
                </div>
                <div class="form-group input-div cl">
                    <div class="form-label"><i title="验证码"  class="fa fa-key"></i><b class="form-title">验证码</b></div>
                    <div class="form-area">
                        <div class="form-wrap">
                                <input type="text" class="form-control"  placeholder="请输入验证码" name="verify" value="">
                        </div>
                    </div>
                </div>

                <div class="form-group center cl">
                    <a href="javascript:;" id="verifyimg">
                        <img src="http://user.ainiku.loc/index.php?m=Admin&c=Public&a=verify"  alt="点击更换验证码" />
                    </a>
                </div>


                <div class="form-group center cl">
                    <a href="javascript:;" id="loginbtn" class="btn btn-large">登录</a>
                </div>
        </form>
    </div>
</body>
</html>

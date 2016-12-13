{__NOLAYOUT__}<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>页面跳转</title>
{insert name="reset,common,font-awesome.min"}
</head>
<body>
<div class="system-message">
        <?php switch ($code) {?>
            <?php case 1:?>
            <div class="sys-success">
                <div class="icon"><i class="fa fa-check"></i></div>
                <div class="text"><?php echo(strip_tags($msg));?></div>
            </div>
            <?php break;?>
            <?php case 0:?>
            <div class="sys-error">
                <div class="icon"><i class="fa fa-times"></i></div>
                <div class="text"><?php echo(strip_tags($msg));?></div>
            </div>
            <?php break;?>
        <?php } ?>
        <div class="jump">
            页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b>
        </div>
</div>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
    var time = --wait.innerHTML;
    if(time <= 0) {
        clearInterval(interval);
        if(href!=='javascript:history.back(-1);'&&location.href!==href){
            location.href = href;
        }else{
            self.close();
        }


    };
}, 1000);
})();
</script>
</body>
</html>

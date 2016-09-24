ShearPhoto.MINGGE(function() {
       var publicRelat= document.getElementById("relat");     //"relat"对像     
	   var publicRelatImg=publicRelat.getElementsByTagName("img");  //"relat"下的两张图片对像   
	   var Shear = new ShearPhoto;
          Shear.config({
			     	/*---------------用户设置部份开始-----------------------------------------------------------------------*/  
			        url:Cutpicture.chuliurl,//后端处理地址
			        scopeWidth:Cutpicture.cwidth,                 //可拖动范围宽  也就是"main"对象的初始大小  
                    scopeHeight:Cutpicture.cheight,                //可拖动范围高  也就是"main"对象的初始大小  
                    relat:publicRelat,                //请查看 id:"relat"对象 
                    proportional:[Cutpicture.bili,               //截框的宽高比例（宽除以高的比例值，这个设置其实就是3/4,不设比例请设为0，注意更改比例后，后端也要进行相应设置，否则系统会给你抱出错误）
					 100,                             //启动后的截框初始宽度
					 133.33333                        //比例设置后，这个高度无效，由宽和比例来决定
					  ],   
				    Min:50,                 //截框拉伸或拖拽不能少于多少PX
					Max:500,                //一开始启动时，图片的宽和高，有时候图片会很大的，必须要设置一下
					Border:1,               //截框的边框大小
                    BorderStyle:"solid",    //截框的边框类型，其实是引入CSS的border属性，和入CSS的border属性是一样的
                    BorderColor:"#04B7FB",  //截框的边框色彩
					/*---------------用户设置部份结束-----------------------------------------------------------------------*/ 
					scope:document.getElementById("main"),//范围对象 
					ImgDom:publicRelatImg[0],         //截图图片对象（小）  
                    ImgMain:publicRelatImg[1],         //截图图片对象（大）
					black:document.getElementById("black"),//黑色遮层对象
					form:document.getElementById("smallbox"),//截框对象
                    ZoomDist:document.getElementById("ZoomDist"),//放大工具条,可从HTML查看此对象，不作详细解释了
                    ZoomBar:document.getElementById("ZoomBar"), //放大工具条，可从HTML查看此对象
                      to:{
                              BottomRight:document.getElementById("BottomRight"),//拉伸点中右
                              TopRight:document.getElementById("TopRight"),//拉伸点上右，下面如此类推，一共8点进行拉伸,下面不再作解释
                              Bottomleft:document.getElementById("Bottomleft"),
                              Topleft:document.getElementById("Topleft"),
                              Topmiddle:document.getElementById("Topmiddle"),
                              leftmiddle:document.getElementById("leftmiddle"),
                              Rightmiddle:document.getElementById("Rightmiddle"),
                              Bottommiddle:document.getElementById("Bottommiddle")
                     },
                     SelectBox:document.getElementById("SelectBox"),         //选择图片方式的对象
					Shearbar:document.getElementById("Shearbar"),          //截图工具条对象
                    UpFun:function() {                   //鼠标健松开时执行函数
                              Shear.MoveDiv.DivWHFun();   //把截框现时的宽高告诉JS    
                    },
					complete2:Cutpicture.complete2
                    
          });
var photoalbum = document.getElementById("photoalbum");//相册对象
/*选择图片上传*/
var up = new ShearPhoto.frameUpImg({
          UpType:new Array("jpg", "jpeg", "png", "gif"),//图片类限制，上传的一定是图片，你就不要更改了
          FilesSize:2,
          url:Cutpicture.uploadurl,
          erro:function(msg) {
                    Shear.pointhandle(3e3, 10, msg, 0, "#f82373", "#fff");
          },
          preced:function() {
                    photoalbum.style.display = "none"; //什么情况下都关了相册
                    camClose.onclick(); //什么情况下都关了视频
                    Shear.pointhandle(0, 10, "正在为你加载图片，请你稍等哦......", 2, "#307ff6", "#fff");
          }
});

up.run(function(data) {//upload.php成功返回数据后
          data = ShearPhoto.JsonString.StringToJson(data);
          if (data === false) {
                    Shear.SendUserMsg("错误:请保证后端环境运行正常", 5e3, 0, "#f4102b", "#fff",  true,true);
                    return;
          }
          if (data["erro"]) {
                    Shear.SendUserMsg("错误:" + data["erro"], 5e3, 0, "#f4102b", "#fff",  true,true);
                    return;
          }
          Shear.run(data["success"]);
});
/*选择图片上传*/
/*相册*/
var DE = document.documentElement;
var PhotoLoading = document.getElementById("PhotoLoading");
var photoalbumLi = photoalbum.getElementsByTagName("li");
var photoalbumLifun = function() {
          Shear.run(this.getElementsByTagName("img")[0].getAttribute("serveUrl"));
          photoalbum.style.display = "none";
};

for (var i = 0; i < photoalbumLi.length; i++) photoalbumLi[i].onclick = photoalbumLifun;//为相册的每张照加入一个点击事件
PhotoLoading.onclick = function() {             //从相册选取事件
          photoalbum.style.display = "block";
         
};
 document.getElementById("close").onclick = function() {     //关闭相册事件
          photoalbum.style.display = "none";
};

 /*相册*/
 /*截图，左旋，右旋，重新选择*/
  Shear.addEvent(document.getElementById("saveShear"), "click", function() { //按下截图事件，提交到后端的shearphoto.php接收
   Shear.SendPHP({shearphoto:Cutpicture.bili,mingge:"我要传第二个参数到服务器"});//我们示例截图并且传参数，后端文件shearphoto.php用 示例：$_POST["shearphoto"] 接收参数，不需要传参数请清空Shear.SendPHP里面的参数示例 Shear.SendPHP();
});

 Shear.addEvent(document.getElementById("LeftRotate"), "click", function() {//向左旋转事件
          Shear.Rotate("left");
});
 
  Shear.addEvent(document.getElementById("RightRotate"), "click", function() { //向右旋转事件
          Shear.Rotate("right");
});
 
     Shear.addEvent(document.getElementById("againIMG"), "click", function() {          //重新选择事件
          Shear.again();
          Shear.pointhandle(3e3, 10, "已取消！重新选择", 2, "#fbeb61", "#3a414c");
});
 
 /*截图，左旋，右旋，重新选择*/
/*拍照*/
 webcam.init_config={
		width  : 500,                 //摄像头像素宽度，也就是说后端生成图片的大小
		height : 500,                 //摄像头像素高度，也就是说后端生成图片的大小
		server_width : 450,            //网页中flash的显示宽度
		server_height : 450,           //网页中flash的显示高度
		uploadfield : "UpFile",       //上传的FORMDATA名称， 不理解你就不要改，否则报错又问为什么了
		postargs:{mingge:"shearphoto我爱你",shearphoto:"shearphoto好"}//示例传入POST参数到后端。后端示例$_POST['XXXX'] 接收！如果！ 不需要传参数，请把postargs删除，需填参数请保证参数格式
	 },
                     webcam.set_api_url(Cutpicture.uploadurl); //拍照连接后端的URL文件    
                     webcam.set_quality(95);//拍照的图片质量
                     webcam.set_shutter_sound(true);//拍照声音
					 
var CamFlash = document.getElementById("CamFlash");
var timing = document.getElementById("timing");
var CamOk = document.getElementById("CamOk");
var CamBox = document.getElementById("CamBox");
var camerasImage = document.getElementById("camerasImage");
var camClose = document.getElementById("camClose");
var setCam = document.getElementById("setCam");

 webcam.noCamcall=function(msg){
	 Shear.SendUserMsg(msg, 5e3, 0, "#f4102b", "#fff", true,true);
	 camClose.onclick(); 
	 }
	 
setCam.onclick =function() {webcam.configure();}//点击设置按钮事件
camClose.onclick = function() { //拍照点关闭后
          webcam.Homing(timing);
          CamFlash.innerHTML = "";
          CamBox.style.display = "none";
		  camerasImage.onclick=camerasImageOnclick;
};
var camerasImageOnclick = function() {            //按下弹出拍照框事件
       CamBox.style.display = "block";
	     CamFlash.innerHTML = webcam.get_html();
         webcam.newsnap(timing, CamFlash, CamOk);
		 camerasImage.onclick=null;
};
camerasImage.onclick=camerasImageOnclick;


webcam.set_hook("onComplete", function(data) {//拍照服务器返回数据事件
         camClose.onclick();
		 data = ShearPhoto.JsonString.StringToJson(data);
          if (data === false) {
                    Shear.SendUserMsg("错误:请保证后端环境运行正常", 5e3, 0, "#f4102b", "#fff", true,true);
                    return;
          }
          if (data["erro"]) {
                    Shear.SendUserMsg("错误:" + data["erro"], 5e3, 0, "#f4102b", "#fff", true,true);
					return;
          }
          Shear.run(data["success"]);
});
 });
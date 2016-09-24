ShearPhoto.frameUpImg = function(config) {
          this.BodyDom = document.body;
          this.FORM = document.CUTPICTUREFORM;
          this.upfile = this.FORM.UpFile;
          this.config = config;
		   typeof   config.erro !== "function" &&  (config.erro=function(){});
          this.FORM.action = config["url"];
         var this_ = this;
		  this.parentNodes= this.upfile.parentNode;
		  if(window.attachEvent) {
                    this.parentNodes.onmousemove= function() {
					var	offsetX=window.event.offsetX+5;
					offsetX<0&&(offsetX=0);
					offsetX>224&&(offsetX=224);
						this_.upfile.style.width = offsetX + "px";
					};
          }
};

ShearPhoto.frameUpImg.prototype = {
          createframe:function() {
                    this.BodyDom.insertAdjacentHTML("afterBegin", '<iframe name="POSTiframe"   class="displayNone"  ></iframe>');
                    this.iframe = document.getElementsByName("POSTiframe")[0];
                    this.createEve(this.iframe, window.frames["POSTiframe"]);
          },
          createEve:function(iframe, windowframes) {
              var      this_ = this;
                    if (this.upfile.files) {
						  iframe.onload = function() { 
                                        iframe.onload = null;
                                        var windowframesbody = windowframes.document.getElementsByTagName("BODY")[0];
                                        var html = windowframesbody.innerHTML;
                                        this_.Evebubbling(html);
                              };
                    } else { 
                              iframe.onreadystatechange = function() {
                                        if (iframe.readyState === "complete") {
                                                  iframe.onreadystatechange = null;
                                                  var windowframesbody = windowframes.document.getElementsByTagName("BODY")[0];
                                                  var html = windowframesbody.innerHTML;
                                                  this_.Evebubbling(html);
                                        }
                              };
                    }
          },
          delframe:function() {
			          this.BodyDom.removeChild(this.iframe);
					  this.DelCreateUpfile();
		 },
          Evebubbling:function(html) {
                    if (html != "") {
						      this.upfile.onclick = null;
							  typeof this.fun === "function" && this.fun(html);
                              this.delframe();
                    }
          },
          inArray:function(elem, array) {
                    if (array.indexOf) {
                              return array.indexOf(elem);
                    }
                    for (var i = 0, length = array.length; i < length; i++) {
                              if (array[i] === elem) {
                                        return i;
                              }
                    }
                    return -1;
          },
		  DelCreateUpfile:function() {//纯粹为兼容IE，迫得无路可走
          var change = this.upfile.onchange;
          this.upfile.onchange = null;
          this.parentNodes.removeChild(this.upfile);
          var inputfile = document.createElement("input");
		  inputfile.id="selectImage2";
          inputfile.setAttribute("type", "file");
          inputfile.setAttribute("name", "UpFile");
          this.parentNodes.appendChild(inputfile);
          this.upfile = inputfile;
          this.upfile.onchange = change;
          },
          Upsubmit:function(upfile) {
                    try {
                              var filestype = upfile.value.split(".");
                              filestype = Object.prototype.toString.call(filestype) === "[object Array]" ? filestype[filestype.length - 1] :"";
							  
                              if (this.inArray(filestype.toLowerCase(), this.config.UpType) == -1) {
                                        this.upfile.onclick = null;
										this.DelCreateUpfile();
										this.config.erro("请选择正确图片类型");
                                        return;
                              }
                              var files = upfile.files;
                              if (files) {
                                        files = files[0];
                                        if (files.size <= 0) {
                                                  this.upfile.onclick = null;
												  this.DelCreateUpfile();
                                                  this.config.erro("错误：不能上传空字节文件");
                                                  return;
                                        }
                                        if (files.size > this.config.FilesSize * 1024 * 1024) {
                                                  this.upfile.onclick = null;
												  this.DelCreateUpfile();
                                                  this.config.erro("错误：文件不能大于2M");
                                                  return;
                                        }
                              }
                              this.createframe();
                              typeof this.config.preced === "function" && this.config.preced();
                              this.FORM.submit();
					 } catch (e) {
                              this.upfile.onclick = null;
							  this.DelCreateUpfile();
                              this.config.erro("请选择正确图片");
                              return;
                    }
          },
          run:function(fun) {
                var    this_ = this;
                    this.fun = fun;
					this.upfile.onchange = function() {
						 if(this.value=="")return false;
                              this.onclick = function() {
								        return false;
                              };
                              this_.Upsubmit(this);
                    };
          }
};                  
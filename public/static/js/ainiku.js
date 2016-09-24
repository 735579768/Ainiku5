;
(function($, window) {
	/*********************私有方法*******************************/
	//判断一个变量的类型
	var _gtype = function(options) {
		return typeof(options);
	};
	//ainiku声明
	//给ainiku添加原型方法
	var ainiku = {};
	ainiku.fn = ainiku.prototype = {
		//一些公共的配置项
		config: {
			zindex: 9999,
			animate: false,
			version: '1.0.0'
		},

		//初始化对象
		init: function(config) {
			this.extend(config, this.config);
			return this;
		},
		//拖动函数
		drag: function(options) {
			//配置项
			var conf = {
				obj: null, //拖动对象
				titleheight: 50,
				space: false,
				spacestyle: ""
			};
			var _this = this;
			var doc = $(document);
			var a = {
				xxx: 0, //元素到左边的距离
				yyy: 0, //元素到顶边的距离
				_x: 0, //鼠标到元素左边距离
				_y: 0, //鼠标到元素顶边距离
				_mouseDown: false
			};

			var opts = this.extend(options, conf);
			var _t = opts.obj;
			var setxy = function(e) {
				a.xxx = _t.offset().left;
				a.yyy = _t.offset().top;
				a._x = e.pageX - a.xxx;
				a._y = e.pageY - a.yyy;
			};
			var ismove = function(e) {
				if (_t.offset().top >= 0 && (opts.titleheight === 0 || opts.titleheight >= e.pageY - _t.offset().top)) {
					_t.css("cursor", "move");
					return true;
				} else {
					_t.css("cursor", "auto");
					return false;
				}
			};
			_t.bind("mousedown", function(e) {
				a._mouseDown = true;
				setxy(e);
			});
			_t.bind("mousemove", function(e) {
				if (ismove(e)) {
					if (a._mouseDown) {
						var scryyy = doc.scrollTop();
						xx = e.pageX - a._x;
						yy = e.pageY - a._y - scryyy;
						_t.css({
							zIndex: _this.config.zindex - 1,
							position: "fixed",
							left: xx,
							top: (yy > 0) ? yy : 0,
							margin: 0
						});
					}
				}
				return false;
			});
			_t.bind("mouseup mouseout", function() {
				a._mouseDown = false;
			});
		},
		//特效函数
		show: function(obj, callback) {
			if (this.animate) {
				var w = obj.width();
				var h = obj.height();
				var ww = obj.outerWidth() / 2;
				var hh = obj.outerHeight() / 2;
				obj.css({
					display: 'block',
					opacity: 0,
					width: 10,
					height: 10,
					marginLeft: -5,
					marginTop: -5
				});
				obj.animate({
					opacity: 1,
					width: w,
					height: h,
					marginLeft: -ww,
					marginTop: -hh
				}, 300, function() {});
			} else {
				(typeof(callback) === 'function') && callback(obj);
			}
		},
		hide: function(obj, callback) {
			if (this.animate) {
				var w = obj.width();
				var h = obj.height();
				var ww = obj.outerWidth() / 2;
				var hh = obj.outerHeight() / 2;
				obj.css({
					top: '45%',
					left: '50%',
					marginLeft: -ww,
					marginTop: -hh
				});
				obj.animate({
					opacity: 0,
					width: 0,
					height: 0,
					marginLeft: 0,
					marginTop: 0
				}, 200, function() {
					obj.remove();
					(typeof(callback) === 'function') && callback(obj);
				});
			} else {
				obj.remove();
				(typeof(callback) === 'function') && callback(obj);
			}
		},

		//弹出消息框并自己消失
		msg: function(options, callback) {
			var texiao = 0; //默认动画效果
			var content = '没有消息!';
			var url = '';
			if (typeof(options) == 'object') {
				content = options['info'];
				(options.status == '0') && (texiao = 6);
				options.url && (url = options.url.replace(' ', ''));
			} else {
				content = options;
			}

			var param = [
				content, {
					shift: texiao,
				},
				function() {
					(typeof(callback) == 'function') && callback(options);
					(url != '') && (window.location.href = url);
				}
			];

			if (parent) {
				parent.layer.msg.apply(parent.layer, param);
			} else {
				layer.msg.apply(layer, param);
			}
		},

		open: function() {
			// debugger;
			if (parent) {
				parent.layer.open.apply(parent.layer, arguments);
			} else {

				layer.open.apply(layer, arguments);
			}
		},
		load: function() {
			if (parent) {
				parent.layer.load.apply(parent.layer, arguments);
			} else {
				layer.load.apply(layer, arguments);
			}
		},
		close: function() {
			if (parent) {
				parent.layer.close.apply(parent.layer, arguments);
			} else {
				layer.close.apply(layer, arguments);
			}
		},
		//冒泡信息提示
		maopao: function(options) {
			var conf = {
				'effect': 'fade',
				'title': '提示',
				'content': '',
				'button': false,
				'autohidden': false,
				'iframe': null,
				'width': null,
				'height': null,
				'shijian': 10
			};
			var msgHidden = function() {
				$('.klmpmsg').animate({
					bottom: '-' + $('.klmpmsg').outerHeight()
				}, 2000, function() {
					$('.klmpmsg').remove();
					$('#dialogstyle').remove();
					window.clearInterval(window.maopaoid);
				});
			};
			var dialogstyle = "<style id='dialogstyle'>.klmpmsg{border-radius:5px;box-shadow:2px 2px 5px #cecece;font-family:Microsoft Yahei;overflow:hidden;position:fixed;z-index:" + this.config.zindex + ";bottom:10px;right:10px;min-height:50px;min-width:100px;background-color:#FFF;border:5px solid #999;font-family:Microsoft Yahei;font-size:14px;color:#333;opacity:1;border:5px solid rgba(0,0,0,0.3);_position:absolute;_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));}.klmpmsg .klmpmsgbar{height:20px;padding:5px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;font-weight:bold;border-bottom:solid 1px #cecece;}.klmpmsg .klmpmsgbar .klmptitle{color:red;float:left;padding:0px 10px 0px 0px;}.klmpmsg .klmpmsgbar .klclose{float:right;padding:0px 10px;font-weight:bolder;cursor:pointer;color:#f00;}.klmpmsg .klmpmsgc iframe{border:none;width:100%;height:100%;}.klmpmsg .klmpmsgc{width:100%;height:100%;padding:10px;}.klmpmsg .klmpmsgbtn{float:right;display:block;padding:10px;}.klmpmsg .klmpmsgbtn a{color:#ffffff;background-color:#FE8431;border-color:#FE8431;text-decoration:none;width:auto;padding:3px 15px;font-size:16px;text-align:center;cursor:pointer;}</style>";
			$('#dialogstyle').remove();
			$('.klmpmsg').remove();
			window.clearInterval(window.maopaoid);
			$('body').append(dialogstyle);
			if (typeof(options) !== 'string') {
				conf = $.extend(options, conf);
			} else {
				conf.content = options;
			}
			var msgbtn = '<div class="klmpmsgbtn"><a href="javascript:;">确定</a></div>';
			if (!conf.button) msgbtn = '';
			if (conf.iframe != null) {
				conf.content = '<iframe src="' + conf.iframe + '"></iframe>';
			}
			var divstr = '<div class="klmpmsg"><div class="klmpmsgbar"><div class="klmptitle">' + conf.title + '</div><div class="klclose" title="点击关闭">X</div></div><div class="klmpmsgc">' + conf.content + '</div>' + msgbtn + '</div>';
			$('body').append(divstr);
			$('.klmpmsg').width($('.klmpmsg').outerWidth());
			$('.klmpmsg .klmpmsgbtn a,.klmpmsg .klmpmsgbar .klclose').bind('click',
				function() {
					msgHidden();
				});
			$('.klmpmsg').css('bottom', '-' + $('.klmpmsg').outerHeight() + 'px');
			$('.klmpmsg').animate({
				bottom: '20px'
			}, 1000, function() {
				$('.klmpmsg').animate({
						bottom: '10px'
					},
					300);
			});
			if (conf.autohidden) {
				setTimeout(function() {
						$.maopaoMsg.msgHidden();
					},
					conf.shijian * 1000);
			}
			window.maopaoid = window.setInterval(function() {
					var a = $('.klmptitle').html();
					if (a == conf.title) {
						$('.klmptitle').html('');
					} else {
						$('.klmptitle').html(conf.title);
					}
				},
				1000);
		},

		/**实现功能扩展**/
		extend: function() {
			var arg0 = arguments[0] || {};
			var target = arguments[1] || this;
			for (var name in arg0) {
				target[name] = arg0[name];
			}
			return target;
		},
		/**AJAX请求**/
		ajax: function(a) {
			a = a || {};
			var b = {
				type: 'POST',
				url: "",
				data: {},
				success: function(data) {},
				timeout: function(data) {}
			};
			b = this.extend(a, b);
			$.ajax(b);
		},
		get: function(uri, da, callback) {
			this.ajax({
				type: 'GET',
				url: uri,
				data: da,
				success: callback
			});
		},
		loadhtml: function(uri, da, obj, tpe) {
			(typeof tpe === 'undefined') && (tpe = 'GET');
			tpe = tpe.toUpperCase();
			obj.html('正在加载数据...');
			this.ajax({
				type: tpe,
				url: uri,
				data: da,
				success: function(data) {
					obj.html(data);
				}
			});
		},
		post: function(url, da, callback) {
			this.ajax({
				type: 'POST',
				url: uri,
				data: da,
				success: callback
			});
		},
		/**
		 *全局ajax提交form表单数据thisobj为触发事件的元素
		 *@param thisobj 触发事件的元素
		 *可以添加另外两个参数第二个控制时间第三个控制刷新
		 *备注：
		 *可以添加两个函数：
		 *_before_post()提交前调用
		 *_after_post()提交后调用
		 */
		ajaxForm: function(thisobj, callback) {
			thisobj = $(thisobj);
			// thisobj.addClass("disabled");
			if (typeof arguments[2] != "undefined") reloadbool = arguments[2];
			if (typeof arguments[1] != "undefined") msgtime = arguments[1];
			try {
				(typeof _before_func == "function") && _before_func();
				var thisobj, obj, a, url;
				a = "";

				formobj = thisobj.parents("form");
				if (!formobj) {
					return false;
				}
				formobj.submit(function(e) {
					return false;
				});
				var url = formobj.attr("action");
				postdata = formobj.serialize();
				a = "{" + a + "}";
				b = eval("(" + a + ")");
				// $("body").append('<div id="klbg" class="bg">');
				var lindex = parent.layer.load(1, {
					shade: false //0.1透明度的白色背景
				});
				$.ajax({
					url: url,
					type: "POST",
					datatype: "JSON",
					data: postdata,
					success: function(da) {
						parent.layer.close(lindex);
						ank.msg(da, function() {
							(typeof _after_func == "function") && _after_func(da);
							(typeof callback == "function") && callback(da);
						});

					}
				});
			} catch (e) {
				alert(e.name + ": " + e.message);
			}
		},
		ajaxHref: function(obj, callback) {
			obj = $(obj);
			//obj.addClass("disabled");
			if (typeof arguments[2] != "undefined") reloadbool = arguments[2];
			if (typeof arguments[1] != "undefined") msgtime = arguments[1];
			url = obj.attr("href");
			if (typeof url == "undefined") url = obj.attr("url");
			// $("body").append('<div id="klbg" class="bg">');
			var lindex = parent.layer.load(1, {
				shade: false //0.1透明度的白色背景
			});
			$.ajax({
				type: "POST",
				url: url,
				success: function(da) {
					parent.layer.close(lindex);
					ank.msg(da, function() {
						(typeof _after_func == "function") && _after_func(da);
						(typeof callback == "function") && callback(da);
					});

				},
				dataType: "JSON"
			});
			return false;
		},
		writeCookie: function(name, value, hours) {
			var expire = "";
			if (hours != null) {
				expire = new Date(new Date().getTime() + hours * 36e5);
				expire = "; expires=" + expire.toGMTString();
			}
			document.cookie = name + "=" + encodeURI(value) + expire;
		},
		readCookie: function(name) {
			var cookieValue = "";
			var search = name + "=";
			if (document.cookie.length > 0) {
				offset = document.cookie.indexOf(search);
				if (offset != -1) {
					offset += search.length;
					end = document.cookie.indexOf(";", offset);
					if (end == -1) end = document.cookie.length;
					cookieValue = decodeURI(document.cookie.substring(offset, end));
				}
			}
			return cookieValue;
		}
	};

	//把ainiku设置到全局变量
	window.ank = ainiku.fn.init({});
	//ainiku结束
})($, window);
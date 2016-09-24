;
jQuery.myMsg = {
	msg: function(options, callback) {
		var opts;
		var defaults = {
			'effect': 'fade',
			'title': '提示',
			'content': '',
			'button': false,
			'autohidden': true,
			'iframe': null,
			'width': null,
			'height': null,
			'bg': true,
			'shijian': 2
		};
		var dialogstyle = "<style id='dialogstyle'>.klmsgbg{ position:fixed;_position:absolute;z-index:998;top:0px;left:0px;width:100%;_width:expression(document.documentElement.scrollWidth );height:100%;_height:expression(document.documentElement.scrollHeight);background-color:rgba(0,0,0,0.3);*background:black;*filter:alpha(opacity=30);}.klmsg{border-radius:5px;box-shadow:2px 2px 5px #333;font-family:Microsoft Yahei;overflow:hidden;position:fixed;z-index:999999999;top:50%;left:50%;min-height:50px;min-width:100px;background-color:#FFF;border:5px solid #666;font-size:14px;color:#333;opacity:1;border:5px solid rgba(0,0,0,0.5);_position:absolute;_width:expression((this.clientWidth<100)?'100px':'auto');_height:expression((this.clientHidth<50)?'50px':'auto');_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+(document.documentElement.clientHeight-this.offsetHeight)/2));_padding-bottom:10px;}.klmsg .klmsgbar{padding:5px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;font-weight:bold;border-bottom:solid 1px #cecece;_margin-bottom:10px;}.klmsg .klmsgbar .kltitle{float:left;padding:0px 10px 0px 0px;}.klmsg .klmsgbar .klclose{float:right;padding:0px 20px 0px 0px;font-weight:bolder;cursor:pointer;color:#f00;}.klmsg .klmsgc iframe{border:none;width:100%;_width:auto;height:100%;}.klmsg .klmsgc{height:100%;padding:10px;_display:inline;}.klmsg .klmsgbtn{float:right;display:block;padding:10px 0px; height:25px;position:absolute; z-index:99;bottom:0px;left:0px;background:#fff;width:100%;}.klmsg .klmsgbtn a{color:#ffffff;background-color:#FE8431;border-color:#FE8431;text-decoration:none;width:auto;padding:3px 15px;margin:0px 20px;font-size:16px;text-align:center;cursor:pointer;float:right; }</style>";
		$('#dialogstyle').remove();
		$('body').append(dialogstyle);
		if (typeof(options) !== 'string') {
			opts = $.extend(defaults, options)
		} else {
			defaults.content = options;
			opts = defaults
		}
		var msgbtn = '<div  class="klmsgbtn"><a href="javascript:;">确定</a></div>';
		if (!opts.button) {
			msgbtn = ''
		};
		if (opts.iframe != null) {
			opts.content = '<iframe src="' + opts.iframe + '"></iframe>'
		}
		var divstr = '';
		if (opts.bg) divstr = '<div class="klmsgbg" ></div>';
		divstr += '<div class="klmsg"><div class="klmsgbar"><div class="kltitle">' + opts.title + '</div><div class="klclose" title="点击关闭">X</div></div><div class="klmsgc">' + opts.content + '</div>' + msgbtn + '</div>';
		$('.klmsg').remove();
		$('body').append(divstr);
		if (opts.button) $('.klmsg').css('paddingBottom', '45px');
		setTimeout(function() {
			$('.klmsgbar').css('width', ($('.klmsgc').width() + 10) + 'px')
		}, 200);
		var ml, mt;
		if (opts.width != null) {
			$('.klmsg').css('width', opts.width + 'px');
			ml = opts.width / 2
		} else {
			ml = $('.klmsg').outerWidth() / 2
		}
		if (opts.height != null) {
			$('.klmsg').css('height', opts.height + 'px');
			mt = opts.height / 2
		} else {
			mt = $('.klmsg').outerHeight() / 2
		}
		$('.klmsg').css({
			'marginLeft': '-' + ml + 'px',
			'marginTop': '-' + mt + 'px'
		});
		$('.klmsg .klmsgbtn a,.klmsg .klmsgbar .klclose').bind('click', function() {
			$('.klmsg').remove();
			$('#dialogstyle').remove();
			$('.klmsgbg').remove()
		});
		if (opts.iframe != null) {
			$('.klmsgc').css('padding', '0px')
		} else {
			if (opts.autohidden) {
				if (opts.shijian != 0) {
					setTimeout(function() {
						$('.klmsg').remove();
						$('#dialogstyle').remove();
						$('.klmsgbg').remove();
						if (typeof(callback) === 'function') callback(opts)
					}, opts.shijian * 1000)
				}
			}
		}
	}
};
/*冒泡信息**/
;
jQuery.maopaoMsg = {
	msg: function(options) {
		var opts;
		var defaults = {
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
		var dialogstyle = "<style id='dialogstyle'>.klmpmsg{border-radius:5px;box-shadow:2px 2px 5px #cecece;font-family:Microsoft Yahei;overflow:hidden;position:fixed;z-index:999999999;bottom:10px;right:10px;min-height:50px;min-width:100px;background-color:#FFF;border:5px solid #999;font-family:Microsoft Yahei;font-size:14px;color:#333;opacity:1;border:5px solid rgba(0,0,0,0.3);_position:absolute;_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));}.klmpmsg .klmpmsgbar{height:20px;padding:5px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;font-weight:bold;border-bottom:solid 1px #cecece;}.klmpmsg .klmpmsgbar .klmptitle{color:red;float:left;padding:0px 10px 0px 0px;}.klmpmsg .klmpmsgbar .klclose{float:right;padding:0px 10px;font-weight:bolder;cursor:pointer;color:#f00;}.klmpmsg .klmpmsgc iframe{border:none;width:100%;height:100%;}.klmpmsg .klmpmsgc{width:100%;height:100%;padding:10px;}.klmpmsg .klmpmsgbtn{float:right;display:block;padding:10px;}.klmpmsg .klmpmsgbtn a{color:#ffffff;background-color:#FE8431;border-color:#FE8431;text-decoration:none;width:auto;padding:3px 15px;font-size:16px;text-align:center;cursor:pointer;}</style>";
		$('#dialogstyle').remove();
		$('.klmpmsg').remove();
		window.clearInterval(window.maopaoid);
		$('body').append(dialogstyle);
		if (typeof(options) !== 'string') {
			opts = $.extend(defaults, options);
		} else {
			defaults.content = options;
			opts = defaults;
		}
		var msgbtn = '<div class="klmpmsgbtn"><a href="javascript:;">确定</a></div>';
		if (!opts.button) msgbtn = '';
		if (opts.iframe != null) {
			opts.content = '<iframe src="' + opts.iframe + '"></iframe>';
		}
		var divstr = '<div class="klmpmsg"><div class="klmpmsgbar"><div class="klmptitle">' + opts.title + '</div><div class="klclose" title="点击关闭">X</div></div><div class="klmpmsgc">' + opts.content + '</div>' + msgbtn + '</div>';
		$('body').append(divstr);
		$('.klmpmsg').width($('.klmpmsg').outerWidth());
		$('.klmpmsg .klmpmsgbtn a,.klmpmsg .klmpmsgbar .klclose').bind('click', function() {
			$.maopaoMsg.msgHidden();
		});
		$('.klmpmsg').css('bottom', '-' + $('.klmpmsg').outerHeight() + 'px');
		$('.klmpmsg').animate({
			bottom: '20px'
		}, 1000, function() {
			$('.klmpmsg').animate({
				bottom: '10px'
			}, 300);
		});
		if (opts.autohidden) {
			setTimeout(function() {
				$.maopaoMsg.msgHidden();
			}, opts.shijian * 1000);
		}
		window.maopaoid = window.setInterval(function() {
			var a = $('.klmptitle').html();
			if (a == opts.title) {
				$('.klmptitle').html('');
			} else {
				$('.klmptitle').html(opts.title);
			}
		}, 1000);
	},
	msgHidden: function() {
		$('.klmpmsg').animate({
			bottom: '-' + $('.klmpmsg').outerHeight()
		}, 2000, function() {
			$('.klmpmsg').remove();
			$('#dialogstyle').remove();
			window.clearInterval(window.maopaoid);
		});
	}
};
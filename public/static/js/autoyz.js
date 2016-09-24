;
$(function() {
	var yz = {
		yzstr: {
			ok: '<span class="yzok"></span>',
			err: '<span class="yzerr"></span>',
			th1: '<span class="yzth1"></span>',
			th2: '<span class="yzth2"></span>'
		},
		isregok: function(obj) {
			var rearr = new Array();
			rearr[0] = '^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$'; //email
			rearr[1] = '^http(s?):\/\/(?:[A-za-z0-9-]+\.)+[A-za-z]{2,4}(:\d+)?(?:[\/\?#][\/=\?%\-&~`@[\]\':+!\.#\w]*)?$'; //url
			rearr[2] = '^\d+(\.\d+)?$'; //货币
			rearr[3] = '^\d+$'; //数字
			rearr[4] = '^[1][0-9]{10}$'; //mobile
			var s1 = obj.val();
			var re = obj.attr('data-reg');
			re = re.replace('[email]', rearr[0]); //邮箱
			re = re.replace('[mobile]', rearr[4]); //手机
			var re = new RegExp(re);
			if (re.test(s1)) {
				return true;
			} else {
				return false;
			}
		},
		init: function() {
			var _this = this;
			var dobj = $('input.autoyz');
			dobj.wrap('<div class="autoyz-wrap" style="position:relative;display:inline-block;"></div>');
			dobj.parent().append('<span></span>');
			dobj.focus(function(e) {
				if (!_this.isregok($(this))) {
					var s1 = $(this).attr('data-ts');
					var ob = $(this).parent().find('span');
					ob.removeAttr('class');
					ob.addClass('yzth1');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
				} else {
					//正确
					var s1 = $(this).attr('data-ok');
					s1 = (s1 == '' || typeof(s1) == 'undefined') ? '格式正确' : s1;
					var ob = $(this).parent().find('span').eq(0);
					ob.removeAttr('class');
					ob.addClass('yzok');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
				}
			});
			dobj.blur(function(e) {
				if (_this.isregok($(this))) {
					//正确
					var s1 = $(this).attr('data-ok');
					s1 = (s1 == '' || typeof(s1) == 'undefined') ? '格式正确' : s1;
					var ob = $(this).parent().find('span').eq(0);
					ob.removeAttr('class');
					ob.addClass('yzok');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
				} else {
					//错误
					var s1 = $(this).attr('data-err');
					s1 = (s1 == '' || typeof(s1) == 'undefined') ? '格式错误,请重新输入' : s1;
					var ob = $(this).parent().find('span').eq(0);
					ob.removeAttr('class');
					ob.addClass('yzerr');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
					$(this).val('');
				}
			});
		}
	};
	yz.init();
});
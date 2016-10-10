! function(a, b) {
	"use strict";
	a.ank = {
		/**
		 * ajaxform
		 * @param  {[type]}   dom      [description]
		 * @param  {Function} callback [description]
		 * @return {[type]}            [description]
		 */
		ajaxForm: function(dom, callback) {
			var thisobj = $(dom);
			try {
				(typeof _before_func == "function") && _before_func();

				var formobj = thisobj.parents("form");
				if (formobj.length == 0) {
					return false;
				}
				formobj.submit(function(e) {
					return false;
				});
				var url = formobj.attr("action");
				var postdata = formobj.serialize();
				var lindex = layer.load(1, {
					shade: false //0.1透明度的白色背景
				});
				$.ajax({
					url: url,
					type: "POST",
					datatype: "JSON",
					data: postdata,
					success: function(da) {
						layer.close(lindex);
						ank.alert(da, callback);
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						ank.alert({
							wait: 4,
							code: 0,
							msg: '访问服务器失败:' + errorThrown + ', CODE:' + textStatus,
							url: ''
						});
						console && console.log(XMLHttpRequest);
					}
				});
			} catch (e) {
				alert(e.name + ": " + e.message);
			}
		},
		/**
		 * ajaxhref get提交
		 * @param  {[type]}   obj      [description]
		 * @param  {Function} callback [description]
		 * @return {[type]}            [description]
		 */
		ajaxHref: function(obj, callback) {
			obj = $(obj);
			var uri = obj.attr("href");
			(!uri || uri == 'javascript:;') && (uri = obj.attr("data-url"));
			var lindex = parent.layer.load(1, {
				shade: false //0.1透明度的白色背景
			});
			$.ajax({
				type: "get",
				url: uri,
				success: function(da) {
					parent.layer.close(lindex);
					ank.alert(da, callback);
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					ank.alert({
						wait: 4,
						code: 0,
						msg: '访问服务器失败:' + errorThrown + ', CODE:' + textStatus,
						url: ''
					});
					console && console.log(XMLHttpRequest);
				},
				dataType: "JSON"
			});
			return false;
		},
		/**
		 * 弹出信息框
		 * @param  {[type]}   data     信息对象
		 * @param  {Function} callback 回调函数
		 * @return {[type]}            [description]
		 */
		alert: function(data, callback) {
			typeof data === 'object' || (data = {
				status: 0,
				wait: 3,
				msg: '返回数据格式错误',
				url: ''
			});
			// data.wait || (data.wait = 3000);
			if (data.code == 1) {
				layer.msg(data.msg, {
					shift: 0,
					time: data.wait * 1000
				}, function() {
					if (typeof callback == "function") {
						callback(data);
					} else {
						data.url && (window.location.href = data.url);
					}
				});
			} else {
				layer.msg(data.msg, {
					shift: 6,
					time: data.wait * 1000
				}, function() {
					(typeof callback == "function") && callback(data);
					$('#verifyimgtag').click();
					// javascript:history.back(-1);
					// data.url && (window.location.href = data.url);
				});
			}
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
				var offset = document.cookie.indexOf(search);
				if (offset != -1) {
					offset += search.length;
					var end = document.cookie.indexOf(";", offset);
					if (end == -1) end = document.cookie.length;
					cookieValue = decodeURI(document.cookie.substring(offset, end));
				}
			}
			return cookieValue;
		}
	};
}(window);
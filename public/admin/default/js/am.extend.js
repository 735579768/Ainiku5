/**
 * am扩展属性
 */
am.extend({
	checkLog: function(dom) {
		var uri = $(dom).attr('data-url');
		$.get(uri, function(data) {
			parent.layer.open({
				title: '日志记录数据',
				type: 1,
				area: ['800px', '600px'],
				content: data
			});
		});
	},
	/**
	 * 过滤标签
	 * @return {[type]} [description]
	 */
	searTag: function(dom) {
		var _t = $(dom);
		// debugger;
		if (!_t.data('init')) {
			_t.data('init', true);
			$('#tagcontainer').append('<div style="display:none;height:30px;line-height:30px;color:#666;" class="empty-tag">没有相关标签。:(</span>');
			_t.bind('keyup', function() {
				var obj = $('#tagcontainer label span');
				var str = $(this).val();
				if (!str) {
					$('#tagcontainer label').show();
					return;
				}
				str = str.toLowerCase();
				obj.each(function(index, el) {
					var s = $(this).text();
					s = s.toLowerCase();
					if (s.indexOf(str) !== -1) {
						$(this).parent().show();
					} else {
						$(this).parent().hide();
					}
				});
				if ($('#tagcontainer label').filter(':visible').length == 0) {
					$('#tagcontainer').children('div').show();
				} else {
					$('#tagcontainer').children('div').hide();
				}
			});
		}

	},
	/**
	 * 设置框架对象对应的tab标题
	 * @param  {[type]} f [description]
	 * @return {[type]}   [description]
	 */
	setChromeTabTitle: function(f, title) {
		if (!title) {
			return;
		}
		var frames = document.getElementsByTagName("iframe"); //获取父页面所有iframe
		for (i = 0; i < frames.length; i++) { //遍历，匹配时弹出id
			if (frames[i].contentWindow == f) {
				// debugger;
				var id = $(frames[i]).parent().prop('id');
				id = id.replace('iframeblock', 'iframenav');
				$('#' + id + ' span').html(title);
			}
		}
	},
	/**
	 * 取添加标签的表单
	 * @param  {[type]} dom [description]
	 * @param  {[type]} uri [description]
	 * @return {[type]}     [description]
	 */
	getAddTagForm: function(dom, uri) {
		var _t = $(dom);
		var str = _t.data('data');
		if (str) {
			layer.open({
				type: 1,
				// btn: true,
				title: '添加标签',
				area: ['450px', '250px'],
				content: str,
			});
		} else {
			var ind = layer.load(1, {
				shade: false
			});
			$.get(uri, function(data) {
				layer.close(ind);
				layer.open({
					type: 1,
					// btn: true,
					title: '添加标签',
					area: ['450px', '250px'],
					content: data.data,
				});
				_t.data('data', data.data);
			});
		}


	},
	/**
	 * 单击添加标签时添加到数据库并更新界面
	 * @param {[type]} dom [description]
	 */
	addTag: function(dom) {
		var _t = $(dom);
		am.ajaxForm(dom, function(data) {
			if (data.code) {
				//添加到页面中
				var str = '<label class="form-checkbox"><input name="position[]" type="checkbox" value="' + data.data.id + '"><span>' + data.data.title + '</span></label>';
				var par = $('#tagcontainer').append(str);
				layer.closeAll();
			}
		});
	}
});
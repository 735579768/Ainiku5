/**
 * am扩展属性
 */
am.extend({
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
			$.get(uri, function(data) {
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
	},
	ajaxHref: function(dom, callback) {
		ank.ajaxHref(dom, callback);
	},
	ajaxForm: function(dom, callback) {
		ank.ajaxForm(dom, callback);
	}
});
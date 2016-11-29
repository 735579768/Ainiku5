/**
 * am扩展属性
 */
am.extend({
	/**
	 * 列表单击后排序
	 * @param  {[type]} dom [description]
	 * @return {[type]}     [description]
	 */
	listOrder: function(dom, initOrder) {
		if (initOrder) {
			initOrder = initOrder.split(' ');
			$('.th .list-order').each(function(index, el) {
				var _t = $(this);
				var field = _t.attr('data-field');
				if (initOrder[0] == field) {
					// debugger;
					// alert('ok');
					_t.removeClass('fa-sort-amount-asc');
					_t.removeClass('fa-sort-amount-desc');
					_t.addClass('active');
					_t.addClass('fa-sort-amount-' + initOrder[1]);
				}
			});
		} else {
			var _t = $(dom);
			var inputorder = $('#listorder');
			var field = _t.attr('data-field');
			var searform = $('#search-tool form');
			if (!field || !searform.length) {
				return;
			}
			if (!inputorder.length) {
				searform.append('<input id="listorder" type="hidden" name="listorder" value=""  />');
				inputorder = $('#listorder');
			}

			if (_t.hasClass('active')) {
				if (_t.hasClass('fa-sort-amount-desc')) {
					inputorder.val(field + ' asc');
					_t.removeClass('fa-sort-amount-desc');
					_t.addClass('fa-sort-amount-asc');
					// searform.submit();
				} else if (_t.hasClass('fa-sort-amount-asc')) {
					inputorder.val('');
					_t.removeClass('fa-sort-amount-asc');
					_t.removeClass('active');
					_t.addClass('fa-sort-amount-desc');
				}

			} else {
				inputorder.val(field + ' desc');
				_t.addClass('active');

			}
			searform.submit();
		}

	},
	unInstall: function(dom) {
		var _t = $(dom);
		layer.confirm('<span style="color:red;">卸载插件会删除插件数据,确认要卸载吗?</span>', {
			title: false,
			closeBtn: false,
			shade: 0.01,
			btn: ['确定', '取消']
		}, function(index) {
			am.ajaxHref(dom);
			layer.close(index);
		});
		return false;
	},
	/**
	 * 删除系统中已经上传的的图片
	 * @param  {[type]} id [description]
	 * @return {[type]}    [description]
	 */
	deleteImg: function(id) {
		if (!id) {
			return false;
		}
		$.post(am.url.delImg, {
			picture_id: id
		}, function(data) {

		});
	},
	/**
	 * 绑定删除图片功能
	 * @return {[type]} [description]
	 */
	domDeleteImg: function(dom) {
		var _tt = this;
		var _t = $(dom);
		layer.confirm('确定 "<span style="color:red;">删除图片</span>" 吗?', {
			title: false,
			closeBtn: false,
			shade: 0.01,
			btn: ['确定', '取消']
		}, function(index) {
			var id = _t.attr('data-id');
			_tt.deleteImg(id);
			var item = _t.parents('.uploaded-imgitem');
			var inp = item.parent().next();
			item.remove();
			// debugger;
			var va = inp.val();
			va = va.split(',');
			for (a in va) {
				if (va[a] == id) {
					va.splice(a, 1);
				}
			}
			va = va.join(',');
			inp.val(va);
			layer.close(index);
		});



	},
	/**
	 * 删除图片管理中的图片
	 */
	deletePicture: function(dom) {
		// layer.confirm();
		var _tt = this;
		var _t = $(dom);
		layer.confirm('确定 "<span style="color:red;">删除图片</span>" 吗?', {
			title: false,
			closeBtn: false,
			shade: 0.01,
			btn: ['确定', '取消']
		}, function(index) {
			var id = _t.attr('data-id');
			_tt.deleteImg(id);
			var item = _t.parents('.item');
			item.remove();
			layer.close(index);
		});
	},
	jinduResetSha1: function(uri) {
		var jindutex = $('#chulijindu');
		$.get(uri, function(data) {
			if (data.code) {
				jindutex.append('<br>处理完成! :)');
			} else {
				jindutex.append('<br>' + data.msg);
				am.jinduResetSha1(uri);
			}
		});
	},
	resetSha1: function(dom) {
		// layer.confirm();
		var _tt = this;
		var _t = $(dom);
		var uri = _t.attr('data-url');
		layer.confirm('确定 "<span style="color:red;">重新生成所有图片的SHA1值</span>" 吗?', {
			title: false,
			closeBtn: false,
			shade: 0.01,
			btn: ['确定', '取消']
		}, function(index) {
			var jindu = layer.open({
				type: 1,
				area: ['500px', '400px'],
				title: '重置图片SHA1值',
				content: '<div id="chulijindu" class="jindu">开始处理图片...</div>'
			});
			am.jinduResetSha1(uri);
			layer.close(index);
		});

	},
	jinduGreateThumb: function(uri) {
		var jindutex = $('#chulijindu');
		$.get(uri, function(data) {
			if (data.code) {
				jindutex.append('<br>处理完成! :)');
			} else {
				jindutex.append('<br>' + data.msg);
				am.jinduGreateThumb(uri);
			}
		});
	},
	greateThumb: function(dom) {
		var _t = $(dom);
		var uri = _t.attr('data-url');
		var _tt = this;
		layer.confirm('确定 "<span style="color:red;">重新生成所有图片的缩略图</span>" 吗?', {
			title: false,
			closeBtn: false,
			shade: 0.01,
			btn: ['确定', '取消']
		}, function(index) {
			var jindu = layer.open({
				type: 1,
				area: ['800px', '400px'],
				title: '生成图片缩略图',
				content: '<div id="chulijindu" class="jindu">开始处理图片...</div>'
			});
			am.jinduGreateThumb(uri);
			layer.close(index);
		});



	},
	ajaxHref: function(dom, callback) {
		ank.ajaxHref(dom, callback);
	},
	ajaxForm: function(dom, callback) {
		ank.ajaxForm(dom, callback);
	}
});
/**
 * am扩展属性
 */
am.extend({
	openAddCategory: function(dom) {

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
			var jindutex = $('#chulijindu');
			$.get(uri, function(data) {
				jindutex.append('<br>' + data.msg);
				if (data.code) {
					jindutex.append('<br>处理完成! :)');
				}
			});
			layer.close(index);
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
				area: ['500px', '400px'],
				title: '生成图片缩略图',
				content: '<div id="chulijindu" class="jindu">开始处理图片...</div>'
			});
			var jindutex = $('#chulijindu');
			$.get(uri, function(data) {
				jindutex.append('<br>' + data.msg);
				if (data.code) {
					jindutex.append('<br>处理完成! :)');
				}
			});
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
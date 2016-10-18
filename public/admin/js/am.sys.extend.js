/**
 * am扩展属性
 */
am.extend({
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
		var _t = $(dom);
		var id = _t.attr('data-id');
		this.deleteImg(id);
		var item = _t.parents('.uploaded-imgitem');
		var inp = item.parent().next();
		item.remove();
		debugger;
		var va = inp.val();
		va = va.split(',');
		for (a in va) {
			if (va[a] == id) {
				va.splice(a, 1);
			}
		}
		va = va.join(',');
		inp.val(va);
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
		var _t = $(dom);
		var uri = _t.attr('data-url');
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
	},
	greateThumb: function(dom) {
		var _t = $(dom);
		var uri = _t.attr('data-url');
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
	}
});
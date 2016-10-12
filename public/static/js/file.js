! function(a, b) {
	a.ot = {
		//绑定删除图片的按钮
		bindDel: function() {
			$('.imgblock  .btn-danger').unbind('click');
			$('.imgblock  .btn-danger').click(function(e) {
				var a = $(this).attr('dataid');
				$.get(ainiku.delimg, {
					id: a
				});
				var val = $(this).parent().parent().prev().val();
				if (val != '') {
					val = val.replace(/\s+/g, '');
					val = val.replace(a + '|', '');
					val = val.replace('|' + a, '');
					val = val.replace(a, '');
					val = val.replace('||', '|');
					$(this).parent().parent().prev().val(val);
					$(this).parent().remove();
					//删除服务器上的图片
					//$.get($(this).prepend('href'),success(){});
				}
				return false;
			});
		},
		//对比编辑器内容并删除其中的图片
		delEditorImg: function(scr, dest) {
			if (scr === dest) {} else {
				$.ajax({
					type: 'POST',
					url: ainiku.deleditorimg,
					data: {
						s: scr,
						d: dest
					}
				})
			}
		},
		bindDelAttach: function() {
			$('.upload-pre-file .btn-danger').unbind('click');
			$('.upload-pre-file .btn-danger').click(function(e) {
				var a = $(this).attr('dataid');
				$.get(ainiku.delattach, {
					id: a
				});
				$(this).parent().parent().prev().val('');
				$(this).parent().remove();
			});
		},
		/**
		 * textarea自动高度
		 * @return {[type]} [description]
		 */
		autoHeight: function(obj) {
			var _t = $(obj);
			_t.height(obj.scrollHeight);
		}
	};
}(window);
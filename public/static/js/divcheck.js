$(function() {
	//替换原有的checkbox
	(function($) {
		//保存所有的checkbox对象
		var allcheckbox = {};
		var f = function(o) {
			if (!o) {
				return false;
			}
			this.bindevent = false;
			this.s_src = o;
			this.s_dest = null;
			//事件
			this.change = function() {};
			this.init();
		};
		f.prototype = {
			s_html: '<i  class="kl-checkbox"></i>',
			init: function() {
				var _t = this;
				var _s_src = this.s_src;
				if (!_s_src.prev().hasClass('kl-checkbox')) {
					_s_src.before(_t.s_html);
				}
				this.s_dest = _s_src.prev();
				_s_src.hide();
				this.tongbu();
			},
			//绑定事件
			bind: function(event, callback) {
				this[event] = callback;
			},
			tongbu: function() {
				var _t = this;
				_t.s_dest.attr('value', _t.s_src.val());
				if (_t.s_src.prop('checked')) {
					_t.s_dest.addClass('kl-selected');
				} else {
					_t.s_dest.removeClass('kl-selected');
				}
				if (!this.bindevent) {
					this.bindevent = true;
					_t.s_dest.click(function(event) {
						var _tt = $(this);
						if (_tt.hasClass('kl-selected')) {
							_tt.removeClass('kl-selected');
							//_t.s_src.prop('checked') && _t.s_src.prop('checked', false);
						} else {
							_tt.addClass('kl-selected');
							//_t.s_src.prop('checked') || _t.s_src.prop('checked', true);
						}
						_t.s_src.click();
					});
					_t.s_src.change(function(event) {
						_t.tongbu();
					});
				}
			}
		};
		window.hidecheckbox = {};
		/**通过id查找checkbox对象 id前缀为hidecheckbox_加上原来checkbox的name属性**/
		hidecheckbox.getAll = function() {
			return allcheckbox;
		};
		/**传入一个jquery checkbox 对象初始并隐藏原来的checkbox**/
		hidecheckbox.hide = function(oo) {
			var tem = [];
			var arg = arguments;
			oo.each(function(index, el) {
				var o = $(this);
				var b = new f(o);
				if (arg[1]) {
					if (/^\d+$/.test(arg[1])) {
						b.width = arg[1];
						b.s_dest.width(arg[1]);
					} else {
						b.s_dest.addClass(arg[1]);
					}
				}
				var id = 'hidecheckbox_' + index;
				allcheckbox[id] = b;
				b.s_dest.prop('id', id);
				b.id = id;
				tem.push(b);
			});

			return tem;
		};
		window.hideCheckbox = hidecheckbox;
	})($);

	//替换原有的radio
	(function($) {
		//保存所有的radio对象
		var allradio = {};
		var f = function(o) {
			if (!o) {
				return false;
			}
			this.bindevent = false;
			this.s_src = o;
			this.s_dest = null;
			this.s_group = null;
			//事件
			this.change = function() {};
			this.init();
		};
		f.prototype = {
			s_html: '<i  class="kl-radio"></i>',
			init: function() {
				var _t = this;
				var _s_src = this.s_src;
				if (!_s_src.prev().hasClass('kl-radio')) {
					_s_src.before(_t.s_html);
				}
				this.s_dest = _s_src.prev();
				_s_src.hide();
				var _name = this.s_src.prop('name');
				this.group = $('input[name="' + _name + '"][type="radio"]');
				this.tongbu();
			},
			//绑定事件
			bind: function(event, callback) {
				this[event] = callback;
			},
			tongbu: function() {
				var _t = this;
				_t.s_dest.prop('value', _t.s_src.val());
				if (_t.s_src.prop('checked')) {
					_t.group.prev().removeClass('kl-selected');
					_t.group.prop('checked', false);
					_t.s_dest.addClass('kl-selected');
					_t.s_src.prop('checked', true);
				}
				if (!this.bindevent) {
					this.bindevent = true;
					_t.s_dest.click(function(event) {
						var _tt = $(this);
						_t.group.prev().removeClass('kl-selected');
						_t.group.prop('checked', false);
						_tt.addClass('kl-selected');
						_t.s_src.prop('checked', true);
						_t.s_src.click();
					});
					_t.s_src.change(function(event) {
						_t.tongbu();
					});
				}
			}
		};
		window.hideradio = {};
		/**通过id查找radio对象 id前缀为hideradio_加上原来radio的name属性**/
		hideradio.findByName = function(radioname) {
			return allradio[radioname];
		};
		hideradio.getAll = function() {
			return allradio;
		};
		/**传入一个jquery radio 对象初始并隐藏原来的radio**/
		hideradio.hide = function(oo) {
			if (!oo) {
				return;
			}
			var tem = [];
			var arg = arguments;
			oo.each(function(index, el) {
				var o = $(this);
				var b = new f(o);
				if (arg[1]) {
					if (/^\d+$/.test(arg[1])) {
						b.width = arg[1];
						b.s_dest.width(arg[1]);
					} else {
						b.s_dest.addClass(arg[1]);
					}
				}
				var _id = b.s_src.prop('id');
				var _name = b.s_src.prop('name');
				var na = 'id__' + _id;
				(na == 'id__undefined') && (na = 'name__' + _name);
				(na == 'name__undefined') && (na = 'index_' + index);
				var id = 'hideradio__' + na + '__' + index;
				allradio[_name] || (allradio[_name] = {});
				allradio[_name][id] = b;
				b.s_dest.prop('id', id);
				b.id = id;
				tem.push(b);
			});

			return tem;
		};
		window.hideRadio = hideradio;
	})($);
});
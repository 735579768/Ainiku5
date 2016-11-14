! function(a, b) {
	var _hm = {
		/**
		 * 扩展属性方法
		 * @param  {[type]} obj [description]
		 * @return {[type]}     [description]
		 */
		extend: function(obj) {
			for (a in obj) {
				_hm[a] || (_hm[a] = obj[a]);
			}
		},
		init: function() {
			//默认导航
			var curl = window.location.pathname;
			$('#nav .nav-item a[href="' + curl + '"]').addClass('hover');
		}
	};
	a.hm = _hm;
}(window);
$(function() {
	hm.init();
});
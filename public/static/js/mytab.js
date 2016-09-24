/**
 * 使用方法
 * 		$('#mytab').mytab({
			ev: "mouseover", //事件
			navcls: ".kl-tab-nav", //导航
			divcls: ".kl-tab-div", //显示块
			navhovercls: "hover", //选中后的类
			divshowcls: "hover", //显示后的类
			showdiv: 1 //显示第一个div块
		});
 */

;
(function($) {
	$.fn.mytab = function(options) {
		var thissel = $(this).selector;
		var defaults = {
			ev: "click", //事件
			navcls: ".kl-tab-nav", //导航
			divcls: ".kl-tab-div", //显示块
			navhovercls: "hover", //选中后的类
			divshowcls: "hover", //显示后的类
			showdiv: 1 //显示第一个div块
		};
		var opts = $.extend(defaults, options);
		var navlist = $(thissel + " " + opts.navcls);
		var divlist = $(thissel + " " + opts.divcls);
		divlist.each(function(index, element) {
			$(this).data('tab-index', index);
		});
		navlist.each(function(index, element) {
			$(this).data('tab-index', index);
		});
		navlist.bind(opts.ev, function() {
			var obj = $(this);
			var tabindex = obj.data('tab-index');
			navlist.removeClass(opts.navhovercls);
			obj.addClass(opts.navhovercls);
			divlist.each(function(i) {
				var temobj = $(this);
				if ($(this).data('tab-index') == tabindex) {
					temobj.addClass(opts.divshowcls);
					temobj.show();
				} else {
					temobj.removeClass(opts.divshowcls);
					temobj.hide();
				}
			});
		});
		navlist.eq(opts.showdiv - 1).trigger(opts.ev);
	}
})(jQuery);
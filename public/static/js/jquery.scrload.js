(function($) {
	var data = {
		lock: false,
		conf: null,
		obj: null
	};

	function loadimg() {
		data.obj = $('.preload');
		data.obj.each(function(index, element) {
			try {
				var t = $(document).scrollTop();
				var h = $(window).height();
				var imgurl = data.conf.imgurl;
				var _this = $(this);
				if (_this.offset()) {
					var thistop = _this.offset().top;
					if (((thistop >= t && thistop - t < h) || (thistop < t && thistop + $(this).outerHeight() > t)) && typeof $(this).attr(imgurl) != "undefined") {
						$(this).attr("src", $(this).attr(imgurl));
						$(this).removeAttr(imgurl);
						$(this).removeAttr('preload');
						//delete data.obj[index];
					}
				}
			} catch (e) {
				//console.log(e);
				data.lock = false;
			}
		});
		data.lock = false;
	}
	$.fn.imgscrload = function(options) {
		var thissel = $(this).selector;
		var defaults = {
			imgurl: "data-imgurl",
			preload: 10,
			preimg: null
		};
		data.obj = this;
		var opts = $.extend(defaults, options);
		data.conf = opts;
		if (opts.preimg != null) this.attr("src", opts.preimg);
		$(window).bind("resize scroll", function() {
			if (!data.lock) {
				data.lock = true;
				loadimg();
			}

		});
		if (!data.lock) {
			//锁定并运行第一次
			data.lock = true;
			loadimg();
		}
	};
})(jQuery);
$(function() {
	$('.preload').imgscrload({
		imgurl: 'data-original',
		preload: 100,
		preimg: null
	});
});
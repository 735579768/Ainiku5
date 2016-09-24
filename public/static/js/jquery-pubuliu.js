;
(function($) {
	$.fn.liuLayout = function(options, callback) {
		var thissel = $(this).selector;
		var defaults = {
			'col': 4,
			'leftmg': 10,
			'topmg': 10,
			'container': '#itemblock',
			'items': '.item',
			'delay': 800,
			'delay2': 100,
			'addhtml': null
		};
		var opts = $.extend(defaults, options);
		var col = opts.col;
		var leftmg = opts.leftmg;
		var topmg = opts.topmg;
		var roww = Math.floor((this.width() - (leftmg * (col + 1))) / col);
		var pdl = parseInt(this.find(opts.items).css('paddingLeft'));
		var pdr = parseInt(this.find(opts.items).css('paddingRight'));
		var blw = parseInt(this.find(opts.items).css('borderLeftWidth'));
		var brw = parseInt(this.find(opts.items).css('borderRightWidth'));
		var csswidth = roww - pdl - pdr - blw - brw;
		this.css('position', 'relative');
		this.append(opts.addhtml);
		var itemlist = this.find(opts.items).not('.yes,.mark');
		itemlist.hide();
		this.find(opts.items).each(function(index, element) {
			$(this).attr('dataid', index);
		});
		itemlist.each(function(index, element) {
			var left, top, indexid;
			curindex = parseInt($(this).attr('dataid'));
			if (curindex < col) {
				top = topmg;
				left = (parseInt($(this).attr('dataid')) + 1) * leftmg + parseInt($(this).attr('dataid')) * roww;
				$(this).addClass('mark');
			} else {
				var dataid = 0;
				var ah = 1000000;
				$(thissel + ' .mark').each(function(index, element) {
					var b = parseInt($(this).css('top')) + $(this).outerHeight();
					if (b <= ah) {
						ah = b;
						dataid = parseInt($(this).attr('dataid'))
					}
				});
				$(thissel + ' ' + opts.items).eq(dataid).removeClass('mark');
				$(thissel + ' ' + opts.items).eq(dataid).addClass('yes');
				var b = dataid % col;
				top = topmg + ah;
				left = parseInt($(thissel + ' ' + opts.items).eq(dataid).css('left'));
			}
			$(this).css({
				'position': 'absolute',
				'left': left + 'px',
				'top': top + 'px',
				'width': csswidth + 'px'
			});
			$(this).addClass('mark');
			$(this).addClass('mark');
			$(this).addClass('yesshow');
		});
		maxh = 0;
		this.find(opts.items).each(function(index, element) {
			var b = parseInt($(this).css('top')) + $(this).outerHeight();
			if (b >= maxh) {
				maxh = b;
				dataid = parseInt($(this).attr('dataid'))
			}
		});
		paddingh = parseInt(this.css('paddingTop')) + parseInt(this.css('paddingBottom'));
		this.css('height', maxh + paddingh);
		window.oknum = $(thissel + ' .yesshow').length;
		window.showdivid = setInterval(function() {
			var objj = $(thissel + ' .yesshow').eq(0);
			objj.fadeIn(opts.delay, function() {
				window.oknum--;
				if ($(thissel + ' .yesshow').length == 0) {
					clearInterval(showdivid);
				}
				if (typeof(callback) == 'function' && window.oknum === 0) callback();
			});
			objj.removeClass('yesshow');
		}, opts.delay2);
	}
})(jQuery);
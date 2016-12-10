(function($) {
    $.fn.kldrag = function(options) {
	var _t=this;
    var a = {
		xxx:0,//元素到左边的距离
		yyy:0,//元素到顶边的距离
        _x:0,//鼠标到元素左边距离
        _y:0,//鼠标到元素顶边距离
		_mouseDown:false
    };
        var defaults = {
            titleheight:50,
            space:false,
            spacestyle:""
        };
        var opts = $.extend(defaults, options);
		var setxy=function(e){
            a.xxx = _t.offset().left;
            a.yyy = _t.offset().top;
            a._x = e.pageX - a.xxx;
            a._y = e.pageY - a.yyy;			
			};
		var ismove=function(e){
				if (opts.titleheight === 0 || opts.titleheight >= e.pageY-_t.offset().top) {
					 _t.css("cursor", "move");
					return true;
					}else{
					_t.css("cursor", "auto");
					return false;	
						}
			};
        _t.bind("mousedown", function(e) {
			a._mouseDown=true;
			setxy(e);
			var scryyy=$(document).scrollTop();
            if (opts.titleheight === 0 || opts.titleheight >= a._y) {
                _t.css({
                    zIndex:999999999,
                    position:"fixed",
                    left:a.xxx + "px",
                    top:a.yyy-scryyy + "px",
                    margin:"0px"
                });
            }
        });
        _t.bind("mousemove", function(e) {
            if (ismove(e)) {
                if (a._mouseDown) {
					var scryyy=$(document).scrollTop();
                    xx = e.pageX - a._x;
                    yy = e.pageY - a._y-scryyy;
                    _t.css({
                        zIndex:999999,
                        position:"fixed",
                        left:xx + "px",
                        top:yy + "px"
                    });
                }
            }
        });
        _t.bind("mouseup", function() {
			a._mouseDown=false;
        });
    };
})(jQuery);
! function(a, b) {
	"use strict";
	a.am = {
		resetLayout: function() {
			var h = $('#admin-header').outerHeight();
			var sh = $(window).height();
			$('#admin-left').height(sh - h);
			$('#admin-right').height(sh - h);
		}
	};
}(window);
$(function() {
	am.resetLayout();
	$(window).resize(function(event) {
		am.resetLayout();
	});
});
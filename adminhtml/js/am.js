! function(a, b) {
	"use strict";
	a.am = {
		initPage: function() {
			am.resetLayout();
			//侧栏关闭
			var header = $('#admin-header');
			var leftside = $('#admin-left');
			var closewest = $('#closeicon');
			var rightside = $('#admin-right');
			var leftw = leftside.outerWidth();
			closewest.click(function(e) {
				var _t = $(this);
				if (_t.css('left') == leftw + 'px') {
					_t.animate({
						'left': '0px'
					}, 200, function() {
						_t.addClass('open');
					});
					leftside.animate({
						'overflow': 'hidden',
						'left': '-' + leftw + 'px'
					}, 200);
					// rightside.css('marginLeft', '0px');
					rightside.animate({
						marginLeft: '0px'
					}, 200);
					ank.writeCookie('leftside', 0);
				} else {
					_t.animate({
						'left': leftw + 'px'
					}, 200, function() {
						_t.removeClass('open');
					});
					leftside.animate({
						'overflow': 'hidden',
						'left': '0px',
						'overflowY': 'scroll'
					}, 200);
					// rightside.css('marginLeft', leftw + 'px');
					rightside.animate({
						marginLeft: leftw + 'px'
					}, 200);
					ank.writeCookie('leftside', 1);
				}
			});
			leftside.css('top', header.outerHeight());
			rightside.css('marginTop', header.outerHeight());
			if (ank.readCookie('leftside') === '0') {
				leftside.css({
					left: '-' + leftw + 'px'
				});
				rightside.css('marginLeft', '0px');
				closewest.css('left', '0px');
				closewest.addClass('open');
			} else {
				closewest.css('left', leftw + 'px');
				rightside.css('marginLeft', leftw + 'px');
			}

		},
		resetLayout: function() {
			var h = $('#admin-header').outerHeight();
			var sh = $(window).height();
			$('#admin-left').height(sh - h);
			$('#admin-right').height(sh - h);
		},
		/**
		 * 单击框架导航
		 * @param  {[type]} dom [description]
		 * @return {[type]}     [description]
		 */
		iframeNavClick: function(dom) {
			var id = $(dom).data('id');
			if (id == undefined) {
				return false;
			}
			$('#nav-block .kl-tab-nav').removeClass('hover');
			$('#div-block .kl-tab-div').hide();
			$('#iframenav' + id).addClass('hover');
			$('#iframeblock' + id).show();
		},
		/**
		 * 关闭导航框架
		 * @param  {[type]} dom [description]
		 * @return {[type]}     [description]
		 */
		closeIframe: function(dom) {
			var id = $(dom).parents('.kl-tab-nav').data('id');
			$('#iframenav' + id).remove();
			$('#iframeblock' + id).remove();
			//查找有没有默认显示的
			if ($('#nav-block .kl-tab-nav.hover').length == 0) {
				$('#nav-block .kl-tab-nav:last').click();
			}
		},
		/**
		 * 添加一个新的框架页面
		 * @param {[type]} title [description]
		 * @param {[type]} url   [description]
		 */
		addIframe: function(title, url) {
			// debugger;
			// $('#loadingimg').show();
			var iframestr = '<span class="iframeloading"></span><iframe class="con-iframe" marginWidth=0 frameSpacing=0 marginHeight=0   frameborder="0" border="0" src="' + url + '"  noResize width="100%" scrolling=auto  vspale="0"></iframe>';
			var isyou = false;
			var ifarr = $('#admin-right iframe');
			ifarr.each(function(index, element) {
				var srcurl = $(this).attr('src');
				var par = $(this).parent();
				if (url == srcurl) {
					$(this).remove();
					par.append(iframestr);
					$('#iframenav' + index).click();
					isyou = true;
					return 0;
				}
			});
			if (isyou) return true;
			// $('#nav-block').width($('#div-block').width());
			$('#nav-block').append(' <li id="iframenav' + ifarr.length + '" onclick="am.iframeNavClick(this);"  class="chrome-tab kl-tab-nav"><span>' + title + '</span><i class="close fa fa-close" onclick="am.closeIframe(this);"></i><em></em></li>');
			$('#div-block').append(' <div id="iframeblock' + ifarr.length + '" class="kl-tab-div">' + iframestr + '</div>');
			$('#iframenav' + ifarr.length).data('id', ifarr.length);
			$('#iframenav' + ifarr.length).click();
			$('#nav-block .kl-tab-nav').each(function(index, el) {
				$(this).attr('id', 'iframenav' + index);
				$(this).prop({
					id: 'iframenav' + index
				});
				$(this).data('id', index);
			});
			$('#div-block .kl-tab-div').each(function(index, el) {
				$(this).prop({
					id: 'iframeblock' + index
				});
				$(this).data('id', index);
			});

			// rightMenu && rightMenu.init();
		},
		/**
		 * 左边主菜单单击
		 */
		menuTitleClick: function(dom) {
			var _t = $(dom);
			var icon = _t.find('i');
			var menuitem = _t.parents('.menu').find('.menu-item');
			if (icon.hasClass('menu-open')) {
				icon.removeClass('menu-open')
				icon.addClass('menu-close');
				menuitem.hide();
			} else {
				//先合并其它的菜单
				$('#left-menu .menu-open').parent().click();
				//打开单击的菜单
				icon.removeClass('menu-close')
				icon.addClass('menu-open');
				menuitem.show();
			}
		},
		/**
		 * 左边菜单单击
		 * @return {[type]} [description]
		 */
		menuClick: function(dom) {
			var _t = $(dom);
			var uri = _t.attr('data-url');
			var tex = _t.text();
			am.addIframe(tex, uri);
			return false;
			// am.addIframe('我的博客','https://www.zhaokeli.com/');
		}

	};
}(window);
//初始化页面
$(function() {
	am.initPage();
	$(window).resize(function(event) {
		am.resetLayout();
	});
});
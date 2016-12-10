! function(a, b) {
	"use strict";
	a.am = {
		/**
		 * 扩展属性方法
		 * @param  {[type]} obj [description]
		 * @return {[type]}     [description]
		 */
		extend: function(obj) {
			for (a in obj) {
				am[a] || (am[a] = obj[a]);
			}
		},
		/**
		 * 批量指定id并操作
		 * @return {[type]} [description]
		 */
		batchAction: function(dom, uri) {
			var _t = $(dom);
			uri || (uri = _t.attr('data-url'));
			var title = _t.text();
			layer.confirm('确定 "<span style="color:red;">' + title + '</span>" 吗?', {
				title: false,
				closeBtn: false,
				shade: 0.01,
				btn: ['确定', '取消']
			}, function() {
				// debugger;
				var ids = '';
				// console.log($('.check-item:checked').val());
				$('.check-item:checked').each(function(index, el) {
					ids += ids ? ',' + $(this).val() : $(this).val();
				});
				if (!ids) {
					ank.alert('请先选择信息!');
					return;
				}
				var lindex = layer.load(1, {
					shade: false //0.1透明度的白色背景
				});
				$.post(uri, {
					id: ids
				}, function(data) {
					layer.close(lindex);
					ank.alert(data, function(data) {
						if (data.code) {
							var id = _t.attr('list-id');
							id && $('#listitem' + id).remove();
							if (data.url) {
								window.location.href = data.url;
							} else {
								window.location.reload();
							}

						}
					});
				});
			});
		},
		importDatabase: function(dom) {
			// $(".db-import").click(function() {
			var _t = $(dom),
				status = ".",
				uri = $(dom).attr('data-url');
			$.get(uri, success, "json");
			window.onbeforeunload = function() {
				return "正在还原数据库，请不要关闭！"
			}
			return false;

			function success(data) {
				if (data.code) {
					if (data.data.gz) {
						data.msg += status;
						if (status.length === 5) {
							status = ".";
						} else {
							status += ".";
						}
					}
					// debugger;
					_t.parent().prev().find('span').html(data.msg);
					if (data.data.part) {
						$.get(uri, {
								"part": data.data.part,
								"start": data.data.start
							},
							success,
							"json"
						);
					} else {
						window.onbeforeunload = function() {
							return null;
						}
					}
				} else {
					ank.alert(data);
				}
			}
			return false;
			// });
		},
		checkAll: function(dom) {
			var _t = $(dom);
			var _wrap = $(dom).parents('.check-wrap');
			var _item = _wrap.find('.check-item')
			if (_t.is(':checked')) {
				_item.prop({
					checked: true
				});
			} else {
				_item.prop({
					checked: false
				});
			}
		},
		showSearch: function() {
			layer.open({
				shade: false,
				type: 1,
				offset: '10px',
				title: '高级搜索',
				area: ['400px'],
				content: $('#search-tool')
			});
		},
		updatePwd: function(dom, uri) {
			$.get(uri, function(data) {
				parent.layer.open({
					title: '修改密码',
					type: 1,
					area: ['300px', '330px'],
					content: data.data
				});
			});

		},
		okAction: function(dom, uri) {
			var _t = $(dom);

			uri || (uri = _t.attr('data-url'));
			var title = _t.text();
			layer.confirm('确定 "<span style="color:red;">' + title + '</span>" 吗?', {
				title: false,
				closeBtn: false,
				shade: 0.01,
				btn: ['确定', '取消']
			}, function() {
				var lindex = layer.load(1, {
					shade: false //0.1透明度的白色背景
				});
				$.get(uri, function(data) {
					layer.close(lindex);
					ank.alert(data, function(data) {
						var id = _t.attr('list-id');
						if (id && data.code) {
							$('#listitem' + id).remove();
						}
						if (data.url) {
							window.location.href = data.url;
						} else {
							window.location.reload();
						}
					});
				});
				layer.closeAll();
			});
		},
		/**
		 * 发送客户端的一些信息
		 */
		setClientParam: function() {
			if (ank.readCookie('setClientParam') == '1') {
				return;
			}
			ank.writeCookie('setClientParam', 1, 1);
			//传递电脑屏幕大小
			$.post(am.url.client, {
				screenwidth: $(window).width(),
				screenheight: $(window).height()
			}, function(data, textStatus, xhr) {

			});
		},
		initPage: function() {
			am.resetLayout();
			//侧栏关闭
			var header = $('#admin-header');
			var leftside = $('#admin-left');
			var closewest = $('#closeicon');
			var rightside = $('#admin-right');
			var leftw = leftside.outerWidth();
			// debugger;
			if (top.location === self.location) {
				am.setClientParam();
				$(window).resize(function(event) {
					if (am.yanchisend) {
						clearTimeout(am.yanchisend);
					}
					ank.writeCookie('setClientParam', 0)
					am.yanchisend = setTimeout(function() {
						am.setClientParam();
					}, 1500);

				});
			}
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
			//默认加载第一个主菜单的左侧菜单
			$('#mainnav a:first').click();
			this.initYesNo();
			this.blusChange();
		},
		resetLayout: function() {
			var h = $('#admin-header').outerHeight();
			var sh = $(window).height();
			$('#admin-left').height(sh - h);
			$('#admin-right').height(sh - h);
			$(window).resize(function(event) {
				var h = $('#admin-header').outerHeight();
				var navh = $('#nav-block').outerHeight();
				var sh = $(window).height();
				var ih = sh - h - navh;
				$('#div-block iframe').height(ih);
			});
		},
		setIframeHeight: function(dom) {
			var h = $('#admin-header').outerHeight();
			var navh = $('#nav-block').outerHeight();
			var sh = $(window).height();
			var obj = $(dom);
			obj.height(sh - h - navh);
			obj.prev().remove();
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
			var iframestr = '<span class="iframeloading"></span><iframe  onload="am.setIframeHeight(this);" class="con-iframe" marginWidth=0 frameSpacing=0 marginHeight=0   frameborder="0" border="0" src="' + url + '"  noResize width="100%" scrolling=auto  vspale="0"></iframe>';
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

			rightMenu && rightMenu.init();
		},
		/**
		 * 主导航加载左边菜单
		 * @return {[type]} [description]
		 */
		loadLeftMenu: function(dom) {
			var _t = $(dom);
			$('#mainnav li a').removeClass('hover');
			_t.addClass('hover');
			var setLeftMenu = function(data) {
				var leftmenu = $('#left-menu');
				var str = '';
				var menustr = $('#menu-html').text();
				var menuitem = $('#menu-item-html').text();
				for (a in data) {
					var s1 = menustr.replace('[#title#]', a);
					var s2 = '';
					for (b in data[a]) {
						s2 += menuitem.replace('[#title#]', data[a][b]['title']).replace('[#url#]', data[a][b]['url']).replace('[#icon_class#]', data[a][b]['icon_class']);
					}
					s1 = s1.replace('[#menu_item_list#]', s2);
					str += s1;
				}
				leftmenu.html(str);
				leftmenu.children('dl:first').find('dt a').click();
			};
			var data = _t.data('data');
			if (data) {
				setLeftMenu(data);
			} else {
				var uri = _t.attr('data-url');
				if (uri) {
					var ind = layer.load(1, {
						shade: false //0.1透明度的白色背景
					});
					$.get(uri, function(data) {
						layer.close(ind);
						_t.data('data', data.data);
						setLeftMenu(data.data);
					});

				}
			}


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
		},
		/**
		 * 更新字段值
		 * @return {[type]} [description]
		 */
		blusChange: function(dom) {
			var objlist = $('.ajax-blur').not('.inited');
			objlist.focus(function(event) {
				$(this).data('value', $(this).val());
			});
			objlist.blur(function(event) {
				// debugger;
				var _t = $(this);
				var table1 = _t.attr("data-table");
				var field1 = _t.attr("data-field");
				var id1 = _t.attr("data-id");
				var data1 = _t.val();
				var data_src = _t.data('value');
				if (data1 != data_src) {
					$.post(am.url.updateField, {
						id: id1,
						table: table1,
						field: field1,
						value: data1
					}, function(data, textStatus, xhr) {
						(data.code == 0) && ank.alert(data);
					});
				}
			});
			objlist.addClass('inited');

		},
		initYesNo: function() {
			//y n 插件
			$(".yesno").not('.inited').each(function(index, element) {
				var _t = $(this);
				var da = _t.attr("data-value");
				_t.addClass('inited');
				if (da == 1) {
					_t.addClass("yes");
				} else {
					_t.addClass("no");
				}
				_t.click(function(e) {
					// debugger;
					var _tt = $(this);
					var data1 = parseInt(_tt.attr("data-value"));
					var table1 = _tt.attr("data-table");
					var field1 = _tt.attr("data-field");
					var id1 = _tt.attr("data-id");
					var qh = function() {
						if (_tt.hasClass("yes")) {
							_tt.attr("data-value", 0);
							_tt.removeClass("yes");
							_tt.addClass("no");
						} else {
							_tt.attr("data-value", 1);
							_tt.removeClass("no");
							_tt.addClass("yes");
						}
					};
					data1 = data1 ? 0 : 1;
					if (data1 !== "" && table1 !== "" && field1 !== "" && id1 !== "") {
						qh();
						$.post(am.url.updateField, {
							id: id1,
							table: table1,
							field: field1,
							value: data1
						}, function(data, textStatus, xhr) {
							(data.code == 0) && ank.alert(data);
						});
					}
				});
			});
		}


	};
	/**
	 * 右键菜单绑定
	 * @type {Object}
	 */
	a.rightMenu = {
		currentTab: null,
		init: function() {
			// debugger;
			$('#youmenu').hover(function() {
				$('#youmenu').show();
			}, function() {
				$('#youmenu').hide();
			});
			//右键菜单
			$('.chrome-tab').bind('contextmenu', function(e) {
				$('#nav-block .chrome-tab').removeClass('currenttab');
				$(this).addClass('currenttab');
				rightMenu.currentTab = $(this);
				try {
					if (window.event) e = window.event;
					$('#youmenu').css({
						left: e.clientX - 5,
						top: e.clientY - 5
					});
					$('#youmenu').show();
				} catch (e) {
					console.log(e);
				}
				return false;
			});
		},
		closeTab: function() {
			this.currentTab && this.currentTab.find('.close').click();
			$('#youmenu').hide();
		},
		closeOtherTab: function() {
			$('#nav-block .chrome-tab').not('.currenttab').find('.close').click();
			$('#youmenu').hide();
		}
	};
}(window);
/**
 * 绑定编辑框表单自动验证
 */
! function(a, b) {
	a.autoyz = {
		yzstr: {
			ok: '<span class="yzok"></span>',
			err: '<span class="yzerr"></span>',
			th1: '<span class="yzth1"></span>',
			th2: '<span class="yzth2"></span>'
		},
		isregok: function(obj) {
			var rearr = new Array();
			rearr[0] = '^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$'; //email
			rearr[1] = '^http(s?):\/\/(?:[A-za-z0-9-]+\.)+[A-za-z]{2,4}(:\d+)?(?:[\/\?#][\/=\?%\-&~`@[\]\':+!\.#\w]*)?$'; //url
			rearr[2] = '^\d+(\.\d+)?$'; //货币
			rearr[3] = '^\d+$'; //数字
			rearr[4] = '^[1][0-9]{10}$'; //mobile
			var s1 = obj.val();
			var re = obj.attr('data-reg');
			re = re.replace('[email]', rearr[0]); //邮箱
			re = re.replace('[mobile]', rearr[4]); //手机
			var re = new RegExp(re);
			if (re.test(s1)) {
				return true;
			} else {
				return false;
			}
		},
		init: function() {
			var _this = this;
			var dobj = $('input.autoyz');
			dobj.wrap('<div class="autoyz-wrap" style="position:relative;display:inline-block;"></div>');
			dobj.parent().append('<span></span>');
			dobj.focus(function(e) {
				if (!_this.isregok($(this))) {
					var s1 = $(this).attr('data-ts');
					var ob = $(this).parent().find('span');
					ob.removeAttr('class');
					ob.addClass('yzth1');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
				} else {
					//正确
					var s1 = $(this).attr('data-ok');
					s1 = (s1 == '' || typeof(s1) == 'undefined') ? '格式正确' : s1;
					var ob = $(this).parent().find('span').eq(0);
					ob.removeAttr('class');
					ob.addClass('yzok');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
				}
			});
			dobj.blur(function(e) {
				if (_this.isregok($(this))) {
					//正确
					var s1 = $(this).attr('data-ok');
					s1 = (s1 == '' || typeof(s1) == 'undefined') ? '格式正确' : s1;
					var ob = $(this).parent().find('span').eq(0);
					ob.removeAttr('class');
					ob.addClass('yzok');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
				} else {
					//错误
					var s1 = $(this).attr('data-err');
					s1 = (s1 == '' || typeof(s1) == 'undefined') ? '格式错误,请重新输入' : s1;
					var ob = $(this).parent().find('span').eq(0);
					ob.removeAttr('class');
					ob.addClass('yzerr');
					ob.html(s1);
					ob.css('right', '-' + (ob.width() + 60) + 'px');
					ob.show();
					$(this).val('');
				}
			});
		}
	};
}(window);
/**
 * 分类树
 */
! function(a, b) {
	a.catetree = {
		cateid: Math.ceil(Math.random() * 100000),
		init: function() {
			//初始化把没有子菜单的去掉图标
			var obj = $('#cate-tree .c-item').not('.inited');
			obj.each(function(index, el) {
				var _t = $(this);
				var icon = _t.children('dt').children('.c-ico').children('i');
				var idd = _t.children('dt').children('.c-id').html();
				// debugger;
				icon.prop({
					id: 'catetree_' + catetree.cateid + '_' + idd
				});
				icon.data('id', idd);
				var len = _t.children('.c-sub-item').length;
				if (len) {
					icon.addClass('menuclose');
				}
				_t.addClass('inited');
			});
			this.openMenuByCookie();
		},
		/**
		 * 通过cookie打开菜单
		 * @return {[type]} [description]
		 */
		openMenuByCookie: function() {
			//把状态保存到cookie进行初始化打开菜单
			var sta = ank.readCookie('catetreejson');
			sta = sta ? sta.split(',') : [];
			for (a in sta) {
				var o = $('#catetree_' + catetree.cateid + '_' + sta[a]);
				// debugger;
				o && o.hasClass('menuclose') && this.menuClick(o, false);
			}
		},
		/**
		 * 菜单单击后打开关闭
		 * @param  {[type]} dom         单击的ico菜单图标
		 * @param  {[type]} writeCookie 是否记录cookie,默认是记录
		 * @return {[type]}             [description]
		 */
		menuClick: function(dom, writeCookie) {
			if (typeof writeCookie === 'undefined') {
				writeCookie = true;
			}
			var _t = $(dom);
			var jsondata = _t.data('data');
			if (jsondata) {
				//已经加载过子菜单啦
				this.openCloseMenu(_t, writeCookie);
			} else {
				_t.data('data', true);
				catetree.openCloseMenu(_t, writeCookie);
				var d = _t.parents('dt').next();
				d.html('<div class="loading loadtree"></div>')
					//还没有加载过子菜单
				var uri = _t.attr('data-url');
				if (uri) {
					$.get(uri, function(da) {
						d.html(da.data);
						catetree.init();
						am.initYesNo();
						am.blusChange();
					});
				}
			}


		},
		/**
		 * 打开指定ico的菜单
		 * @param  {[type]} $dom        菜单图标
		 * @param  {[type]} writeCookie 是否记录到cookie,默认为记录
		 * @return {[type]}             [description]
		 */
		openCloseMenu: function($dom, writeCookie) {
			if (typeof writeCookie === 'undefined') {
				writeCookie = true;
			}
			var _t = $dom;
			var subitem = _t.parents('dl').eq(0).children('.c-sub-item');
			if (_t.hasClass('menuopen')) {
				_t.removeClass('menuopen');
				_t.addClass('menuclose');
				subitem.hide();
			} else {
				_t.removeClass('menuclose');
				_t.addClass('menuopen');
				subitem.show();
			}
			if (writeCookie) {
				//保存状态到cookie
				var sel = '';
				$('#cate-tree .c-ico i.menuopen').each(function(index, el) {
					var id = $(this).data('id');
					sel += sel ? (',' + id) : id;
				});
				ank.writeCookie('catetreejson', sel);
			}
		},
		//打开添加新分类的窗口
		addCategory: function() {

		}
	};
}(window);
//数据库备份
! function(a, b) {
	var _t = this;
	var $form,
		$export,
		tables,
		$optimize, $repair;
	var backup = function(tab, status) {
		status && showmsg(tab.id, "开始备份...(0%)");
		$.get($form.attr("action"), tab, function(data) {
			if (data.code) {
				showmsg(tab.id, data.msg);

				if (!$.isPlainObject(data.data.tab)) {
					$export.parent().children().removeClass("disabled");
					$export.html("备份完成，点击重新备份");
					window.onbeforeunload = function() {
						return null
					}
					ank.alert('备份完成，点击重新备份!');
					return;
				}
				backup(data.data.tab, tab.id != data.data.tab.id);
			} else {
				ank.alert(data);
				$export.parent().children().removeClass("disabled");
				$export.html("立即备份");
				setTimeout(function() {
					$('#top-alert').find('button').click();
					$(that).removeClass('disabled').prop('disabled', false);
				}, 1500);
			}
		}, "json");
	};
	var showmsg = function(id, msg) {
		// console.log(tables[id]);
		$form.find("input[value=" + tables[id] + "]").closest("tr").find(".info").html(msg);
	};
	a.database = {
		init: function() {
			$form = $("#export-form");
			$export = $("#export");
			$optimize = $("#optimize");
			$repair = $("#repair");

			$optimize.add($repair).click(function() {
				$.post(this.href, $form.serialize(), function(data) {
					ank.alert(data);
					setTimeout(function() {
						$('#top-alert').find('button').click();
						//  $(that).removeClass('disabled').prop('disabled',false);
					}, 1500);
				}, "json");
				return false;
			});

			$export.click(function() {
				$export.parent().children().addClass("disabled");
				$export.html("正在发送备份请求...");
				$.post(
					$form.attr("action"),
					$form.serialize(),
					function(data) {
						if (data.code) {
							tables = data.data.tables;
							$export.html(data.msg + "开始备份，请不要关闭本页面！");
							// debugger;
							backup(data.data.tab);
							window.onbeforeunload = function() {
								return "正在备份数据库，请不要关闭！"
							}
						} else {
							ank.alert(data);
							$export.parent().children().removeClass("disabled");
							$export.html("立即备份");
							setTimeout(function() {
								$('#top-alert').find('button').click();
								//$(that).removeClass('disabled').prop('disabled',false);
							}, 1500);
						}
					},
					"json"
				);
				return false;
			});
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
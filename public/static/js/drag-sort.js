/**
 ***********************************************************
 *****|本插件可以修改但请保留头部信息,谢谢
 *****|author 枫叶
 *****|bug反馈 email <735579768@qq.com>
 *****|blog url http://www.zhaokeli.com
 *****|兼容ie6/7/8/9 chorme fire 
 *****|注意要拖动的item元素里面的style属性不要设置
 ***********************************************************
 */
;
(function($) {
	function drag() {
		this._ts = this;
		this.pthis = null;
		this.data = {
			conf: '', //插件的配置
			divspace: '', //占们空间元素
			mousedown: false, //鼠标按下
			_x: 0, //当前拖动元素上鼠标相对元素的坐标
			_y: 0,
			//dragblockobj:null,//拖动区域对象
			dragobj: null //正在拖动的对象
		};
		/**
		 *把临时item占位空间转为待插入元素的空间
		 */
		this.toDivSpace = function(a) {
				a.removeClass('temitem');
				a.addClass('divspace');
				a.addClass('todivspace');
			}
			/**
			 *把分组中的占位item转为item占位空间
			 */
		this.toTemItem = function() {
				//如果当前拖动项目不在这个区域就还转成临时项目
				this.pthis.find('.todivspace').each(function(index, element) {
					$(this).addClass('temitem');
					$(this).removeClass('divspace');
					$(this).removeClass('todivspace');
				});

			}
			/**
			 *移除占位空间
			 */
		this.removeSpace = function() {
				this.pthis.find('.divspace').remove();
			}
			//判断元素移动到哪个子元素上啦
			/**
			 *@param dragblockobj 拖动的区域
			 *@param dragitem  区域内的排序item
			 *@param da 传递过来的正在拖动的对象的位置信息是一个json对象包含坐标和宽高
			 */
		this.getobj = function(dragitem, da) {

				var info = {
					o: null, //查到满足条件的对象
					insert: 'before', //插入到前面还是后面,避免最后一个元素不能排序
					status: 0 //查找的结果0为没找到1为找到
				};
				var itemnum = null; //定义一个找到的满足条件的元素索引
				this.pthis.find(dragitem).each(function(index, element) {
					//取当前拖动对象的边距
					cury = da.y;
					curx = da.x;
					curdragid = da.dragid;

					//子元素的距离
					var yyy = $(this).offset().top;
					var xxx = $(this).offset().left;
					var cW = $(this).outerWidth();
					var cH = $(this).outerHeight();
					var cdragid = $(this).attr('dragid');
					//取当前元素y的绝对值
					absy = Math.abs(cury - yyy);
					absx = Math.abs(curx - xxx);
					//console.log('相对于元素'+index+'的坐标为：'+absx+'---'+absy);
					bo = (cury !== yyy && curx !== xxx && absy < (cH / 2) && absx < (cW / 2) && curdragid !== cdragid);
					if (bo) {
						if (yyy < cury) {
							itemnum = index;
							info.status = 1;
							return false;
						} else {
							itemnum = index;
							info.status = 1;
							info.insert = 'after';
							return false;
						}
					}
				});

				if (itemnum == null) {
					return info;
				} else {
					info.o = this.pthis.find(dragitem).eq(itemnum);
					return info;
				}

			}
			/**
			 *初始化drag
			 */
		this.init = function() {
			var _ts = this;
			var _da = this.data;
			var _pt = this.pthis;
			var _cf = _ts.data.conf;
			_pt.css('position', 'relative');
			_cf.dragitem = _cf.dragitem + ',.temitem,.todivspace';
			_pt.bind('mouseup', function(e) {
				_da.mousedown = false;
			});
			//在有效区域内注册鼠标移动事件
			_pt.bind('mousemove', function(e) {
				if (_da.mousedown && _da.dragobj != null) {
					var obj = _da.dragobj; //正在拖动的对象
					var _ptx = _pt.offset().left;
					var _pty = _pt.offset().top;
					var xx = e.pageX - (_da._x) - _ptx;
					var yy = e.pageY - (_da._y) - _pty;
					obj.css({
						zIndex: 1000,
						position: 'absolute',
						left: xx + 'px',
						top: yy + 'px',
						paddingLeft: obj.css('paddingLeft'),
						paddingTop: obj.css('paddingTop'),
						paddingRight: obj.css('paddingRight'),
						paddingBottom: obj.css('paddingBottom'),
						width: obj.css('width'),
						height: obj.css('height')
					});
					//取当前拖动元素的信息组合成一个json对象
					var da = {
						y: yy + _pty,
						x: xx + _ptx,
						h: obj.outerHeight(),
						w: obj.outerWidth(),
						dragid: obj.attr('dragid')
					};
					var info = _ts.getobj(_cf.dragitem, da);
					if (info.status === 1) {
						if (info.o.hasClass('temitem') || info.o.hasClass('todivspace')) {
							_ts.toDivSpace(info.o);
						} else if (info.insert === 'after') {
							_ts.toTemItem();
							_ts.removeSpace();
							info.o.after(_da.divspace);
						} else {
							_ts.toTemItem();
							_ts.removeSpace();
							info.o.before(_da.divspace);
						}


					} else {
						//没有找到要插入的元素的时候也要把区域内的临时点位空间转成临时item
						_ts.toTemItem();
					}
				}
			});

			//遍历拖动项目
			_pt.find(_cf.dragitem).each(function(index, element) {
				var t = $(this);
				//添加一个唯一的标识
				t.attr('dragid', index);
				t.bind('mousedown', function(e) {
					var tt = $(this);
					_da.mousedown = true;
					_da.dragobj = tt; //填充对象
					//取元素到页面top和left上的坐标
					var xxx = tt.offset().left;
					var yyy = tt.offset().top;

					//计算鼠标相对于元素上的坐标并保存状态
					_da._x = e.pageX - xxx;
					_da._y = e.pageY - yyy;


					_ts.removeSpace();
					//保存占位空间

					_da.divspace = '<div class="divspace" style="margin:' + tt.css('margin') + ';width:' + (tt.outerWidth() - 2) + 'px;height:' + (tt.outerHeight() - 2) + 'px;border:dashed 1px #f00;' + _cf.spacestyle + '"></div>';
					tt.before(_da.divspace);
					_pt.find('.divspace').css('marginLeft', tt.css('marginLeft'));
					_pt.find('.divspace').css('marginRight', tt.css('marginRight'));
					_pt.find('.divspace').css('marginTop', tt.css('marginTop'));
					_pt.find('.divspace').css('marginBottom', tt.css('marginBottom'));
					_da.divspace = '<div class="divspace" style="' + $('.divspace').eq(0).attr('style') + '"></div>';
					tt.css('cursor', 'move');

					tt.css({
						zIndex: 1000,
						position: 'absolute',
						left: xxx - _pt.offset().left + 'px',
						top: yyy - _pt.offset().top + 'px',
						paddingLeft: tt.css('paddingLeft'),
						paddingTop: tt.css('paddingTop'),
						paddingRight: tt.css('paddingRight'),
						paddingBottom: tt.css('paddingBottom'),
						width: tt.css('width'),
						height: tt.css('height')
					});
					//查找不是不有分组
					if (_cf.draggroup != '') {
						dragitem = tt; //有疑问的代码
						_pt.find(_cf.draggroup).each(function(index, element) {
							var ttt = $(this);
							if (ttt.find(_cf.dragitem).length === 0) {
								//添加临时item
								ttt.append(_da.divspace);
								var b = ttt.find('.divspace');
								b.removeClass('divspace');
								b.addClass('temitem');
								b.attr('dragid', 99999 + index);
							}
						});
					}

				});

				t.bind('mouseup', function() {
					var tt = $(this);
					_da.mousedown = false;
					_da.lock = null; //删除对象

					//优先插入
					var selstr = '';
					if (_pt.find('.todivspace').length > 0) {
						selstr = '.todivspace';

					} else {
						selstr = '.divspace';
					}


					var obj = _pt.find(selstr);
					var _top = (obj.offset().top || 0) - _pt.offset().top;
					var _left = obj.offset().left - _pt.offset().left;
					tt.animate({
						left: _left,
						top: _top
					}, 100, function() {
						obj.before(tt);
						tt.removeAttr('style');
						_pt.find('.divspace,.temitem').remove();
						if (typeof(_cf.success) === 'function') _cf.success(_pt);
					});

				});
			});


		};

	};
	$.fn.kldrag = function(options) {
		this.each(function(index, element) {
			var obj = new drag();
			var defaults = {
				'spacestyle': '', //点位空间样式
				'dragitem': '.dragitem', //排序的项目类选择器
				'draggroup': '', //拖动项目分组/子容器
				'success': function() {}
			};

			var opts = $.extend(defaults, options);
			obj.data.conf = opts;
			obj.pthis = $(this);
			obj.init();
		});
	};
})(jQuery);
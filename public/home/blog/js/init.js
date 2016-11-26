$(function() {
	window.blog = {
		runCodeArray: [],
		initpage: function() {
			var nav = $('#nav');
			//默认导航
			var curl = window.location.pathname;
			$('#nav .nav-item a[href="' + curl + '"]').addClass('hover');

			//手机端导航设置
			$('#shownav').click(function(event) {
				$('#nav .nav-item').toggle();
			});
			showHideNav.init('#nav');

		},
		toLiuYan: function() {
			$.scrollTo('#liuyanmd', 200);
		},
		//初始化编辑器
		initEditor: function(id, yuyan) {
			if (typeof ace == 'undefined') {
				return;
			}
			var editor = ace.edit(id);
			editor.setTheme("ace/theme/monokai");
			editor.setOptions({
				enableBasicAutocompletion: true,
				enableSnippets: true,
				showPrintMargin: false,
				enableLiveAutocompletion: true
			});
			//document.getElementById('editor').style.fontSize='14px';
			editor.session.setMode("ace/mode/" + yuyan);
			//editor.setShowPrintMargin(false);
			//editor.setValue("<?php\n\n ?>");
			editor.setReadOnly(true);
			return editor;
		},
		runCode: function(code) {
			/*			var newWin = window.open("", "_blank", "");
						newWin.opener = null; // 防止代码对页面修改
						newWin.document.open();
						newWin.document.write(code);
						newWin.document.close();*/
			var index = layer.open({
				title: '运行代码',
				type: 2,
				shift: 1,
				shadeClose: true,
				maxmin: true,
				area: ['1000px', '600px'],
				content: '_blank',
				success: function(dom, index) {
					layer.full(index);
				}
			});
			var newWin = document.getElementById('layui-layer-iframe' + index);
			newWin = newWin && newWin.contentWindow;
			newWin.opener = null;
			newWin.document.open();
			newWin.document.write(code);
			newWin.document.close();
		},
		initDetailPage: function() {
			var index = 0;
			var runcode = function(obj) {
				var _t = obj;
				_t.css({
					//width: _t.outerWidth(),
					height: _t.outerHeight() + 20
				});
				var runid = 'runcode' + (index++);
				_t.attr('id', runid);


				//str = str.replace(/&lt;/ig, '<');
				//str = str.replace(/&gt;/ig, '>');
				var str = _t.html();
				str = str.replace(/&nbsp;/ig, ' ');
				str = str.replace(/&quot;/ig, '"');
				str = str.replace(/&#39;/ig, "'");
				_t.html(str);
				_t.after('<div class="runcode-btn"><br><a href="javascript:;" onclick="blog.runCode(blog.runCodeArray[' + index + '].getValue());" class="btn" style="color:#fff;">运行代码</a></div>');
				blog.runCodeArray[index] = blog.initEditor(runid, 'html');
				blog.runCodeArray[index].setReadOnly(false);
			};
			$('.runcode,.runtextarea').each(function(index, element) {
				runcode($(this));
			});

			//显示其它代码
			$('#article-con pre').not('.inited').each(function(index, el) {
				var _t = $(this);
				_t.before('<a href="JavaScript:;" class="btn copybtn">复制代码</a>');
				var copybtnobj = _t.prev();
				copybtnobj.data('index', index);
				_t.data('index', index);

				_t.css({
					width: _t.outerWidth(),
					height: _t.outerHeight() + 10
				});
				var runid = 'runcode' + index;
				_t.attr('id', runid);
				//判断是什么类型的代码
				var eclass = _t.prop('class');
				eclass = eclass.replace(/\s+/ig, '');
				var re = /brush\:(\w+)\;?.*?/ig;
				var ma = re.exec(eclass);
				if (ma != null) {
					var yuyan = ma[1];
					// if (yuyan.toLowerCase() == 'html') {
					// 	runcode(_t);
					// } else {
					for (a in blog.acemode) {
						var restr = blog.acemode[a];
						var reg = new RegExp(restr[0]);
						if (reg.test(yuyan)) {
							yuyan = a.toLowerCase();
							break;
						}
					}
					var str = _t.html();
					if (yuyan.toLowerCase() == 'php') {
						str = "&lt;?php\r\n" + str + "\r\n?&gt;";
					}
					str = str.replace(/&nbsp;/ig, ' ').replace(/&quot;/ig, '"').replace(/&#39;/ig, "'");
					_t.html(str);
					blog.runCodeArray[index] = blog.initEditor(runid, yuyan);
					copybtnobj.data('data', blog.runCodeArray[index].getValue());
					// }
					_t.addClass('inited');

				}
			});
			//先绑定文档页面复制按钮
			$('.copybtn').each(function(index, el) {
				var _t = $(this);
				FlashCopy.setCopy({
					domid: _t[0], //绑定要点击复制的按钮
					getCopyText: function(dom) {
						// 在这里返回要复制的值
						return $(dom).data('data');
					},
					copySuccess: function(dom, text) {
						layer.msg('代码复制成功');
					}
				});
			});

		},
		yasuocss: {
			/**
			 * 压缩代码
			 * @param {[type]} code [description]
			 */
			S: function(code) {
				code = code.replace(/(\n|\t|\s)*/ig, '$1');
				code = code.replace(/\n|\t|\s(\{|}|\,|\:|\;)/ig, '$1');
				code = code.replace(/(\{|}|\,|\:|\;)\s/ig, '$1');
				return code;
			},
			/**
			 * 格式化代码(多行)
			 * @param {[type]} code [description]
			 */
			B: function(code) {
				code = this.S(code);
				//code=code.replace(/(\{)/ig,'$1');
				code = code.replace(/({|;)/ig, "$1\n\t");
				code = code.replace(/t*(})/ig, "$1\n");
				code = code.replace(/(\*\/)/ig, "$1\n");
				return code;
			},
			/**
			 * 格式化代码(单行)
			 * @param {[type]} code [description]
			 */
			C: function(code) {
				code = this.S(code);
				code = code.replace(/(\})/ig, '$1\n');
				code = code.replace(/(\*\/)/ig, '$1\n');
				return code;
			},
			/**
			 * 删除注释
			 */
			D: function(code) {
				code = code.replace(/(\/\*.*?\*\/\n?)/ig, '');
				return code;
			}

		},
		acemode: {
			ABAP: ["abap"],
			ABC: ["abc"],
			ActionScript: ["as"],
			ADA: ["ada|adb"],
			Apache_Conf: ["^htaccess|^htgroups|^htpasswd|^conf|htaccess|htgroups|htpasswd"],
			AsciiDoc: ["asciidoc|adoc"],
			Assembly_x86: ["asm|a"],
			AutoHotKey: ["ahk"],
			BatchFile: ["bat|cmd"],
			C_Cpp: ["^cpp|^c|^cc|^cxx|^h|^hh|^hpp|^ino"],
			C9Search: ["c9search_results"],
			Cirru: ["cirru|cr"],
			Clojure: ["clj|cljs"],
			Cobol: ["CBL|COB"],
			coffee: ["coffee|cf|cson|^Cakefile"],
			ColdFusion: ["cfm"],
			CSharp: ["cs"],
			CSS: ["css"],
			Curly: ["curly"],
			D: ["d|di"],
			Dart: ["dart"],
			Diff: ["diff|patch"],
			Dockerfile: ["^Dockerfile"],
			Dot: ["dot"],
			Dummy: ["dummy"],
			DummySyntax: ["dummy"],
			Eiffel: ["e|ge"],
			EJS: ["ejs"],
			Elixir: ["ex|exs"],
			Elm: ["elm"],
			Erlang: ["erl|hrl"],
			Forth: ["frt|fs|ldr"],
			FTL: ["ftl"],
			Gcode: ["gcode"],
			Gherkin: ["feature"],
			Gitignore: ["^.gitignore"],
			Glsl: ["glsl|frag|vert"],
			Gobstones: ["gbs"],
			golang: ["go"],
			Groovy: ["groovy"],
			HAML: ["haml"],
			Handlebars: ["hbs|handlebars|tpl|mustache"],
			Haskell: ["hs"],
			haXe: ["hx"],
			HTML: ["html|htm|xhtml"],
			HTML_Elixir: ["eex|html.eex"],
			HTML_Ruby: ["erb|rhtml|html.erb"],
			INI: ["ini|conf|cfg|prefs"],
			Io: ["io"],
			Jack: ["jack"],
			Jade: ["jade"],
			Java: ["java"],
			JavaScript: ["js|jsm|jsx"],
			JSON: ["json"],
			JSONiq: ["jq"],
			JSP: ["jsp"],
			JSX: ["jsx"],
			Julia: ["jl"],
			LaTeX: ["tex|latex|ltx|bib"],
			Lean: ["lean|hlean"],
			LESS: ["less"],
			Liquid: ["liquid"],
			Lisp: ["lisp"],
			LiveScript: ["ls"],
			LogiQL: ["logic|lql"],
			LSL: ["lsl"],
			Lua: ["lua"],
			LuaPage: ["lp"],
			Lucene: ["lucene"],
			Makefile: ["^Makefile|^GNUmakefile|^makefile|^OCamlMakefile|make"],
			Markdown: ["md|markdown"],
			Mask: ["mask"],
			MATLAB: ["matlab"],
			Maze: ["mz"],
			MEL: ["mel"],
			MUSHCode: ["mc|mush"],
			MySQL: ["mysql"],
			Nix: ["nix"],
			NSIS: ["nsi|nsh"],
			ObjectiveC: ["m|mm"],
			OCaml: ["ml|mli"],
			Pascal: ["^pas$|^p$"],
			Perl: ["pl|pm"],
			pgSQL: ["pgsql"],
			PHP: ["php|phtml|shtml|php3|php4|php5|phps|phpt|aw|ctp|module"],
			Powershell: ["ps1|ps"],
			Praat: ["praat|praatscript|psc|proc"],
			Prolog: ["plg|prolog"],
			Properties: ["properties"],
			Protobuf: ["proto"],
			Python: ["py"],
			R: ["r"],
			Razor: ["cshtml"],
			RDoc: ["Rd"],
			RHTML: ["Rhtml"],
			RST: ["rst"],
			Ruby: ["rb|ru|gemspec|rake|^Guardfile|^Rakefile|^Gemfile"],
			Rust: ["rs"],
			SASS: ["sass"],
			SCAD: ["scad"],
			Scala: ["scala"],
			Scheme: ["scm|sm|rkt|oak|scheme"],
			SCSS: ["scss"],
			SH: ["sh|bash|^.bashrc"],
			SJS: ["sjs"],
			Smarty: ["smarty|tpl"],
			snippets: ["snippets"],
			Soy_Template: ["soy"],
			Space: ["space"],
			SQL: ["sql"],
			SQLServer: ["sqlserver"],
			Stylus: ["styl|stylus"],
			SVG: ["svg"],
			Swift: ["swift"],
			Tcl: ["tcl"],
			Tex: ["tex"],
			Text: ["txt"],
			Textile: ["textile"],
			Toml: ["toml"],
			Twig: ["twig|swig"],
			Typescript: ["ts|typescript|str"],
			Vala: ["vala"],
			VBScript: ["vbs|vb"],
			Velocity: ["vm"],
			Verilog: ["v|vh|sv|svh"],
			VHDL: ["vhd|vhdl"],
			Wollok: ["wlk|wpgm|wtest"],
			XML: ["xml|rdf|rss|wsdl|xslt|atom|mathml|mml|xul|xbl|xaml"],
			XQuery: ["xq"],
			YAML: ["yaml|yml"],
			Django: ["html"]
		}
	};

	/**
	 * 使用前请把导航样式定位到顶部0px,定位用fixed
	 * @type {Object}
	 */
	window.showHideNav = {
		/**
		 * 绑定导航显示和隐藏
		 */
		init: function(id) {
			var _t = this;
			_t.scrollh = 0;
			_t.seting = false;
			_t.nav = $(id);
			$(document).scroll(function(event) {
				if (!_t.seting) {
					_t.seting = true;
					var nav = _t.nav;
					var navh = nav.outerHeight();
					var wh = $(window).scrollTop();
					if (wh > navh && (wh - _t.scrollh) > 0) {
						//向下滚动,隐藏导航

						if (nav.css('top') == '0px') {
							nav.stop(true).animate({
								top: 5
							}, 100, function() {
								nav.stop(true).animate({
									top: -navh
								}, 300, function() {
									_t.seting = false;
								});
							});
						} else {
							_t.seting = false;
						}
					} else {
						//向上滚动,显示导航
						if (nav.css('top') == '0px') {
							_t.seting = false;
						} else {
							nav.stop(true).animate({
								top: 0
							}, 300, function() {
								_t.seting = false;
							});
						}

					}
					_t.scrollh = wh;
				} else {
					return;
				}

			});
		}
	};
	blog.initpage();
});
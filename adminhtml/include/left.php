<i title="点击打开/关闭侧栏" id="closeicon"></i>
<div id="admin-left" class="admin-left">
<!--menu tpl-->
<script id="menu-html" type="text/tpl">
<dl class="menu">
	<dt class="menu-title">
		<a href="javascript:;" onclick="am.menuTitleClick(this);" ><i class="fa menu-close"></i>[#title#]</a>
	</dt>
	[#menu_item_list#]
</dl>
</script>
<script id="menu-item-html" type="text/tpl">
<dd class="menu-item">
	<a href="javascript:;" data-url="[#url#]" onclick="am.menuClick(this);">[#title#]</a>
</dd>
</script>
<div id="left-menu">
	<dl class="menu">
		<dt class="menu-title">
			<a href="javascript:;" onclick="am.menuTitleClick(this);" ><i class="fa menu-close"></i>默认</a>
		</dt>
		<dd class="menu-item">
			<a href="javascript:;" data-url="./iframe-list.php" onclick="am.menuClick(this);">文章列表</a>
		</dd>
		<dd class="menu-item">
			<a href="javascript:;" data-url="./iframe-edit.php" onclick="am.menuClick(this);">编辑文章</a>
		</dd>
	</dl>
	<dl class="menu">
		<dt class="menu-title">
			<a href="javascript:;" onclick="am.menuTitleClick(this);" ><i class="fa menu-close"></i>我的博客</a>
		</dt>
		<dd class="menu-item">
			<a href="javascript:;" data-url="./login.php" onclick="am.menuClick(this);">登录</a>
		</dd>
		<dd class="menu-item">
			<a href="javascript:;" data-url="./iframe-tree.php" onclick="am.menuClick(this);">分类列表</a>
		</dd>
	</dl>
	<dl class="menu">
		<dt class="menu-title">
			<a href="javascript:;" onclick="am.menuTitleClick(this);" ><i class="fa menu-close"></i>我的博客</a>
		</dt>
		<dd class="menu-item">
			<a href="javascript:;" data-url="https://www.zhaokeli.com/" onclick="am.menuClick(this);">我的博客</a>
		</dd>
		<dd class="menu-item">
			<a href="javascript:;" data-url="https://www.zhaokeli.com/" onclick="am.menuClick(this);">我的博客</a>
		</dd>
	</dl>
</div>
</div>
/**
 * 懒加载js
 */
window.require = function(path, callback) {
	var id = path.replace(/\\/g, '').split('/');
	id = id[id.length - 1];
	id = id.split('.')[0];
	if (!lazjs.isload(id)) {
		var script = document.createElement('script');
		script.type = "text/javascript";
		script.src = path;
		script.id = 'lazjs' + id;
		var head = document.getElementsByTagName('head')[0];
		head.appendChild(script);

	}
	lazjs.moudled[id]['callback'].push(callback);
	return lazjs.moudled[id]['obj'];
};

//定义模块
window.define = function(name, callback) {
	document.getElementById('lazjs' + name).remove();
	//取到的模块对象
	var moduleobj = (callback)();
	lazjs.moudled[name]['obj'] = moduleobj;
	lazjs.moudled[name]['process'] = true;
	for (var a in lazjs.moudled[name]['callback']) {
		lazjs.moudled[name]['callback'][a].call(moduleobj);
	}

};
window.lazjs = {
	moudled: {}, //已经载的模块
	//检查模块是否已经加载
	isload: function(name) {
		for (var a in this.moudled) {
			if (a == name) {
				return true;
			}
		}
		this.moudled[name] = {
			'obj': null,
			'process': false,
			'callback': []
		};
		return false;
	}
};

//包含模块并运行
require('./js/test.js', function() {
	this.debug();
	this.test();
	console.log(this);
});
require('./js/test.js', function() {
	this.test();
	console.log(this);
});
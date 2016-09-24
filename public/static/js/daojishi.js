(function(aa) {
	var djs = function(da, id, end) {
		var _t = this;
		this.endtext = (typeof(end) == 'undefined') ? '已结束' : end;
		this.date = new Date(da);
		this.id = id;
		this.clockid = setInterval(function() {
			_t.clock();
		}, 1000);

	};
	djs.prototype = {
		clock: function() {
			var daysms = 24 * 60 * 60 * 1000;
			var hoursms = 60 * 60 * 1000;
			var Secondms = 60 * 1000;
			var microsecond = 1000;
			var DifferHour = -1;
			var DifferMinute = -1;
			var DifferSecond = -1;
			//当前时分秒
			var time = new Date();
			var hour = time.getHours();
			var minute = time.getMinutes();
			var second = time.getSeconds();
			var timevalue = "" + ((hour > 12) ? hour - 12 : hour);
			timevalue += ((minute < 10) ? ":0" : ":") + minute;
			timevalue += ((second < 10) ? ":0" : ":") + second;
			timevalue += ((hour > 12) ? " PM" : " AM");
			var convertHour = DifferHour;
			var convertMinute = DifferMinute;
			var convertSecond = DifferSecond;
			var Diffms = this.date.getTime() - time.getTime();
			if (Diffms > 0) {
				var a = '';
				var b = '';
				var c = '';
				var d = '';
				DifferHour = Math.floor(Diffms / daysms);
				Diffms -= DifferHour * daysms;
				DifferMinute = Math.floor(Diffms / hoursms);
				Diffms -= DifferMinute * hoursms;
				DifferSecond = Math.floor(Diffms / Secondms);
				Diffms -= DifferSecond * Secondms;
				var dSecs = Math.floor(Diffms / microsecond);
				if (convertHour != DifferHour) {
					a = "<font  class='msendtime'>" + DifferHour + "</font>天";
				}
				if (convertMinute != DifferMinute) {
					b = "<font  class='msendtime'>" + DifferMinute + "</font>时";
				}
				if (convertSecond != DifferSecond) {

					c = "<font  class='msendtime'>" + DifferSecond + "</font>分";
				}
				d = "<font class='msendtime'>" + dSecs + "</font>秒";
				if (DifferHour > 0) {
					a = a;
				} else {
					a = '';
				}
				document.getElementById(this.id).innerHTML = a + b + c + d; //显示倒计时信息
			} else {
				document.getElementById(this.id).innerHTML = this.endtext; //显示倒计时信息
				clearInterval(this.clockid);
				delete this;
			}
		}
	};
	aa.daojishi = function(endtime, id, endtext) {
		return new djs(endtime, id, endtext);
	};
})(window);
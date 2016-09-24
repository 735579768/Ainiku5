

ShearPhoto.JsonString = {
          _json_:null,
          JsonToString:function(arr) {
                    try {
                              this._json_ = new Array();
                              this._read_(arr, true);
                              var JsonJoin = this._json_.join("");
                              JsonJoin = JsonJoin.replace(/,([\}\]])/g, function(a, b) {
                                        return b;
                              });
                              this._json_ = null;
                              return JsonJoin;
                    } catch (e) {
                              alert("发生错误，错误代码--" + e);
                              return "";
                    }
          },
          StringToJson:function(arrtxt) {
                    if (typeof arrtxt !== "string") {
                              alert("请传入JSON字串符,看清楚demo.html是怎么操作的");
                              return;
                    }
					 try{
                    var array = new Function("return " + "(" + arrtxt + ")")();
					var type=this._type_(array);
					
					 if (type !== "[object Object]" && type !== "[object Array]") {
					  return false;
					 }
					
                    return array;
					 }catch (e){
					 return false;	 
					   }
          },
          _type_:function(arr) {
                    if (typeof arr.nodeType === "number") return "[object document]";
                    var Types = Object.prototype.toString.call(arr);
                    return Types;
          },
          _addjson_:function(types, txt, txt2, TrueFalse) {
                    var run = {
                              "[object Object]":txt,
                              "[object Array]":txt2
                    };
                    this._json_.push(run[types]);
          },
          _addstring_:function(parameter) {
                    var of = typeof parameter;
                    if (of === "string") return '"' + parameter + '"'; else if (of === "number") return parameter;
                    var types = this._type_(parameter);
                    if (types === "[object Object]" || types === "[object Array]") {
                              return false;
                    } else return '""';
          },
          _read_:function(arr, TrueFalse) {
                    var types = this._type_(arr);
                    if (TrueFalse && types !== "[object Object]" && types !== "[object Array]") {
                              alert("你传入不是数组或JSON,看清楚demo.html是怎么操作的");
                              this._json_ = null;
                              return false;
                    }
                    this._addjson_(types, "{", "[", TrueFalse);
                    for (var a in arr) {
						 
                             if ( typeof ((arr.constructor.prototype)[a]) === "undefined") {
                                        var ArrA = this._addstring_(arr[a]);
                                        if (typeof ArrA !== "boolean") {
                                                  this._addjson_(types, "\""+a + "\":" + ArrA + ",", ArrA + ",");
                                        } else {
                                                  this._addjson_(types, "\""+a + "\":", "");
                                                  this._read_(arr[a], false);
                                        }
                              }
                    }
                    TrueFalse = TrueFalse ? "" :",";
                    this._addjson_(types, "}" + TrueFalse, "]" + TrueFalse);
          }
};


ShearPhoto.MyAjax =function() {
          this.serverdata = this.erromsg = this.timeout = this.stop = this.xmlhttp = false;
          this.transit = true;
}

ShearPhoto.MyAjax.prototype.handle = function(xmlhttp, arg) {
          if (4 == xmlhttp.readyState) {
			 
                    if (this.stop === true) return; 
					this.transit = true;
                    if (arg.timeout && arg.async) {
                              clearTimeout(this.timeout);
                              this.timeout = false;
                    }
                    if (200 == xmlhttp.status) {
                              var responseText = this.serverdata = xmlhttp.responseText.replace(/(^\s*)|(\s*$)/g, "");
                              typeof arg.success === "function" && arg.success(responseText);
                    } else {
                              this.erromsg = xmlhttp.status;
                              typeof arg.error === "function" && arg.error(xmlhttp.status);
                    }
          } else {
                    if (0 == xmlhttp.readyState) {
                              if (this.stop === true) return;
                              if (arg.timeout && arg.async) {
                                        clearTimeout(this.timeout);
                                        this.timeout = false;
                              }
                              this.erromsg = xmlhttp.readyState;
                              this.transit = true;
                              typeof arg.error === "function" && arg.error(xmlhttp.readyState);
                    }
          }
};

ShearPhoto.MyAjax.prototype.out = function(arg) {
          this.transit = true;
          this.erromsg = 504;
          this.stop = true;
          typeof arg.error === "function" && arg.error(504);
};

ShearPhoto.MyAjax.prototype.carry = function(arg) {
  if (arg.lock && !this.transit) return false;
          this.transit = false;
          this.stop = this.erromsg = false;
          var xmlhttp;
          if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
          } else {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
          }
          arg.type = arg.type.toUpperCase();
          var ContentType = function() {};
          if (typeof arg.data === "string") {
                    arg.data = arg.data.replace(/(^\s*)|(\s*$)/g, "");
                    ContentType = function() {
                              xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    };
          } else {
                    if (Object.prototype.toString.call(arg.data) !== "[object FormData]") {
                              arg.data = "";
                              ContentType = function() {
                                        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                              };
                    } else {
                              typeof arg.progress === "function" && xmlhttp.upload.addEventListener("progress", arg.progress, false);
                              arg.type = "POST";
                    }
          }
          var SendArg = arg.data == "" ? [ null, "" ] :[ arg.data, "?" + arg.data ];
          var self = this;
          typeof arg.complete === "function" && arg.complete();
          arg.timeout && arg.async && (this.timeout = setTimeout(function() {
                    self.out(arg);
          }, arg.timeout));
          if (arg.async === true) {
                    xmlhttp.onreadystatechange = function() {
                              self.handle(xmlhttp, arg);
                    };
          }
          try {
                    switch (arg.type) {
                         case "POST":
                              xmlhttp.open("POST", arg.url, arg.async);
                              ContentType();
                              break;

                         default:
                              xmlhttp.open("GET", arg.url + SendArg[1], arg.async);
                              arg.cache === true || xmlhttp.setRequestHeader("If-Modified-Since", "0");
                              break;
                    }
          } catch (e2) {
                    this.erromsg = 505;
                    if (arg.timeout && arg.async) {
                              clearTimeout(this.timeout);
                              this.timeout = false;
                    }
                    this.transit = true;
                    typeof arg.error === "function" && arg.error(505);
                    return;
          }
          xmlhttp.send(SendArg[0]);
          if (arg.async === false) {
                    self.handle(xmlhttp, arg);
          }
};
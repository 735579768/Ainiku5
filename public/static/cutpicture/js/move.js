
ShearPhoto.MoveDiv = function() {
          this.arg = new Array(), this.ReckonWH = this.DivW = this.DivH = this.selectionempty = this.addevent = this.DivDownEVe = this.DomMoveEve = this.DomUpEve = this.eveMold = false;
};

ShearPhoto.MoveDiv.prototype = {
          ZeroSetting:function() {
                    var left = parseFloat(this.arg.form.style.left), top = parseFloat(this.arg.form.style.top);
                    var size = this._size_(window, true);
                    var leftfun = function() {}, topfun = function() {}, tf = false;
                    if (!isNaN(left)) {
                              tf = true;
                              this.arg.form.style.left = 0;
                              leftfun = function(a, b) {
                                        a < 0 && (a = 0);
                                        b.style.left = left - a + "px";
                              };
                    }
                    if (!isNaN(top)) {
                              tf = true;
                              this.arg.form.style.top = 0;
                              topfun = function(a, b) {
                                        a < 0 && (a = 0);
                                        b.style.top = top - a + "px";
                              };
                    }
                    if (tf === true) {
                              var size2 = this._size_(window, true);
                              leftfun(size.W - size2.W, this.arg.form);
                              topfun(size.H - size2.H, this.arg.form);
                    }
          },
          reckon:function(obj, se) {
                    this._size_(obj);
                    var this_ = this;
                    if (se === true) {
                              var addfun = function() {
                                        this_.ZeroSetting();
                                        this_._size_(obj);
                                        this_.arg.MoveWidth = this_.ReckonWH.W;
                                        this_.arg.MoveHeight = this_.ReckonWH.H;
                                        this_.SetCenter(this_.arg);
                              };
                              this.addEvent(window, "resize", addfun);
                    }
          },
          _size_:function(obj, t) {
                    var w, h, ReckonWH;
                    if (obj === window) {
                              var DE = {
                                        add:document.documentElement,
                                        att:document.body
                              }[this.addevent];
                              w = DE.clientWidth;
                              h = DE.clientHeight;
                              ReckonWH = {
                                        W:Math.max(DE.scrollWidth, w),
                                        H:Math.max(DE.scrollHeight, h),
                                        CW:w,
                                        CH:h
                              };
                    } else {
                              w = obj.offsetWidth;
                              h = obj.offsetHeight;
                              ReckonWH = {
                                        W:w,
                                        H:h,
                                        CW:w,
                                        CH:h
                              };
                    }
                    if (t === true) return ReckonWH;
                    this.ReckonWH = ReckonWH;
          },
          DomUp:function(dom) {
                    var this_ = this;
                    return function() {
                              dom.releaseCapture && dom.releaseCapture();
                              typeof this_.DomMoveEve === "function" && this_.delEvent(document, this_.eveMold[1], this_.DomMoveEve);
                              if (typeof this_.DomUpEve === "function") {
                                        this_.delEvent(document, this_.eveMold[2], this_.DomUpEve);
                                        this_.delEvent(window, this_.eveMold[2], this_.DomUpEve);
                                        this_.delEvent(window, "blur", this_.DomUpEve);
                                        this_.delEvent(dom, "losecapture", this_.DomUpEve);
                              }
                              return false;
                    };
          },
          DivWHFun:function() {
                    this.DivW = this.arg.form.offsetWidth;
                    this.DivH = this.arg.form.offsetHeight;
          },
          DomMove:function(this_, dom, disX, disY, formLeft, formTop) {
                    var argform = this_.arg.form, DivW = this_.DivW, DivH = this_.DivH, MoveScale, MoveFun = function() {};
                    var shifting = this_.arg.shifting = Object.prototype.toString.call(this_.arg.shifting) === "[object Array]" && this_.arg.shifting.length > 1 ? this_.arg.shifting :new Array(0, 0);
                    var argMoveWidth = this_.arg.MoveWidth - shifting[0];
                    var argMoveHeight = this_.arg.MoveHeight - shifting[1];
                    if (typeof this_.DomUpEve === "function") {
                              this_.delEvent(document, this_.eveMold[2], this_.DomUpEve);
                              this_.delEvent(window, this_.eveMold[2], this_.DomUpEve);
                              this_.delEvent(window, "blur", this_.DomUpEve);
                              this_.delEvent(dom, "losecapture", this_.DomUpEve);
                    }
                    this_.DomUpEve = this_.DomUp(dom);
                    this_.addEvent(document, this_.eveMold[2], this_.DomUpEve);
                    this_.addEvent(window, this_.eveMold[2], this_.DomUpEve);
                    this_.addEvent(window, "blur", this_.DomUpEve);
                    this_.addEvent(dom, "losecapture", this_.DomUpEve);
                    var maxL = argMoveWidth - DivW, maxT = argMoveHeight - DivH, iL, iT, eveclientX, eveclientY;
                    typeof this_.arg.MoveFun === "function" && (MoveFun = this_.arg.MoveFun);
                    MoveScale = [ maxL, maxT ];
                    return function(eve) {
                              eve = eve || window.event;
                              if (eve.button > 1) {
                                        this_.DomUp(this)();
                                        return false;
                              }
                              eveclientX = this_.eveMold[3](eve, "clientX"), eveclientY = this_.eveMold[3](eve, "clientY");
                              setTimeout(function() {
                                        iL = eveclientX - disX;
                                        iT = eveclientY - disY;
                                        this_.selectionempty();
                                        iL = iL < -shifting[0] ? -shifting[0] :iL;
                                        iL = iL > maxL ? maxL :iL;
                                        iT = iT < -shifting[1] ? -shifting[1] :iT;
                                        iT = iT > maxT ? maxT :iT;
                                        argform.style.left = iL + "px", argform.style.top = iT + "px";
                                        MoveFun(iL, iT, MoveScale);
                              }, 1);
                              return false;
                    };
          },
          DivDown:function() {
                    var this_ = this;
                    return function(event) {
                              var event = event || window.event, eventbutton = event.button, typebutton = typeof eventbutton, clientX, clientY;
                              event.preventDefault && event.preventDefault();
                              if (typebutton !== "number") {
                                        this_.eveMold = [ "touchstart", "touchmove", "touchend", function(events, clientXY) {
                                                  return events.touches[0][clientXY];
                                        } ];
                                        clientX = event.touches[0].clientX;
                                        clientY = event.touches[0].clientY;
                              } else {
                                        this_.eveMold = [ "mousedown", "mousemove", "mouseup", function(events, clientXY) {
                                                  return events[clientXY];
                                        } ];
                                        clientX = event.clientX;
                                        clientY = event.clientY;
                              }
                              if (eventbutton < 2 || typebutton !== "number") {
                                        var formLeft = parseFloat(this_.arg.form.style.left) || 0;
                                        var formTop = parseFloat(this_.arg.form.style.top) || 0;
                                        var disX = clientX - formLeft;
                                        var disY = clientY - formTop;
                                        this.setCapture && this.setCapture();
                                        typeof this_.arg.DivDownFun === "function" && this_.arg.DivDownFun(this_);
                                        typeof this_.DomMoveEve === "function" && this_.delEvent(document, this_.eveMold[1], this_.DomMoveEve);
                                        this_.DomMoveEve = this_.DomMove(this_, this, disX, disY, formLeft, formTop);
                                        this_.addEvent(document, this_.eveMold[1], this_.DomMoveEve);
                              } else {
                                        this_.DomUp(this)();
                              }
                              return false;
                    };
          },
          ShearPhotoDown:function(obj, fun) {
                    this.addEvent(obj, "mousedown", fun);
                    this.addEvent(obj, "touchstart", fun);
          },
          delShearPhotoDown:function(obj, fun) {
                    this.delEvent(obj, "mousedown", fun);
                    this.delEvent(obj, "touchstart", fun);
          },
          et:function() {
                    var this_ = this;
                    var cursor = this.arg.cursor || "move";
                    this_ = this;
                    for (var i = 0; i < this.arg.to.length; i++) {
                              if (this.addevent === "add") {
                                        if (typeof this.DivDownEVe !== "function") {
                                                  this.DivDownEVe = this.DivDown();
                                        } else {
                                                  this.delShearPhotoDown(this.arg.to[i], this.DivDownEVe);
                                        }
                                        this.ShearPhotoDown(this.arg.to[i], this.DivDownEVe);
                              } else {
                                        this.arg.to[i].onmousedown = this.DivDown();
                              }
                              this.arg.to[i].style["cursor"] = cursor;
                    }
          },
          delDownEve:function() {
                    for (var i = 0; i < this.arg.to.length; i++) {
                              if (this.addevent === "add") {
                                        if (typeof this.DivDownEVe === "function") {
                                                  this.delShearPhotoDown(this.arg.to[i], this.DivDownEVe);
                                        }
                              }
                    }
          },
          setdiv:function(argform, CW, CH, arg) {
                    if (typeof arg.centerFront === "function") {
                              var CWCH = arg.centerFront();
                              CW = CWCH[0];
                              CH = CWCH[1];
                    }
                    var DivT = (CH - this.DivH) / 2;
                    DivT = DivT < 0 ? 0 :DivT;
                    var DivL = (CW - this.DivW) / 2;
                    DivL = DivL < 0 ? 0 :DivL;
                    argform.style.top = DivT + "px", argform.style.left = DivL + "px";
                    typeof arg.centerfun === "function" && arg.centerfun(DivL, DivT, this);
          },
          addEvent:function(obj, evetype, fun) {
                    var addevent = {
                              add:function() {
                                        obj.addEventListener(evetype, fun, false);
                              },
                              att:function() {
                                        obj.attachEvent("on" + evetype, fun);
                              }
                    };
                    addevent[this.addevent] && addevent[this.addevent]();
          },
          delEvent:function(obj, evetype, fun) {
                    var delevent = {
                              add:function() {
                                        obj.removeEventListener(evetype, fun, false);
                              },
                              att:function() {
                                        obj.detachEvent("on" + evetype, fun);
                              }
                    };
                    delevent[this.addevent] && delevent[this.addevent]();
          },
          SetCenter:function(arg) {
                    if (arg.center) {
                              if (arg.center === 1) {
                                        var CW = this.ReckonWH.CW, CH = this.ReckonWH.CH;
                              } else {
                                        var ReckonWH = this._size_(arg.center, true);
                                        var CW = ReckonWH.CW, CH = ReckonWH.CH;
                              }
                              this.setdiv(arg.form, CW, CH, arg);
                    }
          },
          run:function(arg) {
                    this.arg = arg;
                    this.DivW = arg.form.offsetWidth;
                    this.DivH = arg.form.offsetHeight;
                    this.SetCenter(arg);
                    typeof arg.zIndex === "number" && (arg.form.style.zIndex = arg.zIndex);
                    this.et();
          }
};

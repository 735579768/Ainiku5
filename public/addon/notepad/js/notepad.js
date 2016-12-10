$(function() {
  window.notepad = {
    notepad_dom: null,
    init: function() {
      $('#tool').prepend('<li><a onclick="notepad.icoClick();" href="javascript:;"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></li>');
      this.notepad_dom = $('#notepad_wrap');
      this.notepad_dom.css('left', ank.readCookie('notepad_left') + 'px');
      this.notepad_dom.css('top', ank.readCookie('notepad_top') + 'px');
      this.notepad_dom.kldrag({
        titleheight: 30
      });
      $('#admintheme').after('<i onClick="notepad.show();" style="font-size:16px;" class="fa fa-pencil-square-o"></i>');
      if (ank.readCookie('notepad_open') == 1) {
        this.notepad_dom.show();
      } else {
        ank.writeCookie('notepad_open', 0);
      }
      this.notepad_dom.mousemove(function(event) {
        notepad.setPosition();
      });
    },
    setPosition: function() {
      var left = this.notepad_dom.offset().left;
      var top = this.notepad_dom.offset().top;
      ank.writeCookie('notepad_left', left);
      ank.writeCookie('notepad_top', top);
    },
    hide: function() {
      this.notepad_dom.hide();
      ank.writeCookie('notepad_open', 0);
    },
    editNotepad: function(uri) {
      var index = layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
      });
      $.get(uri, function(data) {
        layer.close(index);
        layer.open({
          shade: 0,
          title: '编辑内容',
          type: 1,
          content: data
        });
      });

    },
    saveNotepad: function(obj) {
      var _t = $(obj);
      var _f = _t.parents('form');
      // _f.prop({
      //   action: _f.prop('action') + '&p=' + ,
      // })
      _f.append('<input type="hidden" name="p" value="' + $('#cur_p').val() + '" />')
        // debugger;
      ank.ajaxForm(obj, function(data) {
        if (data.code == 1) {
          layer.msg(data.msg);
          $('#notepad-list').html(data.data);
        }
      });
    },
    delNotepad: function(uri) {
      layer.confirm('确定要删除吗?', {
        btn: ['确定', '取消'],
        yes: function(index, dom) {
          layer.close(index);
          $.get(uri, function(data) {
            if (data.code == 1) {

            }
            layer.msg(data.msg);
            // ank.alert(data);
          });
        }
      });
    },
    show: function() {
      var o = $('#notepad_wrap');
      o.toggle();
      var cok = ank.readCookie('notepad_open');
      if (cok == 1) {
        ank.writeCookie('notepad_open', 0);
      } else {
        ank.writeCookie('notepad_open', 1);
      }
    },
    /**
     * 记事本下一页
     * @param  {[type]} uri [description]
     * @param  {[type]} p   [description]
     * @return {[type]}     [description]
     */
    nextPage: function(uri) {
      $.get(uri, function(data) {
        if (data.code == 1) {
          $('#notepad-list').html(data.data);
        }
      });
    },
    icoClick: function() {
      this.notepad_dom.show();
      ank.writeCookie('notepad_open', 1);
    }

  };
  notepad.init();
});
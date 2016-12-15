//购买流程js

! function(a, b) {
    a.buyobj = {
        //初始化提交地址
        url: {
            saveAddressurl: '',
            editAddressurl: '',
            delAddressurl: '',
            submitorder: '',
            dopay: '',
            yueurl: '',
            chongzhiurl: ''
        },
        //初始化添加地址框的焦点提示
        initFocusBlur: function() {
            $('.auto-label').focus(function(event) {
                var _this = $(this);
                var labobj = _this.prev();
                var ms = _this.attr('data-msg');
                _this.css('borderColor', '#ff6700');
                labobj.css('color', '#ff6700');
                //if (_this.val() == '') {
                labobj.show();
                _this.attr('placeholder', '');
                labobj.animate({
                        top: -9,
                        fontSize: 12
                    },
                    300,
                    function() {
                        _this.attr('placeholder', ms);
                    });
                //}
            });
            $('.auto-label').blur(function(event) {
                var _this = $(this);
                var labobj = _this.prev();
                var ms = _this.attr('data-msg');
                _this.css('borderColor', '#e0e0e0');
                labobj.css('color', '#bbb');
                if (_this.val() == '') {
                    _this.attr('placeholder', '');
                    labobj.animate({
                            top: 9,
                            fontSize: 14
                        },
                        300,
                        function() {
                            _this.attr('placeholder', labobj.html());
                        });
                }


            });
            $('.form-section .auto-label').each(function(index) {
                var str = $(this).val();
                if (str != '') {
                    var _this = $(this);
                    var labobj = _this.prev();
                    var ms = _this.attr('data-msg');
                    labobj.css({
                        color: '#bbb',
                        top: -9,
                        fontSize: 12
                    });
                    _this.attr('placeholder', ms);
                    labobj.show();
                    _this.attr('placeholder', '');
                }

            });
        },


        //保存地址
        saveAddress: function() {
            var _this = this;
            var name = $("input[name='consignee_name']").val();
            var mobile = $("input[name='consignee_mobile']").val();
            var email = $("input[name='consignee_email']").val();
            var diqu = $("input[name='consignee_diqu']").val();
            var detail = $("textarea[name='consignee_detail']").val();
            var youbian = $("input[name='consignee_youbian']").val();
            var addressid = $("input[name='consignee_address_id']").val();
            if (name == '' || mobile == '' || diqu == '' || detail == '' || youbian == '') {
                ank.alert('请填写信息!');
                return false;
            }
            $.ajax({
                type: 'POST',
                url: _this.url.saveAddressurl,
                data: {
                    consignee_name: name,
                    consignee_mobile: mobile,
                    consignee_email: email,
                    consignee_diqu: diqu,
                    consignee_detail: detail,
                    consignee_youbian: youbian,
                    consignee_address_id: addressid
                },
                success: function(da) {
                    if (da.code == 1) {
                        if (da.action == 'add') {
                            //添加地址块信息
                            var shtml = '<dl data-id="{consignee_address_id}" onclick="buyobj.selectedAddress(this);" id="consignee_address{consignee_address_id}" class="s-adr cl"><dt>{consignee_name}</dt><dd><div class="s-mobile">{consignee_mobile}</div><div class="s-diqu">{consignee_diqu}</div></dd><dd class="action"><a class="delbtn" onclick="buyobj.delAddress({consignee_address_id})" data-id="{consignee_address_id}" href="javascript:;">删除</a><a class="modbtn" onclick="buyobj.modAddress({consignee_address_id})" data-id="{consignee_address_id}" href="javascript:;">修改</a></dd></dl>';
                            shtml = shtml.replace(/\{consignee_address_id\}/g, da.data.address_id);
                            shtml = shtml.replace(/\{consignee_name\}/g, da.data.name);
                            shtml = shtml.replace(/\{consignee_diqu\}/g, da.data.diqu);
                            shtml = shtml.replace(/\{consignee_mobile\}/g, da.data.mobile);
                            $('#add-new-address').parent().before(shtml);
                            $('#consignee_address' + da.data.address_id).click();
                        } else {
                            //修改地址块信息
                            var o = $('#consignee_address' + da.data.address_id);
                            o.find('dt').html(da.data.name);
                            o.find('.s-mobile').html(da.data.mobile);
                            o.find('.s-diqu').html(da.data.diqu);
                        }
                        $('#dialog-wrap').remove();
                    } else {
                        ank.alert(da.msg);
                    }
                }
            });

        },
        //取消保存地址
        cancelAddress: function() {
            // $('#dialog-wrap').remove();
            layer.closeAll();
        },

        //选择地址加边框
        selectedAddress: function(obj) {
            var _this = $(obj);
            if (_this.find('.add-new-address').length === 0) {
                $('.s-adr').removeClass('selected');
                _this.addClass('selected');
            }
            //设置下面地址
            var name = _this.find('dt').html();
            var mobile = _this.find('.s-mobile').html();
            var diqu = _this.find('.s-diqu').html();
            diqu = diqu.replace(/<br>/, '&nbsp;&nbsp;&nbsp;');
            $('#total_address').html(name + '&nbsp;&nbsp;&nbsp;' + mobile + '<br>' + diqu);
            $('#selected_adress').val(_this.attr('data-id'));
        },
        //添加配送新地址
        addNewAddress: function() {
            var _this = this;
            $.ajax({
                url: _this.url.saveAddressurl,
                type: 'GET',
                success: function(da) {
                    if (da.code == 1) {
                        // ank.alertDialog({
                        //     width: 350,
                        //     height: 460,
                        //     title: '添加新地址',
                        //     content: da.msg
                        // });
                        layer.open({
                            type: 1,
                            title: '添加新地址',
                            area: ['350px', '520px'],
                            content: da.msg
                        });
                    } else {
                        ank.alert(da.msg);
                    }
                }
            });
        },
        //修改配送地址
        modAddress: function(id) {
            var _this = this;
            $.ajax({
                url: _this.url.editAddressurl,
                type: 'POST',
                data: {
                    consignee_address_id: id,
                    action: 'edit'
                },
                success: function(da) {
                    if (da.code == 1) {
                        layer.open({
                            type: 1,
                            title: '修改地址',
                            area: ['350px', '520px'],
                            content: da.msg
                        });
                    } else {
                        ank.alert(da.msg);
                    }

                }
            });
        },
        //删除配送地址
        delAddress: function(id) {
            var _this = this;
            layer.confirm('确定要删除吗', {
                title: '删除提示',
                btn: ['删除', '再考虑一下'],
                yes: function() {
                    $.ajax({
                        url: _this.url.delAddressurl,
                        type: 'POST',
                        data: {
                            consignee_address_id: id,
                            action: 'del'
                        },
                        success: function(da) {
                            if (da.code == 1) {
                                $('#consignee_address' + id).remove();
                            }
                            ank.alert(da.msg);
                        }
                    });
                }
            });

        },
        //提交订单
        submitOrder: function() {
            var adid = $('#selected_adress').val();
            var ordernote = $('#order_note').val();
            if (adid == '') {
                ank.alert('请选择一个收货地址!');
                return false;
            }
            var _this = this;
            $.ajax({
                type: 'POST',
                url: _this.url.submitorder,
                data: {
                    consignee_address_id: adid,
                    order_note: ordernote
                },
                success: function(da) {
                    ank.alert(da);
                    // layer.msg(da.msg, {
                    //     shift: 0
                    // }, function() {
                    //     if (da.url != '') {
                    //         window.location.href = da.url;
                    //     }
                    // });

                }
            });
        },
        //选择支付类型
        selectPay: function(obj) {
            var _this = $(obj);
            var mark = _this.attr('data-mark');
            $('#payOnlineBank').val(mark);
            $('.online-pay li a').removeClass('hover');
            _this.addClass('hover');
        },
        //去支付
        dopay: function(orderid) {
            if (orderid == '') {
                ank.alert('支付参数错误!');
                return false;
            }
            var _this = this;
            $.ajax({
                type: 'POST',
                url: _this.url.dopay,
                data: {
                    order_id: orderid,
                },
                success: function(da) {
                    ank.alert(da);
                }
            });

        },
        verifyPay: function(chongzhisn) {
            var _this = this;
            $.ajax({
                type: 'POST',
                url: _this.url.checkpay,
                data: {
                    chongzhi_sn: chongzhisn
                },
                success: function(da) {
                    if (da.code == 1) {
                        clearInterval(buyobj.verifyid);
                        $('#pay_status_text').html('支付成功!');
                        // window.location.href = da.url;
                    }
                }
            });
        },
        inityue: function() {
            $.ajax({
                type: 'GET',
                url: this.url.yueurl,
                success: function(da) {
                    $('#keyongmoney').html(da.msg);
                }
            });
        },
        chongzhi: function(mon, zftype) {
            if (zftype == "") {
                ank.alert('请选择支付方式!');
                return false;
            }
            if (!mon) {
                ank.alert('请输入充值金额!');
                return false;
            }
            var _this = this;
            $.ajax({
                type: 'POST',
                url: _this.url.chongzhiurl,
                data: {
                    online_pay: zftype,
                    money: mon
                },
                success: function(da) {
                    if (da.code == 1) {
                        $('body').append('<div id="zhifucontainer">' + da.data + '</div>');
                        $('#zhifucontainer').remove();
                        layer.confirm(da.msg, {
                            title: '支付订单',
                            btn: ['支付完成', '关闭'],
                            yes: function() {
                                clearInterval(buyobj.verifyid);
                            },
                            cancel: function() {
                                clearInterval(buyobj.verifyid);
                            }
                        });

                        //验证支付状态是否成功
                        buyobj.verifyid = setInterval(function() {
                            buyobj.verifyPay(da.chongzhi_sn);
                        }, 3000);
                    } else {
                        ank.alert(da.msg);
                    }

                }
            });

        }

    };
}(window);
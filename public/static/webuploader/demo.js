! function(a, b) {
    a.BASE_URL = webUploaderUrl.BASE_URL;
    a.webUploader = {
        uploaderList: [],
        /**
         * //初始化上传插件
         * @param  {[type]}   uploaderid   上传插件容器id
         * @param  {[type]}   uploaderType 上传插件类型 true多图上传,false 单图上传,默认单图上传
         * @param  {Function} callback     上传成功回调函数
         * @return {[type]}                [description]
         */
        init: function(uploaderid, uploaderType, callback) {

            // debugger;
            if (typeof uploaderType == 'function') {
                callback = uploaderType;
                uploaderType = false;
            } else {
                uploaderType = uploaderType ? true : false;
            }

            var filenum = uploaderType ? 300 : 1;
            var $ = jQuery;
            // var inpname = uploaderid.replace('#', '');
            var htmlstr = '<div class="uploader-wrap"><div class="note-sm">您可以尝试文件拖拽，使用QQ截屏工具，然后鼠标点击虚线框内激活窗口后粘贴，或者点击添加图片按钮，来上传图片.</div><div  class="uploader-img" class="wu-example"><div class="queueList"><div  class="placeholder"><div  class="filePicker"></div><p>或将照片拖到这里</p></div></div><div class="statusBar" style="display:none;"><div class="progress"><span class="text">0%</span><span class="percentage"></span></div><div class="info"></div><div class="btns"><div  class="filePicker2"></div><div class="uploadBtn">开始上传</div></div>    </div></div></div>';
            $(uploaderid).html(htmlstr);
            //设置宽高
            // var add1 = $(uploaderid + ' .filePicker');
            // var add2 = $(uploaderid + ' .filePicker2');
            // add1.css({
            //     width: add1.outerWidth(),
            //     height: add1.outerHeight()
            // });
            // add2.css({
            //     width: add2.outerWidth(),
            //     height: add2.outerHeight()
            // });
            var $wrap = $(uploaderid),
                // 图片容器
                $queue = $('<ul class="filelist"></ul>')
                .appendTo($wrap.find('.queueList')),

                // 状态栏，包括进度和控制按钮
                $statusBar = $wrap.find('.statusBar'),

                // 文件总体选择信息。
                $info = $statusBar.find('.info'),

                // 上传按钮
                $upload = $wrap.find('.uploadBtn'),

                // 没选择文件之前的内容。
                $placeHolder = $wrap.find('.placeholder'),

                // 总体进度条
                $progress = $statusBar.find('.progress').hide(),

                // 添加的文件数量
                fileCount = 0,

                // 添加的文件总大小
                fileSize = 0,

                // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                thumbnailWidth = 110 * ratio,
                thumbnailHeight = 110 * ratio,

                // 可能有pedding, ready, uploading, confirm, done.
                state = 'pedding',

                // 所有文件的进度信息，key为file id
                percentages = {},

                supportTransition = (function() {
                    var s = document.createElement('p').style,
                        r = 'transition' in s ||
                        'WebkitTransition' in s ||
                        'MozTransition' in s ||
                        'msTransition' in s ||
                        'OTransition' in s;
                    s = null;
                    return r;
                })(),

                // WebUploader实例
                uploader;
            (function() {
                if (!WebUploader.Uploader.support()) {
                    alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
                    throw new Error('WebUploader does not support the browser you are using.');
                }

                // 实例化
                uploader = WebUploader.create({
                    // {Object} [可选] [默认值：'file'] 设置文件上传域的name。
                    fileVal: 'filelist',
                    formData: {}, //{Object} [可选] [默认值：{}] 文件上传请求的参数表，每次发送都会发送此对象中的参数。
                    pick: {
                        id: '.filePicker',
                        label: '点击选择图片',
                        multiple: uploaderType // 是否开起同时选择多个文件能力。
                    },
                    //指定拖动图片的容器
                    dnd: ' .queueList',
                    //指定监听paste事件的容器，如果不指定，不启用此功能。此功能为通过粘贴来添加截屏的图片。建议设置为document.body.
                    paste: document.getElementById(uploaderid.replace('#', '')),
                    // paste: document.body,
                    // 只允许选择图片文件。
                    accept: {
                        title: 'Images',
                        extensions: 'gif,jpg,jpeg,bmp,png',
                        mimeTypes: 'image/*'
                    },
                    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                    resize: false,
                    // 选完文件后，是否自动上传。
                    auto: false,
                    // swf文件路径
                    swf: BASE_URL + '/js/Uploader.swf',
                    //是否禁掉整个页面的拖拽功能，如果不禁用，图片拖进来的时候会默认被浏览器打开。
                    disableGlobalDnd: true,
                    // 是否要分片处理大文件上传。
                    chunked: true,
                    chunkSize: 5242880, // [可选] [默认值：5242880] 如果要分片，分多大一片？ 默认大小为5M.
                    chunkRetry: 2, //[可选] [默认值：2] 如果某个分片由于网络问题出错，允许自动重传多少次？
                    // server: 'http://webuploader.duapp.com/server/fileupload.php',
                    // server: './fileupload.php',
                    server: webUploaderUrl.UPLOADER_URL,
                    fileNumLimit: filenum,
                    fileSizeLimit: 5 * 1024 * 1024, // 200 M
                    fileSingleSizeLimit: 1 * 1024 * 1024, // 50 M
                    // 配置生成缩略图的选项。
                    thumb: {
                        width: 110,
                        height: 110,
                        // 图片质量，只有type为`image/jpeg`的时候才有效。
                        quality: 70,
                        // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                        allowMagnify: true,
                        // 是否允许裁剪。
                        crop: true,
                        // 为空的话则保留原有图片格式。
                        // 否则强制转换成指定的类型。
                        type: 'image/jpeg'
                    },
                    compress: {
                        width: 1600,
                        height: 1600,
                        // 图片质量，只有type为`image/jpeg`的时候才有效。
                        quality: 90,
                        // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                        allowMagnify: false,
                        // 是否允许裁剪。
                        crop: false,
                        // 是否保留头部meta信息。
                        preserveHeaders: true,
                        // 如果发现压缩后文件大小比原来还大，则使用原来图片
                        // 此属性可能会影响图片自动纠正功能
                        noCompressIfLarger: false,
                        // 单位字节，如果图片大小小于此值，不会采用压缩。
                        compressSize: 0
                    }
                });

                // 添加“添加文件”的按钮，
                uploader.addButton({
                    id: '.filePicker2',
                    label: '继续添加'
                });
                // uploader.addButton({
                //     id: uploaderid + ' .filePicker',
                //     label: '点击添加'
                // });
                //添加上传成功后添加图片的功能
                uploader.selectId = uploaderid;
                uploader.uploaderType = uploaderType;
                // 当有文件添加进来时执行，负责view的创建

                var addFile = function(file) {

                    var $li = $('<li id="' + file.id + '">' +
                            '<p class="title">' + file.name + '</p>' +
                            '<p class="imgWrap"></p>' +
                            '<p class="progress"><span></span></p>' +
                            '</li>'),

                        $btns = $('<div class="file-panel">' +
                            '<span class="cancel">删除</span>' +
                            '<span class="rotateRight">向右旋转</span>' +
                            '<span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                        $prgress = $li.find('p.progress span'),
                        $wrap = $li.find('p.imgWrap'),
                        $info = $('<p class="error"></p>'),

                        showError = function(code) {
                            switch (code) {
                                case 'exceed_size':
                                    text = '文件大小超出';
                                    break;

                                case 'interrupt':
                                    text = '上传暂停';
                                    break;

                                default:
                                    text = '上传失败，请重试';
                                    break;
                            }

                            $info.text(text).appendTo($li);
                        };

                    if (file.getStatus() === 'invalid') {
                        showError(file.statusText);
                    } else {
                        // @todo lazyload
                        $wrap.text('预览中');
                        debugger;
                        uploader.makeThumb(file, function(error, src) {
                            if (error) {
                                $wrap.text('不能预览');
                                return;
                            }

                            var img = $('<img src="' + src + '">');
                            $wrap.empty().append(img);
                        }, thumbnailWidth, thumbnailHeight);

                        percentages[file.id] = [file.size, 0];
                        file.rotation = 0;
                    }

                    file.on('statuschange', function(cur, prev) {
                        if (prev === 'progress') {
                            $prgress.hide().width(0);
                        } else if (prev === 'queued') {
                            $li.off('mouseenter mouseleave');
                            $btns.remove();
                        }

                        // 成功
                        if (cur === 'error' || cur === 'invalid') {
                            // console.log(file.statusText);
                            showError(file.statusText);
                            percentages[file.id][1] = 1;
                        } else if (cur === 'interrupt') {
                            showError('interrupt');
                        } else if (cur === 'queued') {
                            percentages[file.id][1] = 0;
                        } else if (cur === 'progress') {
                            $info.remove();
                            $prgress.css('display', 'block');
                        } else if (cur === 'complete') {
                            $li.append('<span class="success"></span>');
                        }

                        $li.removeClass('state-' + prev).addClass('state-' + cur);
                    });

                    $li.on('mouseenter', function() {
                        $btns.stop().animate({
                            height: 30
                        });
                    });

                    $li.on('mouseleave', function() {
                        $btns.stop().animate({
                            height: 0
                        });
                    });

                    $btns.on('click', 'span', function() {
                        var index = $(this).index(),
                            deg;

                        switch (index) {
                            case 0:
                                uploader.removeFile(file);
                                return;

                            case 1:
                                file.rotation += 90;
                                break;

                            case 2:
                                file.rotation -= 90;
                                break;
                        }

                        if (supportTransition) {
                            deg = 'rotate(' + file.rotation + 'deg)';
                            $wrap.css({
                                '-webkit-transform': deg,
                                '-mos-transform': deg,
                                '-o-transform': deg,
                                'transform': deg
                            });
                        } else {
                            $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                            // use jquery animate to rotation
                            // $({
                            //     rotation: rotation
                            // }).animate({
                            //     rotation: file.rotation
                            // }, {
                            //     easing: 'linear',
                            //     step: function( now ) {
                            //         now = now * Math.PI / 180;

                            //         var cos = Math.cos( now ),
                            //             sin = Math.sin( now );

                            //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                            //     }
                            // });
                        }


                    });

                    $li.appendTo($queue);
                };

                // 负责view的销毁

                var removeFile = function(file) {
                    var $li = $('#' + file.id);

                    delete percentages[file.id];
                    updateTotalProgress();
                    $li.off().find('.file-panel').off().end().remove();
                };

                var updateTotalProgress = function() {
                    var loaded = 0,
                        total = 0,
                        spans = $progress.children(),
                        percent;

                    $.each(percentages, function(k, v) {
                        total += v[0];
                        loaded += v[0] * v[1];
                    });

                    percent = total ? loaded / total : 0;

                    spans.eq(0).text(Math.round(percent * 100) + '%');
                    spans.eq(1).css('width', Math.round(percent * 100) + '%');
                    updateStatus();
                };

                var updateStatus = function() {
                    var text = '',
                        stats;

                    if (state === 'ready') {
                        text = '选中' + fileCount + '张图片，共' +
                            WebUploader.formatSize(fileSize) + '。';
                    } else if (state === 'confirm') {
                        stats = uploader.getStats();
                        if (stats.uploadFailNum) {
                            text = '已成功上传' + stats.successNum + '张照片，' +
                                stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                        }

                    } else {
                        stats = uploader.getStats();
                        text = '共' + fileCount + '张（' +
                            WebUploader.formatSize(fileSize) +
                            '），已上传' + stats.successNum + '张';

                        if (stats.uploadFailNum) {
                            text += '，失败' + stats.uploadFailNum + '张';
                        }
                    }

                    $info.html(text);
                };

                var setState = function(val) {
                    var file, stats;

                    if (val === state) {
                        return;
                    }

                    $upload.removeClass('state-' + state);
                    $upload.addClass('state-' + val);
                    state = val;

                    switch (state) {
                        case 'pedding':
                            $placeHolder.removeClass('element-invisible');
                            $queue.parent().removeClass('filled');
                            $queue.hide();
                            $statusBar.addClass('element-invisible');
                            uploader.refresh();
                            break;

                        case 'ready':
                            $placeHolder.addClass('element-invisible');
                            $(uploaderid + ' .filePicker2').removeClass('element-invisible');
                            $queue.parent().addClass('filled');
                            $queue.show();
                            $statusBar.removeClass('element-invisible');
                            uploader.refresh();
                            break;

                        case 'uploading':
                            $(uploaderid + ' .filePicker2').addClass('element-invisible');
                            $progress.show();
                            $upload.text('暂停上传');
                            break;

                        case 'paused':
                            $progress.show();
                            $upload.text('继续上传');
                            break;

                        case 'confirm':
                            $progress.hide();
                            $upload.text('开始上传').addClass('disabled');

                            stats = uploader.getStats();
                            if (stats.successNum && !stats.uploadFailNum) {
                                setState('finish');
                                return;
                            }
                            break;
                        case 'finish':
                            stats = uploader.getStats();
                            if (stats.successNum) {
                                // alert('上传成功');
                                // console.log(val);
                            } else {
                                // 没有成功的图片，重设
                                state = 'done';
                                location.reload();
                            }
                            break;
                    }

                    updateStatus();
                };

                uploader.onUploadProgress = function(file, percentage) {
                    var $li = $('#' + file.id),
                        $percent = $li.find('.progress span');

                    $percent.css('width', percentage * 100 + '%');
                    percentages[file.id][1] = percentage;
                    updateTotalProgress();
                };

                uploader.onFileQueued = function(file) {
                    fileCount++;
                    fileSize += file.size;

                    if (fileCount === 1) {
                        $placeHolder.addClass('element-invisible');
                        $statusBar.show();
                    }
                    console.log(uploader);
                    addFile(file);
                    setState('ready');
                    updateTotalProgress();
                };
                uploader.onUploadSuccess = function(file, response) {
                    // debugger;
                    typeof callback === 'function' && callback(response, uploader);
                    // console.log(response);
                };

                uploader.onFileDequeued = function(file) {
                    fileCount--;
                    fileSize -= file.size;

                    if (!fileCount) {
                        setState('pedding');
                    }

                    removeFile(file);
                    updateTotalProgress();

                };

                uploader.on('all', function(type) {
                    var stats;
                    switch (type) {
                        case 'uploadFinished':
                            setState('confirm');
                            break;

                        case 'startUpload':
                            setState('uploading');
                            break;

                        case 'stopUpload':
                            setState('paused');
                            break;

                    }
                });

                uploader.onError = function(code) {
                    alert('Eroor: ' + code);
                };

                $upload.on('click', function() {
                    if ($(this).hasClass('disabled')) {
                        return false;
                    }

                    if (state === 'ready') {
                        uploader.upload();
                    } else if (state === 'paused') {
                        uploader.upload();
                    } else if (state === 'uploading') {
                        uploader.stop();
                    }
                });

                $info.on('click', '.retry', function() {
                    uploader.retry();
                });

                $info.on('click', '.ignore', function() {
                    alert('todo');
                });

                $upload.addClass('state-' + state);
                updateTotalProgress();
                webUploader.uploaderList.push(uploader);
                // return uploader;
            })();
        },
        /**
         * 上传成功后添加预览图
         * @param  {[type]} imglistId 图片容器选择器
         * @param  {[type]} da     图片的json数据
         * @return {[type]}        [description]
         */
        addimg: function(imglistId, da, uploaderType) {
            var imglist = $(imglistId);
            var str = "<div class='uploaded-imgitem'><div class='uploaded-imgbox'><div class='uploaded-imgpre'><img layer-pid='" + da['destname'] + "' layer-src='" + da['path'] + "' src='" + da['thumbpath'] + "' /></div></div><a href='javascript:;' class='btn btn-danger deleteimg' data-id='" + da['id'] + "'  >删除</a></div>";
            if (uploaderType) {
                imglist.append(str);
            } else {
                imglist.html(str);
            }
        },
        initImgList: function(valId, imglistId, uploaderType) {
            var sid = $(valId).val();
            if (sid) {
                $.post(webUploaderUrl.FILEINFO_URL, {
                    id: sid,
                    type: 'img'
                }, function(data) {
                    // debugger;
                    var da = data.data;
                    if (da.length > 0) {
                        for (a in da) {
                            webUploader.addimg(imglistId, da[a], uploaderType);
                        }
                    }
                    layer.photos({
                        photos: imglistId
                    });
                    am.bindDeleteImg();

                });
            }
        }
    };
}(window);
<?php
//表单生成原理
//在调试模式下数据不使用缓存
//在关闭调试后会把每次传进来的表单数据放进缓存里
//放进缓存里的数据有
//@$formstr 循环出业的表单字符串，格式为字符串
//@initformjs 初始化表单的js      格式为字符串
//@importjs  表单中需要导入的js文件 格式为数组(因为同样一个js文件可能会在其它地方的表单也要引用,这里只保存要导入的js文件次数)
////////////////////////////////////////////////
// array(
// 	'type'    => 'radio',
// 	'name'    => 'sex',
// 	'title'   => '性别',
// 	'note'    => '',   //对标题的说明性文字
// 	'extra'   => array(
// 		1 => '男',
// 		2 => '女',
// 	),
// 	'value'   => 1,
// 	'is_show' => 3,
// 	'is_require'=>0, //是否必填
//  'data_ts' => '', //鼠标放在表单上时的提示文本
//  'data_err' =>'', //格式不对时的提示文本
//  'data_ok' => '', //格式正确时的提示文本
//  'data_reg' => '', //验证格式的正则
//  'tab_id'=>1,    //当输出tab(基础,扩展两个时用到此属性)这个时候请直接调用get_tab_form($fieldarr,$data)
// ),
/////////////说明//////////////
//@is_show  1 add状态下显示   2 edit编辑状态下显示   3 add edit状态下都显示  4 只要是超级管理员状态下都显示
//自定义表单
//调用get_custom_form 这个函数
//在共用模块控制器CustomFormController中添加方法并且返回表单字符串
//示例请看里面的测试邮件和云标签

function create_form($fieldarr, $data = []) {
//每一次请求要引入的表单js
	static $formjs = [
		'editornum'  => 0,
		'datetime'   => 0,
		'slidedate'  => 0,
		'picture'    => 0,
		'bdpicture'  => 0,
		'editor'     => 0,
		'umeditor'   => 0,
		'color'      => 0,
		'liandong'   => 0,
		// 'dandu'      => 0,
		'cutpicture' => 0,
	];
	is_array($fieldarr) || ($fieldarr = []);
	$md5key = md5(json_encode($fieldarr));
	$data || ($data = []);
	$static_dir = STATIC_DIR . '/static';

	$formstr = '';
	if (!$fieldarr) {
		return '';
	}
	// $formjsstr  = '';
	$formstr = cache('_formcache/' . $md5key); //生成的form字符串
	// $formstr       = '';
	$initformjs    = ''; //要初始化的表单js
	$formjsstr     = ''; //要引入的js文件
	$default_value = [];
	if (empty($formstr) || config('app_debug')) {
		$formstr = '';
		// dump($fieldarr);
		foreach ($fieldarr as $key => $value) {
			// dump($fieldarr);
			// $field      = $value['field'];
			$type       = $value['type'];
			$name       = $value['name'];
			$mark_name  = defined('show_mark') ? "。标识：{$name}" : '';
			$title      = $value['title'];
			$note       = isset($value['note']) ? $value['note'] : '';
			$extra      = isset($value['extra']) ? $value['extra'] : [];
			$setvalue   = isset($value['value']) ? $value['value'] : '';
			$is_show    = isset($value['is_show']) ? $value['is_show'] : 3;
			$is_require = isset($value['is_require']) ? ($value['is_require'] ? true : false) : false;

			//验证表单
			$data_reg = isset($value['data_reg']) ? $value['data_reg'] : '';
			$data_ok  = isset($value['data_ok']) ? $value['data_ok'] : '';
			$data_ts  = isset($value['data_ts']) ? $value['data_ts'] : '';
			$data_err = isset($value['data_err']) ? $value['data_err'] : '';

			// ($type == 'editor') && ($type = 'umeditor');
			//保存默认值
			$default_value[$name] = ['type' => $type, 'value' => $setvalue];
			//要替换的值字符串
			$set_replace_value = "[REPLACE_SETVALUE_{$name}]";
			//处理一些判断必填的

			$is_require = $is_require ? '<span style="color:red;">(必填)</span>' : '';

			$yzstr   = '';
			$yzclass = '';
			if ($data_reg) {
				$yzstr   = " data-reg=\"{$data_reg}\" data-ts=\"{$data_ts}\" data-ok=\"{$data_ok}\" data-err=\"{$data_err}\"";
				$yzclass = ' autoyz';
			} else if ($is_require && !in_array($type, ['number', 'double'])) {
				$data_reg = '^.+?$';
				$yzstr    = " data-reg=\"{$data_reg}\" data-ts=\"此项为必填项\" data-ok=\"格式正确\" data-err=\"内容不能为空\"";
				$yzclass  = ' autoyz';
			}
			//判断当前操作是add  edit
			$is_add  = (strpos(strtolower(request()->action()), 'add') === false) ? false : true;
			$is_edit = (strpos(strtolower(request()->action()), 'edit') === false) ? false : true;
			if (!(($is_add && $is_show == 1) or ($is_edit && $is_show == 2) or ($is_show == 3) or ($is_show == 4 && MODULE_NAME == 'Admin'))) {
				//不符合条件直接退出本次循环
				continue;
			}
			//等着替换的模板字符串
			$tem_formstr = <<<eot
<div class="form-group form-type-{$type} cl">
	<div class="form-label"><b class="form-title">{$title}</b><span class="form-tip">{$note}{$mark_name}</span>{$is_require}</div>
	<div class="form-area" >
	[REPLACE_INPUT]
	</div>
</div>\n
eot;
			//循环出来的表单
			$tem_input = '';
			//循环表单
			switch ($type) {
			case 'number':
				///////////////////////////////////////////////////////////////////////////
				if (!$data_reg) {
					$data_reg = '^\d+?$';
					$yzstr    = " data-reg=\"{$data_reg}\" data-ts=\"请输入整数\" data-ok=\"格式正确\" data-err=\"格式错误,请输入整数\"";
					$yzclass  = ' autoyz';
				}
				$tem_input = <<<eot
<div class="form-wrap">
	<input type="text" {$yzstr}  class="form-control input-small {$yzclass}"  placeholder="请输入{$title}" name="{$name}" value="{$set_replace_value}" />
</div>
eot;
				break;
			case 'double':
				///////////////////////////////////////////////////////////////////////////
				///
				if (!$data_reg) {
					$data_reg = '^\d+?(\.\d{2})?$';
					$yzstr    = " data-reg=\"{$data_reg}\" data-ts=\"请输入数字可带两位小数\" data-ok=\"格式正确\" data-err=\"格式错误\"";
					$yzclass  = ' autoyz';
				}
				$tem_input = <<<eot
<div class="form-wrap">
	<input type="text"  class="form-control input-small {$yzclass}"  {$yzstr}     placeholder="请输入{$title}" name="{$name}" value="{$set_replace_value}" />
</div>
eot;
				break;
			case 'password':
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<div class="form-wrap">
	<input type="text" onfocus="this.type='password';"  class="form-control input-middle {$yzclass}"  {$yzstr}     placeholder="请输入{$title}" name="{$name}" value="{$set_replace_value}" />
</div>
eot;
				break;
			case 'textarea':
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<div class="form-wrap">
<textarea  rows=1 cols=40 style='overflow:scroll;overflow-y:hidden;;overflow-x:hidden;' onfocus="ot.autoHeight(this);" onblur="clearInterval(ot.clock);"   class="form-control input-large {$yzclass}" {$yzstr}  placeholder="请输入{$title}"  name="{$name}">{$set_replace_value}</textarea>
</div>
eot;
				break;
			case 'bigtextarea':
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<div class="form-wrap">
<textarea  rows=1 cols=40 style='overflow:scroll;overflow-y:hidden;;overflow-x:hidden;overflow-x:hidden;width:96%;' onfocus="ot.autoHeight(this);" onblur="clearInterval(ot.clock);"   class="form-control input-large {$yzclass}" {$yzstr}  placeholder="请输入{$title}"  name="{$name}">{$set_replace_value}</textarea>
</div>
eot;
				break;
			case 'slidedate':
				///////////////////////////////////////////////////////////////////////////
				$formjs['slidedate']++;
				if ($setvalue) {
					$setvalue = time_format($setvalue, 'Y-m-d');
				} else {
					$setvalue = date('Y-m-d');
				}
				$tem_input = <<<eot
<div class="form-wrap">
	<input name="{$name}" id="slidedate_{$name}" type="text" readonly class="form-control input-middle time" style="width:145px;" value="{$set_replace_value}" placeholder="请选择时间" />
</div>
eot;
				$initformjs .= <<<eot
!function(){
	var currYear = (new Date()).getFullYear();
	var dateobj=$('#slidedate_{$name}');
	var vstr=dateobj.val();
	var formstr='yy-mm-dd hh:ii:ss';
	if(!vstr||/^\d{4}\-\d{2}\-\d{2}$/ig.test(vstr)){
		formstr='yy-mm-dd';
	}
	var opt={
		date:{preset : 'date'},
		datetime:{preset : 'datetime'},
		time:{preset : 'time'},
		default : {
			theme: 'android-ics light', //皮肤样式
	        display: 'modal', //显示方式
	        mode: 'scroller', //日期选择模式
			dateFormat: formstr,
			lang: 'zh',
			multiSelect: true,//是否可以多选
			showNow: true,
			setText: '确定', //确认按钮名称
			dateOrder: 'yymmdd', //面板中日期排列格式
			dayText: '日', monthText: '月', yearText: '年', //面板中年月日文字
			cancelText: "取消",
			nowText: "今天",
	        startYear: currYear - 80, //开始年份
	        endYear: currYear + 10//, //结束年份
	        //窗体标题头显示
	       // headerText: function (valueText) {
           // 	var tar = valueText.split('-');
           // 	return tar[0] + "年"+tar[1] + "月" ;
       		// }
	}
	};
	dateobj.mobiscroll($.extend(opt['date'], opt['default']));
}();
eot;
				break;
			case 'datetime':
				///////////////////////////////////////////////////////////////////////////
				$formjs['datetime']++;
				if ($setvalue) {
					$setvalue = time_format($setvalue, 'Y-m-d');
				} else {
					$setvalue = date('Y-m-d');
				}
				$tem_input = <<<eot
<div class="form-wrap">
	<input name="{$name}" id="datetime_{$name}" type="text" readonly class="form-control input-middle time" style="width:145px;" value="{$set_replace_value}" placeholder="请选择时间" />
</div>
eot;
				$initformjs .= <<<eot
!function(){
	var dateobj=$('#datetime_{$name}');
	var formstr='yyyy-mm-dd';
	// if(!/^\d{4}\-\d{2}\-\d{2}$/ig.test(dateobj.val())){
	// 	formstr='yyyy-mm-dd hh:ii:ss';
	// }
	dateobj.datetimepicker({
	    format: formstr,
	    language:"zh-CN",
	    minView:2,
	    autoclose:true
	});
}();
eot;
				break;
			case 'color':
				///////////////////////////////////////////////////////////////////////////
				$formjs['color']++;
				$tem_input = <<<eot
<input name="{$name}" type="text" class="jscolor form-control input-small" value="{$set_replace_value}" />
eot;
				break;
			case 'bool':
				///////////////////////////////////////////////////////////////////////////
				break;
			case 'select':
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<select name="{$name}" class="form-control input-middle divselect">
[REPLACE_OPTION]
</select>
eot;

				$optionstr = '';
				$extra     = parse_extra($extra);
				// var_dump($extra);
				// die();
				// is_array($extra) || ($extra = []);
				foreach ($extra as $key => $val) {
					$sel = '';
					$optionstr .= <<<eot
<option value="{$key}" {$sel}>{$val}</option>\n
eot;
				}
				$tem_input = str_replace('[REPLACE_OPTION]', $optionstr, $tem_input);
				break;

			case 'radio':
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<div class="controls">
	[REPLACE_RADIO]
</div>
eot;
				$sel      = '';
				$radiostr = '';
				$extra    = parse_extra($extra);
				// is_array($extra) || ($extra = []);
				foreach ($extra as $key => $val) {
					$radiostr .= <<<eot
<label class="form-radio">
  <input type="radio" name="{$name}" value="{$key}" {$sel} /><span>{$val}</span>
</label>\n
eot;
				}
				$tem_input = str_replace('[REPLACE_RADIO]', $radiostr, $tem_input);
				break;
			case 'checkbox':
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<div class="controls">
	[REPLACE_CHECKBOX]
</div>
eot;

				$sel      = '';
				$checkstr = '';
				$valuearr = explode(',', $setvalue);
				$extra    = parse_extra($extra);
				// is_array($extra) || ($extra = []);
				foreach ($extra as $key => $val) {
					$checkstr .= <<<eot
<label class="form-checkbox">
	<input type="checkbox" name="{$name}[]" value="{$key}"   {$sel}  />
	<span title="{$val}">{$val}</span>
</label>\n
eot;
				}
				$tem_input = str_replace('[REPLACE_CHECKBOX]', $checkstr, $tem_input);
				break;
			case 'editor':
				///////////////////////////////////////////////////////////////////////////
				$formjs['editor']++;
				$tem_input = <<<eot
 <!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="{$name}" name="{$name}" style="width:99%;height:150px;">{$set_replace_value}</script>
eot;
				$upurl = url('File/ueUpload');
				$upimg = url('File/zhuaimg');
				$initformjs .= <<<eot
!function(){
	//保存编辑器初始化数据
	var uescr{$name}='';
	var ue{$name} = UE.getEditor("{$name}",{
	    serverUrl:'{$upurl}',
	    initialFrameHeight:300,
	    imagePath:'',
	    focus: true

	});
	ue{$name}.addListener('focus',function(editor){
	  // uescr{$name}=ue{$name}.getContent();
	  });
	ue{$name}.addListener('blur',function(editor){
	  // ot.delEditorImg(uescr{$name},ue{$name}.getContent());
	  });
	window.downycimage_ue{$name}=function(){
		am.zhuaquEditorImage(ue{$name},'{$upimg}');
	};
	setTimeout(function(){
		$('#edui2').append('<div id="edui213" onclick="downycimage_ue{$name}();" class="edui-box edui-button edui-for-drafts edui-default">下载远程图片</div>');
	},3000);


}();
eot;
				break;
			case 'umeditor':
				$formjs['umeditor']++;
				$tem_input = <<<eot
<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="umeditor_{$name}" name="{$name}"  style="width:100%;height:240px;">{$set_replace_value}</script>
eot;
				$initformjs .= <<<eot
!function(){
    //实例化编辑器
    var um = UM.getEditor('umeditor_{$name}');
    um.addListener('blur',function(){
        // console.log('编辑器失去焦点了');
    });
    um.addListener('focus',function(){
       // console.log('获得焦点了');
    });
}();
eot;
				break;
			case 'picture':
				///////////////////////////////////////////////////////////////////////////
				$formjs['picture']++;
				$daarr     = get_upload_picture_html($name, $set_replace_value);
				$tem_input = $daarr['str'];
				$initformjs .= $daarr['js'];
				break;
			case 'batchpicture':
				///////////////////////////////////////////////////////////////////////////
				$formjs['picture']++;
				$daarr     = get_upload_picture_html($name, $set_replace_value, true);
				$tem_input = $daarr['str'];
				$initformjs .= $daarr['js'];
				break;
			case 'bdpicture':
				///////////////////////////////////////////////////////////////////////////
				$formjs['bdpicture']++;
				$daarr     = get_bdupload_picture_html($name, $set_replace_value);
				$tem_input = $daarr['str'];
				$initformjs .= $daarr['js'];
				break;
			case 'bdbatchpicture':
				///////////////////////////////////////////////////////////////////////////
				$formjs['bdpicture']++;
				$daarr     = get_bdupload_picture_html($name, $set_replace_value, true);
				$tem_input = $daarr['str'];
				$initformjs .= $daarr['js'];
				break;
			case 'file':
				///////////////////////////////////////////////////////////////////////////
				$formjs['picture']++;
				$daarr     = get_upload_picture_html($name, $set_replace_value, false, true);
				$tem_input = $daarr['str'];
				$initformjs .= $daarr['js'];
				break;
			case 'liandong':
				///////////////////////////////////////////////////////////////////////////
				$formjs['liandong']++;
				$tem_input = <<<eot
<style>select.selarea{ width:150px; overflow:hidden;}</style>
<input type="hidden" id="ssq{$name}"  name="{$name}"  value="{$set_replace_value}" />
<select id="Province{$name}" class="form-control selarea"><option value="0">请选择--</option></select>
<select id="city{$name}" class="form-control selarea"><option value="0">请选择--</option></select>
<select id="area1{$name}" class="form-control selarea"><option value="0">请选择--</option></select>
eot;
				$initformjs .= <<<eot
!function(){
	cityselect.create("ssq{$name},Province{$name},city{$name},area1{$name}");
}();
eot;
				break;
			case 'attribute':
				///////////////////////////////////////////////////////////////////////////
				$opstr = '';
				$dlist = get_goods_type_list();
				foreach ($dlist as $key => $vo) {
					$opstr .= "<option value='{$vo['goods_type_id']}'>{$vo['title']}</option>";
				}
				$url       = U('Goodstypeattribute/formlist');
				$tem_input = <<<eot
<select class="form-control divselect" id="goodstype_form" name="goods_type_id">
<option value="0">请选择--</option>
{$opstr}
</select>
<div id="goodsattribute" style="  padding: 20px 0px 0px 20px;" class="">
</div>


eot;
				$initformjs .= <<<eot
!function(){
	var goodstypeform=$('#goodstype_form');
	goodstypeform.val('{$set_replace_value}');
	goodstypeform.bind('propertychange change',function(){
		var idd=$(this).val();
		var productid=$('#productid').val();
		//productid产品的id在编辑表单里面首先用js写上这个变量值为当前产品的id
			$.ajax({
				'type':'POST',
				'url':"{$url}",
				'data':{goods_type_id:idd,mainid:productid},
				'success': function(da){
				$('#goodsattribute').html(da);
				}
			});
	});
	goodstypeform.change();
}();
eot;
				break;
			case 'cutpicture':
				///////////////////////////////////////////////////////////////////////////
				$formjs['cutpicture']++;
				$daarr     = get_upload_picture_html($name, $set_replace_value);
				$tem_input = $daarr['str'];
				$initformjs .= $daarr['js'];
				break;
			case 'custom':
				$tdata     = get_custom_form($extra, $name, $set_replace_value);
				$tem_input = $tdata['str'];
				$initformjs .= $tdata['js'];
				break;
			case 'string':
				$tem_input = <<<eot
<div class="form-wrap">
	<input type="text"  class="form-control input-large {$yzclass}" {$yzstr}   placeholder="请输入{$title}"  name="{$name}" value="{$set_replace_value}" />
</div>
eot;
				break;
			default:
				///////////////////////////////////////////////////////////////////////////
				$tem_input = <<<eot
<div class="form-wrap">
	<input type="text"  class="form-control input-small {$yzclass}" {$yzstr}   placeholder="请输入{$title}"  name="{$name}" value="{$set_replace_value}" />
</div>
eot;
				break;
			}

			/**
			 * 替换循环出来的表单
			 */

			$formstr .= str_replace('[REPLACE_INPUT]', $tem_input, $tem_formstr);
		}
		cache('_formcache/' . $md5key, $formstr);
		cache('_formcache/' . $md5key . '_default_value', $default_value);
		cache('_formcache/' . $md5key . '_importjs', $formjs);
		cache('_formcache/' . $md5key . '_initformjs', $initformjs);

	}
	//要引用的表单js
	$default_value = cache('_formcache/' . $md5key . '_default_value');
	$formjs        = array_merge($formjs, cache('_formcache/' . $md5key . '_importjs'));
	$initformjs    = cache('_formcache/' . $md5key . '_initformjs');

	//此表单的默认json字符串值
	// $default_value = json_encode($default_value);
	/**
	 * 添加用到的js
	 */
	if ($formjs['liandong'] && $formjs['liandong'] !== true) {
		$formjs['liandong'] = true;
		//注册js
		reg_js('city.min');
// 		$formjsstr .= <<<eot
		// <!--城市联动s start-->
		// <script type="text/javascript" charset="utf-8" src="{$static_dir}/js/city.min.js"></script>
		// <!--城市联动js end-->\n
		// eot;
	}
	if ($formjs['color'] && $formjs['color'] !== true) {
		$formjs['color'] = true;
		//注册js
		reg_js('jscolor/jscolor', false);
// 		$formjsstr .= <<<eot
		// <!--颜色选择器js start-->
		// <script type="text/javascript" charset="utf-8" src="{$static_dir}/jscolor/jscolor.js"></script>
		// <!--颜色选择器js end-->\n
		// eot;
	}
	if ($formjs['slidedate'] && $formjs['slidedate'] !== true) {
		$formjs['slidedate'] = true;
		//注册css js
		reg_css('slidedate/css/slidedate', false);
		reg_js('slidedate/js/slidedate,slidedate/js/mobiscroll', false);
	}
	if ($formjs['datetime'] && $formjs['datetime'] !== true) {
		$formjs['datetime'] = true;
		//注册css js
		reg_css('datetimepicker/css/datetimepicker.min,datetimepicker/css/dropdown.min', false);
		reg_js('datetimepicker/js/bootstrap-datetimepicker.min,datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN', false);
	}
	if ($formjs['picture'] && $formjs['picture'] !== true) {
		$formjs['picture'] = true;
		reg_css('css/zyUpload.min,uploadify.min', false);
		reg_js('uploadFile.min,jquery.uploadify.min', false);
// 		$formjsstr .= <<<eot
		// <!--上传图片js start-->
		// <link href="{$static_dir}/html5upload/css/zyUpload.min.css" type="text/css" rel="stylesheet" />
		// <link href="{$static_dir}/uploadify/uploadify.min.css" type="text/css" rel="stylesheet" />
		// <script src="{$static_dir}/html5upload/uploadFile.min.js" type="text/javascript" ></script>
		// <script src="{$static_dir}/uploadify/jquery.uploadify.min.js" type="text/javascript" ></script>
		// <!--上传图片js end-->\n

// eot;
	}
	if ($formjs['bdpicture'] && $formjs['bdpicture'] !== true) {
		$formjs['bdpicture'] = true;

		$geturl    = url('file/getFileInfo');
		$uploadurl = url('file/uploadPic');
		reg_css('css/webuploader', false);
		reg_js('webuploader.min,webuploader-init', false);
		$filesize = config('file_upload.maxSize');
		$formjsstr .= <<<eot
<script type="text/javascript">
window.webUploaderUrl={
 BASE_URL : '{$static_dir}/webuploader',
 FILEINFO_URL:'{$geturl}',
 UPLOADER_URL:'{$uploadurl}',
 FILE_SIZE:{$filesize}
};
</script>
<!--[if IE]>
<style>
.ie-show-ts{display:block;}
.uploader-wrap .note-sm,
.uploader-img p{display:none;}
</style>
<![endif]-->
eot;
// 		$formjsstr .= <<<eot
		// <!--百度上传图片js start-->
		// <script type="text/javascript">
		// // 添加编辑器放的位置路径
		// var webUploaderUrl={
		//  BASE_URL : '{$static_dir}/webuploader',
		//  FILEINFO_URL:'{$geturl}',
		//  UPLOADER_URL:'{$uploadurl}'
		// };
		// </script>
		// <link href="{$static_dir}/webuploader/css/webuploader.css" type="text/css" rel="stylesheet" />
		// <script src="{$static_dir}/webuploader/webuploader.min.js" type="text/javascript" ></script>
		// <script src="{$static_dir}/webuploader/demo.js" type="text/javascript" ></script>

// <!--百度上传图片js end-->\n

// eot;
	}
	if ($formjs['editor'] && $formjs['editor'] !== true) {
		$formjs['editor'] = true;
		reg_js('ueditor/ueditor.config,ueditor/ueditor.all.min,ueditor/lang/zh-cn/zh-cn', false);
		$formjsstr .= <<<eot
<!--ue编辑器js start-->
<script>
window.UEDITOR_HOME_URL='{$static_dir}/ueditor/';
</script>
<!--UE编辑器js end-->\n
eot;
// 		$formjsstr .= <<<eot
		// <!--ue编辑器js start-->
		// <script>
		// window.UEDITOR_HOME_URL='{$static_dir}/ueditor/';
		// </script>
		// <script type="text/javascript" src="{$static_dir}/ueditor/ueditor.config.min.js"></script>
		// <script type="text/javascript" src="{$static_dir}/ueditor/ueditor.all.min.js"></script>
		// <script type="text/javascript" src="{$static_dir}/ueditor/lang/zh-cn/zh-cn.min.js"></script>
		// <!--UE编辑器js end-->\n

// eot;
	}
	if ($formjs['umeditor'] && $formjs['umeditor'] !== true) {
		$formjs['umeditor'] = true;
		$uploadurl          = url('File/umUpload');
		reg_css('umeditor/themes/default/css/umeditor', false);
		reg_js('umeditor/umeditor.config,umeditor/umeditor.min,umeditor/lang/zh-cn/zh-cn', false);
		$initjs = <<<eot
!function(){
    window.UMEDITOR_CONFIG.imageUrl="{$uploadurl}" ;
    window.UMEDITOR_CONFIG.imagePath="" ;
    window.UMEDITOR_CONFIG.imageFieldName="upfile" ;
}();
eot;
		reg_initjs($initjs);
// 		$formjsstr .= <<<eot
		// <!--um编辑器js start-->
		// <script type="text/javascript">
		// //window.UMEDITOR_HOME_URL='/';
		// </script>
		// <link href="{$static_dir}/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
		// <!--<script type="text/javascript" src="{$static_dir}/umeditor/third-party/jquery.min.js"></script>-->
		// <script type="text/javascript" charset="utf-8" src="{$static_dir}/umeditor/umeditor.config.js"></script>
		// <script type="text/javascript" charset="utf-8" src="{$static_dir}/umeditor/umeditor.min.js"></script>
		// <script type="text/javascript" src="{$static_dir}/umeditor/lang/zh-cn/zh-cn.js"></script>
		// <script type="text/javascript">
		// !function(){
		//     window.UMEDITOR_CONFIG.imageUrl="{$uploadurl}" ;
		//     window.UMEDITOR_CONFIG.imagePath="" ;
		//     window.UMEDITOR_CONFIG.imageFieldName="upfile" ;
		// }();

// </script>
		// <!--UE编辑器js end-->\n

// eot;
	}
	if ($formjs['cutpicture'] && $formjs['cutpicture'] !== true) {
		$formjs['cutpicture'] = true;
	}

	//$data = array_merge($default_value, $data);
	// 	if ($initformjs) {
	// 		reg_initjs($initformjs);
	// // 		$initformjs = <<<eot
	// 		// <!--初始化表单js-->
	// 		// <script type="text/javascript">
	// 		// $(function(){
	// 		// {$initformjs}
	// 		// });
	// 		// </script>
	// 		// eot;
	// 	}

	// $formstr .= $formjsstr . $initformjs;
	$formstr .= $formjsstr;

	//替换成默认值
	foreach ($default_value as $key => $value) {
		// dump('param.' . $key);
		$setvalue = $value['value'];
		// dump($setvalue);
		$inputtype = $value['type'];
		isset($data[$key]) && ($setvalue = $data[$key]);
		// if ($setvalue === '') {
		// 	dump('param.' . $key);

		// }
		//以url传过来的参数为主覆盖默认值
		// dump('param.' . $key);
		// dump($setvalue);
		$setvalue = input('param.' . $key, $setvalue);
		// dump($setvalue);
		// dump('pid:' . input('param.pid'));
		// dump($key . ':' . $setvalue);
		$key   = preg_quote($key);
		$value = preg_quote($setvalue);
		$key   = str_replace('/', '\/', $key);
		$value = str_replace('/', '\/', $value);
		switch ($inputtype) {
		case 'select':
			//替换select
			$pattern = '/<select[^<|^>|^\/]*?name\=\"' . $key . '\"[^<|^>|^\/]*?>.*?<\/select>/is';
			$match   = [];
			preg_match($pattern, $formstr, $match);
			if ($match) {
				$tstr     = $match[0];
				$pattern1 = '/(<option.*?value=\".*?\").*?(>.*?<\/option>)/i';
				$pattern2 = '/(<option.*?value=\"' . $value . '\").*?(>.*?<\/option>)/i';
				$tstr2    = preg_replace([$pattern1, $pattern2], ['$1$2', '$1 selected$2'], $tstr);
				$formstr  = str_replace($tstr, $tstr2, $formstr);
			}
			break;
		case 'radio':
			//替换radio
			//去掉默认的选中
			$pattern1 = '/(<input type=\"radio\".*?name\=\"' . $key . '\" value\=\".*?\").*? \/>/i';
			$pattern2 = '/(<input type=\"radio\".*?name\=\"' . $key . '\" value\=\"' . $value . '\").*? \/>/i';
			$formstr  = preg_replace([$pattern1, $pattern2], ['$1 />', '$1 checked="checked" />'], $formstr);
			break;
		case 'checkbox':
			//替换checkbox
			$valarr   = explode(',', $value);
			$pattern1 = '/(<input type=\"checkbox\".*?name\=\"' . $key . '\[\]" value\=\".*?\").*? \/>/i';
			$formstr  = preg_replace($pattern1, '$1 />', $formstr);
			foreach ($valarr as $v) {
				$pattern2 = '/(<input type=\"checkbox\".*?name\=\"' . $key . '\[\]\" value\=\"' . $v . '\").*? \/>/i';
				$formstr  = preg_replace($pattern2, '$1 checked="checked" />', $formstr);
			}
			break;
		case 'bdpicture':
		case 'picture':
			$setvalue = $setvalue ? $setvalue : 0;
			$formstr  = str_replace("[REPLACE_SETVALUE_{$key}]", $setvalue, $formstr);
			break;

		default:
			//替换文本框的值
			$formstr = str_replace("[REPLACE_SETVALUE_{$key}]", $setvalue, $formstr);
			break;
		}
		//替换初始化js里的值
		$initformjs = str_replace("[REPLACE_SETVALUE_{$key}]", $setvalue, $initformjs);
	}
	//替换掉隐藏类型的值
	$initformjs && reg_initjs($initformjs);

	//替换掉没有默认值的
	$formstr = preg_replace("/\[REPLACE\_SETVALUE\_.*?\]/i", '', $formstr);
	return $formstr;
}
/**
 * 生成百度上传图片的html和js
 */
function get_bdupload_picture_html($name, $setvalue, $muli = false, $filetype = false) {
	$ismuli    = $muli ? 'true' : 'false';
	$tem_input = <<<eot
<div class="webuploader-wh">
    <div id="bdupimage_{$name}"></div>
    <div id="imglist_bdupimage_{$name}" class="upcl"></div>
    <input type="hidden" id="uploadpic_bdupimage_{$name}" name="{$name}" value="{$setvalue}" />

</div>
eot;
	$initjs = <<<eot
        var uploader{$name}=setInterval(function(){
        if(webUploader.jiance()){
        clearInterval(uploader{$name});
	!function(){
	    //初始化上传控件
	    var conId='#bdupimage_{$name}';//上传容器id
	    var imglistId='#imglist_bdupimage_{$name}';//上传成功预览图片列表id
	    var valId='#uploadpic_bdupimage_{$name}';//当前图片值表单id
	    var ismuli={$ismuli};//是否多图上传
	    var uploader=new webUploader.create();
	    uploader.init(conId,ismuli, function(data,upObj) {
	        // console.log(data);
	        // console.log(upObj);
	        // $(valId).val(data.id);
	        uploader.addImg(valId,imglistId,data,ismuli);
	    });
	    //初始化图片列表
	    uploader.initImgList(valId,imglistId,ismuli);
	}();
         }
        },100);
eot;
	return ['str' => $tem_input, 'js' => $initjs];
}
/**
 * 生成上传图片的html和js
 * @param  [type]  $name     表单name值
 * @param  [type]  $setvalue 表单默认值
 * @param  boolean $muli     是否可以多个文件上传
 * @param  boolean $filetype 是否是附件上传
 * @return [type]            返回一个数组html和初始化的js['str',='','js'=>'']
 */
function get_upload_picture_html($name, $setvalue, $muli = false, $filetype = false) {
	$static_dir        = STATIC_DIR . '/static';
	$upload_text       = $filetype ? '上传附件' : '上传图片';
	$preimglist        = '';
	$uploadsuccessfunc = '';
	$preurl            = url('File/getFileInfo');
	$fileuploadurl     = url('File/uploadPic', array('session_id' => session_id()));
	$filetype && ($fileuploadurl = U('File/uploadfile', array('session_id' => session_id())));
	$is_muli_upload = $muli ? 'true' : 'false';
	$prejs          = ''; //加载图片或附件预览的js
	//上传附件
	if ($filetype) {
		//上传成功后的函数
		$uploadsuccessfunc = <<<eot
window.uploadPicture{$name}=function(upfile, data){
 var data = $.parseJSON(data);
  if(data.status){
    var name = "{$name}";
    var sid=$("#cover_id_{$name}").val();
    if(sid){
    	$.get(ainiku.delattach,{id:sid})}
    $("input[name="+name+"]").val(data.id);

    $("#uploadimg_{$name}").html(
      "<div class=\"upload-pre-file\"><span class=\"upload_icon_all\"></span>" + data.info + "<a href='javascript:;' class='btn btn-danger' dataid='"+data.id+"' >删除</a></div>"
    );
    ot&&ot.bindDelAttach();
  } else {
    ank.msg(data);
    setTimeout(function(){
      $('#top-alert').find('button').click();
      // $(that).removeClass('disabled').prop('disabled',false);
    },1500);
  }
}
eot;
		$prejs = <<<eot
!function(){
	var sid=$("#cover_id_{$name}").val();
	if(sid){
		$.post("{$preurl}",{id:sid,type:'other'},function(data){
			var da=data.info;
			if(da.length>0){
				var data=da[0];
			    $("#uploadimg_{$name}").html(
			      "<div class=\"upload-pre-file\"><span class=\"upload_icon_all\"></span>" + data.srcname + "<a href='javascript:;' class='btn btn-danger' dataid='"+data.id+"' >删除</a></div>"
			    );
			}

		});
	}
}();
eot;
	} else {
		//上传图片显示设置的默认图片
		$sethtml = $muli ? 'append' : 'html';
		$prejs   = <<<eot
!function(){
	var sid=$("#cover_id_{$name}").val();
	if(sid){
		$.post("{$preurl}",{id:sid,type:'img'},function(data){
			var da=data.data;
			if(da.length>0){
			for(a in da){
			    $("#uploadimg_{$name}").{$sethtml}(
			      "<div class='imgblock'><div class='upload-img-box uploadimg'><div class='upload-pre-item'><img layer-pid='"+da[a]['destname']+"' layer-src='"+da[a]['path']+"' src='" + da[a]['thumbpath'] + "' /></div></div><a href='javascript:;' class='btn btn-danger' dataid='"+da[a]['id']+"' >删除</a></div>"
			    );
			}
			  layer.photos({
			    photos: '#uploadimg_{$name}'
			  });
			   am.bindDeleteImg();
			}
		});
	}
}();
eot;
		//上传图片
		if ($muli) {
			//多图上传

			//上传成功后的函数
			$uploadsuccessfunc = <<<eot
window.uploadPicture{$name}=function(upfile, data){
  var data = $.parseJSON(data);
  if(data.status){
    var a=$("#cover_id_{$name}").val();
    a=a.replace(/\s+/g,'');
    if(a==''){a=data.id;}else{a+='|'+data.id}
    $("#cover_id_{$name}").val(a);
    var selobj=$("#uploadimg_{$name}");
    selobj.append(
      "<div class='imgblock'><div class='upload-img-box uploadimg'><div class='upload-pre-item'><img  layer-pid='"+data.srcname+"' layer-src='"+data.path+"' src='" + data.thumbpath + "' /></div></div><a href='javascript:;' class='btn btn-danger' dataid='"+data.id+"' >删除</a></div>"
    );

   am.bindDeleteImg();
  } else {
    ank.msg(data);
    setTimeout(function(){
      $('#top-alert').find('button').click();
      // $(that).removeClass('disabled').prop('disabled',false);
    },1500);
  }
};
eot;
		} else {
			//上传成功后的函数
			$uploadsuccessfunc = <<<eot
    window.uploadPicture{$name}=function(upfile, data){
        var data = $.parseJSON(data);
        var src = '';
        if(data.status){
            var sid=$("#cover_id_{$name}").val();
        if(sid!=""){
        	$.get(ainiku.delimg,{id:sid})}
      $("#cover_id_{$name}").val(data.id);
            src = data.url ||  data.path
            $("#uploadimg_{$name}").html(
                "<div class='imgblock'><div class='upload-img-box uploadimg'><div class='upload-pre-item'><img  layer-pid='"+data['srcname']+"' layer-src='"+data['path']+"' src='" + src + "' /></div></div><a href='javascript:;' class='btn btn-danger' dataid='"+data.id+"' >删除</a></div>"
            );

   am.bindDeleteImg();
        } else {
            ank.msg(data);
            setTimeout(function(){
                $('#top-alert').find('button').click();
               // $(that).removeClass('disabled').prop('disabled',false);
            },1500);
        }
    };
eot;
		}
	}

	//表单字符串
	$tem_input = <<<eot
<div class="controls h5upload-block">
<input type="file" name="file" id="upload_picture_{$name}"  style="display:none;">
<a  id="demohtml5upload{$name}btn" class="btn  html5uploadbtn" style="margin-bottom:10px;"  href="javascript:;">展开</a>
<div id="demohtml5upload{$name}" class="demo  html5upload"></div>
<input type="hidden" name="{$name}" id="cover_id_{$name}" value="{$setvalue}"/>
<div id="uploadimg_{$name}" class="cl">

</div>
</div>
eot;
	$initjs = <<<eot
//自动加载图片或附件预览
{$prejs}
if (window.applicationCache) {
   // 把原来的上传按钮去掉
  $('#upload_picture_{$name}').remove();
  $('#demohtml5upload{$name}btn').click(function(e) {
      var aaa=$(this).text();
      if(aaa=='展开'){
	      $('#demohtml5upload{$name}').slideDown();
	      $(this).html('收缩');
      }else{
        $(this).html('展开');
        $('#demohtml5upload{$name}').slideUp();
      }
  });
  // 初始化插件
  $("#demohtml5upload{$name}").zyUpload({
    parentsel   :'#demohtml5upload{$name}',
    width            :   "80%",                 // 宽度
    height           :   "auto",                 // 宽度
    itemWidth        :   "120px",                 // 文件项的宽度
    itemHeight       :   "100px",                 // 文件项的高度
    url              :   "{$fileuploadurl}",       // 上传文件的路径
    data             :{myname:'your name'},
    multiple         :   {$is_muli_upload},        // 是否可以多个文件上传
    dragDrop         :   true,                    // 是否可以拖动上传文件
    del              :   true,                    // 是否可以删除文件
    finishDel        :   true,            // 是否在上传文件完成后删除预览
    /* 外部获得的回调接口 */
    // 选择文件的回调方法
    onSelect: function(files, allFiles){},
    // 删除一个文件的回调方法
    onDelete: function(file, surplusFiles){},
    // 文件上传成功的回调方法
    onSuccess: function(file,response){uploadPicture{$name}(file,response);},
    //文件上传失败的回调方法
    onFailure: function(file){},
    // 上传完成的回调方法
    onComplete: function(responseInfo){}
  });

} else {
  //  alert("你的浏览器不支持HTML5");
  $('#demohtml5upload{$name}btn').remove();
  $('#demohtml5upload{$name}').remove();
    //上传图片
    /* 初始化上传插件 */
    $("#upload_picture_{$name}").uploadify({
        "height"          : 30,
        "swf"             : "{$static_dir}/uploadify/uploadify.swf",
        "fileObjName"     : "filelist",
        "buttonText"      : "{$upload_text}",
        "uploader"        : "{$fileuploadurl}",
        "width"           : 120,
        'removeTimeout'   : 1,
        'fileTypeExts'    : '*.jpg; *.png; *.gif;*.bmp;',
        "onUploadSuccess" : uploadPicture{$name},
        'onFallback' : function() {
            alert('未检测到兼容版本的Flash.');
        }
    });
}

eot;
// {$uploadsuccessfunc}
	// return $tem_input;
	// echo $initjs . $uploadsuccessfunc;
	// die();
	return ['str' => $tem_input, 'js' => $initjs . $uploadsuccessfunc];
}

/**
 * 自动返回一个带tab标签的表单
 * @return [type] [description]
 */
function get_form_str($fieldarr, $data = []) {
	if (!is_array($fieldarr)) {
		$fieldarr = get_form_item($fieldarr);
	}
	// is_array($fieldarr) || ($fieldarr = []);
	$field = [];
	if (isset($fieldarr['title'])) {
		$fieldarr = [$fieldarr];
		$field[0] = $fieldarr;
	} else {
		foreach ($fieldarr as $key => $value) {
			if (isset($value['tab_id'])) {
				$field[intval($value['tab_id'])][] = $fieldarr[$key];
			} else {
				$field[0][] = $fieldarr[$key];
			}
		}
	}
	if (count($field) > 1) {
		$field_title = [];
		$field_data  = [];
		ksort($field);
		foreach ($field as $key => $val) {
			$field_title[] = get_status($key, 'tab');
			$field_data[]  = create_form($val, $data);
		}
		$navstr   = '';
		$tabblock = '';

		foreach ($field_title as $value) {

			$navstr .= <<<eot
		<li class="tabnav"><a href="javascript:;">{$value}</a></li>
eot;
		}
		$show = true;
		foreach ($field_data as $value) {
			$tem = '';
			if ($show) {
				$show = false;
				$tem  = 'block';
			} else {
				$tem = 'none';
			}
			$tabblock .= <<<eot
		<div class="tabdiv" style="display:{$tem};">{$value}</div>
eot;
		}
		$str = <<<eot
<div  class="tab">
	<ul class="tabnavblock cl">
	   {$navstr}
	</ul>

	<div class="tabdivblock">
		{$tabblock}
	</div>
</div>
eot;
		reg_js('mytab');
		reg_initjs("autoyz.init(); $('.tab').mytab({navcls:'.tabnav',divcls:'.tabdiv',effect:'show',ev:'click',navhovercls:'hover'});");
		return $str;
	} else {
		reg_initjs("autoyz.init();");
		foreach ($field as $key => $value) {
			return create_form($value, $data);
		}

	}
}
/**
 * 取表单项
 * @param  string $form_id 表单id或表单名称标识
 * @return [type]          [description]
 */
function get_form_item($form_id = '') {
	if (!$form_id) {
		return [];
	}
	$key  = 'sys_form' . $form_id;
	$list = cache($key);
	if (!$list || config('app_debug')) {
		$map = [];
		if (is_numeric($form_id)) {
			$map['form_id'] = $form_id;
		} else {
			$info = \think\Db::name('Form')
				->field('form_id')
				->where('name', $form_id)
				->find();
			if ($info) {
				$map['form_id'] = $info['form_id'];
			} else {
				return [];
			}

		}
		$list = \think\Db::name('FormItem')
			->where($map)
			->order('sort asc,form_item_id asc')
			->field('title,name,note,type,extra,is_require,is_show,value,data_ts,data_err,data_ok,data_reg,tab_id,sort')
		// ->fetchSql()
			->select();
		// cache($key, $list);
		\think\Cache::tag('formitem')->set($key, $list);
	}
	// dump($list);
	// die();
	return $list;
}
/**
 * 取自定义表单
 * @param  [type] $method 方法
 * @param  [type] $name   表单name
 * @param  [type] $data   表单值
 * @return [type]         返回字符串
 */
function get_custom_form($method, $name, $data) {
	// dump($method);
	// die();
	$form = new \app\common\Controller\Custom($method, $name, $data);
	if (method_exists($form, $method)) {
		return $form->$method();
	} else {
		return $form->index();
	}

}

// }
/**
 * 解析extra数据
 * @param  [type] $str 字符串
 * @return [type]      [description]
 */
function parse_extra($str) {
	if ($str) {
		$redata = parse_string_function($str);
		return ($redata === false) ? extra_to_array($str) : $redata;
	} else {
		return [];
	}
}
/**
 * 解析字符串函数
 * @param  string $funcname [description]
 * @return [type]           成功返回对象的数据,失败返回false
 */
function parse_string_function($funcname = '') {
	if (is_array($funcname)) {
		return $funcname;
	}
	$out = [];
	if (preg_match('/([a-zA-Z0-9_]+)(\=(.+))?/i', $funcname, $out)) {
		if (function_exists($out[1])) {
			$func = $out[1];
			$para = isset($out[3]) ? $out[3] : '';
			// $para = str_replace("'", '', $para);
			$para = explode(',', $para);
			if (empty($para)) {
				return $func();
			} else {
				// return call_user_func_array($func, explode(',', $para));
				return call_user_func_array($func, $para);
			}
		} else {
			return false;
		}
	} else {
		return false;
	}
}
/**
 *解析extra字符串数据
 */
function extra_to_array($extra) {
	if (is_array($extra)) {
		return $extra;
	}
	$extra = preg_replace(array('/\n/i', '/\s/i'), array(',', ''), $extra);
	$dest  = array();
	$tema  = explode(',', $extra);
	foreach ($tema as $val) {
		if (strpos($extra, ':') !== false) {
			$temb = explode(':', $val);
			if (count($temb) === 2) {
				$dest[trim($temb[0])] = trim($temb[1]);
			}

		} else {
			$dest[trim($val)] = trim($val);
		}
	}
	return $dest;
}
/**
 * 取表单tab类型标签
 * @return [type] [description]
 */
function select_form_tab() {
	return config('systemstatus')['tab'];
}
/**
 * 取表单类型
 * @return [type] [description]
 */
function select_form_type($key = null, $datatype = false) {
	// TODO 可以加入系统配置
	$formtype = [
		'string'         => '字符串',
		'select'         => '下拉框',
		'radio'          => '单选',
		'checkbox'       => '多选',
		'number'         => '数字',
		'double'         => '双精度数字',
		'password'       => '密码',
		'slidedate'      => '滑动日期',
		'datetime'       => '日期',
		'textarea'       => '文本框',
		'bigtextarea'    => '超大文本框',
		'cutpicture'     => '剪切图片',
		'file'           => '上传附件',
		'bool'           => '布尔',
		'color'          => '颜色选择器',
		'editor'         => '百度UE编辑器',
		'umeditor'       => '百度UM编辑器',
		'picture'        => '上传图片',
		'batchpicture'   => '批量上传图片',
		'bdpicture'      => '百度单图上传',
		'bdbatchpicture' => '百度多图上传',
		'liandong'       => '城市联动表单',
		'custom'         => '自定义表单',
		'attribute'      => '内容属性',
	];
	$mysqltype = [
		'string'         => "varchar(255) NOT NULL DEFAULT '' ",
		'select'         => "varchar(50) NOT NULL DEFAULT '' ",
		'radio'          => "varchar(50) NOT NULL DEFAULT '' ",
		'checkbox'       => "varchar(50) NOT NULL DEFAULT '' ",
		'number'         => "int(10) NOT NULL DEFAULT '0' ",
		'double'         => "double(10,2)  NOT NULL DEFAULT '0'",
		'password'       => "varchar(50) NOT NULL DEFAULT '' ",
		'slidedate'      => "varchar(50) NOT NULL DEFAULT '' ",
		'datetime'       => "varchar(50) NOT NULL DEFAULT '' ",
		'editor'         => 'longtext  NOT NULL ',
		'textarea'       => 'text  NOT NULL  ',
		'bigtextarea'    => 'text  NOT NULL ',
		'cutpicture'     => "int(10) NOT NULL  DEFAULT '0'",
		'file'           => "int(10) NOT NULL  DEFAULT '0'",
		'bool'           => "tinyint(1) NOT NULL DEFAULT '0'",
		'color'          => "varchar(8) NOT NULL DEFAULT '#000'",
		'umeditor'       => 'longtext  NOT NULL ',
		'picture'        => "int(10) NOT NULL  DEFAULT '0'",
		'batchpicture'   => "varchar(50) NOT NULL DEFAULT '' ",
		'bdpicture'      => "int(10) NOT NULL  DEFAULT '0'",
		'bdbatchpicture' => "varchar(50) NOT NULL DEFAULT '' ",
		'liandong'       => "varchar(20) NOT NULL DEFAULT '' ",
		'custom'         => '自定义表单',
		'attribute'      => "int(10) NOT NULL  DEFAULT '0'",
	];
	if ($datatype && !empty($key)) {
		return $mysqltype[$key];
	}

	if (empty($key) && $datatype === false) {
		return $formtype;
	} else {
		return $formtype[$key];
	}

}
<?php
namespace app\common\validate;
use think\Validate;

class FormItem extends Validate {
	protected $rule = [
		'type'  => 'require|alphaDash|max:25',
		'title' => 'require|max:100',
		'name'  => 'alphaDash|max:25',
		'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'type.require'   => '表单类型不能为空',
		'type.alphaDash' => '表单类型必须为字母',
		'type.max'       => '表单类型最多不能超过100个字符',
		'title.require'  => '表单项标题不能为空',
		'name.alphaDash' => '表单的name值一定要是字母',
		'name.max'       => '数据表最多不能超过25个字符',
		'sort.number'    => '排序必须是数字',
		'sort.between'   => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];

	protected $scene = [
		'add'  => ['name', 'email'],
		'edit' => ['email'],
	];

}
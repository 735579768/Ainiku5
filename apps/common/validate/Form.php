<?php
namespace app\common\validate;
use think\Validate;

class Form extends Validate {
	protected $rule = [
		'title' => 'require|max:25|unique:Form',
		'name'  => 'alphaDash|max:25|unique:Form',
		'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require'  => '表单标题不能为空',
		'title.unique'   => '表单标题已经存在',
		'name.alphaDash' => '数据表一定要是字母',
		'name.max'       => '数据表最多不能超过25个字符',
		'name.unique'    => '数据表名字已经存在',
		'sort.number'    => '排序必须是数字',
		'sort.between'   => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];

	protected $scene = [
		'edit' => [
			'title' => 'require|max:25',
			'name'  => 'alphaDash|max:25',
			'sort'  => 'number|between:0,100',
		],
	];

}
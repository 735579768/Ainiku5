<?php
namespace app\common\validate;
use think\Validate;

class Form extends Validate {
	protected $rule = [
		'title' => 'require|max:25',
		'name'  => 'alpha|max:25',
		'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require' => '表单标题不能为空',
		'name.alpha'    => '数据表一定要是字母',
		'name.max'      => '数据表最多不能超过25个字符',
		'sort.number'   => '排序必须是数字',
		'sort.between'  => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];

	protected $scene = [
		'add'  => ['name', 'email'],
		'edit' => ['email'],
	];

}
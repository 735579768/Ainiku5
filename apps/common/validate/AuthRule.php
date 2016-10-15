<?php
namespace app\common\validate;
use think\Validate;

class AuthRule extends Validate {
	protected $rule = [
		// 'type'  => 'require|alphaDash|max:25',
		'title' => 'require|max:100|unique:AuthRule',
		'name'  => 'max:100|unique:AuthRule',
		// 'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		// 'type.require'   => '权限规则类型不能为空',
		// 'type.alphaDash' => '权限规则类型必须为字母',
		// 'type.max'       => '权限规则类型最多不能超过100个字符',
		'title.require' => '权限规则标题不能为空',
		// 'name.alphaDash' => '权限规则的英文标识符值一定要是字母',
		'name.max'      => '权限规则的长度最多不能超过100个字符',
		// 'sort.number'    => '排序必须是数字',
		// 'sort.between'   => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];

	protected $scene = [
		// 'add'  => ['name', 'email'],
		'edit' => [
			'title' => 'require|max:25',
			'name'  => 'max:100',
		],
	];

}
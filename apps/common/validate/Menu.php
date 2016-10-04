<?php
namespace app\common\validate;
use think\Validate;

class Menu extends Validate {
	protected $rule = [
		'title' => 'require|max:25',
		'title' => 'unique:Menu',
		// 'url'   => 'alphaDash|max:25',
		// 'url'   => 'unique:Menu',
		'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require' => '菜单标题不能为空',
		'title.unique'  => '菜单标题已经存在',
		// 'url.alphaDash' => '菜单url一定要是字母',
		// 'url.max'       => '菜单url最多不能超过25个字符',
		// 'url.unique'    => '数据表名字已经存在',
		'sort.number'   => '排序必须是数字',
		'sort.between'  => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];
	//设置验证场景
	protected $scene = [
		'edit' => ['title' => 'require|max:25', 'sort'],
	];
}
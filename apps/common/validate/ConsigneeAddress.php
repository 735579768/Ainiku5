<?php
namespace app\common\validate;
use think\Validate;

class ConsigneeAddress extends Validate {
	protected $rule = [
		'title'         => 'require|max:25',
		'category_type' => 'require',
		'name'          => 'require|max:25|unique:Category',
		// 'url'   => 'alphaDash|max:25',
		// 'url'   => 'unique:Menu',
		'sort'          => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require'         => '分类标题不能为空',
		// 'title.unique'  => '分类标题已经存在',
		'category_type.require' => '分类类型不能为空',
		'name.require'          => '分类标识不能为空!',
		// 'name.alphaDash'        => '分类标识一定要是字母',
		'name.max'              => '分类标识最多不能超过25个字符',
		'name.unique'           => '分类标识名字已经存在',
		// 'url.alphaDash' => '分类url一定要是字母',
		// 'url.max'       => '分类url最多不能超过25个字符',
		// 'url.unique'    => '分类标识名字已经存在',
		'sort.number'           => '排序必须是数字',
		'sort.between'          => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];
	//设置验证场景
	protected $scene = [
		'edit' => ['title' => 'require|max:25', 'sort', 'category_type'],
	];
}
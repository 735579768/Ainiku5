<?php
namespace app\common\validate;
use think\Validate;

class Goods extends Validate {
	protected $rule = [
		'title'       => 'require|max:100|unique:Goods',
		'category_id' => 'require|gt:0',
		// 'content'     => 'require',
		'pic'         => 'require|number',
		// 'url'   => 'alphaDash|max:25',
		// 'url'   => 'unique:Menu',
		// 'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require'       => '产品标题不能为空',
		'title.unique'        => '产品标题已经存在',
		'category_id.require' => '请选择产品分类',
		'category_id.gt'      => '请选择产品分类',
		// 'content.require'     => '产品内容不能为空',
		'pic.number'          => '产品图片格式不正确',
		// 'url.alphaDash' => '产品url一定要是字母',
		// 'url.max'       => '产品url最多不能超过25个字符',
		// 'url.unique'    => '数据表名字已经存在',
		// 'sort.number'   => '排序必须是数字',
		// 'sort.between'  => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];
	//设置验证场景
	protected $scene = [
		'edit' => ['title' => 'require|max:25', 'category_id', 'content'],
	];
}
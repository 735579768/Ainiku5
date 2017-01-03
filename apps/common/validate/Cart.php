<?php
namespace app\common\validate;
use think\Validate;

class Cart extends Validate {
	protected $rule = [
		'title'       => 'require|max:100|unique:Article',
		'category_id' => 'require|gt:0',
		'content'     => 'require',
		'pic'         => 'require|number',
		// 'url'   => 'alphaDash|max:25',
		// 'url'   => 'unique:Menu',
		// 'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require'       => '文章标题不能为空',
		'title.unique'        => '文章标题已经存在',
		'category_id.require' => '请选择文章分类',
		'category_id.gt'      => '请选择文章分类',
		'content.require'     => '文章内容不能为空',
		'pic.number'          => '文章图片格式不正确',
		// 'url.alphaDash' => '文章url一定要是字母',
		// 'url.max'       => '文章url最多不能超过25个字符',
		// 'url.unique'    => '数据表名字已经存在',
		// 'sort.number'   => '排序必须是数字',
		// 'sort.between'  => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];
	//设置验证场景
	protected $scene = [
		'edit' => ['title' => 'require|max:100', 'category_id', 'content'],
	];
}
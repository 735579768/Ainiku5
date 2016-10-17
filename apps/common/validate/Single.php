<?php
namespace app\common\validate;
use think\Validate;

class Single extends Validate {
	protected $rule = [
		'title'     => 'require|max:25',
		'title'     => 'unique:Menu',
		// 'url'   => 'alphaDash|max:25',
		// 'url'   => 'unique:Menu',
		'index_tpl' => 'require|alphaDash|max:25',
		'name'      => 'require|alphaDash|max:25',
		'name'      => 'unique:Single',
		'sort'      => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'title.require'       => '单页标题不能为空',
		'title.unique'        => '单页标题已经存在',
		// 'url.alphaDash' => '单页url一定要是字母',
		// 'url.max'       => '单页url最多不能超过25个字符',
		// 'url.unique'    => '单页标识名字已经存在',
		'name.require'        => '单页标识不能为空',
		'name.alphaDash'      => '单页标识一定要是字母',
		'name.max'            => '单页标识最多不能超过25个字符',
		'name.unique'         => '单页标识名字已经存在',
		'index_tpl.require'   => '单页模板不能为空',
		'index_tpl.alphaDash' => '单页模板名一定要是字母',
		'sort.number'         => '排序必须是数字',
		'sort.between'        => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];
	//设置验证场景
	protected $scene = [
		'edit' => ['title' => 'require|max:25', 'sort', 'name' => 'require|alphaDash|max:25'],
	];
}
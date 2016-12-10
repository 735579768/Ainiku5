<?php
namespace addons\comment\validate;
use think\Validate;

class Comment extends Validate {
	protected $rule = [
		'name'    => 'require|max:100',
		'email'   => 'email',
		'content' => 'require',
		'url'     => 'require|url',

		// 'url'   => 'alphaDash|max:25',
		// 'url'   => 'unique:Menu',
		// 'sort'  => 'number|between:0,100',
		// 'search_format'  => 'require',
		// 'list_format'    => 'require',
		// 'recycle_format' => 'require',
	];

	protected $message = [
		'name.require'    => '姓名不能为空',
		'content.require' => '留言内容不能为空',
		'email.email'     => '邮箱格式不正确',
		'url.require'     => '地址不能为空',
		'url.url'         => '地址格式不正确',
		// 'title.unique'        => '留言标题已经存在',
		// 'category_id.require' => '请选择留言分类',
		// 'category_id.gt'      => '请选择留言分类',
		// 'content.require'     => '留言内容不能为空',
		// 'pic.number'          => '留言图片格式不正确',
		// 'url.alphaDash' => '留言url一定要是字母',
		// 'url.max'       => '留言url最多不能超过25个字符',
		// 'url.unique'    => '数据表名字已经存在',
		// 'sort.number'   => '排序必须是数字',
		// 'sort.between'  => '排序只能在0-100之间',
		// 'search_format.require'  => '搜索字符串格式错误',
		// 'list_format.require'    => '列表字符串格式错误',
		// 'recycle_format.require' => '回收站字符串格式错误',
	];
	//设置验证场景
	protected $scene = [
		'edit' => ['name' => 'require|max:25', 'content'],
	];
}
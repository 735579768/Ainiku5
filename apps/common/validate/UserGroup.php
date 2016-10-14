<?php
namespace app\common\validate;
use think\Validate;

class UserGroup extends Validate {
	protected $rule = [
		'title' => 'require|max:20',
		'title' => 'unique:UserGroup',

	];

	protected $message = [
		'title.require' => '用户组名称必须',
		'title.unique'  => '用户组标题已经存在',
	];

	protected $scene = [
		'edit' => ['title' => 'require|max:20'],
	];

}
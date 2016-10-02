<?php
namespace app\common\validate;
use think\Validate;

class User extends Validate {
	protected $rule = [
		'name'  => 'alpha|max:25',
		'title' => 'require|max:25',
		'email' => 'email',
	];

	protected $message = [
		'name.require' => '名称必须',
		'name.max'     => '名称最多不能超过25个字符',
		'age.number'   => '年龄必须是数字',
		'age.between'  => '年龄只能在1-120之间',
		'email'        => '邮箱格式错误',
	];

	protected $scene = [
		'add'  => ['name', 'email'],
		'edit' => ['email'],
	];

}
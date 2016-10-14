<?php
namespace app\common\validate;
use think\Validate;

class User extends Validate {
	protected $rule = [
		'username'   => 'require|alphaNum|length:6,20',
		'password'   => 'require|length:6,25',
		'repassword' => 'confirm:password',
		'nickname'   => 'require|length:2,10',
		// 'user_group_id' => 'require|number',
		'diqu'       => 'require|regex:^.{1,},.{1,},.{1,}$',
		'address'    => 'require',
		'mobile'     => 'require|regex:^[1][0-9]{10}$|unique:User',
		'email'      => 'require|email|unique:User',
	];

	protected $message = [
		'username.require'   => '用户名必须填写',
		'username.alphaNum'  => '用户名只能用字母和数字',
		'username.length'    => '用户名长度为6到20个字符',
		'password.require'   => '密码必须填写',
		// 'password.alphaDash' => '密码只能用字母和数字，下划线_及破折号-',
		'password.length'    => '密码长度为6到25个字符',
		'repassword.confirm' => '两次输入的密码不一致',
		'diqu.require'       => '请选择地址',
		'diqu.regex'         => '请选择地址',
		'address.require'    => '请填写详细地址',
		'nickname.require'   => '姓名/昵称不能为空',
		'nickname.length'    => '姓名/昵称长度为2到10个字符',
		'mobile.require'     => '手机号不能为空',
		'mobile.regex'       => '手机格式不正确',
		'mobile.unique'      => '手机号已经存在',
		'email.require'      => '邮箱不能为空',
		'email.email'        => '邮箱格式不正确',
		'emial.unique'       => '邮箱已经存在',
	];

	protected $scene = [
		'edit'      => ['diqu', 'address', 'nickname', 'email', 'mobile'],
		'updatepwd' => ['password'],
	];

}
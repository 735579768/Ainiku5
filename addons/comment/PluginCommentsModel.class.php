<?php
// | Author: 枫叶 <735579768@qq.com> <http://www.zhaokeli.com>
// +----------------------------------------------------------------------

namespace Plugins\Comments;
use Think\Model;

/**
 * 用户模型
 * @author 寞枫 <735579768@qq.com>
 */

class PluginCommentsModel extends Model {
	/* 用户模型自动验证 */
	protected $_validate = array(

		/* 验证标识符 */
		array('content', 'require', '内容不能空', self::EXISTS_VALIDATE),
		/* 验证邮箱 */
		array('email', 'email', '邮箱格式不正确', self::EXISTS_VALIDATE), //邮箱格式不正确
		array('email', '1,32', '邮箱长度不合法', self::EXISTS_VALIDATE, 'length'), //邮箱长度不合法
		// array('email', '', -8, self::EXISTS_VALIDATE, 'unique',1), //邮箱被占用
		/* 验证手机号码 */
		array('mobile', '//', '手机格式不正确', self::EXISTS_VALIDATE), //手机格式不正确 TODO:
	);
	/* 用户模型自动完成 */
	protected $_auto = array(
		array('ip', 'getip', self::MODEL_INSERT, 'callback'),
		array('location', 'getadr', self::MODEL_BOTH, 'callback'), //手机禁止注册
		array('create_time', NOW_TIME, self::MODEL_BOTH),
		array('status', '1', self::MODEL_INSERT),
	);
	protected function getadr() {
		return get_iplocation(get_client_ip());
	}
	protected function getip() {
		return get_client_ip();
	}
}

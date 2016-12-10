<?php
namespace app\admin\logic;

class Base extends \app\admin\Controller\Base {
	public function returnResult($status = 1, $success = '操作成功', $fail = '操作失败') {
		if ($status) {
			return $this->success($success);
		} else {
			return $this->error($fail);
		}
	}
}

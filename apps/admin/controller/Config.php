<?php
namespace app\admin\controller;

class Config extends Base {
	public function index() {
		return $this->fetch();
	}
	public function group() {
		if (request()->isPost()) {
			$data   = json_encode(input('post.'));
			$result = model('Config')
				->isUpdate(true)
				->save(['value' => $data], ['config_id' => 1]);
			cache('sys_config', $data);
			$this->returnResult($result, '保存成功', '保存失败');
		} else {
			// dump(config(''));
			$this->assign('meta_title', '系统配置');
			$data = get_sys_config();
			$this->assign('data', $data);
			return $this->fetch();
		}

	}
}

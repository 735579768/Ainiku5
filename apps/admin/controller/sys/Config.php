<?php
namespace app\admin\controller\sys;

class Config extends Base {
	/**
	 * 输出系统环境信息
	 * @return [type] [description]
	 */
	public function index() {
		//取运行缓存目录大小
		$runsize = cache('runsize');
		//取jscss缓存目录大小
		$jscsssize = cache('jscsssize');
		//取图片缩略图缓存目录大小
		$imagesize = cache('imagesize');
		//取上传目录大小
		$uploadsize = cache('uploadsize');

		if (request()->isAjax()) {
			if (empty($runsize)) {
				$runsize = (get_dir_size(RUNTIME_PATH) / 1000) . 'k';
				cache('runsize', $runsize);
			}

			if (empty($jscsssize)) {
				$jscsssize = (get_dir_size(SITE_PATH . config('greate_cache_path.jscss')) / 1000) . 'k';
				cache('jscsssize', $jscsssize);
			}

			if (empty($imagesize)) {
				$imagesize = (get_dir_size(SITE_PATH . config('greate_cache_path.imgcache')) / 1000) . 'k';
				cache('imagesize', $imagesize);
			}

			if (empty($uploadsize)) {
				$uploadsize = (get_dir_size(SITE_PATH . config('file_upload.rootPath')) / 1000) . 'k';
				cache('uploadsize', $uploadsize);
			}
			$this->success('查询成功!');
		}

		$this->assign([
			'meta_title' => '系统环境',
			'runsize'    => $runsize,
			'uploadsize' => $uploadsize,
			'jscsssize'  => $jscsssize,
			'imagesize'  => $imagesize,
		]);
		return $this->fetch();
	}
	public function group() {
		if (request()->isPost()) {
			$data     = input('param.');
			$sys_conf = get_sys_config();
			$data     = json_encode(array_merge($sys_conf, $data));
			$result   = model('Config')
				->isUpdate(true)
				->save(['value' => $data], ['config_id' => 1]);
			cache('sys_config', null);
			add_user_log('更新网站配置', input('param.'));
			$this->returnResult($result, '保存成功', '保存失败');
		} else {
			// dump(config(''));
			$map['tab_id'] = input('param.tab_id', 3);
			$list          = \think\Db::name('FormItem')
				->where($map)
				->order('sort asc,form_item_id asc')
				->select();
			define('show_mark', true);

			$data = get_sys_config();
			// dump($data);
			$sta = config('systemstatus.tab');
			$this->assign([
				'meta_title' => $sta[$map['tab_id']] . '配置',
				'formarr'    => $list,
				'data'       => $data,
				'tab_id'     => $map['tab_id'],
			]);
			return $this->fetch();
		}

	}
}

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
			'runsize'    => $runsize,
			'uploadsize' => $uploadsize,
			'jscsssize'  => $jscsssize,
			'imagesize'  => $imagesize,
		]);
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
			define('show_mark', true);
			$this->assign('meta_title', '系统配置');
			$data = get_sys_config();
			$this->assign('data', $data);
			return $this->fetch();
		}

	}
}

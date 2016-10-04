<?php
namespace app\common\controller;

trait File {
	public function getFileInfo() {
		$id    = input('post.id');
		$type  = input('post.type');
		$data  = [];
		$idarr = preg_replace('/\,|\||\s/', ',', $id);
		if ($type == 'img') {
			$data = \think\Db::name('Picture')
				->where('picture_id', 'in', $idarr)
				->select();
		} else {
			// $model = M('File');
			// $data  = $model->where(['id' => ['in', "$idarr"]])->select();
			$data = \think\Db::name('File')
				->where('file_id', 'in', $idarr)
				->select();
		}
		$this->success('ok', '', $data);
	}
	private function checksha($filepath = '') {
		$fpath = $filepath;
		if (file_exists($fpath)) {
			$sha1 = sha1_file($fpath);
			// $list = M('Picture')->where("sha1='$sha1'")->find();
			$list = \think\Db::name('Picture')
				->where('sha1', $sha1)
				->find();
			if (empty($list)) {
				return array('path' => $filepath, 'sha1' => $sha1);
			} else {
				//删除当前路径文件
				unlink($fpath);
				return $list;
			}
		} else {
			return $filepath;
		}
	}
	/**
	 * 上传图片
	 * @author huajie <banhuajie@163.com>
	 */
	public function uploadPic() {
		//TODO: 用户登录检测

		/* 返回标准数据 */
		$return = array(
			'status'   => 1,
			'srcname'  => $_FILES['filelist']['name'],
			'destname' => '',
			'info'     => '上传成功',
			'path'     => '',
			'id'       => '',
			'url'      => '',
			'data'     => '',
		);
		$SITE_PATH    = SITE_PATH; //网站根目录
		$targetFolder = '.' . config('file_upload.rootPath'); //保存图片的根目录
		$targetPath   = '';
		$thumbPath    = '';
		$data         = array();
		if (!empty($_FILES)) {
			$tempFile = $_FILES['filelist']['tmp_name'];
			//生成的文件名字
			$extend   = explode(".", strtolower($_FILES['filelist']['name']));
			$va       = count($extend) - 1;
			$filename = time() . mt_rand(10000, 99999) . "." . $extend[$va];
			//文件类型文件夹
			$foldertype = '';
			switch ($extend[$va]) {
			case 'jpg':$targetFolder .= '/image';
				$foldertype = '/thumb';
				break;
			case 'png':$targetFolder .= '/image';
				$foldertype = '/thumb';
				break;
			case 'gif':$targetFolder .= '/image';
				$foldertype = '/thumb';
				break;
			case 'jpeg':$targetFolder .= '/image';
				$foldertype = '/thumb';
				break;
			case 'bmp':$targetFolder .= '/image';
				$foldertype = '/thumb';
				break;
			case 'mp4':$targetFolder .= '/file/video';
				break;
			default:$targetFolder .= '/file/other';
				break;
			}
			$imgpath = $targetFolder . '/' . date('Ymd');
			if (!create_folder($imgpath)) {
				$return['info']   = '创建目录错误：' . $imgpath;
				$return['status'] = 0;
				$this->ajaxreturn($return);
			}
			$imgpath2 = $targetFolder . $foldertype . '/' . date('Ymd');
			if (!create_folder($imgpath)) {
				$return['info']   = '创建目录错误：' . $imgpath;
				$return['status'] = 0;
				$this->ajaxreturn($return);
			}

			$targetPath = $targetFolder . '/' . date('Ymd') . '/' . $filename;

			// Validate the file type
			$fileTypes = array('jpg', 'jpeg', 'gif', 'png'); // File extensions

			if (in_array($extend[$va], $fileTypes)) {
				$bl = move_uploaded_file($tempFile, $targetPath);

				$thumbPath = str_replace('/image/', '/image/thumb/', $targetPath);
				if ($bl) {
					//判断是不是已经上传过类似图片
					$shafile = $this->checksha($targetPath);
					// dump($shafile);
					$targetPath   = $shafile['path'];
					$data['sha1'] = $shafile['sha1'];
					//如果是图片就生成缩略图
					if (in_array($extend[$va], array('jpg', 'jpeg', 'gif', 'png', 'bmp'))) {
						//生成缩略图
						//缩略图路径
						$wh = explode('*', config('thumb_size'));
						$re = create_thumb($targetPath, $thumbPath, $wh[0], $wh[1]);
						if ($re !== true) {
							$thumbPath = trim($targetPath, '.');
						}

					}
					$return['path'] = trim($targetPath, '.');
				} else {
					$return['info']   = '上传错误' . $tempFile . '->' . $targetPath;
					$return['status'] = 0;
				}
			} else {
				$return['info']   = '不支持此文件类型';
				$return['status'] = 0;
			}
		} else {
			$return['info']   = "文件不能为空";
			$return['status'] = 0;
		}

		if ($return['status'] == 1) {
			//保存文件信息到数据库
			$cupath       = trim($targetPath, '.');
			$data['path'] = $cupath;
			//$data['sha1']        = $shafile['sha1'];
			$data['thumbpath']   = trim($thumbPath, '.');
			$data['destname']    = $filename;
			$data['srcname']     = $_FILES['filelist']['name'];
			$data['create_time'] = time();
			$data['uid']         = UID;

			$result = \think\Db::name('Picture')
				->insert($data);
			// if ($model->create($data)) {
			// $result = $model->add($data);
			if ($result) {
				//添加水印
				$this->markpic($thumbPath);
				$this->markpic($targetPath);
				$return['id'] = $result;
			}
			// }
		}

		/* 返回JSON数据 */
		$this->ajaxReturn(array_merge($return, $data));
	}
	//图片添加水印
	private function markpic($dst = null) {
		//取水印图片
		$src       = realpath('.' . get_picture(config('shuiyin_image')));
		$shuiyinon = config('shuiyin_on');
		if ($shuiyinon == '1' && $dst !== false && $src !== false) {
			image_water($dst, $src, $dst);
		} else if ($shuiyinon == '2' && $dst !== false && $src !== false) {
			image_water($dst, '', $dst, config('shuiyin_text'));
		}
	}
}

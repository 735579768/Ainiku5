<?php
namespace app\common\controller;

trait File {
	/**
	 * 图片初始化显示获取信息
	 * @return [type] [description]
	 */
	public function getFileInfo() {
		$id   = input('param.id');
		$type = input('param.type');
		$data = [];
		// $idarr = preg_replace('/\,|\||\s/', ',', $id);
		if ($type == 'img') {
			$data = \think\Db::name('Picture')
				->field('picture_id as id,destname,path,thumbpath')
				->where('picture_id', 'in', $id)
			// ->fetchSql()
				->select();
			// echo $data;
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
				->where(['sha1' => $sha1])
				->WhereOr(['re_sha1' => $sha1])
			// ->fetchSql()
				->find();
			// echo $list;
			// die();
			if (empty($list)) {
				return array('path' => $filepath, 'sha1' => $sha1);
			} else {
				//删除当前路径文件
				@unlink($fpath);
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
		$SITE_PATH  = SITE_PATH; //网站根目录
		$targetPath = '.' . config('file_upload.rootPath') . '/image/' . date('Ymd'); //保存图片的根目录
		$thumbPath  = str_replace('/image/', '/image/thumb/', $targetPath);
		$data       = array();
		if (!empty($_FILES)) {
			$tempFile = $_FILES['filelist']['tmp_name'];
			//生成的文件名字
			$extend   = explode(".", strtolower($_FILES['filelist']['name']));
			$va       = count($extend) - 1;
			$filename = time() . mt_rand(10000, 99999) . "." . $extend[$va];
			if (!create_folder($targetPath)) {
				$return['info']   = '创建目录错误：' . $targetPath;
				$return['status'] = 0;
				$this->ajaxreturn($return);
			}
			if (!create_folder($thumbPath)) {
				$return['info']   = '创建目录错误：' . $thumbPath;
				$return['status'] = 0;
				$this->ajaxreturn($return);
			}

			$targetPath .= '/' . $filename;
			$thumbPath .= '/' . $filename;

			// Validate the file type
			$fileTypes = array('jpg', 'jpeg', 'gif', 'png'); // File extensions

			if (in_array($extend[$va], $fileTypes)) {
				$bl = move_uploaded_file($tempFile, $targetPath);

				// $thumbPath = str_replace('/image/', '/image/thumb/', $targetPath);
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
			$data['path'] = trim($targetPath, '.');
			//$data['sha1']        = $shafile['sha1'];
			$data['thumbpath']   = trim($thumbPath, '.');
			$data['destname']    = $filename;
			$data['srcname']     = $_FILES['filelist']['name'];
			$data['create_time'] = time();
			$data['uid']         = UID;

			$result = \think\Db::name('Picture')
				->insertGetId($data);
			if ($result) {
				//添加水印
				$this->markPic($thumbPath);
				$this->markPic($targetPath);
				$return['id'] = $result;
			}
		}

		/* 返回JSON数据 */
		$this->ajaxReturn(array_merge($return, $data));
	}
	//图片添加水印
	private function markPic($dst = '') {
		//取水印图片
		$src          = realpath('.' . get_picture(config('shuiyin_image')));
		$shuiyinon    = config('shuiyin_on');
		$shuiyinmodel = config('shuiyin_model');
		if ($shuiyinon == '1') {
			if ($shuiyinmodel == '1') {
				image_water($dst, '', $dst, config('shuiyin_text'));
			} else {
				image_water($dst, $src, $dst);
			}
		}
	}
	/**
	 * um编辑器上传图片
	 */
	public function umUpload() {
		include SITE_PATH . STATIC_DIR . "/static/umeditor/php/Uploader.class.php";
		//上传配置
		$config = array(
			"savePath"   => '.' . config('file_upload.rootPath') . "/image/", //存储文件夹
			"maxSize"    => 1000, //允许的文件最大尺寸，单位KB
			"allowFiles" => array(".gif", ".png", ".jpg", ".jpeg", ".bmp"), //允许的文件格式
		);
		//上传文件目录
		$Path = '.' . config('file_upload.rootPath') . "/image/";

		//背景保存在临时目录中
		$config["savePath"] = $Path;
		$up                 = new \Uploader("upfile", $config);
		$type               = @$_REQUEST['type'];
		$callback           = @$_GET['callback'];

		$info        = $up->getFileInfo();
		$info['url'] = trim($info['url'], '.');
		/**
		 * 返回数据
		 */
		if ($callback) {
			echo '<script>' . $callback . '(' . json_encode($info) . ')</script>';
		} else {
			// echo json_encode($info);
			// {"originalName":"487655527099084608.jpg","name":"14757547794679.jpg","url":"\/uploads\/20161006\/14757547794679.jpg","size":55516,"type":".jpg","state":"SUCCESS"}
			//插入数据库
			//判断是不是已经上传过类似图片
			$data         = [];
			$shafile      = $this->checksha('.' . $info['url']);
			$info['url']  = trim($shafile['path'], '.');
			$data['sha1'] = $shafile['sha1'];
			//保存文件信息到数据库
			$data['path']        = $info['url'];
			$data['thumbpath']   = $info['url'];
			$data['destname']    = $info['name'];
			$data['srcname']     = $info['originalName'];
			$data['create_time'] = time();
			$data['uid']         = UID;

			$result = \think\Db::name('Picture')
				->insert($data);
			if ($result) {
				//添加水印
				$this->markPic('.' . $info['url']);
			}
			$this->ajaxReturn($info);
		}
		exit();
	}
	/**
	 * 删除图片
	 * @return [type] [description]
	 */
	public function deleteImg() {
		$id = input('param.picture_id', '');
		//只能删除自己上传的图片
		$map['uid'] = UID;
		//图片id号删除
		if (is_numeric($id)) {
			//删除本地文件
			$map['picture_id'] = $id;
			$row               = \think\Db::name('Picture')
				->field('picture_id,path,thumbpath,sha1')
				->where($map)
				->find();

			if ($row) {
				//查找是不是有多个记录共用一个图片
				$row2 = \think\Db::name('Picture')
					->field('picture_id')
					->where('sha1', $row['sha1'])
					->find();

				//删除只有一个地方引用到的情况
				if (count($row2) == 1) {
					@unlink(realpath('.' . $row['path']));
					@unlink(realpath('.' . $row['thumbpath']));
				}
				$result = \think\Db::name('Picture')->delete($id);

				if ($result) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
			//如果传过来的是一个图片路径
		} else if (file_exists('.' . $id)) {
			//判断是不是文件路径
			//删除数据库中的图片记录
			// $result = M('Picture')->where("uid=" . UID . "  and (path='$id' or thumbpath='$id')  ")->delete();
			$result = \think\Db::name('Picture')
				->where(['uid' => UID])
				->whereOr(['path' => $id, 'thumbpath' => $id])
				->delete();
			if ($result) {@unlink($id);return true;}
		} else {
			//从字符串中取图片路径
			preg_match_all('/<img.*?src=[\'|\"]{1}(.*?)[\'|\"]{1}.*?>/', $id, $out, PREG_PATTERN_ORDER);
			foreach ($out[1] as $val) {
				$result = M('Picture')->where("uid=" . UID . "  and (path='$val' or thumbpath='$val')  ")->delete();
				$result = \think\Db::name('Picture')
					->where(['uid' => UID])
					->whereOr(['path' => $id, 'thumbpath' => $id])
					->delete();
				@unlink('.' . $val);
				//删除缩略图
				$thumbpath = str_replace('image', 'image/thumb', '.' . $val);
				@unlink($thumbpath);
			}
			return true;
		}
	}
}

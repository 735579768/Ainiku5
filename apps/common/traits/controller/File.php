<?php
namespace app\common\traits\controller;

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
				->select();
		} else {
			$data = \think\Db::name('File')
				->where('file_id', 'in', $id)
				->select();
		}
		$this->success('ok', '', $data);
	}
	private function checksha($filepath = '') {
		$fpath = $filepath;
		if (is_file($fpath) && file_exists($fpath)) {
			$sha1 = sha1_file($fpath);
			$list = \think\Db::name('Picture')
				->where(['sha1' => $sha1])
				->WhereOr(['re_sha1' => $sha1])
				->find();
			if (empty($list)) {
				return ['path' => $filepath, 'sha1' => $sha1];
			} else {
				//删除当前路径文件
				@unlink($fpath);
				return $list;
			}
		} else {
			return ['path' => $filepath, 'sha1' => ''];
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
		// $SITE_PATH  = SITE_PATH; //网站根目录
		$targetPath = '.' . config('file_upload.rootPath') . '/image/' . date('Ymd'); //保存图片的根目录
		$thumbPath  = str_replace('/image/', '/image/thumb/', $targetPath);
		$data       = array();
		if (!empty($_FILES)) {
			$maxSize = config('file_upload.maxSize');
			if ($_FILES['filelist']['size'] > $maxSize) {
				$return['info']   = '不支持此文件类型';
				$return['status'] = 0;
				return json($return);
			}
			$tempFile = $_FILES['filelist']['tmp_name'];
			//生成的文件名字
			// $extend   = explode(".", );
			// $va       = count($extend) - 1;
			$ext      = pathinfo(strtolower($_FILES['filelist']['name']), PATHINFO_EXTENSION);
			$filename = time() . mt_rand(10000, 99999) . "." . $ext;
			if (!create_folder($targetPath)) {
				$return['info']   = '创建目录错误：' . $targetPath;
				$return['status'] = 0;
				return json($return);
			}
			if (!create_folder($thumbPath)) {
				$return['info']   = '创建目录错误：' . $thumbPath;
				$return['status'] = 0;
				return json($return);
			}

			$targetPath .= '/' . $filename;
			$thumbPath .= '/' . $filename;

			// Validate the file type
			$fileTypes = config('file_upload.exts'); // File extensions

			if (in_array('.' . $ext, $fileTypes)) {
				$bl = move_uploaded_file($tempFile, $targetPath);

				// $thumbPath = str_replace('/image/', '/image/thumb/', $targetPath);
				if ($bl) {
					//判断是不是已经上传过类似图片
					$shafile = $this->checksha($targetPath);
					// dump($shafile);
					$targetPath   = $shafile['path'];
					$data['sha1'] = $shafile['sha1'];
					//如果是图片就生成缩略图
					// if ('.'.in_array($extend[$va], array('jpg', 'jpeg', 'gif', 'png', 'bmp'))) {
					//生成缩略图
					//缩略图路径
					$wh = explode('*', config('thumb_size'));
					$re = create_thumb($targetPath, $thumbPath, $wh[0], $wh[1]);
					if ($re !== true) {
						$thumbPath = trim($targetPath, '.');
					}

					// }
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
			$data['extra']       = 'uploadpic';

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
		return json(array_merge($return, $data));
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
		include __DIR__ . "/umeditor/Uploader.class.php";
		//上传配置
		$config = array(
			"savePath"   => '.' . config('file_upload.rootPath') . "/image/", //存储文件夹
			"maxSize"    => config('file_upload.maxSize'), //允许的文件最大尺寸，单位KB
			"allowFiles" => config('file_upload.exts'), //允许的文件格式
		);
		//上传文件目录
		$Path = '.' . config('file_upload.rootPath') . "/image/";

		//背景保存在临时目录中
		$config["savePath"] = $Path;
		$up                 = new \Uploader("upfile", $config);
		$type               = isset($_REQUEST['type']) ? $_REQUEST['type'] : '';
		$callback           = isset($_GET['callback']) ? $_GET['callback'] : '';

		$info = $up->getFileInfo();
		if ($info['url']) {
			// die($info['state']);
			$info['url'] = trim($info['url'], '.');
		}

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
			if ($info['url']) {
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
				$data['extra']       = 'umeditor';

				$result = \think\Db::name('Picture')
					->insert($data);
				if ($result) {
					//添加水印
					$this->markPic('.' . $info['url']);
				}
			}
			return json($info);
		}
		exit();
	}
	public function ueUpload() {
		$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents(__DIR__ . "/ueditor/config.json")), true);
		$conf   = [
			/* 上传大小限制，单位B */
			'imageMaxSize'           => config('file_upload.maxSize'), //单位是B
			/* 上传保存路径,可以自定义保存路径和文件名格式 */
			'imagePathFormat'        => config('file_upload.rootPath') . "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
			/* 涂鸦图片上传保存路径,可以自定义保存路径和文件名格式 */
			'scrawlPathFormat'       => config('file_upload.rootPath') . "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
			'snapscreenPathFormat'   => config('file_upload.rootPath') . "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
			/* 远程图片本地化上传保存路径,可以自定义保存路径和文件名格式 */
			'catcherPathFormat'      => config('file_upload.rootPath') . "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
			'videoPathFormat'        => config('file_upload.rootPath') . "/file/video/{yyyy}{mm}{dd}/{time}{rand:6}",
			'filePathFormat'         => config('file_upload.rootPath') . "/file/other/{yyyy}{mm}{dd}/{time}{rand:6}",
			'fileManagerListPath'    => config('file_upload.rootPath') . "/file/",
			'imageManagerListPath'   => config('file_upload.rootPath') . "/image/",
			'imageManagerAllowFiles' => config('file_upload.exts'),
			'catchRemoteImageEnable' => true, //编辑器远程图片本地化
		];
		// dump($CONFIG);
		// DIE(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents(__DIR__ . "/ueditor/config.json")));
		$CONFIG = array_merge($CONFIG, $conf);

		$action = input('param.action');

		switch ($action) {
		case 'config':
			$result = json_encode($CONFIG);
			break;

		/* 上传图片 */
		case 'uploadimage':
		/* 上传涂鸦 */
		case 'uploadscrawl':
		/* 上传视频 */
		case 'uploadvideo':
		/* 上传文件 */
		case 'uploadfile':
			$result = include __DIR__ . "/ueditor/action_upload.php";
			break;

		/* 列出图片 */
		case 'listimage':
			$result = include __DIR__ . "/ueditor/action_list.php";
			break;
		/* 列出文件 */
		case 'listfile':
			$result = include __DIR__ . "/ueditor/action_list.php";
			break;

		/* 抓取远程文件 */
		case 'catchimage':
			$result = include __DIR__ . "/ueditor/action_crawler.php";
			break;

		default:
			$result = json_encode(array(
				'state' => '请求地址出错',
			));
			break;
		}

		/* 输出结果 */
		if (isset($_GET["callback"])) {
			if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
				echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
			} else {
				echo json_encode(array(
					'state' => 'callback参数不合法',
				));
			}
		} else {
			// dump($result);
			//保存到数据库
			$result = json_decode($result, true);
			//判断是不是已经上传过类似图片
			if (isset($result['url'])) {
				$shafile       = $this->checksha('.' . $result['url']);
				$result['url'] = trim($shafile['path'], '.');
			}

			if (isset($result['url'])) {
				if ($action == 'uploadimage') {
					$data = [
						'sha1'        => $shafile['sha1'],
						'srcname'     => $result['original'],
						'destname'    => $result['title'],
						'path'        => $result['url'],
						'thumbpath'   => $result['url'],
						'create_time' => time(),
						// 'from'        => 'ueditor',
						'uid'         => UID,
					];

					$res = \think\Db::name('Picture')
						->insert($data);
					if ($res) {
						$this->markpic('.' . $result['url']);
					}

				} else {
					//把附件信息保存到数据库
					$data = [
						'path'        => $result['url'],
						'destname'    => $result['title'],
						'srcname'     => $result['original'],
						'size'        => $result['size'],
						'create_time' => time(),
						'uid'         => UID,
					];
					$res = \think\Db::name('File')
						->insert($data);
					if (!$res) {
						\Think\Log::record('ue编辑器把附件信息写到数据库时出错');

					}
				}
			} elseif ($action == 'catchimage') {
				//抓取远程图片
				foreach ($result['list'] as $key => $value) {
					if (!isset($value['url']) || !$value['url']) {
						continue;
					}
					$shafile      = $this->checksha('.' . $value['url']);
					$value['url'] = trim($shafile['path'], '.');
					$data         = [
						'sha1'        => $shafile['sha1'],
						'srcname'     => $value['original'],
						'destname'    => $value['title'],
						'path'        => $value['url'],
						'thumbpath'   => $value['url'],
						'create_time' => time(),
						'extra'       => 'ueditor',
						'uid'         => UID,
					];

					$res = \think\Db::name('Picture')
						->insert($data);
					if ($res) {
						$this->markpic('.' . $value['url']);
					}
				}
			}
			return json($result);
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

<?php
namespace app\common\controller;

trait File {
	/**
	 * 图片初始化显示获取信息
	 * @return [type] [description]
	 */
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
				->insert($data);
			if ($result) {
				//添加水印
				$this->markpic($thumbPath);
				$this->markpic($targetPath);
				$return['id'] = $result;
			}
		}

		/* 返回JSON数据 */
		$this->ajaxReturn(array_merge($return, $data));
	}
	//图片添加水印
	private function markpic($dst = '') {
		//取水印图片
		$src       = realpath('.' . get_picture(config('shuiyin_image')));
		$shuiyinon = config('shuiyin_on');
		if ($shuiyinon == '1' && $dst !== false && $src !== false) {
			image_water($dst, $src, $dst);
		} else if ($shuiyinon == '2' && $dst !== false && $src !== false) {
			image_water($dst, '', $dst, config('shuiyin_text'));
		}
	}
	/**
	 * 编辑器上传图片
	 */
	public function ueUpload() {
		// die('run');
		$s_dir  = '.' . STATIC_DIR;
		$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($s_dir . "/ueditor/php/config.json")), true);
		//"imagePathFormat": "/uploads/image/{yyyy}{mm}{dd}/{time}{rand:6}",
		$CONFIG['imagePathFormat']      = "/uploads/image/{yyyy}{mm}{dd}/{time}{rand:6}";
		$CONFIG['scrawlPathFormat']     = "/uploads/image/{yyyy}{mm}{dd}/{time}{rand:6}";
		$CONFIG['snapscreenPathFormat'] = "/uploads/image/{yyyy}{mm}{dd}/{time}{rand:6}";
		$CONFIG['catcherPathFormat']    = "/uploads/image/{yyyy}{mm}{dd}/{time}{rand:6}";
		$CONFIG['videoPathFormat']      = "/uploads/file/video/{yyyy}{mm}{dd}/{time}{rand:6}";
		$CONFIG['filePathFormat']       = "/uploads/file/other/{yyyy}{mm}{dd}/{time}{rand:6}";
		$CONFIG['fileManagerListPath']  = "/uploads/file/"; /* 指定要列出文件的目录 */
		$CONFIG['imageManagerListPath'] = "/uploads/image/"; /* 指定要列出图片的目录 */
		$action                         = $_GET['action'];

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
			$result = include $s_dir . "/ueditor/php/action_upload.php";
			break;

		/* 列出图片 */
		case 'listimage':
			$result = include $s_dir . "/ueditor/php/action_list.php";
			break;
		/* 列出文件 */
		case 'listfile':
			$result = include $s_dir . "/ueditor/php/action_list.php";
			break;

		/* 抓取远程文件 */
		case 'catchimage':
			$result = include $s_dir . "/ueditor/php/action_crawler.php";
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

			//保存到数据库
			$result = json_decode($result, true);
			//判断是不是已经上传过类似图片
			$shafile       = $this->checksha('.' . $result['url']);
			$result['url'] = $shafile['path'];
			echo json_encode($result);
			if ($result['url']) {
				if ($action == 'uploadimage') {
					$thumbPath = str_replace("/uploads/image/", "/uploads/image/thumb/", $result['url']);
					// $JDthumb = path_a($thumb);
					create_folder(dirname($thumbPath));
					//生成缩略图
					$srcpath   = '.' . $result['url'];
					$srcpath   = str_replace('\\', '/', $srcpath);
					$wh        = explode('*', config('thumb_size'));
					$re        = create_thumb($srcpath, $thumbPath, $wh[0], $wh[1]);
					$thumbPath = file_exists($thumbPath) ? $thumbPath : $result['url'];
					$thumbPath = trim($thumbPath, '.');
					$data      = [
						'sha1'        => $shafile['sha1'],
						'srcname'     => $result['original'],
						'destname'    => $result['title'],
						'path'        => $result['url'],
						'thumbpath'   => $thumbPath,
						'create_time' => time(),
						'from'        => 'ueditor',
						'uid'         => UID,
					];
					$result = \think\Db::name('Picture')
						->insert($data);
					if ($result) {
						//添加水印
						$this->markpic($JDthumb);
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
						'update_time' => time(),
						'uid'         => UID,
					];
					$result = \think\Db::name('File')
						->insert($data);
					if (!$result) {
						\Think\Log::write('ue编辑器把附件信息写到数据库时出错');
					}
				}
			}
		}
		exit();
	}
	/**
	 * um编辑器上传图片
	 */
	public function umUpload() {
		include SITE_PATH . "/public/static/umeditor/php/Uploader.class.php";
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
				$this->markpic('.' . $info['url']);
			}
			$this->ajaxReturn($info);
		}
		exit();
	}
}

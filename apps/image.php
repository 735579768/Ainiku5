<?php
/**
 * 给图片添加水印
 * @param  string $src_img    要添加水印的图片路径
 * @param  string $water_img  水印图片路径
 * @param  string $dest_img   添加好水印后的图片路径
 * @param  string $water_text 文字水印
 * @param  string $pos        水印位置
 * @return [type]             返回 boolean类型,成功返回true,失败返回字符串
 */
function image_water($src_img = '', $water_img = '', $dest_img = '', $water_text = '', $pos = '') {
	$isshuiyin = intval(config('shuiyin_on'));
	if ($isshuiyin == 0) {
		return true;
	}
	if (!is_file($src_img)) {
		return '不是文件类型';
	}
	if (!file_exists($src_img)) {
		return '文件不存在';
	}
	//创建目录
	create_folder(dirname($dest_img));
	empty($pos) && ($pos = config('shuiyin_pos'));
	switch ($pos) {
	case 'top_left':
		$pos = 1;
		break;

	case 'top_center':
		$pos = 2;
		break;

	case 'top_right':
		$pos = 3;
		break;

	case 'left_center':
		$pos = 4;
		break;

	case 'center_center':
		$pos = 5;
		break;

	case 'right_center':
		$pos = 6;
		break;

	case 'bottom_left':
		$pos = 7;
		break;

	case 'bottom_center':
		$pos = 8;
		break;

	case 'bottom_right':
		$pos = 9;
		break;

	default:
		$pos = 1;
	}

	$result  = false;
	$imgobj  = \ankimage\Image::open($src_img);
	$minsize = config('shuiyin_minsize');
	if ($minsize != '0') {
		list($tw, $th) = explode('*', $minsize);
		// 返回图片的宽度
		$width = $imgobj->width();
		// 返回图片的高度
		$height = $imgobj->height();
		// // 返回图片的类型
		// $type = $imgobj->type();
		// // 返回图片的mime类型
		// $mime = $imgobj->mime();
		// // 返回图片的尺寸数组 0 图片宽度 1 图片高度
		// $size = $imgobj->size();
		if ($width < intval($tw) || $height < intval($th)) {
			//宽高任意一个小于预定大小不添加水印
			return true;
		}
	}

	if (empty($water_text)) {
		if (!file_exists($water_img)) {
			return '水印图片文件不存在';
		}
		$result = $imgobj->water($water_img, $pos, 80)->save($dest_img);
	} else {
		//文字水印
		$color = config('shuiyin_text_color');

		empty($color) && ($color = '#000000');
		$color = '#' . trim($color, '#');
		// $color     = hex_torgb($color);
		$font_size = intval(config('shuiyin_text_size'));
		//使用验证码的随机字体
		$fontpath = 'c:/windows/fonts/msyh.ttf';
		// $ttfPath  = SITE_PATH . '/vendor/extend/verify/' . (false ? 'zhttfs' : 'ttfs') . '/';

		// $dir  = dir($ttfPath);
		// $ttfs = array();
		// while (false !== ($file = $dir->read())) {
		// 	if ($file[0] != '.' && (substr($file, -4) == '.ttf' || substr($file, -4) == '.ttf')) {
		// 		$ttfs[] = $file;
		// 	}
		// }
		// $dir->close();
		// $fontpath = $ttfs[array_rand($ttfs)];
		// $fontpath = $ttfPath . $fontpath;

		$result = $imgobj->text($water_text, $fontpath, $font_size, $color, $pos)->save($dest_img);

	}
	if ($result) {
		return true;
	} else {
		return '未知错误';
	}
}
/**
 * 生成缩略图
 * @param  [type]  $src_img [源图片]
 * @param  [type]  $dst_img [缩略图路径]
 * @param  integer $width   [缩略图宽]
 * @param  integer $height  [缩略图高]
 * @return [type]           [返回图片对象]
 */
function create_thumb($src_img, $dst_img, $width = 75, $height = 75) {
	if (!is_file($src_img)) {
		return '不是文件类型';
	}
	if (!file_exists($src_img)) {
		return '文件不存在';
	}
	//创建目录
	create_folder(dirname($dst_img));
	$image = \ankimage\Image::open($src_img);
	// $src_w = $image->width(); // 返回图片的宽度
	// $src_h = $image->height(); // 返回图片的高度
	// $type  = $image->type(); // 返回图片的类型
	// $mime  = $image->mime(); // 返回图片的mime类型
	// $size  = $image->size(); // 返回图片的尺寸数组 0 图片宽度 1 图片高度

	//IMAGE_THUMB_SCALE     =   1 ; //等比例缩放类型 默认
	// IMAGE_THUMB_FILLED    =   2 ; //缩放后填充类型
	// IMAGE_THUMB_CENTER    =   3 ; //居中裁剪类型
	// IMAGE_THUMB_NORTHWEST =   4 ; //左上角裁剪类型
	// IMAGE_THUMB_SOUTHEAST =   5 ; //右下角裁剪类型
	// IMAGE_THUMB_FIXED     =   6 ; //固定尺寸缩放类型
	$model  = config('thumb_model');
	$result = null;
	switch ($model) {
	case '1':
		//等 比例缩放
		$result = $image->thumb($width, $height)->save($dst_img);
		break;
	case '2':
		//缩放填充
		$result = $image->thumb($width, $height, \ankimage\Image::THUMB_FILLED)->save($dst_img);

		break;
	case '3':
		//居中剪切
		$result = $image->thumb($width, $height, \ankimage\Image::THUMB_CENTER)->save($dst_img);

		break;
	case '4':
		//左上剪切
		$result = $image->thumb($width, $height, \ankimage\Image::THUMB_NORTHWEST)->save($dst_img);

		break;
	case '5':
		//右下角裁剪类型
		$result = $image->thumb($width, $height, \ankimage\Image::THUMB_SOUTHEAST)->save($dst_img);

		break;
	case '6':
		//固定大小
		$result = $image->thumb($width, $height, \ankimage\Image::THUMB_FIXED)->save($dst_img);
		break;

	default:
		//等 比例缩放
		$result = $image->thumb($width, $height)->save($dst_img);
		break;
	}

	if ($result) {
		return true;
	} else {
		return '未知错误';
	}
}

/**
 * 生成二维码图片
 * @param  integer $size    二维码大小
 * @param  string  $content 二维码内容
 * @param  string  $logo    二维码logo图片
 * @return [type]           [description]
 */
function create_qrcode($content = '', $size = 100, $logo = '') {
	$size || ($size = 100);
	if (!$content) {
		return false;
	}
	$errorCorrectionLevel = 'H'; //容错级别L(7%)M(15%)Q(25%)H(30%)
	$imgsize              = $size; //图片的大小(像素)
	$matrixPointSize      = $imgsize / 32.89973996; //生成图片大小

	$back_color = 0xFFFFFF;
	$fore_color = 0x000000;
	if (!$logo) {
		header('Content-type: image/png');
		\ank\QRcode::png($content, false, $errorCorrectionLevel, $matrixPointSize, 2, false, $back_color, $fore_color);
	} else {
		//生成二维码图片路径
		$filename = './data/cache/erweima/qrcode.png';
		create_folder(dirname($filename));
		\ank\QRcode::png($content, $filename, $errorCorrectionLevel, $matrixPointSize, 2, false, $back_color, $fore_color);
		// $QR     = $filename; //已经生成的原始二维码图

		//添加圆角图片
		$yjpath   = EXTEND_PATH . '/ank/yjx.png'; //圆角图片
		$qrcode   = \ankimage\Image::open($filename);
		$yuanjiao = \ankimage\Image::open($yjpath);
		$logoObj  = \ankimage\Image::open($logo);
		$qr_w     = $qrcode->width();
		$qr_h     = $qrcode->height();
		$yj_w     = $yuanjiao->width();
		$yj_h     = $yuanjiao->height();

		if ($qr_h / 3 < $yj_w) {
			$yj_w  = $qr_h / 3;
			$yj_h  = $qr_h / 3;
			$yjobj = $yuanjiao->thumb($yj_w, $yj_h, 3)->getImage();
			$qrcode->water($yjobj, 5);
		} else {
			$qrcode->water($yjpath, 5);
		}
		$lobj = $logoObj->thumb($yj_w - 10, $yj_h - 10, 3)->radius(10)->getImage(); //->save($logo_tem);
		$qr   = $qrcode->water($lobj, 5)->getImage();
		header('Content-type: image/png');
		imagepng($qr);
		imagedestroy($qr);
	}
	die();
}

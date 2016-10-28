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
		// $color     = hex_torgb($color);
		$font_size = intval(config('shuiyin_text_size'));
		//使用验证码的随机字体
		$fontpath = '';
		$ttfPath  = SITE_PATH . '/vendor/extend/verify/' . (false ? 'zhttfs' : 'ttfs') . '/';

		$dir  = dir($ttfPath);
		$ttfs = array();
		while (false !== ($file = $dir->read())) {
			if ($file[0] != '.' && (substr($file, -4) == '.ttf' || substr($file, -4) == '.ttf')) {
				$ttfs[] = $file;
			}
		}
		$dir->close();
		$fontpath = $ttfs[array_rand($ttfs)];
		$fontpath = $ttfPath . $fontpath;

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
		$qr_w     = $qrcode->width();
		$qr_h     = $qrcode->height();
		$yj_w     = $yuanjiao->width();
		$yj_h     = $yuanjiao->height();

		if ($qr_h / 3 < $yj_w) {
			$yj_w       = $qr_h / 3;
			$yj_h       = $qr_h / 3;
			$yjpath_tem = './data/cache/erweima/yj.png';
			$yuanjiao->thumb($yj_w, $yj_h, 3)->save($yjpath_tem);
			$qrcode->water($yjpath_tem, 5)->save($filename);
		} else {
			$qrcode->water($yjpath, 5)->save($filename);
		}

		//重新打开二维码图在中间添加logo
		$qrcode = \ankimage\Image::open($filename);
		//裁剪logo
		$logoObj  = \ankimage\Image::open($logo);
		$logo_tem = './data/cache/erweima/logo.png';
		$logoObj->thumb($yj_w - 15, $yj_h - 15, 3)->save($logo_tem);
		$qrcode->water($logo_tem, 5)->save($filename);

		// imagecopyresampled($QR, $logo, $from_width, $from_height, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);
		header('Content-type: image/png');
		$qr = imagecreatefrompng($filename);
		imagepng($qr);
		imagedestroy($qr);
	}
	die();
}

/**
 * 把图片处理成圆角
 * $filename 图片路径
 * $radius = 5; //圆角的像素，值越大越圆
 */
function imgradius($filename = './Plugins/Erweima/logo.jpg', $radius = 10) {
	$img = null;
	if (is_string($filename)) {
		$img = imagecreatefromjpeg($filename);
	} else {
		$img = $filename;
	}

	$ww = imagesx($img);
	$hh = imagesy($img);

	//整个图,也就是白色背景
	$im      = imagecreatetruecolor($ww, $hh);
	$bgcolor = imagecolorallocate($im, 255, 255, 255);
	imagefill($im, 0, 0, $bgcolor);

	//这里调用函数，绘制淡色的圆角背景，
	$im = imagebackgroundmycard($im, 0, 0, $ww, $hh, $radius);

	//$filename = 'E:\wwwroot\ainiku\Plugins\Erweima\logo.jpg';

	//第一个参数是上面已经用过的大的背景图，也就我们的画板，
	//第二个参数：上面这个目录拿到的capy用的资源文件了
	//第三个单数距离大卡片左边的距离
	//第三个单数距离大卡片上边的距离
	//第三第四是资源图片开始拷贝的位置，这里我是从左上角开始copy的，所以是0和0；
	//第五第六个参数是图片拷过去的大小
	imagecopy($im, $img, 0, 0, 0, 0, $ww, $hh);

	//画圆角
	$lt_corner = get_lt_rounder_corner($radius, 0xef, 0xef, 0xe1);
	//圆角的背景色
	$im = myradus($im, 0, 0, $lt_corner, $radius, $ww, $hh);

	//生成图片
	/*imagepng($im, "test.png");
		imagedestroy($im);*/
	return $im;
}

/**
 * 画一个带圆角的背景图
 * @param $im  底图
 * @param $dst_x 画出的图的（0，0）位于底图的x轴位置
 * @param $dst_y 画出的图的（0，0）位于底图的y轴位置
 * @param $image_w 画的图的宽
 * @param $image_h 画的图的高
 * @param $radius 圆角的值
 */
function imagebackgroundmycard($im, $dst_x, $dst_y, $image_w, $image_h, $radius) {
	$resource = imagecreatetruecolor($image_w, $image_h);
	$bgcolor  = imagecolorallocate($resource, 0xef, 0xef, 0xe1); //该图的背景色

	imagefill($resource, 0, 0, $bgcolor);
	$lt_corner = get_lt_rounder_corner($radius, 255, 255, 255); //圆角的背景色

	// lt(左上角)
	imagecopymerge($resource, $lt_corner, 0, 0, 0, 0, $radius, $radius, 100);
	// lb(左下角)
	$lb_corner = imagerotate($lt_corner, 90, 0);
	imagecopymerge($resource, $lb_corner, 0, $image_h - $radius, 0, 0, $radius, $radius, 100);
	// rb(右上角)
	$rb_corner = imagerotate($lt_corner, 180, 0);
	imagecopymerge($resource, $rb_corner, $image_w - $radius, $image_h - $radius, 0, 0, $radius, $radius, 100);
	// rt(右下角)
	$rt_corner = imagerotate($lt_corner, 270, 0);
	imagecopymerge($resource, $rt_corner, $image_w - $radius, 0, 0, 0, $radius, $radius, 100);

	imagecopy($im, $resource, $dst_x, $dst_y, 0, 0, $image_w, $image_h);
	return $im;
}
/**
 * @param $im  大的背景图，也是我们的画板
 * @param $lt_corner 我们画的圆角
 * @param $radius  圆角的程度
 * @param $image_h 图片的高
 * @param $image_w 图片的宽
 */
function myradus($im, $lift, $top, $lt_corner, $radius, $image_h, $image_w) {
	/// lt(左上角)
	imagecopymerge($im, $lt_corner, $lift, $top, 0, 0, $radius, $radius, 100);
	// lb(左下角)
	$lb_corner = imagerotate($lt_corner, 90, 0);
	imagecopymerge($im, $lb_corner, $lift, $image_h - $radius + $top, 0, 0, $radius, $radius, 100);
	// rb(右上角)
	$rb_corner = imagerotate($lt_corner, 180, 0);
	imagecopymerge($im, $rb_corner, $image_w + $lift - $radius, $image_h + $top - $radius, 0, 0, $radius, $radius, 100);
	// rt(右下角)
	$rt_corner = imagerotate($lt_corner, 270, 0);
	imagecopymerge($im, $rt_corner, $image_w - $radius + $lift, $top, 0, 0, $radius, $radius, 100);
	return $im;
}

/** 画圆角
 * @param $radius 圆角位置
 * @param $color_r 色值0-255
 * @param $color_g 色值0-255
 * @param $color_b 色值0-255
 * @return resource 返回圆角
 */
function get_lt_rounder_corner($radius, $color_r, $color_g, $color_b) {
	// 创建一个正方形的图像
	$img = imagecreatetruecolor($radius, $radius);
	// 图像的背景
	$bgcolor = imagecolorallocate($img, $color_r, $color_g, $color_b);
	$fgcolor = imagecolorallocate($img, 0, 0, 0);
	imagefill($img, 0, 0, $bgcolor);
	// $radius,$radius：以图像的右下角开始画弧
	// $radius*2, $radius*2：已宽度、高度画弧
	// 180, 270：指定了角度的起始和结束点
	// fgcolor：指定颜色
	imagefilledarc($img, $radius, $radius, $radius * 2, $radius * 2, 180, 270, $fgcolor, IMG_ARC_PIE);
	// 将弧角图片的颜色设置为透明
	imagecolortransparent($img, $fgcolor);
	return $img;
}
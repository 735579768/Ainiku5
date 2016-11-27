<?php
/**
 * 判断当前是否登陆
 * @return boolean [description]
 */
function is_login() {
	$user = session('user_auth');
	if (empty($user)) {
		return 0;
	} else {
		return session('user_auth_sign') == data_auth_sign($user) ? $user['uid'] : 0;
	}
}
/**
 * 数据签名认证
 * @param  array  $data 被认证的数据
 * @return string       签名
 * @author 寞枫 <735579768@qq.com>
 */
function data_auth_sign($data) {
	//数据类型检测
	if (!is_array($data)) {
		$data = (array) $data;
	}
	ksort($data); //排序
	$code = http_build_query($data); //url编码并生成query字符串
	$sign = sha1($code); //生成签名
	return $sign;
}
/**
 * 返回一个图片验证码
 * @param  boolean $imgtag 是否直接返回一个图片标签
 * @return [type]          [description]
 */
function get_verify($imgtag = true) {
	$uri  = url('verify');
	$veri = '<img id="verifyimgtag" src="' . $uri . '" onclick="this.src=this.src.replace(/\?r.*/,\'\')+\'?r=\'+Math.random();" alt="点击更换验证码" />';
	return $imgtag ? $veri : $uri;
}
/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 寞枫 <735579768@.qq.com>
 */
function check_verify($code, $id = 1) {
	$v = new \verify\Verify();
	return $v->check($code, $id);
}
/**
 * 时间戳格式化
 * @param int $time
 * @return string 完整的时间显示
 * @author huajie <banhuajie@163.com>
 */
function time_format($time = NULL, $format = 'Y-m-d H:i:s') {
	if (preg_match('/\d{1,4}[^\d]+\d{1,2}[^\d]+\d{1,2}(\s+\d{1,2}[^\d]+\d{1,2}[^\d]+\d{1,2})?/', $time)) {
		return $time;
	} else {
		$time = $time === NULL ? time() : intval($time);
		return date($format, $time);
	}
}
/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param boolean $adv 是否进行高级模式获取（有可能被伪装）
 * @return mixed
 */
function get_client_ip($type = false, $adv = true) {
	$type      = $type ? 1 : 0;
	$type      = 0;
	static $ip = NULL;
	if ($ip !== NULL) {
		return $ip[$type];
	}

	if ($adv) {
		if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
			$pos = array_search('unknown', $arr);
			if (false !== $pos) {
				unset($arr[$pos]);
			}

			$ip = trim($arr[0]);
		} elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		} elseif (isset($_SERVER['REMOTE_ADDR'])) {
			$ip = $_SERVER['REMOTE_ADDR'];
		}
	} elseif (isset($_SERVER['REMOTE_ADDR'])) {
		$ip = $_SERVER['REMOTE_ADDR'];
	}
	// IP地址合法验证
	$long = sprintf("%u", ip2long($ip));
	$ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
	return $ip[$type];
}
/**
 *汉字转拼音
 **/
function Pinyin($_String, $_Code = 'UTF8') {
	//GBK页面可改为gb2312，其他随意填写为UTF8
	$_DataKey = "a|ai|an|ang|ao|ba|bai|ban|bang|bao|bei|ben|beng|bi|bian|biao|bie|bin|bing|bo|bu|ca|cai|can|cang|cao|ce|ceng|cha" . "|chai|chan|chang|chao|che|chen|cheng|chi|chong|chou|chu|chuai|chuan|chuang|chui|chun|chuo|ci|cong|cou|cu|" .
		"cuan|cui|cun|cuo|da|dai|dan|dang|dao|de|deng|di|dian|diao|die|ding|diu|dong|dou|du|duan|dui|dun|duo|e|en|er" .
		"|fa|fan|fang|fei|fen|feng|fo|fou|fu|ga|gai|gan|gang|gao|ge|gei|gen|geng|gong|gou|gu|gua|guai|guan|guang|gui" .
		"|gun|guo|ha|hai|han|hang|hao|he|hei|hen|heng|hong|hou|hu|hua|huai|huan|huang|hui|hun|huo|ji|jia|jian|jiang" .
		"|jiao|jie|jin|jing|jiong|jiu|ju|juan|jue|jun|ka|kai|kan|kang|kao|ke|ken|keng|kong|kou|ku|kua|kuai|kuan|kuang" .
		"|kui|kun|kuo|la|lai|lan|lang|lao|le|lei|leng|li|lia|lian|liang|liao|lie|lin|ling|liu|long|lou|lu|lv|luan|lue" .
		"|lun|luo|ma|mai|man|mang|mao|me|mei|men|meng|mi|mian|miao|mie|min|ming|miu|mo|mou|mu|na|nai|nan|nang|nao|ne" .
		"|nei|nen|neng|ni|nian|niang|niao|nie|nin|ning|niu|nong|nu|nv|nuan|nue|nuo|o|ou|pa|pai|pan|pang|pao|pei|pen" .
		"|peng|pi|pian|piao|pie|pin|ping|po|pu|qi|qia|qian|qiang|qiao|qie|qin|qing|qiong|qiu|qu|quan|que|qun|ran|rang" .
		"|rao|re|ren|reng|ri|rong|rou|ru|ruan|rui|run|ruo|sa|sai|san|sang|sao|se|sen|seng|sha|shai|shan|shang|shao|" .
		"she|shen|sheng|shi|shou|shu|shua|shuai|shuan|shuang|shui|shun|shuo|si|song|sou|su|suan|sui|sun|suo|ta|tai|" .
		"tan|tang|tao|te|teng|ti|tian|tiao|tie|ting|tong|tou|tu|tuan|tui|tun|tuo|wa|wai|wan|wang|wei|wen|weng|wo|wu" .
		"|xi|xia|xian|xiang|xiao|xie|xin|xing|xiong|xiu|xu|xuan|xue|xun|ya|yan|yang|yao|ye|yi|yin|ying|yo|yong|you" .
		"|yu|yuan|yue|yun|za|zai|zan|zang|zao|ze|zei|zen|zeng|zha|zhai|zhan|zhang|zhao|zhe|zhen|zheng|zhi|zhong|" .
		"zhou|zhu|zhua|zhuai|zhuan|zhuang|zhui|zhun|zhuo|zi|zong|zou|zu|zuan|zui|zun|zuo";
	$_DataValue = "-20319|-20317|-20304|-20295|-20292|-20283|-20265|-20257|-20242|-20230|-20051|-20036|-20032|-20026|-20002|-19990" .
		"|-19986|-19982|-19976|-19805|-19784|-19775|-19774|-19763|-19756|-19751|-19746|-19741|-19739|-19728|-19725" .
		"|-19715|-19540|-19531|-19525|-19515|-19500|-19484|-19479|-19467|-19289|-19288|-19281|-19275|-19270|-19263" .
		"|-19261|-19249|-19243|-19242|-19238|-19235|-19227|-19224|-19218|-19212|-19038|-19023|-19018|-19006|-19003" .
		"|-18996|-18977|-18961|-18952|-18783|-18774|-18773|-18763|-18756|-18741|-18735|-18731|-18722|-18710|-18697" .
		"|-18696|-18526|-18518|-18501|-18490|-18478|-18463|-18448|-18447|-18446|-18239|-18237|-18231|-18220|-18211" .
		"|-18201|-18184|-18183|-18181|-18012|-17997|-17988|-17970|-17964|-17961|-17950|-17947|-17931|-17928|-17922" .
		"|-17759|-17752|-17733|-17730|-17721|-17703|-17701|-17697|-17692|-17683|-17676|-17496|-17487|-17482|-17468" .
		"|-17454|-17433|-17427|-17417|-17202|-17185|-16983|-16970|-16942|-16915|-16733|-16708|-16706|-16689|-16664" .
		"|-16657|-16647|-16474|-16470|-16465|-16459|-16452|-16448|-16433|-16429|-16427|-16423|-16419|-16412|-16407" .
		"|-16403|-16401|-16393|-16220|-16216|-16212|-16205|-16202|-16187|-16180|-16171|-16169|-16158|-16155|-15959" .
		"|-15958|-15944|-15933|-15920|-15915|-15903|-15889|-15878|-15707|-15701|-15681|-15667|-15661|-15659|-15652" .
		"|-15640|-15631|-15625|-15454|-15448|-15436|-15435|-15419|-15416|-15408|-15394|-15385|-15377|-15375|-15369" .
		"|-15363|-15362|-15183|-15180|-15165|-15158|-15153|-15150|-15149|-15144|-15143|-15141|-15140|-15139|-15128" .
		"|-15121|-15119|-15117|-15110|-15109|-14941|-14937|-14933|-14930|-14929|-14928|-14926|-14922|-14921|-14914" .
		"|-14908|-14902|-14894|-14889|-14882|-14873|-14871|-14857|-14678|-14674|-14670|-14668|-14663|-14654|-14645" .
		"|-14630|-14594|-14429|-14407|-14399|-14384|-14379|-14368|-14355|-14353|-14345|-14170|-14159|-14151|-14149" .
		"|-14145|-14140|-14137|-14135|-14125|-14123|-14122|-14112|-14109|-14099|-14097|-14094|-14092|-14090|-14087" .
		"|-14083|-13917|-13914|-13910|-13907|-13906|-13905|-13896|-13894|-13878|-13870|-13859|-13847|-13831|-13658" .
		"|-13611|-13601|-13406|-13404|-13400|-13398|-13395|-13391|-13387|-13383|-13367|-13359|-13356|-13343|-13340" .
		"|-13329|-13326|-13318|-13147|-13138|-13120|-13107|-13096|-13095|-13091|-13076|-13068|-13063|-13060|-12888" .
		"|-12875|-12871|-12860|-12858|-12852|-12849|-12838|-12831|-12829|-12812|-12802|-12607|-12597|-12594|-12585" .
		"|-12556|-12359|-12346|-12320|-12300|-12120|-12099|-12089|-12074|-12067|-12058|-12039|-11867|-11861|-11847" .
		"|-11831|-11798|-11781|-11604|-11589|-11536|-11358|-11340|-11339|-11324|-11303|-11097|-11077|-11067|-11055" .
		"|-11052|-11045|-11041|-11038|-11024|-11020|-11019|-11018|-11014|-10838|-10832|-10815|-10800|-10790|-10780" .
		"|-10764|-10587|-10544|-10533|-10519|-10331|-10329|-10328|-10322|-10315|-10309|-10307|-10296|-10281|-10274" .
		"|-10270|-10262|-10260|-10256|-10254";
	$_TDataKey   = explode('|', $_DataKey);
	$_TDataValue = explode('|', $_DataValue);
	$_Data       = array_combine($_TDataKey, $_TDataValue);
	arsort($_Data);
	reset($_Data);
	if ($_Code != 'gb2312') {
		$_String = _U2_Utf8_Gb($_String);
	}

	$_Res = '';
	for ($i = 0; $i < strlen($_String); $i++) {
		$_P = ord(substr($_String, $i, 1));
		if ($_P > 160) {
			$_Q = ord(substr($_String, ++$i, 1));
			$_P = $_P * 256 + $_Q - 65536;
		}
		$_Res .= _Pinyin($_P, $_Data);
	}
	return preg_replace("/[^a-z0-9]*/", '', $_Res);
}
function _Pinyin($_Num, $_Data) {
	if ($_Num > 0 && $_Num < 160) {
		return chr($_Num);
	} elseif ($_Num < -20319 || $_Num > -10247) {
		return '';
	} else {
		foreach ($_Data as $k => $v) {
			if ($v <= $_Num) {
				break;
			}
		}
		return $k;
	}
}
function _U2_Utf8_Gb($_C) {
	$_String = '';
	if ($_C < 0x80) {
		$_String .= $_C;
	} elseif ($_C < 0x800) {
		$_String .= chr(0xC0 | $_C >> 6);
		$_String .= chr(0x80 | $_C & 0x3F);
	} elseif ($_C < 0x10000) {
		$_String .= chr(0xE0 | $_C >> 12);
		$_String .= chr(0x80 | $_C >> 6 & 0x3F);
		$_String .= chr(0x80 | $_C & 0x3F);
	} elseif ($_C < 0x200000) {
		$_String .= chr(0xF0 | $_C >> 18);
		$_String .= chr(0x80 | $_C >> 12 & 0x3F);
		$_String .= chr(0x80 | $_C >> 6 & 0x3F);
		$_String .= chr(0x80 | $_C & 0x3F);
	}
	return iconv('UTF-8', 'GB2312', $_String);
}
/**
 *判断是不是蜘蛛访问
 */
function get_naps_bot() {
	$spider    = 'googlebot,360spider,haosouspider,baiduspider,msnbot,slurp,sosospider,sogou spider,yodaobot';
	$restr     = false;
	$useragent = strtolower($_SERVER['HTTP_USER_AGENT']);
	if (strpos($useragent, 'googlebot') !== false) {
		$restr = 'google';
	}
	if (strpos($useragent, '360Spider') !== false || strpos($useragent, 'haosouspider') !== false) {
		$restr = '360';
	}
	if (strpos($useragent, 'baiduspider') !== false) {
		$restr = 'baidu';
	}
	if (strpos($useragent, 'msnbot') !== false) {
		$restr = 'bing';
	}
	if (strpos($useragent, 'slurp') !== false) {
		$restr = 'yahoo';
	}
	if (strpos($useragent, 'sosospider') !== false) {
		$restr = 'soso';
	}
	if (strpos($useragent, 'sogou spider') !== false) {
		$restr = 'sogou';
	}
	if (strpos($useragent, 'yodaobot') !== false) {
		$restr = 'yodao';
	}
	return $restr;

}
/**
 * 十六进制颜色值转成rgb
 * @param  [type] $hex [description]
 * @return [type]      [description]
 */
function hex_torgb($hex) {
	$hex = str_replace("#", "", $hex);

	if (strlen($hex) == 3) {
		$r = hexdec(substr($hex, 0, 1) . substr($hex, 0, 1));
		$g = hexdec(substr($hex, 1, 1) . substr($hex, 1, 1));
		$b = hexdec(substr($hex, 2, 1) . substr($hex, 2, 1));
	} else {
		$r = hexdec(substr($hex, 0, 2));
		$g = hexdec(substr($hex, 2, 2));
		$b = hexdec(substr($hex, 4, 2));
	}

	return array($r, $g, $b);
}
/**
 * rgb颜色值转十六进制
 * @param  [type] $rgb [description]
 * @return [type]      [description]
 */
function rgb_tohex($rgb) {
	$hex = "#";
	$hex .= str_pad(dechex($rgb[0]), 2, "0", STR_PAD_LEFT);
	$hex .= str_pad(dechex($rgb[1]), 2, "0", STR_PAD_LEFT);
	$hex .= str_pad(dechex($rgb[2]), 2, "0", STR_PAD_LEFT);

	return $hex;
}
/**
 * 系统加密方法
 * @param string $data 要加密的字符串
 * @param string $key  加密密钥
 * @param int $expire  过期时间 单位 秒
 * @return string
 * @author 枫叶 <735579768@qq.com>
 */
function ank_encrypt($data, $key = 'adminrootkl', $expire = 0) {
	if ($data == '') {return '';}
	$key  = md5(empty($key) ? config('DATA_AUTH_KEY') : $key);
	$data = base64_encode($data);
	$x    = 0;
	$len  = strlen($data);
	$l    = strlen($key);
	$char = '';

	for ($i = 0; $i < $len; $i++) {
		if ($x == $l) {
			$x = 0;
		}

		$char .= substr($key, $x, 1);
		$x++;
	}

	$str = sprintf('%010d', $expire ? $expire + time() : 0);

	for ($i = 0; $i < $len; $i++) {
		$str .= chr(ord(substr($data, $i, 1)) + (ord(substr($char, $i, 1))) % 256);
	}
	return str_replace(array('+', '/', '='), array('-', '_', ''), base64_encode($str));
}

/**
 * 系统解密方法
 * @param  string $data 要解密的字符串 （必须是ank_encrypt方法加密的字符串）
 * @param  string $key  加密密钥
 * @return string
 * @author 枫叶 <735579768@qq.com>
 */
function ank_decrypt($data, $key = 'adminrootkl') {
	if ($data == '') {return '';}
	$key  = md5(empty($key) ? config('DATA_AUTH_KEY') : $key);
	$data = str_replace(array('-', '_'), array('+', '/'), $data);
	$mod4 = strlen($data) % 4;
	if ($mod4) {
		$data .= substr('====', $mod4);
	}
	$data   = base64_decode($data);
	$expire = substr($data, 0, 10);
	$data   = substr($data, 10);

	if ($expire > 0 && $expire < time()) {
		return '';
	}
	$x    = 0;
	$len  = strlen($data);
	$l    = strlen($key);
	$char = $str = '';

	for ($i = 0; $i < $len; $i++) {
		if ($x == $l) {
			$x = 0;
		}

		$char .= substr($key, $x, 1);
		$x++;
	}

	for ($i = 0; $i < $len; $i++) {
		if (ord(substr($data, $i, 1)) < ord(substr($char, $i, 1))) {
			$str .= chr((ord(substr($data, $i, 1)) + 256) - ord(substr($char, $i, 1)));
		} else {
			$str .= chr(ord(substr($data, $i, 1)) - ord(substr($char, $i, 1)));
		}
	}
	return base64_decode($str);
}
/**
 *系统用户密码加密算法
 */
function ank_ucenter_md5($str, $key = 'adminrootkl') {
	$key = $key ? $key : config('DATA_AUTH_KEY');
	return '' === $str ? '' : md5(sha1($str) . $key);
}
/**
 *检测目录大小
 */
function get_dir_size($dir) {
	if (!file_exists($dir)) {
		return 0;
	}
	$sizeResult = 0;
	$handle     = opendir($dir); //打开文件流
	while (false !== ($FolderOrFile = readdir($handle))) //循环判断文件是否可读
	{
		if ($FolderOrFile != "." && $FolderOrFile != "..") {
			if (is_dir("$dir/$FolderOrFile")) //判断是否是目录
			{
				$sizeResult += get_dir_size("$dir/$FolderOrFile"); //递归调用
			} else {
				$sizeResult += filesize("$dir/$FolderOrFile");
			}
		}
	}
	closedir($handle); //关闭文件流
	return $sizeResult; //返回大小
}
/**
 *创建文件夹
 */
function create_folder($path) {
	if (!is_dir($path)) {
		return mkdir($path, 0777, true); //第三个参数为true即可以创建多极目录
	} else {
		return true;
	}
}
/**
 * 获取图片
 * @param int $id
 * @param string $field
 * @return 完整的数据  或者  指定的$field字段值
 * @author huajie <banhuajie@163.com>
 */
function get_picture($id = null, $field = null, $wh = null) {
	$revalue = '';
	$id      = trim($id);
	if (empty($id)) {
		$revalue = false;
	}
	$swh = $wh;
	if (is_numeric($id)) {
		$pkey    = md5('_picture_' . $id . '_' . $field . '_' . $swh);
		$revalue = cache($pkey);
		if (empty($revalue) || config('app_debug')) {
			$picture = \think\Db::name('Picture')
				->where(['picture_id' => $id, 'status' => 1])
				->find();
			if (!is_null($field) && !is_null($wh)) {
				$wharr = explode('_', $wh);

				if (count($wharr) == 2) {
					$revalue = '.' . str_replace(config('file_upload.rootPath') . '/image/', config('greate_cache_path.imgcache') . '/', $picture['path']);
					$fname   = basename($revalue);
					$rename  = $wh . '_' . $fname;
					$revalue = str_replace($fname, $rename, $revalue);
					//判断之前是不是已经生成
					if (!file_exists($revalue)) {
						$result = create_thumb('.' . $picture['path'], $revalue, $wharr[0], $wharr[1]);
						if ($result !== true) {
							$revalue = $picture['path'];
						}
					}
				}
			} else if (!empty($field)) {
				$revalue = '.' . $picture[$field];
				if ($field == 'thumbpath') {
					if (!file_exists($revalue)) {
						$twh    = explode('*', config('thumb_size'));
						$result = create_thumb('.' . $picture['path'], $revalue, $twh[0], $twh[1]);
						if ($result !== true) {
							$revalue = $picture['path'];
						}
					}
				}
			} else {
				$revalue = $picture['path'];
			}
			cache($pkey, $revalue);
		}
	} else {
		$revalue = $id;
	}
	return empty($revalue) ? '' : trim($revalue, '.');
}
/**
 * 查找文件并返回路径
 * @param  string $filename [description]
 * @return [type]           [description]
 */
function find_file_path($filename = '') {
	if (empty($filename)) {
		return '';
	}
	$filepath = cache($filename);
	if (!$filepath || config('app_debug')) {
		$dirarr = [
			config('view_replace_str.__JS__'),
			config('view_replace_str.__CSS__'),
			config('view_replace_str.__STATIC__') . '/js',
			config('view_replace_str.__STATIC__') . '/css',
			STATIC_DIR . '/' . request()->module() . '/' . config('default_theme'),
			config('view_replace_str.__STATIC__'),
			STATIC_DIR,

		];
		foreach ($dirarr as $key => $value) {
			$filepath = $value . '/' . $filename;
			// \Think\Log::write($filepath, 'WARN');
			if (file_exists('.' . $filepath)) {
				cache($filename, $filepath);
				return $filepath;
			}
		}
	} else {
		return $filepath;
	}
	return $filename;
}
/**
 *判断文件是否已经被修改
 */
function file_ismod($filepath) {
	$filearr = array();
	if (is_array($filepath)) {
		$filearr = $filepath;
	} else {
		$filearr[] = $filepath;
	}
	$rebool = false;
	foreach ($filearr as $val) {
		$val = '.' . $val;
		// var_dump($val);
		// die();
		if (!file_exists($val)) {
			continue;
		}
		// $modtime = date('Y-m-d h:i:s', filemtime($val));
		$modtime = filemtime($val);
		if ($modtime) {
			$path     = str_replace(array('/', '\\'), array('_'), $val);
			$key      = '_modfile/' . $path;
			$modstime = cache($key);
			if ($modtime !== $modstime['time']) {
				cache($key, ['time' => $modtime, 'path' => $val]);
				$rebool = true;
			}
		}
	}
	return $rebool;

}
/**
 *压缩css
 **/
function compress_css($path) {
	$dirname  = dirname($path); //当前css文件的路径目录
	$ipath    = $path;
	$styledir = '.' . config('greate_cache_path.jscss') . '/' . request()->module();
	$str      = '';
	if ($ipath) {
		$str = file_get_contents($ipath);
		//把文件压缩
		$arr = array('/(\n|\t|\s)*/i', '/\n|\t|\s(\{|}|\,|\:|\;)/i', '/(\{|}|\,|\:|\;)\s/i');
		$str = preg_replace($arr, '$1', $str);
		$str = preg_replace('/(\/\*.*?\*\/\n?)/i', '', $str);

		//查找出样式文件中的图片
		preg_match_all("/url\(\s*?[\'|\"]?(.*?)[\'|\"]?\)/", $str, $out);
		foreach ($out[1] as $v) {
			// \Think\Log::write($v, 'WARN');

			//复制文件
			//文件所在的真实路径
			$src_url = $v;
			//文件要复制到的目标路径
			$new_url = '';
			if (strpos($src_url, '?') !== false) {
				//如果有参数
				$num     = strpos($src_url, '?');
				$src_url = substr($src_url, 0, $num);
			}
			//文件所在路径
			if (substr($src_url, 0, 3) == '../') {
				$new_url = str_replace("../", $styledir . "/", $src_url); //设置新路径
				//反回上级目录
				$arr = explode('/', $dirname);
				unset($arr[count($arr) - 1]);
				$dirname2 = implode('/', $arr);
				$src_url  = str_replace("../", $dirname2 . "/", $src_url);

				// \Think\Log::write($src_url, 'WARN');

			} else if (substr($src_url, 0, 2) == './') {
				$new_url = str_replace("./", $styledir . "/", $src_url); //设置新路径
				$src_url = str_replace("./", $dirname . "/", $src_url);
			} else if (substr($src_url, 0, 1) == '/') {
				$fpath   = "/source/" . basename($src_url);
				$str     = str_replace($src_url, '.' . $fpath, $str);
				$new_url = $styledir . $fpath; //设置新路径
				$src_url = SITE_PATH . $src_url;
				\Think\Log::write($new_url);
				\Think\Log::write($src_url);

			} else {
				$new_url = $styledir . "/" . $src_url; //设置新路径
				$src_url = $dirname . '/' . $src_url;
			}
			create_folder(dirname($new_url));
			if (file_exists($src_url)) {
				//判断是否存在
				// dump($src_url);
				// dump($new_url);
				copy($src_url, $new_url); //复制到新目录
			}

		}
		$str = str_replace('../', './', $str);
	} else {
		die("path is not found:" . $ipath);
	}
	return $str;
}
/**
 *压缩JS文件并替换JS嵌套include文件
 */
function compress_js($jspath) {
	//查找是否有压缩文件存在
	$farr                   = explode('.', $jspath);
	$farr[count($farr) - 1] = 'min.js';
	$minjs                  = implode('.', $farr);
	$jsstr                  = '';
	if (file_exists($minjs)) {
		$jsstr = file_get_contents($minjs);
	} else {
		$jsstr = file_get_contents($jspath);
	}
	return $jsstr;
	// set_time_limit(1800);
	// import('Ainiku.JSMin');
	// return \JSMin::minify($jsstr);
}
/**
 *写字符串到文件
 */
function write_tofile($filename, $str) {
	if (create_folder(dirname($filename))) {
		return file_put_contents($filename, $str);
	} else {
		die(dirname($filename));
	}

}
/**
 * 注册资源到系统的资源管理类中
 * @return [type] [description]
 */
function reg_css($name, $ys = true) {
	$name && \ank\Assets::getInstance()->registerCss($name, $ys);
}
function reg_js($name = '', $ys = true) {
	$name && \ank\Assets::getInstance()->registerJs($name, $ys);
}
function reg_initjs($jsstr) {
	$jsstr && \ank\Assets::getInstance()->registerInitJs($jsstr);
}
// /**
//  * 输出一个小挂件
//  * @return [type] [description]
//  */
// function widget($name = '', $args = []) {
// 	$name = explode('/', $name);
// 	$obj  = controller($name[0], 'widget');
// 	if (method_exists($obj, $name[1])) {
// 		echo call_user_func_array([$obj, $name[1]], $args);
// 	} else {
// 		$errstr = "方法不存在:{$name[1]}";
// 		throw new \think\Exception($errstr, 100006);
// 	}

// }
/**
 * addon插件调用方法
 */
function addon($name = '', $args = []) {
	if (empty($name)) {
		return null;
	}
	$name   = strtolower($name);
	$name   = explode('/', $name);
	$method = $name[1];
	$name   = $name[0];

	$addon_path = SITE_PATH . '/addons' . '/' . $name . '/' . ucfirst($name) . '.php';
	if (file_exists($addon_path)) {
		include $addon_path;
		$name = "\\addons\\{$name}\\" . ucfirst($name);
		return call_user_func_array([new $name(), $method], $args);
	} else {
		$errstr = "插件不存在:{$name}";
		throw new \think\Exception($errstr, 100006);
	}

	// $obj = controller($name[0], 'widget');
	// if (method_exists($obj, $name[1])) {
	// 	echo call_user_func_array([$obj, $name[1]], $args);
	// } else {
	// 	$errstr = "方法不存在:{$name[1]}";
	// 	throw new \think\Exception($errstr, 100006);
	// }

}
/*
 *功能：发送邮件
 *@param:$to     要发送的目标邮箱
 *@param:$$subject          邮件的主题
 *@param:$body              邮件的主体内容
 *@param:FromName           发送人的用户名(昵称)
 *@param:toname             接收人的用户名(昵称)
 *@param:extra_msg          附加信息(可为空)
 */

function send_mail($conf = array()) {
	//ini_set("memory_limit","100M");
	$to         = isset($conf['toemail']) ? $conf['toemail'] : '';
	$subject    = isset($conf['subject']) ? $conf['subject'] : '';
	$body       = isset($conf['body']) ? $conf['body'] : '';
	$fromname   = isset($conf['fromname']) ? $conf['fromname'] : config('mail_smtp_fromname'); //来源名称
	$toname     = isset($conf['toname']) ? $conf['toname'] : '';
	$extra_msg  = isset($conf['extra_msg']) ? $conf['extra_msg'] : '';
	$host       = isset($conf['host']) ? $conf['host'] : '';
	$port       = isset($conf['port']) ? $conf['port'] : '';
	$uname      = isset($conf['username']) ? $conf['username'] : '';
	$pwd        = isset($conf['password']) ? $conf['password'] : '';
	$attachment = isset($conf['attachment']) ? $conf['attachment'] : '';
	$fromemail  = isset($conf['fromemail']) ? $conf['fromemail'] : config('mail_smtp_frommail'); //来源邮箱

	$host  = empty($host) ? config('mail_smtp_host') : $host;
	$port  = empty($port) ? config('mail_smtp_port') : $port;
	$uname = empty($uname) ? config('mail_smtp_user') : $uname;
	$pwd   = empty($pwd) ? config('mail_smtp_pwd') : $pwd;

	$fromname = empty($fromname) ? $uname : $fromname;
	$body     = empty($body) ? config('mail_smtp_test') : $body;
	// $body     = to_utf8($body);

	if (empty($uname)) {
		return '收件人邮箱不能为空';
	}

	if (empty($host)) {
		return '主机址不能为空';
	}

	if (empty($body)) {
		return '邮件内容不能为空';
	}

	if (empty($pwd)) {
		return '密码不能为空';
	}
	if (empty($fromemail)) {
		return '来源邮箱不能为空';
	}

	// import('Ainiku.PHPMailer');
	$mail = new \ank\PHPMailer();

	$mail->SMTPDebug = 0; // 关闭SMTP调试功能
	$mail->IsSMTP(); // send via SMTP
	$mail->Host     = $host; // SMTP servers
	$mail->SMTPAuth = true; // turn on SMTP
	$mail->Username = $uname; // SMTP username
	$mail->Password = $pwd; // SMTP password
	$mail->From     = $fromemail; // 发件人邮箱
	$mail->FromName = $fromname; // 发件人
	$mail->CharSet  = "utf-8"; // 这里指定字符集！
	$mail->Encoding = "base64";
	$mail->AddAddress($to, $toname); // 收件人邮箱和姓名
	$mail->IsHTML(true); // send as HTML
	//$mail->SMTPSecure = 'ssl';   // 使用安全协议用qq邮箱时要用
	$mail->Subject  = $subject; // 邮件主题
	$mail->Body     = $body;
	$mail->WordWrap = 50; // set word wrap 换行字数
	$mail->AltBody  = "text/html";
	$mail->AddReplyTo($fromemail, $fromname); //快捷回复
	if (!empty($attachment)) {
		$mail->AddAttachment($attachment);
	}
	//$mail->AddAttachment("sendmail.rar");     // attachment 附件
	//$mail->AddAttachment("psd.jpg", "psd.jpg");  //添加一个附件并且重命名

	if (!$mail->Send()) {
		return config('app_debug') ? $mail->ErrorInfo : '邮件发送错误!';
	} else {
		return true;
	}
}
/**
 * Url生成
 * @param string        $url 路由地址
 * @param string|array  $vars 变量
 * @param bool|string   $suffix 生成的URL后缀
 * @param bool|string   $domain 域名
 * @return string
 */
function url($url = '', $vars = '', $suffix = true, $domain = null) {
	return \think\Url::build($url, $vars, $suffix, $domain);
}
function fenci($str = '') {
	if (!$str) {
		return '';
	}
	$pa = new \ank\PhpAnalysis();
	$pa->SetSource($str);
	$pa->resultType = 2;
	$pa->StartAnalysis(true);
	// 获得最终全部分词结果
	return $pa->GetFinallyResult(',');
	// 获得粗分结果
	// print_r($pa->GetSimpleResult());
	// 获得包含属性信息的粗分结果
	// print_r($pa->GetSimpleResultAll());
	// 函数说明：获取出现频率最高的指定词条数（通常用于提取文档关键字）
	// 参数列表：$num = 10 返回词条个数
	// return $pa->GetFinallyKeywords(10);
	// 获取hash索引数组
	// print_r($pa->GetFinallyIndex());
}
/**
 * 字符串截取，支持中文和其他编码
 * @static
 * @access public
 * @param string $str 需要转换的字符串
 * @param string $start 开始位置
 * @param string $length 截取长度
 * @param string $charset 编码格式
 * @param string $suffix 截断显示字符
 * @return string
 */
function msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = false) {
	if (function_exists("mb_substr")) {
		$slice = mb_substr($str, $start, $length, $charset);
	} elseif (function_exists('iconv_substr')) {
		$slice = iconv_substr($str, $start, $length, $charset);
		if (false === $slice) {
			$slice = '';
		}
	} else {
		$re['utf-8']  = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
		$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
		$re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
		$re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
		preg_match_all($re[$charset], $str, $match);
		$slice = join("", array_slice($match[0], $start, $length));
	}
	return $suffix ? $slice . '...' : $slice;
}

// /**
//  *把字符串转成数组
//  *@param $str 字符串
//  *@param $charset 字符串编码
//  */
// function mbstring_toarray($str, $charset) {
// 	$strlen = mb_strlen($str);
// 	while ($strlen) {
// 		$array[] = mb_substr($str, 0, 1, $charset);
// 		$str     = mb_substr($str, 1, $strlen, $charset);
// 		$strlen  = mb_strlen($str);
// 	}
// 	return $array;
// }
// /**
//  *把字符串转成utf8如果本身就是utf8的话原样返回
//  *
//  **/
// function is_utf8($str) {
// 	$len = strlen($str);
// 	for ($i = 0; $i < $len; $i++) {
// 		$c = ord($str[$i]);
// 		if ($c > 128) {
// 			if (($c > 247)) {
// 				return false;
// 			} elseif ($c > 239) {
// 				$bytes = 4;
// 			} elseif ($c > 223) {
// 				$bytes = 3;
// 			} elseif ($c > 191) {
// 				$bytes = 2;
// 			} else {
// 				return false;
// 			}

// 			if (($i + $bytes) > $len) {
// 				return false;
// 			}

// 			while ($bytes > 1) {
// 				$i++;
// 				$b = ord($str[$i]);
// 				if ($b < 128 || $b > 191) {
// 					return false;
// 				}

// 				$bytes--;
// 			}
// 		}
// 	}
// 	return true;
// }
// /**
//  *把字符串转成utf
//  *
//  **/
// function to_utf8($str = null) {
// 	if (is_utf8($str)) {
// 		return $str;
// 	} else {
// 		return iconv('gbk', 'utf-8', $str);
// 	}
// }
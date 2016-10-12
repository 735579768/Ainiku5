<?php
/**
 *资源管理类
 *到最后渲染的时候这些资源文件会添加到页面的head标签中
 *\assets\Assets::getInstance()->register();
 *echo \assets\Assets::getInstance()->getSource();
 *使用方法
 *$assets = \assets\Assets::getInstance();
 *设置资源路径
 *$assets->addSourcePath(array(
 *__ROOT__ . '/Public/' . MODULE_NAME . '/' . C('DEFAULT_THEME') . '/css',
 *__ROOT__ . '/Public/' . MODULE_NAME . '/' . C('DEFAULT_THEME') . '/js',
 *__ROOT__ . '/Public/Static/css',
 *__ROOT__ . '/Public/Static/js',
 *));
 *注册css文件
 *$assets->registerCss('reset,common,index,404');
 *注册js文件
 *$assets->registerJs('ajax,functions');
 *
 *echo ($assets->getSource());
 *dump($assets);
 **/
namespace assets;
class Assets {
	static private $_instance = null;
	private $js               = []; //关闭调试后压缩成一个
	private $js_noys          = []; //关闭调试后不压缩,还有原来路径
	private $css              = [];
	private $css_noys         = []; //关闭调试后不压缩,还有原来路径
	private $jsstr            = '';
	private $initjsstr        = ''; //初始化的js字符串
	private $cssstr           = '';
	private $sourcePath       = []; //查找资源的路径
	private $cachepath        = '';
	/**
	 * Description:私有化构造函数，防止外界实例化对象
	 */
	private function __construct() {
		$this->cachepath  = '.' . config('greate_cache_path.jscss') . '/' . request()->module();
		$this->sourcePath = [
			config('view_replace_str.__JS__'),
			config('view_replace_str.__CSS__'),
			config('view_replace_str.__STATIC__') . '/js',
			config('view_replace_str.__STATIC__') . '/css',
			STATIC_DIR . '/' . request()->module() . '/' . config('default_theme'),
			config('view_replace_str.__STATIC__'),
		];
	}
	/**
	 * Description:私有化克隆函数，防止外界克隆对象
	 */
	private function __clone() {
	}
	static public function getInstance() {
		if (self::$_instance === null) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	/**
	 *注册资源到类中
	 **/
	public function register($name = '', $type = 'css') {
		if ($type == 'css') {
			$this->registerCss($name);
		} else {
			$this->registerJs($name);
		}
	}

	/**
	 *重置注册的资源
	 */
	public function resetRegister() {
		$this->js  = [];
		$this->css = [];
	}
	/**
	 * 注册css路径到成员变量
	 * @param  [type] $name [description]
	 * @return [type]       [description]
	 */
	public function registerCss($name, $ys = true) {
		if (is_string($name)) {
			$name = explode(',', $name);
		}
		if ($ys) {
			$this->css = array_merge($this->css, $name);
		} else {
			$this->css_noys = array_merge($this->css_noys, $name);
		}

	}
	/**
	 * 注册js路径到成员变量
	 * @param  [type]  $name 文章名
	 * @param  boolean $ys   是否压缩合并成一个文件
	 * @return [type]        [description]
	 */
	public function registerJs($name, $ys = true) {
		if (is_string($name)) {
			$name = explode(',', $name);
		}
		if ($ys) {
			$this->js = array_merge($this->js, $name);
		} else {
			$this->js_noys = array_merge($this->js_noys, $name);
		}

	}
	/**
	 * 注册一些初始化的js字符串
	 * @return [type] [description]
	 */
	public function registerInitJs($str) {
		$this->initjsstr .= $str . "\r\n";
	}
	/**
	 * 取注册到类中的js和css文件
	 * @return [type] [description]
	 */
	public function getSource($type = 'all') {
		//查找真实路径,先从当前模块查找
		$ismodcss        = false;
		$ismodjs         = false;
		static $suijinum = 0;
		if (empty($this->css) && empty($this->js)) {
			return "";
		}
		$cssname  = md5(implode($this->css));
		$jsname   = md5(implode($this->js));
		$suijinum = cache('assetsversion');
		if (!$suijinum || APP_DEBUG) {
			$suijinum = '?r=' . rand(0, 10);
			cache('assetsversion', $suijinum);
		}
		$csscache = $this->cachepath . '/' . $cssname . '.css';
		$jscache  = $this->cachepath . '/' . $jsname . '.js';

		$css_sj_path = cache($cssname . '_pathlist'); //css实际路径
		if (!$css_sj_path || APP_DEBUG) {
			//查找css文件
			foreach ($this->css as $k => $v) {
				$filepath = $this->getFilePath($v, 'css');
				if ($filepath) {
					$css_sj_path[] = $filepath;
					$this->css[$k] = $filepath;
					$this->cssstr .= '<link href="' . trim($filepath, '.') . $suijinum . '" type="text/css" rel="stylesheet" />' . "\n";

				} else {
					$this->css[$k] .= '.css--->file is not exists!';
				}
				cache($cssname . '_pathlist', $css_sj_path);
			}
		} else {
			if ($this->file_ismod($css_sj_path) || !file_exists($csscache)) {
				$ismodcss = true;
				foreach ($css_sj_path as $key => $value) {
					$this->cssstr .= $this->compress_css($value);
				}

			}
		}
		//查找js文件
		$js_sj_path = cache($jsname . '_pathlist'); //js实际路径
		if (!$js_sj_path || APP_DEBUG) {
			foreach ($this->js as $k => $v) {
				$filepath = $this->getFilePath($v, 'js');
				if ($filepath) {
					$js_sj_path[] = $filepath;
					$this->js[$k] = $filepath;
					$this->jsstr .= '<script src="' . trim($filepath, '.') . $suijinum . '" type="text/javascript" ></script>' . "\n";
				} else {
					$this->js[$k] .= '.js--->file is not exists!';
				}
			}
			cache($jsname . '_pathlist', $js_sj_path);
		} else {
			if ($this->file_ismod($js_sj_path) || !file_exists($jscache)) {
				$ismodjs = true;
				foreach ($js_sj_path as $key => $value) {
					$this->jsstr .= $this->compress_js($value);
				}

			}
		}
		if (!APP_DEBUG) {
			//如果关闭调试模式就进行下面处理
			if (!file_exists(dirname($csscache))) {
				mkdir(dirname($csscache), 0777, true);
			}

			if (!file_exists(dirname($jscache))) {
				mkdir(dirname($jscache), 0777, true);
			}

			($ismodcss || !file_exists($csscache)) && file_put_contents($csscache, $this->cssstr);
			($ismodjs || !file_exists($jscache)) && file_put_contents($jscache, $this->jsstr);
			if (!empty($this->css)) {
				$this->cssstr = '<link href="' . trim($csscache, '.') . $suijinum . '" type="text/css" rel="stylesheet" />' . "\n";
			}
			if (!empty($this->js)) {
				$this->jsstr = '<script src="' . trim($jscache, '.') . $suijinum . '" type="text/javascript" ></script>' . "\n";
			}

		}
		//不压缩合并的css
		$cssnoysname  = md5(implode($this->css_noys));
		$css_noys_str = cache($cssnoysname);
		if (!$css_noys_str || APP_DEBUG) {
			$css_noys_str = '';
			foreach ($this->css_noys as $k => $v) {
				$filepath = $this->getFilePath($v, 'css');
				if ($filepath) {
					$css_noys_str .= '<link href="' . trim($filepath, '.') . $suijinum . '" type="text/css" rel="stylesheet" />' . "\n";
				}
			}
		}

		//不压缩合并的js
		$jsnoysname  = md5(implode($this->js_noys));
		$js_noys_str = cache($jsnoysname);
		if (!$js_noys_str || APP_DEBUG) {
			$js_noys_str = '';
			foreach ($this->js_noys as $k => $v) {
				$filepath = $this->getFilePath($v, 'js');
				if ($filepath) {
					$js_noys_str .= '<script src="' . trim($filepath, '.') . $suijinum . '" type="text/javascript" ></script>' . "\n";
				}
			}
		}

		$css = $css_noys_str . $this->cssstr;
		$js  = $js_noys_str . "\r\n";
		if ($this->initjsstr) {
			$js .= $this->jsstr . '<script type="text/javascript">' . "\r\n" . '$(function(){' . "\r\n" . $this->initjsstr . "\r\n" . '});' . "\r\n" . '</script>';
		} else {
			$js .= $this->jsstr;
		}
		switch ($type) {
		case 'all':
			return $css . $js;
			break;
		case 'js':
			return $js;
			break;
		default:
			return $css;
			break;
		}

	}
	/**
	 *判断文件是否已经被修改
	 */
	private function file_ismod($filepath) {
		$filearr = array();
		if (is_array($filepath)) {
			$filearr = $filepath;
		} else {
			$filearr[] = $filepath;
		}
		$rebool = false;
		foreach ($filearr as $sval) {
			// $sval = $val;
			// $modtime = date('Y-m-d h:i:s', filemtime($sval));
			$modtime = filemtime($sval);
			if ($modtime) {
				$path     = str_replace(array('/', '\\'), array('_'), $sval);
				$key      = '_modfile/' . $path;
				$modstime = cache($key);
				if ($modtime !== $modstime['time']) {
					cache($key, ['time' => $modtime, 'path' => $sval]);
					$rebool = true;
				}
			}
		}
		return $rebool;

	}
	/**
	 *在路径中查找是否存在文件
	 **/
	private function getFilePath($filename, $type = 'css') {
		foreach ($this->sourcePath as $value) {
			$filepath = '.' . "{$value}/{$filename}.{$type}";
			if (file_exists($filepath)) {
				return $filepath;
			}
			//从子目录查找
			$curdir = '.' . $value;
			// dump($curdir);
			$subdir = $this->get_dir_list($curdir);
			// dump($subdir);
			if ($subdir) {
				foreach ($subdir as $key => $val) {
					$temdir = $curdir . '/' . $val;
					// dump($curdir);
					$fpath       = "{$temdir}/{$filename}.{$type}";
					$fpath_jsdir = "{$temdir}/js/{$filename}.{$type}";
					if (file_exists($fpath)) {
						return $fpath;
					} else if (file_exists($fpath_jsdir)) {
						return $fpath_jsdir;
					}
				}
			}
		}
		return false;
	}
	/**
	 * 返回一个目录中的目录列表(只返回一级)
	 * @param string $path
	 */
	private function get_dir_list($dir) {
		$dirArray[] = null;
		if (false != ($handle = opendir($dir))) {
			$i = 0;
			while (false !== ($file = readdir($handle))) {
				//去掉"“.”、“..”以及带“.xxx”后缀的文件
				if ($file != "." && $file != ".." && !strpos($file, ".")) {
					$dirArray[$i] = $file;
					$i++;
				}
			}
			//关闭句柄
			closedir($handle);
		}
		return $dirArray;
	}
	public function addSourcePath($conf) {
		if (is_string($conf)) {
			$conf = explode(',', $conf);
		}
		$this->sourcePath = array_merge($this->sourcePath, $conf);
	}
	/**
	 * 压缩css文件
	 * @param  [type] $path [description]
	 * @return [type]       [description]
	 */
	private function compress_css($path) {
		$dirname  = dirname($path); //当前css文件的路径目录
		$ipath    = $path;
		$styledir = $this->cachepath;
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
	 * 压缩js文件
	 * @param  [type] $jspath [description]
	 * @return [type]         [description]
	 */
	private function compress_js($jspath) {
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
	}
}
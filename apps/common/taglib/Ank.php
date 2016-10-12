<?php
namespace app\common\taglib;
use think\template\TagLib;

class Ank extends TagLib {
	// 标签定义
	protected $tags = [
		// 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
		'layer'  => ['attr' => '', 'close' => 0],
		// 'assets'    => ['attr' => 'type', 'close' => 0],
		// 'regcss'    => ['attr' => 'name', 'close' => 0],
		// 'regjs'     => ['attr' => 'name', 'close' => 0],
		// 'reginitjs' => ['attr' => ''],
		'insert' => ['attr' => 'type,name', 'close' => 0],
		'single' => ['attr' => 'id', 'close' => 0],
		'get'    => ['attr' => 'table,field,id,pic', 'close' => 0],
		'query'  => ['attr' => 'name,sql', 'close' => 1],
		'nav'    => ['attr' => 'name,catid,order,rows', 'close' => 1],
		'link'   => ['attr' => 'name', 'close' => 1],
		'module' => ['attr' => 'name', 'close' => 1],
	];
	public function tagLayer($tag) {
		return '<script src="/public/static/layer/layer.js" type="text/javascript" ></script>';
	}
	// /**
	//  * 替换系统中注册的css和js文件
	//  * @param  [type] $tab [description]
	//  * @return [type]      [description]
	//  */
	// public function tagAssets($tag) {
	// 	$type = isset($tag['type']) ? $tag['type'] : 'css';
	// 	switch ($type) {
	// 	case 'js':
	// 		return \assets\Assets::getInstance()->getSource('js');
	// 		break;
	// 	default:
	// 		return \assets\Assets::getInstance()->getSource('css');
	// 		break;
	// 	}
	// }
	// /**
	//  * 注册css
	//  * @param  [type] $tag [description]
	//  * @return [type]      [description]
	//  */
	// public function tagRegcss($tag) {
	// 	$name = isset($tag['name']) ? $tag['name'] : '';
	// 	reg_css($name);
	// }
	// /**
	//  * 注册js
	//  * @param  [type] $tag [description]
	//  * @return [type]      [description]
	//  */
	// public function tagRegjs($tag) {
	// 	$name = isset($tag['name']) ? $tag['name'] : '';
	// 	reg_js($name);
	// }
	// /**
	//  * 注册initjs
	//  * @param  [type] $tag [description]
	//  * @return [type]      [description]
	//  */
	// // public function tagInitjs($tag, $content) {
	// // 	// $name = isset($tag['name']) ? $tag['name'] : '';
	// // 	reg_initjs($content);
	// // 	return '45644';
	// // }
	// public function tagReginitjs($tag, $content) {
	// 	return $Content;
	// }
	/**
	 * insert标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagInsert($tag, $content) {
		static $suijinum = '';
		$hname           = isset($tag['name']) ? $tag['name'] : '';
		$filetype        = isset($tag['type']) ? $tag['type'] : 'css';
		$filetype        = strtolower($filetype);
		$dir             = isset($tag['dir']) ? $tag['dir'] : '';
		//设置查找目录
		if (empty($dir)) {
			if ($filetype == 'js') {$dir = config('view_replace_str.__JS__');} else { $dir = config('view_replace_str.__CSS__');}
		}

		if (empty($filetype) && $filetype != 'js' && $filetype != 'css') {
			return '';
		}

		$newname = sha1($hname);
		if (!$suijinum) {
			$suijinum = cache('assetsversion');
			if (!$suijinum || APP_DEBUG) {
				$suijinum = '?r=' . rand(10000, 99999);
				cache('assetsversion', $suijinum);
			}
		}
		$jscss  = '';
		$temarr = explode(',', $hname);

		foreach ($temarr as $key => $val) {
			$filepath     = $val . '.' . $filetype;
			$temarr[$key] = find_file_path($filepath);
		}
		if (APP_DEBUG) {
			foreach ($temarr as $key => $val) {
				if ($filetype == 'js') {
					$jscss .= '<script src="' . $val . $suijinum . '" type="text/javascript" ></script>' . "\r\n";
				} else {
					$jscss .= '<link href="' . $val . $suijinum . '"  rel="stylesheet" type="text/css"/>' . "\r\n";
				}
			}
		} else {
			$styledir      = '.' . config('greate_cache_path.jscss') . '/' . request()->module();
			$cachefilename = $styledir . '/' . $newname . '.' . $filetype;
			create_folder(dirname($cachefilename));
			if (file_ismod($temarr) || !file_exists($cachefilename)) {
				$compressstr = '';
				foreach ($temarr as $key => $val) {
					$filepath = '.' . $val;
					if ($filetype == 'js') {
						$compressstr .= ';' . compress_js($filepath);
					} else {
						$compressstr .= compress_css($filepath);
					}
				}
				write_tofile($cachefilename, $compressstr);
			}
			if ($filetype == 'js') {
				$jscss .= '<script src="' . trim($cachefilename, '.') . '" type="text/javascript" ></script>' . "\r\n";
			} else {
				$jscss .= '<link href="' . trim($cachefilename, '.') . '" rel="stylesheet" type="text/css"  />' . "\r\n";
			}
		}
		return $jscss;
	}
	/**
	 * single标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagSingle($tag, $content) {
		$id = isset($tag['id']) ? $tag['id'] : '';
		if (empty($id)) {
			return '';
		}

		$parse = '<?php ';
		$parse .= '$skey=md5("_single' . $id . '");';
		$parse .= '$__SINGLE_LIST__=S($skey);';
		$parse .= 'if(empty($__SINGLE_LIST__)||APP_DEBUG):';
		$parse .= '$__SINGLE_LIST__ = M(\'Single\')->where(\'status=1\')->find(' . $id . ');';
		$parse .= 'S($skey,$__SINGLE_LIST__);';
		$parse .= 'endif;';
		$parse .= 'echo $__SINGLE_LIST__[\'content\'];';
		$parse .= ' ?>';
		return $parse;
	}
	/**
	 * get标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagGet($tag, $content) {
		$table = isset($tag['table']) ? $tag['table'] : '';
		$id    = isset($tag['id']) ? $tag['id'] : '';
		$field = isset($tag['field']) ? ($tag['field']) : '';
		$pic   = isset($tag['pic']) ? ($tag['pic']) : '';
		if (empty($table) || empty($id) || empty($field)) {
			return '';
		}

		$parse = '<?php ';
		$parse .= '$skey=md5("' . $table . $id . $field . $pic . '");';
		$parse .= '$__GET_LIST__=S($skey);';
		$parse .= 'if(empty($__GET_LIST__)||APP_DEBUG):';
		$parse .= '$__GET_LIST__ = M(\'' . $table . '\')->field(\'' . $field . '\')->find(' . $id . ');';
		$parse .= 'S($skey,$__GET_LIST__);';
		$parse .= 'endif;';
		$parse .= 'if(\'' . $pic . '\'==\'true\'):';
		$parse .= 'echo getPicture($__GET_LIST__[\'' . $field . '\']);';
		$parse .= 'else:';
		$parse .= 'if(empty($__GET_LIST__[\'' . $field . '\'])):';
		$parse .= 'echo "' . $empty . '";';
		$parse .= 'else:';
		$parse .= 'echo $__GET_LIST__[\'' . $field . '\'];';
		$parse .= 'endif;';
		$parse .= 'endif;';
		$parse .= ' ?>';
		return $parse;
	}
	/**
	 * query标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagQuery($tag, $content) {
		$name = isset($tag['name']) ? $tag['name'] : 'vo';
		$sql  = isset($tag['sql']) ? ($tag['sql']) : '';
		$sql  = str_replace('__DB_PREFIX__', C('DB_PREFIX'), $sql);
		$sql  = str_replace('neq', '<>', $sql);
		if (empty($sql)) {
			return '';
		}

		$parse = '<?php ';
		$parse .= '$__QUERY_LIST__=S(md5("' . md5($sql) . '"));';
		$parse .= 'if(empty($__NAV_LIST__)  || APP_DEBUG):';
		$parse .= '$__QUERY_LIST__ = M(\'\')->query("' . $sql . '");';
		$parse .= 'S(md5(\'' . md5($sql) . '\'),$__QUERY_LIST__);';
		$parse .= 'endif;';
		$parse .= ' ?>';
		$parse .= '<volist name="__QUERY_LIST__" id="' . $name . '">';
		$parse .= $content;
		$parse .= '</volist>';
		return $parse;
	}
	/**
	 * nav标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagNav($tag, $content) {
		$name  = isset($tag['name']) ? $tag['name'] : 'vo';
		$order = isset($tag['order']) ? ($tag['order'] . ',') : '';
		$parse = '<?php ';
		$parse .= '$__NAV_LIST__=cache("sys_navhome_list");';
		$parse .= 'if(empty($__NAV_LIST__)  || APP_DEBUG):';
		$parse .= '$__NAV_LIST__ = M(\'nav\')->where(\'status>0 and pid=0\')->order(\'' . $order . ' sort asc,nav_id desc\')->select();';
		$parse .= 'cache(\'sys_navhome_list\',$__NAV_LIST__);';
		$parse .= 'endif;';
		$parse .= ' ?>';
		$parse .= '<volist name="__NAV_LIST__" id="' . $name . '">';
		$parse .= $content;
		$parse .= '</volist>';
		return $parse;
	}
	/**
	 * link标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagLink($tag, $content) {
		$name  = isset($tag['name']) ? $tag['name'] : 'vo';
		$parse = '<?php ';
		$parse .= '$__LINK_LIST__=cache("sys_link_tree");';
		$parse .= 'if(empty($__LINK_LIST__) || APP_DEBUG):';
		$parse .= '$__LINK_LIST__ = M(\'link\')->where(\'status>0\')->order(\' sort asc,link_id desc\')->select();';
		$parse .= 'cache(\'sys_link_tree\',$__LINK_LIST__);';
		$parse .= 'endif;';
		$parse .= ' ?>';
		$parse .= '<volist name="__LINK_LIST__" id="' . $name . '">';
		$parse .= $content;
		$parse .= '</volist>';
		return $parse;
	}
	/**
	 * module标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function tagModule($tag, $content) {
		$name      = isset($tag['name']) ? $tag['name'] : 'vo';
		$posid     = isset($tag['modulepos_id']) ? $tag['modulepos_id'] : '';
		$module_id = isset($tag['module_id']) ? $tag['module_id'] : '';
		if (empty($posid) && empty($module_id)) {
			return false;
		}

		$parse = '<?php ';

		$parse .= '$mapmodule=array();';
		$parse .= '$mapmodule[\'status\']=1;';
		if (!empty($posid)) {
			$parse .= '$mapmodule[\'' . __DB_PREFIX__ . 'module.modulepos_id\']=' . $posid . ';';
		}

		if (!empty($module_id)) {
			$parse .= '$mapmodule[\'' . __DB_PREFIX__ . 'module.module_id\']=' . $module_id . ';';
		}

		$parse .= '$__MODULE_LIST__=S(json_encode($mapmodule));';
		$parse .= 'if(empty($__MODULE_LIST__) || APP_DEBUG):';
		$parse .= '$__MODULE_LIST__ = M(\'module\')->field(\'*,' . __DB_PREFIX__ . 'module.title as title,' . __DB_PREFIX__ . 'module.pic as pic,b.title as postitle,' . __DB_PREFIX__ . 'module.sort as sort\')->join(\'' . __DB_PREFIX__ . 'modulepos as b on b.modulepos_id=' . __DB_PREFIX__ . 'module.modulepos_id\')->where($mapmodule)->order(\' ' . __DB_PREFIX__ . 'module.sort asc,' . __DB_PREFIX__ . 'module.module_id desc\')->select();';
		$parse .= 'S(json_encode($mapmodule),$__MODULE_LIST__);';
		$parse .= 'endif;';
		$parse .= ' ?>';
		$parse .= '<volist name="__MODULE_LIST__"  id="' . $name . '">';
		$parse .= $content;
		$parse .= '</volist>';
		return $parse;
	}
}

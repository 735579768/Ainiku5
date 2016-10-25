<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
namespace Ainiku\TagLib;
use Think\Template\TagLib;

/**
 * CX标签库解析类
 */
class Article extends TagLib {
	// 标签定义
	protected $tags = array(
		// 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
		'list'     => array('attr' => 'category_id,order,rows,name,position', 'close' => 1),
		'single'   => array('attr' => 'single_id,name', 'close' => 1),
		'pagelist' => array('attr' => 'category_id,name', 'close' => 1),
		'pagenav'  => array('attr' => 'category_id,name', 'close' => 0),
	);
	/**
	 * list标签解析
	 * @access public
	 * @param array $tag 标签属性
	 * @param string $content  标签内容
	 * @return string
	 */
	public function _list($tag, $content) {
		$name     = isset($tag['name']) ? $tag['name'] : 'vo';
		$catid    = isset($tag['category_id']) ? $tag['category_id'] : null;
		$position = isset($tag['position']) ? $tag['position'] : null;
		$rows     = isset($tag['rows']) ? $tag['rows'] : 10;
		$order    = isset($tag['order']) ? ($tag['order'] . ',') : '';
		if (empty($name)) {return '';}
		$parse = ' <?php ';
		$parse .= '$maplist=array();';
		$parse .= '$maplist[\'status\']=1;';

		if (!empty($catid)) {
			$parse .= '$maplist[\'category_id\']=array(\'in\',get_category_allchild(' . $catid . '));';
		}

		if (!empty($position)) {
			$parse .= '$maplist[\'_string\']=\'FIND_IN_SET(\\\'' . $position . '\\\',position)\';';
		}

		//if(!empty($position))$parse .='$maplist[\'_string\']=array(\'like\',\'%'.$position.'%\');';
		$parse .= '$cachek=md5(json_encode($maplist).\'' . $rows . $order . '\');';
		$parse .= '$__ARTICLE_LIST__=S($cachek);';
		$parse .= 'if(empty($__ARTICLE_LIST__) || config(\'app_debug\')):';
		$parse .= '$__ARTICLE_LIST__ = M(\'Article\')->where($maplist)->order(\'' . $order . ' article_id desc\')->limit(\'' . $rows . '\')->select();';
		$parse .= 'S($cachek,$__ARTICLE_LIST__);';
		$parse .= 'endif;';
		$parse .= '  ?>';
		$parse .= '<volist name="__ARTICLE_LIST__" id="' . $name . '">';
		$parse .= $content;
		$parse .= '</volist>';
		return $parse;
	}
	//文章分页
	function _pagelist($tag, $content) {
		$name      = isset($tag['name']) ? $tag['name'] : 'vo';
		$pagenavid = isset($tag['id']) ? $tag['id'] : 'pagenav';
		$url       = isset($tag['url']) ? $tag['url'] : '';
		$position  = isset($tag['position']) ? $tag['position'] : null;
		$catid     = $tag['category_id'];
		$rows      = isset($tag['rows']) ? $tag['rows'] : 10;
		$order     = isset($tag['order']) ? ($tag['order'] . ',') : '';
		if (empty($name)) {
			return '';
		}

		//if(empty($catid))return '';
		$parse = '<?php ';
		$parse .= '$map2=array();';
		$parse .= '$map2[\'status\']=1;';
		if (!empty($catid)) {
			$parse .= '$map2[\'category_id\']=array(\'in\',get_category_allchild(' . $catid . '));';
		}

		if (!empty($position)) {
			$parse .= '$map2[\'_string\']=\'FIND_IN_SET(\\\'' . $position . '\\\',position)\';';
		}

		//if(!empty($position))$parse .='$map2[\'position\']=array(\'like\',\'%'.$position.'%\');';
		$parse .= '$skey=json_encode($map2).\'' . $order . $rows . '\'.I(\'get.p\');';
		$parse .= '$__SHOW__=S($skey.\'pageshow\');';
		$parse .= '$__PAGE_LIST__=S($skey.\'pagelist\');';
		$parse .= 'if(empty($__SHOW__) || empty($__PAGE_LIST__)  || config(\'app_debug\')):';
		$parse .= '$__COUNT__ = M(\'Article\')->where($map2)->order(\'' . $order . ' article_id desc\')->count();';
		$parse .= '$Page= new \Think\Page($__COUNT__,' . $rows . ');';
		$parse .= '$Page->setConfig(\'theme\',\'%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%\');';
		$parse .= '$Page->url=\'' . $url . '\';';
		$parse .= '$mp=array_merge($_POST,$_GET);';
		$parse .= 'foreach($mp as $key=>$val):';
		$parse .= '$Page->parameter[$key]   =   urlencode($val);';
		$parse .= 'endforeach;';

		$parse .= '$__SHOW__= $Page->show();';
		$parse .= '$__PAGE_LIST__ = M(\'Article\')->where($map2)->order(\'' . $order . ' article_id desc\')->limit(\'\'.$Page->firstRow.\',' . $rows . '\')->select();';
		$parse .= 'S($skey.\'pageshow\',$__SHOW__);';
		$parse .= 'S($skey.\'pagelist\',$__PAGE_LIST__);';

		$parse .= 'endif;';
		$parse .= '$' . $pagenavid . '=$__SHOW__;';
		$parse .= ' ?>';
		$parse .= '<notempty name="__PAGE_LIST__">';
		$parse .= '<volist empty="没有内容" name="__PAGE_LIST__" id="' . $name . '">';
		$parse .= $content;
		$parse .= '</volist>';
		$parse .= '<else />';
		$parse .= '<span class="emptytext">没有内容</span>';
		$parse .= '</notempty>';
		return $parse;
	}
	//取分页导航
	function _pagenav($tag) {
		$pagenavid = isset($tag['id']) ? $tag['id'] : '';
		$parse     = '<div class="page"><?php ';
		if (empty($pagenavid)) {
			$parse .= 'echo $__SHOW__;';
		} else {
			$parse .= 'echo $' . $pagenavid . ';';
		}
		$parse .= ' ?></div>';
		return $parse;
	}
	//单篇文章
	function _single($tag, $content) {
		$name = isset($tag['name']) ? $tag['name'] : 'vo';
		$id   = isset($tag['id']) ? $tag['id'] : '';
		if (empty($id)) {
			return '';
		}

		$parse = '<?php ';
		$parse .= '$' . $name . ' = M(\'Single\')->where(\'single_id=' . $id . '\')->order(\'single_id desc\')->find();';
		$parse .= ' ?>';
		$parse .= $this->tpl->parse($content);
		return $parse;
	}

}

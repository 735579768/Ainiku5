<?php
namespace app\common\model;

use think\Model;

class Goods extends Model {
	protected $auto   = ['pic', 'content', 'meta_keywords', 'meta_descr', 'position'];
	protected $insert = [];
	protected $update = [];

	protected function setPositionAttr($value) {
		return implode(',', input('param.position/a', []));
	}
	protected function setContentAttr($value) {
		return $value ? $value : '';
	}
	protected function setPicAttr($value) {
		if ($value) {
			return $value;
		}
		$content = input('param.content');
		if ($content) {
			//提取第一张图片到封面
			if (!$value) {
				return $this->_getFirstPicture($content);
			}

		} else {
			return $value ? $value : 0;
		}
	}
	protected function setMetaKeywordsAttr($value) {
		if ($value) {
			return $value;
		}
		$title   = input('param.title');
		$content = input('param.content');
		$content = strip_tags($content);
		$fc      = $this->_fenci($title);
		if ($content) {
			$fc .= $fc ? ',' . $this->_fenci($content, 5, false) : $this->_fenci($content, 5, false);
		}
		//去掉其中只有一个字的情况
		$arr = explode(',', $fc);
		foreach ($arr as $key => $value) {
			if ($this->_strlen($value) == 1) {
				unset($arr[$key]);
			}
		}
		return implode(',', $arr);
	}
	private function _strlen($str) {
		preg_match_all("/./us", $str, $matches);
		return count(current($matches));
	}
	protected function setMetaDescrAttr($value) {
		if ($value) {
			return $value;
		}
		$content = input('param.content');
		$content = strip_tags($content);
		if ($content) {
			return msubstr($content, 0, 80) . '...';
		} else {
			return '';
		}
	}
	/**
	 *提取字符串中的第一个图片
	 */
	private function _getFirstPicture($str = '') {
		preg_match('/<img.*?src\=[\'|\"](.*?)[\'|\"].*?>/', $str, $match);
		if ($match) {
			$info = \think\Db::name('Picture')->field('picture_id')->where("path='{$match[1]}'")->find();
			return empty($info) ? 0 : $info['picture_id'];

		} else {
			return 0;
		}
	}

	private function _fenci($str = '', $num = 10, $keywords = true) {
		if (!$str) {
			return '';
		}
		$pa = new \ank\PhpAnalysis();
		$pa->SetSource($str);
		$pa->resultType = 2;
		$pa->StartAnalysis(true);
		if ($keywords) {
			// 获得最终全部分词结果
			return trim($pa->GetFinallyResult(','), ',');
		} else {
			return $pa->GetFinallyKeywords($num);
		}
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

}
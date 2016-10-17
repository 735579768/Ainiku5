<?php
namespace app\common\model;

use think\Model;

class Article extends Model {
	protected $auto   = ['pic', 'content', 'position', 'views'];
	protected $insert = [];
	protected $update = [];

	protected function setPositionAttr($value) {
		return implode(',', input('param.position/a', []));
	}
	protected function setPicAttr($value) {
		return $value ? $value : 0;
	}
	protected function setContentAttr($value) {
		return $value ? $value : '';
	}
	protected function setViewsAttr($value) {
		return $value ? $value : 0;
	}

}
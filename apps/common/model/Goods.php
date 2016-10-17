<?php
namespace app\common\model;

use think\Model;

class Goods extends Model {
	protected $auto   = ['pic', 'content', 'position'];
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

}
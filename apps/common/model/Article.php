<?php
namespace app\common\model;

use think\Model;

class Article extends Model {
	protected $auto   = ['content'];
	protected $insert = ['pic'];
	protected $update = [];

	protected function setPicAttr($value) {
		return $value ? $value : 0;
	}
	protected function setContentAttr($value) {
		return $value ? $value : '';
	}

}
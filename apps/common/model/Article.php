<?php
namespace app\common\model;

use think\Model;

class Article extends Model {
	protected $auto   = [];
	protected $insert = ['pic'];
	protected $update = [];

	protected function setPicAttr($value) {
		return $value ? $value : 0;
	}

}
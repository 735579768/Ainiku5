<?php
namespace app\common\model;

use think\Model;

class Single extends Model {
	protected $auto   = ['content'];
	protected $insert = [];
	protected $update = [];

	protected function setContentAttr($value) {
		return $value ? $value : '';
	}
}
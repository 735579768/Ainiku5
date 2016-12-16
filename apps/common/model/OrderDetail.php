<?php
namespace app\common\model;

use think\Model;

class OrderDetail extends Model {
	public function goods() {
		return $this->hasMany('Goods')->field('goods_id,title,pic');
	}
}
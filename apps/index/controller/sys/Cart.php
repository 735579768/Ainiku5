<?php
namespace app\index\controller\sys;
class Cart extends Base {
	/**
	 * 购物车列表
	 * @author 枫叶 <735579768@qq.com>
	 */
	public function index() {
		//$jon='__DB_PREFIX__goods as a   on  __DB_PREFIX__cart.goods_id=a.goods_id';
		// $map['uid']=UID;
		$list = $this->pages(array(
			'table' => 'Cart',
			'join'  => [
				['__GOODS__ b', 'a.goods_id=b.goods_id'],
			],
			'rows'  => 10,
			'where' => $map,
		));
		$this->meta_title = '购物车';
		return $this->fetch();
	}
	/**
	 *取当前用户购物车中的产品数量
	 */
	function getnum() {
		$resu = \think\Db::name('Cart')->where("uid=" . UID)->count();
		die($resu);
	}
	/**
	 *更新当前产品选中状态
	 */
	function setcheck() {
		$cart_id    = input('cart_id');
		$selected   = input('selected');
		$map        = array();
		$map['uid'] = UID;
		if (empty($cart_id)) {
			//如果id是空的话就把所有都清空
			$selected = 0;
		} else {
			$map['cart_id'] = array('in', "$cart_id");
		}
		$result = \think\Db::name('Cart')->where($map)->setField('selected', $selected);
		$this->success('设置成功');
	}
	/**
	 *更新当前用户产品的数量
	 */
	function updatenum() {
		$num     = intval(input('num'));
		$cart_id = intval(input('cart_id'));
		empty($cart_id) && $this->error('no');
		empty($num) && $this->error('no');
		$map['uid']     = UID;
		$map['cart_id'] = $cart_id;
		$resu           = \think\Db::name('Cart')->where($map)->update(array('num' => $num, 'update_time' => time()));
		if ($resu > 0) {
			$this->success('更新成功');
		} else {
			$this->error('没有更改');
		}
	}
	/**
	 *添加产品到购物车
	 **/
	function add($goods_id = '', $num = 0) {
		if ($this->request->isPost()) {
			$model               = model('Cart');
			$data['uid']         = UID;
			$data['create_time'] = time();
			$data['update_time'] = time();
			$data['goods_id']    = $goods_id;
			$data['num']         = $num;
			//查询下如果购物车里有的话就数量添加一个
			$resu = $model->field('cart_id,num')->where('uid=' . UID . '  and goods_id=' . $goods_id)->find();
			if (empty($resu)) {
				//购物车中没有这个产品
				$postdata = input('param.');
				$msg      = $model->validate($postdata, 'Cart');
				if ($msg === true) {
					$model->data($postdata);
					$result = $model->allowField(true)->save();
					if (0 < $result) {
						$this->success('添加产品到购物车成功');
					} else {
						$this->error('添加产品到购物车失败');
					}
				} else {
					//未知错误
					$this->error($msg);
				}
			} else {
				//购物车中有这个产品
				$result = $model->save(array(
					'cart_id' => $resu['cart_id'],
					'num'     => $resu['num'] + $num,
				));
				if ($result) {
					$this->success('添加成功');
				} else {
					$this->error('添加失败');
				}
			}
		} else {
			redirect('/');
		}

		die();
	}
	function del() {
		$cart_id = intval(input('cart_id'));
		if (empty($cart_id)) {
			$this->error('请先进行选择');
		}

		$model          = \think\Db::name('Cart');
		$map['cart_id'] = array('in', "$cart_id");
		$map['uid']     = UID;
		$result         = $model->where($map)->delete();
		if ($result > 0) {
			$this->success('已经从购物车删除');
		} else {
			$this->error('操作失败');
		}
	}
}

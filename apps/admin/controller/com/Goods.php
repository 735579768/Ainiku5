<?php
namespace app\admin\controller\com;

class Goods extends Base {

	/**
	 * 产品列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '产品列表');

		$map         = [];
		$category_id = input('param.category_id', 0);
		$title       = input('param.title', '');
		$starttime   = input('param.starttime');
		$endtime     = input('param.endtime');
		if ($starttime && $endtime) {
			empty($starttime) && ($starttime = date('Y-m-d', strtotime('-1 month')));
			empty($endtime) && ($endtime = date('Y-m-d', strtotime('+1 day')));
			$starttime            = strtotime($starttime);
			$endtime              = strtotime($endtime);
			$map['a.create_time'] = [['gt', $starttime], ['lt', $endtime]];
		}
		$title && ($map['a.title'] = ['like', "%{$title}%"]);
		$category_id && ($map['a.category_id'] = $category_id);
		$map['a.status'] = ['gt', -1];
		$this->pages([
			'table' => 'Goods',
			'where' => $map,
			'join'  => [
				['__CATEGORY__ b', 'a.category_id=b.category_id'],
			],
			'field' => 'a.*,b.title as category_title',
			'order' => 'a.update_time desc,goods_id desc',
		]);
		/**
		 * 初始化搜索条件
		 */
		$sear = [];
		$category_id && ($sear['category_id'] = $category_id);
		$title && ($sear['title'] = $title);
		$sear['starttime'] = $starttime;
		$sear['endtime']   = $endtime;
		$this->_search($sear);
		return $this->fetch();
	}

	/**
	 * 添加产品
	 * @return [type] [description]
	 */
	public function add() {
		return controller('Data', 'logic')->add('Goods');

	}
	/**
	 * 编辑产品
	 * @return [type] [description]
	 */
	public function edit() {
		return controller('Data', 'logic')->edit('Goods');
	}
	/**
	 * 删除产品
	 * @return [type] [description]
	 */
	public function delete() {
		return controller('Data', 'logic')->delete('Goods');
	}
	/**
	 * 移动产品到回收站
	 * @return [type] [description]
	 */
	public function del() {
		return controller('Data', 'logic')->del('Goods');
	}
	/**
	 * 回收站产品
	 * @return [type] [description]
	 */
	public function recycle() {
		$this->assign('meta_title', '产品回收站');
		$map         = [];
		$category_id = input('param.category_id', 0);
		$title       = input('param.title', '');
		$title && ($map['a.title'] = ['like', "%{$title}%"]);
		$map['a.status'] = -1;
		$category_id && ($map['a.category_id'] = $category_id);
		$this->pages([
			'table' => 'Goods',
			'where' => $map,
			'join'  => [
				['__CATEGORY__ b', 'a.category_id=b.category_id'],
			],
			'field' => 'a.*,b.title as category_title',
			'order' => 'a.update_time desc,goods_id desc',
		]);
		/**
		 * 初始化搜索条件
		 */
		$sear = [];
		$category_id && ($sear['category_id'] = $category_id);
		$title && ($sear['title'] = $title);
		$this->_search($sear);
		return $this->fetch();
	}
	/**
	 * 清理回收站产品
	 * @return [type] [description]
	 */
	public function clearup() {
		return controller('Data', 'logic')->clearUp('Goods');
	}
	/**
	 * 恢复回收站产品
	 * @return [type] [description]
	 */
	public function huifu() {
		return controller('Data', 'logic')->huifu('Goods');
	}
	/**
	 * 移动产品到其它分类
	 * @return [type] [description]
	 */
	public function move() {
		$ids         = input('param.id', '');
		$category_id = input('param.category_id', '');
		$ids || $this->error('id不能为空');
		if ($category_id) {
			$result = \think\Db::name('Goods')
				->where('goods_id', 'in', $ids)
				->update([
					'update_time' => time(),
					'category_id' => $category_id,
				]);
			if ($result) {
				add_user_log("移动产品", input('param.'));
				$this->success('产品移动成功', url('lis?category_id=' . $category_id));
			} else {
				$this->error('移动失败');
			}
		} else {
			if ($this->request->isAjax()) {
				$this->success('正在处理要移动的产品...', url('move?id=' . $ids));
			}
			$catetree = select_category(0, 'goods');
			unset($catetree[0]);
			$this->assign([
				'meta_title' => '移动产品',
				'ids'        => $ids,
				'data'       => null,
				'formarr'    => [
					'name'  => 'category_id',
					'title' => '请选择要移动到的分类',
					'type'  => 'select',
					'extra' => $catetree,
				],
			]);
			return $this->fetch();
		}

	}
	/**
	 * 搜索表单
	 * @return [type] [description]
	 */
	private function _search($data = null) {
		$this->assign([
			'searchform' => [
				[
					'type'    => 'string',
					'name'    => 'title',
					'title'   => '标题',
					'extra'   => '',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'select',
					'name'    => 'category_id',
					'title'   => '分类',
					'extra'   => select_category(0, 'goods'),
					'value'   => 0,
					'is_show' => 3,
				],
				[
					'type'    => 'datetime',
					'name'    => 'starttime',
					'title'   => '开始时间',
					'value'   => '',
					'is_show' => 3,
				],
				[
					'type'    => 'datetime',
					'name'    => 'endtime',
					'title'   => '结束时间',
					'value'   => '',
					'is_show' => 3,
				],
			],
			'data'       => $data,
		]);
	}

}

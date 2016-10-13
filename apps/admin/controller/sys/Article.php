<?php
namespace app\admin\controller\sys;

class Article extends Base {

	/**
	 * 文章列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '文章列表');

		$map         = [];
		$category_id = input('param.category_id', 0);
		$title       = input('param.title', '');
		$title && ($map['a.title'] = ['like', "%{$title}%"]);
		$category_id && ($map['a.category_id'] = $category_id);
		$this->pages([
			'table' => 'Article',
			'where' => $map,
			'join'  => [
				['__CATEGORY__ b', 'a.category_id=b.category_id'],
			],
			'field' => 'a.*,b.title as category_title',
			'order' => 'a.update_time desc,article_id desc',
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
	 * 添加文章
	 * @return [type] [description]
	 */
	public function add() {
		return controller('Data', 'logic')->add('Article');

	}
	/**
	 * 编辑文章
	 * @return [type] [description]
	 */
	public function edit() {
		return controller('Data', 'logic')->edit('Article');
	}
	/**
	 * 删除文章
	 * @return [type] [description]
	 */
	public function delete() {
		return controller('Data', 'logic')->delete('Article');
	}
	/**
	 * 移动文章到回收站
	 * @return [type] [description]
	 */
	public function del() {
		// return controller('Data', 'logic')->delete('Article');
	}
	/**
	 * 回收站文章
	 * @return [type] [description]
	 */
	public function recycle() {

	}
	/**
	 * 清理回收站文章
	 * @return [type] [description]
	 */
	public function clearup() {

	}
	/**
	 * 恢复回收站文章
	 * @return [type] [description]
	 */
	public function huifu() {

	}
	/**
	 * 移动文章到其它分类
	 * @return [type] [description]
	 */
	public function move() {

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
					'extra'   => select_category(),
					'value'   => 0,
					'is_show' => 3,
				],
			],
			'data'       => $data,
		]);
	}

}

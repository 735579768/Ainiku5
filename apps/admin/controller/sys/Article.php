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
		$category_id = input('param.category_id');
		$category_id && ($map['category_id'] = $category_id);
		$this->pages([
			'table' => 'Article',
			'where' => $map,
			'join'  => [
				['__CATEGORY__ b', 'a.category_id=b.category_id'],
			],
			'field' => 'a.*,b.title as category_title',
			'order' => 'a.update_time desc,article_id desc',
		]);
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
		return controller('Article', 'logic')->delete();
	}
}

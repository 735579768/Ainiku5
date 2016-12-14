<?php
namespace app\tool\controller\caiji;

class Article extends Base {
	public function index() {
		echo 'run tool';
	}
	/**
	 * 添加文章接口
	 */
	public function add() {
		if ($this->request->isPost()) {
			$postdata = input('param.');
			//添加
			$result = $this->validate($postdata, 'Article');
			if (true === $result) {
				$result = model('Article')
					->data($postdata)
					->allowField(true)
					->save();
				return $this->returnResult($result, '添加成功', '添加失败');
			} else {
				return $this->error($result);
			}

		} else {
			return $this->error('no');
		}
	}
	/**
	 * 取文章分类接口
	 * @return [type] [description]
	 */
	public function getCategory() {
		$list = \think\Db::name('Category')->where(['category_type' => "article"])->field('category_id,title')->select();
		return json($list);
	}
}

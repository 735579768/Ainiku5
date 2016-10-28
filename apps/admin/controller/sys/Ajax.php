<?php
namespace app\admin\controller\sys;

class Ajax extends Base {
	/**
	 * 取系统左边的菜单
	 * @param  integer $pid [description]
	 * @return [type]       [description]
	 */
	public function getLeftMenu($pid = 0) {
		$map['status'] = 1;

		if ($pid == 1) {
			$map['home'] = 1;
		} else {
			$map['pid'] = $pid;
		}
		$key  = 'sys_childmenu' . $pid;
		$data = \think\Cache::tag('mainchildmenu')->get($key);
		if (!$data || config('app_debug')) {
			$data = [];
			$list = \think\Db::name('Menu')
				->field('menu_id,title,url,group,icon_class')
				->where($map)
				->order('sort asc,menu_id asc')
				->select();
			foreach ($list as $key => $value) {
				$result = \ank\Auth::getInstance()->check($value['url']);
				if ($result) {
					$group = $value['group'];
					$group || ($group = '默认');
					$data[$group][] = ['title' => $value['title'], 'url' => url($value['url']), 'icon_class' => $value['icon_class']];
				}
			}
			\think\Cache::tag('mainchildmenu')->set($key, $data);
		}
		return $this->success('ok', '', $data);
	}
	/**
	 * 弹出层添加分类或标签
	 * @param integer $pid           [description]
	 * @param string  $category_type [description]
	 */
	public function addCategory() {
		$pid           = input('param.pid', 0);
		$category_type = input('param.category_type', 'article_tag');
		if (request()->isPost()) {
			//添加
			$result = $this->validate(input('param.'), 'Category');
			if (true === $result) {
				$mod    = model('Category');
				$result = $mod
					->data(input('param.'))
					->allowField(true)
					->save();
				// $this->returnResult($result, '添加成功', '添加失败');
				if ($result) {
					add_user_log('添加标签', input('param.'));
					$this->success('添加成功', '', ['id' => $mod->category_id, 'title' => input('param.title')]);
				} else {
					$this->error('添加失败');
				}
			} else {
				$this->error($result);
			}
		} else {
			$formarr = get_form_item('Category');
			foreach ($formarr as $key => $value) {
				$delkey = ['pid', 'category_type', 'meta_title', 'sort', 'status', 'meta_keywords', 'meta_descr', 'icon', 'list_tpl', 'detail_tpl'];
				if (in_array($value['name'], $delkey)) {
					unset($formarr[$key]);
				} else if ($value['name'] == 'title') {
					$formarr[$key]['title'] = '标签名称';
				} else if ($value['name'] == 'name') {
					$formarr[$key]['title'] = '标签的name标识';
				}
			}
			$formstr = '<div class="addcategory" style="padding:10px;"><form method="post" action="' . url('sys.ajax/addCategory?pid=0&category_type=' . $category_type) . '">';
			$formstr .= get_form_str($formarr, ['pid' => 0, 'category_type' => $category_type]);
			$formstr .= <<<eot
	        <div class="form-group cl center">
	            <a href="javascript:;" onclick="am.addTag(this);" class="btn btn-large">
	            确定添加
	            </a>
	        </div></form>
eot;
			$formstr .= '</div>';
			return $this->success('ok', '', $formstr);
		}

	}
}

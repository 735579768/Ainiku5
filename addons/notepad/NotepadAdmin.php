<?php
/**
 * 记事本后台调用控制器
 */
namespace addons\notepad;
class NotepadAdmin extends \app\common\controller\Addon {
	protected $config = array(
		'version' => '1.0.0',
		'author'  => 'zhaokeli',
		'title'   => '记事本',
		'descr'   => '便签本',
		'param'   => []
	);
	/**
	 * 初始化记事本
	 * @return [type] [description]
	 */
	public function init() {
		reg_css('addon/notepad/css/notepad');
		reg_js('jquery-drag,addon/notepad/js/notepad');
		// //当前页和上一页
		// $p = input('param.p', 1);
		// $this->assign([
		// 	'cur_p'  => $p,
		// 	'next_p' => $p + 1,
		// 	'prev_p' => ($p === 1) ? 1 : ($p - 1),
		// ]);
		// $map = null;
		// $this->pages(array(
		// 	'table' => 'AddonNotepad',
		// 	'where' => $map,
		// 	'order' => 'notepad_id desc',
		// 	'rows'  => 8,
		// 	'url'   => 'notepad/ajaxList',
		// ));
		echo $this->fetch('admin_index');
	}

	public function install() {
		$prefix = config('database.prefix');
		$sql    = <<<sql
				DROP TABLE IF EXISTS `{$prefix}addon_notepad`;
				CREATE TABLE `{$prefix}addon_notepad` (
				  `notepad_id` int(11) NOT NULL AUTO_INCREMENT,
				  `uid` int(11) DEFAULT 0,
				  `content` varchar(255) DEFAULT '',
				  `create_time` int(11) DEFAULT 0,
				  `update_time` int(11) DEFAULT 0,
				  PRIMARY KEY (`notepad_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;
sql;
		$arr = explode(';', $sql);
		foreach ($arr as $val) {
			if (!empty($val)) {
				\think\Db::execute($val);
			}

		}
		return true;
	}

	public function uninstall() {
		$prefix = config('database.prefix');
		$sql    = <<<sql
						DROP TABLE IF EXISTS `{$prefix}addon_notepad`;
sql;
		$arr = explode(';', $sql);
		foreach ($arr as $val) {
			if (!empty($val)) {
				\think\Db::execute($val);
			}

		}
		return true;
	}
	public function config() {
		$this->meta_title = '记事本设置';
		if (request()->isPost()) {
			$this->saveParam();
		} else {
			$formarr = [
				[
					'type'    => 'radio',
					'name'    => 'nickname',
					'title'   => '姓名',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '1',
					'is_show' => 3,
				],
				[
					'type'    => 'radio',
					'name'    => 'email',
					'title'   => '邮箱',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '1',
					'is_show' => 3,
				],
				[
					'type'    => 'radio',
					'name'    => 'url',
					'title'   => '地址',
					'extra'   => [
						1 => '显示',
						2 => '不显示',
					],
					'value'   => '1',
					'is_show' => 3,
				],
			];
			$this->assign([
				'formarr' => $formarr,
				'data'    => $this->getParam(),
			]);
			echo $this->fetch('notepad/admin_set');
		}
	}
	/**
	 * 编辑
	 * @return [type] [description]
	 */
	public function saveNotepad() {
		$notepad_id = input('param.notepad_id');
		if (request()->isPost()) {
			$model  = \think\Db::name('AddonNotepad');
			$result = 0;
			if (empty($notepad_id)) {
				$result = $model->insertGetId(array(
					'content'     => input('param.content'),
					'uid'         => UID,
					'create_time' => time(),
					'update_time' => time(),
				));
				if ($result > 0) {
					return json([
						'code' => 1,
						'msg'  => '添加成功',
						'data' => $this->getAjaxLists(),
					]);
				} else {
					$this->error('添加失败');
				}
			} else {
				$result = $model->where([
					'notepad_id' => $notepad_id,
				])->update([
					'content'     => input('param.content'),
					'update_time' => time(),
				]);
				if ($result > 0) {
					return json([
						'code' => 1,
						'msg'  => '更新成功',
						'data' => $this->getAjaxLists(),
					]);
				} else {
					$this->error('更新失败');
				}
			}

		}
	}
	private function getAjaxLists() {
		//当前页和上一页
		$p = input('param.p', 1);
		$this->assign('cur_p', $p);
		$this->assign('next_p', $p + 1);
		$this->assign('prev_p', ($p === 1) ? 1 : ($p - 1));
		$map = null;
		$this->pages(array(
			'table' => 'AddonNotepad',
			'where' => $map,
			'order' => 'notepad_id desc',
			'rows'  => 8,
			'url'   => 'notepad/ajaxList',
		));
		return $this->fetch('admin_ajaxlist');
	}
	public function ajaxList() {
		return json([
			'code' => 1,
			'msg'  => 'success',
			'data' => $this->getAjaxLists(),
		]);
	}
	public function edit() {
		$notepad_id = input('param.notepad_id');
		if (empty($notepad_id)) {
			$this->assign('info', null);
		} else {
			$info = \think\Db::name('AddonNotepad')->find($notepad_id);
			$this->assign('info', $info);
		}
		echo $this->fetch('admin_edit');
		die();
	}
	public function delNotepad() {
		$notepad_id = input('param.notepad_id');
		$result     = 0;
		if (!empty($notepad_id)) {
			$result = \think\Db::name('AddonNotepad')->delete($notepad_id);
		}
		if ($result > 0) {
			$this->success("删除成功<script>$('#notepad_{$notepad_id}').remove();</script>");
		} else {
			$this->error('删除失败');
		}
		die();
	}
	/**
	 * 记事本列表
	 * @return [type] [description]
	 */
	public function lis() {
		$map = null;
		$this->pages(array(
			'table' => 'AddonNotepad',
			'where' => $map,
			'order' => 'notepad_id desc',
		));
		return $this->fetch('admin_lis');
	}
	/**
	 * 后台菜单调用的入口
	 */
	public function set() {
		$this->assign(['meta_title' => '记事本列表']);
		echo $this->lis();
	}
}
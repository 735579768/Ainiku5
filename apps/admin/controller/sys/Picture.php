<?php
namespace app\admin\controller\sys;
use think\Db;

class Picture extends Base {

	/**
	 * 图片列表
	 * @return [type] [description]
	 */
	public function lis() {
		$this->assign('meta_title', '图片列表');
		$clientinfo = session('client');
		$rowss      = 24;
		if (isset($clientinfo['screenheight']) && $clientinfo['screenheight'] > 500) {
			$width = intval((intval($clientinfo['screenwidth']) - 130 - 50)) / 122;

			$height = intval((intval($clientinfo['screenheight']) - 250 - 120)) / 122;
			$rowss  = $width * $height;
			// config('list_rows', $rowss);
		}
		$rowss = max($rowss, 24);
		$this->pages([
			'table' => 'Picture',
			'where' => ['a.status' => 1],
			'order' => 'picture_id desc',
			'rows'  => $rowss,
		]);
		return $this->fetch();
	}
	//重新生成文件的sha1
	function resetSha1() {
		$list = cache('resetshalist');
		if (empty($list)) {
			add_user_log("生成图片sha1值", input('param.'));
			$list = Db::name('Picture')->field('picture_id,path')->select();
			cache('resetshalist', $list);
			cache('resetshalistnum', count($list));
		}
		$total = cache('resetshalistnum');
		$i     = 0;
		$num   = 50; //一次只处理50个数据
		foreach ($list as $key => $val) {
			$i++;
			$filepath = '.' . $val['path'];
			if (file_exists($filepath)) {
				$sha1 = sha1_file($filepath);
				Db::name('Picture')->where("picture_id={$val['picture_id']}")->update(['re_sha1' => $sha1, 'update_time' => time()]);
			}
			unset($list[$key]);
			if ($i > $num) {
				$num = count($list);
				cache('resetshalist', $list);
				$this->error('已经处理' . ($total - $num) . ',还有' . $num . '张');
			} else if (empty($list)) {
				cache('resetshalist', null);
				cache('resetshalistnum', null);
				$this->success('SHA1重置成功,总共有' . $total . '张图片', '');
				break;
			}

		}

	}
	//批量生成缩略图
	function greateThumb() {
		$list = cache('thumbpath');
		if (empty($list)) {
			add_user_log("生成图片缩略图", input('param.'));
			$list = Db::name('Picture')->field('picture_id,path')->select();
			cache('thumbpath', $list);
			cache('listnum', count($list));
		}
		//开始生成图片
		$jishu     = 0; //处理的总数量
		$sucstr    = ''; //成功字符串
		$failjishu = 0; //失败的数量
		$failstr   = ''; //错误字符串
		$total     = cache('listnum');

		$num  = 50; //一次只处理50个数据
		$i    = 0;
		$data = $list;
		foreach ($data as $key => $val) {
			$i++;
			$src_path  = '.' . $val['path'];
			$thumbpath = str_replace('image/', 'image/thumb/', $src_path);
			if (file_exists($src_path)) {
				$thumbsize            = config('thumb_size');
				$thumbsize            = explode('*', $thumbsize);
				list($width, $height) = $thumbsize;
				// var_dump($thumbsize);
				$result = create_thumb($src_path, $thumbpath, $width ?: 100, $height ?: 100);
				if ($result === true) {
					// Db::name('Picture')->where("id={$thumbpath[$i]}")->save(array('thumbpath' => $thupath));
					Db::name('Picture')
						->where("picture_id={$val['picture_id']}")
						->update([
							'thumbpath'   => trim($thumbpath, '.'),
							'update_time' => time(),
						]);
					$jishu++;
					$sucstr .= $src_path . '->' . $thumbpath . '<br>';
				} else {
					$failjishu++;
					$failstr .= $src_path . '->' . $thumbpath . '<br>';
				}
			} else {
				$failjishu++;
				$failstr .= '<span style="color:red;">' . $src_path . "此路径文件丢失数据库id为{$val['picture_id']}请联系管理员自行处理</span><br>";
			}
			unset($list[$key]);
			if ($i > $num) {
				$num = count($list);
				cache('thumbpath', $list);
				// $this->error('已经处理' . ($total - $num) . ',还有' . $num . '张');
				$str = "此进程成功生成{$jishu}个缩略图,失败{$failjishu}个。<br>{$failstr}";
				$this->error($str);
			} else if (empty($list)) {
				cache('thumbpath', null);
				$str = "最终成功生成{$jishu}个缩略图,失败{$failjishu}个。<br>{$failstr}";
				$this->success($str . '缩略图生成成功,总共有' . $total . '张图片', '');
				break;
			}
		}
		// $str = "成功生成{$jishu}个缩略图,失败{$failjishu}个,{$failstr},$tishistr";
		//
		// $tishistr = '全部完成';
		// if (count($thumbpath) <= 0) {
		// 	$info['status'] = 1;
		// } else {
		// 	$tishistr = '还剩' . count($thumbpath) . '个。继续生成中......';
		// }
		// cache('thumbpath', array_values($thumbpath));
		// $info['info'] = "成功生成{$jishu}个缩略图,失败{$failjishu}个,{$failstr},$tishistr";
		// $this->ajaxreturn($info);
		// exit();

	}
	/**
	 * 删除图片
	 * @return [type] [description]
	 */
	public function delete() {
		$form_id = input('param.form_id');
		$form_id || $this->error('id不能为空!');
		$list = \think\Db::name('PictureItem')
			->where('form_id', $form_id)
			->find();
		$list && $this->error('此图片下还有图片项,故不能删除!');
		controller('Data', 'logic')->delete('Picture', $form_id);
	}
}

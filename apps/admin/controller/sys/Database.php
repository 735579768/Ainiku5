<?php
namespace app\admin\controller\sys;
use think\Db;

class Database extends Base {
	/**
	 * 备份数据库
	 * @return [type] [description]
	 */
	public function export() {
		if (request()->isAjax()) {
			$this->_export();
		} else {

			$list = Db::query('SHOW TABLE STATUS');
			$list = array_map('array_change_key_case', $list);

			$this->assign([
				'meta_title' => '数据备份',
				'_list'      => $list,
			]);
			return $this->fetch();
		}
	}
	/**
	 * 导入数据库
	 * @return [type] [description]
	 */
	public function import() {
		if (request()->isAjax()) {
			$this->_import();
		} else {
			//列出备份文件列表
			$path = '.' . DATA_DIR . '/';
			$flag = \FilesystemIterator::KEY_AS_FILENAME;
			$glob = new \FilesystemIterator($path, $flag);

			$list = array();
			foreach ($glob as $name => $file) {
				if (preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)) {
					$name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');

					$date = "{$name[0]}-{$name[1]}-{$name[2]}";
					$time = "{$name[3]}:{$name[4]}:{$name[5]}";
					$part = $name[6];

					if (isset($list["{$date} {$time}"])) {
						$info         = $list["{$date} {$time}"];
						$info['part'] = max($info['part'], $part);
						$info['size'] = $info['size'] + $file->getSize();
					} else {
						$info['part'] = $part;
						$info['size'] = $file->getSize();
					}
					$extension        = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
					$info['compress'] = ($extension === 'SQL') ? '-' : $extension;
					$info['time']     = strtotime("{$date} {$time}");

					$list["{$date} {$time}"] = $info;
				}
			}
			$this->assign([
				'meta_title' => '数据还原',
				'_list'      => $list,
			]);
			return $this->fetch();
		}
	}
	/**
	 * 优化数据表
	 * @return [type] [description]
	 */
	public function optimize() {
		$tables = input('param.tables/a');
		if ($tables) {
			if (is_array($tables)) {
				$tables = implode('`,`', $tables);
				$list   = Db::query("OPTIMIZE TABLE `{$tables}`");

				if ($list) {
					$this->success("全部数据表优化完成！", '');
				} else {
					$this->error("数据表优化出错请重试！");
				}
			} else {
				$list = Db::query("OPTIMIZE TABLE `{$tables}`");
				if ($list) {
					$this->success("数据表'{$tables}'优化完成！", '');
				} else {
					$this->error("数据表'{$tables}'优化出错请重试！");
				}
			}
		} else {
			$this->error("请指定要优化的表！");
		}
	}
	/**
	 * 修复数据表
	 * @return [type] [description]
	 */
	public function repair() {
		$tables = input('param.tables/a');
		if ($tables) {
			if (is_array($tables)) {
				$tables = implode('`,`', $tables);
				$list   = Db::query("REPAIR TABLE `{$tables}`");

				if ($list) {
					$this->success("全部数据表修复完成！", '');
				} else {
					$this->error("数据表修复出错请重试！");
				}
			} else {
				$list = Db::query("REPAIR TABLE `{$tables}`");
				if ($list) {
					$this->success("数据表'{$tables}'修复完成！", '');
				} else {
					$this->error("数据表'{$tables}'修复出错请重试！");
				}
			}
		} else {
			$this->error("请指定要修复的表！");
		}
	}
	/**
	 * 执行导出数据库的操作
	 * @param  String  $tables 表名
	 * @param  Integer $id     表ID
	 * @param  Integer $start  起始行数
	 * @return [type]         [description]
	 */
	private function _export($tables = null, $id = null, $start = null) {
		$tables = input('param.tables/a');
		$id     = input('param.id', '');
		$start  = input('param.start');
		if (request()->isPost() && !empty($tables) && is_array($tables)) {
			//初始化
			//读取备份配置
			$config = array(
				//打包数据备份位置
				'path'     => './Data/',
				////数据库备份卷大小
				'part'     => 20971520,
				//数据库备份文件是否启用压缩0:不压缩1:启用压缩(压缩备份文件需要PHP环境支持gzopen,gzwrite函数)
				'compress' => 1,
				//数据库备份文件压缩级别(1:普通4:一般9:最高)(数据库备份文件的压缩级别，该配置在开启压缩时生效)
				'level'    => 9,
			);

			//检查是否有正在执行的任务
			$lock = "{$config['path']}backup.lock";
			//die(realpath(C('DATA_BACKUP_PATH')));
			if (is_file($lock)) {
				$this->error('检测到有一个备份任务正在执行，请稍后再试！');
			} else {
				//创建锁文件
				file_put_contents($lock, time());
			}

			//检查备份目录是否可写
			is_writeable($config['path']) || $this->error('备份目录不存在或不可写，请检查后重试！');
			session('backup_config', $config);

			//生成备份文件信息
			$file = array(
				'name' => date('Ymd-His', time()),
				'part' => 1,
			);
			session('backup_file', $file);

			//缓存要备份的表
			session('backup_tables', $tables);

			//创建备份文件
			$Database = new \ank\Database($file, $config);
			if (false !== $Database->create()) {
				$tab = array('id' => 0, 'start' => 0);
				$this->success('初始化成功！', '', array('tables' => $tables, 'tab' => $tab));
			} else {
				$this->error('初始化失败，备份文件创建失败！');
			}
		} elseif (request()->isGET() && is_numeric($id) && is_numeric($start)) {
			//备份数据
			$tables = session('backup_tables');
			//备份指定表
			$Database = new \ank\Database(session('backup_file'), session('backup_config'));
			$start    = $Database->backup($tables[$id], $start);
			if (false === $start) {
				//出错
				$this->error('备份出错！');
			} elseif (0 === $start) {
				//下一表
				if (isset($tables[++$id])) {
					$tab = ['id' => $id, 'start' => 0];
					$this->success('<span style="color:#00C700;">备份完成！</span>', '', ['tab' => $tab], '');
				} else {
					//备份完成，清空缓存
					unlink(session('backup_config.path') . 'backup.lock');
					session('backup_tables', null);
					session('backup_file', null);
					session('backup_config', null);
					//发送邮件附件到邮箱
					//			$result=send_mail(array(
					//				'to'=>'735579768@qq.com',
					//				'subject'=>"您的网站{$webzipname}已经打包完成",//主题标题
					//				'fromname'=>C('ADMIN_TITLE').'网站打包成功'.date('Y/m/d H:i:s'),//发件人
					//				'body'=>"您的网站{$webzipname}已经打包完成,下载地址为http://frame.loc".str_replace('./','/',$webzipname)//邮件内容
					//				//'attachment'=>str_replace('/','\\',$_SERVER['DOCUMENT_ROOT'].str_replace('./','/',$webzipname))
					//
					//			));
					// $tab = ['id' => $id, 'start' => 0];
					$this->success('<span style="color:#00C700;">备份完成！</span>', '');
				}
			} else {
				$tab  = array('id' => $id, 'start' => $start[0]);
				$rate = floor(100 * ($start[0] / $start[1]));
				$this->success("正在备份...({$rate}%)", '', array('tab' => $tab));
			}

		} else {
			//出错
			$this->error('参数错误！');
		}
	}
	/**
	 * 删除备份文件
	 * @param  Integer $time 备份时间
	 * @author 枫叶 <735579768@qq.com>
	 */
	public function delete($time = 0) {
		$time = input('param.time', 0);
		if ($time) {
			$name = date('Ymd-His', $time) . '-*.sql*';
			$path = './data/' . $name;
			array_map("unlink", glob($path));
			if (count(glob($path))) {
				$this->error('备份文件删除失败，请检查权限！', '');
			} else {
				$this->success('备份文件删除成功！', '');
			}
		} else {
			$this->error('参数错误！', '');
		}
	}
	/**
	 * 还原数据库
	 * @author 枫叶 <735579768@qq.com>
	 */
	public function _import($time = 0, $part = null, $start = null) {
		$time  = input('param.time', 0);
		$part  = input('param.part', null);
		$start = input('param.start', null);
		if (is_numeric($time) && is_null($part) && is_null($start)) {
			//初始化
			//获取备份文件信息
			$name  = date('Ymd-His', $time) . '-*.sql*';
			$path  = './data/' . $name;
			$files = glob($path);
			$list  = array();
			foreach ($files as $name) {
				$basename        = basename($name);
				$match           = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
				$gz              = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
				$list[$match[6]] = array($match[6], $name, $gz);
			}
			ksort($list);
			// var_dump($list);
			//检测文件正确性
			$last = end($list);
			if (count($list) === $last[0]) {
				session('backup_list', $list); //缓存备份列表
				$this->success('<span style="color:#00C700;">初始化完成！</span>', '', array('part' => 1, 'start' => 0));
			} else {
				$this->error('备份文件可能已经损坏，请检查！');
			}
		} elseif (is_numeric($part) && is_numeric($start)) {
			$list = session('backup_list');
			// $name = date('Ymd-His', $time) . '-*.sql*';
			$path = './data/';
			$db   = new \ank\Database($list[$part], array(
				'path'     => $path,
				'compress' => $list[$part][2]));

			$start = $db->import($start);

			if (false === $start) {
				$this->error('还原数据出错！');
			} elseif (0 === $start) {
				//下一卷
				if (isset($list[++$part])) {
					$data = array('part' => $part, 'start' => 0);
					$this->success("正在还原...#{$part}", '', $data);
				} else {
					session('backup_list', null);
					$this->success('<span style="color:#00C700;">还原完成！</span>', '');
				}
			} else {
				$data = array('part' => $part, 'start' => $start[0]);
				if ($start[1]) {
					$rate = floor(100 * ($start[0] / $start[1]));
					$this->success("正在还原...#{$part} ({$rate}%)", '', $data);
				} else {
					$data['gz'] = 1;
					$this->success("正在还原...#{$part}", '', $data);
				}
			}

		} else {
			$this->error('参数错误！', '');
		}
	}
}

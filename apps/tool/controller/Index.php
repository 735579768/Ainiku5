<?php
namespace app\tool\controller;
use think\Db;

class Index {
	private $config = [
		'db1' => [
			// 数据库类型
			'type'     => 'mysql',
			// 数据库连接DSN配置
			'dsn'      => '',
			// 服务器地址
			'hostname' => '127.0.0.1',
			// 数据库名
			'database' => 'zhaokeli.com',
			// 数据库用户名
			'username' => 'root',
			// 数据库密码
			'password' => 'adminrootkl',
			// 数据库连接端口
			'hostport' => '3306',
			// 数据库连接参数
			'params'   => [],
			// 数据库编码默认采用utf8
			'charset'  => 'utf8',
			// 数据库表前缀
			'prefix'   => 'kl_',
		],
		'db2' => [
			// 数据库类型
			'type'     => 'mysql',
			// 数据库连接DSN配置
			'dsn'      => '',
			// 服务器地址
			'hostname' => '127.0.0.1',
			// 数据库名
			'database' => 'zhaokeli_db',
			// 数据库用户名
			'username' => 'root',
			// 数据库密码
			'password' => 'adminrootkl',
			// 数据库连接端口
			'hostport' => '3306',
			// 数据库连接参数
			'params'   => [],
			// 数据库编码默认采用utf8
			'charset'  => 'utf8',
			// 数据库表前缀
			'prefix'   => 'kl_',
		],
	];
	public function index() {
		// var_dump($this->_getAllField('kl_article'));
		// $this->moveArticle();
		// $this->moveCategory();
		// $this->moveRes();
		// $this->moveNav();
		return 'ok';
	}
	/**
	 * 连接一个数据库
	 * @param  string $dbkey [description]
	 * @return [type]        [description]
	 */
	private function _getDb($dbkey = 'db1') {
		return Db::connect($this->config[$dbkey]);
	}
	/**
	 * 取一个数据库中的某个表的所有字段列表
	 * @param  string $table_name 表全名,带前缀
	 * @param  string $conid      本类中的数据库数据连接配置key
	 * @return [type]             返回数组
	 */
	private function _getAllField($table_name = '', $conid = 'db2') {
		if (!isset($this->config[$conid])) {
			return [];
		}
		$fieldlist = $this->_getDb($conid)->query("SHOW COLUMNS FROM $table_name ");
		$flist     = [];
		if (!$fieldlist) {
			return null;
		}
		foreach ($fieldlist as $k => $v) {
			$v       = array_change_key_case($v);
			$flist[] = $v['field'];
		}
		return $flist;
	}
	/**
	 * 转移文章
	 * @return [type] [description]
	 */
	private function moveArticle() {
		$this->_getDb('db1')->name('Article')->where('1=1')->delete();
		//转移用户表数据
		$field1 = $this->_getAllField('kl_article', 'db1');
		// $field2   = $this->_getAllField('kl_article', 'db2');
		$datalist = $this->_getDb('db2')->name('Article')->select();
		$adddata  = null;
		foreach ($datalist as $key => $value) {
			$tem = null;
			foreach ($field1 as $k => $v) {
				$tem[$v] = empty($value[$v]) ? '' : $value[$v];
			}
			$tem['content']     = str_replace('/Uploads', '/uploads', $tem['content']);
			$tem['position']    = ltrim($tem['position'], '0,');
			$tem['category_id'] = $tem['category_id'] - 193;
			// $adddata[]      = $tem;
			$this->_getDb('db1')->name('Article')->insert($tem);
		}
		// dump($adddata);

		// $datalist =
	}

	/**
	 * 添加文章标签和分类
	 */
	private function moveCategory() {
		// $tag     = '245:Sublime,246:jquery插件,204:css,216:js特效,218:正则,219:Android,220:eclipse,248:php报错,224:PHP函数,226:C++,234:ASP函数,247:kindeditor,242:伪静态,249:备案,251:js异常,252:destoon,253:duilib,254:c++错误,255:boost,256:脚本,257:canvas,258:Apache,259:js函数,260:ecshop,261:GD,262:Thinkphp,263:Ubuntu,264:易语言,265:nodejs,266:socket.io,267:谷歌扩展,268:EJS模板,269:Express,270:Linux命令,271:Centos,272:Python,273:PyQt5,274:HTML5,275:Composer,276:加密解密,277:LESS,278:批处理(bat),279:网络安全,280:微信开发,281:Git,282:SVN';
		$tag     = $this->_getDb('db2')->name('ModelAttr')->where(['model_attr_id' => 11])->field('extra')->find();
		$tag     = explode(',', $tag['extra']);
		$adddata = [];
		//添加标签
		foreach ($tag as $key => $value) {
			if (!$value) {
				continue;
			}
			$tem       = explode(':', $value);
			$adddata[] = [
				'category_id'   => $tem[0],
				'pid'           => 0,
				'name'          => '',
				'title'         => $tem[1],
				'category_type' => 'article_tag',
				'status'        => 1,
				'create_time'   => time(),
				'update_time'   => time(),
			];
		}
		//插入分类
		$datalist = $this->_getDb('db2')->name('Category')->field('category_id,name,title')->select();
		foreach ($datalist as $key => $value) {
			$adddata[] = [
				'category_id'   => $value['category_id'] - 193,
				'pid'           => 0,
				'name'          => $value['name'],
				'title'         => $value['title'],
				'category_type' => 'article',
				'status'        => 1,
				'create_time'   => time(),
				'update_time'   => time(),
			];
		}
		// dump($adddata);
		$this->_getDb('db1')->name('Category')->where('1=1')->delete();
		$result = $this->_getDb('db1')->name('Category')->insertAll($adddata);
	}
	/**
	 * 移动图片和文件
	 * @return [type] [description]
	 */
	function moveRes() {
		$datalist = $this->_getDb('db2')->name('Picture')->select();
		//移图片
		$adddata = [];
		$this->_getDb('db1')->name('Picture')->where('1=1')->delete();
		foreach ($datalist as $key => $value) {
			$adddata = [
				'picture_id'  => $value['id'],
				'uid'         => 1,
				'srcname'     => $value['srcname'] ? $value['srcname'] : '',
				'destname'    => $value['destname'] ? $value['destname'] : '',
				'path'        => strtolower($value['path']),
				'thumbpath'   => strtolower($value['thumbpath']),
				'status'      => 1,
				'extra'       => $value['from'] ? $value['from'] : '',
				'sha1'        => $value['sha1'] ? $value['sha1'] : '',
				'create_time' => time(),
				'update_time' => time(),
			];
			$this->_getDb('db1')->name('Picture')->insert($adddata);
		}
		// dump($adddata);

		//移文件
		$datalist = $this->_getDb('db2')->name('File')->select();
		$adddata  = [];
		foreach ($datalist as $key => $value) {
			$adddata[] = [
				'file_id'     => $value['id'],
				'uid'         => 1,
				'srcname'     => $value['srcname'],
				'destname'    => $value['destname'],
				'path'        => strtolower($value['path']),
				'size'        => $value['size'],
				'create_time' => time(),
				'update_time' => time(),
			];
		}
		// dump($adddata);
		$this->_getDb('db1')->name('File')->where('1=1')->delete();
		$result = $this->_getDb('db1')->name('File')->insertAll($adddata);
	}
	function moveNav() {
		$datalist = $this->_getDb('db2')->name('Nav')->select();
		//移图片
		$adddata = [];
		foreach ($datalist as $key => $value) {
			$adddata[] = [
				'nav_id'      => $value['nav_id'],
				'pid'         => $value['pid'],
				'title'       => $value['title'],
				'url'         => $value['url'],
				'sort'        => $value['sort'],
				'target'      => $value['target'],
				'status'      => $value['status'],
				'create_time' => time(),
				'update_time' => time(),
			];
		}
		// dump($adddata);
		$this->_getDb('db1')->name('Nav')->where('1=1')->delete();
		$result = $this->_getDb('db1')->name('Nav')->insertAll($adddata);
	}
	/**
	 * 从旧数据库导入数据到新数据库
	 * 转移地址http://oasis.loc/kefu.php?m=Admin&c=Ostool&a=moveData
	 */
	public function moveData() {
		// $con_lc = 'mysql://root:123456@localhost:3306/oxisi#utf8';
		// $con_yc = 'mysql://root:123456@localhost:3306/yc_oxisi#utf8';
		//先清空本地数据表
		$deltable = ['Article'];
		foreach ($deltable as $key => $value) {
			$result = Db::connect($this->config['db1'])->name($value)->where('1=1')->delete();
		}
		//需要转移数据的用户表
		$movetable = ['Article'];
		foreach ($movetable as $key => $value) {
			//清除本地数据
			Db::connect($this->config['db1'])->name($value)->where('1=1')->delete();
			var_dump($value . ' : ' . $this->moveTableData($value));
		}

	}
}

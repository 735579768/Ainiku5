<?php
namespace ank;
/**
 * 快递查询类
 */
class Kuaidi {
	private $type = 1;
	public function __construct($type = 1) {
		$this->type = $type;
	}
	/**
	 * 取物流信息
	 * @param  string $wuliu_sn   物流单号
	 * @param  string $wuliu_name 物流名字
	 * @return [type]             返回一个物流路由信息
	 */
	public function get_wuliu($wuliu_sn = '', $wuliu_name = '') {
		$wuliu_name = strtolower($wuliu_name);
		$wuliu_sn   = strtolower($wuliu_sn);
		if ($this->type == 1) {
			return $this->get_kuaidi_wuliu($wuliu_sn, $wuliu_name);
		} else {
			return $this->get_kuaidi100_wuliu($wuliu_sn, $wuliu_name);
		}

	}
	/**
	 * http://www.kuaidi.com/
	 * 查询快递物流信息
	 * @param  string $wuliu_sn   [description]
	 * @param  string $wuliu_name [description]
	 * @return [type]             [description]
	 */
	private function get_kuaidi_wuliu($wuliu_sn = '', $wuliu_name = 'yuantong') {
		$kuaidi = [
			'yuantong'       => '圆通',
			'ems'            => 'EMS(中国件国内)',
			'zhongtong'      => '中通',
			'yunda'          => '韵达',
			'shunfeng'       => '顺丰',
			'shentong'       => '申通',
			'tiantian'       => '天天',
			'huitongkuaidi'  => '百世',
			'youzhengguonei' => '邮政',
			'debangwuliu'    => '德邦',
		];
		foreach ($kuaidi as $key => $value) {
			$key   = strtolower($key);
			$value = strtolower($value);
			if (strpos($key, $wuliu_name) !== false || strpos($wuliu_name, $value) !== false) {
				$wuliu_name = $key;
				break;
			}
		}
		$uri  = "http://www.kuaidi.com/index-ajaxselectcourierinfo-{$wuliu_sn}-{$wuliu_name}.html";
		$data = json_decode(file_get_contents($uri), true);
		if ($data['success']) {
			return ['status' => 1, 'info' => $data['data']];
		} else {
			return ['status' => 0, 'info' => $data['reason']];
		}
	}

	/**
	 * http://www.kuaidi.com/
	 * 查询快递物流信息
	 * @param  string $wuliu_sn   [description]
	 * @param  string $wuliu_name [description]
	 * @return [type]             [description]
	 */
	private function get_kuaidi100_wuliu($wuliu_sn = '', $wuliu_name = 'yuantong') {
		$kuaidi = [
			'yuantong'          => '圆通',
			'shentong'          => '申通',
			'shunfeng'          => '顺丰',
			'yunda'             => '韵达',
			'debangwuliu'       => '德邦', //物流
			'zhongtong'         => '中通',
			'huitongkuaidi'     => '百世',
			'youzhengguonei'    => '邮政包裹',
			'ems'               => 'EMS',

			'aolau'             => 'AOL澳通速递',
			'a2u'               => 'A2U速递',
			'aae'               => 'AAE', //快递
			'annengwuliu'       => '安能', //物流
			'anxl'              => '安迅', //物流
			'auexpress'         => '澳邮中国快运',
			'exfresh'           => '安鲜达',
			'bcwelt'            => 'BCWELT',
			'yzgn'              => '包裹/平邮/挂号信',
			'balunzhi'          => '巴伦支', //快递
			'xiaohongmao'       => '北青小红帽',
			'htky'              => '百世', //快递
			'bfdf'              => '百福东方', //物流
			'bangsongwuliu'     => '邦送', //物流
			'lbbk'              => '宝凯', //物流
			'bqcwl'             => '百千诚', //物流
			'byht'              => '博源恒通',
			'idada'             => '百成大达', //物流
			'baishiwuliu'       => '百世快运',
			'baitengwuliu'      => '百腾', //物流
			'birdex'            => '笨鸟海淘',
			'bsht'              => '百事亨通',
			'benteng'           => '奔腾', //物流

			'coe'               => 'COE（东方快递）',
			'cloudexpress '     => 'CE易欧通国际速递',
			'city100'           => '城市100',
			'chuanxiwuliu'      => '传喜', //物流
			'chengjisudi'       => '城际速递',
			'lijisong'          => '成都立即送',
			'chukou1'           => '出口易',
			'nanjingshengbang'  => '晟邦', //物流
			'flyway'            => '程光', //快递

			'dhl'               => 'DHL快递（中国件）',
			'dhlen'             => 'DHL（国际件）',
			'dhlde'             => 'DHL（德国件）',
			'dbwl'              => '德邦',
			'dtwl'              => '大田', //物流
			'coe'               => '东方', //快递
			'disifang'          => '递四方',
			'dayangwuliu'       => '大洋', //物流
			'diantongkuaidi'    => '店通', //快递
			'dechuangwuliu'     => '德创', //物流
			'donghong'          => '东红', //物流
			'dskd'              => 'D速', //物流
			'donghanwl'         => '东瀚', //物流
			'dfpost'            => '达方', //物流
			'dongjun'           => '东骏快捷', //物流
			'dindon'            => '叮咚澳洲转运',
			'dazhong'           => '大众佐川急便',
			'ahdf'              => '德方', //物流
			'decnlh'            => '德中', //快递
			'dekuncn'           => '德坤供应链',
			'dasu'              => '达速', //物流

			'ems'               => 'EMS快递查询',
			'emsguoji'          => 'EMS国际快递查询',
			'eshunda'           => '俄顺达',
			'ewe'               => 'EWE全球', //快递

			'fedex'             => 'FedEx快递查询',
			'fedex'             => 'FedEx国际件',
			'fedexus'           => 'FedEx（美国）',
			'fox'               => 'FOX国际速递',
			'rufengda'          => '凡客如风达',
			'fkd'               => '飞康达', //物流
			'feibaokuaidi'      => '飞豹', //快递
			'feihukuaidi'       => '飞狐', //快递
			'fanyukuaidi'       => '凡宇速递',
			'fandaguoji'        => '颿达国际',
			'feiyuanvipshop'    => '飞远配送',
			'hnfy'              => '飞鹰', //物流
			'fengxingtianxia'   => '风行天下',
			'flysman'           => '飞力士', //物流
			'fbkd'              => '飞邦', //快递
			'sccod'             => '丰程', //物流
			'farlogistis'       => '泛远国际', //物流

			'gaticn'            => 'GATI', //快递
			'gts'               => 'GTS', //快递
			'guotongkuaidi'     => '国通', //快递
			'yzgj'              => '国际邮件查询',
			'ndkd'              => '港中能达', //物流
			'yzgn'              => '挂号信/国内邮件',
			'gongsuda'          => '共速达',
			'gtongsudi'         => '广通速递（山东）',
			'suteng'            => '速腾', //物流
			'gdkd'              => '港快速递',
			'hre'               => '高铁速递',
			'gda'               => '冠达', //快递

			'tdhy'              => '华宇', //物流
			'hl'                => '恒路', //物流
			'hlyex'             => '好来运', //快递
			'hxl'               => '华夏龙', //物流
			'tt'                => '海航天天',
			'hebeijianhua'      => '河北建华',
			'haimengsudi'       => '海盟速递',
			'huaqikuaiyun'      => '华企快运',
			'haosheng'          => '昊盛', //物流
			'hutongwuliu'       => '户通', //物流
			'hzpl'              => '华航', //快递
			'huangmajia'        => '黄马甲', //快递
			'ucs'               => '合众速递（UCS）',
			'pfcexpress'        => '皇家', //物流
			'huoban'            => '伙伴', //物流
			'nedahm'            => '红马速递',
			'huiwen'            => '汇文配送',
			'nmhuahe'           => '华赫', //物流
			'hjs'               => '猴急送',
			'hangyu'            => '航宇', //快递
			'huilian'           => '辉联', //物流
			'huanqiu'           => '环球速运',
			'huada'             => '华达快运',
			'htwd'              => '华通务达', //物流
			'hipito'            => '海派通',
			'hqtd'              => '环球通达',
			'airgtc'            => '航空', //快递
			'haoyoukuai'        => '好又快', //物流
			'ccd'               => '河南次晨达',
			'hfwuxi'            => '和丰同城',
			'skypost'           => '荷兰 Sky Post',
			'hongxun'           => '鸿讯物流 ',
			'hongjie'           => '宏捷国际', //物流
			'httx56'            => '汇通天下', //物流
			'lqht'              => '恒通', //快递

			'iparcel'           => 'i-parcel',

			'jjwl'              => '佳吉', //物流
			'jywl'              => '佳怡', //物流
			'jymwl'             => '加运美', //快递
			'jxd'               => '急先达', //物流
			'jgsd'              => '京广速递快件',
			'jykd'              => '晋越', //快递
			'jd'                => '京东', //快递
			'jietekuaidi'       => '捷特', //快递
			'jiuyicn'           => '久易', //快递
			'jiuyescm'          => '九曳供应链',
			'junfengguoji'      => '骏丰国际速递',
			'jiajiatong56'      => '佳家通',
			'jrypex'            => '吉日优派',
			'jinchengwuliu'     => '锦程国际', //物流
			'jgwl'              => '景光', //物流
			'pzhjst'            => '急顺通',
			'ruexp'             => '捷网俄全通',
			'jialidatong'       => '嘉里大通',
			'jmjss'             => '金马甲',

			'kjkd'              => '快捷', //快递
			'kangliwuliu'       => '康力', //物流
			'kuayue'            => '跨越速运',
			'kuaiyouda'         => '快优达速递',
			'kuaitao'           => '快淘', //快递

			'lianb'             => '联邦快递（国内）',
			'lhtwl'             => '联昊通', //物流
			'lb'                => '龙邦速递',
			'lejiedi'           => '乐捷递',
			'lijisong'          => '立即送',
			'lanhukuaidi'       => '蓝弧', //快递
			'ltexp'             => '乐天速递',
			'lutong'            => '鲁通快运',
			'ledii'             => '乐递供应链',
			'lundao'            => '论道国际', //物流

			'mh'                => '民航', //快递
			'meiguokuaidi'      => '美国', //快递
			'menduimen'         => '门对门',
			'mingliangwuliu'    => '明亮', //物流
			'minbangsudi'       => '民邦速递',
			'minshengkuaidi'    => '闽盛', //快递
			'mailikuaidi'       => '麦力', //快递
			'yundaexus'         => '美国韵达',
			'mchy'              => '木春货运',
			'meiquick'          => '美快国际', //物流

			'ndkd'              => '能达速递',
			'nuoyaao'           => '偌亚奥国际',

			'euasia'            => '欧亚专线',

			'pcaexpress'        => 'PCA Express',
			'pingandatengfei'   => '平安达腾飞',
			'peixingwuliu'      => '陪行', //物流

			'qfkd'              => '全峰', //快递
			'qy'                => '全一', //快递
			'qrt'               => '全日通', //快递
			'qckd'              => '全晨', //快递
			'sevendays'         => '7天连锁', //物流
			'qbexpress'         => '秦邦快运',
			'quanxintong'       => '全信通', //快递
			'quansutong'        => '全速通国际', //快递
			'qinyuan'           => '秦远', //物流
			'qichen'            => '启辰国际', //物流
			'quansu'            => '全速快运',
			'qzx56'             => '全之鑫', //物流
			'qskdyxgs'          => '千顺', //快递
			'runhengfeng'       => '全时速运',

			'rufengda'          => '如风达', //快递
			'riyuwuliu'         => '日昱', //物流
			'rfsd'              => '瑞丰速递',
			'rrs'               => '日日顺', //物流
			'rytsd'             => '日益通速递',
			'ruidaex'           => '瑞达国际速递',

			'st'                => '申通', //快递
			'sf'                => '顺丰速运',
			'sewl'              => '速尔', //快递
			'haihongwangsong'   => '山东海红',
			'sh'                => '盛辉', //物流
			'shiyunkuaidi'      => '世运', //快递
			'sfwl'              => '盛丰', //物流
			'shangda'           => '上大', //物流
			'stsd'              => '三态速递',
			'saiaodi'           => '赛澳递',
			'ewl'               => '申通E', //物流
			'shenganwuliu'      => '圣安', //物流
			'sxhongmajia'       => '山西红马甲',
			'suijiawuliu'       => '穗佳', //物流
			'syjiahuier'        => '沈阳佳惠尔',
			'shlindao'          => '上海林道货运',
			'sfift'             => '十方通', //物流
			'gtongsudi'         => '山东广通速递',
			'shunjiefengda'     => '顺捷丰达',
			'subida'            => '速必达', //物流
			'stcd'              => '速通成达', //物流
			'suteng'            => '速腾', //快递
			'stkd'              => '顺通', //快递
			'sendtochina'       => '速递中国',
			'suning'            => '苏宁', //快递
			'sihaiet'           => '四海', //快递

			'tnt'               => 'TNT', //快递
			'tt'                => '天天', //快递
			'tdhy'              => '天地华宇',
			'tonghetianxia'     => '通和天下',
			'tianzong'          => '天纵', //物流
			'chinatzx'          => '同舟行', //物流
			'nntengda'          => '腾达速递',
			'sd138'             => '泰国138',
			'tongdaxing'        => '通达兴', //物流
			'tlky'              => '天联快运',

			'ups'               => 'UPS快递查询',
			'ups'               => 'UPS国际', //快递
			'yskd'              => 'UC优速', //快递
			'usps'              => 'USPS美国邮政',
			'ueq'               => 'UEQ', //快递

			'wxwl'              => '万象', //物流
			'weitepai'          => '微特派',
			'wjwl'              => '万家', //物流
			'wanboex'           => '万博', //快递
			'wtdchina'          => '威时沛运',
			'wzhaunyun'         => '微转运',
			'gswtkd'            => '万通', //快递
			'wotu'              => '渥途国际速运',

			'xiyoutekuaidi'     => '希优特', //快递
			'xbwl'              => '新邦', //物流
			'xfwl'              => '信丰', //物流
			'newegg'            => '新蛋', //物流
			'xianglongyuntong'  => '祥龙运通', //物流
			'xianchengliansudi' => '西安城联速递',
			'xilaikd'           => '喜来', //快递
			'xsrd'              => '鑫世锐达',
			'xtb'               => '鑫通宝', //物流
			'xintianjie'        => '信天捷', //快递
			'xaetc'             => '西安胜峰',
			'xianfeng'          => '先锋', //快递
			'sunspeedy'         => '新速航',
			'xipost'            => '西邮寄',
			'sinatone'          => '信联通',
			'sunjex'            => '新杰', //物流

			'yt'                => '圆通速递',
			'yd'                => '韵达快运',
			'ytkd'              => '运通', //快递
			'yzgn'              => '邮政国内',
			'yzgj'              => '邮政国际',
			'ycwl'              => '远成', //物流
			'yfsd'              => '亚风速递',
			'yskd'              => '优速', //快递
			'yishunhang'        => '亿顺航',
			'yfwl'              => '越丰', //物流
			'yad'               => '源安达', //快递
			'yfh'               => '原飞航', //物流
			'ems'               => '邮政EMS速递',
			'yinjiesudi'        => '银捷速递',
			'yitongfeihong'     => '一统飞鸿',
			'yuxinwuliu'        => '宇鑫', //物流
			'yitongda'          => '易通达',
			'youbijia'          => '邮必佳',
			'yiqiguojiwuliu'    => '一柒', //物流
			'yinsu'             => '音素快运',
			'yilingsuyun'       => '亿领速运',
			'yujiawuliu'        => '煜嘉', //物流
			'gml'               => '英脉', //物流
			'leopard'           => '云豹国际货运',
			'czwlyn'            => '云南中诚',
			'sdyoupei'          => '优配速运',
			'yongchang'         => '永昌', //物流
			'yufeng'            => '御风速运',
			'yamaxunwuliu'      => '亚马逊', //物流
			'yousutongda'       => '优速通达',
			'yongwangda'        => '永旺达', //快递
			'yingchao'          => '英超', //物流
			'edlogistics'       => '益递', //物流
			'yjxlm'             => '宜家行',
			'onehcang'          => '一号仓',
			'ycgky'             => '远成快运',
			'lineone'           => '一号线',
			'ypsd'              => '壹品速递',
			'qexpress'          => '易达通', //快递
			'vipexpress'        => '鹰运国际速递',
			'el56'              => '易联通达', //物流
			'yyqc56'            => '一运全成', //物流

			'zt'                => '中通', //快递
			'zjs'               => '宅急送',
			'ztky'              => '中铁快运',
			'ztwl'              => '中铁', //物流
			'zywl'              => '中邮', //物流
			'coe'               => '中国东方(COE)',
			'zhimakaimen'       => '芝麻开门',
			'yzgn'              => '中国邮政', //快递
			'zhengzhoujianhua'  => '郑州建华',
			'zhongsukuaidi'     => '中速快件',
			'zhongtianwanyun'   => '中天万运',
			'zhongruisudi'      => '中睿速递',
			'zhongwaiyun'       => '中外运速递',
			'zengyisudi'        => '增益速递',
			'sujievip'          => '郑州速捷',
			'ztong'             => '智通', //物流
			'zhichengtongda'    => '至诚通达', //快递
			'zhdwl'             => '众辉达', //物流
			'kuachangwuliu'     => '直邮易',
			'topspeedex'        => '中运全速',
			'otobv'             => '中欧快运',
			'zsky123'           => '准实快运',
		];
		foreach ($kuaidi as $key => $value) {
			$key   = strtolower($key);
			$value = strtolower($value);
			if (strpos($key, $wuliu_name) !== false || strpos($wuliu_name, $value) !== false) {
				$wuliu_name = $key;
				break;
			}
		}
		$uri  = "http://m.kuaidi100.com/query?type={$wuliu_name}&postid={$wuliu_sn}";
		$data = json_decode(file_get_contents($uri), true);
		if ($data['status'] == '200') {
			return ['status' => 1, 'info' => $data['data']];
		} else {
			return ['status' => 0, 'info' => $data['message']];

		}
	}
}
// $wuliu = new Kuaidi();
// $data  = $wuliu->get_wuliu('dd0711212620', 'yuantong');
// var_dump($data);
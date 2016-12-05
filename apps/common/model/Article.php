<?php
namespace app\common\model;

use think\Model;

class Article extends Model {
	protected $auto   = ['pic', 'content', 'meta_keywords', 'meta_descr', 'position', 'views'];
	protected $insert = [];
	protected $update = [];
	//注册模型事件
	protected static function init() {
		Article::event('after_insert', function ($article) {
			$baidu_push = config('baidu_push_article');

			if ($baidu_push) {
				$arr = explode('|', $baidu_push);
				if (count($arr) !== 3) {
					return true;
				}
				list($site, $token, $link) = $arr;
				$article_id                = $article->article_id;
				//提交给百度
				/**
				 * 每天提交的配额是有限的,最好不要提交重复的链接
				 * @var string
				 */
				// $site  = 'www.zhaokeli.com';
				// $token = 'j8pptT7xaAxv7tPc';
				$urls    = [str_replace('{id}', $article_id, $link)];
				$api     = "http://data.zz.baidu.com/urls?site={$site}&token=$token";
				$ch      = curl_init();
				$options = array(
					CURLOPT_URL            => $api,
					CURLOPT_POST           => true,
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_POSTFIELDS     => implode("\n", $urls),
					CURLOPT_HTTPHEADER     => array('Content-Type: text/plain'),
				);
				curl_setopt_array($ch, $options);
				$result = curl_exec($ch);
				// echo $result;
				return true;
				//如果返回false就不会再向下执行啦
				// if ($article->status != 1) {
				// 	return false;
				// }
			}
		});
	}
	protected function setPositionAttr($value) {
		return implode(',', input('param.position/a', []));
	}
	protected function setContentAttr($value) {
		return $this->_filterLink($value);
	}
	protected function setViewsAttr($value) {
		return $value ? $value : 0;
	}
	protected function setPicAttr($value) {
		if ($value) {
			return $value;
		}
		$content = input('param.content');
		if ($content) {
			//提取第一张图片到封面
			if (!$value) {
				return $this->_getFirstPicture($content);
			}

		} else {
			return $value ? $value : 0;
		}
	}
	protected function setMetaKeywordsAttr($value) {
		if ($value) {
			return $value;
		}
		$title   = input('param.title');
		$content = input('param.content');
		$content = strip_tags($content);
		$fc      = $this->_fenci($title);
		if ($content) {
			$fc .= $fc ? ',' . $this->_fenci($content, 5, false) : $this->_fenci($content, 5, false);
		}
		//去掉其中只有一个字的情况
		$arr = explode(',', $fc);
		foreach ($arr as $key => $value) {
			if ($this->_strlen($value) == 1) {
				unset($arr[$key]);
			}
		}
		return implode(',', $arr);
	}
	private function _strlen($str) {
		preg_match_all("/./us", $str, $matches);
		return count(current($matches));
	}
	/**
	 * 过滤外链
	 * @param [type] $value [description]
	 */
	private function _filterLink($str) {
		if (!$str) {
			return '';
		}
		if (config('filter_link') == '0') {
			return $str;
		}
		//取域名白名单
		$domain = config('allow_domain');
		$arr    = explode(',', $domain);
		preg_match_all('/<a.*?href\=\"(.*?)\".*?>(.*?)<\/a>/', $str, $match);
		// dump($match);
		if ($match) {
			foreach ($match[1] as $key => $value) {
				$info = parse_url($value);
				// echo $value;
				if (isset($info['host']) && !in_array($info['host'], $arr)) {
					$str = str_replace($match[0][$key], $match[2][$key], $str);
				}
			}
		}
		return $str;

	}
	protected function setMetaDescrAttr($value) {
		if ($value) {
			return $value;
		}
		$content = input('param.content');
		$content = strip_tags($content);
		if ($content) {
			return msubstr($content, 0, 80) . '...';
		} else {
			return '';
		}
	}
	/**
	 *提取字符串中的第一个图片
	 */
	private function _getFirstPicture($str = '') {
		preg_match_all('/<img.*?src\=[\'|\"](.*?)[\'|\"].*?>/', $str, $match);
		// dump($match);
		if ($match[0]) {
			$k  = 0;
			$wh = 0;
			foreach ($match[1] as $key => $value) {
				$temwh = getimagesize('.' . $value);
				if (max($temwh[0], $temwh[1]) > $wh) {
					$k = $key;
				}
			}
			$info = \think\Db::name('Picture')->field('picture_id')->where("path='{$match[1][$k]}'")->find();
			return empty($info) ? 0 : $info['picture_id'];

		} else {
			return 0;
		}
	}

	private function _fenci($str = '', $num = 10, $keywords = true) {
		if (!$str) {
			return '';
		}
		$pa = new \ank\PhpAnalysis();
		$pa->SetSource($str);
		$pa->resultType = 2;
		$pa->StartAnalysis(true);
		if ($keywords) {
			// 获得最终全部分词结果
			return trim($pa->GetFinallyResult(','), ',');
		} else {
			return $pa->GetFinallyKeywords($num);
		}
		// 获得粗分结果
		// print_r($pa->GetSimpleResult());
		// 获得包含属性信息的粗分结果
		// print_r($pa->GetSimpleResultAll());
		// 函数说明：获取出现频率最高的指定词条数（通常用于提取文档关键字）
		// 参数列表：$num = 10 返回词条个数
		// return $pa->GetFinallyKeywords(10);
		// 获取hash索引数组
		// print_r($pa->GetFinallyIndex());
	}

}
<?php
namespace app\common\controller;
use think\Request;

/**
 * 自定义控件表单
 * 使用方法
 */
class Custom extends \think\Controller {
	private $_method = ''; //生成表单调用的方法
	private $_name   = ''; //表单的name值
	//表单的value值,这里的值是类似[REPLACE_SETVALUE_send_email_btn]这样的值
	//为啦把表单保存成缓存,这里没有使用真实的值
	private $_value = '';
	public function __construct($method, $name, $value) {
		$this->_method = $method;
		$this->_name   = $name;
		$this->_value  = $value;
	}
	/**
	 * 当自定义方法不存在的时候会调用这个方法
	 * 可以参考这个方法自定义自己的表单控件
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function index() {
		//注册要用到的js和css
		// reg_css('');
		// reg_js('');
		$formstr = <<<eot
<div style="color:#f00;font-size:20px;">
没有找到自定义的表单<br>
调用方法:{$this->_method}<br>
表单name:{$this->_name}<br>
表单value:{$this->_value}<br>
</div>
eot;
		return [
			'str' => $formstr,
			'js'  => "/*这里是表单初始化要用到的js*/",
		];
	}
	/**
	 * 发送测试邮件按钮
	 * @return [type] [description]
	 */
	public function sendEmailBtn() {
		return [
			'str' => '<input name="' . $this->_name . '" value="' . $this->_value . '" /><a class="btn" href="javascript:;">点击发送测试邮件</a>
',
			'js'  => '',
		];
	}
	/**
	 * 产品标签自定义表单
	 * @return [type] [description]
	 */
	public function goodsPosition() {
		return $this->_addTag('goods_tag');
	}
	/**
	 * 文章标签自定义表单
	 * @return [type] [description]
	 */
	public function articlePosition() {
		return $this->_addTag('article_tag');
	}
	/**
	 * ajax添加分类标签
	 * @param string $category_type [description]
	 */
	private function _addTag($category_type = 'article_tag') {
		$map                  = [];
		$map['category_type'] = $category_type;
		$list                 = \think\Db::name('Category')
			->where($map)
			->select();
		$addtag = '<a style="margin-bottom:10px;" href="javascript:;"onclick="am.getAddTagForm(this,\'' . url('sys.ajax/addCategory?category_type=' . $category_type) . '\');" class="btn">添加标签</a>';
		$str    = $addtag;
		$str .= '<div id="tagcontainer"  class="controls">';
		foreach ($list as $key => $value) {
			$str .= '<label class="form-checkbox"><input name="' . $this->_name . '[]" type="checkbox" value="' . $value['category_id'] . '" /><span>' . $value['title'] . '</span></label>';
		}
		$str .= '</div>';

		$initjs = <<<js
!function(){
var id=[{$this->_value}];
for(a in id){
$("input[name='{$this->_name}[]'][value='"+id[a]+"']").prop({checked:true});
}
}();
js;
		return ['str' => $str, 'js' => $initjs];
	}
}
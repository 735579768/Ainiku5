<?php
return [
	//临时添加表单项的配置
	'formitem' => [
		[
			'type'       => 'select',
			'name'       => 'form_id',
			'title'      => '所属表单',
			'note'       => '', //对标题的说明性文字
			'extra'      => select_form(),
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],
		[
			'type'       => 'select',
			'name'       => 'type',
			'title'      => '表单类型',
			'note'       => '', //对标题的说明性文字
			'extra'      => select_form_type(),
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],

		[
			'type'       => 'string',
			'name'       => 'title',
			'title'      => '表单项标题',
			'note'       => '此项表单项的标题', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],
		[
			'type'       => 'string',
			'name'       => 'name',
			'title'      => '表单项name值',
			'note'       => '生成表单项时的name属性', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],
		[
			'type'       => 'string',
			'name'       => 'note',
			'title'      => '表单项备注说明',
			'note'       => '附加说明信息', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'textarea',
			'name'       => 'extra',
			'title'      => '表单项extra附加数据',
			'note'       => 'radio,select类型表单项需要此值必填', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'string',
			'name'       => 'value',
			'title'      => '表单项默认值',
			'note'       => '表单项初始化时的默认值', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'radio',
			'name'       => 'is_show',
			'title'      => '表单项什么时候显示',
			'note'       => '控制表单项添加,编辑时候的显示/隐藏', //对标题的说明性文字
			'extra'      => [
				0 => '隐藏',
				1 => '添加时显示',
				2 => '编辑时显示',
				3 => '添加编辑时都显示',
			],
			'value'      => 3,
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'radio',
			'name'       => 'is_require',
			'title'      => '表单项是否是必填项',
			'note'       => '', //对标题的说明性文字
			'extra'      => [
				0 => '否',
				1 => '是',
			],
			'value'      => 0,
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'string',
			'name'       => 'data_ts',
			'title'      => '表单项提示文字',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
			'extend'     => 1,
		],
		[
			'type'       => 'string',
			'name'       => 'data_err',
			'title'      => '表单项提示错误',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
			'extend'     => 1,
		],
		[
			'type'       => 'string',
			'name'       => 'data_ok',
			'title'      => '表单项提示格式正确',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
			'extend'     => 1,
		],
		[
			'type'       => 'string',
			'name'       => 'data_reg',
			'title'      => '表单项验证需要的正则',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
			'extend'     => 1,
		],

		[
			'type'       => 'radio',
			'name'       => 'extend',
			'title'      => '表单项是否是扩展项',
			'note'       => '', //对标题的说明性文字
			'extra'      => array(
				0 => '否',
				1 => '是',
			),
			'value'      => 0,
			'is_show'    => 3,
			'is_require' => 0, //是否必填
			'extend'     => 0,
		],
	],
	'form'     => [
		[
			'type'       => 'string',
			'name'       => 'title',
			'title'      => '表单标题',
			'note'       => '表单的标题', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],
		[
			'type'       => 'string',
			'name'       => 'name',
			'title'      => '表单对应的数据表',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],
		[
			'type'       => 'number',
			'name'       => 'sort',
			'title'      => '表单排序',
			'note'       => '', //对标题的说明性文字
			'value'      => '99',
			'is_show'    => 3,
			'is_require' => 1, //是否必填
		],
		[
			'type'       => 'textarea',
			'name'       => 'search_format',
			'title'      => '搜索格式字符串',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'textarea',
			'name'       => 'list_format',
			'title'      => '列表格式字符串',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
		[
			'type'       => 'textarea',
			'name'       => 'recycle_format',
			'title'      => '回收站格式字符串',
			'note'       => '', //对标题的说明性文字
			'value'      => '',
			'is_show'    => 3,
			'is_require' => 0, //是否必填
		],
	],
];
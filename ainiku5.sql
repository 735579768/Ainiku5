/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ainiku5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-10-05 10:55:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kl_article
-- ----------------------------
DROP TABLE IF EXISTS `kl_article`;
CREATE TABLE `kl_article` (
  `article_id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `category_id` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `pic` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章图片',
  `attachment` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件附件',
  `position` varchar(50) NOT NULL DEFAULT '' COMMENT '文章附加属性',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章状态',
  `views` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `color` varchar(8) NOT NULL DEFAULT '#000' COMMENT '颜色',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章优化标题',
  `meta_keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `meta_descr` text NOT NULL COMMENT '文章描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of kl_article
-- ----------------------------

-- ----------------------------
-- Table structure for kl_category
-- ----------------------------
DROP TABLE IF EXISTS `kl_category`;
CREATE TABLE `kl_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类标识(优化url使用)',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '分类标题',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `meta_descr` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `sort` int(10) unsigned NOT NULL DEFAULT '99' COMMENT '分类排序（同级有效）',
  `category_type` varchar(50) NOT NULL DEFAULT 'article' COMMENT '分类类型',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类状态',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表页模板',
  `detail_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类详情模板',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of kl_category
-- ----------------------------

-- ----------------------------
-- Table structure for kl_config
-- ----------------------------
DROP TABLE IF EXISTS `kl_config`;
CREATE TABLE `kl_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置标识',
  `value` text NOT NULL COMMENT '配置值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of kl_config
-- ----------------------------
INSERT INTO `kl_config` VALUES ('1', '网站配置', 'web_config', '{\"web_meta_title\":\"\\u524d\\u53f0\\u5c55\\u793a\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_domain\":\"\",\"third_code\":\"asdffasdfasf\",\"web_logo\":\"\",\"thumb_size\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_pos\":\"center_center\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_image\":\"3\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"admin_title\":\"\\u7231\\u4f60\\u9177\",\"list_rows\":\"12\"}', '1475551684', '1475599412');

-- ----------------------------
-- Table structure for kl_file
-- ----------------------------
DROP TABLE IF EXISTS `kl_file`;
CREATE TABLE `kl_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传用户id',
  `srcname` varchar(50) NOT NULL DEFAULT '' COMMENT '上传源文件名',
  `destname` varchar(50) NOT NULL DEFAULT '' COMMENT '上传后的文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传附件';

-- ----------------------------
-- Records of kl_file
-- ----------------------------

-- ----------------------------
-- Table structure for kl_form
-- ----------------------------
DROP TABLE IF EXISTS `kl_form`;
CREATE TABLE `kl_form` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '表单标题',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '表单标识符',
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '表单排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '表单状态',
  `list_format` text NOT NULL COMMENT '表单数据显示成列表时的格式',
  `recycle_format` text NOT NULL COMMENT '表单数据在回收站显示时的格式',
  `search_format` text NOT NULL COMMENT '表单数据搜索时的格式',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统模型';

-- ----------------------------
-- Records of kl_form
-- ----------------------------
INSERT INTO `kl_form` VALUES ('1', '表单', 'Form', '99', '1', '', '', '', '0', '1475584717');
INSERT INTO `kl_form` VALUES ('2', '表单项', 'FormItem', '99', '1', '', '', '', '1475391093', '1475461936');
INSERT INTO `kl_form` VALUES ('3', '菜单', 'Menu', '99', '1', '', '', '', '1475476713', '1475476713');
INSERT INTO `kl_form` VALUES ('4', '网站配置', 'Config', '99', '1', '', '', '', '1475479534', '1475479534');

-- ----------------------------
-- Table structure for kl_form_item
-- ----------------------------
DROP TABLE IF EXISTS `kl_form_item`;
CREATE TABLE `kl_form_item` (
  `form_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单项id',
  `form_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属表单id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项标题',
  `note` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项备注',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项name值',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项类型',
  `extra` text NOT NULL COMMENT '表单项附加数据',
  `is_require` tinyint(1) NOT NULL DEFAULT '0' COMMENT '表单项是否必填',
  `is_show` tinyint(1) NOT NULL DEFAULT '3' COMMENT '表单项什么时候显示',
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '表单项排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '表单项状态',
  `value` text NOT NULL COMMENT '表单项默认值',
  `data_ts` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项提示文字',
  `data_err` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项格式错误提示',
  `data_ok` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项格式正确提示',
  `data_reg` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项正则验证',
  `tab_id` int(11) NOT NULL DEFAULT '0' COMMENT '是否是扩展表单项',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`form_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='系统表单项属性';

-- ----------------------------
-- Records of kl_form_item
-- ----------------------------
INSERT INTO `kl_form_item` VALUES ('1', '2', '所属表单', '此表单项是哪个表单里的', 'form_id', 'select', 'select_form', '0', '3', '99', '1', '', '', '', '', '', '0', '1475460202', '1475460202');
INSERT INTO `kl_form_item` VALUES ('2', '2', '表单项标题', '此表单项的标题', 'title', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475460781', '1475460781');
INSERT INTO `kl_form_item` VALUES ('3', '2', '表单项name值', '生成表单项时的name属性', 'name', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475460857', '1475460857');
INSERT INTO `kl_form_item` VALUES ('4', '2', '表单项备注说明', '此表单项的附加说明信息', 'note', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475460912', '1475460912');
INSERT INTO `kl_form_item` VALUES ('5', '2', '表单项extra附加数据', 'radio,select类型表单项需要此值必填', 'extra', 'textarea', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475461004', '1475461004');
INSERT INTO `kl_form_item` VALUES ('6', '2', '表单项默认值', '表单项初始化时的默认值', 'value', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475461066', '1475461066');
INSERT INTO `kl_form_item` VALUES ('7', '2', '表单项什么时候显示', '控制表单项添加,编辑时候的显示/隐藏', 'is_show', 'radio', '0 隐藏\r\n1:添加时显示\r\n2:编辑时显示\r\n3:添加编辑时都显示', '0', '3', '99', '1', '3', '', '', '', '', '0', '1475461226', '1475461454');
INSERT INTO `kl_form_item` VALUES ('8', '2', '表单项是否是必填项', '', 'is_require', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475461588', '1475461588');
INSERT INTO `kl_form_item` VALUES ('9', '2', '表单项提示文字', '', 'data_ts', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '1', '1475461634', '1475461634');
INSERT INTO `kl_form_item` VALUES ('10', '2', '表单项提示错误', '', 'data_err', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '1', '1475461649', '1475461649');
INSERT INTO `kl_form_item` VALUES ('11', '2', '表单项提示格式正确', '', 'data_ok', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '1', '1475461663', '1475461663');
INSERT INTO `kl_form_item` VALUES ('12', '2', '表单项验证需要的正则', '', 'data_reg', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '1', '1475461696', '1475461696');
INSERT INTO `kl_form_item` VALUES ('13', '2', '表单项是否是扩展项', '表单tab类型标签', 'tab_id', 'select', 'select_form_tab', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475461747', '1475479285');
INSERT INTO `kl_form_item` VALUES ('14', '1', '表单名称', '', 'title', 'string', '', '0', '3', '80', '1', '', '', '', '', '', '0', '1475462007', '1475462007');
INSERT INTO `kl_form_item` VALUES ('15', '1', '表单对应的数据表', '', 'name', 'string', '', '0', '3', '81', '1', '', '', '', '', '', '0', '1475462030', '1475462030');
INSERT INTO `kl_form_item` VALUES ('16', '1', '表单排序', '', 'sort', 'number', '', '0', '3', '82', '1', '99', '', '', '', '', '0', '1475462076', '1475462076');
INSERT INTO `kl_form_item` VALUES ('17', '1', '搜索格式字符串', '搜索列表的格式字符串', 'search_format', 'textarea', '', '0', '3', '83', '1', '', '', '', '', '', '0', '1475462140', '1475462140');
INSERT INTO `kl_form_item` VALUES ('18', '1', '列表格式字符串', '', 'list_format', 'textarea', '', '0', '3', '84', '1', '', '', '', '', '', '0', '1475462200', '1475462200');
INSERT INTO `kl_form_item` VALUES ('19', '1', '回收站格式字符串', '回收站列表格式字符串', 'recycle_format', 'textarea', '', '0', '3', '85', '1', '', '', '', '', '', '0', '1475462253', '1475462253');
INSERT INTO `kl_form_item` VALUES ('20', '2', '表单项类型', '此项表单的类型', 'type', 'select', 'select_form_type', '0', '3', '90', '1', '', '', '', '', '', '0', '1475472719', '1475590905');
INSERT INTO `kl_form_item` VALUES ('21', '1', '自动生成数据库表', '自动创建对应的数据表', 'auto_greate', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475480344', '1475480396');
INSERT INTO `kl_form_item` VALUES ('22', '2', '自动生成字段', '自动在对应的数据表中生成字段', 'auto_greate', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475480472', '1475480472');
INSERT INTO `kl_form_item` VALUES ('23', '4', '系统后台标题', '管理后台名字(admin_title)', 'admin_title', 'string', '', '0', '3', '99', '1', '管理平台', '', '', '', '', '4', '1475480737', '1475480737');
INSERT INTO `kl_form_item` VALUES ('24', '4', '网站优化标题', '网站前台的优化关键字(web_meta_title)', 'web_meta_title', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475483286', '1475483286');
INSERT INTO `kl_form_item` VALUES ('25', '4', '网站优化关键字', '网站前台的关键字(web_meta_keywords)', 'web_meta_keywords', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475483337', '1475483337');
INSERT INTO `kl_form_item` VALUES ('26', '4', '网站优化描述', '网站前台优化的描述(web_meta_descr)', 'web_meta_descr', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475483379', '1475505044');
INSERT INTO `kl_form_item` VALUES ('27', '4', '网站主页地址', '网站主域名,结尾不要\'/\'(web_domain)', 'web_domain', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475505568', '1475505568');
INSERT INTO `kl_form_item` VALUES ('28', '4', '第三方代码', '网站附加的第三方统计代码(third_code)', 'third_code', 'textarea', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475549466', '1475549466');
INSERT INTO `kl_form_item` VALUES ('29', '3', '上级菜单', '菜单的上级菜单', 'pid', 'select', 'select_menu', '0', '3', '99', '1', '', '', '', '', '', '0', '1475556014', '1475556014');
INSERT INTO `kl_form_item` VALUES ('30', '3', '菜单标题', '', 'title', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475557506', '1475557506');
INSERT INTO `kl_form_item` VALUES ('31', '3', '菜单url', '菜单地址,会被url函数解析', 'url', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475557539', '1475557539');
INSERT INTO `kl_form_item` VALUES ('32', '3', '菜单分组', '后台左侧菜单会根据这个值分组', 'group', 'string', '', '0', '3', '99', '1', '默认', '', '', '', '', '0', '1475557614', '1475559504');
INSERT INTO `kl_form_item` VALUES ('33', '3', '菜单排序', '', 'sort', 'number', '', '0', '3', '99', '1', '99', '', '', '', '', '0', '1475557696', '1475557696');
INSERT INTO `kl_form_item` VALUES ('34', '3', '菜单状态', '菜单是否隐藏', 'status', 'radio', '0:隐藏\r\n1:显示', '0', '3', '99', '1', '1', '', '', '', '', '0', '1475557739', '1475558667');
INSERT INTO `kl_form_item` VALUES ('35', '4', '系统列表默认显示行数', '(list_rows)', 'list_rows', 'number', '', '0', '3', '99', '1', '15', '', '', '', '', '4', '1475591736', '1475591736');
INSERT INTO `kl_form_item` VALUES ('36', '4', '网站LOGO', '(web_logo)', 'web_logo', 'picture', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475592350', '1475592350');
INSERT INTO `kl_form_item` VALUES ('37', '4', '系统生成图片缩略图大小', '数据格式为200*200,宽*高(thumb_size)', 'thumb_size', 'string', '', '0', '3', '99', '1', '200*200', '', '', '', '', '3', '1475594307', '1475594307');
INSERT INTO `kl_form_item` VALUES ('38', '4', '给上传的图片添加水印', '是否添加水印', 'shuiyin_on', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '3', '1475594499', '1475594499');
INSERT INTO `kl_form_item` VALUES ('39', '4', '水印位置', '添加水印的位置', 'shuiyin_pos', 'radio', 'top_left:左上角\r\ntop_center:上面正中间\r\ntop_right:右上角\r\ncenter_center:正中间\r\nbottom_left:左下角\r\nbottom_right:右下角\r\nbottom_center:底部正中间', '0', '3', '99', '1', 'center_center', '', '', '', '', '3', '1475594626', '1475594626');
INSERT INTO `kl_form_item` VALUES ('40', '4', '文字水印颜色', '', 'shuiyin_text_color', 'color', '', '0', '3', '99', '1', '#000000', '', '', '', '', '3', '1475594749', '1475594749');
INSERT INTO `kl_form_item` VALUES ('41', '4', '文字水印字体大小', '', 'shuiyin_text_size', 'number', '', '0', '3', '99', '1', '14', '', '', '', '', '3', '1475594844', '1475594844');
INSERT INTO `kl_form_item` VALUES ('42', '4', '水印图片', '标识: shuiyin_image', 'shuiyin_image', 'picture', '', '0', '3', '99', '1', '', '', '', '', '', '3', '1475595431', '1475595431');
INSERT INTO `kl_form_item` VALUES ('43', '4', '文字水印字符串', '', 'shuiyin_text', 'string', '', '0', '3', '99', '1', '爱你酷', '', '', '', '', '3', '1475597025', '1475597025');

-- ----------------------------
-- Table structure for kl_goods
-- ----------------------------
DROP TABLE IF EXISTS `kl_goods`;
CREATE TABLE `kl_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(50) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '产品标题',
  `content` text NOT NULL COMMENT '产品描述',
  `pic` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品图片',
  `xc` varchar(50) NOT NULL DEFAULT '' COMMENT '产品相册',
  `position` varchar(50) NOT NULL DEFAULT '' COMMENT '产品附加属性',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '产品状态',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品价格',
  `stock` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '库存',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品数据';

-- ----------------------------
-- Records of kl_goods
-- ----------------------------

-- ----------------------------
-- Table structure for kl_menu
-- ----------------------------
DROP TABLE IF EXISTS `kl_menu`;
CREATE TABLE `kl_menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '分类标题',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '分类url',
  `group` varchar(50) NOT NULL DEFAULT '默认' COMMENT '分类分组',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否隐藏',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统后台菜单';

-- ----------------------------
-- Records of kl_menu
-- ----------------------------
INSERT INTO `kl_menu` VALUES ('1', '0', '首页', 'javascript:;', '默认', '99', '1', '1475558381', '1475558381');
INSERT INTO `kl_menu` VALUES ('8', '0', '用户', 'User/lis', '默认', '99', '1', '1475632715', '1475632715');
INSERT INTO `kl_menu` VALUES ('2', '0', '文章', 'Article/lis', '默认', '99', '1', '1475558698', '1475558698');
INSERT INTO `kl_menu` VALUES ('3', '2', '文章列表', 'Article/lis', '默认', '99', '1', '1475558868', '1475558868');
INSERT INTO `kl_menu` VALUES ('4', '0', '系统', 'javascript:;', '默认', '90', '1', '1475559327', '1475563220');
INSERT INTO `kl_menu` VALUES ('5', '4', '网站设置', 'Config/group', '默认', '99', '1', '1475559362', '1475559362');
INSERT INTO `kl_menu` VALUES ('6', '4', '表单列表', 'Form/lis', '开发管理', '99', '1', '1475559401', '1475559401');
INSERT INTO `kl_menu` VALUES ('7', '4', '菜单列表', 'Menu/lis', '开发管理', '99', '1', '1475559431', '1475559431');
INSERT INTO `kl_menu` VALUES ('9', '8', '用户列表', 'User/lis', '默认', '99', '1', '1475632754', '1475634749');

-- ----------------------------
-- Table structure for kl_nav
-- ----------------------------
DROP TABLE IF EXISTS `kl_nav`;
CREATE TABLE `kl_nav` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级导航ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '导航标题',
  `url` char(100) NOT NULL DEFAULT '' COMMENT '导航连接',
  `sort` tinyint(10) unsigned NOT NULL DEFAULT '99' COMMENT '导航排序',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新窗口打开',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导航状态',
  `pic` int(10) NOT NULL DEFAULT '0' COMMENT '图标',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航';

-- ----------------------------
-- Records of kl_nav
-- ----------------------------

-- ----------------------------
-- Table structure for kl_picture
-- ----------------------------
DROP TABLE IF EXISTS `kl_picture`;
CREATE TABLE `kl_picture` (
  `picture_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传用户id',
  `srcname` varchar(255) NOT NULL DEFAULT '' COMMENT '源图片名字',
  `destname` varchar(255) NOT NULL DEFAULT '' COMMENT '目标图片名字',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '上传后图片路径',
  `thumbpath` varchar(255) NOT NULL DEFAULT '' COMMENT '上传后图片缩略图路径',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '此图片附加数据',
  `sha1` varchar(50) NOT NULL DEFAULT '' COMMENT '图片的sha1码,去复时使用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`picture_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='上传图片';

-- ----------------------------
-- Records of kl_picture
-- ----------------------------
INSERT INTO `kl_picture` VALUES ('3', '1', '487655527099084608.jpg', '147559938152273.jpg', '/uploads/image/20161005/147559938152273.jpg', '/uploads/image/thumb/20161005/147559938152273.jpg', '1', '', 'ca112da45a284e97305fb985fa703c35cb065b62', '1475599381', '0');

-- ----------------------------
-- Table structure for kl_single
-- ----------------------------
DROP TABLE IF EXISTS `kl_single`;
CREATE TABLE `kl_single` (
  `single_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单页的id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单页上级id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '单页标识(url中使用)',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '单页标题',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `meta_descr` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '单页中的内容',
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '单页状态',
  `index_tpl` varchar(50) NOT NULL DEFAULT 'index' COMMENT '单页模板文件名',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`single_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页';

-- ----------------------------
-- Records of kl_single
-- ----------------------------

-- ----------------------------
-- Table structure for kl_user
-- ----------------------------
DROP TABLE IF EXISTS `kl_user`;
CREATE TABLE `kl_user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT 'QQ登陆id',
  `account` varchar(20) NOT NULL DEFAULT '' COMMENT '系统账号',
  `user_group_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户组',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `diqu` varchar(50) NOT NULL DEFAULT '' COMMENT '地区',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `email_activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱是否激活',
  `reg_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '注册ip',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '最后登陆ip',
  `last_login_adr` varchar(50) NOT NULL DEFAULT '' COMMENT '最后登陆地址',
  `login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '详情地址',
  `pic` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户头像',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kl_user
-- ----------------------------
INSERT INTO `kl_user` VALUES ('1', '', '10000', '1', 'admin', '0c72320405722be71ba98ade695850b5', '超级管理员', '', '', '', '0', '', '', '', '0', '1', '', '0', '0', '0');

-- ----------------------------
-- Table structure for kl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `kl_user_group`;
CREATE TABLE `kl_user_group` (
  `user_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组标题',
  `auth` text NOT NULL COMMENT '用户组权限id',
  `admin_index` varchar(50) NOT NULL DEFAULT '' COMMENT '默认后台登陆主页',
  `denied` text NOT NULL COMMENT '不能访问的url',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `is_adminlogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许后台登陆',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of kl_user_group
-- ----------------------------
INSERT INTO `kl_user_group` VALUES ('1', '管理员', '', '', '', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for kl_user_log
-- ----------------------------
DROP TABLE IF EXISTS `kl_user_log`;
CREATE TABLE `kl_user_log` (
  `user_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` varchar(50) DEFAULT NULL COMMENT '操作ip',
  `address` varchar(255) DEFAULT NULL COMMENT '物理地址',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户登陆日志';

-- ----------------------------
-- Records of kl_user_log
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : ainiku5

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-10-17 16:09:44
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of kl_article
-- ----------------------------
INSERT INTO `kl_article` VALUES ('7', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '12,13', '1', '0', '#000000', '', '', '', '1476081249', '1476691500');
INSERT INTO `kl_article` VALUES ('6', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538926');
INSERT INTO `kl_article` VALUES ('5', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538926');
INSERT INTO `kl_article` VALUES ('3', '2', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538909');
INSERT INTO `kl_article` VALUES ('4', '2', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538909');

-- ----------------------------
-- Table structure for kl_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `kl_auth_rule`;
CREATE TABLE `kl_auth_rule` (
  `auth_rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '规则所属归类',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `note` varchar(50) NOT NULL DEFAULT '' COMMENT '规则备注说明',
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-url规则;2-分组名称',
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '排序',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`auth_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='系统权限规则表';

-- ----------------------------
-- Records of kl_auth_rule
-- ----------------------------
INSERT INTO `kl_auth_rule` VALUES ('1', '0', '权限管理', '', '', '1', '', '2', '64', '1476503278', '1476348301');
INSERT INTO `kl_auth_rule` VALUES ('2', '0', '表单管理', '', '', '1', '', '2', '62', '1476503276', '1476348462');
INSERT INTO `kl_auth_rule` VALUES ('3', '2', '添加表单', '', 'sys.form/add', '1', '', '1', '54', '1476503068', '1476348587');
INSERT INTO `kl_auth_rule` VALUES ('4', '2', '编辑表单', '', 'sys.form/edit', '1', '', '1', '56', '1476503069', '1476350052');
INSERT INTO `kl_auth_rule` VALUES ('5', '2', '删除表单', '', 'sys.form/delete', '1', '', '1', '58', '1476503070', '1476350067');
INSERT INTO `kl_auth_rule` VALUES ('6', '2', '添加表单项', '', 'sys.formitem/add', '1', '', '1', '60', '1476503100', '1476350396');
INSERT INTO `kl_auth_rule` VALUES ('7', '2', '编辑表单项', '', 'sys.formitem/edit', '1', '', '1', '62', '1476503103', '1476350412');
INSERT INTO `kl_auth_rule` VALUES ('8', '2', '删除表单项', '', 'sys.formitem/delete', '1', '', '1', '64', '1476503105', '1476350426');
INSERT INTO `kl_auth_rule` VALUES ('9', '0', '菜单管理', '', '', '1', '', '2', '59', '1476503272', '1476350499');
INSERT INTO `kl_auth_rule` VALUES ('10', '9', '添加菜单', '', 'sys.menu/add', '1', '', '1', '91', '1476502772', '1476350515');
INSERT INTO `kl_auth_rule` VALUES ('11', '9', '编辑菜单', '', 'sys.menu/edit', '1', '', '1', '92', '1476502774', '1476350527');
INSERT INTO `kl_auth_rule` VALUES ('12', '9', '删除菜单', '', 'sys.menu/delete', '1', '', '1', '93', '1476502776', '1476350539');
INSERT INTO `kl_auth_rule` VALUES ('13', '0', '用户管理', '', '', '1', '', '2', '55', '1476503063', '1476351074');
INSERT INTO `kl_auth_rule` VALUES ('14', '13', '添加用户', '', 'sys.user/add', '1', '', '1', '91', '1476502695', '1476351109');
INSERT INTO `kl_auth_rule` VALUES ('15', '13', '编辑用户', '', 'sys.user/edit', '1', '', '1', '92', '1476502697', '1476351127');
INSERT INTO `kl_auth_rule` VALUES ('16', '13', '删除用户', '', 'sys.user/delete', '1', '', '1', '93', '1476502699', '1476351144');
INSERT INTO `kl_auth_rule` VALUES ('17', '13', '移动用户到回收站', '', 'sys.user/del', '1', '', '1', '94', '1476502705', '1476351174');
INSERT INTO `kl_auth_rule` VALUES ('18', '13', '用户列表', '', 'sys.user/lis', '1', '', '1', '90', '1476502692', '1476351197');
INSERT INTO `kl_auth_rule` VALUES ('19', '13', '用户回收站', '', 'sys.user/recycle', '1', '', '1', '99', '1476351215', '1476351215');
INSERT INTO `kl_auth_rule` VALUES ('20', '13', '更改用户密码', '', 'sys.user/updatepwd', '1', '', '1', '95', '1476502728', '1476351332');
INSERT INTO `kl_auth_rule` VALUES ('21', '0', '分类管理', '', '', '1', '', '2', '54', '1476503062', '1476351385');
INSERT INTO `kl_auth_rule` VALUES ('22', '23', '添加文章', '', 'sys.article/add', '1', '', '1', '91', '1476502607', '1476351450');
INSERT INTO `kl_auth_rule` VALUES ('23', '0', '文章管理', '', '', '1', '', '2', '52', '1476503060', '1476351479');
INSERT INTO `kl_auth_rule` VALUES ('24', '23', '编辑文章', '', 'sys.article/edit', '1', '', '1', '92', '1476502610', '1476351499');
INSERT INTO `kl_auth_rule` VALUES ('25', '23', '删除文章', '', 'sys.article/delete', '1', '', '1', '93', '1476502612', '1476351520');
INSERT INTO `kl_auth_rule` VALUES ('26', '23', '移动文章到回收站', '', 'sys.article/del', '1', '', '1', '94', '1476502628', '1476351535');
INSERT INTO `kl_auth_rule` VALUES ('27', '0', '文章回收站', '', '', '1', '', '2', '53', '1476503061', '1476351648');
INSERT INTO `kl_auth_rule` VALUES ('28', '27', '文章恢复', '', 'sys.article/huifu', '1', '', '1', '91', '1476502646', '1476351706');
INSERT INTO `kl_auth_rule` VALUES ('29', '27', '文章清空', '', 'sys.article/clearup', '1', '', '1', '92', '1476502648', '1476351740');
INSERT INTO `kl_auth_rule` VALUES ('30', '23', '移动文章', '', 'sys.article/move', '1', '', '1', '95', '1476502631', '1476351956');
INSERT INTO `kl_auth_rule` VALUES ('31', '27', '查看回收站文章', '', 'sys.article/recycle', '1', '', '1', '90', '1476502679', '1476352013');
INSERT INTO `kl_auth_rule` VALUES ('32', '23', '文章列表', '', 'sys.article/lis', '1', '', '1', '90', '1476426212', '1476352065');
INSERT INTO `kl_auth_rule` VALUES ('33', '1', '添加权限规则', '', 'sys.authrule/add', '1', '', '1', '99', '1476411732', '1476411732');
INSERT INTO `kl_auth_rule` VALUES ('34', '1', '编辑权限规则', '', 'sys.authrule/edit', '1', '', '1', '99', '1476411753', '1476411753');
INSERT INTO `kl_auth_rule` VALUES ('35', '1', '删除权限规则', '', 'sys.authrule/delete', '1', '', '1', '99', '1476411768', '1476411768');
INSERT INTO `kl_auth_rule` VALUES ('36', '21', '添加分类', '', 'sys.category/add', '1', '', '1', '91', '1476502658', '1476411910');
INSERT INTO `kl_auth_rule` VALUES ('37', '21', '编辑分类', '', 'sys.category/edit', '1', '', '1', '92', '1476502660', '1476411925');
INSERT INTO `kl_auth_rule` VALUES ('38', '21', '删除分类', '', 'sys.category/delete', '1', '', '1', '93', '1476502663', '1476411941');
INSERT INTO `kl_auth_rule` VALUES ('39', '0', '系统管理', '', '', '1', '', '2', '50', '1476503059', '1476416638');
INSERT INTO `kl_auth_rule` VALUES ('40', '62', '系统框架首页', '后台首页框架加载首页,必须开启。否则进不了后台首页面', 'index/index', '1', '', '1', '99', '1476536428', '1476416665');
INSERT INTO `kl_auth_rule` VALUES ('41', '1', '权限列表', '', 'sys.authrule/lis', '1', '', '1', '50', '1476503119', '1476417076');
INSERT INTO `kl_auth_rule` VALUES ('42', '57', '用户组列表', '', 'sys.usergroup/lis', '1', '', '1', '99', '1476417145', '1476417145');
INSERT INTO `kl_auth_rule` VALUES ('43', '57', '添加用户组', '', 'sys.usergroup/add', '1', '', '1', '99', '1476417161', '1476417161');
INSERT INTO `kl_auth_rule` VALUES ('44', '57', '编辑用户组', '', 'sys.usergroup/edit', '1', '', '1', '99', '1476417173', '1476417173');
INSERT INTO `kl_auth_rule` VALUES ('45', '57', '删除用户组', '', 'sys.usergroup/delete', '1', '', '1', '99', '1476417190', '1476417190');
INSERT INTO `kl_auth_rule` VALUES ('46', '13', '清空用户回收站', '', 'sys.usergroup/clearup', '1', '', '1', '99', '1476417287', '1476417287');
INSERT INTO `kl_auth_rule` VALUES ('47', '9', '菜单列表', '', 'sys.menu/lis', '1', '', '1', '90', '1476502770', '1476417360');
INSERT INTO `kl_auth_rule` VALUES ('48', '2', '表单列表', '', 'sys.form/lis', '1', '', '1', '50', '1476503067', '1476417394');
INSERT INTO `kl_auth_rule` VALUES ('49', '2', '表单项列表', '', 'sys.formitem/lis', '1', '', '1', '52', '1476503067', '1476417419');
INSERT INTO `kl_auth_rule` VALUES ('50', '21', '分类列表', '', 'sys.category/lis', '1', '', '1', '90', '1476502668', '1476417457');
INSERT INTO `kl_auth_rule` VALUES ('51', '0', '数据备份', '', '', '1', '', '2', '66', '1476503280', '1476492043');
INSERT INTO `kl_auth_rule` VALUES ('52', '51', '备份数据库', '', 'sys.database/export', '1', '', '1', '99', '1476492079', '1476492079');
INSERT INTO `kl_auth_rule` VALUES ('53', '51', '还原数据库', '', 'sys.database/import', '1', '', '1', '99', '1476492099', '1476492099');
INSERT INTO `kl_auth_rule` VALUES ('54', '51', '优化数据库', '', 'sys.database/optimize', '1', '', '1', '99', '1476492121', '1476492121');
INSERT INTO `kl_auth_rule` VALUES ('55', '51', '修复数据库', '', 'sys.database/repair', '1', '', '1', '99', '1476492150', '1476492150');
INSERT INTO `kl_auth_rule` VALUES ('56', '51', '删除数据库', '', 'sys.database/delete', '1', '', '1', '99', '1476492177', '1476492177');
INSERT INTO `kl_auth_rule` VALUES ('57', '0', '用户组管理', '', '', '1', '', '2', '56', '1476503287', '1476502373');
INSERT INTO `kl_auth_rule` VALUES ('58', '57', '权限设置', '', 'sys.usergroup/authset', '1', '', '1', '99', '1476502453', '1476502453');
INSERT INTO `kl_auth_rule` VALUES ('59', '13', '恢复用户', '', 'sys.user/huifu', '1', '', '1', '99', '1476502558', '1476502558');
INSERT INTO `kl_auth_rule` VALUES ('60', '62', '加载系统菜单', '加载系统左边的菜单', 'sys.ajax/getleftmenu', '1', '', '1', '50', '1476535965', '1476503980');
INSERT INTO `kl_auth_rule` VALUES ('61', '39', '网站配置', '', 'sys.config/group', '1', '', '1', '50', '1476504142', '1476504142');
INSERT INTO `kl_auth_rule` VALUES ('62', '0', '共用权限', '系统中一般情况要开启的的权限,否则一些操作会中断', '', '1', '', '2', '40', '1476536594', '1476513227');
INSERT INTO `kl_auth_rule` VALUES ('63', '62', '控件上传图片', '如果用户要使用系统中上传图片的功能,此权限必须开启', 'file/uploadpic', '1', '', '1', '50', '1476536163', '1476513763');
INSERT INTO `kl_auth_rule` VALUES ('64', '62', '加载预览图片信息', '显示已经上传过的图片时要使用,有上传图片功能,必须开启', 'file/getfileinfo', '1', '', '1', '50', '1476536225', '1476513814');
INSERT INTO `kl_auth_rule` VALUES ('65', '62', '编辑器上传图片', '编辑器中上传图片的功能', 'file/umupload', '1', '', '1', '50', '1476536248', '1476513841');
INSERT INTO `kl_auth_rule` VALUES ('66', '62', '删除系统中图片', '上传图片后,或编辑器中上传图片后,删除图片时使用,一般情况下要开启', 'file/deleteimg', '1', '', '1', '50', '1476536290', '1476513872');
INSERT INTO `kl_auth_rule` VALUES ('67', '62', '更新数据状态', '所有页面更改状态字段时要使用,一般情况下要开启', 'index/updatefield', '1', '', '1', '50', '1476536338', '1476514070');
INSERT INTO `kl_auth_rule` VALUES ('68', '0', '主菜单', '后台最上面的主导航菜单', '', '1', '', '2', '30', '1476536537', '1476522502');
INSERT INTO `kl_auth_rule` VALUES ('69', '68', '用户', '', 'sys.ajax/getleftmenu?pid=8', '1', '', '1', '50', '1476522610', '1476522610');
INSERT INTO `kl_auth_rule` VALUES ('70', '68', '系统', '', 'sys.ajax/getleftmenu?pid=4', '1', '', '1', '50', '1476522762', '1476522627');
INSERT INTO `kl_auth_rule` VALUES ('71', '68', '文章', '', 'sys.ajax/getleftmenu?pid=2', '1', '', '1', '50', '1476522681', '1476522681');
INSERT INTO `kl_auth_rule` VALUES ('72', '68', '常用', '', 'sys.ajax/getleftmenu?pid=1', '1', '', '1', '50', '1476523138', '1476523138');
INSERT INTO `kl_auth_rule` VALUES ('73', '62', '退出系统', '退出系统功能,必须开启', 'sys.other/loginout', '1', '', '1', '50', '1476536367', '1476527456');
INSERT INTO `kl_auth_rule` VALUES ('74', '62', '清除缓存', '', 'sys.other/clearcache', '1', '', '1', '50', '1476527487', '1476527487');
INSERT INTO `kl_auth_rule` VALUES ('75', '0', '单页管理', '', '', '1', '', '2', '50', '1476677392', '1476677392');
INSERT INTO `kl_auth_rule` VALUES ('76', '75', '添加单页', '', 'com.single/add', '1', '', '1', '50', '1476677414', '1476677414');
INSERT INTO `kl_auth_rule` VALUES ('77', '75', '编辑单页', '', 'com.single/edit', '1', '', '1', '50', '1476677444', '1476677444');
INSERT INTO `kl_auth_rule` VALUES ('78', '75', '删除单页', '', 'com.single/delete', '1', '', '1', '50', '1476677461', '1476677461');
INSERT INTO `kl_auth_rule` VALUES ('79', '0', '导航管理', '', '', '1', '', '2', '50', '1476677486', '1476677486');
INSERT INTO `kl_auth_rule` VALUES ('80', '79', '添加导航', '', 'com.nav/add', '1', '', '1', '50', '1476677519', '1476677519');
INSERT INTO `kl_auth_rule` VALUES ('81', '79', '编辑导航', '', 'com.nav/edit', '1', '', '1', '50', '1476677539', '1476677539');
INSERT INTO `kl_auth_rule` VALUES ('82', '79', '删除导航', '', 'com.nav/delete', '1', '', '1', '50', '1476677558', '1476677558');
INSERT INTO `kl_auth_rule` VALUES ('83', '79', '导航列表', '', 'com.nav/lis', '1', '', '1', '49', '1476677635', '1476677616');
INSERT INTO `kl_auth_rule` VALUES ('84', '75', '单页列表', '', 'com.single/lis', '1', '', '1', '49', '1476677661', '1476677661');

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
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '分类排序（同级有效）',
  `category_type` varchar(50) NOT NULL DEFAULT 'article' COMMENT '分类类型',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类状态',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表页模板',
  `detail_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类详情模板',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='系统分类表';

-- ----------------------------
-- Records of kl_category
-- ----------------------------
INSERT INTO `kl_category` VALUES ('1', '0', 'jiayong', '家用电器', '', '', '', '0', '99', 'article', '1', 'list_detail', 'detail_default', '1475819457', '1475819457');
INSERT INTO `kl_category` VALUES ('2', '0', 'xishu', '洗漱用品', '', '', '', '0', '99', 'article', '1', 'list_detail', 'detail_default', '1476501633', '1476501633');
INSERT INTO `kl_category` VALUES ('3', '0', 'miaosha', '秒杀产品', '', '', '', '0', '50', 'goods', '1', 'list_detail', 'detail_default', '1476678421', '1476678421');
INSERT INTO `kl_category` VALUES ('4', '0', 'php', 'php', '', '', '', '0', '50', 'goods_tag', '0', '', '', '1476688687', '1476688687');
INSERT INTO `kl_category` VALUES ('5', '0', 'python', 'python', '', '', '', '0', '50', 'goods_tag', '0', '', '', '1476688740', '1476688740');
INSERT INTO `kl_category` VALUES ('6', '0', 'sql', 'sql', '', '', '', '0', '50', 'goods_tag', '0', '', '', '1476688868', '1476688868');
INSERT INTO `kl_category` VALUES ('7', '0', 'cms', 'cms', '', '', '', '0', '50', 'goods_tag', '0', '', '', '1476689024', '1476689024');
INSERT INTO `kl_category` VALUES ('8', '0', 'thinkphp', 'thinkphp', '', '', '', '0', '50', 'goods_tag', '0', '', '', '1476689297', '1476689297');
INSERT INTO `kl_category` VALUES ('9', '0', 'tp', 'tp', '', '', '', '0', '50', 'article_tag', '0', '', '', '1476689399', '1476689399');
INSERT INTO `kl_category` VALUES ('10', '0', 'test', 'test', '', '', '', '0', '50', 'article_tag', '0', '', '', '1476689587', '1476689587');
INSERT INTO `kl_category` VALUES ('11', '0', 'node', 'node', '', '', '', '0', '50', 'article_tag', '0', '', '', '1476689632', '1476689632');
INSERT INTO `kl_category` VALUES ('12', '0', 'socket.io', 'socket.io', '', '', '', '0', '50', 'article_tag', '0', '', '', '1476689892', '1476689892');
INSERT INTO `kl_category` VALUES ('13', '0', 'c++', 'c++', '', '', '', '0', '50', 'article_tag', '0', '', '', '1476690450', '1476690450');

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
INSERT INTO `kl_config` VALUES ('1', '网站配置', 'web_config', '{\"web_domain\":\"http:\\/\\/www.ainiku5.loc\",\"web_meta_title\":\"\\u7231\\u4f60\\u9177\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"13\",\"third_code\":\"asdffasdfasf\",\"admin_title\":\"\\u7231\\u4f60\\u9177\",\"list_rows\":\"12\",\"thumb_size\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_pos\":\"center_center\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_image\":\"15\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_host\":\"\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"service\",\"mail_smtp_pwd\":\"\",\"mail_smtp_fromemail\":\"\",\"mail_smtp_receiveemail\":\"735579768@qq.com\",\"mail_smtp_fromname\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_subject\":\"\",\"send_email_btn\":\"wwwwwwwwwwww\",\"mail_smtp_test\":\"<p>8977987898<\\/p>\"}', '1475551684', '1476622769');

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
  `title` varchar(50) NOT NULL DEFAULT '请填写表单的名称' COMMENT '表单名称',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '表单标识符',
  `note` varchar(50) NOT NULL DEFAULT '' COMMENT '表单对应的数据表备注',
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '表单排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '表单状态',
  `list_format` text NOT NULL COMMENT '表单数据显示成列表时的格式',
  `recycle_format` text NOT NULL COMMENT '表单数据在回收站显示时的格式',
  `search_format` text NOT NULL COMMENT '表单数据搜索时的格式',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='系统定义的表单列表';

-- ----------------------------
-- Records of kl_form
-- ----------------------------
INSERT INTO `kl_form` VALUES ('1', '表单', 'Form', '系统定义的表单列表', '50', '1', '', '', '', '0', '1475816198');
INSERT INTO `kl_form` VALUES ('2', '表单项', 'FormItem', '系统定义的表单项列表', '50', '1', '', '', '', '1475391093', '1475765444');
INSERT INTO `kl_form` VALUES ('3', '菜单', 'Menu', '', '50', '1', '', '', '', '1475476713', '1475476713');
INSERT INTO `kl_form` VALUES ('4', '网站配置', 'Config', '', '50', '1', '', '', '', '1475479534', '1475479534');
INSERT INTO `kl_form` VALUES ('5', '用户组', 'UserGroup', '', '50', '1', '', '', '', '1475650012', '1475650012');
INSERT INTO `kl_form` VALUES ('6', '用户', 'User', '', '50', '1', '', '', '', '1475652396', '1475652396');
INSERT INTO `kl_form` VALUES ('7', '文章', 'Article', '', '50', '1', '', '', '', '1475760774', '1475760774');
INSERT INTO `kl_form` VALUES ('8', '分类', 'Category', '系统分类表', '50', '1', '', '', '', '1475815744', '1475816527');
INSERT INTO `kl_form` VALUES ('9', '权限规则', 'AuthRule', '权限规则表', '50', '1', '', '', '', '1476345464', '1476345464');
INSERT INTO `kl_form` VALUES ('10', '导航', 'Nav', '系统前台导航', '50', '1', '', '', '', '1476673655', '1476673655');
INSERT INTO `kl_form` VALUES ('11', '单页', 'Single', '单页专题数据表', '50', '1', '', '', '', '1476675122', '1476675145');
INSERT INTO `kl_form` VALUES ('12', '产品', 'Goods', '系统产品表', '50', '1', '', '', '', '1476677747', '1476677747');

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
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '表单项排序',
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
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='系统定义的表单项列表';

-- ----------------------------
-- Records of kl_form_item
-- ----------------------------
INSERT INTO `kl_form_item` VALUES ('1', '2', '所属表单', '此表单项是哪个表单里的', 'form_id', 'select', 'select_form', '0', '3', '50', '1', '', '', '', '', '', '0', '1475460202', '1476676137');
INSERT INTO `kl_form_item` VALUES ('2', '2', '表单项标题', '此表单项的标题', 'title', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '0', '1475460781', '1476676138');
INSERT INTO `kl_form_item` VALUES ('3', '2', '表单项name值', '生成表单项时的name属性', 'name', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '0', '1475460857', '1476676139');
INSERT INTO `kl_form_item` VALUES ('4', '2', '表单项备注说明', '此表单项的附加说明信息', 'note', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '0', '1475460912', '1476676140');
INSERT INTO `kl_form_item` VALUES ('5', '2', '表单项extra附加数据', 'radio,select类型表单项需要此值必填,自定义表单时此值为Custom类的一个方法', 'extra', 'textarea', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1475461004', '1476676150');
INSERT INTO `kl_form_item` VALUES ('6', '2', '表单项默认值', '表单项初始化时的默认值', 'value', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '0', '1475461066', '1476676141');
INSERT INTO `kl_form_item` VALUES ('7', '2', '表单项什么时候显示', '控制表单项添加,编辑时候的显示/隐藏', 'is_show', 'radio', '0 隐藏\r\n1:添加时显示\r\n2:编辑时显示\r\n3:添加编辑时都显示', '0', '3', '50', '1', '3', '', '', '', '', '1', '1475461226', '1476676151');
INSERT INTO `kl_form_item` VALUES ('8', '2', '表单项是否是必填项', '', 'is_require', 'radio', '0:否\r\n1:是', '0', '3', '52', '1', '0', '', '', '', '', '0', '1475461588', '1476676317');
INSERT INTO `kl_form_item` VALUES ('9', '2', '表单项提示文字', '', 'data_ts', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1475461634', '1476676131');
INSERT INTO `kl_form_item` VALUES ('10', '2', '表单项提示错误', '', 'data_err', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1475461649', '1476676130');
INSERT INTO `kl_form_item` VALUES ('11', '2', '表单项提示格式正确', '', 'data_ok', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1475461663', '1476676130');
INSERT INTO `kl_form_item` VALUES ('12', '2', '表单项验证需要的正则', '', 'data_reg', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1475461696', '1476676126');
INSERT INTO `kl_form_item` VALUES ('13', '2', '表单项是否是扩展项', '表单tab类型标签', 'tab_id', 'radio', 'select_form_tab', '0', '3', '52', '1', '0', '', '', '', '', '0', '1475461747', '1476676319');
INSERT INTO `kl_form_item` VALUES ('14', '1', '表单名称', '', 'title', 'string', '', '0', '3', '80', '1', '', '', '', '', '', '0', '1475462007', '1475844361');
INSERT INTO `kl_form_item` VALUES ('15', '1', '表单对应的数据表', '', 'name', 'string', '', '0', '3', '81', '1', '', '', '', '', '', '0', '1475462030', '1475644142');
INSERT INTO `kl_form_item` VALUES ('16', '1', '表单排序', '', 'sort', 'number', '', '0', '3', '84', '1', '50', '', '', '', '', '0', '1475462076', '1475765261');
INSERT INTO `kl_form_item` VALUES ('17', '1', '搜索格式字符串', '搜索列表的格式字符串', 'search_format', 'textarea', '', '0', '3', '86', '1', '', '', '', '', '', '0', '1475462140', '1475765263');
INSERT INTO `kl_form_item` VALUES ('18', '1', '列表格式字符串', '', 'list_format', 'textarea', '', '0', '3', '88', '1', '', '', '', '', '', '0', '1475462200', '1475765267');
INSERT INTO `kl_form_item` VALUES ('19', '1', '回收站格式字符串', '回收站列表格式字符串', 'recycle_format', 'textarea', '', '0', '3', '90', '1', '', '', '', '', '', '0', '1475462253', '1475765269');
INSERT INTO `kl_form_item` VALUES ('20', '2', '表单项类型', '此项表单的类型', 'type', 'select', 'select_form_type', '0', '3', '49', '1', '', '', '', '', '', '0', '1475472719', '1476676172');
INSERT INTO `kl_form_item` VALUES ('21', '1', '自动生成数据库表', '自动创建对应的数据表', 'auto_greate', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475480344', '1475480396');
INSERT INTO `kl_form_item` VALUES ('22', '2', '自动生成字段', '自动在对应的数据表中生成字段', 'auto_greate', 'radio', '0:否\r\n1:是', '0', '3', '52', '1', '0', '', '', '', '', '0', '1475480472', '1476676320');
INSERT INTO `kl_form_item` VALUES ('23', '4', '系统后台标题', '管理后台名字', 'admin_title', 'string', '', '0', '3', '50', '1', '管理平台', '', '', '', '', '4', '1475480737', '1476611766');
INSERT INTO `kl_form_item` VALUES ('24', '4', '网站优化标题', '网站前台的优化关键字', 'web_meta_title', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '3', '1475483286', '1476611760');
INSERT INTO `kl_form_item` VALUES ('25', '4', '网站优化关键字', '网站前台的关键字', 'web_meta_keywords', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '3', '1475483337', '1476611762');
INSERT INTO `kl_form_item` VALUES ('26', '4', '网站优化描述', '网站前台优化的描述', 'web_meta_descr', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '3', '1475483379', '1476611763');
INSERT INTO `kl_form_item` VALUES ('27', '4', '网站主页地址', '网站主域名,结尾不要\'/\'', 'web_domain', 'string', '', '0', '3', '10', '1', '', '', '', '', '', '3', '1475505568', '1475673331');
INSERT INTO `kl_form_item` VALUES ('28', '4', '第三方代码', '网站附加的第三方统计代码', 'third_code', 'textarea', '', '0', '3', '60', '1', '', '', '', '', '', '3', '1475549466', '1476611797');
INSERT INTO `kl_form_item` VALUES ('29', '3', '上级菜单', '菜单的上级菜单', 'pid', 'select', 'select_menu', '0', '3', '59', '1', '', '', '', '', '', '0', '1475556014', '1476537190');
INSERT INTO `kl_form_item` VALUES ('30', '3', '菜单标题', '', 'title', 'string', '', '0', '3', '59', '1', '', '', '', '', '', '0', '1475557506', '1476537191');
INSERT INTO `kl_form_item` VALUES ('31', '3', '菜单url', '菜单地址,会被url函数解析', 'url', 'string', '', '0', '3', '59', '1', '', '', '', '', '', '0', '1475557539', '1476537192');
INSERT INTO `kl_form_item` VALUES ('32', '3', '菜单分组', '后台左侧菜单会根据这个值分组', 'group', 'string', '', '0', '3', '59', '1', '默认', '', '', '', '', '0', '1475557614', '1476537194');
INSERT INTO `kl_form_item` VALUES ('33', '3', '菜单排序', '', 'sort', 'number', '', '0', '3', '59', '1', '50', '', '', '', '', '0', '1475557696', '1476537195');
INSERT INTO `kl_form_item` VALUES ('34', '3', '菜单状态', '菜单是否隐藏', 'status', 'radio', '0:隐藏\r\n1:显示', '0', '3', '65', '1', '1', '', '', '', '', '0', '1475557739', '1476537216');
INSERT INTO `kl_form_item` VALUES ('35', '4', '系统列表默认显示行数', '', 'list_rows', 'number', '', '0', '3', '50', '1', '15', '', '', '', '', '4', '1475591736', '1476611767');
INSERT INTO `kl_form_item` VALUES ('36', '4', '网站LOGO', '', 'web_logo', 'bdpicture', '', '0', '3', '50', '1', '', '', '', '', '', '3', '1475592350', '1476611765');
INSERT INTO `kl_form_item` VALUES ('37', '4', '系统生成图片缩略图大小', '数据格式为200*200,宽*高', 'thumb_size', 'string', '', '0', '3', '50', '1', '200*200', '', '', '', '', '4', '1475594307', '1476611768');
INSERT INTO `kl_form_item` VALUES ('38', '4', '给上传的图片添加水印', '是否添加水印', 'shuiyin_on', 'radio', '0:否\r\n1:是', '0', '3', '50', '1', '0', '', '', '', '', '4', '1475594499', '1476611769');
INSERT INTO `kl_form_item` VALUES ('39', '4', '水印位置', '添加水印的位置', 'shuiyin_pos', 'radio', 'top_left:左上角\r\ntop_center:上面正中间\r\ntop_right:右上角\r\ncenter_center:正中间\r\nbottom_left:左下角\r\nbottom_right:右下角\r\nbottom_center:底部正中间', '0', '3', '50', '1', 'center_center', '', '', '', '', '4', '1475594626', '1476611773');
INSERT INTO `kl_form_item` VALUES ('40', '4', '文字水印颜色', '', 'shuiyin_text_color', 'color', '', '0', '3', '50', '1', '#000000', '', '', '', '', '4', '1475594749', '1476611775');
INSERT INTO `kl_form_item` VALUES ('41', '4', '文字水印字体大小', '', 'shuiyin_text_size', 'number', '', '0', '3', '50', '1', '14', '', '', '', '', '4', '1475594844', '1476611778');
INSERT INTO `kl_form_item` VALUES ('42', '4', '水印图片', '', 'shuiyin_image', 'bdpicture', '', '0', '3', '50', '1', '', '', '', '', '', '4', '1475595431', '1476611779');
INSERT INTO `kl_form_item` VALUES ('43', '4', '文字水印字符串', '', 'shuiyin_text', 'string', '', '0', '3', '50', '1', '爱你酷', '', '', '', '', '4', '1475597025', '1476611780');
INSERT INTO `kl_form_item` VALUES ('44', '5', '用户组名称', '', 'title', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475650110', '1475650110');
INSERT INTO `kl_form_item` VALUES ('45', '5', '用户组首页地址', '当前用户组登陆后的第一个页面地址', 'admin_index', 'string', '', '0', '3', '99', '1', '', '', '', '', '', '0', '1475651538', '1475651538');
INSERT INTO `kl_form_item` VALUES ('46', '5', '是否允许后台登陆', '', 'is_adminlogin', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475651609', '1475651609');
INSERT INTO `kl_form_item` VALUES ('47', '5', '用户组状态', '', 'status', 'radio', '0:禁用\r\n1:启用', '0', '3', '99', '1', '1', '', '', '', '', '0', '1475651713', '1475651713');
INSERT INTO `kl_form_item` VALUES ('48', '6', '所属用户组', '', 'user_group_id', 'select', 'select_user_group', '0', '3', '1', '1', '', '', '', '', '', '0', '1475652501', '1475670899');
INSERT INTO `kl_form_item` VALUES ('49', '6', '用户名', '', 'username', 'string', '', '1', '1', '3', '1', '', '', '', '', '', '0', '1475652702', '1475670904');
INSERT INTO `kl_form_item` VALUES ('50', '6', '密码', '', 'password', 'password', '', '1', '1', '5', '1', '', '', '', '', '', '0', '1475652746', '1475670908');
INSERT INTO `kl_form_item` VALUES ('51', '6', '昵称/姓名', '', 'nickname', 'string', '', '1', '3', '9', '1', '', '', '', '', '', '0', '1475652773', '1475670913');
INSERT INTO `kl_form_item` VALUES ('52', '6', '地址', '', 'diqu', 'liandong', '', '0', '3', '11', '1', '', '', '', '', '', '0', '1475652824', '1475670920');
INSERT INTO `kl_form_item` VALUES ('53', '6', '详细地址', '', 'address', 'string', '', '0', '3', '13', '1', '', '', '', '', '', '0', '1475652865', '1475670923');
INSERT INTO `kl_form_item` VALUES ('54', '6', '手机号', '', 'mobile', 'string', '', '0', '3', '15', '1', '', '', '', '', '', '0', '1475652881', '1475670927');
INSERT INTO `kl_form_item` VALUES ('55', '6', '邮箱', '', 'email', 'string', '', '0', '3', '17', '1', '', '', '', '', '', '0', '1475652904', '1475670930');
INSERT INTO `kl_form_item` VALUES ('56', '6', '邮箱是否激活', '', 'email_activate', 'radio', '0:否\r\n1:是', '0', '3', '19', '1', '0', '', '', '', '', '1', '1475652949', '1475670936');
INSERT INTO `kl_form_item` VALUES ('57', '6', '用户状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '21', '1', '1', '', '', '', '', '0', '1475653003', '1475670939');
INSERT INTO `kl_form_item` VALUES ('58', '6', '用户头像', '', 'pic', 'bdpicture', '', '0', '3', '23', '1', '', '', '', '', '', '1', '1475653041', '1475670942');
INSERT INTO `kl_form_item` VALUES ('59', '6', '重复密码', '再次输入密码', 'repassword', 'password', '', '1', '1', '7', '1', '', '', '', '', '', '0', '1475656915', '1475670947');
INSERT INTO `kl_form_item` VALUES ('60', '1', '表单对应的数据表备注', '数据表内容说明信息', 'note', 'string', '', '0', '3', '82', '1', '', '', '', '', '', '0', '1475765233', '1475765489');
INSERT INTO `kl_form_item` VALUES ('61', '8', '上级分类', '此分类的上级分类', 'pid', 'select', 'select_category=0,article', '0', '3', '21', '1', '', '', '', '', '', '0', '1475816878', '1475819261');
INSERT INTO `kl_form_item` VALUES ('62', '8', '分类的name标识', 'url优化时使用此name', 'name', 'string', '', '0', '3', '23', '1', '', '', '', '', '', '0', '1475816934', '1475819265');
INSERT INTO `kl_form_item` VALUES ('63', '8', '分类名称', '', 'title', 'string', '', '0', '3', '22', '1', '', '', '', '', '', '0', '1475817000', '1475819266');
INSERT INTO `kl_form_item` VALUES ('64', '8', '分类排序', '', 'sort', 'number', '', '0', '3', '25', '1', '50', '', '', '', '', '0', '1475817190', '1475819283');
INSERT INTO `kl_form_item` VALUES ('65', '8', '分类图标', '', 'icon', 'bdpicture', '', '0', '3', '97', '1', '', '', '', '', '', '1', '1475817224', '1475819234');
INSERT INTO `kl_form_item` VALUES ('66', '8', '此分类是哪种分类', '标识这个是哪种分类(默认是文章分类article)', 'category_type', 'select', 'select_category_type', '0', '3', '20', '1', 'article', '', '', '', '', '0', '1475817281', '1475841646');
INSERT INTO `kl_form_item` VALUES ('67', '8', '分类状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '26', '1', '1', '', '', '', '', '0', '1475817325', '1475819289');
INSERT INTO `kl_form_item` VALUES ('68', '8', '分类列表页模板', '', 'list_tpl', 'string', '', '0', '3', '95', '1', 'list_detail', '', '', '', '', '1', '1475817394', '1475819226');
INSERT INTO `kl_form_item` VALUES ('69', '8', '分类内容详情页模板', '', 'detail_tpl', 'string', '', '0', '3', '96', '1', 'detail_default', '', '', '', '', '1', '1475817439', '1475819232');
INSERT INTO `kl_form_item` VALUES ('70', '8', '分类SEO优化标题', '', 'meta_title', 'string', '', '0', '3', '90', '1', '', '', '', '', '', '1', '1475819099', '1475819215');
INSERT INTO `kl_form_item` VALUES ('71', '8', '分类SEO优化关键字', '', 'meta_keywords', 'string', '', '0', '3', '91', '1', '', '', '', '', '', '1', '1475819143', '1475819217');
INSERT INTO `kl_form_item` VALUES ('72', '8', '分类SEO优化描述', '', 'meta_descr', 'string', '', '0', '3', '92', '1', '', '', '', '', '', '1', '1475819179', '1475819219');
INSERT INTO `kl_form_item` VALUES ('73', '7', '文章分类', '', 'category_id', 'select', 'select_category=0,article', '0', '3', '90', '1', '', '', '', '', '', '0', '1476067554', '1476069709');
INSERT INTO `kl_form_item` VALUES ('74', '7', '文章标题', '', 'title', 'string', '', '1', '3', '91', '1', '', '', '', '', '', '0', '1476067638', '1476069712');
INSERT INTO `kl_form_item` VALUES ('75', '7', '文章内容', '', 'content', 'umeditor', '', '0', '3', '93', '1', '', '', '', '', '', '0', '1476067664', '1476069724');
INSERT INTO `kl_form_item` VALUES ('76', '7', '文章封面图片', '', 'pic', 'bdpicture', '', '0', '3', '93', '1', '', '', '', '', '', '1', '1476067715', '1476155896');
INSERT INTO `kl_form_item` VALUES ('77', '7', '文章状态', '', 'status', 'radio', '0:禁用\r\n1:正常\r\n2:草稿', '0', '3', '94', '1', '1', '', '', '', '', '0', '1476068050', '1476069727');
INSERT INTO `kl_form_item` VALUES ('78', '7', '标题颜色', '', 'color', 'color', '', '0', '3', '92', '1', '#000', '', '', '', '', '0', '1476068090', '1476069716');
INSERT INTO `kl_form_item` VALUES ('79', '7', 'SEO标题', '', 'meat_title', 'string', '', '0', '3', '90', '1', '', '', '', '', '', '1', '1476068116', '1476069733');
INSERT INTO `kl_form_item` VALUES ('80', '7', 'SEO关键字', '', 'meta_keywords', 'string', '', '0', '3', '91', '1', '', '', '', '', '', '1', '1476068149', '1476069735');
INSERT INTO `kl_form_item` VALUES ('81', '7', 'SEO描述', '', 'meta_descr', 'textarea', '', '0', '3', '92', '1', '', '', '', '', '', '1', '1476068169', '1476069738');
INSERT INTO `kl_form_item` VALUES ('82', '9', '规则所属归类', '当选择为顶级规则时,此规则为规则分块名称', 'pid', 'select', 'select_auth_rule', '0', '3', '50', '1', '', '', '', '', '', '0', '1476346485', '1476535772');
INSERT INTO `kl_form_item` VALUES ('83', '9', '此权限规则的中文描述', '', 'title', 'string', '', '1', '3', '52', '1', '', '', '', '', '', '0', '1476347844', '1476535775');
INSERT INTO `kl_form_item` VALUES ('84', '9', '此权限规则的唯一英文标识', '一般情况为系统请求的url如:  sys.menu/add', 'name', 'string', '', '1', '3', '54', '1', '', '', '', '', '', '0', '1476347878', '1476535776');
INSERT INTO `kl_form_item` VALUES ('85', '9', '权限规则状态', '', 'status', 'radio', '0:无效\r\n1:有效', '0', '3', '58', '1', '1', '', '', '', '', '0', '1476347919', '1476535781');
INSERT INTO `kl_form_item` VALUES ('86', '9', '此权限规则的附加条件', '', 'condition', 'string', '', '0', '3', '55', '1', '', '', '', '', '', '0', '1476347999', '1476535777');
INSERT INTO `kl_form_item` VALUES ('87', '9', '排序', '', 'sort', 'string', '', '0', '3', '56', '1', '50', '', '', '', '', '0', '1476348019', '1476535778');
INSERT INTO `kl_form_item` VALUES ('88', '9', '此规则的类型', '1为权限规则,2为主菜单名称-分组使用', 'type', 'radio', '1:URL规则\r\n2:分组名称', '0', '3', '57', '1', '1', '', '', '', '', '0', '1476350680', '1476535780');
INSERT INTO `kl_form_item` VALUES ('89', '9', '规则备注说明', '', 'note', 'string', '', '0', '3', '53', '1', '', '', '', '', '', '0', '1476535684', '1476535789');
INSERT INTO `kl_form_item` VALUES ('90', '3', '默认到首页', '打开后台,默认显示到首页的菜单', 'home', 'radio', '0:否\r\n1:是', '0', '3', '60', '1', '0', '', '', '', '', '0', '1476537143', '1476537292');
INSERT INTO `kl_form_item` VALUES ('91', '4', 'SMTP邮件服务器 ', '', 'mail_smtp_host', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476612280', '1476612280');
INSERT INTO `kl_form_item` VALUES ('92', '4', 'SMTP服务器端口', '', 'mail_smtp_port', 'string', '', '0', '3', '50', '1', '25', '', '', '', '', '5', '1476612331', '1476612331');
INSERT INTO `kl_form_item` VALUES ('93', '4', 'SMTP服务器用户名', '', 'mail_smtp_user', 'string', '', '0', '3', '50', '1', 'service', '', '', '', '', '5', '1476612407', '1476612407');
INSERT INTO `kl_form_item` VALUES ('94', '4', 'SMTP服务器密码', '', 'mail_smtp_pwd', 'password', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476612479', '1476612479');
INSERT INTO `kl_form_item` VALUES ('95', '4', '测试邮件内容', '', 'mail_smtp_test', 'umeditor', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476612668', '1476612668');
INSERT INTO `kl_form_item` VALUES ('96', '4', '发送来源的邮箱全名', '', 'mail_smtp_fromemail', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476613487', '1476613487');
INSERT INTO `kl_form_item` VALUES ('97', '4', '测试的接收邮箱', '', 'mail_smtp_receiveemail', 'string', '', '0', '3', '50', '1', '735579768@qq.com', '', '', '', '', '5', '1476613580', '1476613580');
INSERT INTO `kl_form_item` VALUES ('98', '4', '邮件发送者名字', '一般设置成网站的名字,会显示在邮件发件人列表中', 'mail_smtp_fromname', 'string', '', '0', '3', '50', '1', '爱你酷', '', '', '', '', '5', '1476613661', '1476613661');
INSERT INTO `kl_form_item` VALUES ('99', '4', '邮件主题', '邮件内容的简要说明', 'mail_smtp_subject', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476613744', '1476613744');
INSERT INTO `kl_form_item` VALUES ('100', '4', '点击发送测试邮件', '', 'send_email_btn', 'custom', 'sendemailbtn', '0', '3', '50', '1', '', '', '', '', '', '5', '1476615111', '1476615111');
INSERT INTO `kl_form_item` VALUES ('101', '10', '上级导航', '', 'pid', 'select', 'select_nav', '0', '3', '50', '1', '', '', '', '', '', '0', '1476674209', '1476674209');
INSERT INTO `kl_form_item` VALUES ('102', '10', '导航标题', '', 'title', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '0', '1476674229', '1476674229');
INSERT INTO `kl_form_item` VALUES ('103', '10', '导航URL地址', '', 'url', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '0', '1476674248', '1476674248');
INSERT INTO `kl_form_item` VALUES ('104', '10', '排序', '', 'sort', 'number', '', '0', '3', '50', '1', '50', '', '', '', '', '0', '1476674269', '1476674269');
INSERT INTO `kl_form_item` VALUES ('105', '10', '是否新页面打开', '', 'target', 'radio', '0:否\r\n1:是', '0', '3', '50', '1', '0', '', '', '', '', '0', '1476674303', '1476674303');
INSERT INTO `kl_form_item` VALUES ('106', '10', '导航状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '50', '1', '1', '', '', '', '', '1', '1476674341', '1476674418');
INSERT INTO `kl_form_item` VALUES ('107', '10', '导航图标', '', 'pic', 'bdpicture', '', '0', '3', '50', '1', '0', '', '', '', '', '1', '1476674376', '1476674376');
INSERT INTO `kl_form_item` VALUES ('108', '11', '上级单页', '', 'pid', 'select', 'select_single', '0', '3', '50', '1', '', '', '', '', '', '0', '1476675260', '1476675260');
INSERT INTO `kl_form_item` VALUES ('109', '11', '单页标题', '', 'title', 'string', '', '0', '3', '51', '1', '', '', '', '', '', '0', '1476675299', '1476675874');
INSERT INTO `kl_form_item` VALUES ('110', '11', '单页标识', '生成友好的url时可用', 'name', 'string', '', '0', '3', '52', '1', '', '', '', '', '', '0', '1476675339', '1476675875');
INSERT INTO `kl_form_item` VALUES ('111', '11', '单页内容', '此页面的一部分内容,可以扩充使用', 'content', 'umeditor', '', '0', '3', '58', '1', '', '', '', '', '', '1', '1476675476', '1476675829');
INSERT INTO `kl_form_item` VALUES ('112', '11', '单页排序', '', 'sort', 'number', '', '0', '3', '53', '1', '50', '', '', '', '', '0', '1476675506', '1476675877');
INSERT INTO `kl_form_item` VALUES ('113', '11', '单页状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '55', '1', '1', '', '', '', '', '0', '1476675537', '1476675880');
INSERT INTO `kl_form_item` VALUES ('114', '11', '单页模板', '此单页输出内容时用哪个模板', 'index_tpl', 'string', '', '0', '3', '54', '1', 'index', '', '', '', '', '0', '1476675611', '1476675882');
INSERT INTO `kl_form_item` VALUES ('115', '11', '单页SEO优化标题', '', 'meta_title', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1476675635', '1476675635');
INSERT INTO `kl_form_item` VALUES ('116', '11', '单页SEO优化关键字', '', 'meta_keywords', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1476675665', '1476675665');
INSERT INTO `kl_form_item` VALUES ('117', '11', '单页SEO优化描述', '', 'meta_descr', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1476675684', '1476675684');
INSERT INTO `kl_form_item` VALUES ('118', '2', '表单项排序', '', 'sort', 'number', '', '0', '3', '51', '1', '50', '', '', '', '', '0', '1476675998', '1476676183');
INSERT INTO `kl_form_item` VALUES ('119', '2', '表单项状态', '表单项状态', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '58', '1', '1', '', '', '', '', '0', '1476676085', '1476676276');
INSERT INTO `kl_form_item` VALUES ('120', '12', '产品分类', '', 'category_id', 'select', 'select_category=0,goods', '0', '3', '30', '1', '', '', '', '', '', '0', '1476678211', '1476679009');
INSERT INTO `kl_form_item` VALUES ('121', '12', '产品标题', '', 'title', 'string', '', '1', '3', '32', '1', '', '', '', '', '', '0', '1476678594', '1476679017');
INSERT INTO `kl_form_item` VALUES ('122', '12', '产品内容', '', 'content', 'umeditor', '', '0', '3', '40', '1', '', '', '', '', '', '0', '1476678633', '1476678981');
INSERT INTO `kl_form_item` VALUES ('123', '12', '产品封面图片', '', 'pic', 'bdpicture', '', '0', '3', '41', '1', '0', '', '', '', '', '1', '1476678681', '1476679064');
INSERT INTO `kl_form_item` VALUES ('124', '12', '产品相册', '', 'xc', 'bdbatchpicture', '', '0', '3', '42', '1', '', '', '', '', '', '1', '1476678711', '1476679066');
INSERT INTO `kl_form_item` VALUES ('125', '12', '产品状态', '', 'status', 'radio', '0:禁用\r\n1:正常\r\n2:草稿', '0', '3', '42', '1', '1', '', '', '', '', '0', '1476678769', '1476679035');
INSERT INTO `kl_form_item` VALUES ('126', '12', '产品价格', '', 'price', 'double', '', '1', '3', '38', '1', '0', '', '', '', '', '0', '1476678795', '1476679028');
INSERT INTO `kl_form_item` VALUES ('127', '12', '产品库存', '', 'stock', 'number', '', '1', '3', '36', '1', '100', '', '', '', '', '0', '1476678831', '1476679024');
INSERT INTO `kl_form_item` VALUES ('128', '12', '产品标记', '对此产品加一个标签', 'position', 'custom', 'goodsposition', '0', '3', '40', '1', '', '', '', '', '', '1', '1476678921', '1476679050');
INSERT INTO `kl_form_item` VALUES ('129', '7', '文章标签', '给此文章添加一些标签', 'position', 'custom', 'articlePosition', '0', '3', '50', '1', '', '', '', '', '', '1', '1476690824', '1476690824');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统产品表';

-- ----------------------------
-- Records of kl_goods
-- ----------------------------
INSERT INTO `kl_goods` VALUES ('1', '3', '一个测试产品标题', '', '0', '', '4,5,6,7', '1', '0', '100', '1476683724', '1476691481');

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
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序（同级有效）',
  `home` varchar(50) NOT NULL DEFAULT '' COMMENT '默认到首页',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否隐藏',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统后台菜单';

-- ----------------------------
-- Records of kl_menu
-- ----------------------------
INSERT INTO `kl_menu` VALUES ('1', '0', '常用', 'javascript:;', '默认', '40', '', '1', '1475558381', '1475676321');
INSERT INTO `kl_menu` VALUES ('8', '0', '用户', 'javascript:;', '默认', '50', '', '1', '1475632715', '1475935392');
INSERT INTO `kl_menu` VALUES ('2', '0', '文章', 'javascript:;', '默认', '50', '', '1', '1475558698', '1476066628');
INSERT INTO `kl_menu` VALUES ('3', '2', '文章列表', 'sys.article/lis', '默认', '50', '1', '1', '1475558868', '1476537815');
INSERT INTO `kl_menu` VALUES ('4', '0', '系统', 'javascript:;', '默认', '50', '', '1', '1475559327', '1475637160');
INSERT INTO `kl_menu` VALUES ('5', '4', '网站设置', 'sys.config/group', '默认', '50', '1', '1', '1475559362', '1476537761');
INSERT INTO `kl_menu` VALUES ('6', '4', '表单列表', 'sys.form/lis', '开发管理', '50', '', '1', '1475559401', '1475559401');
INSERT INTO `kl_menu` VALUES ('7', '4', '菜单列表', 'sys.menu/lis', '开发管理', '50', '', '1', '1475559431', '1475559431');
INSERT INTO `kl_menu` VALUES ('9', '8', '用户列表', 'sys.user/lis', '默认', '50', '1', '1', '1475632754', '1476537821');
INSERT INTO `kl_menu` VALUES ('10', '8', '用户组', 'sys.usergroup/lis', '默认', '50', '1', '1', '1475646121', '1476537835');
INSERT INTO `kl_menu` VALUES ('11', '4', '分类列表', 'sys.category/lis?category_type=article', '开发管理', '50', '1', '1', '1475818230', '1476537805');
INSERT INTO `kl_menu` VALUES ('12', '4', '权限列表', 'sys.authrule/lis', '开发管理', '50', '', '1', '1476346772', '1476346772');
INSERT INTO `kl_menu` VALUES ('13', '4', '备份数据库', 'sys.database/export', '数据备份', '50', '', '1', '1476430424', '1476430424');
INSERT INTO `kl_menu` VALUES ('14', '4', '还原数据库', 'sys.database/import', '数据备份', '50', '', '1', '1476430456', '1476430456');
INSERT INTO `kl_menu` VALUES ('15', '4', '导航列表', 'com.nav/lis', '默认', '50', '1', '1', '1476674031', '1476676833');
INSERT INTO `kl_menu` VALUES ('16', '4', '单页列表', 'com.single/lis', '默认', '50', '1', '1', '1476674689', '1476676832');
INSERT INTO `kl_menu` VALUES ('17', '4', '产品列表', 'com.goods/lis', '默认', '50', '0', '1', '1476678121', '1476678121');

-- ----------------------------
-- Table structure for kl_nav
-- ----------------------------
DROP TABLE IF EXISTS `kl_nav`;
CREATE TABLE `kl_nav` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级导航ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '导航标题',
  `url` char(100) NOT NULL DEFAULT '' COMMENT '导航连接',
  `sort` tinyint(10) unsigned NOT NULL DEFAULT '50' COMMENT '导航排序',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新窗口打开',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导航状态',
  `pic` int(10) NOT NULL DEFAULT '0' COMMENT '图标',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统前台导航';

-- ----------------------------
-- Records of kl_nav
-- ----------------------------
INSERT INTO `kl_nav` VALUES ('1', '0', '首页', '/', '50', '0', '1', '0', '1476674443', '1476674443');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='上传图片';

-- ----------------------------
-- Records of kl_picture
-- ----------------------------
INSERT INTO `kl_picture` VALUES ('8', '1', '487655527099084608.jpg', '14757599733704.jpg', '/uploads/image/20161006/14757599733704.jpg', '/uploads/image/20161006/14757599733704.jpg', '1', '', 'ca112da45a284e97305fb985fa703c35cb065b62', '1475759973', '0');
INSERT INTO `kl_picture` VALUES ('9', '1', '487655527099084608.jpg', '14757600065581.jpg', '/uploads/image/20161006/14757599733704.jpg', '/uploads/image/20161006/14757599733704.jpg', '1', '', 'ca112da45a284e97305fb985fa703c35cb065b62', '1475760006', '0');
INSERT INTO `kl_picture` VALUES ('10', '1', 'untitled1.png', '147615698856836.png', '/uploads/image/20161011/147615698856836.png', '/uploads/image/thumb/20161011/147615698856836.png', '1', '', '1d060c1be3d2271598c415c1c5fe18f87b2fba1c', '1476156988', '0');
INSERT INTO `kl_picture` VALUES ('11', '1', 'untitled1.png', '147615793915585.png', '/uploads/image/20161011/147615793915585.png', '/uploads/image/thumb/20161011/147615793915585.png', '1', '', '243916d22892148909b501eb7001f3c094811696', '1476157939', '0');
INSERT INTO `kl_picture` VALUES ('12', '1', 'QQ截图20160704105848.png', '147616607715034.png', '/uploads/image/20161011/147616607715034.png', '/uploads/image/thumb/20161011/147616607715034.png', '1', '', '88f2806ae3d20ea4b26d2814a60a37d1abdf9180', '1476166077', '0');
INSERT INTO `kl_picture` VALUES ('13', '1', 'touxiang.jpg', '147626103812915.jpg', '/uploads/image/20161012/147626103812915.jpg', '/uploads/image/thumb/20161012/147626103812915.jpg', '1', '', '5cc0b233c4656ffbafb8f39cf21cfd035a3fc199', '1476261038', '0');
INSERT INTO `kl_picture` VALUES ('14', '1', 'untitled2.png', '147633354557552.png', '/uploads/image/20161013/147633354557552.png', '/uploads/image/thumb/20161013/147633354557552.png', '1', '', '6c14a9658ff78ba3348816afe3550e0261da66c2', '1476333546', '0');
INSERT INTO `kl_picture` VALUES ('15', '1', 'touxiang.jpg', '147633953579878.jpg', '/uploads/image/20161013/147633953579878.jpg', '/uploads/image/thumb/20161013/147633953579878.jpg', '1', '', 'f718547e2f6b11e2186e053cbbc838cab12284bb', '1476339535', '0');

-- ----------------------------
-- Table structure for kl_single
-- ----------------------------
DROP TABLE IF EXISTS `kl_single`;
CREATE TABLE `kl_single` (
  `single_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单页的id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单页上级id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '单页标题',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '单页标识(url中使用)',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `meta_descr` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '单页中的内容',
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '单页状态',
  `index_tpl` varchar(50) NOT NULL DEFAULT 'index' COMMENT '单页模板文件名',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`single_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单页专题数据表';

-- ----------------------------
-- Records of kl_single
-- ----------------------------
INSERT INTO `kl_single` VALUES ('1', '0', '联系我们', 'contact', '', '', '', '', '50', '1', 'index', '1476676622', '1476676622');

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
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '详情地址',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `email_activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱是否激活',
  `reg_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '注册ip',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '最后登陆ip',
  `last_login_adr` varchar(50) NOT NULL DEFAULT '' COMMENT '最后登陆地址',
  `login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `pic` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户头像',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kl_user
-- ----------------------------
INSERT INTO `kl_user` VALUES ('1', '', '10000', '2', 'admin', '0c72320405722be71ba98ade695850b5', '啊哦', '3,58,485', 'asdf', '13633719215', '735579768@qq.com', '1', '', '127.0.0.1', '', '0', '1', '0', '0', '1476585499');
INSERT INTO `kl_user` VALUES ('2', '', '', '1', 'testtest', '0c72320405722be71ba98ade695850b5', '测试', '1,32,380', '模压', '13633719216', '7355797688@qq.com', '0', '127.0.0.1', '', '', '0', '1', '0', '1476425240', '1476585477');

-- ----------------------------
-- Table structure for kl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `kl_user_group`;
CREATE TABLE `kl_user_group` (
  `user_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组标题',
  `auth_rule` text NOT NULL COMMENT '用户组权限规则id',
  `admin_index` varchar(50) NOT NULL DEFAULT '' COMMENT '默认后台登陆主页',
  `denied` text NOT NULL COMMENT '不能访问的url',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `is_adminlogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许后台登陆',
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of kl_user_group
-- ----------------------------
INSERT INTO `kl_user_group` VALUES ('1', '管理员', '60,61,40,32,22,24,25,26,30,31,28,29,50,36,37,38,18,14,15,16,17,20,19,46,59,42,43,44,45,58,47,10,11,12,48,49,3,4,5,6,7,8,41,33,34,35,52,53,54,55,56', 'sys.config/group', '', '1', '1', '99', '0', '1476504181');
INSERT INTO `kl_user_group` VALUES ('2', '编辑组', '71,72,60,63,64,65,66,67,73,40,61,32,22,24', 'sys.config/group', '', '1', '1', '99', '1476425688', '1476611023');

-- ----------------------------
-- Table structure for kl_user_log
-- ----------------------------
DROP TABLE IF EXISTS `kl_user_log`;
CREATE TABLE `kl_user_log` (
  `user_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '操作ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '物理地址',
  `json_data` text NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户登陆日志';

-- ----------------------------
-- Records of kl_user_log
-- ----------------------------

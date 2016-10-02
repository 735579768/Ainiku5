/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ainiku5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-10-02 14:52:14
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
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置标识',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `note` varchar(100) NOT NULL COMMENT '配置说明',
  `value` text NOT NULL COMMENT '配置值',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `data_reg` varchar(50) DEFAULT NULL COMMENT '数据正则',
  `data_ok` varchar(50) DEFAULT NULL COMMENT '格式正确提示',
  `data_err` varchar(50) DEFAULT NULL COMMENT '格式错误提示',
  `data_ts` varchar(50) DEFAULT NULL COMMENT '默认提示文字',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of kl_config
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统模型';

-- ----------------------------
-- Records of kl_form
-- ----------------------------
INSERT INTO `kl_form` VALUES ('1', '菜单', 'Menu', '99', '1', '', '', '', '0', '0');
INSERT INTO `kl_form` VALUES ('2', '表单', 'Form', '99', '1', '', '', '', '1475391093', '1475391093');

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
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '表单项排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '表单项状态',
  `value` text NOT NULL COMMENT '表单项默认值',
  `data_ts` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项提示文字',
  `data_err` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项格式错误提示',
  `data_ok` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项格式正确提示',
  `data_reg` varchar(50) NOT NULL DEFAULT '' COMMENT '表单项正则验证',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`form_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统表单项属性';

-- ----------------------------
-- Records of kl_form_item
-- ----------------------------

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
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '分类标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '分类url',
  `group` varchar(50) NOT NULL DEFAULT '默认' COMMENT '分类分组',
  `type` char(50) NOT NULL DEFAULT 'system' COMMENT '分类类型',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否隐藏',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统后台菜单';

-- ----------------------------
-- Records of kl_menu
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传图片';

-- ----------------------------
-- Records of kl_picture
-- ----------------------------

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

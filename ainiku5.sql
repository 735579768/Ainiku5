/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ainiku5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-18 22:54:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kl_addon
-- ----------------------------
DROP TABLE IF EXISTS `kl_addon`;
CREATE TABLE `kl_addon` (
  `addon_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT '插件安装后的菜单id',
  `name` varchar(50) NOT NULL COMMENT '插件名字标题',
  `title` char(50) NOT NULL DEFAULT '' COMMENT '插件标识,小写',
  `version` char(50) NOT NULL DEFAULT '' COMMENT '插件版本',
  `author` char(50) NOT NULL DEFAULT '' COMMENT '作者',
  `descr` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `param` text NOT NULL COMMENT '插件参数',
  `type` char(50) NOT NULL DEFAULT 'other',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`addon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='扩展,插件安装数据库';

-- ----------------------------
-- Records of kl_addon
-- ----------------------------
INSERT INTO `kl_addon` VALUES ('1', '27', 'comment', '留言评论', '1.0.0', 'zhaokeli', '留言', '{\"\\/comment\\/config_html\":\"\",\"nickname\":\"1\",\"email\":\"1\",\"url\":\"1\",\"name\":\"comment\"}', 'other', '1', '1477037782', '1477299881');
INSERT INTO `kl_addon` VALUES ('2', '24', 'test', '插件名字', '1.0.0', '插件作者', '插件描述', '', 'other', '1', '1477035127', '1477035127');

-- ----------------------------
-- Table structure for kl_addon_comment
-- ----------------------------
DROP TABLE IF EXISTS `kl_addon_comment`;
CREATE TABLE `kl_addon_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `arc_id` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `email_notify` tinyint(1) DEFAULT '1',
  `ip` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kl_addon_comment
-- ----------------------------
INSERT INTO `kl_addon_comment` VALUES ('2', '0', '0', '测试评论', '内容', '名字', null, null, null, null, '1', '1', null, null, null);
INSERT INTO `kl_addon_comment` VALUES ('3', '0', '0', null, '你好这是个留言', '桂丹丹', null, '', '', null, '1', '1', null, null, '1477100010');
INSERT INTO `kl_addon_comment` VALUES ('4', '2', '0', null, '你好这是个留言', '桂丹丹', null, '', '', null, '1', '1', null, null, '1477100202');
INSERT INTO `kl_addon_comment` VALUES ('5', '2', '0', null, '你好这是个留言', '桂丹丹', null, '', '', null, '1', '1', null, null, '1477100274');

-- ----------------------------
-- Table structure for kl_article
-- ----------------------------
DROP TABLE IF EXISTS `kl_article`;
CREATE TABLE `kl_article` (
  `article_id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `category_id` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `pic` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章图片',
  `attachment` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件附件',
  `position` varchar(50) NOT NULL DEFAULT '' COMMENT '文章附加属性',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章状态',
  `views` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `color` varchar(8) NOT NULL DEFAULT '#000' COMMENT '颜色',
  `meta_title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章优化标题',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `meta_descr` text NOT NULL COMMENT '文章描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of kl_article
-- ----------------------------
INSERT INTO `kl_article` VALUES ('7', '1', '营养素会不会让人产生依赖性？病好后能不能停用？', '<p>sdaf<img src=\"/uploads/image/20161110/14787428236357.jpg\" _src=\"/uploads/image/20161110/14787428236357.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\">越来越多的会员通过营养调理获得了很好的调理效果，他们在高兴之余也多多少少有一些疑虑，不知道营养素会不会像一些特效药物一样让人体产生依赖性？下面我们一起来看看营养医学创始人王涛博士对于这个问题是如何解析的:</p><p style=\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\">大家为什么关心“可不可以不吃营养素”，我想是担心会对它产生依赖，从营养素本身来讲，它不会产生任何依赖，否则它不可能被允许自由买卖。另外，从营养调理的角度来讲，病好之后营养素完全可以停掉。</p><p style=\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\">那么某些特定的病人关心这个问题，比如糖尿病人，高血压病人，恐怕是担心将来要像吃降糖药，降压药一样吃一辈子营养素。因为大家都有这样的经验，这些药一停，血糖和血压立刻就上来了。但我们一直说，之所以不能停药，是因为这些药没有从根本上解决问题，而营养调理是从根本上解决了这些慢性病，那当然就可以停营养素了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\">从长久的健康来说，我们要正确理解营养的重要作用。其实我们每天吃饭就是在摄取营养，而我们之所以会生病，则是因为营养不均衡——营养调理可以持续地帮助大家解决营养均衡的问题，达到“没病”而且“长寿”的目的。而自己搭配饮食是很难做得这么精确的，所以从这个角度来说，我们是一直需要营养调理的。</p><p><br/></p>', '7', '0', '12,13', '1', '0', '#000000', '', '营养素,会不会,让人,产生,依赖性,病好,能不能,停用,营养,调理,营养素,我们,产生,这个', 'sdaf越来越多的会员通过营养调理获得了很好的调理效果，他们在高兴之余也多多少少有一些疑虑，不知道营养素会不会像一些特效药物一样让人体产生依赖性？下面我们一起来...', '1476081249', '1478746053');
INSERT INTO `kl_article` VALUES ('6', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538926');
INSERT INTO `kl_article` VALUES ('5', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538926');
INSERT INTO `kl_article` VALUES ('3', '2', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '-1', '0', '#000000', '', '', '', '1476081249', '1477358728');
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
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='系统权限规则表';

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
INSERT INTO `kl_auth_rule` VALUES ('85', '39', '图片管理', '', 'sys.picture/lis', '1', '', '1', '50', '1476769654', '1476769613');
INSERT INTO `kl_auth_rule` VALUES ('86', '39', '删除系统中的图片', '', 'sys.picture/delete', '1', '', '1', '50', '1476769635', '1476769635');
INSERT INTO `kl_auth_rule` VALUES ('87', '39', '重置图片sha1值', '', 'sys.picture/resetsha1', '1', '', '1', '50', '1476775681', '1476775681');
INSERT INTO `kl_auth_rule` VALUES ('88', '39', '重新生成图片缩略图', '', 'sys.picture/greatethumb', '1', '', '1', '50', '1476775710', '1476775710');
INSERT INTO `kl_auth_rule` VALUES ('89', '0', '产品管理', '', '', '1', '', '2', '50', '1476779256', '1476779256');
INSERT INTO `kl_auth_rule` VALUES ('90', '89', '产品列表', '', 'com.goods/lis', '1', '', '1', '50', '1476779282', '1476779282');
INSERT INTO `kl_auth_rule` VALUES ('91', '89', '添加产品', '', 'com.goods/add', '1', '', '1', '50', '1476779306', '1476779306');
INSERT INTO `kl_auth_rule` VALUES ('92', '89', '编辑产品', '', 'com.goods/edit', '1', '', '1', '50', '1476779333', '1476779333');
INSERT INTO `kl_auth_rule` VALUES ('93', '89', '删除产品', '', 'com.goods/delete', '1', '', '1', '50', '1476779357', '1476779357');
INSERT INTO `kl_auth_rule` VALUES ('94', '89', '移动产品', '', 'com.goods/move', '1', '', '1', '50', '1476779377', '1476779377');
INSERT INTO `kl_auth_rule` VALUES ('95', '89', '移动产品到回收站', '', 'com.goods/del', '1', '', '1', '50', '1476779404', '1476779404');
INSERT INTO `kl_auth_rule` VALUES ('96', '0', '产品回收站', '', '', '1', '', '2', '50', '1476779461', '1476779461');
INSERT INTO `kl_auth_rule` VALUES ('97', '96', '查看回收站产品', '', 'com.goods/recycle', '1', '', '1', '50', '1476779493', '1476779493');
INSERT INTO `kl_auth_rule` VALUES ('98', '96', '恢复产品', '', 'com.goods/huifu', '1', '', '1', '50', '1476779528', '1476779528');
INSERT INTO `kl_auth_rule` VALUES ('99', '96', '清空产品', '', 'com.goods/clearup', '1', '', '1', '50', '1476779547', '1476779547');
INSERT INTO `kl_auth_rule` VALUES ('100', '39', '系统环境', '查看系统环境路径等信息', 'sys.config/index', '1', '', '1', '50', '1476862617', '1476862617');
INSERT INTO `kl_auth_rule` VALUES ('101', '62', '添加文章标签', '给文章添加标签时要使用,如果有添加编辑文章的权限时这个也要给', 'sys.ajax/addcategory?category_type=article_tag', '1', '', '1', '50', '1477104329', '1477104329');
INSERT INTO `kl_auth_rule` VALUES ('102', '62', '添加产品标签', '给产品添加标签时要使用,如果有添加编辑产品的权限时这个也要给', 'sys.ajax/addcategory?category_type=goods_tag', '1', '', '1', '50', '1477104353', '1477104353');
INSERT INTO `kl_auth_rule` VALUES ('103', '13', '查看用户操作日志', '', 'sys.userlog/lis', '1', '', '1', '50', '1477105823', '1477105823');
INSERT INTO `kl_auth_rule` VALUES ('104', '13', '删除用户日志', '', 'sys.userlog/delete', '1', '', '1', '50', '1477105846', '1477105846');
INSERT INTO `kl_auth_rule` VALUES ('105', '13', '清空用户日志', '', 'sys.userlog/clearup', '1', '', '1', '50', '1477106582', '1477106582');

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
INSERT INTO `kl_category` VALUES ('1', '0', 'jiayong', '家用电器', '', '', '', '0', '99', 'article', '1', 'index', 'detail', '1475819457', '1475819457');
INSERT INTO `kl_category` VALUES ('2', '0', 'xishu', '洗漱用品', '', '', '', '0', '99', 'article', '1', 'index', 'detail', '1476501633', '1476501633');
INSERT INTO `kl_category` VALUES ('3', '0', 'miaosha', '秒杀产品', '', '', '', '0', '50', 'goods', '1', 'index', 'detail', '1476678421', '1477273850');
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
INSERT INTO `kl_config` VALUES ('1', '网站配置', 'web_config', '{\"web_domain\":\"http:\\/\\/www.ainiku5.loc\",\"web_meta_title\":\"\\u7231\\u4f60\\u9177\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"13\",\"third_code\":\"asdffasdfasf\",\"index_theme\":\"default\",\"admin_title\":\"\\u7231\\u4f60\\u9177\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"deariloveyoutoever\",\"mail_smtp_pwd\":\"01227328\",\"mail_smtp_fromemail\":\"deariloveyoutoever@163.com\",\"mail_smtp_receiveemail\":\"735579768@qq.com\",\"mail_smtp_fromname\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_subject\":\"\\u90ae\\u4ef6\\u4e3b\\u9898 \",\"send_email_btn\":\"wwwwwwwwwwww\",\"mail_smtp_test\":\"<p><img src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478528258750.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478820950141.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478851949711.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><\\/p>\",\"\\/sys_config\\/group_html\":\"\",\"app_debug\":\"1\",\"app_trace\":\"1\"}', '1475551684', '1479478862');

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
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='系统定义的表单项列表';

-- ----------------------------
-- Records of kl_form_item
-- ----------------------------
INSERT INTO `kl_form_item` VALUES ('1', '2', '所属表单', '此表单项是哪个表单里的', 'form_id', 'select', 'select_form', '0', '3', '50', '1', '', '', '', '', '', '0', '1475460202', '1476676137');
INSERT INTO `kl_form_item` VALUES ('2', '2', '表单项标题', '此表单项的标题', 'title', 'string', '', '1', '3', '50', '1', '', '', '', '', '', '0', '1475460781', '1477310520');
INSERT INTO `kl_form_item` VALUES ('3', '2', '表单项name值', '生成表单项时的name属性', 'name', 'string', '', '1', '3', '50', '1', '', '', '', '', '', '0', '1475460857', '1477310530');
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
INSERT INTO `kl_form_item` VALUES ('14', '1', '表单名称', '', 'title', 'string', '', '1', '3', '80', '1', '', '', '', '', '', '0', '1475462007', '1477310604');
INSERT INTO `kl_form_item` VALUES ('15', '1', '表单对应的数据表', '', 'name', 'string', '', '1', '3', '81', '1', '', '', '', '', '', '0', '1475462030', '1477310608');
INSERT INTO `kl_form_item` VALUES ('16', '1', '表单排序', '', 'sort', 'number', '', '1', '3', '84', '1', '50', '', '', '', '', '0', '1475462076', '1477310616');
INSERT INTO `kl_form_item` VALUES ('17', '1', '搜索格式字符串', '搜索列表的格式字符串', 'search_format', 'textarea', '', '0', '3', '86', '1', '', '', '', '', '', '0', '1475462140', '1475765263');
INSERT INTO `kl_form_item` VALUES ('18', '1', '列表格式字符串', '', 'list_format', 'textarea', '', '0', '3', '88', '1', '', '', '', '', '', '0', '1475462200', '1475765267');
INSERT INTO `kl_form_item` VALUES ('19', '1', '回收站格式字符串', '回收站列表格式字符串', 'recycle_format', 'textarea', '', '0', '3', '90', '1', '', '', '', '', '', '0', '1475462253', '1475765269');
INSERT INTO `kl_form_item` VALUES ('20', '2', '表单项类型', '此项表单的类型', 'type', 'select', 'select_form_type', '0', '3', '49', '1', '', '', '', '', '', '0', '1475472719', '1476676172');
INSERT INTO `kl_form_item` VALUES ('21', '1', '自动生成数据库表', '自动创建对应的数据表', 'auto_greate', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475480344', '1475480396');
INSERT INTO `kl_form_item` VALUES ('22', '2', '自动生成字段', '自动在对应的数据表中生成字段', 'auto_greate', 'radio', '0:否\r\n1:是', '0', '3', '52', '1', '0', '', '', '', '', '0', '1475480472', '1476676320');
INSERT INTO `kl_form_item` VALUES ('23', '4', '系统后台标题', '管理后台名字', 'admin_title', 'string', '', '0', '3', '30', '1', '管理平台', '', '', '', '', '4', '1475480737', '1476776121');
INSERT INTO `kl_form_item` VALUES ('24', '4', '网站优化标题', '网站前台的优化关键字', 'web_meta_title', 'string', '', '0', '3', '12', '1', '', '', '', '', '', '3', '1475483286', '1476776079');
INSERT INTO `kl_form_item` VALUES ('25', '4', '网站优化关键字', '网站前台的关键字', 'web_meta_keywords', 'string', '', '0', '3', '14', '1', '', '', '', '', '', '3', '1475483337', '1476776081');
INSERT INTO `kl_form_item` VALUES ('26', '4', '网站优化描述', '网站前台优化的描述', 'web_meta_descr', 'string', '', '0', '3', '16', '1', '', '', '', '', '', '3', '1475483379', '1476776083');
INSERT INTO `kl_form_item` VALUES ('27', '4', '网站主页地址', '网站主域名,结尾不要\'/\'', 'web_domain', 'string', '', '1', '3', '10', '1', '', '', '', '', '', '3', '1475505568', '1477311553');
INSERT INTO `kl_form_item` VALUES ('28', '4', '第三方代码', '网站附加的第三方统计代码', 'third_code', 'textarea', '', '0', '3', '20', '1', '', '', '', '', '', '3', '1475549466', '1476776094');
INSERT INTO `kl_form_item` VALUES ('29', '3', '上级菜单', '菜单的上级菜单', 'pid', 'select', 'select_menu', '0', '3', '59', '1', '', '', '', '', '', '0', '1475556014', '1476537190');
INSERT INTO `kl_form_item` VALUES ('30', '3', '菜单标题', '', 'title', 'string', '', '1', '3', '59', '1', '', '', '', '', '', '0', '1475557506', '1477311528');
INSERT INTO `kl_form_item` VALUES ('31', '3', '菜单url', '菜单地址,会被url函数解析', 'url', 'string', '', '1', '3', '59', '1', '', '', '', '', '', '0', '1475557539', '1477311530');
INSERT INTO `kl_form_item` VALUES ('32', '3', '菜单分组', '后台左侧菜单会根据这个值分组', 'group', 'string', '', '0', '3', '59', '1', '默认', '', '', '', '', '0', '1475557614', '1476537194');
INSERT INTO `kl_form_item` VALUES ('33', '3', '菜单排序', '', 'sort', 'number', '', '1', '3', '59', '1', '50', '', '', '', '', '0', '1475557696', '1477311532');
INSERT INTO `kl_form_item` VALUES ('34', '3', '菜单状态', '菜单是否隐藏', 'status', 'radio', '0:隐藏\r\n1:显示', '0', '3', '65', '1', '1', '', '', '', '', '0', '1475557739', '1476537216');
INSERT INTO `kl_form_item` VALUES ('35', '4', '系统列表默认显示行数', '', 'list_rows', 'number', '', '1', '3', '32', '1', '15', '', '', '', '', '4', '1475591736', '1477311561');
INSERT INTO `kl_form_item` VALUES ('36', '4', '网站LOGO', '', 'web_logo', 'bdpicture', '', '0', '3', '18', '1', '', '', '', '', '', '3', '1475592350', '1476776085');
INSERT INTO `kl_form_item` VALUES ('37', '4', '系统生成图片缩略图大小', '数据格式为200*200,宽*高', 'thumb_size', 'string', '', '1', '3', '34', '1', '200*200', '', '', '', '', '4', '1475594307', '1477311568');
INSERT INTO `kl_form_item` VALUES ('38', '4', '是否给上传的图片添加水印', '是否添加水印', 'shuiyin_on', 'radio', '0:否\r\n1:是', '0', '3', '39', '1', '0', '', '', '', '', '4', '1475594499', '1477222507');
INSERT INTO `kl_form_item` VALUES ('39', '4', '水印位置', '添加水印的位置', 'shuiyin_pos', 'radio', 'top_left:左上角\r\ntop_center:上面正中间\r\ntop_right:右上角\r\ncenter_center:正中间\r\nbottom_left:左下角\r\nbottom_right:右下角\r\nbottom_center:底部正中间', '0', '3', '41', '1', 'center_center', '', '', '', '', '4', '1475594626', '1476781325');
INSERT INTO `kl_form_item` VALUES ('40', '4', '文字水印颜色', '', 'shuiyin_text_color', 'color', '', '0', '3', '36', '1', '#000000', '', '', '', '', '4', '1475594749', '1476776328');
INSERT INTO `kl_form_item` VALUES ('41', '4', '文字水印字体大小', '', 'shuiyin_text_size', 'number', '', '0', '3', '37', '1', '14', '', '', '', '', '4', '1475594844', '1476776331');
INSERT INTO `kl_form_item` VALUES ('42', '4', '水印图片', '', 'shuiyin_image', 'bdpicture', '', '0', '3', '48', '1', '', '', '', '', '', '4', '1475595431', '1476776184');
INSERT INTO `kl_form_item` VALUES ('43', '4', '文字水印字符串', '最好使用英文字符', 'shuiyin_text', 'string', '', '1', '3', '35', '1', '爱你酷', '', '', '', '', '4', '1475597025', '1477311571');
INSERT INTO `kl_form_item` VALUES ('44', '5', '用户组名称', '', 'title', 'string', '', '1', '3', '99', '1', '', '', '', '', '', '0', '1475650110', '1477311640');
INSERT INTO `kl_form_item` VALUES ('45', '5', '用户组首页地址', '当前用户组登陆后的第一个页面地址', 'admin_index', 'string', '', '1', '3', '99', '1', '', '', '', '', '', '0', '1475651538', '1477311642');
INSERT INTO `kl_form_item` VALUES ('46', '5', '是否允许后台登陆', '', 'is_adminlogin', 'radio', '0:否\r\n1:是', '0', '3', '99', '1', '0', '', '', '', '', '0', '1475651609', '1475651609');
INSERT INTO `kl_form_item` VALUES ('47', '5', '用户组状态', '', 'status', 'radio', '0:禁用\r\n1:启用', '0', '3', '99', '1', '1', '', '', '', '', '0', '1475651713', '1475651713');
INSERT INTO `kl_form_item` VALUES ('48', '6', '所属用户组', '', 'user_group_id', 'select', 'select_user_group', '0', '3', '1', '1', '', '', '', '', '', '0', '1475652501', '1475670899');
INSERT INTO `kl_form_item` VALUES ('49', '6', '用户名', '', 'username', 'string', '', '1', '1', '3', '1', '', '', '', '', '', '0', '1475652702', '1475670904');
INSERT INTO `kl_form_item` VALUES ('50', '6', '密码', '', 'password', 'password', '', '1', '1', '5', '1', '', '', '', '', '', '0', '1475652746', '1475670908');
INSERT INTO `kl_form_item` VALUES ('51', '6', '昵称/姓名', '', 'nickname', 'string', '', '1', '3', '9', '1', '', '', '', '', '', '0', '1475652773', '1475670913');
INSERT INTO `kl_form_item` VALUES ('52', '6', '地址', '', 'diqu', 'liandong', '', '0', '3', '11', '1', '', '', '', '', '', '0', '1475652824', '1475670920');
INSERT INTO `kl_form_item` VALUES ('53', '6', '详细地址', '', 'address', 'string', '', '0', '3', '13', '1', '', '', '', '', '', '0', '1475652865', '1475670923');
INSERT INTO `kl_form_item` VALUES ('54', '6', '手机号', '', 'mobile', 'string', '', '1', '3', '15', '1', '', '', '', '', '', '0', '1475652881', '1477311656');
INSERT INTO `kl_form_item` VALUES ('55', '6', '邮箱', '', 'email', 'string', '', '1', '3', '17', '1', '', '', '', '', '', '0', '1475652904', '1477311656');
INSERT INTO `kl_form_item` VALUES ('56', '6', '邮箱是否激活', '', 'email_activate', 'radio', '0:否\r\n1:是', '0', '3', '19', '1', '0', '', '', '', '', '1', '1475652949', '1475670936');
INSERT INTO `kl_form_item` VALUES ('57', '6', '用户状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '21', '1', '1', '', '', '', '', '0', '1475653003', '1475670939');
INSERT INTO `kl_form_item` VALUES ('58', '6', '用户头像', '', 'pic', 'bdpicture', '', '0', '3', '23', '1', '', '', '', '', '', '1', '1475653041', '1475670942');
INSERT INTO `kl_form_item` VALUES ('59', '6', '重复密码', '再次输入密码', 'repassword', 'password', '', '1', '1', '7', '1', '', '', '', '', '', '0', '1475656915', '1475670947');
INSERT INTO `kl_form_item` VALUES ('60', '1', '表单对应的数据表备注', '数据表内容说明信息', 'note', 'string', '', '1', '3', '82', '1', '', '', '', '', '', '0', '1475765233', '1477310614');
INSERT INTO `kl_form_item` VALUES ('61', '8', '上级分类', '此分类的上级分类', 'pid', 'select', 'select_category=0,article', '0', '3', '21', '1', '', '', '', '', '', '0', '1475816878', '1475819261');
INSERT INTO `kl_form_item` VALUES ('62', '8', '分类的name标识', 'url优化时使用此name', 'name', 'string', '', '1', '3', '23', '1', '', '', '', '', '', '0', '1475816934', '1477311694');
INSERT INTO `kl_form_item` VALUES ('63', '8', '分类名称', '', 'title', 'string', '', '1', '3', '22', '1', '', '', '', '', '', '0', '1475817000', '1477311693');
INSERT INTO `kl_form_item` VALUES ('64', '8', '分类排序', '', 'sort', 'number', '', '1', '3', '25', '1', '50', '', '', '', '', '0', '1475817190', '1477311695');
INSERT INTO `kl_form_item` VALUES ('65', '8', '分类图标', '', 'icon', 'bdpicture', '', '0', '3', '97', '1', '', '', '', '', '', '1', '1475817224', '1475819234');
INSERT INTO `kl_form_item` VALUES ('66', '8', '此分类是哪种分类', '标识这个是哪种分类(默认是文章分类article)', 'category_type', 'select', 'select_category_type', '0', '3', '20', '1', 'article', '', '', '', '', '0', '1475817281', '1475841646');
INSERT INTO `kl_form_item` VALUES ('67', '8', '分类状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '26', '1', '1', '', '', '', '', '0', '1475817325', '1475819289');
INSERT INTO `kl_form_item` VALUES ('68', '8', '分类列表页模板', '', 'list_tpl', 'string', '', '0', '3', '95', '1', 'index', '', '', '', '', '1', '1475817394', '1475819226');
INSERT INTO `kl_form_item` VALUES ('69', '8', '分类内容详情页模板', '', 'detail_tpl', 'string', '', '0', '3', '96', '1', 'detail', '', '', '', '', '1', '1475817439', '1475819232');
INSERT INTO `kl_form_item` VALUES ('70', '8', '分类SEO优化标题', '', 'meta_title', 'string', '', '0', '3', '90', '1', '', '', '', '', '', '1', '1475819099', '1475819215');
INSERT INTO `kl_form_item` VALUES ('71', '8', '分类SEO优化关键字', '', 'meta_keywords', 'string', '', '0', '3', '91', '1', '', '', '', '', '', '1', '1475819143', '1475819217');
INSERT INTO `kl_form_item` VALUES ('72', '8', '分类SEO优化描述', '', 'meta_descr', 'string', '', '0', '3', '92', '1', '', '', '', '', '', '1', '1475819179', '1475819219');
INSERT INTO `kl_form_item` VALUES ('73', '7', '文章分类', '', 'category_id', 'select', 'select_category=0,article', '1', '3', '90', '1', '', '', '', '', '', '0', '1476067554', '1477311685');
INSERT INTO `kl_form_item` VALUES ('74', '7', '文章标题', '', 'title', 'string', '', '1', '3', '91', '1', '', '', '', '', '', '0', '1476067638', '1476069712');
INSERT INTO `kl_form_item` VALUES ('75', '7', '文章内容', '', 'content', 'editor', '', '0', '3', '93', '1', '', '', '', '', '', '0', '1476067664', '1479480554');
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
INSERT INTO `kl_form_item` VALUES ('87', '9', '排序', '', 'sort', 'string', '', '1', '3', '56', '1', '50', '', '', '', '', '0', '1476348019', '1477311706');
INSERT INTO `kl_form_item` VALUES ('88', '9', '此规则的类型', '1为权限规则,2为主菜单名称-分组使用', 'type', 'radio', '1:URL规则\r\n2:分组名称', '0', '3', '57', '1', '1', '', '', '', '', '0', '1476350680', '1476535780');
INSERT INTO `kl_form_item` VALUES ('89', '9', '规则备注说明', '', 'note', 'string', '', '0', '3', '53', '1', '', '', '', '', '', '0', '1476535684', '1476535789');
INSERT INTO `kl_form_item` VALUES ('90', '3', '默认到首页', '打开后台,默认显示到首页的菜单', 'home', 'radio', '0:否\r\n1:是', '0', '3', '60', '1', '0', '', '', '', '', '0', '1476537143', '1476537292');
INSERT INTO `kl_form_item` VALUES ('91', '4', 'SMTP邮件服务器 ', '', 'mail_smtp_host', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476612280', '1476612280');
INSERT INTO `kl_form_item` VALUES ('92', '4', 'SMTP服务器端口', '', 'mail_smtp_port', 'string', '', '0', '3', '50', '1', '25', '', '', '', '', '5', '1476612331', '1476612331');
INSERT INTO `kl_form_item` VALUES ('93', '4', 'SMTP服务器用户名', '如：service  不带后面的@xxx.com', 'mail_smtp_user', 'string', '', '0', '3', '50', '1', 'service', '', '', '', '', '5', '1476612407', '1476954689');
INSERT INTO `kl_form_item` VALUES ('94', '4', 'SMTP服务器密码', '', 'mail_smtp_pwd', 'password', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476612479', '1476612479');
INSERT INTO `kl_form_item` VALUES ('95', '4', '测试邮件内容', '', 'mail_smtp_test', 'umeditor', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476612668', '1479480591');
INSERT INTO `kl_form_item` VALUES ('96', '4', '发送来源的邮箱全名', '如 service@xxx.com', 'mail_smtp_fromemail', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476613487', '1476954716');
INSERT INTO `kl_form_item` VALUES ('97', '4', '测试的接收邮箱', '如 receive@xxx.com', 'mail_smtp_receiveemail', 'string', '', '0', '3', '50', '1', '735579768@qq.com', '', '', '', '', '5', '1476613580', '1476954962');
INSERT INTO `kl_form_item` VALUES ('98', '4', '邮件发送者名字', '一般设置成网站的名字,会显示在邮件发件人列表中', 'mail_smtp_fromname', 'string', '', '0', '3', '50', '1', '爱你酷', '', '', '', '', '5', '1476613661', '1476613661');
INSERT INTO `kl_form_item` VALUES ('99', '4', '邮件主题', '邮件内容的简要说明,会显示在邮件列表中的标题', 'mail_smtp_subject', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '5', '1476613744', '1476955037');
INSERT INTO `kl_form_item` VALUES ('100', '4', '点击发送测试邮件', '', 'send_email_btn', 'custom', 'sendemailbtn', '0', '3', '50', '1', '', '', '', '', '', '5', '1476615111', '1476615111');
INSERT INTO `kl_form_item` VALUES ('101', '10', '上级导航', '', 'pid', 'select', 'select_nav', '1', '3', '50', '1', '', '', '', '', '', '0', '1476674209', '1477311760');
INSERT INTO `kl_form_item` VALUES ('102', '10', '导航标题', '', 'title', 'string', '', '1', '3', '50', '1', '', '', '', '', '', '0', '1476674229', '1477311712');
INSERT INTO `kl_form_item` VALUES ('103', '10', '导航URL地址', '', 'url', 'string', '', '1', '3', '50', '1', '', '', '', '', '', '0', '1476674248', '1477311731');
INSERT INTO `kl_form_item` VALUES ('104', '10', '排序', '', 'sort', 'number', '', '1', '3', '50', '1', '50', '', '', '', '', '0', '1476674269', '1477311750');
INSERT INTO `kl_form_item` VALUES ('105', '10', '是否新页面打开', '', 'target', 'radio', '0:否\r\n1:是', '0', '3', '50', '1', '0', '', '', '', '', '0', '1476674303', '1476674303');
INSERT INTO `kl_form_item` VALUES ('106', '10', '导航状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '50', '1', '1', '', '', '', '', '1', '1476674341', '1476674418');
INSERT INTO `kl_form_item` VALUES ('107', '10', '导航图标', '', 'pic', 'bdpicture', '', '0', '3', '50', '1', '0', '', '', '', '', '1', '1476674376', '1476674376');
INSERT INTO `kl_form_item` VALUES ('108', '11', '上级单页', '', 'pid', 'select', 'select_single', '0', '3', '50', '1', '', '', '', '', '', '0', '1476675260', '1476675260');
INSERT INTO `kl_form_item` VALUES ('109', '11', '单页标题', '', 'title', 'string', '', '1', '3', '51', '1', '', '', '', '', '', '0', '1476675299', '1477311768');
INSERT INTO `kl_form_item` VALUES ('110', '11', '单页标识', '生成友好的url时可用', 'name', 'string', '', '1', '3', '52', '1', '', '', '', '', '', '0', '1476675339', '1477311769');
INSERT INTO `kl_form_item` VALUES ('111', '11', '单页内容', '此页面的一部分内容,可以扩充使用', 'content', 'umeditor', '', '0', '3', '58', '1', '', '', '', '', '', '1', '1476675476', '1476675829');
INSERT INTO `kl_form_item` VALUES ('112', '11', '单页排序', '', 'sort', 'number', '', '1', '3', '53', '1', '50', '', '', '', '', '0', '1476675506', '1477311771');
INSERT INTO `kl_form_item` VALUES ('113', '11', '单页状态', '', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '55', '1', '1', '', '', '', '', '0', '1476675537', '1476675880');
INSERT INTO `kl_form_item` VALUES ('114', '11', '单页模板', '此单页输出内容时用哪个模板', 'index_tpl', 'string', '', '1', '3', '54', '1', 'index', '', '', '', '', '0', '1476675611', '1477311773');
INSERT INTO `kl_form_item` VALUES ('115', '11', '单页SEO优化标题', '', 'meta_title', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1476675635', '1476675635');
INSERT INTO `kl_form_item` VALUES ('116', '11', '单页SEO优化关键字', '', 'meta_keywords', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1476675665', '1476675665');
INSERT INTO `kl_form_item` VALUES ('117', '11', '单页SEO优化描述', '', 'meta_descr', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '1', '1476675684', '1476675684');
INSERT INTO `kl_form_item` VALUES ('118', '2', '表单项排序', '', 'sort', 'number', '', '0', '3', '51', '1', '50', '', '', '', '', '0', '1476675998', '1476676183');
INSERT INTO `kl_form_item` VALUES ('119', '2', '表单项状态', '表单项状态', 'status', 'radio', '0:禁用\r\n1:正常', '0', '3', '58', '1', '1', '', '', '', '', '0', '1476676085', '1476676276');
INSERT INTO `kl_form_item` VALUES ('120', '12', '产品分类', '', 'category_id', 'select', 'select_category=0,goods', '1', '3', '30', '1', '', '', '', '', '', '0', '1476678211', '1477311782');
INSERT INTO `kl_form_item` VALUES ('121', '12', '产品标题', '', 'title', 'string', '', '1', '3', '32', '1', '', '', '', '', '', '0', '1476678594', '1476679017');
INSERT INTO `kl_form_item` VALUES ('122', '12', '产品内容', '', 'content', 'umeditor', '', '0', '3', '40', '1', '', '', '', '', '', '0', '1476678633', '1476678981');
INSERT INTO `kl_form_item` VALUES ('123', '12', '产品封面图片', '', 'pic', 'bdpicture', '', '0', '3', '41', '1', '0', '', '', '', '', '1', '1476678681', '1476679064');
INSERT INTO `kl_form_item` VALUES ('124', '12', '产品相册', '', 'xc', 'bdbatchpicture', '', '0', '3', '42', '1', '', '', '', '', '', '1', '1476678711', '1476679066');
INSERT INTO `kl_form_item` VALUES ('125', '12', '产品状态', '', 'status', 'radio', '0:禁用\r\n1:正常\r\n2:草稿', '0', '3', '42', '1', '1', '', '', '', '', '0', '1476678769', '1476679035');
INSERT INTO `kl_form_item` VALUES ('126', '12', '产品价格', '', 'price', 'double', '', '1', '3', '38', '1', '0', '', '', '', '', '0', '1476678795', '1476679028');
INSERT INTO `kl_form_item` VALUES ('127', '12', '产品库存', '', 'stock', 'number', '', '1', '3', '36', '1', '100', '', '', '', '', '0', '1476678831', '1476679024');
INSERT INTO `kl_form_item` VALUES ('128', '12', '产品标记', '对此产品加一个标签', 'position', 'custom', 'goodsposition', '0', '3', '40', '1', '', '', '', '', '', '1', '1476678921', '1476679050');
INSERT INTO `kl_form_item` VALUES ('129', '7', '文章标签', '给此文章添加一些标签', 'position', 'custom', 'articlePosition', '0', '3', '50', '1', '', '', '', '', '', '1', '1476690824', '1476690824');
INSERT INTO `kl_form_item` VALUES ('130', '4', '系统生成图片缩略图的方式', '系统按什么方法生成缩略图', 'thumb_model', 'radio', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '0', '3', '44', '1', '1', '', '', '', '', '4', '1476775965', '1476776337');
INSERT INTO `kl_form_item` VALUES ('131', '4', '添加的水印类型', '默认为文字水印', 'shuiyin_model', 'radio', '1:文字水印\r\n2:图片水印', '0', '3', '40', '1', '1', '', '', '', '', '4', '1476781033', '1476781383');
INSERT INTO `kl_form_item` VALUES ('132', '4', '图片大小超过多少时添加水印', '如果值为0则表示不分大小全部添加水印', 'shuiyin_minsize', 'string', '', '1', '3', '38', '1', '200*200', '', '', '', '', '4', '1476781193', '1477311613');
INSERT INTO `kl_form_item` VALUES ('133', '4', '后台模板主题', '', 'admin_theme', 'select', 'select_theme=admin', '0', '3', '50', '1', 'default', '', '', '', '', '4', '1476944305', '1476944305');
INSERT INTO `kl_form_item` VALUES ('134', '4', '网站前台主题', '前台网站使用的主题', 'index_theme', 'select', 'select_theme=index', '0', '3', '50', '1', 'default', '', '', '', '', '3', '1476944429', '1476944429');
INSERT INTO `kl_form_item` VALUES ('135', '4', '系统调试模式', '', 'app_debug', 'radio', '1:开启\r\n0:关闭', '0', '3', '50', '1', '0', '', '', '', '', '4', '1477398029', '1477405295');
INSERT INTO `kl_form_item` VALUES ('136', '4', '显示TRACE信息', '显示页面调试信息', 'app_trace', 'radio', '1:显示\r\n0:不显示', '0', '3', '50', '1', '0', '', '', '', '', '4', '1477404432', '1477404625');
INSERT INTO `kl_form_item` VALUES ('137', '3', '菜单的FONT图标类', '跟菜单一块显示的一个小图标', 'icon_class', 'string', '', '0', '3', '50', '1', 'fa-hand-o-right', '', '', '', '', '1', '1477672149', '1477672149');
INSERT INTO `kl_form_item` VALUES ('138', '12', 'SEO标题', '', 'meta_title', 'string', '', '0', '3', '31', '1', '', '', '', '', '', '1', '1478747317', '1478747458');
INSERT INTO `kl_form_item` VALUES ('139', '12', 'SEO关键字', '', 'meta_keywords', 'string', '', '0', '3', '32', '1', '', '', '', '', '', '1', '1478747355', '1478747459');
INSERT INTO `kl_form_item` VALUES ('140', '12', 'SEO描述', '', 'meta_descr', 'textarea', '', '0', '3', '33', '1', '', '', '', '', '', '1', '1478747392', '1478747461');

-- ----------------------------
-- Table structure for kl_goods
-- ----------------------------
DROP TABLE IF EXISTS `kl_goods`;
CREATE TABLE `kl_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(50) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '产品标题',
  `content` text NOT NULL COMMENT '产品描述',
  `pic` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品图片',
  `meta_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `meta_descr` text NOT NULL COMMENT 'SEO描述',
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
INSERT INTO `kl_goods` VALUES ('1', '3', '一个测试产品标题', '', '0', '', '一个,测试,产品,标题', '', '', '4,5,6,7', '1', '0', '100', '1476683724', '1478747664');

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
  `icon_class` varchar(50) NOT NULL DEFAULT 'fa-hand-o-right' COMMENT '菜单的FONT图标类',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='系统后台菜单';

-- ----------------------------
-- Records of kl_menu
-- ----------------------------
INSERT INTO `kl_menu` VALUES ('1', '0', '常用', 'javascript:;', '默认', '40', '', '1', 'fa-flash', '1475558381', '1477672523');
INSERT INTO `kl_menu` VALUES ('8', '0', '用户', 'javascript:;', '默认', '42', '0', '1', 'fa-user', '1475632715', '1477672371');
INSERT INTO `kl_menu` VALUES ('2', '0', '扩展', 'javascript:;', '默认', '99', '', '1', 'fa-puzzle-piece', '1475558698', '1477672416');
INSERT INTO `kl_menu` VALUES ('3', '4', '文章列表', 'sys.article/lis', '默认', '50', '1', '1', 'fa-th-list', '1475558868', '1477022230');
INSERT INTO `kl_menu` VALUES ('4', '0', '系统', 'javascript:;', '默认', '45', '', '1', 'fa-cog', '1475559327', '1477672338');
INSERT INTO `kl_menu` VALUES ('5', '4', '网站设置', 'sys.config/group', '默认', '50', '1', '1', 'fa-cogs', '1475559362', '1477700913');
INSERT INTO `kl_menu` VALUES ('6', '4', '表单列表', 'sys.form/lis', '开发管理', '50', '', '1', 'fa-th-list', '1475559401', '1477292907');
INSERT INTO `kl_menu` VALUES ('7', '4', '菜单列表', 'sys.menu/lis', '开发管理', '50', '', '1', 'fa-sitemap', '1475559431', '1475559431');
INSERT INTO `kl_menu` VALUES ('9', '8', '用户列表', 'sys.user/lis', '默认', '50', '1', '1', 'fa-user', '1475632754', '1477673254');
INSERT INTO `kl_menu` VALUES ('10', '8', '用户组', 'sys.usergroup/lis', '默认', '50', '1', '1', 'fa-users', '1475646121', '1477673235');
INSERT INTO `kl_menu` VALUES ('11', '4', '文章分类', 'sys.category/lis?category_type=article', '分类管理', '50', '1', '1', 'fa-sitemap', '1475818230', '1477229788');
INSERT INTO `kl_menu` VALUES ('12', '4', '权限列表', 'sys.authrule/lis', '开发管理', '50', '', '1', 'fa-lock', '1476346772', '1476346772');
INSERT INTO `kl_menu` VALUES ('13', '4', '备份数据库', 'sys.database/export', '数据备份', '50', '', '1', 'fa-database', '1476430424', '1477701001');
INSERT INTO `kl_menu` VALUES ('14', '4', '还原数据库', 'sys.database/import', '数据备份', '50', '', '1', 'fa-cloud-upload', '1476430456', '1476430456');
INSERT INTO `kl_menu` VALUES ('15', '4', '导航列表', 'com.nav/lis', '默认', '50', '1', '1', 'fa-bars', '1476674031', '1477702289');
INSERT INTO `kl_menu` VALUES ('16', '4', '单页列表', 'com.single/lis', '默认', '50', '1', '1', 'fa-fire', '1476674689', '1476676832');
INSERT INTO `kl_menu` VALUES ('17', '4', '产品列表', 'com.goods/lis', '默认', '50', '0', '1', 'fa-th-list', '1476678121', '1476678121');
INSERT INTO `kl_menu` VALUES ('18', '4', '图片管理', 'sys.picture/lis', '默认', '50', '0', '1', 'fa-picture-o', '1476769686', '1477700954');
INSERT INTO `kl_menu` VALUES ('19', '4', '系统信息', 'sys.config/index', '默认', '30', '1', '1', 'fa-info-circle', '1476858737', '1477673119');
INSERT INTO `kl_menu` VALUES ('20', '4', '产品分类', 'sys.category/lis?category_type=goods', '分类管理', '50', '0', '1', 'fa-sitemap', '1477012488', '1477229789');
INSERT INTO `kl_menu` VALUES ('21', '2', '已装插件', 'sys.addon/lis', '', '50', '0', '1', 'fa-plug', '1477022371', '1477700861');
INSERT INTO `kl_menu` VALUES ('24', '2', '插件名字', 'test/set', '插件管理', '50', '', '1', 'fa-fire', '1477035127', '1477035127');
INSERT INTO `kl_menu` VALUES ('27', '2', '留言评论', 'comment/set', '插件管理', '50', '', '1', 'fa-fire', '1477037782', '1477271916');
INSERT INTO `kl_menu` VALUES ('28', '8', '操作日志', 'sys.userlog/lis', '默认', '50', '0', '1', 'fa-history', '1477105775', '1477673319');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统前台导航';

-- ----------------------------
-- Records of kl_nav
-- ----------------------------
INSERT INTO `kl_nav` VALUES ('1', '0', '首页', '/', '50', '0', '1', '0', '1476674443', '1476674443');
INSERT INTO `kl_nav` VALUES ('2', '3', '关于我们', '/about.html', '50', '0', '1', '0', '1477300215', '1479131615');
INSERT INTO `kl_nav` VALUES ('3', '0', '商品选购', '/xg.html', '50', '0', '1', '0', '1477300267', '1477300329');

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
  `sha1` varchar(50) NOT NULL DEFAULT '' COMMENT '图片原文件的sha1码,去复时使用',
  `re_sha1` varchar(50) NOT NULL DEFAULT '' COMMENT '重新生成的sha1(可能会因为添加水印的情况跟原来sha1值不一样)',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`picture_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='上传图片';

-- ----------------------------
-- Records of kl_picture
-- ----------------------------
INSERT INTO `kl_picture` VALUES ('7', '1', '公众号二维码1.jpg', '14787428236357.jpg', '/uploads/image/20161110/14787428236357.jpg', '/uploads/image/20161110/14787428236357.jpg', '1', '', '6440af2a659fe160793831919f53d351b342c8db', '', '1478742823', '0');
INSERT INTO `kl_picture` VALUES ('8', '1', '1720018504.jpeg', '1479478528258750.jpeg', './uploads/image/20161118/1479478528258750.jpeg', './uploads/image/20161118/1479478528258750.jpeg', '1', '', '56cf7e2e88e81f3e67fa13b109061f7343501103', '', '1479478528', '0');
INSERT INTO `kl_picture` VALUES ('9', '1', 'IMG_20160413_182810.jpg', '1479478659716608.jpg', '/uploads/image/20161118/1479478659716608.jpg', '/uploads/image/20161118/1479478659716608.jpg', '1', '', 'ab3f3e976bf9895b525d764481c5381c04c3a4b5', '', '1479478659', '0');
INSERT INTO `kl_picture` VALUES ('10', '1', 'IMG_20160413_183046.jpg', '1479478767139564.jpg', '/uploads/image/20161118/1479478767139564.jpg', '/uploads/image/20161118/1479478767139564.jpg', '1', '', 'dc4d1740f341d60a750d12b674e76c087339a0f5', '', '1479478767', '0');
INSERT INTO `kl_picture` VALUES ('11', '1', '1720018504.jpeg', '1479478820950141.jpeg', '/uploads/image/20161118/1479478528258750.jpeg', '/uploads/image/20161118/1479478528258750.jpeg', '1', '', '56cf7e2e88e81f3e67fa13b109061f7343501103', '', '1479478820', '0');
INSERT INTO `kl_picture` VALUES ('12', '1', '1720018504.jpeg', '1479478851949711.jpeg', '/uploads/image/20161118/1479478528258750.jpeg', '/uploads/image/20161118/1479478528258750.jpeg', '1', '', '56cf7e2e88e81f3e67fa13b109061f7343501103', '', '1479478851', '0');
INSERT INTO `kl_picture` VALUES ('13', '1', '136390180.jpeg', '1479480132112145.jpeg', '/uploads/image/20161118/1479480132112145.jpeg', '/uploads/image/20161118/1479480132112145.jpeg', '1', '', 'a2b88c093b043e27c8a109bec966749913077653', '', '1479480132', '0');
INSERT INTO `kl_picture` VALUES ('14', '1', 'blob.png', '1479480343316584.png', '/uploads/image/20161118/1479480343316584.png', '/uploads/image/20161118/1479480343316584.png', '1', '', 'b5abec3440b2c2bd9a874c400eb95a29416e7606', '', '1479480343', '0');
INSERT INTO `kl_picture` VALUES ('15', '1', 'blob.png', '1479480361133751.png', '/uploads/image/20161118/1479480361133751.png', '/uploads/image/20161118/1479480361133751.png', '1', '', '62f901474b10b2287d2b309b27cefd51384a36dd', '', '1479480361', '0');
INSERT INTO `kl_picture` VALUES ('16', '1', 'blob.png', '14794806007735.png', '/uploads/image/20161118/1479480361133751.png', '/uploads/image/20161118/1479480361133751.png', '1', '', '62f901474b10b2287d2b309b27cefd51384a36dd', '', '1479480600', '0');
INSERT INTO `kl_picture` VALUES ('17', '1', 'blob.png', '14794806234635.png', '/uploads/image/20161118/1479480361133751.png', '/uploads/image/20161118/1479480361133751.png', '1', '', '62f901474b10b2287d2b309b27cefd51384a36dd', '', '1479480623', '0');
INSERT INTO `kl_picture` VALUES ('18', '1', 'blob.png', '14794806247578.png', '/uploads/image/20161118/1479480361133751.png', '/uploads/image/20161118/1479480361133751.png', '1', '', '62f901474b10b2287d2b309b27cefd51384a36dd', '', '1479480624', '0');

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
INSERT INTO `kl_user` VALUES ('1', '', '10000', '1', 'admin', '0c72320405722be71ba98ade695850b5', '啊哦', '3,58,485', 'asdf', '13633719215', '735579768@qq.com', '1', '', '127.0.0.1', '', '0', '1', '0', '0', '1476585499');
INSERT INTO `kl_user` VALUES ('2', '', '', '1', 'testtest', '0c72320405722be71ba98ade695850b5', '测试', '1,32,380', '模压', '13633719216', '7355797688@qq.com', '0', '127.0.0.1', '', '', '0', '1', '0', '1476425240', '1477105571');

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
INSERT INTO `kl_user_group` VALUES ('1', '管理员', '60,61,40,32,22,24,25,26,30,31,28,29,50,36,37,38,18,14,15,16,17,20,19,46,59,42,43,44,45,58,47,10,11,12,48,49,3,4,5,6,7,8,41,33,34,35,52,53,54,55,56', 'sys.config/group', '', '1', '1', '99', '0', '1477358355');
INSERT INTO `kl_user_group` VALUES ('2', '编辑组', '71,72,60,63,64,65,66,67,73,101,102,40,61,32,22,24', 'sys.config/group', '', '1', '1', '99', '1476425688', '1477104423');

-- ----------------------------
-- Table structure for kl_user_log
-- ----------------------------
DROP TABLE IF EXISTS `kl_user_log`;
CREATE TABLE `kl_user_log` (
  `user_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `note` varchar(50) NOT NULL DEFAULT '' COMMENT '日志备注',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '操作ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '物理地址',
  `json_data` text NOT NULL COMMENT '日志备忘数据',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COMMENT='用户登陆日志';

-- ----------------------------
-- Records of kl_user_log
-- ----------------------------
INSERT INTO `kl_user_log` VALUES ('6', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u662f\\u5426\\u7ed9\\u4e0a\\u4f20\\u7684\\u56fe\\u7247\\u6dfb\\u52a0\\u6c34\\u5370\",\"name\":\"shuiyin_on\",\"note\":\"\\u662f\\u5426\\u6dfb\\u52a0\\u6c34\\u5370\",\"value\":\"0\",\"sort\":\"39\",\"is_require\":\"0\",\"tab_id\":\"4\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u5426\\r\\n1:\\u662f\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"38\"}', '1477222507', '1477222507');
INSERT INTO `kl_user_log` VALUES ('7', '1', '添加导航', '127.0.0.1', '', '{\"\\/com_nav\\/add_html\":\"\",\"pid\":\"0\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"\\/about.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\"}', '1477300215', '1477300215');
INSERT INTO `kl_user_log` VALUES ('8', '1', '添加导航', '127.0.0.1', '', '{\"\\/com_nav\\/add_html\":\"\",\"pid\":\"0\",\"title\":\"\\u5546\\u54c1\\u9009\\u8d2d\",\"url\":\"\\/xg.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\"}', '1477300267', '1477300267');
INSERT INTO `kl_user_log` VALUES ('9', '1', '编辑导航', '127.0.0.1', '', '{\"\\/com_nav\\/edit_html\":\"\",\"pid\":\"1\",\"title\":\"\\u5546\\u54c1\\u9009\\u8d2d\",\"url\":\"\\/xg.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\",\"nav_id\":\"3\"}', '1477300283', '1477300283');
INSERT INTO `kl_user_log` VALUES ('10', '1', '编辑导航', '127.0.0.1', '', '{\"\\/com_nav\\/edit_html\":\"\",\"pid\":\"3\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"\\/about.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\",\"nav_id\":\"2\"}', '1477300297', '1477300297');
INSERT INTO `kl_user_log` VALUES ('11', '1', '编辑导航', '127.0.0.1', '', '{\"\\/com_nav\\/edit_html\":\"\",\"pid\":\"0\",\"title\":\"\\u5546\\u54c1\\u9009\\u8d2d\",\"url\":\"\\/xg.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\",\"nav_id\":\"3\"}', '1477300329', '1477300329');
INSERT INTO `kl_user_log` VALUES ('12', '1', '编辑导航', '127.0.0.1', '', '{\"\\/com_nav\\/edit_html\":\"\",\"pid\":\"1\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"\\/about.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\",\"nav_id\":\"2\"}', '1477300344', '1477300344');
INSERT INTO `kl_user_log` VALUES ('13', '1', '编辑导航', '127.0.0.1', '', '{\"\\/com_nav\\/edit_html\":\"\",\"pid\":\"0\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"\\/about.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\",\"nav_id\":\"2\"}', '1477300363', '1477300363');
INSERT INTO `kl_user_log` VALUES ('14', '1', '编辑用户组', '127.0.0.1', '', '{\"\\/sys_usergroup\\/edit_html\":\"\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"admin_index\":\"sys.config\\/group\",\"is_adminlogin\":\"1\",\"status\":\"1\",\"user_group_id\":\"1\"}', '1477358355', '1477358355');
INSERT INTO `kl_user_log` VALUES ('15', '1', '文章移动到回收站', '127.0.0.1', '', '{\"\\/sys_article\\/del\\/article_id\\/3_html\":\"\",\"article_id\":\"3\"}', '1477358728', '1477358728');
INSERT INTO `kl_user_log` VALUES ('16', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"adminywdg\",\"mail_smtp_pwd\":\"adminrootkl\",\"mail_smtp_fromemail\":\"deariloveyoutoever@163.com\",\"mail_smtp_receiveemail\":\"735579768@qq.com\",\"mail_smtp_fromname\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_subject\":\"\\u90ae\\u4ef6\\u4e3b\\u9898 \",\"mail_smtp_test\":\"<p><img src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\"\\/><\\/p>\"}', '1477359362', '1477359362');
INSERT INTO `kl_user_log` VALUES ('17', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7231\\u4f60\\u9177\",\"list_rows\":\"12\",\"thumb_size\":\"120*120\",\"shuiyin_text\":\"www.ainiku.com\",\"shuiyin_text_color\":\"#FFFFFF\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"3\",\"shuiyin_image\":\"4\",\"admin_theme\":\"default\"}', '1477382171', '1477382171');
INSERT INTO `kl_user_log` VALUES ('18', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477383082', '1477383082');
INSERT INTO `kl_user_log` VALUES ('19', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477392000', '1477392000');
INSERT INTO `kl_user_log` VALUES ('20', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"name\":\"app_debug\",\"note\":\"\\u662f\\u5426\\u5f00\\u542f\\u7cfb\\u7edf\\u7684\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"0\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u5173\\u95ed\\r\\n1:\\u5f00\\u542f\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477397390', '1477397390');
INSERT INTO `kl_user_log` VALUES ('21', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477397543', '1477397543');
INSERT INTO `kl_user_log` VALUES ('22', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477397631', '1477397631');
INSERT INTO `kl_user_log` VALUES ('23', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477397638', '1477397638');
INSERT INTO `kl_user_log` VALUES ('24', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477397672', '1477397672');
INSERT INTO `kl_user_log` VALUES ('25', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477397684', '1477397684');
INSERT INTO `kl_user_log` VALUES ('26', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477397698', '1477397698');
INSERT INTO `kl_user_log` VALUES ('27', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"type\":\"string\",\"form_id\":\"4\",\"title\":\"\\u7cfb\\u7edf\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"name\":\"app_debug\",\"note\":\"\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"0\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u5173\\u95ed\\r\\n1:\\u5f00\\u542f\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477397828', '1477397828');
INSERT INTO `kl_user_log` VALUES ('28', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"4\",\"title\":\"\\u7cfb\\u7edf\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"name\":\"app_debug\",\"note\":\"\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"0\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u5173\\u95ed\\r\\n1:\\u5f00\\u542f\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477398029', '1477398029');
INSERT INTO `kl_user_log` VALUES ('29', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"string\",\"form_id\":\"4\",\"title\":\"\\u7cfb\\u7edf\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"name\":\"app_debug\",\"note\":\"\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"4\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u5173\\u95ed\\r\\n1:\\u5f00\\u542f\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"135\"}', '1477398136', '1477398136');
INSERT INTO `kl_user_log` VALUES ('30', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u7cfb\\u7edf\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"name\":\"app_debug\",\"note\":\"\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"4\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u5173\\u95ed\\r\\n1:\\u5f00\\u542f\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"135\"}', '1477398156', '1477398156');
INSERT INTO `kl_user_log` VALUES ('31', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477398380', '1477398380');
INSERT INTO `kl_user_log` VALUES ('32', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7231\\u4f60\\u9177\",\"list_rows\":\"12\",\"thumb_size\":\"120*120\",\"shuiyin_text\":\"www.ainiku.com\",\"shuiyin_text_color\":\"#FFFFFF\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"3\",\"shuiyin_image\":\"4\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477398393', '1477398393');
INSERT INTO `kl_user_log` VALUES ('33', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477398545', '1477398545');
INSERT INTO `kl_user_log` VALUES ('34', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477399171', '1477399171');
INSERT INTO `kl_user_log` VALUES ('35', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"0\"}', '1477399317', '1477399317');
INSERT INTO `kl_user_log` VALUES ('36', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477399382', '1477399382');
INSERT INTO `kl_user_log` VALUES ('37', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477399503', '1477399503');
INSERT INTO `kl_user_log` VALUES ('38', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477399645', '1477399645');
INSERT INTO `kl_user_log` VALUES ('39', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477399664', '1477399664');
INSERT INTO `kl_user_log` VALUES ('40', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477403542', '1477403542');
INSERT INTO `kl_user_log` VALUES ('41', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"0\"}', '1477403641', '1477403641');
INSERT INTO `kl_user_log` VALUES ('42', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477403759', '1477403759');
INSERT INTO `kl_user_log` VALUES ('43', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\"}', '1477403789', '1477403789');
INSERT INTO `kl_user_log` VALUES ('44', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u663e\\u793aTRACE\\u4fe1\\u606f\",\"name\":\"trace\",\"note\":\"\\u663e\\u793a\\u9875\\u9762\\u8c03\\u8bd5\\u4fe1\\u606f\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"4\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u4e0d\\u663e\\u793a\\r\\n1:\\u663e\\u793a\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477404432', '1477404432');
INSERT INTO `kl_user_log` VALUES ('45', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\",\"trace\":\"1\"}', '1477404503', '1477404503');
INSERT INTO `kl_user_log` VALUES ('46', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477404531', '1477404531');
INSERT INTO `kl_user_log` VALUES ('47', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477404556', '1477404556');
INSERT INTO `kl_user_log` VALUES ('48', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u663e\\u793aTRACE\\u4fe1\\u606f\",\"name\":\"app_trace\",\"note\":\"\\u663e\\u793a\\u9875\\u9762\\u8c03\\u8bd5\\u4fe1\\u606f\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"4\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"1:\\u663e\\u793a\\r\\n0:\\u4e0d\\u663e\\u793a\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"136\"}', '1477404625', '1477404625');
INSERT INTO `kl_user_log` VALUES ('49', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\",\"app_trace\":\"1\"}', '1477404637', '1477404637');
INSERT INTO `kl_user_log` VALUES ('50', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477404692', '1477404692');
INSERT INTO `kl_user_log` VALUES ('51', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477405219', '1477405219');
INSERT INTO `kl_user_log` VALUES ('52', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u7cfb\\u7edf\\u8c03\\u8bd5\\u6a21\\u5f0f\",\"name\":\"app_debug\",\"note\":\"\",\"value\":\"0\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"4\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"1:\\u5f00\\u542f\\r\\n0:\\u5173\\u95ed\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"135\"}', '1477405295', '1477405295');
INSERT INTO `kl_user_log` VALUES ('53', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477405317', '1477405317');
INSERT INTO `kl_user_log` VALUES ('54', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\"}', '1477405449', '1477405449');
INSERT INTO `kl_user_log` VALUES ('55', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477405459', '1477405459');
INSERT INTO `kl_user_log` VALUES ('56', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477405747', '1477405747');
INSERT INTO `kl_user_log` VALUES ('57', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477406585', '1477406585');
INSERT INTO `kl_user_log` VALUES ('58', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477407123', '1477407123');
INSERT INTO `kl_user_log` VALUES ('59', '1', '更新网站配置', '192.168.198.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\",\"app_trace\":\"1\"}', '1477485744', '1477485744');
INSERT INTO `kl_user_log` VALUES ('60', '1', '更新网站配置', '192.168.198.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\"}', '1477485808', '1477485808');
INSERT INTO `kl_user_log` VALUES ('61', '1', '更新网站配置', '192.168.198.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\",\"app_trace\":\"0\"}', '1477485912', '1477485912');
INSERT INTO `kl_user_log` VALUES ('62', '1', '更新网站配置', '192.168.198.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\",\"app_trace\":\"1\"}', '1477485919', '1477485919');
INSERT INTO `kl_user_log` VALUES ('63', '1', '清理缓存', '192.168.198.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477485960', '1477485960');
INSERT INTO `kl_user_log` VALUES ('64', '1', '清理缓存', '192.168.198.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1477486044', '1477486044');
INSERT INTO `kl_user_log` VALUES ('65', '1', '更新kl_menu.icon_class字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"3\",\"title\":\"\\u83dc\\u5355\\u7684FONT\\u56fe\\u6807\\u7c7b\",\"name\":\"icon_class\",\"note\":\"\\u8ddf\\u83dc\\u5355\\u4e00\\u5757\\u663e\\u793a\\u7684\\u4e00\\u4e2a\\u5c0f\\u56fe\\u6807\",\"value\":\"fa-hand-o-right\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477671401', '1477671401');
INSERT INTO `kl_user_log` VALUES ('66', '1', '更新kl_menu.icon_class字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"3\",\"title\":\"\\u83dc\\u5355\\u7684FONT\\u56fe\\u6807\\u7c7b\",\"name\":\"icon_class\",\"note\":\"\\u8ddf\\u83dc\\u5355\\u4e00\\u5757\\u663e\\u793a\\u7684\\u4e00\\u4e2a\\u5c0f\\u56fe\\u6807\",\"value\":\"fa-hand-o-right\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477671659', '1477671659');
INSERT INTO `kl_user_log` VALUES ('67', '1', '更新kl_menu.icon_class字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"3\",\"title\":\"\\u83dc\\u5355\\u7684FONT\\u56fe\\u6807\\u7c7b\",\"name\":\"icon_class\",\"note\":\"\\u8ddf\\u83dc\\u5355\\u4e00\\u5757\\u663e\\u793a\\u7684\\u4e00\\u4e2a\\u5c0f\\u56fe\\u6807\",\"value\":\"fa-hand-o-right\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477671709', '1477671709');
INSERT INTO `kl_user_log` VALUES ('68', '1', '更新kl_menu.icon_class字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"3\",\"title\":\"\\u83dc\\u5355\\u7684FONT\\u56fe\\u6807\\u7c7b\",\"name\":\"icon_class\",\"note\":\"\\u8ddf\\u83dc\\u5355\\u4e00\\u5757\\u663e\\u793a\\u7684\\u4e00\\u4e2a\\u5c0f\\u56fe\\u6807\",\"value\":\"fa-hand-o-right\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477671760', '1477671760');
INSERT INTO `kl_user_log` VALUES ('69', '1', '更新kl_menu.icon_class字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"3\",\"title\":\"\\u83dc\\u5355\\u7684FONT\\u56fe\\u6807\\u7c7b\",\"name\":\"icon_class\",\"note\":\"\\u8ddf\\u83dc\\u5355\\u4e00\\u5757\\u663e\\u793a\\u7684\\u4e00\\u4e2a\\u5c0f\\u56fe\\u6807\",\"value\":\"fa-hand-o-right\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477672149', '1477672149');
INSERT INTO `kl_user_log` VALUES ('70', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"3\",\"title\":\"\\u83dc\\u5355\\u7684FONT\\u56fe\\u6807\\u7c7b\",\"name\":\"icon_class\",\"note\":\"\\u8ddf\\u83dc\\u5355\\u4e00\\u5757\\u663e\\u793a\\u7684\\u4e00\\u4e2a\\u5c0f\\u56fe\\u6807\",\"value\":\"fa-hand-o-right\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1477672149', '1477672149');
INSERT INTO `kl_user_log` VALUES ('71', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"0\",\"title\":\"\\u7cfb\\u7edf\",\"url\":\"javascript:;\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"45\",\"status\":\"1\",\"icon_class\":\"fa-cog\",\"menu_id\":\"4\"}', '1477672338', '1477672338');
INSERT INTO `kl_user_log` VALUES ('72', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"0\",\"title\":\"\\u7528\\u6237\",\"url\":\"javascript:;\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"42\",\"home\":\"0\",\"status\":\"1\",\"icon_class\":\"fa-user\",\"menu_id\":\"8\"}', '1477672371', '1477672371');
INSERT INTO `kl_user_log` VALUES ('73', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"0\",\"title\":\"\\u6269\\u5c55\",\"url\":\"javascript:;\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"99\",\"status\":\"1\",\"icon_class\":\"fa-puzzle-piece\",\"menu_id\":\"2\"}', '1477672416', '1477672416');
INSERT INTO `kl_user_log` VALUES ('74', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"0\",\"title\":\"\\u5e38\\u7528\",\"url\":\"javascript:;\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"40\",\"status\":\"1\",\"icon_class\":\"fa-flash\",\"menu_id\":\"1\"}', '1477672523', '1477672523');
INSERT INTO `kl_user_log` VALUES ('75', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"4\",\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"url\":\"sys.config\\/index\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"30\",\"home\":\"1\",\"status\":\"1\",\"icon_class\":\"fa-info-circle\",\"menu_id\":\"19\"}', '1477673119', '1477673119');
INSERT INTO `kl_user_log` VALUES ('76', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"8\",\"title\":\"\\u7528\\u6237\\u7ec4\",\"url\":\"sys.usergroup\\/lis\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"50\",\"home\":\"1\",\"status\":\"1\",\"icon_class\":\"fa-users\",\"menu_id\":\"10\"}', '1477673235', '1477673235');
INSERT INTO `kl_user_log` VALUES ('77', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"8\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"url\":\"sys.user\\/lis\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"50\",\"home\":\"1\",\"status\":\"1\",\"icon_class\":\"fa-user\",\"menu_id\":\"9\"}', '1477673254', '1477673254');
INSERT INTO `kl_user_log` VALUES ('78', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"8\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"url\":\"sys.userlog\\/lis\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"50\",\"home\":\"0\",\"status\":\"1\",\"icon_class\":\"fa-history\",\"menu_id\":\"28\"}', '1477673319', '1477673319');
INSERT INTO `kl_user_log` VALUES ('79', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"2\",\"title\":\"\\u5df2\\u88c5\\u63d2\\u4ef6\",\"url\":\"sys.addon\\/lis\",\"group\":\"\",\"sort\":\"50\",\"home\":\"0\",\"status\":\"1\",\"icon_class\":\"fa-plug\",\"menu_id\":\"21\"}', '1477700861', '1477700861');
INSERT INTO `kl_user_log` VALUES ('80', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"4\",\"title\":\"\\u7f51\\u7ad9\\u8bbe\\u7f6e\",\"url\":\"sys.config\\/group\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"50\",\"home\":\"1\",\"status\":\"1\",\"icon_class\":\"fa-cogs\",\"menu_id\":\"5\"}', '1477700913', '1477700913');
INSERT INTO `kl_user_log` VALUES ('81', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"4\",\"title\":\"\\u56fe\\u7247\\u7ba1\\u7406\",\"url\":\"sys.picture\\/lis\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"50\",\"home\":\"0\",\"status\":\"1\",\"icon_class\":\"fa-picture-o\",\"menu_id\":\"18\"}', '1477700954', '1477700954');
INSERT INTO `kl_user_log` VALUES ('82', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"4\",\"title\":\"\\u5907\\u4efd\\u6570\\u636e\\u5e93\",\"url\":\"sys.database\\/export\",\"group\":\"\\u6570\\u636e\\u5907\\u4efd\",\"sort\":\"50\",\"status\":\"1\",\"icon_class\":\"fa-database\",\"menu_id\":\"13\"}', '1477701001', '1477701001');
INSERT INTO `kl_user_log` VALUES ('83', '1', '编辑菜单', '127.0.0.1', '', '{\"\\/sys_menu\\/edit_html\":\"\",\"pid\":\"4\",\"title\":\"\\u5bfc\\u822a\\u5217\\u8868\",\"url\":\"com.nav\\/lis\",\"group\":\"\\u9ed8\\u8ba4\",\"sort\":\"50\",\"home\":\"1\",\"status\":\"1\",\"icon_class\":\"fa-bars\",\"menu_id\":\"15\"}', '1477702289', '1477702289');
INSERT INTO `kl_user_log` VALUES ('84', '1', '修复数据表', '127.0.0.1', '', '{\"\\/sys_database\\/repair_html\":\"\",\"tables\":[\"kl_addon\",\"kl_addon_comment\",\"kl_article\",\"kl_auth_rule\",\"kl_category\",\"kl_config\",\"kl_file\",\"kl_form\",\"kl_form_item\",\"kl_goods\",\"kl_menu\",\"kl_nav\",\"kl_picture\",\"kl_single\",\"kl_user\",\"kl_user_group\",\"kl_user_log\"]}', '1477735086', '1477735086');
INSERT INTO `kl_user_log` VALUES ('85', '1', '优化数据表', '127.0.0.1', '', '{\"\\/sys_database\\/optimize_html\":\"\",\"tables\":[\"kl_addon\",\"kl_addon_comment\",\"kl_article\",\"kl_auth_rule\",\"kl_category\",\"kl_config\",\"kl_file\",\"kl_form\",\"kl_form_item\",\"kl_goods\",\"kl_menu\",\"kl_nav\",\"kl_picture\",\"kl_single\",\"kl_user\",\"kl_user_group\",\"kl_user_log\"]}', '1477735090', '1477735090');
INSERT INTO `kl_user_log` VALUES ('86', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477752989', '1477752989');
INSERT INTO `kl_user_log` VALUES ('87', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7231\\u4f60\\u9177\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"1\",\"app_trace\":\"1\"}', '1477756474', '1477756474');
INSERT INTO `kl_user_log` VALUES ('88', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1477758255', '1477758255');
INSERT INTO `kl_user_log` VALUES ('89', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"\",\"article_id\":\"7\",\"content\":\"<p>sdaf<\\/p>\"}', '1477893732', '1477893732');
INSERT INTO `kl_user_log` VALUES ('90', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"deariloveyoutoever\",\"mail_smtp_pwd\":\"01227328\",\"mail_smtp_fromemail\":\"deariloveyoutoever@163.com\",\"mail_smtp_receiveemail\":\"735579768@qq.com\",\"mail_smtp_fromname\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_subject\":\"\\u90ae\\u4ef6\\u4e3b\\u9898 \",\"mail_smtp_test\":\"<p><img src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\"\\/><\\/p>\"}', '1478740274', '1478740274');
INSERT INTO `kl_user_log` VALUES ('91', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1478740348', '1478740348');
INSERT INTO `kl_user_log` VALUES ('92', '1', '发送测试邮件', '127.0.0.1', '', '{\"\\/sys_notice\\/testemail_html\":\"\"}', '1478740428', '1478740428');
INSERT INTO `kl_user_log` VALUES ('93', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478742863', '1478742863');
INSERT INTO `kl_user_log` VALUES ('94', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478742921', '1478742921');
INSERT INTO `kl_user_log` VALUES ('95', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478743094', '1478743094');
INSERT INTO `kl_user_log` VALUES ('96', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478743545', '1478743545');
INSERT INTO `kl_user_log` VALUES ('97', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478743575', '1478743575');
INSERT INTO `kl_user_log` VALUES ('98', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744085', '1478744085');
INSERT INTO `kl_user_log` VALUES ('99', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744141', '1478744141');
INSERT INTO `kl_user_log` VALUES ('100', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744183', '1478744183');
INSERT INTO `kl_user_log` VALUES ('101', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744268', '1478744268');
INSERT INTO `kl_user_log` VALUES ('102', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"sadfasdf9999\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744506', '1478744506');
INSERT INTO `kl_user_log` VALUES ('103', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u54c8\\u55bd\\u4f60\\u597d\\u8fd9\\u662f\\u4e2a\\u6d4b\\u8bd5\\u6587\\u7ae0\\u6807\\u9898\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\",sadfasdf9999,,sdaf\",\"meta_descr\":\"sdaf\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744563', '1478744563');
INSERT INTO `kl_user_log` VALUES ('104', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u54c8\\u55bd\\u4f60\\u597d\\u8fd9\\u662f\\u4e2a\\u6d4b\\u8bd5\\u6587\\u7ae0\\u6807\\u9898\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\",sadfasdf9999,,sdaf\",\"meta_descr\":\"sdaf\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744606', '1478744606');
INSERT INTO `kl_user_log` VALUES ('105', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u54c8\\u55bd\\u4f60\\u597d\\u8fd9\\u662f\\u4e2a\\u6d4b\\u8bd5\\u6587\\u7ae0\\u6807\\u9898\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p>\"}', '1478744619', '1478744619');
INSERT INTO `kl_user_log` VALUES ('106', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"sdaf\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478744746', '1478744746');
INSERT INTO `kl_user_log` VALUES ('107', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"sdaf\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478744842', '1478744842');
INSERT INTO `kl_user_log` VALUES ('108', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u540e,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a,\\u5927\\u5bb6,\\u8fd9\\u4e9b,\\u4e4b\\u6240\\u4ee5,\\u4e00\\u6837,\\u6765\\u8bb2\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478744869', '1478744869');
INSERT INTO `kl_user_log` VALUES ('109', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478744959', '1478744959');
INSERT INTO `kl_user_log` VALUES ('110', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u540e,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478745023', '1478745023');
INSERT INTO `kl_user_log` VALUES ('111', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u540e,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478745192', '1478745192');
INSERT INTO `kl_user_log` VALUES ('112', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u540e,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478745244', '1478745244');
INSERT INTO `kl_user_log` VALUES ('113', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u540e,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478745332', '1478745332');
INSERT INTO `kl_user_log` VALUES ('114', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478745458', '1478745458');
INSERT INTO `kl_user_log` VALUES ('115', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\" _src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1478746053', '1478746053');
INSERT INTO `kl_user_log` VALUES ('116', '1', '更新kl_goods.meta_title字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"12\",\"title\":\"SEO\\u6807\\u9898\",\"name\":\"meta_title\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1478747317', '1478747317');
INSERT INTO `kl_user_log` VALUES ('117', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"12\",\"title\":\"SEO\\u6807\\u9898\",\"name\":\"meta_title\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1478747317', '1478747317');
INSERT INTO `kl_user_log` VALUES ('118', '1', '更新kl_goods.meta_keywords字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"12\",\"title\":\"SEO\\u5173\\u952e\\u5b57\",\"name\":\"meta_keywords\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1478747355', '1478747355');
INSERT INTO `kl_user_log` VALUES ('119', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"string\",\"form_id\":\"12\",\"title\":\"SEO\\u5173\\u952e\\u5b57\",\"name\":\"meta_keywords\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1478747355', '1478747355');
INSERT INTO `kl_user_log` VALUES ('120', '1', '更新kl_goods.meta_descr字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"textarea\",\"form_id\":\"12\",\"title\":\"SEO\\u63cf\\u8ff0\",\"name\":\"meta_descr\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1478747392', '1478747392');
INSERT INTO `kl_user_log` VALUES ('121', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"textarea\",\"form_id\":\"12\",\"title\":\"SEO\\u63cf\\u8ff0\",\"name\":\"meta_descr\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"1\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1478747392', '1478747392');
INSERT INTO `kl_user_log` VALUES ('122', '1', '编辑产品', '127.0.0.1', '', '{\"\\/com_goods\\/edit_html\":\"\",\"category_id\":\"3\",\"title\":\"\\u4e00\\u4e2a\\u6d4b\\u8bd5\\u4ea7\\u54c1\\u6807\\u9898\",\"stock\":\"100\",\"price\":\"0\",\"status\":\"1\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"position\":[\"4\",\"5\",\"6\",\"7\"],\"pic\":\"\",\"xc\":\"\",\"goods_id\":\"1\"}', '1478747497', '1478747497');
INSERT INTO `kl_user_log` VALUES ('123', '1', '编辑产品', '127.0.0.1', '', '{\"\\/com_goods\\/edit_html\":\"\",\"category_id\":\"3\",\"title\":\"\\u4e00\\u4e2a\\u6d4b\\u8bd5\\u4ea7\\u54c1\\u6807\\u9898\",\"stock\":\"100\",\"price\":\"0\",\"status\":\"1\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"position\":[\"4\",\"5\",\"6\",\"7\"],\"pic\":\"\",\"xc\":\"\",\"goods_id\":\"1\"}', '1478747533', '1478747533');
INSERT INTO `kl_user_log` VALUES ('124', '1', '编辑产品', '127.0.0.1', '', '{\"\\/com_goods\\/edit_html\":\"\",\"category_id\":\"3\",\"title\":\"\\u4e00\\u4e2a\\u6d4b\\u8bd5\\u4ea7\\u54c1\\u6807\\u9898\",\"stock\":\"100\",\"price\":\"0\",\"status\":\"1\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"position\":[\"4\",\"5\",\"6\",\"7\"],\"pic\":\"\",\"xc\":\"\",\"goods_id\":\"1\"}', '1478747664', '1478747664');
INSERT INTO `kl_user_log` VALUES ('125', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"tables\":[\"kl_addon\",\"kl_addon_comment\",\"kl_article\",\"kl_auth_rule\",\"kl_category\",\"kl_config\",\"kl_file\",\"kl_form\",\"kl_form_item\",\"kl_goods\",\"kl_menu\",\"kl_nav\",\"kl_picture\",\"kl_single\",\"kl_user\",\"kl_user_group\",\"kl_user_log\"]}', '1478747867', '1478747867');
INSERT INTO `kl_user_log` VALUES ('126', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"0\",\"start\":\"0\"}', '1478747867', '1478747867');
INSERT INTO `kl_user_log` VALUES ('127', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"1\",\"start\":\"0\"}', '1478747867', '1478747867');
INSERT INTO `kl_user_log` VALUES ('128', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"2\",\"start\":\"0\"}', '1478747868', '1478747868');
INSERT INTO `kl_user_log` VALUES ('129', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"3\",\"start\":\"0\"}', '1478747868', '1478747868');
INSERT INTO `kl_user_log` VALUES ('130', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"4\",\"start\":\"0\"}', '1478747868', '1478747868');
INSERT INTO `kl_user_log` VALUES ('131', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"5\",\"start\":\"0\"}', '1478747868', '1478747868');
INSERT INTO `kl_user_log` VALUES ('132', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"6\",\"start\":\"0\"}', '1478747869', '1478747869');
INSERT INTO `kl_user_log` VALUES ('133', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"7\",\"start\":\"0\"}', '1478747869', '1478747869');
INSERT INTO `kl_user_log` VALUES ('134', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"8\",\"start\":\"0\"}', '1478747869', '1478747869');
INSERT INTO `kl_user_log` VALUES ('135', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"9\",\"start\":\"0\"}', '1478747869', '1478747869');
INSERT INTO `kl_user_log` VALUES ('136', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"10\",\"start\":\"0\"}', '1478747870', '1478747870');
INSERT INTO `kl_user_log` VALUES ('137', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"11\",\"start\":\"0\"}', '1478747870', '1478747870');
INSERT INTO `kl_user_log` VALUES ('138', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"12\",\"start\":\"0\"}', '1478747870', '1478747870');
INSERT INTO `kl_user_log` VALUES ('139', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"13\",\"start\":\"0\"}', '1478747871', '1478747871');
INSERT INTO `kl_user_log` VALUES ('140', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"14\",\"start\":\"0\"}', '1478747871', '1478747871');
INSERT INTO `kl_user_log` VALUES ('141', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"15\",\"start\":\"0\"}', '1478747871', '1478747871');
INSERT INTO `kl_user_log` VALUES ('142', '1', '导出数据库', '127.0.0.1', '', '{\"\\/sys_database\\/export_html\":\"\",\"id\":\"16\",\"start\":\"0\"}', '1478747872', '1478747872');
INSERT INTO `kl_user_log` VALUES ('143', '1', '发送测试邮件', '127.0.0.1', '', '{\"\\/sys_notice\\/testemail_html\":\"\"}', '1478872998', '1478872998');
INSERT INTO `kl_user_log` VALUES ('144', '1', '编辑导航', '127.0.0.1', '', '{\"\\/com_nav\\/edit_html\":\"\",\"pid\":\"3\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"\\/about.html\",\"sort\":\"50\",\"target\":\"0\",\"status\":\"1\",\"pic\":\"\",\"nav_id\":\"2\"}', '1479131615', '1479131615');
INSERT INTO `kl_user_log` VALUES ('145', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"editor\",\"form_id\":\"4\",\"title\":\"\\u6d4b\\u8bd5\\u90ae\\u4ef6\\u5185\\u5bb9\",\"name\":\"mail_smtp_test\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"5\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"95\"}', '1479474673', '1479474673');
INSERT INTO `kl_user_log` VALUES ('146', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"deariloveyoutoever\",\"mail_smtp_pwd\":\"01227328\",\"mail_smtp_fromemail\":\"deariloveyoutoever@163.com\",\"mail_smtp_receiveemail\":\"735579768@qq.com\",\"mail_smtp_fromname\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_subject\":\"\\u90ae\\u4ef6\\u4e3b\\u9898 \",\"mail_smtp_test\":\"<p><img src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478528258750.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478659716608.jpg\\\" title=\\\"1479478659716608.jpg\\\" alt=\\\"IMG_20160413_182810.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478767139564.jpg\\\" title=\\\"1479478767139564.jpg\\\" alt=\\\"IMG_20160413_183046.jpg\\\"\\/><\\/p>\"}', '1479478796', '1479478796');
INSERT INTO `kl_user_log` VALUES ('147', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"mail_smtp_host\":\"smtp.163.com\",\"mail_smtp_port\":\"25\",\"mail_smtp_user\":\"deariloveyoutoever\",\"mail_smtp_pwd\":\"01227328\",\"mail_smtp_fromemail\":\"deariloveyoutoever@163.com\",\"mail_smtp_receiveemail\":\"735579768@qq.com\",\"mail_smtp_fromname\":\"\\u7231\\u4f60\\u9177\",\"mail_smtp_subject\":\"\\u90ae\\u4ef6\\u4e3b\\u9898 \",\"mail_smtp_test\":\"<p><img src=\\\"\\/uploads\\/image\\/20161024\\/14773181785433.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161024\\/14773182474775.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478528258750.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478820950141.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161118\\/1479478528258750.jpeg\\\" title=\\\"1479478851949711.jpeg\\\" alt=\\\"1720018504.jpeg\\\"\\/><\\/p>\"}', '1479478862', '1479478862');
INSERT INTO `kl_user_log` VALUES ('148', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"umeditor\",\"form_id\":\"4\",\"title\":\"\\u6d4b\\u8bd5\\u90ae\\u4ef6\\u5185\\u5bb9\",\"name\":\"mail_smtp_test\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"5\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"95\"}', '1479480466', '1479480466');
INSERT INTO `kl_user_log` VALUES ('149', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"editor\",\"form_id\":\"4\",\"title\":\"\\u6d4b\\u8bd5\\u90ae\\u4ef6\\u5185\\u5bb9\",\"name\":\"mail_smtp_test\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"5\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"95\"}', '1479480513', '1479480513');
INSERT INTO `kl_user_log` VALUES ('150', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"editor\",\"form_id\":\"7\",\"title\":\"\\u6587\\u7ae0\\u5185\\u5bb9\",\"name\":\"content\",\"note\":\"\",\"value\":\"\",\"sort\":\"93\",\"is_require\":\"0\",\"tab_id\":\"0\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"75\"}', '1479480554', '1479480554');
INSERT INTO `kl_user_log` VALUES ('151', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"umeditor\",\"form_id\":\"4\",\"title\":\"\\u6d4b\\u8bd5\\u90ae\\u4ef6\\u5185\\u5bb9\",\"name\":\"mail_smtp_test\",\"note\":\"\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"5\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"95\"}', '1479480591', '1479480591');

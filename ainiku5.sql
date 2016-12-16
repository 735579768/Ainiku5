/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ainiku5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-12-15 22:48:41
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='扩展,插件安装数据库';

-- ----------------------------
-- Records of kl_addon
-- ----------------------------
INSERT INTO `kl_addon` VALUES ('1', '27', 'comment', '留言评论', '1.0.0', 'zhaokeli', '留言', '{\"\\/comment\\/config_html\":\"\",\"nickname\":\"1\",\"email\":\"1\",\"url\":\"1\",\"name\":\"comment\"}', 'other', '1', '1477037782', '1477299881');
INSERT INTO `kl_addon` VALUES ('2', '24', 'test', '插件名字', '1.0.0', '插件作者', '插件描述', '', 'other', '1', '1477035127', '1477035127');
INSERT INTO `kl_addon` VALUES ('3', '29', 'notepad', '记事本', '1.0.0', 'zhaokeli', '便签本', '', 'other', '1', '1481383255', '1481392645');
INSERT INTO `kl_addon` VALUES ('8', '34', 'qconnect', 'QQ互联', '1.0.0', 'qiaokeli', 'QQ登陆', '{\"\\/qconnect\\/set_html\":\"\",\"appid\":\"101017967\",\"appkey\":\"5a65db7bcedee3aacc851755deea3497\",\"callback\":\"http:\\/\\/www.ainiku5.loc\",\"name\":\"qconnect\"}', 'other', '1', '1481471081', '1481593933');
INSERT INTO `kl_addon` VALUES ('9', '35', 'alipay', '支付宝', '1.0.0', 'qiaokeli', '支付宝付款', '{\"\\/alipay\\/set_html\":\"\",\"alipayuname\":\"281821965@qq.com\",\"alipaysafeid\":\"2088911679548154\",\"alipayverify\":\"aa8zxw8ofpmeo1skrqgrczypc0453ehc\",\"return_url\":\"http:\\/\\/www.ainiku5.loc\\/pay\\/return_url.html\",\"notify_url\":\"http:\\/\\/www.ainiku5.loc\\/pay\\/notify_url.html\",\"api\":\"jishi\",\"name\":\"alipay\"}', 'other', '1', '1481549729', '1481635719');
INSERT INTO `kl_addon` VALUES ('10', '36', 'excel', 'Excel表格导出', '1.0.0', 'qiaokeli', 'excel表格处理', '', 'other', '1', '1481640602', '1481640602');

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
-- Table structure for kl_addon_notepad
-- ----------------------------
DROP TABLE IF EXISTS `kl_addon_notepad`;
CREATE TABLE `kl_addon_notepad` (
  `notepad_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `content` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`notepad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kl_addon_notepad
-- ----------------------------
INSERT INTO `kl_addon_notepad` VALUES ('1', '0', '    display: block;\r\n    height: 25px;\r\n    line-height: 25px;', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('2', '0', '测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('4', '0', '测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('5', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('6', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('7', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('8', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('9', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('10', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('11', '0', '测试内容测试内容测试内容测试内容测试内容', '0', '1481389878');
INSERT INTO `kl_addon_notepad` VALUES ('12', '0', '测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('13', '0', '测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('15', '0', '测试内容', '0', '0');
INSERT INTO `kl_addon_notepad` VALUES ('16', '0', '测试内容00000', '0', '1481390798');
INSERT INTO `kl_addon_notepad` VALUES ('17', '0', '测试内容', '0', '1481389849');

-- ----------------------------
-- Table structure for kl_area
-- ----------------------------
DROP TABLE IF EXISTS `kl_area`;
CREATE TABLE `kl_area` (
  `area_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `chengxiang` int(11) DEFAULT NULL,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=742135 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of kl_area
-- ----------------------------
INSERT INTO `kl_area` VALUES ('1', '0', null, '北京市', '11');
INSERT INTO `kl_area` VALUES ('2', '0', null, '天津市', '12');
INSERT INTO `kl_area` VALUES ('3', '0', null, '河北省', '13');
INSERT INTO `kl_area` VALUES ('4', '0', null, '山西省', '14');
INSERT INTO `kl_area` VALUES ('5', '0', null, '内蒙古自治区', '15');
INSERT INTO `kl_area` VALUES ('6', '0', null, '辽宁省', '21');
INSERT INTO `kl_area` VALUES ('7', '0', null, '吉林省', '22');
INSERT INTO `kl_area` VALUES ('8', '0', null, '黑龙江省', '23');
INSERT INTO `kl_area` VALUES ('9', '0', null, '上海市', '31');
INSERT INTO `kl_area` VALUES ('10', '0', null, '江苏省', '32');
INSERT INTO `kl_area` VALUES ('11', '0', null, '浙江省', '33');
INSERT INTO `kl_area` VALUES ('12', '0', null, '安徽省', '34');
INSERT INTO `kl_area` VALUES ('13', '0', null, '福建省', '35');
INSERT INTO `kl_area` VALUES ('14', '0', null, '江西省', '36');
INSERT INTO `kl_area` VALUES ('15', '0', null, '山东省', '37');
INSERT INTO `kl_area` VALUES ('16', '0', null, '河南省', '41');
INSERT INTO `kl_area` VALUES ('17', '0', null, '湖北省', '42');
INSERT INTO `kl_area` VALUES ('18', '0', null, '湖南省', '43');
INSERT INTO `kl_area` VALUES ('19', '0', null, '广东省', '44');
INSERT INTO `kl_area` VALUES ('20', '0', null, '广西壮族自治区', '45');
INSERT INTO `kl_area` VALUES ('21', '0', null, '海南省', '46');
INSERT INTO `kl_area` VALUES ('22', '0', null, '重庆市', '50');
INSERT INTO `kl_area` VALUES ('23', '0', null, '四川省', '51');
INSERT INTO `kl_area` VALUES ('24', '0', null, '贵州省', '52');
INSERT INTO `kl_area` VALUES ('25', '0', null, '云南省', '53');
INSERT INTO `kl_area` VALUES ('26', '0', null, '西藏自治区', '54');
INSERT INTO `kl_area` VALUES ('27', '0', null, '陕西省', '61');
INSERT INTO `kl_area` VALUES ('28', '0', null, '甘肃省', '62');
INSERT INTO `kl_area` VALUES ('29', '0', null, '青海省', '63');
INSERT INTO `kl_area` VALUES ('30', '0', null, '宁夏回族自治区', '64');
INSERT INTO `kl_area` VALUES ('31', '0', null, '新疆维吾尔自治区', '65');
INSERT INTO `kl_area` VALUES ('32', '1', null, '市辖区', '1101');
INSERT INTO `kl_area` VALUES ('33', '1', null, '县', '1102');
INSERT INTO `kl_area` VALUES ('34', '11', null, '杭州市', '3301');
INSERT INTO `kl_area` VALUES ('35', '11', null, '宁波市', '3302');
INSERT INTO `kl_area` VALUES ('36', '11', null, '温州市', '3303');
INSERT INTO `kl_area` VALUES ('37', '11', null, '嘉兴市', '3304');
INSERT INTO `kl_area` VALUES ('38', '11', null, '湖州市', '3305');
INSERT INTO `kl_area` VALUES ('39', '11', null, '绍兴市', '3306');
INSERT INTO `kl_area` VALUES ('40', '11', null, '金华市', '3307');
INSERT INTO `kl_area` VALUES ('41', '11', null, '衢州市', '3308');
INSERT INTO `kl_area` VALUES ('42', '11', null, '舟山市', '3309');
INSERT INTO `kl_area` VALUES ('43', '11', null, '台州市', '3310');
INSERT INTO `kl_area` VALUES ('44', '11', null, '丽水市', '3311');
INSERT INTO `kl_area` VALUES ('45', '2', null, '市辖区', '1201');
INSERT INTO `kl_area` VALUES ('46', '2', null, '县', '1202');
INSERT INTO `kl_area` VALUES ('47', '21', null, '海口市', '4601');
INSERT INTO `kl_area` VALUES ('48', '21', null, '三亚市', '4602');
INSERT INTO `kl_area` VALUES ('49', '21', null, '三沙市', '4603');
INSERT INTO `kl_area` VALUES ('50', '21', null, '省直辖县级行政区划', '4690');
INSERT INTO `kl_area` VALUES ('51', '12', null, '合肥市', '3401');
INSERT INTO `kl_area` VALUES ('52', '12', null, '芜湖市', '3402');
INSERT INTO `kl_area` VALUES ('53', '12', null, '蚌埠市', '3403');
INSERT INTO `kl_area` VALUES ('54', '12', null, '淮南市', '3404');
INSERT INTO `kl_area` VALUES ('55', '12', null, '马鞍山市', '3405');
INSERT INTO `kl_area` VALUES ('56', '12', null, '淮北市', '3406');
INSERT INTO `kl_area` VALUES ('57', '12', null, '铜陵市', '3407');
INSERT INTO `kl_area` VALUES ('58', '3', null, '石家庄市', '1301');
INSERT INTO `kl_area` VALUES ('59', '12', null, '安庆市', '3408');
INSERT INTO `kl_area` VALUES ('60', '3', null, '唐山市', '1302');
INSERT INTO `kl_area` VALUES ('61', '12', null, '黄山市', '3410');
INSERT INTO `kl_area` VALUES ('62', '3', null, '秦皇岛市', '1303');
INSERT INTO `kl_area` VALUES ('63', '12', null, '滁州市', '3411');
INSERT INTO `kl_area` VALUES ('64', '3', null, '邯郸市', '1304');
INSERT INTO `kl_area` VALUES ('65', '12', null, '阜阳市', '3412');
INSERT INTO `kl_area` VALUES ('66', '3', null, '邢台市', '1305');
INSERT INTO `kl_area` VALUES ('67', '12', null, '宿州市', '3413');
INSERT INTO `kl_area` VALUES ('68', '3', null, '保定市', '1306');
INSERT INTO `kl_area` VALUES ('69', '12', null, '六安市', '3415');
INSERT INTO `kl_area` VALUES ('70', '3', null, '张家口市', '1307');
INSERT INTO `kl_area` VALUES ('71', '12', null, '亳州市', '3416');
INSERT INTO `kl_area` VALUES ('72', '3', null, '承德市', '1308');
INSERT INTO `kl_area` VALUES ('73', '12', null, '池州市', '3417');
INSERT INTO `kl_area` VALUES ('74', '3', null, '沧州市', '1309');
INSERT INTO `kl_area` VALUES ('75', '12', null, '宣城市', '3418');
INSERT INTO `kl_area` VALUES ('76', '22', null, '市辖区', '5001');
INSERT INTO `kl_area` VALUES ('77', '3', null, '廊坊市', '1310');
INSERT INTO `kl_area` VALUES ('78', '22', null, '县', '5002');
INSERT INTO `kl_area` VALUES ('79', '3', null, '衡水市', '1311');
INSERT INTO `kl_area` VALUES ('80', '13', null, '福州市', '3501');
INSERT INTO `kl_area` VALUES ('81', '13', null, '厦门市', '3502');
INSERT INTO `kl_area` VALUES ('82', '23', null, '成都市', '5101');
INSERT INTO `kl_area` VALUES ('83', '13', null, '莆田市', '3503');
INSERT INTO `kl_area` VALUES ('84', '4', null, '太原市', '1401');
INSERT INTO `kl_area` VALUES ('85', '23', null, '自贡市', '5103');
INSERT INTO `kl_area` VALUES ('86', '13', null, '三明市', '3504');
INSERT INTO `kl_area` VALUES ('87', '23', null, '攀枝花市', '5104');
INSERT INTO `kl_area` VALUES ('88', '4', null, '大同市', '1402');
INSERT INTO `kl_area` VALUES ('89', '13', null, '泉州市', '3505');
INSERT INTO `kl_area` VALUES ('90', '23', null, '泸州市', '5105');
INSERT INTO `kl_area` VALUES ('91', '4', null, '阳泉市', '1403');
INSERT INTO `kl_area` VALUES ('92', '13', null, '漳州市', '3506');
INSERT INTO `kl_area` VALUES ('93', '23', null, '德阳市', '5106');
INSERT INTO `kl_area` VALUES ('94', '4', null, '长治市', '1404');
INSERT INTO `kl_area` VALUES ('95', '13', null, '南平市', '3507');
INSERT INTO `kl_area` VALUES ('96', '23', null, '绵阳市', '5107');
INSERT INTO `kl_area` VALUES ('97', '4', null, '晋城市', '1405');
INSERT INTO `kl_area` VALUES ('98', '13', null, '龙岩市', '3508');
INSERT INTO `kl_area` VALUES ('99', '23', null, '广元市', '5108');
INSERT INTO `kl_area` VALUES ('100', '4', null, '朔州市', '1406');
INSERT INTO `kl_area` VALUES ('101', '13', null, '宁德市', '3509');
INSERT INTO `kl_area` VALUES ('102', '4', null, '晋中市', '1407');
INSERT INTO `kl_area` VALUES ('103', '23', null, '遂宁市', '5109');
INSERT INTO `kl_area` VALUES ('104', '23', null, '内江市', '5110');
INSERT INTO `kl_area` VALUES ('105', '4', null, '运城市', '1408');
INSERT INTO `kl_area` VALUES ('106', '23', null, '乐山市', '5111');
INSERT INTO `kl_area` VALUES ('107', '4', null, '忻州市', '1409');
INSERT INTO `kl_area` VALUES ('108', '23', null, '南充市', '5113');
INSERT INTO `kl_area` VALUES ('109', '4', null, '临汾市', '1410');
INSERT INTO `kl_area` VALUES ('110', '23', null, '眉山市', '5114');
INSERT INTO `kl_area` VALUES ('111', '4', null, '吕梁市', '1411');
INSERT INTO `kl_area` VALUES ('112', '23', null, '宜宾市', '5115');
INSERT INTO `kl_area` VALUES ('113', '23', null, '广安市', '5116');
INSERT INTO `kl_area` VALUES ('114', '23', null, '达州市', '5117');
INSERT INTO `kl_area` VALUES ('115', '23', null, '雅安市', '5118');
INSERT INTO `kl_area` VALUES ('116', '23', null, '巴中市', '5119');
INSERT INTO `kl_area` VALUES ('117', '23', null, '资阳市', '5120');
INSERT INTO `kl_area` VALUES ('118', '23', null, '阿坝藏族羌族自治州', '5132');
INSERT INTO `kl_area` VALUES ('119', '23', null, '甘孜藏族自治州', '5133');
INSERT INTO `kl_area` VALUES ('120', '23', null, '凉山彝族自治州', '5134');
INSERT INTO `kl_area` VALUES ('121', '14', null, '南昌市', '3601');
INSERT INTO `kl_area` VALUES ('122', '14', null, '景德镇市', '3602');
INSERT INTO `kl_area` VALUES ('123', '14', null, '萍乡市', '3603');
INSERT INTO `kl_area` VALUES ('124', '14', null, '九江市', '3604');
INSERT INTO `kl_area` VALUES ('125', '14', null, '新余市', '3605');
INSERT INTO `kl_area` VALUES ('126', '14', null, '鹰潭市', '3606');
INSERT INTO `kl_area` VALUES ('127', '14', null, '赣州市', '3607');
INSERT INTO `kl_area` VALUES ('128', '14', null, '吉安市', '3608');
INSERT INTO `kl_area` VALUES ('129', '14', null, '宜春市', '3609');
INSERT INTO `kl_area` VALUES ('130', '5', null, '呼和浩特市', '1501');
INSERT INTO `kl_area` VALUES ('131', '14', null, '抚州市', '3610');
INSERT INTO `kl_area` VALUES ('132', '5', null, '包头市', '1502');
INSERT INTO `kl_area` VALUES ('133', '14', null, '上饶市', '3611');
INSERT INTO `kl_area` VALUES ('134', '5', null, '乌海市', '1503');
INSERT INTO `kl_area` VALUES ('135', '5', null, '赤峰市', '1504');
INSERT INTO `kl_area` VALUES ('136', '5', null, '通辽市', '1505');
INSERT INTO `kl_area` VALUES ('137', '5', null, '鄂尔多斯市', '1506');
INSERT INTO `kl_area` VALUES ('138', '5', null, '呼伦贝尔市', '1507');
INSERT INTO `kl_area` VALUES ('139', '24', null, '贵阳市', '5201');
INSERT INTO `kl_area` VALUES ('140', '5', null, '巴彦淖尔市', '1508');
INSERT INTO `kl_area` VALUES ('141', '24', null, '六盘水市', '5202');
INSERT INTO `kl_area` VALUES ('142', '5', null, '乌兰察布市', '1509');
INSERT INTO `kl_area` VALUES ('143', '24', null, '遵义市', '5203');
INSERT INTO `kl_area` VALUES ('144', '5', null, '兴安盟', '1522');
INSERT INTO `kl_area` VALUES ('145', '24', null, '安顺市', '5204');
INSERT INTO `kl_area` VALUES ('146', '5', null, '锡林郭勒盟', '1525');
INSERT INTO `kl_area` VALUES ('147', '24', null, '毕节市', '5205');
INSERT INTO `kl_area` VALUES ('148', '5', null, '阿拉善盟', '1529');
INSERT INTO `kl_area` VALUES ('149', '24', null, '铜仁市', '5206');
INSERT INTO `kl_area` VALUES ('150', '24', null, '黔西南布依族苗族自治州', '5223');
INSERT INTO `kl_area` VALUES ('151', '24', null, '黔东南苗族侗族自治州', '5226');
INSERT INTO `kl_area` VALUES ('152', '24', null, '黔南布依族苗族自治州', '5227');
INSERT INTO `kl_area` VALUES ('153', '15', null, '济南市', '3701');
INSERT INTO `kl_area` VALUES ('154', '15', null, '青岛市', '3702');
INSERT INTO `kl_area` VALUES ('155', '15', null, '淄博市', '3703');
INSERT INTO `kl_area` VALUES ('156', '15', null, '枣庄市', '3704');
INSERT INTO `kl_area` VALUES ('157', '15', null, '东营市', '3705');
INSERT INTO `kl_area` VALUES ('158', '15', null, '烟台市', '3706');
INSERT INTO `kl_area` VALUES ('159', '15', null, '潍坊市', '3707');
INSERT INTO `kl_area` VALUES ('160', '15', null, '济宁市', '3708');
INSERT INTO `kl_area` VALUES ('161', '15', null, '泰安市', '3709');
INSERT INTO `kl_area` VALUES ('162', '15', null, '威海市', '3710');
INSERT INTO `kl_area` VALUES ('163', '15', null, '日照市', '3711');
INSERT INTO `kl_area` VALUES ('164', '15', null, '莱芜市', '3712');
INSERT INTO `kl_area` VALUES ('165', '15', null, '临沂市', '3713');
INSERT INTO `kl_area` VALUES ('166', '15', null, '德州市', '3714');
INSERT INTO `kl_area` VALUES ('167', '15', null, '聊城市', '3715');
INSERT INTO `kl_area` VALUES ('168', '6', null, '沈阳市', '2101');
INSERT INTO `kl_area` VALUES ('169', '15', null, '滨州市', '3716');
INSERT INTO `kl_area` VALUES ('170', '6', null, '大连市', '2102');
INSERT INTO `kl_area` VALUES ('171', '25', null, '昆明市', '5301');
INSERT INTO `kl_area` VALUES ('172', '15', null, '菏泽市', '3717');
INSERT INTO `kl_area` VALUES ('173', '6', null, '鞍山市', '2103');
INSERT INTO `kl_area` VALUES ('174', '25', null, '曲靖市', '5303');
INSERT INTO `kl_area` VALUES ('175', '6', null, '抚顺市', '2104');
INSERT INTO `kl_area` VALUES ('176', '25', null, '玉溪市', '5304');
INSERT INTO `kl_area` VALUES ('177', '6', null, '本溪市', '2105');
INSERT INTO `kl_area` VALUES ('178', '25', null, '保山市', '5305');
INSERT INTO `kl_area` VALUES ('179', '6', null, '丹东市', '2106');
INSERT INTO `kl_area` VALUES ('180', '25', null, '昭通市', '5306');
INSERT INTO `kl_area` VALUES ('181', '6', null, '锦州市', '2107');
INSERT INTO `kl_area` VALUES ('182', '25', null, '丽江市', '5307');
INSERT INTO `kl_area` VALUES ('183', '6', null, '营口市', '2108');
INSERT INTO `kl_area` VALUES ('184', '25', null, '普洱市', '5308');
INSERT INTO `kl_area` VALUES ('185', '6', null, '阜新市', '2109');
INSERT INTO `kl_area` VALUES ('186', '25', null, '临沧市', '5309');
INSERT INTO `kl_area` VALUES ('187', '6', null, '辽阳市', '2110');
INSERT INTO `kl_area` VALUES ('188', '25', null, '楚雄彝族自治州', '5323');
INSERT INTO `kl_area` VALUES ('189', '6', null, '盘锦市', '2111');
INSERT INTO `kl_area` VALUES ('190', '25', null, '红河哈尼族彝族自治州', '5325');
INSERT INTO `kl_area` VALUES ('191', '6', null, '铁岭市', '2112');
INSERT INTO `kl_area` VALUES ('192', '25', null, '文山壮族苗族自治州', '5326');
INSERT INTO `kl_area` VALUES ('193', '6', null, '朝阳市', '2113');
INSERT INTO `kl_area` VALUES ('194', '25', null, '西双版纳傣族自治州', '5328');
INSERT INTO `kl_area` VALUES ('195', '6', null, '葫芦岛市', '2114');
INSERT INTO `kl_area` VALUES ('196', '25', null, '大理白族自治州', '5329');
INSERT INTO `kl_area` VALUES ('197', '25', null, '德宏傣族景颇族自治州', '5331');
INSERT INTO `kl_area` VALUES ('198', '16', null, '郑州市', '4101');
INSERT INTO `kl_area` VALUES ('199', '25', null, '怒江傈僳族自治州', '5333');
INSERT INTO `kl_area` VALUES ('200', '16', null, '开封市', '4102');
INSERT INTO `kl_area` VALUES ('201', '25', null, '迪庆藏族自治州', '5334');
INSERT INTO `kl_area` VALUES ('202', '16', null, '洛阳市', '4103');
INSERT INTO `kl_area` VALUES ('203', '16', null, '平顶山市', '4104');
INSERT INTO `kl_area` VALUES ('204', '16', null, '安阳市', '4105');
INSERT INTO `kl_area` VALUES ('205', '16', null, '鹤壁市', '4106');
INSERT INTO `kl_area` VALUES ('206', '16', null, '新乡市', '4107');
INSERT INTO `kl_area` VALUES ('207', '16', null, '焦作市', '4108');
INSERT INTO `kl_area` VALUES ('208', '16', null, '濮阳市', '4109');
INSERT INTO `kl_area` VALUES ('209', '16', null, '许昌市', '4110');
INSERT INTO `kl_area` VALUES ('210', '16', null, '漯河市', '4111');
INSERT INTO `kl_area` VALUES ('211', '16', null, '三门峡市', '4112');
INSERT INTO `kl_area` VALUES ('212', '16', null, '南阳市', '4113');
INSERT INTO `kl_area` VALUES ('213', '7', null, '长春市', '2201');
INSERT INTO `kl_area` VALUES ('214', '16', null, '商丘市', '4114');
INSERT INTO `kl_area` VALUES ('215', '7', null, '吉林市', '2202');
INSERT INTO `kl_area` VALUES ('216', '16', null, '信阳市', '4115');
INSERT INTO `kl_area` VALUES ('217', '7', null, '四平市', '2203');
INSERT INTO `kl_area` VALUES ('218', '16', null, '周口市', '4116');
INSERT INTO `kl_area` VALUES ('219', '7', null, '辽源市', '2204');
INSERT INTO `kl_area` VALUES ('220', '16', null, '驻马店市', '4117');
INSERT INTO `kl_area` VALUES ('221', '7', null, '通化市', '2205');
INSERT INTO `kl_area` VALUES ('222', '16', null, '省直辖县级行政区划', '4190');
INSERT INTO `kl_area` VALUES ('223', '7', null, '白山市', '2206');
INSERT INTO `kl_area` VALUES ('224', '26', null, '拉萨市', '5401');
INSERT INTO `kl_area` VALUES ('225', '7', null, '松原市', '2207');
INSERT INTO `kl_area` VALUES ('226', '26', null, '昌都地区', '5421');
INSERT INTO `kl_area` VALUES ('227', '7', null, '白城市', '2208');
INSERT INTO `kl_area` VALUES ('228', '26', null, '山南地区', '5422');
INSERT INTO `kl_area` VALUES ('229', '7', null, '延边朝鲜族自治州', '2224');
INSERT INTO `kl_area` VALUES ('230', '26', null, '日喀则地区', '5423');
INSERT INTO `kl_area` VALUES ('231', '26', null, '那曲地区', '5424');
INSERT INTO `kl_area` VALUES ('232', '26', null, '阿里地区', '5425');
INSERT INTO `kl_area` VALUES ('233', '26', null, '林芝地区', '5426');
INSERT INTO `kl_area` VALUES ('234', '17', null, '武汉市', '4201');
INSERT INTO `kl_area` VALUES ('235', '17', null, '黄石市', '4202');
INSERT INTO `kl_area` VALUES ('236', '17', null, '十堰市', '4203');
INSERT INTO `kl_area` VALUES ('237', '17', null, '宜昌市', '4205');
INSERT INTO `kl_area` VALUES ('238', '17', null, '襄阳市', '4206');
INSERT INTO `kl_area` VALUES ('239', '17', null, '鄂州市', '4207');
INSERT INTO `kl_area` VALUES ('240', '17', null, '荆门市', '4208');
INSERT INTO `kl_area` VALUES ('241', '8', null, '哈尔滨市', '2301');
INSERT INTO `kl_area` VALUES ('242', '17', null, '孝感市', '4209');
INSERT INTO `kl_area` VALUES ('243', '8', null, '齐齐哈尔市', '2302');
INSERT INTO `kl_area` VALUES ('244', '17', null, '荆州市', '4210');
INSERT INTO `kl_area` VALUES ('245', '8', null, '鸡西市', '2303');
INSERT INTO `kl_area` VALUES ('246', '17', null, '黄冈市', '4211');
INSERT INTO `kl_area` VALUES ('247', '27', null, '西安市', '6101');
INSERT INTO `kl_area` VALUES ('248', '8', null, '鹤岗市', '2304');
INSERT INTO `kl_area` VALUES ('249', '17', null, '咸宁市', '4212');
INSERT INTO `kl_area` VALUES ('250', '27', null, '铜川市', '6102');
INSERT INTO `kl_area` VALUES ('251', '8', null, '双鸭山市', '2305');
INSERT INTO `kl_area` VALUES ('252', '17', null, '随州市', '4213');
INSERT INTO `kl_area` VALUES ('253', '27', null, '宝鸡市', '6103');
INSERT INTO `kl_area` VALUES ('254', '8', null, '大庆市', '2306');
INSERT INTO `kl_area` VALUES ('255', '17', null, '恩施土家族苗族自治州', '4228');
INSERT INTO `kl_area` VALUES ('256', '27', null, '咸阳市', '6104');
INSERT INTO `kl_area` VALUES ('257', '8', null, '伊春市', '2307');
INSERT INTO `kl_area` VALUES ('258', '27', null, '渭南市', '6105');
INSERT INTO `kl_area` VALUES ('259', '17', null, '省直辖县级行政区划', '4290');
INSERT INTO `kl_area` VALUES ('260', '8', null, '佳木斯市', '2308');
INSERT INTO `kl_area` VALUES ('261', '27', null, '延安市', '6106');
INSERT INTO `kl_area` VALUES ('262', '8', null, '七台河市', '2309');
INSERT INTO `kl_area` VALUES ('263', '27', null, '汉中市', '6107');
INSERT INTO `kl_area` VALUES ('264', '8', null, '牡丹江市', '2310');
INSERT INTO `kl_area` VALUES ('265', '27', null, '榆林市', '6108');
INSERT INTO `kl_area` VALUES ('266', '8', null, '黑河市', '2311');
INSERT INTO `kl_area` VALUES ('267', '27', null, '安康市', '6109');
INSERT INTO `kl_area` VALUES ('268', '8', null, '绥化市', '2312');
INSERT INTO `kl_area` VALUES ('269', '27', null, '商洛市', '6110');
INSERT INTO `kl_area` VALUES ('270', '8', null, '大兴安岭地区', '2327');
INSERT INTO `kl_area` VALUES ('271', '18', null, '长沙市', '4301');
INSERT INTO `kl_area` VALUES ('272', '18', null, '株洲市', '4302');
INSERT INTO `kl_area` VALUES ('273', '18', null, '湘潭市', '4303');
INSERT INTO `kl_area` VALUES ('274', '18', null, '衡阳市', '4304');
INSERT INTO `kl_area` VALUES ('275', '18', null, '邵阳市', '4305');
INSERT INTO `kl_area` VALUES ('276', '18', null, '岳阳市', '4306');
INSERT INTO `kl_area` VALUES ('277', '18', null, '常德市', '4307');
INSERT INTO `kl_area` VALUES ('278', '18', null, '张家界市', '4308');
INSERT INTO `kl_area` VALUES ('279', '18', null, '益阳市', '4309');
INSERT INTO `kl_area` VALUES ('280', '18', null, '郴州市', '4310');
INSERT INTO `kl_area` VALUES ('281', '18', null, '永州市', '4311');
INSERT INTO `kl_area` VALUES ('282', '28', null, '兰州市', '6201');
INSERT INTO `kl_area` VALUES ('283', '18', null, '怀化市', '4312');
INSERT INTO `kl_area` VALUES ('284', '9', null, '市辖区', '3101');
INSERT INTO `kl_area` VALUES ('285', '28', null, '嘉峪关市', '6202');
INSERT INTO `kl_area` VALUES ('286', '18', null, '娄底市', '4313');
INSERT INTO `kl_area` VALUES ('287', '9', null, '县', '3102');
INSERT INTO `kl_area` VALUES ('288', '28', null, '金昌市', '6203');
INSERT INTO `kl_area` VALUES ('289', '18', null, '湘西土家族苗族自治州', '4331');
INSERT INTO `kl_area` VALUES ('290', '28', null, '白银市', '6204');
INSERT INTO `kl_area` VALUES ('291', '28', null, '天水市', '6205');
INSERT INTO `kl_area` VALUES ('292', '28', null, '武威市', '6206');
INSERT INTO `kl_area` VALUES ('293', '28', null, '张掖市', '6207');
INSERT INTO `kl_area` VALUES ('294', '28', null, '平凉市', '6208');
INSERT INTO `kl_area` VALUES ('295', '28', null, '酒泉市', '6209');
INSERT INTO `kl_area` VALUES ('296', '28', null, '庆阳市', '6210');
INSERT INTO `kl_area` VALUES ('297', '28', null, '定西市', '6211');
INSERT INTO `kl_area` VALUES ('298', '28', null, '陇南市', '6212');
INSERT INTO `kl_area` VALUES ('299', '28', null, '临夏回族自治州', '6229');
INSERT INTO `kl_area` VALUES ('300', '28', null, '甘南藏族自治州', '6230');
INSERT INTO `kl_area` VALUES ('301', '10', null, '南京市', '3201');
INSERT INTO `kl_area` VALUES ('302', '19', null, '广州市', '4401');
INSERT INTO `kl_area` VALUES ('303', '10', null, '无锡市', '3202');
INSERT INTO `kl_area` VALUES ('304', '19', null, '韶关市', '4402');
INSERT INTO `kl_area` VALUES ('305', '10', null, '徐州市', '3203');
INSERT INTO `kl_area` VALUES ('306', '19', null, '深圳市', '4403');
INSERT INTO `kl_area` VALUES ('307', '10', null, '常州市', '3204');
INSERT INTO `kl_area` VALUES ('308', '19', null, '珠海市', '4404');
INSERT INTO `kl_area` VALUES ('309', '10', null, '苏州市', '3205');
INSERT INTO `kl_area` VALUES ('310', '19', null, '汕头市', '4405');
INSERT INTO `kl_area` VALUES ('311', '10', null, '南通市', '3206');
INSERT INTO `kl_area` VALUES ('312', '19', null, '佛山市', '4406');
INSERT INTO `kl_area` VALUES ('313', '10', null, '连云港市', '3207');
INSERT INTO `kl_area` VALUES ('314', '19', null, '江门市', '4407');
INSERT INTO `kl_area` VALUES ('315', '10', null, '淮安市', '3208');
INSERT INTO `kl_area` VALUES ('316', '29', null, '西宁市', '6301');
INSERT INTO `kl_area` VALUES ('317', '19', null, '湛江市', '4408');
INSERT INTO `kl_area` VALUES ('318', '29', null, '海东市', '6302');
INSERT INTO `kl_area` VALUES ('319', '10', null, '盐城市', '3209');
INSERT INTO `kl_area` VALUES ('320', '19', null, '茂名市', '4409');
INSERT INTO `kl_area` VALUES ('321', '29', null, '海北藏族自治州', '6322');
INSERT INTO `kl_area` VALUES ('322', '10', null, '扬州市', '3210');
INSERT INTO `kl_area` VALUES ('323', '19', null, '肇庆市', '4412');
INSERT INTO `kl_area` VALUES ('324', '10', null, '镇江市', '3211');
INSERT INTO `kl_area` VALUES ('325', '29', null, '黄南藏族自治州', '6323');
INSERT INTO `kl_area` VALUES ('326', '19', null, '惠州市', '4413');
INSERT INTO `kl_area` VALUES ('327', '29', null, '海南藏族自治州', '6325');
INSERT INTO `kl_area` VALUES ('328', '10', null, '泰州市', '3212');
INSERT INTO `kl_area` VALUES ('329', '19', null, '梅州市', '4414');
INSERT INTO `kl_area` VALUES ('330', '10', null, '宿迁市', '3213');
INSERT INTO `kl_area` VALUES ('331', '29', null, '果洛藏族自治州', '6326');
INSERT INTO `kl_area` VALUES ('332', '19', null, '汕尾市', '4415');
INSERT INTO `kl_area` VALUES ('333', '29', null, '玉树藏族自治州', '6327');
INSERT INTO `kl_area` VALUES ('334', '19', null, '河源市', '4416');
INSERT INTO `kl_area` VALUES ('335', '29', null, '海西蒙古族藏族自治州', '6328');
INSERT INTO `kl_area` VALUES ('336', '19', null, '阳江市', '4417');
INSERT INTO `kl_area` VALUES ('337', '19', null, '清远市', '4418');
INSERT INTO `kl_area` VALUES ('338', '19', null, '东莞市', '4419');
INSERT INTO `kl_area` VALUES ('339', '19', null, '中山市', '4420');
INSERT INTO `kl_area` VALUES ('340', '19', null, '潮州市', '4451');
INSERT INTO `kl_area` VALUES ('341', '19', null, '揭阳市', '4452');
INSERT INTO `kl_area` VALUES ('342', '19', null, '云浮市', '4453');
INSERT INTO `kl_area` VALUES ('343', '30', null, '银川市', '6401');
INSERT INTO `kl_area` VALUES ('344', '30', null, '石嘴山市', '6402');
INSERT INTO `kl_area` VALUES ('345', '30', null, '吴忠市', '6403');
INSERT INTO `kl_area` VALUES ('346', '30', null, '固原市', '6404');
INSERT INTO `kl_area` VALUES ('347', '20', null, '南宁市', '4501');
INSERT INTO `kl_area` VALUES ('348', '30', null, '中卫市', '6405');
INSERT INTO `kl_area` VALUES ('349', '20', null, '柳州市', '4502');
INSERT INTO `kl_area` VALUES ('350', '20', null, '桂林市', '4503');
INSERT INTO `kl_area` VALUES ('351', '20', null, '梧州市', '4504');
INSERT INTO `kl_area` VALUES ('352', '20', null, '北海市', '4505');
INSERT INTO `kl_area` VALUES ('353', '20', null, '防城港市', '4506');
INSERT INTO `kl_area` VALUES ('354', '31', null, '乌鲁木齐市', '6501');
INSERT INTO `kl_area` VALUES ('355', '20', null, '钦州市', '4507');
INSERT INTO `kl_area` VALUES ('356', '31', null, '克拉玛依市', '6502');
INSERT INTO `kl_area` VALUES ('357', '20', null, '贵港市', '4508');
INSERT INTO `kl_area` VALUES ('358', '31', null, '吐鲁番地区', '6521');
INSERT INTO `kl_area` VALUES ('359', '20', null, '玉林市', '4509');
INSERT INTO `kl_area` VALUES ('360', '31', null, '哈密地区', '6522');
INSERT INTO `kl_area` VALUES ('361', '20', null, '百色市', '4510');
INSERT INTO `kl_area` VALUES ('362', '31', null, '昌吉回族自治州', '6523');
INSERT INTO `kl_area` VALUES ('363', '20', null, '贺州市', '4511');
INSERT INTO `kl_area` VALUES ('364', '31', null, '博尔塔拉蒙古自治州', '6527');
INSERT INTO `kl_area` VALUES ('365', '20', null, '河池市', '4512');
INSERT INTO `kl_area` VALUES ('366', '31', null, '巴音郭楞蒙古自治州', '6528');
INSERT INTO `kl_area` VALUES ('367', '20', null, '来宾市', '4513');
INSERT INTO `kl_area` VALUES ('368', '31', null, '阿克苏地区', '6529');
INSERT INTO `kl_area` VALUES ('369', '20', null, '崇左市', '4514');
INSERT INTO `kl_area` VALUES ('370', '31', null, '克孜勒苏柯尔克孜自治州', '6530');
INSERT INTO `kl_area` VALUES ('371', '31', null, '喀什地区', '6531');
INSERT INTO `kl_area` VALUES ('372', '31', null, '和田地区', '6532');
INSERT INTO `kl_area` VALUES ('373', '31', null, '伊犁哈萨克自治州', '6540');
INSERT INTO `kl_area` VALUES ('374', '31', null, '塔城地区', '6542');
INSERT INTO `kl_area` VALUES ('375', '31', null, '阿勒泰地区', '6543');
INSERT INTO `kl_area` VALUES ('376', '31', null, '自治区直辖县级行政区划', '6590');
INSERT INTO `kl_area` VALUES ('377', '32', null, '东城区', '110101');
INSERT INTO `kl_area` VALUES ('378', '32', null, '西城区', '110102');
INSERT INTO `kl_area` VALUES ('379', '32', null, '朝阳区', '110105');
INSERT INTO `kl_area` VALUES ('380', '32', null, '丰台区', '110106');
INSERT INTO `kl_area` VALUES ('381', '32', null, '石景山区', '110107');
INSERT INTO `kl_area` VALUES ('382', '32', null, '海淀区', '110108');
INSERT INTO `kl_area` VALUES ('383', '32', null, '门头沟区', '110109');
INSERT INTO `kl_area` VALUES ('384', '32', null, '房山区', '110111');
INSERT INTO `kl_area` VALUES ('385', '32', null, '通州区', '110112');
INSERT INTO `kl_area` VALUES ('386', '32', null, '顺义区', '110113');
INSERT INTO `kl_area` VALUES ('387', '32', null, '昌平区', '110114');
INSERT INTO `kl_area` VALUES ('388', '32', null, '大兴区', '110115');
INSERT INTO `kl_area` VALUES ('389', '32', null, '怀柔区', '110116');
INSERT INTO `kl_area` VALUES ('390', '32', null, '平谷区', '110117');
INSERT INTO `kl_area` VALUES ('391', '70', null, '市辖区', '130701');
INSERT INTO `kl_area` VALUES ('392', '70', null, '桥东区', '130702');
INSERT INTO `kl_area` VALUES ('393', '70', null, '桥西区', '130703');
INSERT INTO `kl_area` VALUES ('394', '70', null, '宣化区', '130705');
INSERT INTO `kl_area` VALUES ('395', '70', null, '下花园区', '130706');
INSERT INTO `kl_area` VALUES ('396', '70', null, '宣化县', '130721');
INSERT INTO `kl_area` VALUES ('397', '70', null, '张北县', '130722');
INSERT INTO `kl_area` VALUES ('398', '70', null, '康保县', '130723');
INSERT INTO `kl_area` VALUES ('399', '70', null, '沽源县', '130724');
INSERT INTO `kl_area` VALUES ('400', '70', null, '尚义县', '130725');
INSERT INTO `kl_area` VALUES ('401', '70', null, '蔚县', '130726');
INSERT INTO `kl_area` VALUES ('402', '70', null, '阳原县', '130727');
INSERT INTO `kl_area` VALUES ('403', '70', null, '怀安县', '130728');
INSERT INTO `kl_area` VALUES ('404', '70', null, '万全县', '130729');
INSERT INTO `kl_area` VALUES ('405', '33', null, '密云县', '110228');
INSERT INTO `kl_area` VALUES ('406', '70', null, '怀来县', '130730');
INSERT INTO `kl_area` VALUES ('407', '33', null, '延庆县', '110229');
INSERT INTO `kl_area` VALUES ('408', '70', null, '涿鹿县', '130731');
INSERT INTO `kl_area` VALUES ('409', '100', null, '市辖区', '140601');
INSERT INTO `kl_area` VALUES ('410', '100', null, '朔城区', '140602');
INSERT INTO `kl_area` VALUES ('411', '70', null, '赤城县', '130732');
INSERT INTO `kl_area` VALUES ('412', '100', null, '平鲁区', '140603');
INSERT INTO `kl_area` VALUES ('413', '70', null, '崇礼县', '130733');
INSERT INTO `kl_area` VALUES ('414', '100', null, '山阴县', '140621');
INSERT INTO `kl_area` VALUES ('415', '100', null, '应县', '140622');
INSERT INTO `kl_area` VALUES ('416', '100', null, '右玉县', '140623');
INSERT INTO `kl_area` VALUES ('417', '100', null, '怀仁县', '140624');
INSERT INTO `kl_area` VALUES ('418', '45', null, '和平区', '120101');
INSERT INTO `kl_area` VALUES ('419', '45', null, '河东区', '120102');
INSERT INTO `kl_area` VALUES ('420', '45', null, '河西区', '120103');
INSERT INTO `kl_area` VALUES ('421', '45', null, '南开区', '120104');
INSERT INTO `kl_area` VALUES ('422', '72', null, '市辖区', '130801');
INSERT INTO `kl_area` VALUES ('423', '45', null, '河北区', '120105');
INSERT INTO `kl_area` VALUES ('424', '72', null, '双桥区', '130802');
INSERT INTO `kl_area` VALUES ('425', '45', null, '红桥区', '120106');
INSERT INTO `kl_area` VALUES ('426', '72', null, '双滦区', '130803');
INSERT INTO `kl_area` VALUES ('427', '45', null, '东丽区', '120110');
INSERT INTO `kl_area` VALUES ('428', '102', null, '市辖区', '140701');
INSERT INTO `kl_area` VALUES ('429', '72', null, '鹰手营子矿区', '130804');
INSERT INTO `kl_area` VALUES ('430', '102', null, '榆次区', '140702');
INSERT INTO `kl_area` VALUES ('431', '45', null, '西青区', '120111');
INSERT INTO `kl_area` VALUES ('432', '72', null, '承德县', '130821');
INSERT INTO `kl_area` VALUES ('433', '45', null, '津南区', '120112');
INSERT INTO `kl_area` VALUES ('434', '102', null, '榆社县', '140721');
INSERT INTO `kl_area` VALUES ('435', '72', null, '兴隆县', '130822');
INSERT INTO `kl_area` VALUES ('436', '102', null, '左权县', '140722');
INSERT INTO `kl_area` VALUES ('437', '45', null, '北辰区', '120113');
INSERT INTO `kl_area` VALUES ('438', '72', null, '平泉县', '130823');
INSERT INTO `kl_area` VALUES ('439', '102', null, '和顺县', '140723');
INSERT INTO `kl_area` VALUES ('440', '45', null, '武清区', '120114');
INSERT INTO `kl_area` VALUES ('441', '72', null, '滦平县', '130824');
INSERT INTO `kl_area` VALUES ('442', '45', null, '宝坻区', '120115');
INSERT INTO `kl_area` VALUES ('443', '102', null, '昔阳县', '140724');
INSERT INTO `kl_area` VALUES ('444', '72', null, '隆化县', '130825');
INSERT INTO `kl_area` VALUES ('445', '45', null, '滨海新区', '120116');
INSERT INTO `kl_area` VALUES ('446', '102', null, '寿阳县', '140725');
INSERT INTO `kl_area` VALUES ('447', '72', null, '丰宁满族自治县', '130826');
INSERT INTO `kl_area` VALUES ('448', '102', null, '太谷县', '140726');
INSERT INTO `kl_area` VALUES ('449', '72', null, '宽城满族自治县', '130827');
INSERT INTO `kl_area` VALUES ('450', '102', null, '祁县', '140727');
INSERT INTO `kl_area` VALUES ('451', '72', null, '围场满族蒙古族自治县', '130828');
INSERT INTO `kl_area` VALUES ('452', '102', null, '平遥县', '140728');
INSERT INTO `kl_area` VALUES ('453', '102', null, '灵石县', '140729');
INSERT INTO `kl_area` VALUES ('454', '102', null, '介休市', '140781');
INSERT INTO `kl_area` VALUES ('455', '46', null, '宁河县', '120221');
INSERT INTO `kl_area` VALUES ('456', '46', null, '静海县', '120223');
INSERT INTO `kl_area` VALUES ('457', '46', null, '蓟县', '120225');
INSERT INTO `kl_area` VALUES ('458', '74', null, '市辖区', '130901');
INSERT INTO `kl_area` VALUES ('459', '74', null, '新华区', '130902');
INSERT INTO `kl_area` VALUES ('460', '74', null, '运河区', '130903');
INSERT INTO `kl_area` VALUES ('461', '105', null, '市辖区', '140801');
INSERT INTO `kl_area` VALUES ('462', '74', null, '沧县', '130921');
INSERT INTO `kl_area` VALUES ('463', '105', null, '盐湖区', '140802');
INSERT INTO `kl_area` VALUES ('464', '74', null, '青县', '130922');
INSERT INTO `kl_area` VALUES ('465', '105', null, '临猗县', '140821');
INSERT INTO `kl_area` VALUES ('466', '74', null, '东光县', '130923');
INSERT INTO `kl_area` VALUES ('467', '105', null, '万荣县', '140822');
INSERT INTO `kl_area` VALUES ('468', '74', null, '海兴县', '130924');
INSERT INTO `kl_area` VALUES ('469', '105', null, '闻喜县', '140823');
INSERT INTO `kl_area` VALUES ('470', '74', null, '盐山县', '130925');
INSERT INTO `kl_area` VALUES ('471', '105', null, '稷山县', '140824');
INSERT INTO `kl_area` VALUES ('472', '74', null, '肃宁县', '130926');
INSERT INTO `kl_area` VALUES ('473', '105', null, '新绛县', '140825');
INSERT INTO `kl_area` VALUES ('474', '74', null, '南皮县', '130927');
INSERT INTO `kl_area` VALUES ('475', '105', null, '绛县', '140826');
INSERT INTO `kl_area` VALUES ('476', '74', null, '吴桥县', '130928');
INSERT INTO `kl_area` VALUES ('477', '105', null, '垣曲县', '140827');
INSERT INTO `kl_area` VALUES ('478', '74', null, '献县', '130929');
INSERT INTO `kl_area` VALUES ('479', '105', null, '夏县', '140828');
INSERT INTO `kl_area` VALUES ('480', '58', null, '市辖区', '130101');
INSERT INTO `kl_area` VALUES ('481', '74', null, '孟村回族自治县', '130930');
INSERT INTO `kl_area` VALUES ('482', '58', null, '长安区', '130102');
INSERT INTO `kl_area` VALUES ('483', '105', null, '平陆县', '140829');
INSERT INTO `kl_area` VALUES ('484', '74', null, '泊头市', '130981');
INSERT INTO `kl_area` VALUES ('485', '58', null, '桥东区', '130103');
INSERT INTO `kl_area` VALUES ('486', '105', null, '芮城县', '140830');
INSERT INTO `kl_area` VALUES ('487', '74', null, '任丘市', '130982');
INSERT INTO `kl_area` VALUES ('488', '58', null, '桥西区', '130104');
INSERT INTO `kl_area` VALUES ('489', '105', null, '永济市', '140881');
INSERT INTO `kl_area` VALUES ('490', '74', null, '黄骅市', '130983');
INSERT INTO `kl_area` VALUES ('491', '105', null, '河津市', '140882');
INSERT INTO `kl_area` VALUES ('492', '58', null, '新华区', '130105');
INSERT INTO `kl_area` VALUES ('493', '74', null, '河间市', '130984');
INSERT INTO `kl_area` VALUES ('494', '58', null, '井陉矿区', '130107');
INSERT INTO `kl_area` VALUES ('495', '58', null, '裕华区', '130108');
INSERT INTO `kl_area` VALUES ('496', '58', null, '井陉县', '130121');
INSERT INTO `kl_area` VALUES ('497', '58', null, '正定县', '130123');
INSERT INTO `kl_area` VALUES ('498', '58', null, '栾城县', '130124');
INSERT INTO `kl_area` VALUES ('499', '58', null, '行唐县', '130125');
INSERT INTO `kl_area` VALUES ('500', '58', null, '灵寿县', '130126');
INSERT INTO `kl_area` VALUES ('501', '58', null, '高邑县', '130127');
INSERT INTO `kl_area` VALUES ('502', '58', null, '深泽县', '130128');
INSERT INTO `kl_area` VALUES ('503', '58', null, '赞皇县', '130129');
INSERT INTO `kl_area` VALUES ('504', '58', null, '无极县', '130130');
INSERT INTO `kl_area` VALUES ('505', '58', null, '平山县', '130131');
INSERT INTO `kl_area` VALUES ('506', '58', null, '元氏县', '130132');
INSERT INTO `kl_area` VALUES ('507', '58', null, '赵县', '130133');
INSERT INTO `kl_area` VALUES ('508', '58', null, '辛集市', '130181');
INSERT INTO `kl_area` VALUES ('509', '107', null, '市辖区', '140901');
INSERT INTO `kl_area` VALUES ('510', '58', null, '藁城市', '130182');
INSERT INTO `kl_area` VALUES ('511', '77', null, '市辖区', '131001');
INSERT INTO `kl_area` VALUES ('512', '107', null, '忻府区', '140902');
INSERT INTO `kl_area` VALUES ('513', '58', null, '晋州市', '130183');
INSERT INTO `kl_area` VALUES ('514', '77', null, '安次区', '131002');
INSERT INTO `kl_area` VALUES ('515', '107', null, '定襄县', '140921');
INSERT INTO `kl_area` VALUES ('516', '58', null, '新乐市', '130184');
INSERT INTO `kl_area` VALUES ('517', '77', null, '广阳区', '131003');
INSERT INTO `kl_area` VALUES ('518', '107', null, '五台县', '140922');
INSERT INTO `kl_area` VALUES ('519', '58', null, '鹿泉市', '130185');
INSERT INTO `kl_area` VALUES ('520', '77', null, '固安县', '131022');
INSERT INTO `kl_area` VALUES ('521', '107', null, '代县', '140923');
INSERT INTO `kl_area` VALUES ('522', '77', null, '永清县', '131023');
INSERT INTO `kl_area` VALUES ('523', '107', null, '繁峙县', '140924');
INSERT INTO `kl_area` VALUES ('524', '77', null, '香河县', '131024');
INSERT INTO `kl_area` VALUES ('525', '107', null, '宁武县', '140925');
INSERT INTO `kl_area` VALUES ('526', '77', null, '大城县', '131025');
INSERT INTO `kl_area` VALUES ('527', '107', null, '静乐县', '140926');
INSERT INTO `kl_area` VALUES ('528', '77', null, '文安县', '131026');
INSERT INTO `kl_area` VALUES ('529', '107', null, '神池县', '140927');
INSERT INTO `kl_area` VALUES ('530', '77', null, '大厂回族自治县', '131028');
INSERT INTO `kl_area` VALUES ('531', '107', null, '五寨县', '140928');
INSERT INTO `kl_area` VALUES ('532', '77', null, '霸州市', '131081');
INSERT INTO `kl_area` VALUES ('533', '107', null, '岢岚县', '140929');
INSERT INTO `kl_area` VALUES ('534', '77', null, '三河市', '131082');
INSERT INTO `kl_area` VALUES ('535', '107', null, '河曲县', '140930');
INSERT INTO `kl_area` VALUES ('536', '107', null, '保德县', '140931');
INSERT INTO `kl_area` VALUES ('537', '107', null, '偏关县', '140932');
INSERT INTO `kl_area` VALUES ('538', '107', null, '原平市', '140981');
INSERT INTO `kl_area` VALUES ('539', '60', null, '市辖区', '130201');
INSERT INTO `kl_area` VALUES ('540', '60', null, '路南区', '130202');
INSERT INTO `kl_area` VALUES ('541', '60', null, '路北区', '130203');
INSERT INTO `kl_area` VALUES ('542', '60', null, '古冶区', '130204');
INSERT INTO `kl_area` VALUES ('543', '60', null, '开平区', '130205');
INSERT INTO `kl_area` VALUES ('544', '60', null, '丰南区', '130207');
INSERT INTO `kl_area` VALUES ('545', '60', null, '丰润区', '130208');
INSERT INTO `kl_area` VALUES ('546', '60', null, '曹妃甸区', '130209');
INSERT INTO `kl_area` VALUES ('547', '60', null, '滦县', '130223');
INSERT INTO `kl_area` VALUES ('548', '60', null, '滦南县', '130224');
INSERT INTO `kl_area` VALUES ('549', '60', null, '乐亭县', '130225');
INSERT INTO `kl_area` VALUES ('550', '60', null, '迁西县', '130227');
INSERT INTO `kl_area` VALUES ('551', '60', null, '玉田县', '130229');
INSERT INTO `kl_area` VALUES ('552', '79', null, '市辖区', '131101');
INSERT INTO `kl_area` VALUES ('553', '60', null, '遵化市', '130281');
INSERT INTO `kl_area` VALUES ('554', '60', null, '迁安市', '130283');
INSERT INTO `kl_area` VALUES ('555', '79', null, '桃城区', '131102');
INSERT INTO `kl_area` VALUES ('556', '109', null, '市辖区', '141001');
INSERT INTO `kl_area` VALUES ('557', '79', null, '枣强县', '131121');
INSERT INTO `kl_area` VALUES ('558', '109', null, '尧都区', '141002');
INSERT INTO `kl_area` VALUES ('559', '79', null, '武邑县', '131122');
INSERT INTO `kl_area` VALUES ('560', '109', null, '曲沃县', '141021');
INSERT INTO `kl_area` VALUES ('561', '79', null, '武强县', '131123');
INSERT INTO `kl_area` VALUES ('562', '109', null, '翼城县', '141022');
INSERT INTO `kl_area` VALUES ('563', '79', null, '饶阳县', '131124');
INSERT INTO `kl_area` VALUES ('564', '109', null, '襄汾县', '141023');
INSERT INTO `kl_area` VALUES ('565', '79', null, '安平县', '131125');
INSERT INTO `kl_area` VALUES ('566', '109', null, '洪洞县', '141024');
INSERT INTO `kl_area` VALUES ('567', '79', null, '故城县', '131126');
INSERT INTO `kl_area` VALUES ('568', '109', null, '古县', '141025');
INSERT INTO `kl_area` VALUES ('569', '79', null, '景县', '131127');
INSERT INTO `kl_area` VALUES ('570', '109', null, '安泽县', '141026');
INSERT INTO `kl_area` VALUES ('571', '79', null, '阜城县', '131128');
INSERT INTO `kl_area` VALUES ('572', '109', null, '浮山县', '141027');
INSERT INTO `kl_area` VALUES ('573', '79', null, '冀州市', '131181');
INSERT INTO `kl_area` VALUES ('574', '109', null, '吉县', '141028');
INSERT INTO `kl_area` VALUES ('575', '79', null, '深州市', '131182');
INSERT INTO `kl_area` VALUES ('576', '109', null, '乡宁县', '141029');
INSERT INTO `kl_area` VALUES ('577', '109', null, '大宁县', '141030');
INSERT INTO `kl_area` VALUES ('578', '109', null, '隰县', '141031');
INSERT INTO `kl_area` VALUES ('579', '109', null, '永和县', '141032');
INSERT INTO `kl_area` VALUES ('580', '62', null, '市辖区', '130301');
INSERT INTO `kl_area` VALUES ('581', '109', null, '蒲县', '141033');
INSERT INTO `kl_area` VALUES ('582', '62', null, '海港区', '130302');
INSERT INTO `kl_area` VALUES ('583', '109', null, '汾西县', '141034');
INSERT INTO `kl_area` VALUES ('584', '62', null, '山海关区', '130303');
INSERT INTO `kl_area` VALUES ('585', '109', null, '侯马市', '141081');
INSERT INTO `kl_area` VALUES ('586', '62', null, '北戴河区', '130304');
INSERT INTO `kl_area` VALUES ('587', '109', null, '霍州市', '141082');
INSERT INTO `kl_area` VALUES ('588', '62', null, '青龙满族自治县', '130321');
INSERT INTO `kl_area` VALUES ('589', '62', null, '昌黎县', '130322');
INSERT INTO `kl_area` VALUES ('590', '62', null, '抚宁县', '130323');
INSERT INTO `kl_area` VALUES ('591', '62', null, '卢龙县', '130324');
INSERT INTO `kl_area` VALUES ('592', '84', null, '市辖区', '140101');
INSERT INTO `kl_area` VALUES ('593', '84', null, '小店区', '140105');
INSERT INTO `kl_area` VALUES ('594', '84', null, '迎泽区', '140106');
INSERT INTO `kl_area` VALUES ('595', '84', null, '杏花岭区', '140107');
INSERT INTO `kl_area` VALUES ('596', '84', null, '尖草坪区', '140108');
INSERT INTO `kl_area` VALUES ('597', '84', null, '万柏林区', '140109');
INSERT INTO `kl_area` VALUES ('598', '84', null, '晋源区', '140110');
INSERT INTO `kl_area` VALUES ('599', '84', null, '清徐县', '140121');
INSERT INTO `kl_area` VALUES ('600', '84', null, '阳曲县', '140122');
INSERT INTO `kl_area` VALUES ('601', '84', null, '娄烦县', '140123');
INSERT INTO `kl_area` VALUES ('602', '84', null, '古交市', '140181');
INSERT INTO `kl_area` VALUES ('603', '111', null, '市辖区', '141101');
INSERT INTO `kl_area` VALUES ('604', '111', null, '离石区', '141102');
INSERT INTO `kl_area` VALUES ('605', '111', null, '文水县', '141121');
INSERT INTO `kl_area` VALUES ('606', '64', null, '市辖区', '130401');
INSERT INTO `kl_area` VALUES ('607', '111', null, '交城县', '141122');
INSERT INTO `kl_area` VALUES ('608', '64', null, '邯山区', '130402');
INSERT INTO `kl_area` VALUES ('609', '111', null, '兴县', '141123');
INSERT INTO `kl_area` VALUES ('610', '64', null, '丛台区', '130403');
INSERT INTO `kl_area` VALUES ('611', '111', null, '临县', '141124');
INSERT INTO `kl_area` VALUES ('612', '64', null, '复兴区', '130404');
INSERT INTO `kl_area` VALUES ('613', '111', null, '柳林县', '141125');
INSERT INTO `kl_area` VALUES ('614', '64', null, '峰峰矿区', '130406');
INSERT INTO `kl_area` VALUES ('615', '111', null, '石楼县', '141126');
INSERT INTO `kl_area` VALUES ('616', '64', null, '邯郸县', '130421');
INSERT INTO `kl_area` VALUES ('617', '111', null, '岚县', '141127');
INSERT INTO `kl_area` VALUES ('618', '64', null, '临漳县', '130423');
INSERT INTO `kl_area` VALUES ('619', '111', null, '方山县', '141128');
INSERT INTO `kl_area` VALUES ('620', '64', null, '成安县', '130424');
INSERT INTO `kl_area` VALUES ('621', '111', null, '中阳县', '141129');
INSERT INTO `kl_area` VALUES ('622', '64', null, '大名县', '130425');
INSERT INTO `kl_area` VALUES ('623', '111', null, '交口县', '141130');
INSERT INTO `kl_area` VALUES ('624', '64', null, '涉县', '130426');
INSERT INTO `kl_area` VALUES ('625', '111', null, '孝义市', '141181');
INSERT INTO `kl_area` VALUES ('626', '88', null, '市辖区', '140201');
INSERT INTO `kl_area` VALUES ('627', '64', null, '磁县', '130427');
INSERT INTO `kl_area` VALUES ('628', '111', null, '汾阳市', '141182');
INSERT INTO `kl_area` VALUES ('629', '88', null, '城区', '140202');
INSERT INTO `kl_area` VALUES ('630', '64', null, '肥乡县', '130428');
INSERT INTO `kl_area` VALUES ('631', '64', null, '永年县', '130429');
INSERT INTO `kl_area` VALUES ('632', '88', null, '矿区', '140203');
INSERT INTO `kl_area` VALUES ('633', '64', null, '邱县', '130430');
INSERT INTO `kl_area` VALUES ('634', '88', null, '南郊区', '140211');
INSERT INTO `kl_area` VALUES ('635', '64', null, '鸡泽县', '130431');
INSERT INTO `kl_area` VALUES ('636', '88', null, '新荣区', '140212');
INSERT INTO `kl_area` VALUES ('637', '64', null, '广平县', '130432');
INSERT INTO `kl_area` VALUES ('638', '88', null, '阳高县', '140221');
INSERT INTO `kl_area` VALUES ('639', '64', null, '馆陶县', '130433');
INSERT INTO `kl_area` VALUES ('640', '88', null, '天镇县', '140222');
INSERT INTO `kl_area` VALUES ('641', '64', null, '魏县', '130434');
INSERT INTO `kl_area` VALUES ('642', '88', null, '广灵县', '140223');
INSERT INTO `kl_area` VALUES ('643', '64', null, '曲周县', '130435');
INSERT INTO `kl_area` VALUES ('644', '88', null, '灵丘县', '140224');
INSERT INTO `kl_area` VALUES ('645', '64', null, '武安市', '130481');
INSERT INTO `kl_area` VALUES ('646', '88', null, '浑源县', '140225');
INSERT INTO `kl_area` VALUES ('647', '88', null, '左云县', '140226');
INSERT INTO `kl_area` VALUES ('648', '88', null, '大同县', '140227');
INSERT INTO `kl_area` VALUES ('649', '130', null, '市辖区', '150101');
INSERT INTO `kl_area` VALUES ('650', '130', null, '新城区', '150102');
INSERT INTO `kl_area` VALUES ('651', '130', null, '回民区', '150103');
INSERT INTO `kl_area` VALUES ('652', '130', null, '玉泉区', '150104');
INSERT INTO `kl_area` VALUES ('653', '130', null, '赛罕区', '150105');
INSERT INTO `kl_area` VALUES ('654', '130', null, '土默特左旗', '150121');
INSERT INTO `kl_area` VALUES ('655', '130', null, '托克托县', '150122');
INSERT INTO `kl_area` VALUES ('656', '130', null, '和林格尔县', '150123');
INSERT INTO `kl_area` VALUES ('657', '130', null, '清水河县', '150124');
INSERT INTO `kl_area` VALUES ('658', '130', null, '武川县', '150125');
INSERT INTO `kl_area` VALUES ('659', '66', null, '市辖区', '130501');
INSERT INTO `kl_area` VALUES ('660', '66', null, '桥东区', '130502');
INSERT INTO `kl_area` VALUES ('661', '66', null, '桥西区', '130503');
INSERT INTO `kl_area` VALUES ('662', '91', null, '市辖区', '140301');
INSERT INTO `kl_area` VALUES ('663', '66', null, '邢台县', '130521');
INSERT INTO `kl_area` VALUES ('664', '91', null, '城区', '140302');
INSERT INTO `kl_area` VALUES ('665', '66', null, '临城县', '130522');
INSERT INTO `kl_area` VALUES ('666', '91', null, '矿区', '140303');
INSERT INTO `kl_area` VALUES ('667', '66', null, '内丘县', '130523');
INSERT INTO `kl_area` VALUES ('668', '91', null, '郊区', '140311');
INSERT INTO `kl_area` VALUES ('669', '66', null, '柏乡县', '130524');
INSERT INTO `kl_area` VALUES ('670', '132', null, '市辖区', '150201');
INSERT INTO `kl_area` VALUES ('671', '91', null, '平定县', '140321');
INSERT INTO `kl_area` VALUES ('672', '66', null, '隆尧县', '130525');
INSERT INTO `kl_area` VALUES ('673', '132', null, '东河区', '150202');
INSERT INTO `kl_area` VALUES ('674', '66', null, '任县', '130526');
INSERT INTO `kl_area` VALUES ('675', '91', null, '盂县', '140322');
INSERT INTO `kl_area` VALUES ('676', '132', null, '昆都仑区', '150203');
INSERT INTO `kl_area` VALUES ('677', '66', null, '南和县', '130527');
INSERT INTO `kl_area` VALUES ('678', '132', null, '青山区', '150204');
INSERT INTO `kl_area` VALUES ('679', '66', null, '宁晋县', '130528');
INSERT INTO `kl_area` VALUES ('680', '132', null, '石拐区', '150205');
INSERT INTO `kl_area` VALUES ('681', '66', null, '巨鹿县', '130529');
INSERT INTO `kl_area` VALUES ('682', '132', null, '白云鄂博矿区', '150206');
INSERT INTO `kl_area` VALUES ('683', '66', null, '新河县', '130530');
INSERT INTO `kl_area` VALUES ('684', '132', null, '九原区', '150207');
INSERT INTO `kl_area` VALUES ('685', '66', null, '广宗县', '130531');
INSERT INTO `kl_area` VALUES ('686', '132', null, '土默特右旗', '150221');
INSERT INTO `kl_area` VALUES ('687', '66', null, '平乡县', '130532');
INSERT INTO `kl_area` VALUES ('688', '132', null, '固阳县', '150222');
INSERT INTO `kl_area` VALUES ('689', '66', null, '威县', '130533');
INSERT INTO `kl_area` VALUES ('690', '132', null, '达尔罕茂明安联合旗', '150223');
INSERT INTO `kl_area` VALUES ('691', '66', null, '清河县', '130534');
INSERT INTO `kl_area` VALUES ('692', '66', null, '临西县', '130535');
INSERT INTO `kl_area` VALUES ('693', '66', null, '南宫市', '130581');
INSERT INTO `kl_area` VALUES ('694', '66', null, '沙河市', '130582');
INSERT INTO `kl_area` VALUES ('695', '94', null, '市辖区', '140401');
INSERT INTO `kl_area` VALUES ('696', '94', null, '城区', '140402');
INSERT INTO `kl_area` VALUES ('697', '94', null, '郊区', '140411');
INSERT INTO `kl_area` VALUES ('698', '94', null, '长治县', '140421');
INSERT INTO `kl_area` VALUES ('699', '94', null, '襄垣县', '140423');
INSERT INTO `kl_area` VALUES ('700', '94', null, '屯留县', '140424');
INSERT INTO `kl_area` VALUES ('701', '94', null, '平顺县', '140425');
INSERT INTO `kl_area` VALUES ('702', '94', null, '黎城县', '140426');
INSERT INTO `kl_area` VALUES ('703', '94', null, '壶关县', '140427');
INSERT INTO `kl_area` VALUES ('704', '94', null, '长子县', '140428');
INSERT INTO `kl_area` VALUES ('705', '94', null, '武乡县', '140429');
INSERT INTO `kl_area` VALUES ('706', '94', null, '沁县', '140430');
INSERT INTO `kl_area` VALUES ('707', '94', null, '沁源县', '140431');
INSERT INTO `kl_area` VALUES ('708', '94', null, '潞城市', '140481');
INSERT INTO `kl_area` VALUES ('709', '134', null, '市辖区', '150301');
INSERT INTO `kl_area` VALUES ('710', '134', null, '海勃湾区', '150302');
INSERT INTO `kl_area` VALUES ('711', '134', null, '海南区', '150303');
INSERT INTO `kl_area` VALUES ('712', '134', null, '乌达区', '150304');
INSERT INTO `kl_area` VALUES ('713', '68', null, '市辖区', '130601');
INSERT INTO `kl_area` VALUES ('714', '68', null, '新市区', '130602');
INSERT INTO `kl_area` VALUES ('715', '68', null, '北市区', '130603');
INSERT INTO `kl_area` VALUES ('716', '68', null, '南市区', '130604');
INSERT INTO `kl_area` VALUES ('717', '68', null, '满城县', '130621');
INSERT INTO `kl_area` VALUES ('718', '68', null, '清苑县', '130622');
INSERT INTO `kl_area` VALUES ('719', '68', null, '涞水县', '130623');
INSERT INTO `kl_area` VALUES ('720', '68', null, '阜平县', '130624');
INSERT INTO `kl_area` VALUES ('721', '68', null, '徐水县', '130625');
INSERT INTO `kl_area` VALUES ('722', '68', null, '定兴县', '130626');
INSERT INTO `kl_area` VALUES ('723', '68', null, '唐县', '130627');
INSERT INTO `kl_area` VALUES ('724', '68', null, '高阳县', '130628');
INSERT INTO `kl_area` VALUES ('725', '68', null, '容城县', '130629');
INSERT INTO `kl_area` VALUES ('726', '68', null, '涞源县', '130630');
INSERT INTO `kl_area` VALUES ('727', '68', null, '望都县', '130631');
INSERT INTO `kl_area` VALUES ('728', '68', null, '安新县', '130632');
INSERT INTO `kl_area` VALUES ('729', '68', null, '易县', '130633');
INSERT INTO `kl_area` VALUES ('730', '68', null, '曲阳县', '130634');
INSERT INTO `kl_area` VALUES ('731', '68', null, '蠡县', '130635');
INSERT INTO `kl_area` VALUES ('732', '97', null, '市辖区', '140501');
INSERT INTO `kl_area` VALUES ('733', '68', null, '顺平县', '130636');
INSERT INTO `kl_area` VALUES ('734', '97', null, '城区', '140502');
INSERT INTO `kl_area` VALUES ('735', '68', null, '博野县', '130637');
INSERT INTO `kl_area` VALUES ('736', '97', null, '沁水县', '140521');
INSERT INTO `kl_area` VALUES ('737', '68', null, '雄县', '130638');
INSERT INTO `kl_area` VALUES ('738', '135', null, '市辖区', '150401');
INSERT INTO `kl_area` VALUES ('739', '97', null, '阳城县', '140522');
INSERT INTO `kl_area` VALUES ('740', '68', null, '涿州市', '130681');
INSERT INTO `kl_area` VALUES ('741', '135', null, '红山区', '150402');
INSERT INTO `kl_area` VALUES ('742', '97', null, '陵川县', '140524');
INSERT INTO `kl_area` VALUES ('743', '135', null, '元宝山区', '150403');
INSERT INTO `kl_area` VALUES ('744', '68', null, '定州市', '130682');
INSERT INTO `kl_area` VALUES ('745', '97', null, '泽州县', '140525');
INSERT INTO `kl_area` VALUES ('746', '68', null, '安国市', '130683');
INSERT INTO `kl_area` VALUES ('747', '135', null, '松山区', '150404');
INSERT INTO `kl_area` VALUES ('748', '97', null, '高平市', '140581');
INSERT INTO `kl_area` VALUES ('749', '135', null, '阿鲁科尔沁旗', '150421');
INSERT INTO `kl_area` VALUES ('750', '68', null, '高碑店市', '130684');
INSERT INTO `kl_area` VALUES ('751', '135', null, '巴林左旗', '150422');
INSERT INTO `kl_area` VALUES ('752', '135', null, '巴林右旗', '150423');
INSERT INTO `kl_area` VALUES ('753', '135', null, '林西县', '150424');
INSERT INTO `kl_area` VALUES ('754', '135', null, '克什克腾旗', '150425');
INSERT INTO `kl_area` VALUES ('755', '135', null, '翁牛特旗', '150426');
INSERT INTO `kl_area` VALUES ('756', '135', null, '喀喇沁旗', '150428');
INSERT INTO `kl_area` VALUES ('757', '135', null, '宁城县', '150429');
INSERT INTO `kl_area` VALUES ('758', '135', null, '敖汉旗', '150430');
INSERT INTO `kl_area` VALUES ('759', '136', null, '市辖区', '150501');
INSERT INTO `kl_area` VALUES ('760', '136', null, '科尔沁区', '150502');
INSERT INTO `kl_area` VALUES ('761', '136', null, '科尔沁左翼中旗', '150521');
INSERT INTO `kl_area` VALUES ('762', '136', null, '科尔沁左翼后旗', '150522');
INSERT INTO `kl_area` VALUES ('763', '136', null, '开鲁县', '150523');
INSERT INTO `kl_area` VALUES ('764', '136', null, '库伦旗', '150524');
INSERT INTO `kl_area` VALUES ('765', '136', null, '奈曼旗', '150525');
INSERT INTO `kl_area` VALUES ('766', '136', null, '扎鲁特旗', '150526');
INSERT INTO `kl_area` VALUES ('767', '136', null, '霍林郭勒市', '150581');
INSERT INTO `kl_area` VALUES ('768', '173', null, '市辖区', '210301');
INSERT INTO `kl_area` VALUES ('769', '173', null, '铁东区', '210302');
INSERT INTO `kl_area` VALUES ('770', '173', null, '铁西区', '210303');
INSERT INTO `kl_area` VALUES ('771', '173', null, '立山区', '210304');
INSERT INTO `kl_area` VALUES ('772', '173', null, '千山区', '210311');
INSERT INTO `kl_area` VALUES ('773', '173', null, '台安县', '210321');
INSERT INTO `kl_area` VALUES ('774', '173', null, '岫岩满族自治县', '210323');
INSERT INTO `kl_area` VALUES ('775', '173', null, '海城市', '210381');
INSERT INTO `kl_area` VALUES ('776', '137', null, '市辖区', '150601');
INSERT INTO `kl_area` VALUES ('777', '137', null, '东胜区', '150602');
INSERT INTO `kl_area` VALUES ('778', '137', null, '达拉特旗', '150621');
INSERT INTO `kl_area` VALUES ('779', '137', null, '准格尔旗', '150622');
INSERT INTO `kl_area` VALUES ('780', '137', null, '鄂托克前旗', '150623');
INSERT INTO `kl_area` VALUES ('781', '137', null, '鄂托克旗', '150624');
INSERT INTO `kl_area` VALUES ('782', '137', null, '杭锦旗', '150625');
INSERT INTO `kl_area` VALUES ('783', '137', null, '乌审旗', '150626');
INSERT INTO `kl_area` VALUES ('784', '137', null, '伊金霍洛旗', '150627');
INSERT INTO `kl_area` VALUES ('785', '175', null, '市辖区', '210401');
INSERT INTO `kl_area` VALUES ('786', '175', null, '新抚区', '210402');
INSERT INTO `kl_area` VALUES ('787', '175', null, '东洲区', '210403');
INSERT INTO `kl_area` VALUES ('788', '175', null, '望花区', '210404');
INSERT INTO `kl_area` VALUES ('789', '175', null, '顺城区', '210411');
INSERT INTO `kl_area` VALUES ('790', '175', null, '抚顺县', '210421');
INSERT INTO `kl_area` VALUES ('791', '175', null, '新宾满族自治县', '210422');
INSERT INTO `kl_area` VALUES ('792', '175', null, '清原满族自治县', '210423');
INSERT INTO `kl_area` VALUES ('793', '138', null, '市辖区', '150701');
INSERT INTO `kl_area` VALUES ('794', '138', null, '海拉尔区', '150702');
INSERT INTO `kl_area` VALUES ('795', '138', null, '扎赉诺尔区', '150703');
INSERT INTO `kl_area` VALUES ('796', '138', null, '阿荣旗', '150721');
INSERT INTO `kl_area` VALUES ('797', '138', null, '莫力达瓦达斡尔族自治旗', '150722');
INSERT INTO `kl_area` VALUES ('798', '138', null, '鄂伦春自治旗', '150723');
INSERT INTO `kl_area` VALUES ('799', '138', null, '鄂温克族自治旗', '150724');
INSERT INTO `kl_area` VALUES ('800', '138', null, '陈巴尔虎旗', '150725');
INSERT INTO `kl_area` VALUES ('801', '138', null, '新巴尔虎左旗', '150726');
INSERT INTO `kl_area` VALUES ('802', '138', null, '新巴尔虎右旗', '150727');
INSERT INTO `kl_area` VALUES ('803', '138', null, '满洲里市', '150781');
INSERT INTO `kl_area` VALUES ('804', '138', null, '牙克石市', '150782');
INSERT INTO `kl_area` VALUES ('805', '138', null, '扎兰屯市', '150783');
INSERT INTO `kl_area` VALUES ('806', '138', null, '额尔古纳市', '150784');
INSERT INTO `kl_area` VALUES ('807', '138', null, '根河市', '150785');
INSERT INTO `kl_area` VALUES ('808', '177', null, '市辖区', '210501');
INSERT INTO `kl_area` VALUES ('809', '177', null, '平山区', '210502');
INSERT INTO `kl_area` VALUES ('810', '177', null, '溪湖区', '210503');
INSERT INTO `kl_area` VALUES ('811', '177', null, '明山区', '210504');
INSERT INTO `kl_area` VALUES ('812', '177', null, '南芬区', '210505');
INSERT INTO `kl_area` VALUES ('813', '177', null, '本溪满族自治县', '210521');
INSERT INTO `kl_area` VALUES ('814', '177', null, '桓仁满族自治县', '210522');
INSERT INTO `kl_area` VALUES ('815', '140', null, '市辖区', '150801');
INSERT INTO `kl_area` VALUES ('816', '140', null, '临河区', '150802');
INSERT INTO `kl_area` VALUES ('817', '140', null, '五原县', '150821');
INSERT INTO `kl_area` VALUES ('818', '140', null, '磴口县', '150822');
INSERT INTO `kl_area` VALUES ('819', '140', null, '乌拉特前旗', '150823');
INSERT INTO `kl_area` VALUES ('820', '140', null, '乌拉特中旗', '150824');
INSERT INTO `kl_area` VALUES ('821', '140', null, '乌拉特后旗', '150825');
INSERT INTO `kl_area` VALUES ('822', '140', null, '杭锦后旗', '150826');
INSERT INTO `kl_area` VALUES ('823', '179', null, '市辖区', '210601');
INSERT INTO `kl_area` VALUES ('824', '179', null, '元宝区', '210602');
INSERT INTO `kl_area` VALUES ('825', '179', null, '振兴区', '210603');
INSERT INTO `kl_area` VALUES ('826', '179', null, '振安区', '210604');
INSERT INTO `kl_area` VALUES ('827', '179', null, '宽甸满族自治县', '210624');
INSERT INTO `kl_area` VALUES ('828', '179', null, '东港市', '210681');
INSERT INTO `kl_area` VALUES ('829', '179', null, '凤城市', '210682');
INSERT INTO `kl_area` VALUES ('830', '142', null, '市辖区', '150901');
INSERT INTO `kl_area` VALUES ('831', '142', null, '集宁区', '150902');
INSERT INTO `kl_area` VALUES ('832', '142', null, '卓资县', '150921');
INSERT INTO `kl_area` VALUES ('833', '142', null, '化德县', '150922');
INSERT INTO `kl_area` VALUES ('834', '142', null, '商都县', '150923');
INSERT INTO `kl_area` VALUES ('835', '142', null, '兴和县', '150924');
INSERT INTO `kl_area` VALUES ('836', '142', null, '凉城县', '150925');
INSERT INTO `kl_area` VALUES ('837', '142', null, '察哈尔右翼前旗', '150926');
INSERT INTO `kl_area` VALUES ('838', '142', null, '察哈尔右翼中旗', '150927');
INSERT INTO `kl_area` VALUES ('839', '142', null, '察哈尔右翼后旗', '150928');
INSERT INTO `kl_area` VALUES ('840', '142', null, '四子王旗', '150929');
INSERT INTO `kl_area` VALUES ('841', '142', null, '丰镇市', '150981');
INSERT INTO `kl_area` VALUES ('842', '181', null, '市辖区', '210701');
INSERT INTO `kl_area` VALUES ('843', '181', null, '古塔区', '210702');
INSERT INTO `kl_area` VALUES ('844', '181', null, '凌河区', '210703');
INSERT INTO `kl_area` VALUES ('845', '181', null, '太和区', '210711');
INSERT INTO `kl_area` VALUES ('846', '181', null, '黑山县', '210726');
INSERT INTO `kl_area` VALUES ('847', '181', null, '义县', '210727');
INSERT INTO `kl_area` VALUES ('848', '181', null, '凌海市', '210781');
INSERT INTO `kl_area` VALUES ('849', '181', null, '北镇市', '210782');
INSERT INTO `kl_area` VALUES ('850', '144', null, '乌兰浩特市', '152201');
INSERT INTO `kl_area` VALUES ('851', '144', null, '阿尔山市', '152202');
INSERT INTO `kl_area` VALUES ('852', '144', null, '科尔沁右翼前旗', '152221');
INSERT INTO `kl_area` VALUES ('853', '144', null, '科尔沁右翼中旗', '152222');
INSERT INTO `kl_area` VALUES ('854', '144', null, '扎赉特旗', '152223');
INSERT INTO `kl_area` VALUES ('855', '144', null, '突泉县', '152224');
INSERT INTO `kl_area` VALUES ('856', '183', null, '市辖区', '210801');
INSERT INTO `kl_area` VALUES ('857', '183', null, '站前区', '210802');
INSERT INTO `kl_area` VALUES ('858', '183', null, '西市区', '210803');
INSERT INTO `kl_area` VALUES ('859', '183', null, '鲅鱼圈区', '210804');
INSERT INTO `kl_area` VALUES ('860', '183', null, '老边区', '210811');
INSERT INTO `kl_area` VALUES ('861', '183', null, '盖州市', '210881');
INSERT INTO `kl_area` VALUES ('862', '183', null, '大石桥市', '210882');
INSERT INTO `kl_area` VALUES ('863', '146', null, '二连浩特市', '152501');
INSERT INTO `kl_area` VALUES ('864', '146', null, '锡林浩特市', '152502');
INSERT INTO `kl_area` VALUES ('865', '146', null, '阿巴嘎旗', '152522');
INSERT INTO `kl_area` VALUES ('866', '146', null, '苏尼特左旗', '152523');
INSERT INTO `kl_area` VALUES ('867', '146', null, '苏尼特右旗', '152524');
INSERT INTO `kl_area` VALUES ('868', '146', null, '东乌珠穆沁旗', '152525');
INSERT INTO `kl_area` VALUES ('869', '146', null, '西乌珠穆沁旗', '152526');
INSERT INTO `kl_area` VALUES ('870', '146', null, '太仆寺旗', '152527');
INSERT INTO `kl_area` VALUES ('871', '146', null, '镶黄旗', '152528');
INSERT INTO `kl_area` VALUES ('872', '146', null, '正镶白旗', '152529');
INSERT INTO `kl_area` VALUES ('873', '185', null, '市辖区', '210901');
INSERT INTO `kl_area` VALUES ('874', '146', null, '正蓝旗', '152530');
INSERT INTO `kl_area` VALUES ('875', '185', null, '海州区', '210902');
INSERT INTO `kl_area` VALUES ('876', '146', null, '多伦县', '152531');
INSERT INTO `kl_area` VALUES ('877', '185', null, '新邱区', '210903');
INSERT INTO `kl_area` VALUES ('878', '185', null, '太平区', '210904');
INSERT INTO `kl_area` VALUES ('879', '185', null, '清河门区', '210905');
INSERT INTO `kl_area` VALUES ('880', '185', null, '细河区', '210911');
INSERT INTO `kl_area` VALUES ('881', '185', null, '阜新蒙古族自治县', '210921');
INSERT INTO `kl_area` VALUES ('882', '185', null, '彰武县', '210922');
INSERT INTO `kl_area` VALUES ('883', '148', null, '阿拉善左旗', '152921');
INSERT INTO `kl_area` VALUES ('884', '148', null, '阿拉善右旗', '152922');
INSERT INTO `kl_area` VALUES ('885', '148', null, '额济纳旗', '152923');
INSERT INTO `kl_area` VALUES ('886', '187', null, '市辖区', '211001');
INSERT INTO `kl_area` VALUES ('887', '187', null, '白塔区', '211002');
INSERT INTO `kl_area` VALUES ('888', '187', null, '文圣区', '211003');
INSERT INTO `kl_area` VALUES ('889', '187', null, '宏伟区', '211004');
INSERT INTO `kl_area` VALUES ('890', '187', null, '弓长岭区', '211005');
INSERT INTO `kl_area` VALUES ('891', '187', null, '太子河区', '211011');
INSERT INTO `kl_area` VALUES ('892', '187', null, '辽阳县', '211021');
INSERT INTO `kl_area` VALUES ('893', '187', null, '灯塔市', '211081');
INSERT INTO `kl_area` VALUES ('894', '168', null, '市辖区', '210101');
INSERT INTO `kl_area` VALUES ('895', '168', null, '和平区', '210102');
INSERT INTO `kl_area` VALUES ('896', '168', null, '沈河区', '210103');
INSERT INTO `kl_area` VALUES ('897', '168', null, '大东区', '210104');
INSERT INTO `kl_area` VALUES ('898', '168', null, '皇姑区', '210105');
INSERT INTO `kl_area` VALUES ('899', '168', null, '铁西区', '210106');
INSERT INTO `kl_area` VALUES ('900', '168', null, '苏家屯区', '210111');
INSERT INTO `kl_area` VALUES ('901', '168', null, '东陵区', '210112');
INSERT INTO `kl_area` VALUES ('902', '168', null, '沈北新区', '210113');
INSERT INTO `kl_area` VALUES ('903', '168', null, '于洪区', '210114');
INSERT INTO `kl_area` VALUES ('904', '168', null, '辽中县', '210122');
INSERT INTO `kl_area` VALUES ('905', '168', null, '康平县', '210123');
INSERT INTO `kl_area` VALUES ('906', '189', null, '市辖区', '211101');
INSERT INTO `kl_area` VALUES ('907', '168', null, '法库县', '210124');
INSERT INTO `kl_area` VALUES ('908', '189', null, '双台子区', '211102');
INSERT INTO `kl_area` VALUES ('909', '168', null, '新民市', '210181');
INSERT INTO `kl_area` VALUES ('910', '189', null, '兴隆台区', '211103');
INSERT INTO `kl_area` VALUES ('911', '189', null, '大洼县', '211121');
INSERT INTO `kl_area` VALUES ('912', '189', null, '盘山县', '211122');
INSERT INTO `kl_area` VALUES ('913', '170', null, '市辖区', '210201');
INSERT INTO `kl_area` VALUES ('914', '191', null, '市辖区', '211201');
INSERT INTO `kl_area` VALUES ('915', '170', null, '中山区', '210202');
INSERT INTO `kl_area` VALUES ('916', '191', null, '银州区', '211202');
INSERT INTO `kl_area` VALUES ('917', '170', null, '西岗区', '210203');
INSERT INTO `kl_area` VALUES ('918', '170', null, '沙河口区', '210204');
INSERT INTO `kl_area` VALUES ('919', '191', null, '清河区', '211204');
INSERT INTO `kl_area` VALUES ('920', '170', null, '甘井子区', '210211');
INSERT INTO `kl_area` VALUES ('921', '170', null, '旅顺口区', '210212');
INSERT INTO `kl_area` VALUES ('922', '191', null, '铁岭县', '211221');
INSERT INTO `kl_area` VALUES ('923', '170', null, '金州区', '210213');
INSERT INTO `kl_area` VALUES ('924', '191', null, '西丰县', '211223');
INSERT INTO `kl_area` VALUES ('925', '170', null, '长海县', '210224');
INSERT INTO `kl_area` VALUES ('926', '191', null, '昌图县', '211224');
INSERT INTO `kl_area` VALUES ('927', '170', null, '瓦房店市', '210281');
INSERT INTO `kl_area` VALUES ('928', '191', null, '调兵山市', '211281');
INSERT INTO `kl_area` VALUES ('929', '170', null, '普兰店市', '210282');
INSERT INTO `kl_area` VALUES ('930', '191', null, '开原市', '211282');
INSERT INTO `kl_area` VALUES ('931', '170', null, '庄河市', '210283');
INSERT INTO `kl_area` VALUES ('932', '193', null, '市辖区', '211301');
INSERT INTO `kl_area` VALUES ('933', '193', null, '双塔区', '211302');
INSERT INTO `kl_area` VALUES ('934', '193', null, '龙城区', '211303');
INSERT INTO `kl_area` VALUES ('935', '193', null, '朝阳县', '211321');
INSERT INTO `kl_area` VALUES ('936', '193', null, '建平县', '211322');
INSERT INTO `kl_area` VALUES ('937', '193', null, '喀喇沁左翼蒙古族自治县', '211324');
INSERT INTO `kl_area` VALUES ('938', '193', null, '北票市', '211381');
INSERT INTO `kl_area` VALUES ('939', '193', null, '凌源市', '211382');
INSERT INTO `kl_area` VALUES ('940', '229', null, '延吉市', '222401');
INSERT INTO `kl_area` VALUES ('941', '229', null, '图们市', '222402');
INSERT INTO `kl_area` VALUES ('942', '229', null, '敦化市', '222403');
INSERT INTO `kl_area` VALUES ('943', '229', null, '珲春市', '222404');
INSERT INTO `kl_area` VALUES ('944', '229', null, '龙井市', '222405');
INSERT INTO `kl_area` VALUES ('945', '229', null, '和龙市', '222406');
INSERT INTO `kl_area` VALUES ('946', '229', null, '汪清县', '222424');
INSERT INTO `kl_area` VALUES ('947', '229', null, '安图县', '222426');
INSERT INTO `kl_area` VALUES ('948', '195', null, '市辖区', '211401');
INSERT INTO `kl_area` VALUES ('949', '195', null, '连山区', '211402');
INSERT INTO `kl_area` VALUES ('950', '195', null, '龙港区', '211403');
INSERT INTO `kl_area` VALUES ('951', '195', null, '南票区', '211404');
INSERT INTO `kl_area` VALUES ('952', '195', null, '绥中县', '211421');
INSERT INTO `kl_area` VALUES ('953', '195', null, '建昌县', '211422');
INSERT INTO `kl_area` VALUES ('954', '195', null, '兴城市', '211481');
INSERT INTO `kl_area` VALUES ('955', '264', null, '市辖区', '231001');
INSERT INTO `kl_area` VALUES ('956', '264', null, '东安区', '231002');
INSERT INTO `kl_area` VALUES ('957', '264', null, '阳明区', '231003');
INSERT INTO `kl_area` VALUES ('958', '264', null, '爱民区', '231004');
INSERT INTO `kl_area` VALUES ('959', '264', null, '西安区', '231005');
INSERT INTO `kl_area` VALUES ('960', '264', null, '东宁县', '231024');
INSERT INTO `kl_area` VALUES ('961', '264', null, '林口县', '231025');
INSERT INTO `kl_area` VALUES ('962', '264', null, '绥芬河市', '231081');
INSERT INTO `kl_area` VALUES ('963', '241', null, '市辖区', '230101');
INSERT INTO `kl_area` VALUES ('964', '264', null, '海林市', '231083');
INSERT INTO `kl_area` VALUES ('965', '241', null, '道里区', '230102');
INSERT INTO `kl_area` VALUES ('966', '264', null, '宁安市', '231084');
INSERT INTO `kl_area` VALUES ('967', '241', null, '南岗区', '230103');
INSERT INTO `kl_area` VALUES ('968', '264', null, '穆棱市', '231085');
INSERT INTO `kl_area` VALUES ('969', '241', null, '道外区', '230104');
INSERT INTO `kl_area` VALUES ('970', '241', null, '平房区', '230108');
INSERT INTO `kl_area` VALUES ('971', '241', null, '松北区', '230109');
INSERT INTO `kl_area` VALUES ('972', '213', null, '市辖区', '220101');
INSERT INTO `kl_area` VALUES ('973', '241', null, '香坊区', '230110');
INSERT INTO `kl_area` VALUES ('974', '213', null, '南关区', '220102');
INSERT INTO `kl_area` VALUES ('975', '241', null, '呼兰区', '230111');
INSERT INTO `kl_area` VALUES ('976', '213', null, '宽城区', '220103');
INSERT INTO `kl_area` VALUES ('977', '241', null, '阿城区', '230112');
INSERT INTO `kl_area` VALUES ('978', '213', null, '朝阳区', '220104');
INSERT INTO `kl_area` VALUES ('979', '241', null, '依兰县', '230123');
INSERT INTO `kl_area` VALUES ('980', '213', null, '二道区', '220105');
INSERT INTO `kl_area` VALUES ('981', '241', null, '方正县', '230124');
INSERT INTO `kl_area` VALUES ('982', '213', null, '绿园区', '220106');
INSERT INTO `kl_area` VALUES ('983', '241', null, '宾县', '230125');
INSERT INTO `kl_area` VALUES ('984', '213', null, '双阳区', '220112');
INSERT INTO `kl_area` VALUES ('985', '241', null, '巴彦县', '230126');
INSERT INTO `kl_area` VALUES ('986', '213', null, '农安县', '220122');
INSERT INTO `kl_area` VALUES ('987', '241', null, '木兰县', '230127');
INSERT INTO `kl_area` VALUES ('988', '213', null, '九台市', '220181');
INSERT INTO `kl_area` VALUES ('989', '241', null, '通河县', '230128');
INSERT INTO `kl_area` VALUES ('990', '213', null, '榆树市', '220182');
INSERT INTO `kl_area` VALUES ('991', '241', null, '延寿县', '230129');
INSERT INTO `kl_area` VALUES ('992', '213', null, '德惠市', '220183');
INSERT INTO `kl_area` VALUES ('993', '241', null, '双城市', '230182');
INSERT INTO `kl_area` VALUES ('994', '266', null, '市辖区', '231101');
INSERT INTO `kl_area` VALUES ('995', '241', null, '尚志市', '230183');
INSERT INTO `kl_area` VALUES ('996', '266', null, '爱辉区', '231102');
INSERT INTO `kl_area` VALUES ('997', '241', null, '五常市', '230184');
INSERT INTO `kl_area` VALUES ('998', '266', null, '嫩江县', '231121');
INSERT INTO `kl_area` VALUES ('999', '266', null, '逊克县', '231123');
INSERT INTO `kl_area` VALUES ('1000', '266', null, '孙吴县', '231124');
INSERT INTO `kl_area` VALUES ('1001', '266', null, '北安市', '231181');
INSERT INTO `kl_area` VALUES ('1002', '266', null, '五大连池市', '231182');
INSERT INTO `kl_area` VALUES ('1003', '215', null, '市辖区', '220201');
INSERT INTO `kl_area` VALUES ('1004', '215', null, '昌邑区', '220202');
INSERT INTO `kl_area` VALUES ('1005', '215', null, '龙潭区', '220203');
INSERT INTO `kl_area` VALUES ('1006', '215', null, '船营区', '220204');
INSERT INTO `kl_area` VALUES ('1007', '215', null, '丰满区', '220211');
INSERT INTO `kl_area` VALUES ('1008', '215', null, '永吉县', '220221');
INSERT INTO `kl_area` VALUES ('1009', '243', null, '市辖区', '230201');
INSERT INTO `kl_area` VALUES ('1010', '215', null, '蛟河市', '220281');
INSERT INTO `kl_area` VALUES ('1011', '243', null, '龙沙区', '230202');
INSERT INTO `kl_area` VALUES ('1012', '215', null, '桦甸市', '220282');
INSERT INTO `kl_area` VALUES ('1013', '243', null, '建华区', '230203');
INSERT INTO `kl_area` VALUES ('1014', '243', null, '铁锋区', '230204');
INSERT INTO `kl_area` VALUES ('1015', '215', null, '舒兰市', '220283');
INSERT INTO `kl_area` VALUES ('1016', '268', null, '市辖区', '231201');
INSERT INTO `kl_area` VALUES ('1017', '243', null, '昂昂溪区', '230205');
INSERT INTO `kl_area` VALUES ('1018', '268', null, '北林区', '231202');
INSERT INTO `kl_area` VALUES ('1019', '215', null, '磐石市', '220284');
INSERT INTO `kl_area` VALUES ('1020', '243', null, '富拉尔基区', '230206');
INSERT INTO `kl_area` VALUES ('1021', '243', null, '碾子山区', '230207');
INSERT INTO `kl_area` VALUES ('1022', '268', null, '望奎县', '231221');
INSERT INTO `kl_area` VALUES ('1023', '243', null, '梅里斯达斡尔族区', '230208');
INSERT INTO `kl_area` VALUES ('1024', '243', null, '龙江县', '230221');
INSERT INTO `kl_area` VALUES ('1025', '268', null, '兰西县', '231222');
INSERT INTO `kl_area` VALUES ('1026', '243', null, '依安县', '230223');
INSERT INTO `kl_area` VALUES ('1027', '268', null, '青冈县', '231223');
INSERT INTO `kl_area` VALUES ('1028', '243', null, '泰来县', '230224');
INSERT INTO `kl_area` VALUES ('1029', '243', null, '甘南县', '230225');
INSERT INTO `kl_area` VALUES ('1030', '268', null, '庆安县', '231224');
INSERT INTO `kl_area` VALUES ('1031', '243', null, '富裕县', '230227');
INSERT INTO `kl_area` VALUES ('1032', '268', null, '明水县', '231225');
INSERT INTO `kl_area` VALUES ('1033', '243', null, '克山县', '230229');
INSERT INTO `kl_area` VALUES ('1034', '268', null, '绥棱县', '231226');
INSERT INTO `kl_area` VALUES ('1035', '243', null, '克东县', '230230');
INSERT INTO `kl_area` VALUES ('1036', '268', null, '安达市', '231281');
INSERT INTO `kl_area` VALUES ('1037', '243', null, '拜泉县', '230231');
INSERT INTO `kl_area` VALUES ('1038', '268', null, '肇东市', '231282');
INSERT INTO `kl_area` VALUES ('1039', '243', null, '讷河市', '230281');
INSERT INTO `kl_area` VALUES ('1040', '268', null, '海伦市', '231283');
INSERT INTO `kl_area` VALUES ('1041', '217', null, '市辖区', '220301');
INSERT INTO `kl_area` VALUES ('1042', '217', null, '铁西区', '220302');
INSERT INTO `kl_area` VALUES ('1043', '217', null, '铁东区', '220303');
INSERT INTO `kl_area` VALUES ('1044', '217', null, '梨树县', '220322');
INSERT INTO `kl_area` VALUES ('1045', '217', null, '伊通满族自治县', '220323');
INSERT INTO `kl_area` VALUES ('1046', '217', null, '公主岭市', '220381');
INSERT INTO `kl_area` VALUES ('1047', '217', null, '双辽市', '220382');
INSERT INTO `kl_area` VALUES ('1048', '245', null, '市辖区', '230301');
INSERT INTO `kl_area` VALUES ('1049', '245', null, '鸡冠区', '230302');
INSERT INTO `kl_area` VALUES ('1050', '270', null, '呼玛县', '232721');
INSERT INTO `kl_area` VALUES ('1051', '245', null, '恒山区', '230303');
INSERT INTO `kl_area` VALUES ('1052', '270', null, '塔河县', '232722');
INSERT INTO `kl_area` VALUES ('1053', '245', null, '滴道区', '230304');
INSERT INTO `kl_area` VALUES ('1054', '270', null, '漠河县', '232723');
INSERT INTO `kl_area` VALUES ('1055', '245', null, '梨树区', '230305');
INSERT INTO `kl_area` VALUES ('1056', '245', null, '城子河区', '230306');
INSERT INTO `kl_area` VALUES ('1057', '245', null, '麻山区', '230307');
INSERT INTO `kl_area` VALUES ('1058', '245', null, '鸡东县', '230321');
INSERT INTO `kl_area` VALUES ('1059', '219', null, '市辖区', '220401');
INSERT INTO `kl_area` VALUES ('1060', '245', null, '虎林市', '230381');
INSERT INTO `kl_area` VALUES ('1061', '219', null, '龙山区', '220402');
INSERT INTO `kl_area` VALUES ('1062', '245', null, '密山市', '230382');
INSERT INTO `kl_area` VALUES ('1063', '219', null, '西安区', '220403');
INSERT INTO `kl_area` VALUES ('1064', '219', null, '东丰县', '220421');
INSERT INTO `kl_area` VALUES ('1065', '219', null, '东辽县', '220422');
INSERT INTO `kl_area` VALUES ('1066', '284', null, '黄浦区', '310101');
INSERT INTO `kl_area` VALUES ('1067', '284', null, '徐汇区', '310104');
INSERT INTO `kl_area` VALUES ('1068', '284', null, '长宁区', '310105');
INSERT INTO `kl_area` VALUES ('1069', '284', null, '静安区', '310106');
INSERT INTO `kl_area` VALUES ('1070', '284', null, '普陀区', '310107');
INSERT INTO `kl_area` VALUES ('1071', '284', null, '闸北区', '310108');
INSERT INTO `kl_area` VALUES ('1072', '284', null, '虹口区', '310109');
INSERT INTO `kl_area` VALUES ('1073', '284', null, '杨浦区', '310110');
INSERT INTO `kl_area` VALUES ('1074', '284', null, '闵行区', '310112');
INSERT INTO `kl_area` VALUES ('1075', '248', null, '市辖区', '230401');
INSERT INTO `kl_area` VALUES ('1076', '284', null, '宝山区', '310113');
INSERT INTO `kl_area` VALUES ('1077', '221', null, '市辖区', '220501');
INSERT INTO `kl_area` VALUES ('1078', '248', null, '向阳区', '230402');
INSERT INTO `kl_area` VALUES ('1079', '221', null, '东昌区', '220502');
INSERT INTO `kl_area` VALUES ('1080', '284', null, '嘉定区', '310114');
INSERT INTO `kl_area` VALUES ('1081', '248', null, '工农区', '230403');
INSERT INTO `kl_area` VALUES ('1082', '221', null, '二道江区', '220503');
INSERT INTO `kl_area` VALUES ('1083', '284', null, '浦东新区', '310115');
INSERT INTO `kl_area` VALUES ('1084', '248', null, '南山区', '230404');
INSERT INTO `kl_area` VALUES ('1085', '284', null, '金山区', '310116');
INSERT INTO `kl_area` VALUES ('1086', '221', null, '通化县', '220521');
INSERT INTO `kl_area` VALUES ('1087', '248', null, '兴安区', '230405');
INSERT INTO `kl_area` VALUES ('1088', '221', null, '辉南县', '220523');
INSERT INTO `kl_area` VALUES ('1089', '284', null, '松江区', '310117');
INSERT INTO `kl_area` VALUES ('1090', '248', null, '东山区', '230406');
INSERT INTO `kl_area` VALUES ('1091', '284', null, '青浦区', '310118');
INSERT INTO `kl_area` VALUES ('1092', '221', null, '柳河县', '220524');
INSERT INTO `kl_area` VALUES ('1093', '248', null, '兴山区', '230407');
INSERT INTO `kl_area` VALUES ('1094', '221', null, '梅河口市', '220581');
INSERT INTO `kl_area` VALUES ('1095', '284', null, '奉贤区', '310120');
INSERT INTO `kl_area` VALUES ('1096', '248', null, '萝北县', '230421');
INSERT INTO `kl_area` VALUES ('1097', '221', null, '集安市', '220582');
INSERT INTO `kl_area` VALUES ('1098', '248', null, '绥滨县', '230422');
INSERT INTO `kl_area` VALUES ('1099', '287', null, '崇明县', '310230');
INSERT INTO `kl_area` VALUES ('1100', '223', null, '市辖区', '220601');
INSERT INTO `kl_area` VALUES ('1101', '251', null, '市辖区', '230501');
INSERT INTO `kl_area` VALUES ('1102', '223', null, '浑江区', '220602');
INSERT INTO `kl_area` VALUES ('1103', '251', null, '尖山区', '230502');
INSERT INTO `kl_area` VALUES ('1104', '223', null, '江源区', '220605');
INSERT INTO `kl_area` VALUES ('1105', '251', null, '岭东区', '230503');
INSERT INTO `kl_area` VALUES ('1106', '223', null, '抚松县', '220621');
INSERT INTO `kl_area` VALUES ('1107', '251', null, '四方台区', '230505');
INSERT INTO `kl_area` VALUES ('1108', '223', null, '靖宇县', '220622');
INSERT INTO `kl_area` VALUES ('1109', '251', null, '宝山区', '230506');
INSERT INTO `kl_area` VALUES ('1110', '223', null, '长白朝鲜族自治县', '220623');
INSERT INTO `kl_area` VALUES ('1111', '251', null, '集贤县', '230521');
INSERT INTO `kl_area` VALUES ('1112', '223', null, '临江市', '220681');
INSERT INTO `kl_area` VALUES ('1113', '251', null, '友谊县', '230522');
INSERT INTO `kl_area` VALUES ('1114', '251', null, '宝清县', '230523');
INSERT INTO `kl_area` VALUES ('1115', '251', null, '饶河县', '230524');
INSERT INTO `kl_area` VALUES ('1116', '301', null, '市辖区', '320101');
INSERT INTO `kl_area` VALUES ('1117', '301', null, '玄武区', '320102');
INSERT INTO `kl_area` VALUES ('1118', '301', null, '秦淮区', '320104');
INSERT INTO `kl_area` VALUES ('1119', '301', null, '建邺区', '320105');
INSERT INTO `kl_area` VALUES ('1120', '301', null, '鼓楼区', '320106');
INSERT INTO `kl_area` VALUES ('1121', '301', null, '浦口区', '320111');
INSERT INTO `kl_area` VALUES ('1122', '301', null, '栖霞区', '320113');
INSERT INTO `kl_area` VALUES ('1123', '301', null, '雨花台区', '320114');
INSERT INTO `kl_area` VALUES ('1124', '301', null, '江宁区', '320115');
INSERT INTO `kl_area` VALUES ('1125', '301', null, '六合区', '320116');
INSERT INTO `kl_area` VALUES ('1126', '301', null, '溧水区', '320117');
INSERT INTO `kl_area` VALUES ('1127', '301', null, '高淳区', '320118');
INSERT INTO `kl_area` VALUES ('1128', '225', null, '市辖区', '220701');
INSERT INTO `kl_area` VALUES ('1129', '225', null, '宁江区', '220702');
INSERT INTO `kl_area` VALUES ('1130', '225', null, '前郭尔罗斯蒙古族自治县', '220721');
INSERT INTO `kl_area` VALUES ('1131', '254', null, '市辖区', '230601');
INSERT INTO `kl_area` VALUES ('1132', '225', null, '长岭县', '220722');
INSERT INTO `kl_area` VALUES ('1133', '254', null, '萨尔图区', '230602');
INSERT INTO `kl_area` VALUES ('1134', '225', null, '乾安县', '220723');
INSERT INTO `kl_area` VALUES ('1135', '254', null, '龙凤区', '230603');
INSERT INTO `kl_area` VALUES ('1136', '225', null, '扶余市', '220781');
INSERT INTO `kl_area` VALUES ('1137', '254', null, '让胡路区', '230604');
INSERT INTO `kl_area` VALUES ('1138', '254', null, '红岗区', '230605');
INSERT INTO `kl_area` VALUES ('1139', '254', null, '大同区', '230606');
INSERT INTO `kl_area` VALUES ('1140', '254', null, '肇州县', '230621');
INSERT INTO `kl_area` VALUES ('1141', '254', null, '肇源县', '230622');
INSERT INTO `kl_area` VALUES ('1142', '254', null, '林甸县', '230623');
INSERT INTO `kl_area` VALUES ('1143', '254', null, '杜尔伯特蒙古族自治县', '230624');
INSERT INTO `kl_area` VALUES ('1144', '303', null, '市辖区', '320201');
INSERT INTO `kl_area` VALUES ('1145', '303', null, '崇安区', '320202');
INSERT INTO `kl_area` VALUES ('1146', '303', null, '南长区', '320203');
INSERT INTO `kl_area` VALUES ('1147', '303', null, '北塘区', '320204');
INSERT INTO `kl_area` VALUES ('1148', '303', null, '锡山区', '320205');
INSERT INTO `kl_area` VALUES ('1149', '303', null, '惠山区', '320206');
INSERT INTO `kl_area` VALUES ('1150', '303', null, '滨湖区', '320211');
INSERT INTO `kl_area` VALUES ('1151', '303', null, '江阴市', '320281');
INSERT INTO `kl_area` VALUES ('1152', '303', null, '宜兴市', '320282');
INSERT INTO `kl_area` VALUES ('1153', '227', null, '市辖区', '220801');
INSERT INTO `kl_area` VALUES ('1154', '227', null, '洮北区', '220802');
INSERT INTO `kl_area` VALUES ('1155', '227', null, '镇赉县', '220821');
INSERT INTO `kl_area` VALUES ('1156', '227', null, '通榆县', '220822');
INSERT INTO `kl_area` VALUES ('1157', '227', null, '洮南市', '220881');
INSERT INTO `kl_area` VALUES ('1158', '227', null, '大安市', '220882');
INSERT INTO `kl_area` VALUES ('1159', '257', null, '市辖区', '230701');
INSERT INTO `kl_area` VALUES ('1160', '257', null, '伊春区', '230702');
INSERT INTO `kl_area` VALUES ('1161', '257', null, '南岔区', '230703');
INSERT INTO `kl_area` VALUES ('1162', '257', null, '友好区', '230704');
INSERT INTO `kl_area` VALUES ('1163', '257', null, '西林区', '230705');
INSERT INTO `kl_area` VALUES ('1164', '257', null, '翠峦区', '230706');
INSERT INTO `kl_area` VALUES ('1165', '257', null, '新青区', '230707');
INSERT INTO `kl_area` VALUES ('1166', '257', null, '美溪区', '230708');
INSERT INTO `kl_area` VALUES ('1167', '257', null, '金山屯区', '230709');
INSERT INTO `kl_area` VALUES ('1168', '257', null, '五营区', '230710');
INSERT INTO `kl_area` VALUES ('1169', '257', null, '乌马河区', '230711');
INSERT INTO `kl_area` VALUES ('1170', '257', null, '汤旺河区', '230712');
INSERT INTO `kl_area` VALUES ('1171', '257', null, '带岭区', '230713');
INSERT INTO `kl_area` VALUES ('1172', '257', null, '乌伊岭区', '230714');
INSERT INTO `kl_area` VALUES ('1173', '305', null, '市辖区', '320301');
INSERT INTO `kl_area` VALUES ('1174', '257', null, '红星区', '230715');
INSERT INTO `kl_area` VALUES ('1175', '305', null, '鼓楼区', '320302');
INSERT INTO `kl_area` VALUES ('1176', '257', null, '上甘岭区', '230716');
INSERT INTO `kl_area` VALUES ('1177', '305', null, '云龙区', '320303');
INSERT INTO `kl_area` VALUES ('1178', '257', null, '嘉荫县', '230722');
INSERT INTO `kl_area` VALUES ('1179', '305', null, '贾汪区', '320305');
INSERT INTO `kl_area` VALUES ('1180', '257', null, '铁力市', '230781');
INSERT INTO `kl_area` VALUES ('1181', '305', null, '泉山区', '320311');
INSERT INTO `kl_area` VALUES ('1182', '305', null, '铜山区', '320312');
INSERT INTO `kl_area` VALUES ('1183', '305', null, '丰县', '320321');
INSERT INTO `kl_area` VALUES ('1184', '305', null, '沛县', '320322');
INSERT INTO `kl_area` VALUES ('1185', '305', null, '睢宁县', '320324');
INSERT INTO `kl_area` VALUES ('1186', '305', null, '新沂市', '320381');
INSERT INTO `kl_area` VALUES ('1187', '305', null, '邳州市', '320382');
INSERT INTO `kl_area` VALUES ('1188', '309', null, '市辖区', '320501');
INSERT INTO `kl_area` VALUES ('1189', '309', null, '虎丘区', '320505');
INSERT INTO `kl_area` VALUES ('1190', '309', null, '吴中区', '320506');
INSERT INTO `kl_area` VALUES ('1191', '309', null, '相城区', '320507');
INSERT INTO `kl_area` VALUES ('1192', '260', null, '市辖区', '230801');
INSERT INTO `kl_area` VALUES ('1193', '309', null, '姑苏区', '320508');
INSERT INTO `kl_area` VALUES ('1194', '260', null, '向阳区', '230803');
INSERT INTO `kl_area` VALUES ('1195', '309', null, '吴江区', '320509');
INSERT INTO `kl_area` VALUES ('1196', '260', null, '前进区', '230804');
INSERT INTO `kl_area` VALUES ('1197', '309', null, '常熟市', '320581');
INSERT INTO `kl_area` VALUES ('1198', '260', null, '东风区', '230805');
INSERT INTO `kl_area` VALUES ('1199', '309', null, '张家港市', '320582');
INSERT INTO `kl_area` VALUES ('1200', '260', null, '郊区', '230811');
INSERT INTO `kl_area` VALUES ('1201', '307', null, '市辖区', '320401');
INSERT INTO `kl_area` VALUES ('1202', '309', null, '昆山市', '320583');
INSERT INTO `kl_area` VALUES ('1203', '260', null, '桦南县', '230822');
INSERT INTO `kl_area` VALUES ('1204', '307', null, '天宁区', '320402');
INSERT INTO `kl_area` VALUES ('1205', '260', null, '桦川县', '230826');
INSERT INTO `kl_area` VALUES ('1206', '309', null, '太仓市', '320585');
INSERT INTO `kl_area` VALUES ('1207', '260', null, '汤原县', '230828');
INSERT INTO `kl_area` VALUES ('1208', '307', null, '钟楼区', '320404');
INSERT INTO `kl_area` VALUES ('1209', '260', null, '抚远县', '230833');
INSERT INTO `kl_area` VALUES ('1210', '307', null, '戚墅堰区', '320405');
INSERT INTO `kl_area` VALUES ('1211', '260', null, '同江市', '230881');
INSERT INTO `kl_area` VALUES ('1212', '307', null, '新北区', '320411');
INSERT INTO `kl_area` VALUES ('1213', '260', null, '富锦市', '230882');
INSERT INTO `kl_area` VALUES ('1214', '307', null, '武进区', '320412');
INSERT INTO `kl_area` VALUES ('1215', '307', null, '溧阳市', '320481');
INSERT INTO `kl_area` VALUES ('1216', '307', null, '金坛市', '320482');
INSERT INTO `kl_area` VALUES ('1217', '311', null, '市辖区', '320601');
INSERT INTO `kl_area` VALUES ('1218', '311', null, '崇川区', '320602');
INSERT INTO `kl_area` VALUES ('1219', '311', null, '港闸区', '320611');
INSERT INTO `kl_area` VALUES ('1220', '311', null, '通州区', '320612');
INSERT INTO `kl_area` VALUES ('1221', '311', null, '海安县', '320621');
INSERT INTO `kl_area` VALUES ('1222', '311', null, '如东县', '320623');
INSERT INTO `kl_area` VALUES ('1223', '262', null, '市辖区', '230901');
INSERT INTO `kl_area` VALUES ('1224', '311', null, '启东市', '320681');
INSERT INTO `kl_area` VALUES ('1225', '262', null, '新兴区', '230902');
INSERT INTO `kl_area` VALUES ('1226', '311', null, '如皋市', '320682');
INSERT INTO `kl_area` VALUES ('1227', '262', null, '桃山区', '230903');
INSERT INTO `kl_area` VALUES ('1228', '311', null, '海门市', '320684');
INSERT INTO `kl_area` VALUES ('1229', '262', null, '茄子河区', '230904');
INSERT INTO `kl_area` VALUES ('1230', '262', null, '勃利县', '230921');
INSERT INTO `kl_area` VALUES ('1231', '35', null, '市辖区', '330201');
INSERT INTO `kl_area` VALUES ('1232', '35', null, '海曙区', '330203');
INSERT INTO `kl_area` VALUES ('1233', '35', null, '江东区', '330204');
INSERT INTO `kl_area` VALUES ('1234', '35', null, '江北区', '330205');
INSERT INTO `kl_area` VALUES ('1235', '35', null, '北仑区', '330206');
INSERT INTO `kl_area` VALUES ('1236', '35', null, '镇海区', '330211');
INSERT INTO `kl_area` VALUES ('1237', '35', null, '鄞州区', '330212');
INSERT INTO `kl_area` VALUES ('1238', '35', null, '象山县', '330225');
INSERT INTO `kl_area` VALUES ('1239', '35', null, '宁海县', '330226');
INSERT INTO `kl_area` VALUES ('1240', '313', null, '市辖区', '320701');
INSERT INTO `kl_area` VALUES ('1241', '35', null, '余姚市', '330281');
INSERT INTO `kl_area` VALUES ('1242', '313', null, '连云区', '320703');
INSERT INTO `kl_area` VALUES ('1243', '35', null, '慈溪市', '330282');
INSERT INTO `kl_area` VALUES ('1244', '313', null, '新浦区', '320705');
INSERT INTO `kl_area` VALUES ('1245', '35', null, '奉化市', '330283');
INSERT INTO `kl_area` VALUES ('1246', '313', null, '海州区', '320706');
INSERT INTO `kl_area` VALUES ('1247', '313', null, '赣榆县', '320721');
INSERT INTO `kl_area` VALUES ('1248', '313', null, '东海县', '320722');
INSERT INTO `kl_area` VALUES ('1249', '313', null, '灌云县', '320723');
INSERT INTO `kl_area` VALUES ('1250', '313', null, '灌南县', '320724');
INSERT INTO `kl_area` VALUES ('1251', '36', null, '市辖区', '330301');
INSERT INTO `kl_area` VALUES ('1252', '36', null, '鹿城区', '330302');
INSERT INTO `kl_area` VALUES ('1253', '36', null, '龙湾区', '330303');
INSERT INTO `kl_area` VALUES ('1254', '36', null, '瓯海区', '330304');
INSERT INTO `kl_area` VALUES ('1255', '36', null, '洞头县', '330322');
INSERT INTO `kl_area` VALUES ('1256', '315', null, '市辖区', '320801');
INSERT INTO `kl_area` VALUES ('1257', '36', null, '永嘉县', '330324');
INSERT INTO `kl_area` VALUES ('1258', '315', null, '清河区', '320802');
INSERT INTO `kl_area` VALUES ('1259', '36', null, '平阳县', '330326');
INSERT INTO `kl_area` VALUES ('1260', '315', null, '淮安区', '320803');
INSERT INTO `kl_area` VALUES ('1261', '36', null, '苍南县', '330327');
INSERT INTO `kl_area` VALUES ('1262', '315', null, '淮阴区', '320804');
INSERT INTO `kl_area` VALUES ('1263', '36', null, '文成县', '330328');
INSERT INTO `kl_area` VALUES ('1264', '315', null, '清浦区', '320811');
INSERT INTO `kl_area` VALUES ('1265', '36', null, '泰顺县', '330329');
INSERT INTO `kl_area` VALUES ('1266', '315', null, '涟水县', '320826');
INSERT INTO `kl_area` VALUES ('1267', '36', null, '瑞安市', '330381');
INSERT INTO `kl_area` VALUES ('1268', '315', null, '洪泽县', '320829');
INSERT INTO `kl_area` VALUES ('1269', '36', null, '乐清市', '330382');
INSERT INTO `kl_area` VALUES ('1270', '315', null, '盱眙县', '320830');
INSERT INTO `kl_area` VALUES ('1271', '315', null, '金湖县', '320831');
INSERT INTO `kl_area` VALUES ('1272', '37', null, '市辖区', '330401');
INSERT INTO `kl_area` VALUES ('1273', '37', null, '南湖区', '330402');
INSERT INTO `kl_area` VALUES ('1274', '37', null, '秀洲区', '330411');
INSERT INTO `kl_area` VALUES ('1275', '319', null, '市辖区', '320901');
INSERT INTO `kl_area` VALUES ('1276', '37', null, '嘉善县', '330421');
INSERT INTO `kl_area` VALUES ('1277', '319', null, '亭湖区', '320902');
INSERT INTO `kl_area` VALUES ('1278', '37', null, '海盐县', '330424');
INSERT INTO `kl_area` VALUES ('1279', '319', null, '盐都区', '320903');
INSERT INTO `kl_area` VALUES ('1280', '37', null, '海宁市', '330481');
INSERT INTO `kl_area` VALUES ('1281', '319', null, '响水县', '320921');
INSERT INTO `kl_area` VALUES ('1282', '37', null, '平湖市', '330482');
INSERT INTO `kl_area` VALUES ('1283', '319', null, '滨海县', '320922');
INSERT INTO `kl_area` VALUES ('1284', '37', null, '桐乡市', '330483');
INSERT INTO `kl_area` VALUES ('1285', '319', null, '阜宁县', '320923');
INSERT INTO `kl_area` VALUES ('1286', '319', null, '射阳县', '320924');
INSERT INTO `kl_area` VALUES ('1287', '319', null, '建湖县', '320925');
INSERT INTO `kl_area` VALUES ('1288', '319', null, '东台市', '320981');
INSERT INTO `kl_area` VALUES ('1289', '319', null, '大丰市', '320982');
INSERT INTO `kl_area` VALUES ('1290', '38', null, '市辖区', '330501');
INSERT INTO `kl_area` VALUES ('1291', '38', null, '吴兴区', '330502');
INSERT INTO `kl_area` VALUES ('1292', '38', null, '南浔区', '330503');
INSERT INTO `kl_area` VALUES ('1293', '38', null, '德清县', '330521');
INSERT INTO `kl_area` VALUES ('1294', '322', null, '市辖区', '321001');
INSERT INTO `kl_area` VALUES ('1295', '38', null, '长兴县', '330522');
INSERT INTO `kl_area` VALUES ('1296', '322', null, '广陵区', '321002');
INSERT INTO `kl_area` VALUES ('1297', '38', null, '安吉县', '330523');
INSERT INTO `kl_area` VALUES ('1298', '322', null, '邗江区', '321003');
INSERT INTO `kl_area` VALUES ('1299', '322', null, '江都区', '321012');
INSERT INTO `kl_area` VALUES ('1300', '322', null, '宝应县', '321023');
INSERT INTO `kl_area` VALUES ('1301', '322', null, '仪征市', '321081');
INSERT INTO `kl_area` VALUES ('1302', '322', null, '高邮市', '321084');
INSERT INTO `kl_area` VALUES ('1303', '39', null, '市辖区', '330601');
INSERT INTO `kl_area` VALUES ('1304', '39', null, '越城区', '330602');
INSERT INTO `kl_area` VALUES ('1305', '39', null, '绍兴县', '330621');
INSERT INTO `kl_area` VALUES ('1306', '39', null, '新昌县', '330624');
INSERT INTO `kl_area` VALUES ('1307', '39', null, '诸暨市', '330681');
INSERT INTO `kl_area` VALUES ('1308', '324', null, '市辖区', '321101');
INSERT INTO `kl_area` VALUES ('1309', '39', null, '上虞市', '330682');
INSERT INTO `kl_area` VALUES ('1310', '324', null, '京口区', '321102');
INSERT INTO `kl_area` VALUES ('1311', '39', null, '嵊州市', '330683');
INSERT INTO `kl_area` VALUES ('1312', '324', null, '润州区', '321111');
INSERT INTO `kl_area` VALUES ('1313', '324', null, '丹徒区', '321112');
INSERT INTO `kl_area` VALUES ('1314', '324', null, '丹阳市', '321181');
INSERT INTO `kl_area` VALUES ('1315', '324', null, '扬中市', '321182');
INSERT INTO `kl_area` VALUES ('1316', '324', null, '句容市', '321183');
INSERT INTO `kl_area` VALUES ('1317', '40', null, '市辖区', '330701');
INSERT INTO `kl_area` VALUES ('1318', '40', null, '婺城区', '330702');
INSERT INTO `kl_area` VALUES ('1319', '40', null, '金东区', '330703');
INSERT INTO `kl_area` VALUES ('1320', '40', null, '武义县', '330723');
INSERT INTO `kl_area` VALUES ('1321', '40', null, '浦江县', '330726');
INSERT INTO `kl_area` VALUES ('1322', '328', null, '市辖区', '321201');
INSERT INTO `kl_area` VALUES ('1323', '40', null, '磐安县', '330727');
INSERT INTO `kl_area` VALUES ('1324', '328', null, '海陵区', '321202');
INSERT INTO `kl_area` VALUES ('1325', '40', null, '兰溪市', '330781');
INSERT INTO `kl_area` VALUES ('1326', '328', null, '高港区', '321203');
INSERT INTO `kl_area` VALUES ('1327', '40', null, '义乌市', '330782');
INSERT INTO `kl_area` VALUES ('1328', '328', null, '姜堰区', '321204');
INSERT INTO `kl_area` VALUES ('1329', '40', null, '东阳市', '330783');
INSERT INTO `kl_area` VALUES ('1330', '328', null, '兴化市', '321281');
INSERT INTO `kl_area` VALUES ('1331', '40', null, '永康市', '330784');
INSERT INTO `kl_area` VALUES ('1332', '328', null, '靖江市', '321282');
INSERT INTO `kl_area` VALUES ('1333', '328', null, '泰兴市', '321283');
INSERT INTO `kl_area` VALUES ('1334', '41', null, '市辖区', '330801');
INSERT INTO `kl_area` VALUES ('1335', '41', null, '柯城区', '330802');
INSERT INTO `kl_area` VALUES ('1336', '330', null, '市辖区', '321301');
INSERT INTO `kl_area` VALUES ('1337', '41', null, '衢江区', '330803');
INSERT INTO `kl_area` VALUES ('1338', '330', null, '宿城区', '321302');
INSERT INTO `kl_area` VALUES ('1339', '41', null, '常山县', '330822');
INSERT INTO `kl_area` VALUES ('1340', '330', null, '宿豫区', '321311');
INSERT INTO `kl_area` VALUES ('1341', '41', null, '开化县', '330824');
INSERT INTO `kl_area` VALUES ('1342', '330', null, '沭阳县', '321322');
INSERT INTO `kl_area` VALUES ('1343', '41', null, '龙游县', '330825');
INSERT INTO `kl_area` VALUES ('1344', '330', null, '泗阳县', '321323');
INSERT INTO `kl_area` VALUES ('1345', '41', null, '江山市', '330881');
INSERT INTO `kl_area` VALUES ('1346', '330', null, '泗洪县', '321324');
INSERT INTO `kl_area` VALUES ('1347', '42', null, '市辖区', '330901');
INSERT INTO `kl_area` VALUES ('1348', '34', null, '市辖区', '330101');
INSERT INTO `kl_area` VALUES ('1349', '42', null, '定海区', '330902');
INSERT INTO `kl_area` VALUES ('1350', '34', null, '上城区', '330102');
INSERT INTO `kl_area` VALUES ('1351', '42', null, '普陀区', '330903');
INSERT INTO `kl_area` VALUES ('1352', '34', null, '下城区', '330103');
INSERT INTO `kl_area` VALUES ('1353', '42', null, '岱山县', '330921');
INSERT INTO `kl_area` VALUES ('1354', '34', null, '江干区', '330104');
INSERT INTO `kl_area` VALUES ('1355', '42', null, '嵊泗县', '330922');
INSERT INTO `kl_area` VALUES ('1356', '34', null, '拱墅区', '330105');
INSERT INTO `kl_area` VALUES ('1357', '34', null, '西湖区', '330106');
INSERT INTO `kl_area` VALUES ('1358', '34', null, '滨江区', '330108');
INSERT INTO `kl_area` VALUES ('1359', '34', null, '萧山区', '330109');
INSERT INTO `kl_area` VALUES ('1360', '34', null, '余杭区', '330110');
INSERT INTO `kl_area` VALUES ('1361', '34', null, '桐庐县', '330122');
INSERT INTO `kl_area` VALUES ('1362', '34', null, '淳安县', '330127');
INSERT INTO `kl_area` VALUES ('1363', '34', null, '建德市', '330182');
INSERT INTO `kl_area` VALUES ('1364', '34', null, '富阳市', '330183');
INSERT INTO `kl_area` VALUES ('1365', '34', null, '临安市', '330185');
INSERT INTO `kl_area` VALUES ('1366', '43', null, '市辖区', '331001');
INSERT INTO `kl_area` VALUES ('1367', '43', null, '椒江区', '331002');
INSERT INTO `kl_area` VALUES ('1368', '43', null, '黄岩区', '331003');
INSERT INTO `kl_area` VALUES ('1369', '43', null, '路桥区', '331004');
INSERT INTO `kl_area` VALUES ('1370', '43', null, '玉环县', '331021');
INSERT INTO `kl_area` VALUES ('1371', '43', null, '三门县', '331022');
INSERT INTO `kl_area` VALUES ('1372', '43', null, '天台县', '331023');
INSERT INTO `kl_area` VALUES ('1373', '43', null, '仙居县', '331024');
INSERT INTO `kl_area` VALUES ('1374', '43', null, '温岭市', '331081');
INSERT INTO `kl_area` VALUES ('1375', '43', null, '临海市', '331082');
INSERT INTO `kl_area` VALUES ('1376', '44', null, '市辖区', '331101');
INSERT INTO `kl_area` VALUES ('1377', '44', null, '莲都区', '331102');
INSERT INTO `kl_area` VALUES ('1378', '44', null, '青田县', '331121');
INSERT INTO `kl_area` VALUES ('1379', '44', null, '缙云县', '331122');
INSERT INTO `kl_area` VALUES ('1380', '44', null, '遂昌县', '331123');
INSERT INTO `kl_area` VALUES ('1381', '44', null, '松阳县', '331124');
INSERT INTO `kl_area` VALUES ('1382', '44', null, '云和县', '331125');
INSERT INTO `kl_area` VALUES ('1383', '44', null, '庆元县', '331126');
INSERT INTO `kl_area` VALUES ('1384', '44', null, '景宁畲族自治县', '331127');
INSERT INTO `kl_area` VALUES ('1385', '44', null, '龙泉市', '331181');
INSERT INTO `kl_area` VALUES ('1386', '51', null, '市辖区', '340101');
INSERT INTO `kl_area` VALUES ('1387', '51', null, '瑶海区', '340102');
INSERT INTO `kl_area` VALUES ('1388', '51', null, '庐阳区', '340103');
INSERT INTO `kl_area` VALUES ('1389', '51', null, '蜀山区', '340104');
INSERT INTO `kl_area` VALUES ('1390', '51', null, '包河区', '340111');
INSERT INTO `kl_area` VALUES ('1391', '51', null, '长丰县', '340121');
INSERT INTO `kl_area` VALUES ('1392', '51', null, '肥东县', '340122');
INSERT INTO `kl_area` VALUES ('1393', '51', null, '肥西县', '340123');
INSERT INTO `kl_area` VALUES ('1394', '51', null, '庐江县', '340124');
INSERT INTO `kl_area` VALUES ('1395', '51', null, '巢湖市', '340181');
INSERT INTO `kl_area` VALUES ('1396', '65', null, '市辖区', '341201');
INSERT INTO `kl_area` VALUES ('1397', '65', null, '颍州区', '341202');
INSERT INTO `kl_area` VALUES ('1398', '65', null, '颍东区', '341203');
INSERT INTO `kl_area` VALUES ('1399', '65', null, '颍泉区', '341204');
INSERT INTO `kl_area` VALUES ('1400', '65', null, '临泉县', '341221');
INSERT INTO `kl_area` VALUES ('1401', '65', null, '太和县', '341222');
INSERT INTO `kl_area` VALUES ('1402', '65', null, '阜南县', '341225');
INSERT INTO `kl_area` VALUES ('1403', '65', null, '颍上县', '341226');
INSERT INTO `kl_area` VALUES ('1404', '52', null, '市辖区', '340201');
INSERT INTO `kl_area` VALUES ('1405', '65', null, '界首市', '341282');
INSERT INTO `kl_area` VALUES ('1406', '52', null, '镜湖区', '340202');
INSERT INTO `kl_area` VALUES ('1407', '52', null, '弋江区', '340203');
INSERT INTO `kl_area` VALUES ('1408', '52', null, '鸠江区', '340207');
INSERT INTO `kl_area` VALUES ('1409', '52', null, '三山区', '340208');
INSERT INTO `kl_area` VALUES ('1410', '52', null, '芜湖县', '340221');
INSERT INTO `kl_area` VALUES ('1411', '52', null, '繁昌县', '340222');
INSERT INTO `kl_area` VALUES ('1412', '52', null, '南陵县', '340223');
INSERT INTO `kl_area` VALUES ('1413', '52', null, '无为县', '340225');
INSERT INTO `kl_area` VALUES ('1414', '89', null, '市辖区', '350501');
INSERT INTO `kl_area` VALUES ('1415', '89', null, '鲤城区', '350502');
INSERT INTO `kl_area` VALUES ('1416', '89', null, '丰泽区', '350503');
INSERT INTO `kl_area` VALUES ('1417', '89', null, '洛江区', '350504');
INSERT INTO `kl_area` VALUES ('1418', '89', null, '泉港区', '350505');
INSERT INTO `kl_area` VALUES ('1419', '89', null, '惠安县', '350521');
INSERT INTO `kl_area` VALUES ('1420', '89', null, '安溪县', '350524');
INSERT INTO `kl_area` VALUES ('1421', '89', null, '永春县', '350525');
INSERT INTO `kl_area` VALUES ('1422', '89', null, '德化县', '350526');
INSERT INTO `kl_area` VALUES ('1423', '89', null, '金门县', '350527');
INSERT INTO `kl_area` VALUES ('1424', '89', null, '石狮市', '350581');
INSERT INTO `kl_area` VALUES ('1425', '89', null, '晋江市', '350582');
INSERT INTO `kl_area` VALUES ('1426', '89', null, '南安市', '350583');
INSERT INTO `kl_area` VALUES ('1427', '67', null, '市辖区', '341301');
INSERT INTO `kl_area` VALUES ('1428', '67', null, '埇桥区', '341302');
INSERT INTO `kl_area` VALUES ('1429', '67', null, '砀山县', '341321');
INSERT INTO `kl_area` VALUES ('1430', '67', null, '萧县', '341322');
INSERT INTO `kl_area` VALUES ('1431', '67', null, '灵璧县', '341323');
INSERT INTO `kl_area` VALUES ('1432', '67', null, '泗县', '341324');
INSERT INTO `kl_area` VALUES ('1433', '53', null, '市辖区', '340301');
INSERT INTO `kl_area` VALUES ('1434', '53', null, '龙子湖区', '340302');
INSERT INTO `kl_area` VALUES ('1435', '53', null, '蚌山区', '340303');
INSERT INTO `kl_area` VALUES ('1436', '53', null, '禹会区', '340304');
INSERT INTO `kl_area` VALUES ('1437', '53', null, '淮上区', '340311');
INSERT INTO `kl_area` VALUES ('1438', '53', null, '怀远县', '340321');
INSERT INTO `kl_area` VALUES ('1439', '53', null, '五河县', '340322');
INSERT INTO `kl_area` VALUES ('1440', '53', null, '固镇县', '340323');
INSERT INTO `kl_area` VALUES ('1441', '92', null, '市辖区', '350601');
INSERT INTO `kl_area` VALUES ('1442', '92', null, '芗城区', '350602');
INSERT INTO `kl_area` VALUES ('1443', '92', null, '龙文区', '350603');
INSERT INTO `kl_area` VALUES ('1444', '92', null, '云霄县', '350622');
INSERT INTO `kl_area` VALUES ('1445', '92', null, '漳浦县', '350623');
INSERT INTO `kl_area` VALUES ('1446', '92', null, '诏安县', '350624');
INSERT INTO `kl_area` VALUES ('1447', '92', null, '长泰县', '350625');
INSERT INTO `kl_area` VALUES ('1448', '92', null, '东山县', '350626');
INSERT INTO `kl_area` VALUES ('1449', '69', null, '市辖区', '341501');
INSERT INTO `kl_area` VALUES ('1450', '92', null, '南靖县', '350627');
INSERT INTO `kl_area` VALUES ('1451', '69', null, '金安区', '341502');
INSERT INTO `kl_area` VALUES ('1452', '92', null, '平和县', '350628');
INSERT INTO `kl_area` VALUES ('1453', '69', null, '裕安区', '341503');
INSERT INTO `kl_area` VALUES ('1454', '92', null, '华安县', '350629');
INSERT INTO `kl_area` VALUES ('1455', '69', null, '寿县', '341521');
INSERT INTO `kl_area` VALUES ('1456', '92', null, '龙海市', '350681');
INSERT INTO `kl_area` VALUES ('1457', '69', null, '霍邱县', '341522');
INSERT INTO `kl_area` VALUES ('1458', '69', null, '舒城县', '341523');
INSERT INTO `kl_area` VALUES ('1459', '69', null, '金寨县', '341524');
INSERT INTO `kl_area` VALUES ('1460', '54', null, '市辖区', '340401');
INSERT INTO `kl_area` VALUES ('1461', '69', null, '霍山县', '341525');
INSERT INTO `kl_area` VALUES ('1462', '54', null, '大通区', '340402');
INSERT INTO `kl_area` VALUES ('1463', '54', null, '田家庵区', '340403');
INSERT INTO `kl_area` VALUES ('1464', '54', null, '谢家集区', '340404');
INSERT INTO `kl_area` VALUES ('1465', '54', null, '八公山区', '340405');
INSERT INTO `kl_area` VALUES ('1466', '54', null, '潘集区', '340406');
INSERT INTO `kl_area` VALUES ('1467', '54', null, '凤台县', '340421');
INSERT INTO `kl_area` VALUES ('1468', '95', null, '市辖区', '350701');
INSERT INTO `kl_area` VALUES ('1469', '95', null, '延平区', '350702');
INSERT INTO `kl_area` VALUES ('1470', '95', null, '顺昌县', '350721');
INSERT INTO `kl_area` VALUES ('1471', '95', null, '浦城县', '350722');
INSERT INTO `kl_area` VALUES ('1472', '71', null, '市辖区', '341601');
INSERT INTO `kl_area` VALUES ('1473', '95', null, '光泽县', '350723');
INSERT INTO `kl_area` VALUES ('1474', '71', null, '谯城区', '341602');
INSERT INTO `kl_area` VALUES ('1475', '95', null, '松溪县', '350724');
INSERT INTO `kl_area` VALUES ('1476', '71', null, '涡阳县', '341621');
INSERT INTO `kl_area` VALUES ('1477', '95', null, '政和县', '350725');
INSERT INTO `kl_area` VALUES ('1478', '71', null, '蒙城县', '341622');
INSERT INTO `kl_area` VALUES ('1479', '95', null, '邵武市', '350781');
INSERT INTO `kl_area` VALUES ('1480', '71', null, '利辛县', '341623');
INSERT INTO `kl_area` VALUES ('1481', '95', null, '武夷山市', '350782');
INSERT INTO `kl_area` VALUES ('1482', '95', null, '建瓯市', '350783');
INSERT INTO `kl_area` VALUES ('1483', '55', null, '市辖区', '340501');
INSERT INTO `kl_area` VALUES ('1484', '95', null, '建阳市', '350784');
INSERT INTO `kl_area` VALUES ('1485', '55', null, '花山区', '340503');
INSERT INTO `kl_area` VALUES ('1486', '55', null, '雨山区', '340504');
INSERT INTO `kl_area` VALUES ('1487', '55', null, '博望区', '340506');
INSERT INTO `kl_area` VALUES ('1488', '55', null, '当涂县', '340521');
INSERT INTO `kl_area` VALUES ('1489', '55', null, '含山县', '340522');
INSERT INTO `kl_area` VALUES ('1490', '55', null, '和县', '340523');
INSERT INTO `kl_area` VALUES ('1491', '73', null, '市辖区', '341701');
INSERT INTO `kl_area` VALUES ('1492', '73', null, '贵池区', '341702');
INSERT INTO `kl_area` VALUES ('1493', '73', null, '东至县', '341721');
INSERT INTO `kl_area` VALUES ('1494', '73', null, '石台县', '341722');
INSERT INTO `kl_area` VALUES ('1495', '98', null, '市辖区', '350801');
INSERT INTO `kl_area` VALUES ('1496', '73', null, '青阳县', '341723');
INSERT INTO `kl_area` VALUES ('1497', '98', null, '新罗区', '350802');
INSERT INTO `kl_area` VALUES ('1498', '98', null, '长汀县', '350821');
INSERT INTO `kl_area` VALUES ('1499', '98', null, '永定县', '350822');
INSERT INTO `kl_area` VALUES ('1500', '98', null, '上杭县', '350823');
INSERT INTO `kl_area` VALUES ('1501', '56', null, '市辖区', '340601');
INSERT INTO `kl_area` VALUES ('1502', '98', null, '武平县', '350824');
INSERT INTO `kl_area` VALUES ('1503', '56', null, '杜集区', '340602');
INSERT INTO `kl_area` VALUES ('1504', '98', null, '连城县', '350825');
INSERT INTO `kl_area` VALUES ('1505', '56', null, '相山区', '340603');
INSERT INTO `kl_area` VALUES ('1506', '98', null, '漳平市', '350881');
INSERT INTO `kl_area` VALUES ('1507', '56', null, '烈山区', '340604');
INSERT INTO `kl_area` VALUES ('1508', '56', null, '濉溪县', '340621');
INSERT INTO `kl_area` VALUES ('1509', '75', null, '市辖区', '341801');
INSERT INTO `kl_area` VALUES ('1510', '75', null, '宣州区', '341802');
INSERT INTO `kl_area` VALUES ('1511', '75', null, '郎溪县', '341821');
INSERT INTO `kl_area` VALUES ('1512', '75', null, '广德县', '341822');
INSERT INTO `kl_area` VALUES ('1513', '75', null, '泾县', '341823');
INSERT INTO `kl_area` VALUES ('1514', '75', null, '绩溪县', '341824');
INSERT INTO `kl_area` VALUES ('1515', '75', null, '旌德县', '341825');
INSERT INTO `kl_area` VALUES ('1516', '75', null, '宁国市', '341881');
INSERT INTO `kl_area` VALUES ('1517', '101', null, '市辖区', '350901');
INSERT INTO `kl_area` VALUES ('1518', '101', null, '蕉城区', '350902');
INSERT INTO `kl_area` VALUES ('1519', '57', null, '市辖区', '340701');
INSERT INTO `kl_area` VALUES ('1520', '101', null, '霞浦县', '350921');
INSERT INTO `kl_area` VALUES ('1521', '57', null, '铜官山区', '340702');
INSERT INTO `kl_area` VALUES ('1522', '101', null, '古田县', '350922');
INSERT INTO `kl_area` VALUES ('1523', '57', null, '狮子山区', '340703');
INSERT INTO `kl_area` VALUES ('1524', '101', null, '屏南县', '350923');
INSERT INTO `kl_area` VALUES ('1525', '57', null, '郊区', '340711');
INSERT INTO `kl_area` VALUES ('1526', '101', null, '寿宁县', '350924');
INSERT INTO `kl_area` VALUES ('1527', '57', null, '铜陵县', '340721');
INSERT INTO `kl_area` VALUES ('1528', '101', null, '周宁县', '350925');
INSERT INTO `kl_area` VALUES ('1529', '101', null, '柘荣县', '350926');
INSERT INTO `kl_area` VALUES ('1530', '101', null, '福安市', '350981');
INSERT INTO `kl_area` VALUES ('1531', '101', null, '福鼎市', '350982');
INSERT INTO `kl_area` VALUES ('1532', '80', null, '市辖区', '350101');
INSERT INTO `kl_area` VALUES ('1533', '80', null, '鼓楼区', '350102');
INSERT INTO `kl_area` VALUES ('1534', '80', null, '台江区', '350103');
INSERT INTO `kl_area` VALUES ('1535', '80', null, '仓山区', '350104');
INSERT INTO `kl_area` VALUES ('1536', '80', null, '马尾区', '350105');
INSERT INTO `kl_area` VALUES ('1537', '80', null, '晋安区', '350111');
INSERT INTO `kl_area` VALUES ('1538', '80', null, '闽侯县', '350121');
INSERT INTO `kl_area` VALUES ('1539', '80', null, '连江县', '350122');
INSERT INTO `kl_area` VALUES ('1540', '80', null, '罗源县', '350123');
INSERT INTO `kl_area` VALUES ('1541', '80', null, '闽清县', '350124');
INSERT INTO `kl_area` VALUES ('1542', '80', null, '永泰县', '350125');
INSERT INTO `kl_area` VALUES ('1543', '80', null, '平潭县', '350128');
INSERT INTO `kl_area` VALUES ('1544', '59', null, '市辖区', '340801');
INSERT INTO `kl_area` VALUES ('1545', '80', null, '福清市', '350181');
INSERT INTO `kl_area` VALUES ('1546', '59', null, '迎江区', '340802');
INSERT INTO `kl_area` VALUES ('1547', '80', null, '长乐市', '350182');
INSERT INTO `kl_area` VALUES ('1548', '59', null, '大观区', '340803');
INSERT INTO `kl_area` VALUES ('1549', '121', null, '市辖区', '360101');
INSERT INTO `kl_area` VALUES ('1550', '121', null, '东湖区', '360102');
INSERT INTO `kl_area` VALUES ('1551', '59', null, '宜秀区', '340811');
INSERT INTO `kl_area` VALUES ('1552', '121', null, '西湖区', '360103');
INSERT INTO `kl_area` VALUES ('1553', '59', null, '怀宁县', '340822');
INSERT INTO `kl_area` VALUES ('1554', '121', null, '青云谱区', '360104');
INSERT INTO `kl_area` VALUES ('1555', '59', null, '枞阳县', '340823');
INSERT INTO `kl_area` VALUES ('1556', '121', null, '湾里区', '360105');
INSERT INTO `kl_area` VALUES ('1557', '59', null, '潜山县', '340824');
INSERT INTO `kl_area` VALUES ('1558', '121', null, '青山湖区', '360111');
INSERT INTO `kl_area` VALUES ('1559', '59', null, '太湖县', '340825');
INSERT INTO `kl_area` VALUES ('1560', '121', null, '南昌县', '360121');
INSERT INTO `kl_area` VALUES ('1561', '59', null, '宿松县', '340826');
INSERT INTO `kl_area` VALUES ('1562', '121', null, '新建县', '360122');
INSERT INTO `kl_area` VALUES ('1563', '59', null, '望江县', '340827');
INSERT INTO `kl_area` VALUES ('1564', '121', null, '安义县', '360123');
INSERT INTO `kl_area` VALUES ('1565', '59', null, '岳西县', '340828');
INSERT INTO `kl_area` VALUES ('1566', '121', null, '进贤县', '360124');
INSERT INTO `kl_area` VALUES ('1567', '59', null, '桐城市', '340881');
INSERT INTO `kl_area` VALUES ('1568', '81', null, '市辖区', '350201');
INSERT INTO `kl_area` VALUES ('1569', '81', null, '思明区', '350203');
INSERT INTO `kl_area` VALUES ('1570', '81', null, '海沧区', '350205');
INSERT INTO `kl_area` VALUES ('1571', '81', null, '湖里区', '350206');
INSERT INTO `kl_area` VALUES ('1572', '81', null, '集美区', '350211');
INSERT INTO `kl_area` VALUES ('1573', '81', null, '同安区', '350212');
INSERT INTO `kl_area` VALUES ('1574', '81', null, '翔安区', '350213');
INSERT INTO `kl_area` VALUES ('1575', '122', null, '市辖区', '360201');
INSERT INTO `kl_area` VALUES ('1576', '61', null, '市辖区', '341001');
INSERT INTO `kl_area` VALUES ('1577', '122', null, '昌江区', '360202');
INSERT INTO `kl_area` VALUES ('1578', '61', null, '屯溪区', '341002');
INSERT INTO `kl_area` VALUES ('1579', '122', null, '珠山区', '360203');
INSERT INTO `kl_area` VALUES ('1580', '61', null, '黄山区', '341003');
INSERT INTO `kl_area` VALUES ('1581', '122', null, '浮梁县', '360222');
INSERT INTO `kl_area` VALUES ('1582', '61', null, '徽州区', '341004');
INSERT INTO `kl_area` VALUES ('1583', '122', null, '乐平市', '360281');
INSERT INTO `kl_area` VALUES ('1584', '61', null, '歙县', '341021');
INSERT INTO `kl_area` VALUES ('1585', '61', null, '休宁县', '341022');
INSERT INTO `kl_area` VALUES ('1586', '83', null, '市辖区', '350301');
INSERT INTO `kl_area` VALUES ('1587', '61', null, '黟县', '341023');
INSERT INTO `kl_area` VALUES ('1588', '83', null, '城厢区', '350302');
INSERT INTO `kl_area` VALUES ('1589', '61', null, '祁门县', '341024');
INSERT INTO `kl_area` VALUES ('1590', '83', null, '涵江区', '350303');
INSERT INTO `kl_area` VALUES ('1591', '83', null, '荔城区', '350304');
INSERT INTO `kl_area` VALUES ('1592', '83', null, '秀屿区', '350305');
INSERT INTO `kl_area` VALUES ('1593', '83', null, '仙游县', '350322');
INSERT INTO `kl_area` VALUES ('1594', '123', null, '市辖区', '360301');
INSERT INTO `kl_area` VALUES ('1595', '123', null, '安源区', '360302');
INSERT INTO `kl_area` VALUES ('1596', '123', null, '湘东区', '360313');
INSERT INTO `kl_area` VALUES ('1597', '123', null, '莲花县', '360321');
INSERT INTO `kl_area` VALUES ('1598', '123', null, '上栗县', '360322');
INSERT INTO `kl_area` VALUES ('1599', '123', null, '芦溪县', '360323');
INSERT INTO `kl_area` VALUES ('1600', '63', null, '市辖区', '341101');
INSERT INTO `kl_area` VALUES ('1601', '63', null, '琅琊区', '341102');
INSERT INTO `kl_area` VALUES ('1602', '63', null, '南谯区', '341103');
INSERT INTO `kl_area` VALUES ('1603', '63', null, '来安县', '341122');
INSERT INTO `kl_area` VALUES ('1604', '86', null, '市辖区', '350401');
INSERT INTO `kl_area` VALUES ('1605', '63', null, '全椒县', '341124');
INSERT INTO `kl_area` VALUES ('1606', '86', null, '梅列区', '350402');
INSERT INTO `kl_area` VALUES ('1607', '63', null, '定远县', '341125');
INSERT INTO `kl_area` VALUES ('1608', '86', null, '三元区', '350403');
INSERT INTO `kl_area` VALUES ('1609', '63', null, '凤阳县', '341126');
INSERT INTO `kl_area` VALUES ('1610', '86', null, '明溪县', '350421');
INSERT INTO `kl_area` VALUES ('1611', '63', null, '天长市', '341181');
INSERT INTO `kl_area` VALUES ('1612', '86', null, '清流县', '350423');
INSERT INTO `kl_area` VALUES ('1613', '63', null, '明光市', '341182');
INSERT INTO `kl_area` VALUES ('1614', '86', null, '宁化县', '350424');
INSERT INTO `kl_area` VALUES ('1615', '86', null, '大田县', '350425');
INSERT INTO `kl_area` VALUES ('1616', '86', null, '尤溪县', '350426');
INSERT INTO `kl_area` VALUES ('1617', '86', null, '沙县', '350427');
INSERT INTO `kl_area` VALUES ('1618', '86', null, '将乐县', '350428');
INSERT INTO `kl_area` VALUES ('1619', '86', null, '泰宁县', '350429');
INSERT INTO `kl_area` VALUES ('1620', '124', null, '市辖区', '360401');
INSERT INTO `kl_area` VALUES ('1621', '86', null, '建宁县', '350430');
INSERT INTO `kl_area` VALUES ('1622', '124', null, '庐山区', '360402');
INSERT INTO `kl_area` VALUES ('1623', '86', null, '永安市', '350481');
INSERT INTO `kl_area` VALUES ('1624', '124', null, '浔阳区', '360403');
INSERT INTO `kl_area` VALUES ('1625', '124', null, '九江县', '360421');
INSERT INTO `kl_area` VALUES ('1626', '124', null, '武宁县', '360423');
INSERT INTO `kl_area` VALUES ('1627', '124', null, '修水县', '360424');
INSERT INTO `kl_area` VALUES ('1628', '124', null, '永修县', '360425');
INSERT INTO `kl_area` VALUES ('1629', '124', null, '德安县', '360426');
INSERT INTO `kl_area` VALUES ('1630', '124', null, '星子县', '360427');
INSERT INTO `kl_area` VALUES ('1631', '124', null, '都昌县', '360428');
INSERT INTO `kl_area` VALUES ('1632', '124', null, '湖口县', '360429');
INSERT INTO `kl_area` VALUES ('1633', '124', null, '彭泽县', '360430');
INSERT INTO `kl_area` VALUES ('1634', '124', null, '瑞昌市', '360481');
INSERT INTO `kl_area` VALUES ('1635', '124', null, '共青城市', '360482');
INSERT INTO `kl_area` VALUES ('1636', '126', null, '市辖区', '360601');
INSERT INTO `kl_area` VALUES ('1637', '126', null, '月湖区', '360602');
INSERT INTO `kl_area` VALUES ('1638', '126', null, '余江县', '360622');
INSERT INTO `kl_area` VALUES ('1639', '126', null, '贵溪市', '360681');
INSERT INTO `kl_area` VALUES ('1640', '125', null, '市辖区', '360501');
INSERT INTO `kl_area` VALUES ('1641', '157', null, '市辖区', '370501');
INSERT INTO `kl_area` VALUES ('1642', '125', null, '渝水区', '360502');
INSERT INTO `kl_area` VALUES ('1643', '157', null, '东营区', '370502');
INSERT INTO `kl_area` VALUES ('1644', '127', null, '市辖区', '360701');
INSERT INTO `kl_area` VALUES ('1645', '125', null, '分宜县', '360521');
INSERT INTO `kl_area` VALUES ('1646', '127', null, '章贡区', '360702');
INSERT INTO `kl_area` VALUES ('1647', '157', null, '河口区', '370503');
INSERT INTO `kl_area` VALUES ('1648', '157', null, '垦利县', '370521');
INSERT INTO `kl_area` VALUES ('1649', '127', null, '赣县', '360721');
INSERT INTO `kl_area` VALUES ('1650', '157', null, '利津县', '370522');
INSERT INTO `kl_area` VALUES ('1651', '127', null, '信丰县', '360722');
INSERT INTO `kl_area` VALUES ('1652', '157', null, '广饶县', '370523');
INSERT INTO `kl_area` VALUES ('1653', '127', null, '大余县', '360723');
INSERT INTO `kl_area` VALUES ('1654', '127', null, '上犹县', '360724');
INSERT INTO `kl_area` VALUES ('1655', '127', null, '崇义县', '360725');
INSERT INTO `kl_area` VALUES ('1656', '127', null, '安远县', '360726');
INSERT INTO `kl_area` VALUES ('1657', '127', null, '龙南县', '360727');
INSERT INTO `kl_area` VALUES ('1658', '127', null, '定南县', '360728');
INSERT INTO `kl_area` VALUES ('1659', '127', null, '全南县', '360729');
INSERT INTO `kl_area` VALUES ('1660', '127', null, '宁都县', '360730');
INSERT INTO `kl_area` VALUES ('1661', '127', null, '于都县', '360731');
INSERT INTO `kl_area` VALUES ('1662', '127', null, '兴国县', '360732');
INSERT INTO `kl_area` VALUES ('1663', '127', null, '会昌县', '360733');
INSERT INTO `kl_area` VALUES ('1664', '127', null, '寻乌县', '360734');
INSERT INTO `kl_area` VALUES ('1665', '127', null, '石城县', '360735');
INSERT INTO `kl_area` VALUES ('1666', '127', null, '瑞金市', '360781');
INSERT INTO `kl_area` VALUES ('1667', '127', null, '南康市', '360782');
INSERT INTO `kl_area` VALUES ('1668', '158', null, '市辖区', '370601');
INSERT INTO `kl_area` VALUES ('1669', '158', null, '芝罘区', '370602');
INSERT INTO `kl_area` VALUES ('1670', '158', null, '福山区', '370611');
INSERT INTO `kl_area` VALUES ('1671', '158', null, '牟平区', '370612');
INSERT INTO `kl_area` VALUES ('1672', '158', null, '莱山区', '370613');
INSERT INTO `kl_area` VALUES ('1673', '158', null, '长岛县', '370634');
INSERT INTO `kl_area` VALUES ('1674', '158', null, '龙口市', '370681');
INSERT INTO `kl_area` VALUES ('1675', '158', null, '莱阳市', '370682');
INSERT INTO `kl_area` VALUES ('1676', '158', null, '莱州市', '370683');
INSERT INTO `kl_area` VALUES ('1677', '158', null, '蓬莱市', '370684');
INSERT INTO `kl_area` VALUES ('1678', '158', null, '招远市', '370685');
INSERT INTO `kl_area` VALUES ('1679', '158', null, '栖霞市', '370686');
INSERT INTO `kl_area` VALUES ('1680', '158', null, '海阳市', '370687');
INSERT INTO `kl_area` VALUES ('1681', '128', null, '市辖区', '360801');
INSERT INTO `kl_area` VALUES ('1682', '128', null, '吉州区', '360802');
INSERT INTO `kl_area` VALUES ('1683', '128', null, '青原区', '360803');
INSERT INTO `kl_area` VALUES ('1684', '128', null, '吉安县', '360821');
INSERT INTO `kl_area` VALUES ('1685', '128', null, '吉水县', '360822');
INSERT INTO `kl_area` VALUES ('1686', '128', null, '峡江县', '360823');
INSERT INTO `kl_area` VALUES ('1687', '128', null, '新干县', '360824');
INSERT INTO `kl_area` VALUES ('1688', '128', null, '永丰县', '360825');
INSERT INTO `kl_area` VALUES ('1689', '128', null, '泰和县', '360826');
INSERT INTO `kl_area` VALUES ('1690', '128', null, '遂川县', '360827');
INSERT INTO `kl_area` VALUES ('1691', '128', null, '万安县', '360828');
INSERT INTO `kl_area` VALUES ('1692', '128', null, '安福县', '360829');
INSERT INTO `kl_area` VALUES ('1693', '128', null, '永新县', '360830');
INSERT INTO `kl_area` VALUES ('1694', '128', null, '井冈山市', '360881');
INSERT INTO `kl_area` VALUES ('1695', '159', null, '市辖区', '370701');
INSERT INTO `kl_area` VALUES ('1696', '159', null, '潍城区', '370702');
INSERT INTO `kl_area` VALUES ('1697', '159', null, '寒亭区', '370703');
INSERT INTO `kl_area` VALUES ('1698', '159', null, '坊子区', '370704');
INSERT INTO `kl_area` VALUES ('1699', '159', null, '奎文区', '370705');
INSERT INTO `kl_area` VALUES ('1700', '159', null, '临朐县', '370724');
INSERT INTO `kl_area` VALUES ('1701', '159', null, '昌乐县', '370725');
INSERT INTO `kl_area` VALUES ('1702', '159', null, '青州市', '370781');
INSERT INTO `kl_area` VALUES ('1703', '159', null, '诸城市', '370782');
INSERT INTO `kl_area` VALUES ('1704', '159', null, '寿光市', '370783');
INSERT INTO `kl_area` VALUES ('1705', '159', null, '安丘市', '370784');
INSERT INTO `kl_area` VALUES ('1706', '159', null, '高密市', '370785');
INSERT INTO `kl_area` VALUES ('1707', '159', null, '昌邑市', '370786');
INSERT INTO `kl_area` VALUES ('1708', '129', null, '市辖区', '360901');
INSERT INTO `kl_area` VALUES ('1709', '129', null, '袁州区', '360902');
INSERT INTO `kl_area` VALUES ('1710', '129', null, '奉新县', '360921');
INSERT INTO `kl_area` VALUES ('1711', '129', null, '万载县', '360922');
INSERT INTO `kl_area` VALUES ('1712', '129', null, '上高县', '360923');
INSERT INTO `kl_area` VALUES ('1713', '129', null, '宜丰县', '360924');
INSERT INTO `kl_area` VALUES ('1714', '129', null, '靖安县', '360925');
INSERT INTO `kl_area` VALUES ('1715', '129', null, '铜鼓县', '360926');
INSERT INTO `kl_area` VALUES ('1716', '129', null, '丰城市', '360981');
INSERT INTO `kl_area` VALUES ('1717', '129', null, '樟树市', '360982');
INSERT INTO `kl_area` VALUES ('1718', '129', null, '高安市', '360983');
INSERT INTO `kl_area` VALUES ('1719', '160', null, '市辖区', '370801');
INSERT INTO `kl_area` VALUES ('1720', '160', null, '市中区', '370802');
INSERT INTO `kl_area` VALUES ('1721', '160', null, '任城区', '370811');
INSERT INTO `kl_area` VALUES ('1722', '160', null, '微山县', '370826');
INSERT INTO `kl_area` VALUES ('1723', '160', null, '鱼台县', '370827');
INSERT INTO `kl_area` VALUES ('1724', '160', null, '金乡县', '370828');
INSERT INTO `kl_area` VALUES ('1725', '160', null, '嘉祥县', '370829');
INSERT INTO `kl_area` VALUES ('1726', '160', null, '汶上县', '370830');
INSERT INTO `kl_area` VALUES ('1727', '160', null, '泗水县', '370831');
INSERT INTO `kl_area` VALUES ('1728', '160', null, '梁山县', '370832');
INSERT INTO `kl_area` VALUES ('1729', '160', null, '曲阜市', '370881');
INSERT INTO `kl_area` VALUES ('1730', '131', null, '市辖区', '361001');
INSERT INTO `kl_area` VALUES ('1731', '160', null, '兖州市', '370882');
INSERT INTO `kl_area` VALUES ('1732', '131', null, '临川区', '361002');
INSERT INTO `kl_area` VALUES ('1733', '160', null, '邹城市', '370883');
INSERT INTO `kl_area` VALUES ('1734', '131', null, '南城县', '361021');
INSERT INTO `kl_area` VALUES ('1735', '131', null, '黎川县', '361022');
INSERT INTO `kl_area` VALUES ('1736', '131', null, '南丰县', '361023');
INSERT INTO `kl_area` VALUES ('1737', '131', null, '崇仁县', '361024');
INSERT INTO `kl_area` VALUES ('1738', '131', null, '乐安县', '361025');
INSERT INTO `kl_area` VALUES ('1739', '131', null, '宜黄县', '361026');
INSERT INTO `kl_area` VALUES ('1740', '131', null, '金溪县', '361027');
INSERT INTO `kl_area` VALUES ('1741', '131', null, '资溪县', '361028');
INSERT INTO `kl_area` VALUES ('1742', '131', null, '东乡县', '361029');
INSERT INTO `kl_area` VALUES ('1743', '131', null, '广昌县', '361030');
INSERT INTO `kl_area` VALUES ('1744', '161', null, '市辖区', '370901');
INSERT INTO `kl_area` VALUES ('1745', '161', null, '泰山区', '370902');
INSERT INTO `kl_area` VALUES ('1746', '161', null, '岱岳区', '370911');
INSERT INTO `kl_area` VALUES ('1747', '161', null, '宁阳县', '370921');
INSERT INTO `kl_area` VALUES ('1748', '161', null, '东平县', '370923');
INSERT INTO `kl_area` VALUES ('1749', '161', null, '新泰市', '370982');
INSERT INTO `kl_area` VALUES ('1750', '161', null, '肥城市', '370983');
INSERT INTO `kl_area` VALUES ('1751', '133', null, '市辖区', '361101');
INSERT INTO `kl_area` VALUES ('1752', '133', null, '信州区', '361102');
INSERT INTO `kl_area` VALUES ('1753', '133', null, '上饶县', '361121');
INSERT INTO `kl_area` VALUES ('1754', '133', null, '广丰县', '361122');
INSERT INTO `kl_area` VALUES ('1755', '133', null, '玉山县', '361123');
INSERT INTO `kl_area` VALUES ('1756', '133', null, '铅山县', '361124');
INSERT INTO `kl_area` VALUES ('1757', '133', null, '横峰县', '361125');
INSERT INTO `kl_area` VALUES ('1758', '133', null, '弋阳县', '361126');
INSERT INTO `kl_area` VALUES ('1759', '133', null, '余干县', '361127');
INSERT INTO `kl_area` VALUES ('1760', '133', null, '鄱阳县', '361128');
INSERT INTO `kl_area` VALUES ('1761', '133', null, '万年县', '361129');
INSERT INTO `kl_area` VALUES ('1762', '133', null, '婺源县', '361130');
INSERT INTO `kl_area` VALUES ('1763', '133', null, '德兴市', '361181');
INSERT INTO `kl_area` VALUES ('1764', '162', null, '市辖区', '371001');
INSERT INTO `kl_area` VALUES ('1765', '162', null, '环翠区', '371002');
INSERT INTO `kl_area` VALUES ('1766', '162', null, '文登市', '371081');
INSERT INTO `kl_area` VALUES ('1767', '162', null, '荣成市', '371082');
INSERT INTO `kl_area` VALUES ('1768', '162', null, '乳山市', '371083');
INSERT INTO `kl_area` VALUES ('1769', '153', null, '市辖区', '370101');
INSERT INTO `kl_area` VALUES ('1770', '153', null, '历下区', '370102');
INSERT INTO `kl_area` VALUES ('1771', '153', null, '市中区', '370103');
INSERT INTO `kl_area` VALUES ('1772', '153', null, '槐荫区', '370104');
INSERT INTO `kl_area` VALUES ('1773', '153', null, '天桥区', '370105');
INSERT INTO `kl_area` VALUES ('1774', '153', null, '历城区', '370112');
INSERT INTO `kl_area` VALUES ('1775', '153', null, '长清区', '370113');
INSERT INTO `kl_area` VALUES ('1776', '153', null, '平阴县', '370124');
INSERT INTO `kl_area` VALUES ('1777', '153', null, '济阳县', '370125');
INSERT INTO `kl_area` VALUES ('1778', '153', null, '商河县', '370126');
INSERT INTO `kl_area` VALUES ('1779', '153', null, '章丘市', '370181');
INSERT INTO `kl_area` VALUES ('1780', '163', null, '市辖区', '371101');
INSERT INTO `kl_area` VALUES ('1781', '163', null, '东港区', '371102');
INSERT INTO `kl_area` VALUES ('1782', '163', null, '岚山区', '371103');
INSERT INTO `kl_area` VALUES ('1783', '163', null, '五莲县', '371121');
INSERT INTO `kl_area` VALUES ('1784', '163', null, '莒县', '371122');
INSERT INTO `kl_area` VALUES ('1785', '154', null, '市辖区', '370201');
INSERT INTO `kl_area` VALUES ('1786', '154', null, '市南区', '370202');
INSERT INTO `kl_area` VALUES ('1787', '154', null, '市北区', '370203');
INSERT INTO `kl_area` VALUES ('1788', '154', null, '黄岛区', '370211');
INSERT INTO `kl_area` VALUES ('1789', '154', null, '崂山区', '370212');
INSERT INTO `kl_area` VALUES ('1790', '154', null, '李沧区', '370213');
INSERT INTO `kl_area` VALUES ('1791', '164', null, '市辖区', '371201');
INSERT INTO `kl_area` VALUES ('1792', '154', null, '城阳区', '370214');
INSERT INTO `kl_area` VALUES ('1793', '164', null, '莱城区', '371202');
INSERT INTO `kl_area` VALUES ('1794', '154', null, '胶州市', '370281');
INSERT INTO `kl_area` VALUES ('1795', '164', null, '钢城区', '371203');
INSERT INTO `kl_area` VALUES ('1796', '154', null, '即墨市', '370282');
INSERT INTO `kl_area` VALUES ('1797', '154', null, '平度市', '370283');
INSERT INTO `kl_area` VALUES ('1798', '154', null, '莱西市', '370285');
INSERT INTO `kl_area` VALUES ('1799', '165', null, '市辖区', '371301');
INSERT INTO `kl_area` VALUES ('1800', '165', null, '兰山区', '371302');
INSERT INTO `kl_area` VALUES ('1801', '165', null, '罗庄区', '371311');
INSERT INTO `kl_area` VALUES ('1802', '155', null, '市辖区', '370301');
INSERT INTO `kl_area` VALUES ('1803', '165', null, '河东区', '371312');
INSERT INTO `kl_area` VALUES ('1804', '155', null, '淄川区', '370302');
INSERT INTO `kl_area` VALUES ('1805', '165', null, '沂南县', '371321');
INSERT INTO `kl_area` VALUES ('1806', '155', null, '张店区', '370303');
INSERT INTO `kl_area` VALUES ('1807', '165', null, '郯城县', '371322');
INSERT INTO `kl_area` VALUES ('1808', '155', null, '博山区', '370304');
INSERT INTO `kl_area` VALUES ('1809', '165', null, '沂水县', '371323');
INSERT INTO `kl_area` VALUES ('1810', '155', null, '临淄区', '370305');
INSERT INTO `kl_area` VALUES ('1811', '165', null, '苍山县', '371324');
INSERT INTO `kl_area` VALUES ('1812', '155', null, '周村区', '370306');
INSERT INTO `kl_area` VALUES ('1813', '165', null, '费县', '371325');
INSERT INTO `kl_area` VALUES ('1814', '155', null, '桓台县', '370321');
INSERT INTO `kl_area` VALUES ('1815', '165', null, '平邑县', '371326');
INSERT INTO `kl_area` VALUES ('1816', '155', null, '高青县', '370322');
INSERT INTO `kl_area` VALUES ('1817', '165', null, '莒南县', '371327');
INSERT INTO `kl_area` VALUES ('1818', '155', null, '沂源县', '370323');
INSERT INTO `kl_area` VALUES ('1819', '165', null, '蒙阴县', '371328');
INSERT INTO `kl_area` VALUES ('1820', '165', null, '临沭县', '371329');
INSERT INTO `kl_area` VALUES ('1821', '156', null, '市辖区', '370401');
INSERT INTO `kl_area` VALUES ('1822', '166', null, '市辖区', '371401');
INSERT INTO `kl_area` VALUES ('1823', '156', null, '市中区', '370402');
INSERT INTO `kl_area` VALUES ('1824', '166', null, '德城区', '371402');
INSERT INTO `kl_area` VALUES ('1825', '156', null, '薛城区', '370403');
INSERT INTO `kl_area` VALUES ('1826', '166', null, '陵县', '371421');
INSERT INTO `kl_area` VALUES ('1827', '156', null, '峄城区', '370404');
INSERT INTO `kl_area` VALUES ('1828', '166', null, '宁津县', '371422');
INSERT INTO `kl_area` VALUES ('1829', '156', null, '台儿庄区', '370405');
INSERT INTO `kl_area` VALUES ('1830', '166', null, '庆云县', '371423');
INSERT INTO `kl_area` VALUES ('1831', '156', null, '山亭区', '370406');
INSERT INTO `kl_area` VALUES ('1832', '166', null, '临邑县', '371424');
INSERT INTO `kl_area` VALUES ('1833', '156', null, '滕州市', '370481');
INSERT INTO `kl_area` VALUES ('1834', '166', null, '齐河县', '371425');
INSERT INTO `kl_area` VALUES ('1835', '166', null, '平原县', '371426');
INSERT INTO `kl_area` VALUES ('1836', '166', null, '夏津县', '371427');
INSERT INTO `kl_area` VALUES ('1837', '166', null, '武城县', '371428');
INSERT INTO `kl_area` VALUES ('1838', '166', null, '乐陵市', '371481');
INSERT INTO `kl_area` VALUES ('1839', '166', null, '禹城市', '371482');
INSERT INTO `kl_area` VALUES ('1840', '167', null, '市辖区', '371501');
INSERT INTO `kl_area` VALUES ('1841', '167', null, '东昌府区', '371502');
INSERT INTO `kl_area` VALUES ('1842', '167', null, '阳谷县', '371521');
INSERT INTO `kl_area` VALUES ('1843', '167', null, '莘县', '371522');
INSERT INTO `kl_area` VALUES ('1844', '167', null, '茌平县', '371523');
INSERT INTO `kl_area` VALUES ('1845', '167', null, '东阿县', '371524');
INSERT INTO `kl_area` VALUES ('1846', '167', null, '冠县', '371525');
INSERT INTO `kl_area` VALUES ('1847', '167', null, '高唐县', '371526');
INSERT INTO `kl_area` VALUES ('1848', '167', null, '临清市', '371581');
INSERT INTO `kl_area` VALUES ('1849', '207', null, '市辖区', '410801');
INSERT INTO `kl_area` VALUES ('1850', '207', null, '解放区', '410802');
INSERT INTO `kl_area` VALUES ('1851', '207', null, '中站区', '410803');
INSERT INTO `kl_area` VALUES ('1852', '207', null, '马村区', '410804');
INSERT INTO `kl_area` VALUES ('1853', '207', null, '山阳区', '410811');
INSERT INTO `kl_area` VALUES ('1854', '207', null, '修武县', '410821');
INSERT INTO `kl_area` VALUES ('1855', '207', null, '博爱县', '410822');
INSERT INTO `kl_area` VALUES ('1856', '207', null, '武陟县', '410823');
INSERT INTO `kl_area` VALUES ('1857', '207', null, '温县', '410825');
INSERT INTO `kl_area` VALUES ('1858', '207', null, '沁阳市', '410882');
INSERT INTO `kl_area` VALUES ('1859', '207', null, '孟州市', '410883');
INSERT INTO `kl_area` VALUES ('1860', '169', null, '市辖区', '371601');
INSERT INTO `kl_area` VALUES ('1861', '169', null, '滨城区', '371602');
INSERT INTO `kl_area` VALUES ('1862', '169', null, '惠民县', '371621');
INSERT INTO `kl_area` VALUES ('1863', '169', null, '阳信县', '371622');
INSERT INTO `kl_area` VALUES ('1864', '169', null, '无棣县', '371623');
INSERT INTO `kl_area` VALUES ('1865', '169', null, '沾化县', '371624');
INSERT INTO `kl_area` VALUES ('1866', '169', null, '博兴县', '371625');
INSERT INTO `kl_area` VALUES ('1867', '169', null, '邹平县', '371626');
INSERT INTO `kl_area` VALUES ('1868', '222', null, '济源市', '419001');
INSERT INTO `kl_area` VALUES ('1869', '208', null, '市辖区', '410901');
INSERT INTO `kl_area` VALUES ('1870', '208', null, '华龙区', '410902');
INSERT INTO `kl_area` VALUES ('1871', '208', null, '清丰县', '410922');
INSERT INTO `kl_area` VALUES ('1872', '208', null, '南乐县', '410923');
INSERT INTO `kl_area` VALUES ('1873', '208', null, '范县', '410926');
INSERT INTO `kl_area` VALUES ('1874', '208', null, '台前县', '410927');
INSERT INTO `kl_area` VALUES ('1875', '208', null, '濮阳县', '410928');
INSERT INTO `kl_area` VALUES ('1876', '172', null, '市辖区', '371701');
INSERT INTO `kl_area` VALUES ('1877', '172', null, '牡丹区', '371702');
INSERT INTO `kl_area` VALUES ('1878', '234', null, '市辖区', '420101');
INSERT INTO `kl_area` VALUES ('1879', '172', null, '曹县', '371721');
INSERT INTO `kl_area` VALUES ('1880', '234', null, '江岸区', '420102');
INSERT INTO `kl_area` VALUES ('1881', '172', null, '单县', '371722');
INSERT INTO `kl_area` VALUES ('1882', '234', null, '江汉区', '420103');
INSERT INTO `kl_area` VALUES ('1883', '172', null, '成武县', '371723');
INSERT INTO `kl_area` VALUES ('1884', '234', null, '硚口区', '420104');
INSERT INTO `kl_area` VALUES ('1885', '172', null, '巨野县', '371724');
INSERT INTO `kl_area` VALUES ('1886', '234', null, '汉阳区', '420105');
INSERT INTO `kl_area` VALUES ('1887', '172', null, '郓城县', '371725');
INSERT INTO `kl_area` VALUES ('1888', '234', null, '武昌区', '420106');
INSERT INTO `kl_area` VALUES ('1889', '172', null, '鄄城县', '371726');
INSERT INTO `kl_area` VALUES ('1890', '234', null, '青山区', '420107');
INSERT INTO `kl_area` VALUES ('1891', '172', null, '定陶县', '371727');
INSERT INTO `kl_area` VALUES ('1892', '234', null, '洪山区', '420111');
INSERT INTO `kl_area` VALUES ('1893', '172', null, '东明县', '371728');
INSERT INTO `kl_area` VALUES ('1894', '234', null, '东西湖区', '420112');
INSERT INTO `kl_area` VALUES ('1895', '234', null, '汉南区', '420113');
INSERT INTO `kl_area` VALUES ('1896', '234', null, '蔡甸区', '420114');
INSERT INTO `kl_area` VALUES ('1897', '234', null, '江夏区', '420115');
INSERT INTO `kl_area` VALUES ('1898', '234', null, '黄陂区', '420116');
INSERT INTO `kl_area` VALUES ('1899', '209', null, '市辖区', '411001');
INSERT INTO `kl_area` VALUES ('1900', '234', null, '新洲区', '420117');
INSERT INTO `kl_area` VALUES ('1901', '209', null, '魏都区', '411002');
INSERT INTO `kl_area` VALUES ('1902', '209', null, '许昌县', '411023');
INSERT INTO `kl_area` VALUES ('1903', '209', null, '鄢陵县', '411024');
INSERT INTO `kl_area` VALUES ('1904', '209', null, '襄城县', '411025');
INSERT INTO `kl_area` VALUES ('1905', '209', null, '禹州市', '411081');
INSERT INTO `kl_area` VALUES ('1906', '209', null, '长葛市', '411082');
INSERT INTO `kl_area` VALUES ('1907', '198', null, '市辖区', '410101');
INSERT INTO `kl_area` VALUES ('1908', '198', null, '中原区', '410102');
INSERT INTO `kl_area` VALUES ('1909', '198', null, '二七区', '410103');
INSERT INTO `kl_area` VALUES ('1910', '198', null, '管城回族区', '410104');
INSERT INTO `kl_area` VALUES ('1911', '198', null, '金水区', '410105');
INSERT INTO `kl_area` VALUES ('1912', '198', null, '上街区', '410106');
INSERT INTO `kl_area` VALUES ('1913', '198', null, '惠济区', '410108');
INSERT INTO `kl_area` VALUES ('1914', '235', null, '市辖区', '420201');
INSERT INTO `kl_area` VALUES ('1915', '198', null, '中牟县', '410122');
INSERT INTO `kl_area` VALUES ('1916', '235', null, '黄石港区', '420202');
INSERT INTO `kl_area` VALUES ('1917', '198', null, '巩义市', '410181');
INSERT INTO `kl_area` VALUES ('1918', '235', null, '西塞山区', '420203');
INSERT INTO `kl_area` VALUES ('1919', '198', null, '荥阳市', '410182');
INSERT INTO `kl_area` VALUES ('1920', '235', null, '下陆区', '420204');
INSERT INTO `kl_area` VALUES ('1921', '198', null, '新密市', '410183');
INSERT INTO `kl_area` VALUES ('1922', '235', null, '铁山区', '420205');
INSERT INTO `kl_area` VALUES ('1923', '198', null, '新郑市', '410184');
INSERT INTO `kl_area` VALUES ('1924', '210', null, '市辖区', '411101');
INSERT INTO `kl_area` VALUES ('1925', '235', null, '阳新县', '420222');
INSERT INTO `kl_area` VALUES ('1926', '210', null, '源汇区', '411102');
INSERT INTO `kl_area` VALUES ('1927', '198', null, '登封市', '410185');
INSERT INTO `kl_area` VALUES ('1928', '235', null, '大冶市', '420281');
INSERT INTO `kl_area` VALUES ('1929', '210', null, '郾城区', '411103');
INSERT INTO `kl_area` VALUES ('1930', '210', null, '召陵区', '411104');
INSERT INTO `kl_area` VALUES ('1931', '210', null, '舞阳县', '411121');
INSERT INTO `kl_area` VALUES ('1932', '210', null, '临颍县', '411122');
INSERT INTO `kl_area` VALUES ('1933', '200', null, '市辖区', '410201');
INSERT INTO `kl_area` VALUES ('1934', '236', null, '市辖区', '420301');
INSERT INTO `kl_area` VALUES ('1935', '200', null, '龙亭区', '410202');
INSERT INTO `kl_area` VALUES ('1936', '236', null, '茅箭区', '420302');
INSERT INTO `kl_area` VALUES ('1937', '200', null, '顺河回族区', '410203');
INSERT INTO `kl_area` VALUES ('1938', '236', null, '张湾区', '420303');
INSERT INTO `kl_area` VALUES ('1939', '211', null, '市辖区', '411201');
INSERT INTO `kl_area` VALUES ('1940', '200', null, '鼓楼区', '410204');
INSERT INTO `kl_area` VALUES ('1941', '236', null, '郧县', '420321');
INSERT INTO `kl_area` VALUES ('1942', '211', null, '湖滨区', '411202');
INSERT INTO `kl_area` VALUES ('1943', '200', null, '禹王台区', '410205');
INSERT INTO `kl_area` VALUES ('1944', '211', null, '渑池县', '411221');
INSERT INTO `kl_area` VALUES ('1945', '236', null, '郧西县', '420322');
INSERT INTO `kl_area` VALUES ('1946', '200', null, '金明区', '410211');
INSERT INTO `kl_area` VALUES ('1947', '236', null, '竹山县', '420323');
INSERT INTO `kl_area` VALUES ('1948', '211', null, '陕县', '411222');
INSERT INTO `kl_area` VALUES ('1949', '200', null, '杞县', '410221');
INSERT INTO `kl_area` VALUES ('1950', '236', null, '竹溪县', '420324');
INSERT INTO `kl_area` VALUES ('1951', '211', null, '卢氏县', '411224');
INSERT INTO `kl_area` VALUES ('1952', '200', null, '通许县', '410222');
INSERT INTO `kl_area` VALUES ('1953', '211', null, '义马市', '411281');
INSERT INTO `kl_area` VALUES ('1954', '200', null, '尉氏县', '410223');
INSERT INTO `kl_area` VALUES ('1955', '236', null, '房县', '420325');
INSERT INTO `kl_area` VALUES ('1956', '211', null, '灵宝市', '411282');
INSERT INTO `kl_area` VALUES ('1957', '200', null, '开封县', '410224');
INSERT INTO `kl_area` VALUES ('1958', '236', null, '丹江口市', '420381');
INSERT INTO `kl_area` VALUES ('1959', '200', null, '兰考县', '410225');
INSERT INTO `kl_area` VALUES ('1960', '212', null, '市辖区', '411301');
INSERT INTO `kl_area` VALUES ('1961', '237', null, '市辖区', '420501');
INSERT INTO `kl_area` VALUES ('1962', '212', null, '宛城区', '411302');
INSERT INTO `kl_area` VALUES ('1963', '237', null, '西陵区', '420502');
INSERT INTO `kl_area` VALUES ('1964', '202', null, '市辖区', '410301');
INSERT INTO `kl_area` VALUES ('1965', '212', null, '卧龙区', '411303');
INSERT INTO `kl_area` VALUES ('1966', '237', null, '伍家岗区', '420503');
INSERT INTO `kl_area` VALUES ('1967', '202', null, '老城区', '410302');
INSERT INTO `kl_area` VALUES ('1968', '212', null, '南召县', '411321');
INSERT INTO `kl_area` VALUES ('1969', '237', null, '点军区', '420504');
INSERT INTO `kl_area` VALUES ('1970', '202', null, '西工区', '410303');
INSERT INTO `kl_area` VALUES ('1971', '212', null, '方城县', '411322');
INSERT INTO `kl_area` VALUES ('1972', '237', null, '猇亭区', '420505');
INSERT INTO `kl_area` VALUES ('1973', '202', null, '瀍河回族区', '410304');
INSERT INTO `kl_area` VALUES ('1974', '212', null, '西峡县', '411323');
INSERT INTO `kl_area` VALUES ('1975', '237', null, '夷陵区', '420506');
INSERT INTO `kl_area` VALUES ('1976', '202', null, '涧西区', '410305');
INSERT INTO `kl_area` VALUES ('1977', '212', null, '镇平县', '411324');
INSERT INTO `kl_area` VALUES ('1978', '237', null, '远安县', '420525');
INSERT INTO `kl_area` VALUES ('1979', '202', null, '吉利区', '410306');
INSERT INTO `kl_area` VALUES ('1980', '212', null, '内乡县', '411325');
INSERT INTO `kl_area` VALUES ('1981', '237', null, '兴山县', '420526');
INSERT INTO `kl_area` VALUES ('1982', '202', null, '洛龙区', '410311');
INSERT INTO `kl_area` VALUES ('1983', '212', null, '淅川县', '411326');
INSERT INTO `kl_area` VALUES ('1984', '237', null, '秭归县', '420527');
INSERT INTO `kl_area` VALUES ('1985', '202', null, '孟津县', '410322');
INSERT INTO `kl_area` VALUES ('1986', '212', null, '社旗县', '411327');
INSERT INTO `kl_area` VALUES ('1987', '237', null, '长阳土家族自治县', '420528');
INSERT INTO `kl_area` VALUES ('1988', '202', null, '新安县', '410323');
INSERT INTO `kl_area` VALUES ('1989', '212', null, '唐河县', '411328');
INSERT INTO `kl_area` VALUES ('1990', '202', null, '栾川县', '410324');
INSERT INTO `kl_area` VALUES ('1991', '237', null, '五峰土家族自治县', '420529');
INSERT INTO `kl_area` VALUES ('1992', '212', null, '新野县', '411329');
INSERT INTO `kl_area` VALUES ('1993', '237', null, '宜都市', '420581');
INSERT INTO `kl_area` VALUES ('1994', '202', null, '嵩县', '410325');
INSERT INTO `kl_area` VALUES ('1995', '212', null, '桐柏县', '411330');
INSERT INTO `kl_area` VALUES ('1996', '237', null, '当阳市', '420582');
INSERT INTO `kl_area` VALUES ('1997', '202', null, '汝阳县', '410326');
INSERT INTO `kl_area` VALUES ('1998', '212', null, '邓州市', '411381');
INSERT INTO `kl_area` VALUES ('1999', '202', null, '宜阳县', '410327');
INSERT INTO `kl_area` VALUES ('2000', '237', null, '枝江市', '420583');
INSERT INTO `kl_area` VALUES ('2001', '202', null, '洛宁县', '410328');
INSERT INTO `kl_area` VALUES ('2002', '202', null, '伊川县', '410329');
INSERT INTO `kl_area` VALUES ('2003', '202', null, '偃师市', '410381');
INSERT INTO `kl_area` VALUES ('2004', '214', null, '市辖区', '411401');
INSERT INTO `kl_area` VALUES ('2005', '238', null, '市辖区', '420601');
INSERT INTO `kl_area` VALUES ('2006', '214', null, '梁园区', '411402');
INSERT INTO `kl_area` VALUES ('2007', '238', null, '襄城区', '420602');
INSERT INTO `kl_area` VALUES ('2008', '203', null, '市辖区', '410401');
INSERT INTO `kl_area` VALUES ('2009', '214', null, '睢阳区', '411403');
INSERT INTO `kl_area` VALUES ('2010', '203', null, '新华区', '410402');
INSERT INTO `kl_area` VALUES ('2011', '238', null, '樊城区', '420606');
INSERT INTO `kl_area` VALUES ('2012', '214', null, '民权县', '411421');
INSERT INTO `kl_area` VALUES ('2013', '203', null, '卫东区', '410403');
INSERT INTO `kl_area` VALUES ('2014', '238', null, '襄州区', '420607');
INSERT INTO `kl_area` VALUES ('2015', '214', null, '睢县', '411422');
INSERT INTO `kl_area` VALUES ('2016', '203', null, '石龙区', '410404');
INSERT INTO `kl_area` VALUES ('2017', '238', null, '南漳县', '420624');
INSERT INTO `kl_area` VALUES ('2018', '214', null, '宁陵县', '411423');
INSERT INTO `kl_area` VALUES ('2019', '238', null, '谷城县', '420625');
INSERT INTO `kl_area` VALUES ('2020', '203', null, '湛河区', '410411');
INSERT INTO `kl_area` VALUES ('2021', '214', null, '柘城县', '411424');
INSERT INTO `kl_area` VALUES ('2022', '238', null, '保康县', '420626');
INSERT INTO `kl_area` VALUES ('2023', '203', null, '宝丰县', '410421');
INSERT INTO `kl_area` VALUES ('2024', '214', null, '虞城县', '411425');
INSERT INTO `kl_area` VALUES ('2025', '203', null, '叶县', '410422');
INSERT INTO `kl_area` VALUES ('2026', '238', null, '老河口市', '420682');
INSERT INTO `kl_area` VALUES ('2027', '214', null, '夏邑县', '411426');
INSERT INTO `kl_area` VALUES ('2028', '238', null, '枣阳市', '420683');
INSERT INTO `kl_area` VALUES ('2029', '203', null, '鲁山县', '410423');
INSERT INTO `kl_area` VALUES ('2030', '214', null, '永城市', '411481');
INSERT INTO `kl_area` VALUES ('2031', '238', null, '宜城市', '420684');
INSERT INTO `kl_area` VALUES ('2032', '203', null, '郏县', '410425');
INSERT INTO `kl_area` VALUES ('2033', '203', null, '舞钢市', '410481');
INSERT INTO `kl_area` VALUES ('2034', '203', null, '汝州市', '410482');
INSERT INTO `kl_area` VALUES ('2035', '216', null, '市辖区', '411501');
INSERT INTO `kl_area` VALUES ('2036', '239', null, '市辖区', '420701');
INSERT INTO `kl_area` VALUES ('2037', '216', null, '浉河区', '411502');
INSERT INTO `kl_area` VALUES ('2038', '239', null, '梁子湖区', '420702');
INSERT INTO `kl_area` VALUES ('2039', '216', null, '平桥区', '411503');
INSERT INTO `kl_area` VALUES ('2040', '204', null, '市辖区', '410501');
INSERT INTO `kl_area` VALUES ('2041', '239', null, '华容区', '420703');
INSERT INTO `kl_area` VALUES ('2042', '204', null, '文峰区', '410502');
INSERT INTO `kl_area` VALUES ('2043', '216', null, '罗山县', '411521');
INSERT INTO `kl_area` VALUES ('2044', '239', null, '鄂城区', '420704');
INSERT INTO `kl_area` VALUES ('2045', '216', null, '光山县', '411522');
INSERT INTO `kl_area` VALUES ('2046', '204', null, '北关区', '410503');
INSERT INTO `kl_area` VALUES ('2047', '216', null, '新县', '411523');
INSERT INTO `kl_area` VALUES ('2048', '204', null, '殷都区', '410505');
INSERT INTO `kl_area` VALUES ('2049', '216', null, '商城县', '411524');
INSERT INTO `kl_area` VALUES ('2050', '204', null, '龙安区', '410506');
INSERT INTO `kl_area` VALUES ('2051', '216', null, '固始县', '411525');
INSERT INTO `kl_area` VALUES ('2052', '204', null, '安阳县', '410522');
INSERT INTO `kl_area` VALUES ('2053', '216', null, '潢川县', '411526');
INSERT INTO `kl_area` VALUES ('2054', '204', null, '汤阴县', '410523');
INSERT INTO `kl_area` VALUES ('2055', '216', null, '淮滨县', '411527');
INSERT INTO `kl_area` VALUES ('2056', '204', null, '滑县', '410526');
INSERT INTO `kl_area` VALUES ('2057', '216', null, '息县', '411528');
INSERT INTO `kl_area` VALUES ('2058', '204', null, '内黄县', '410527');
INSERT INTO `kl_area` VALUES ('2059', '204', null, '林州市', '410581');
INSERT INTO `kl_area` VALUES ('2060', '240', null, '市辖区', '420801');
INSERT INTO `kl_area` VALUES ('2061', '240', null, '东宝区', '420802');
INSERT INTO `kl_area` VALUES ('2062', '240', null, '掇刀区', '420804');
INSERT INTO `kl_area` VALUES ('2063', '240', null, '京山县', '420821');
INSERT INTO `kl_area` VALUES ('2064', '240', null, '沙洋县', '420822');
INSERT INTO `kl_area` VALUES ('2065', '240', null, '钟祥市', '420881');
INSERT INTO `kl_area` VALUES ('2066', '218', null, '市辖区', '411601');
INSERT INTO `kl_area` VALUES ('2067', '205', null, '市辖区', '410601');
INSERT INTO `kl_area` VALUES ('2068', '218', null, '川汇区', '411602');
INSERT INTO `kl_area` VALUES ('2069', '205', null, '鹤山区', '410602');
INSERT INTO `kl_area` VALUES ('2070', '218', null, '扶沟县', '411621');
INSERT INTO `kl_area` VALUES ('2071', '205', null, '山城区', '410603');
INSERT INTO `kl_area` VALUES ('2072', '218', null, '西华县', '411622');
INSERT INTO `kl_area` VALUES ('2073', '205', null, '淇滨区', '410611');
INSERT INTO `kl_area` VALUES ('2074', '218', null, '商水县', '411623');
INSERT INTO `kl_area` VALUES ('2075', '205', null, '浚县', '410621');
INSERT INTO `kl_area` VALUES ('2076', '218', null, '沈丘县', '411624');
INSERT INTO `kl_area` VALUES ('2077', '205', null, '淇县', '410622');
INSERT INTO `kl_area` VALUES ('2078', '218', null, '郸城县', '411625');
INSERT INTO `kl_area` VALUES ('2079', '218', null, '淮阳县', '411626');
INSERT INTO `kl_area` VALUES ('2080', '218', null, '太康县', '411627');
INSERT INTO `kl_area` VALUES ('2081', '218', null, '鹿邑县', '411628');
INSERT INTO `kl_area` VALUES ('2082', '218', null, '项城市', '411681');
INSERT INTO `kl_area` VALUES ('2083', '242', null, '市辖区', '420901');
INSERT INTO `kl_area` VALUES ('2084', '242', null, '孝南区', '420902');
INSERT INTO `kl_area` VALUES ('2085', '242', null, '孝昌县', '420921');
INSERT INTO `kl_area` VALUES ('2086', '242', null, '大悟县', '420922');
INSERT INTO `kl_area` VALUES ('2087', '242', null, '云梦县', '420923');
INSERT INTO `kl_area` VALUES ('2088', '242', null, '应城市', '420981');
INSERT INTO `kl_area` VALUES ('2089', '242', null, '安陆市', '420982');
INSERT INTO `kl_area` VALUES ('2090', '242', null, '汉川市', '420984');
INSERT INTO `kl_area` VALUES ('2091', '206', null, '市辖区', '410701');
INSERT INTO `kl_area` VALUES ('2092', '206', null, '红旗区', '410702');
INSERT INTO `kl_area` VALUES ('2093', '220', null, '市辖区', '411701');
INSERT INTO `kl_area` VALUES ('2094', '206', null, '卫滨区', '410703');
INSERT INTO `kl_area` VALUES ('2095', '220', null, '驿城区', '411702');
INSERT INTO `kl_area` VALUES ('2096', '206', null, '凤泉区', '410704');
INSERT INTO `kl_area` VALUES ('2097', '220', null, '西平县', '411721');
INSERT INTO `kl_area` VALUES ('2098', '206', null, '牧野区', '410711');
INSERT INTO `kl_area` VALUES ('2099', '220', null, '上蔡县', '411722');
INSERT INTO `kl_area` VALUES ('2100', '206', null, '新乡县', '410721');
INSERT INTO `kl_area` VALUES ('2101', '220', null, '平舆县', '411723');
INSERT INTO `kl_area` VALUES ('2102', '206', null, '获嘉县', '410724');
INSERT INTO `kl_area` VALUES ('2103', '220', null, '正阳县', '411724');
INSERT INTO `kl_area` VALUES ('2104', '244', null, '市辖区', '421001');
INSERT INTO `kl_area` VALUES ('2105', '220', null, '确山县', '411725');
INSERT INTO `kl_area` VALUES ('2106', '206', null, '原阳县', '410725');
INSERT INTO `kl_area` VALUES ('2107', '244', null, '沙市区', '421002');
INSERT INTO `kl_area` VALUES ('2108', '220', null, '泌阳县', '411726');
INSERT INTO `kl_area` VALUES ('2109', '206', null, '延津县', '410726');
INSERT INTO `kl_area` VALUES ('2110', '244', null, '荆州区', '421003');
INSERT INTO `kl_area` VALUES ('2111', '206', null, '封丘县', '410727');
INSERT INTO `kl_area` VALUES ('2112', '220', null, '汝南县', '411727');
INSERT INTO `kl_area` VALUES ('2113', '244', null, '公安县', '421022');
INSERT INTO `kl_area` VALUES ('2114', '206', null, '长垣县', '410728');
INSERT INTO `kl_area` VALUES ('2115', '220', null, '遂平县', '411728');
INSERT INTO `kl_area` VALUES ('2116', '244', null, '监利县', '421023');
INSERT INTO `kl_area` VALUES ('2117', '206', null, '卫辉市', '410781');
INSERT INTO `kl_area` VALUES ('2118', '220', null, '新蔡县', '411729');
INSERT INTO `kl_area` VALUES ('2119', '244', null, '江陵县', '421024');
INSERT INTO `kl_area` VALUES ('2120', '206', null, '辉县市', '410782');
INSERT INTO `kl_area` VALUES ('2121', '244', null, '石首市', '421081');
INSERT INTO `kl_area` VALUES ('2122', '244', null, '洪湖市', '421083');
INSERT INTO `kl_area` VALUES ('2123', '244', null, '松滋市', '421087');
INSERT INTO `kl_area` VALUES ('2124', '246', null, '市辖区', '421101');
INSERT INTO `kl_area` VALUES ('2125', '246', null, '黄州区', '421102');
INSERT INTO `kl_area` VALUES ('2126', '246', null, '团风县', '421121');
INSERT INTO `kl_area` VALUES ('2127', '246', null, '红安县', '421122');
INSERT INTO `kl_area` VALUES ('2128', '246', null, '罗田县', '421123');
INSERT INTO `kl_area` VALUES ('2129', '246', null, '英山县', '421124');
INSERT INTO `kl_area` VALUES ('2130', '246', null, '浠水县', '421125');
INSERT INTO `kl_area` VALUES ('2131', '246', null, '蕲春县', '421126');
INSERT INTO `kl_area` VALUES ('2132', '246', null, '黄梅县', '421127');
INSERT INTO `kl_area` VALUES ('2133', '246', null, '麻城市', '421181');
INSERT INTO `kl_area` VALUES ('2134', '246', null, '武穴市', '421182');
INSERT INTO `kl_area` VALUES ('2135', '276', null, '市辖区', '430601');
INSERT INTO `kl_area` VALUES ('2136', '276', null, '岳阳楼区', '430602');
INSERT INTO `kl_area` VALUES ('2137', '276', null, '云溪区', '430603');
INSERT INTO `kl_area` VALUES ('2138', '276', null, '君山区', '430611');
INSERT INTO `kl_area` VALUES ('2139', '276', null, '岳阳县', '430621');
INSERT INTO `kl_area` VALUES ('2140', '276', null, '华容县', '430623');
INSERT INTO `kl_area` VALUES ('2141', '276', null, '湘阴县', '430624');
INSERT INTO `kl_area` VALUES ('2142', '276', null, '平江县', '430626');
INSERT INTO `kl_area` VALUES ('2143', '276', null, '汨罗市', '430681');
INSERT INTO `kl_area` VALUES ('2144', '276', null, '临湘市', '430682');
INSERT INTO `kl_area` VALUES ('2145', '249', null, '市辖区', '421201');
INSERT INTO `kl_area` VALUES ('2146', '249', null, '咸安区', '421202');
INSERT INTO `kl_area` VALUES ('2147', '249', null, '嘉鱼县', '421221');
INSERT INTO `kl_area` VALUES ('2148', '249', null, '通城县', '421222');
INSERT INTO `kl_area` VALUES ('2149', '249', null, '崇阳县', '421223');
INSERT INTO `kl_area` VALUES ('2150', '249', null, '通山县', '421224');
INSERT INTO `kl_area` VALUES ('2151', '249', null, '赤壁市', '421281');
INSERT INTO `kl_area` VALUES ('2152', '277', null, '市辖区', '430701');
INSERT INTO `kl_area` VALUES ('2153', '277', null, '武陵区', '430702');
INSERT INTO `kl_area` VALUES ('2154', '277', null, '鼎城区', '430703');
INSERT INTO `kl_area` VALUES ('2155', '277', null, '安乡县', '430721');
INSERT INTO `kl_area` VALUES ('2156', '277', null, '汉寿县', '430722');
INSERT INTO `kl_area` VALUES ('2157', '277', null, '澧县', '430723');
INSERT INTO `kl_area` VALUES ('2158', '277', null, '临澧县', '430724');
INSERT INTO `kl_area` VALUES ('2159', '252', null, '市辖区', '421301');
INSERT INTO `kl_area` VALUES ('2160', '277', null, '桃源县', '430725');
INSERT INTO `kl_area` VALUES ('2161', '252', null, '曾都区', '421303');
INSERT INTO `kl_area` VALUES ('2162', '277', null, '石门县', '430726');
INSERT INTO `kl_area` VALUES ('2163', '252', null, '随县', '421321');
INSERT INTO `kl_area` VALUES ('2164', '277', null, '津市市', '430781');
INSERT INTO `kl_area` VALUES ('2165', '252', null, '广水市', '421381');
INSERT INTO `kl_area` VALUES ('2166', '278', null, '市辖区', '430801');
INSERT INTO `kl_area` VALUES ('2167', '255', null, '恩施市', '422801');
INSERT INTO `kl_area` VALUES ('2168', '278', null, '永定区', '430802');
INSERT INTO `kl_area` VALUES ('2169', '255', null, '利川市', '422802');
INSERT INTO `kl_area` VALUES ('2170', '278', null, '武陵源区', '430811');
INSERT INTO `kl_area` VALUES ('2171', '255', null, '建始县', '422822');
INSERT INTO `kl_area` VALUES ('2172', '278', null, '慈利县', '430821');
INSERT INTO `kl_area` VALUES ('2173', '255', null, '巴东县', '422823');
INSERT INTO `kl_area` VALUES ('2174', '278', null, '桑植县', '430822');
INSERT INTO `kl_area` VALUES ('2175', '255', null, '宣恩县', '422825');
INSERT INTO `kl_area` VALUES ('2176', '255', null, '咸丰县', '422826');
INSERT INTO `kl_area` VALUES ('2177', '255', null, '来凤县', '422827');
INSERT INTO `kl_area` VALUES ('2178', '255', null, '鹤峰县', '422828');
INSERT INTO `kl_area` VALUES ('2179', '279', null, '市辖区', '430901');
INSERT INTO `kl_area` VALUES ('2180', '279', null, '资阳区', '430902');
INSERT INTO `kl_area` VALUES ('2181', '279', null, '赫山区', '430903');
INSERT INTO `kl_area` VALUES ('2182', '259', null, '仙桃市', '429004');
INSERT INTO `kl_area` VALUES ('2183', '279', null, '南县', '430921');
INSERT INTO `kl_area` VALUES ('2184', '259', null, '潜江市', '429005');
INSERT INTO `kl_area` VALUES ('2185', '279', null, '桃江县', '430922');
INSERT INTO `kl_area` VALUES ('2186', '259', null, '天门市', '429006');
INSERT INTO `kl_area` VALUES ('2187', '279', null, '安化县', '430923');
INSERT INTO `kl_area` VALUES ('2188', '259', null, '神农架林区', '429021');
INSERT INTO `kl_area` VALUES ('2189', '279', null, '沅江市', '430981');
INSERT INTO `kl_area` VALUES ('2190', '271', null, '市辖区', '430101');
INSERT INTO `kl_area` VALUES ('2191', '280', null, '市辖区', '431001');
INSERT INTO `kl_area` VALUES ('2192', '271', null, '芙蓉区', '430102');
INSERT INTO `kl_area` VALUES ('2193', '280', null, '北湖区', '431002');
INSERT INTO `kl_area` VALUES ('2194', '271', null, '天心区', '430103');
INSERT INTO `kl_area` VALUES ('2195', '280', null, '苏仙区', '431003');
INSERT INTO `kl_area` VALUES ('2196', '271', null, '岳麓区', '430104');
INSERT INTO `kl_area` VALUES ('2197', '280', null, '桂阳县', '431021');
INSERT INTO `kl_area` VALUES ('2198', '271', null, '开福区', '430105');
INSERT INTO `kl_area` VALUES ('2199', '280', null, '宜章县', '431022');
INSERT INTO `kl_area` VALUES ('2200', '271', null, '雨花区', '430111');
INSERT INTO `kl_area` VALUES ('2201', '280', null, '永兴县', '431023');
INSERT INTO `kl_area` VALUES ('2202', '271', null, '望城区', '430112');
INSERT INTO `kl_area` VALUES ('2203', '280', null, '嘉禾县', '431024');
INSERT INTO `kl_area` VALUES ('2204', '271', null, '长沙县', '430121');
INSERT INTO `kl_area` VALUES ('2205', '280', null, '临武县', '431025');
INSERT INTO `kl_area` VALUES ('2206', '271', null, '宁乡县', '430124');
INSERT INTO `kl_area` VALUES ('2207', '280', null, '汝城县', '431026');
INSERT INTO `kl_area` VALUES ('2208', '271', null, '浏阳市', '430181');
INSERT INTO `kl_area` VALUES ('2209', '280', null, '桂东县', '431027');
INSERT INTO `kl_area` VALUES ('2210', '280', null, '安仁县', '431028');
INSERT INTO `kl_area` VALUES ('2211', '280', null, '资兴市', '431081');
INSERT INTO `kl_area` VALUES ('2212', '272', null, '市辖区', '430201');
INSERT INTO `kl_area` VALUES ('2213', '272', null, '荷塘区', '430202');
INSERT INTO `kl_area` VALUES ('2214', '272', null, '芦淞区', '430203');
INSERT INTO `kl_area` VALUES ('2215', '281', null, '市辖区', '431101');
INSERT INTO `kl_area` VALUES ('2216', '272', null, '石峰区', '430204');
INSERT INTO `kl_area` VALUES ('2217', '281', null, '零陵区', '431102');
INSERT INTO `kl_area` VALUES ('2218', '272', null, '天元区', '430211');
INSERT INTO `kl_area` VALUES ('2219', '281', null, '冷水滩区', '431103');
INSERT INTO `kl_area` VALUES ('2220', '272', null, '株洲县', '430221');
INSERT INTO `kl_area` VALUES ('2221', '281', null, '祁阳县', '431121');
INSERT INTO `kl_area` VALUES ('2222', '272', null, '攸县', '430223');
INSERT INTO `kl_area` VALUES ('2223', '281', null, '东安县', '431122');
INSERT INTO `kl_area` VALUES ('2224', '272', null, '茶陵县', '430224');
INSERT INTO `kl_area` VALUES ('2225', '281', null, '双牌县', '431123');
INSERT INTO `kl_area` VALUES ('2226', '272', null, '炎陵县', '430225');
INSERT INTO `kl_area` VALUES ('2227', '281', null, '道县', '431124');
INSERT INTO `kl_area` VALUES ('2228', '272', null, '醴陵市', '430281');
INSERT INTO `kl_area` VALUES ('2229', '281', null, '江永县', '431125');
INSERT INTO `kl_area` VALUES ('2230', '281', null, '宁远县', '431126');
INSERT INTO `kl_area` VALUES ('2231', '281', null, '蓝山县', '431127');
INSERT INTO `kl_area` VALUES ('2232', '281', null, '新田县', '431128');
INSERT INTO `kl_area` VALUES ('2233', '281', null, '江华瑶族自治县', '431129');
INSERT INTO `kl_area` VALUES ('2234', '273', null, '市辖区', '430301');
INSERT INTO `kl_area` VALUES ('2235', '273', null, '雨湖区', '430302');
INSERT INTO `kl_area` VALUES ('2236', '273', null, '岳塘区', '430304');
INSERT INTO `kl_area` VALUES ('2237', '273', null, '湘潭县', '430321');
INSERT INTO `kl_area` VALUES ('2238', '273', null, '湘乡市', '430381');
INSERT INTO `kl_area` VALUES ('2239', '283', null, '市辖区', '431201');
INSERT INTO `kl_area` VALUES ('2240', '273', null, '韶山市', '430382');
INSERT INTO `kl_area` VALUES ('2241', '283', null, '鹤城区', '431202');
INSERT INTO `kl_area` VALUES ('2242', '283', null, '中方县', '431221');
INSERT INTO `kl_area` VALUES ('2243', '283', null, '沅陵县', '431222');
INSERT INTO `kl_area` VALUES ('2244', '283', null, '辰溪县', '431223');
INSERT INTO `kl_area` VALUES ('2245', '283', null, '溆浦县', '431224');
INSERT INTO `kl_area` VALUES ('2246', '283', null, '会同县', '431225');
INSERT INTO `kl_area` VALUES ('2247', '283', null, '麻阳苗族自治县', '431226');
INSERT INTO `kl_area` VALUES ('2248', '283', null, '新晃侗族自治县', '431227');
INSERT INTO `kl_area` VALUES ('2249', '283', null, '芷江侗族自治县', '431228');
INSERT INTO `kl_area` VALUES ('2250', '283', null, '靖州苗族侗族自治县', '431229');
INSERT INTO `kl_area` VALUES ('2251', '283', null, '通道侗族自治县', '431230');
INSERT INTO `kl_area` VALUES ('2252', '283', null, '洪江市', '431281');
INSERT INTO `kl_area` VALUES ('2253', '274', null, '市辖区', '430401');
INSERT INTO `kl_area` VALUES ('2254', '274', null, '珠晖区', '430405');
INSERT INTO `kl_area` VALUES ('2255', '274', null, '雁峰区', '430406');
INSERT INTO `kl_area` VALUES ('2256', '274', null, '石鼓区', '430407');
INSERT INTO `kl_area` VALUES ('2257', '274', null, '蒸湘区', '430408');
INSERT INTO `kl_area` VALUES ('2258', '274', null, '南岳区', '430412');
INSERT INTO `kl_area` VALUES ('2259', '274', null, '衡阳县', '430421');
INSERT INTO `kl_area` VALUES ('2260', '274', null, '衡南县', '430422');
INSERT INTO `kl_area` VALUES ('2261', '274', null, '衡山县', '430423');
INSERT INTO `kl_area` VALUES ('2262', '274', null, '衡东县', '430424');
INSERT INTO `kl_area` VALUES ('2263', '274', null, '祁东县', '430426');
INSERT INTO `kl_area` VALUES ('2264', '274', null, '耒阳市', '430481');
INSERT INTO `kl_area` VALUES ('2265', '274', null, '常宁市', '430482');
INSERT INTO `kl_area` VALUES ('2266', '286', null, '市辖区', '431301');
INSERT INTO `kl_area` VALUES ('2267', '286', null, '娄星区', '431302');
INSERT INTO `kl_area` VALUES ('2268', '286', null, '双峰县', '431321');
INSERT INTO `kl_area` VALUES ('2269', '286', null, '新化县', '431322');
INSERT INTO `kl_area` VALUES ('2270', '286', null, '冷水江市', '431381');
INSERT INTO `kl_area` VALUES ('2271', '286', null, '涟源市', '431382');
INSERT INTO `kl_area` VALUES ('2272', '275', null, '市辖区', '430501');
INSERT INTO `kl_area` VALUES ('2273', '275', null, '双清区', '430502');
INSERT INTO `kl_area` VALUES ('2274', '275', null, '大祥区', '430503');
INSERT INTO `kl_area` VALUES ('2275', '275', null, '北塔区', '430511');
INSERT INTO `kl_area` VALUES ('2276', '275', null, '邵东县', '430521');
INSERT INTO `kl_area` VALUES ('2277', '275', null, '新邵县', '430522');
INSERT INTO `kl_area` VALUES ('2278', '275', null, '邵阳县', '430523');
INSERT INTO `kl_area` VALUES ('2279', '289', null, '吉首市', '433101');
INSERT INTO `kl_area` VALUES ('2280', '275', null, '隆回县', '430524');
INSERT INTO `kl_area` VALUES ('2281', '289', null, '泸溪县', '433122');
INSERT INTO `kl_area` VALUES ('2282', '275', null, '洞口县', '430525');
INSERT INTO `kl_area` VALUES ('2283', '289', null, '凤凰县', '433123');
INSERT INTO `kl_area` VALUES ('2284', '275', null, '绥宁县', '430527');
INSERT INTO `kl_area` VALUES ('2285', '289', null, '花垣县', '433124');
INSERT INTO `kl_area` VALUES ('2286', '275', null, '新宁县', '430528');
INSERT INTO `kl_area` VALUES ('2287', '289', null, '保靖县', '433125');
INSERT INTO `kl_area` VALUES ('2288', '275', null, '城步苗族自治县', '430529');
INSERT INTO `kl_area` VALUES ('2289', '289', null, '古丈县', '433126');
INSERT INTO `kl_area` VALUES ('2290', '275', null, '武冈市', '430581');
INSERT INTO `kl_area` VALUES ('2291', '289', null, '永顺县', '433127');
INSERT INTO `kl_area` VALUES ('2292', '289', null, '龙山县', '433130');
INSERT INTO `kl_area` VALUES ('2293', '302', null, '市辖区', '440101');
INSERT INTO `kl_area` VALUES ('2294', '302', null, '荔湾区', '440103');
INSERT INTO `kl_area` VALUES ('2295', '302', null, '越秀区', '440104');
INSERT INTO `kl_area` VALUES ('2296', '302', null, '海珠区', '440105');
INSERT INTO `kl_area` VALUES ('2297', '302', null, '天河区', '440106');
INSERT INTO `kl_area` VALUES ('2298', '302', null, '白云区', '440111');
INSERT INTO `kl_area` VALUES ('2299', '302', null, '黄埔区', '440112');
INSERT INTO `kl_area` VALUES ('2300', '302', null, '番禺区', '440113');
INSERT INTO `kl_area` VALUES ('2301', '302', null, '花都区', '440114');
INSERT INTO `kl_area` VALUES ('2302', '302', null, '南沙区', '440115');
INSERT INTO `kl_area` VALUES ('2303', '302', null, '萝岗区', '440116');
INSERT INTO `kl_area` VALUES ('2304', '302', null, '增城市', '440183');
INSERT INTO `kl_area` VALUES ('2305', '302', null, '从化市', '440184');
INSERT INTO `kl_area` VALUES ('2306', '304', null, '市辖区', '440201');
INSERT INTO `kl_area` VALUES ('2307', '304', null, '武江区', '440203');
INSERT INTO `kl_area` VALUES ('2308', '304', null, '浈江区', '440204');
INSERT INTO `kl_area` VALUES ('2309', '304', null, '曲江区', '440205');
INSERT INTO `kl_area` VALUES ('2310', '304', null, '始兴县', '440222');
INSERT INTO `kl_area` VALUES ('2311', '304', null, '仁化县', '440224');
INSERT INTO `kl_area` VALUES ('2312', '304', null, '翁源县', '440229');
INSERT INTO `kl_area` VALUES ('2313', '304', null, '乳源瑶族自治县', '440232');
INSERT INTO `kl_area` VALUES ('2314', '304', null, '新丰县', '440233');
INSERT INTO `kl_area` VALUES ('2315', '304', null, '乐昌市', '440281');
INSERT INTO `kl_area` VALUES ('2316', '304', null, '南雄市', '440282');
INSERT INTO `kl_area` VALUES ('2317', '329', null, '市辖区', '441401');
INSERT INTO `kl_area` VALUES ('2318', '329', null, '梅江区', '441402');
INSERT INTO `kl_area` VALUES ('2319', '329', null, '梅县', '441421');
INSERT INTO `kl_area` VALUES ('2320', '329', null, '大埔县', '441422');
INSERT INTO `kl_area` VALUES ('2321', '329', null, '丰顺县', '441423');
INSERT INTO `kl_area` VALUES ('2322', '329', null, '五华县', '441424');
INSERT INTO `kl_area` VALUES ('2323', '329', null, '平远县', '441426');
INSERT INTO `kl_area` VALUES ('2324', '329', null, '蕉岭县', '441427');
INSERT INTO `kl_area` VALUES ('2325', '329', null, '兴宁市', '441481');
INSERT INTO `kl_area` VALUES ('2326', '306', null, '市辖区', '440301');
INSERT INTO `kl_area` VALUES ('2327', '306', null, '罗湖区', '440303');
INSERT INTO `kl_area` VALUES ('2328', '306', null, '福田区', '440304');
INSERT INTO `kl_area` VALUES ('2329', '306', null, '南山区', '440305');
INSERT INTO `kl_area` VALUES ('2330', '306', null, '宝安区', '440306');
INSERT INTO `kl_area` VALUES ('2331', '306', null, '龙岗区', '440307');
INSERT INTO `kl_area` VALUES ('2332', '306', null, '盐田区', '440308');
INSERT INTO `kl_area` VALUES ('2333', '347', null, '市辖区', '450101');
INSERT INTO `kl_area` VALUES ('2334', '347', null, '兴宁区', '450102');
INSERT INTO `kl_area` VALUES ('2335', '347', null, '青秀区', '450103');
INSERT INTO `kl_area` VALUES ('2336', '347', null, '江南区', '450105');
INSERT INTO `kl_area` VALUES ('2337', '347', null, '西乡塘区', '450107');
INSERT INTO `kl_area` VALUES ('2338', '347', null, '良庆区', '450108');
INSERT INTO `kl_area` VALUES ('2339', '347', null, '邕宁区', '450109');
INSERT INTO `kl_area` VALUES ('2340', '347', null, '武鸣县', '450122');
INSERT INTO `kl_area` VALUES ('2341', '347', null, '隆安县', '450123');
INSERT INTO `kl_area` VALUES ('2342', '347', null, '马山县', '450124');
INSERT INTO `kl_area` VALUES ('2343', '332', null, '市辖区', '441501');
INSERT INTO `kl_area` VALUES ('2344', '347', null, '上林县', '450125');
INSERT INTO `kl_area` VALUES ('2345', '332', null, '城区', '441502');
INSERT INTO `kl_area` VALUES ('2346', '347', null, '宾阳县', '450126');
INSERT INTO `kl_area` VALUES ('2347', '332', null, '海丰县', '441521');
INSERT INTO `kl_area` VALUES ('2348', '347', null, '横县', '450127');
INSERT INTO `kl_area` VALUES ('2349', '332', null, '陆河县', '441523');
INSERT INTO `kl_area` VALUES ('2350', '332', null, '陆丰市', '441581');
INSERT INTO `kl_area` VALUES ('2351', '308', null, '市辖区', '440401');
INSERT INTO `kl_area` VALUES ('2352', '308', null, '香洲区', '440402');
INSERT INTO `kl_area` VALUES ('2353', '308', null, '斗门区', '440403');
INSERT INTO `kl_area` VALUES ('2354', '308', null, '金湾区', '440404');
INSERT INTO `kl_area` VALUES ('2355', '349', null, '市辖区', '450201');
INSERT INTO `kl_area` VALUES ('2356', '334', null, '市辖区', '441601');
INSERT INTO `kl_area` VALUES ('2357', '349', null, '城中区', '450202');
INSERT INTO `kl_area` VALUES ('2358', '334', null, '源城区', '441602');
INSERT INTO `kl_area` VALUES ('2359', '349', null, '鱼峰区', '450203');
INSERT INTO `kl_area` VALUES ('2360', '334', null, '紫金县', '441621');
INSERT INTO `kl_area` VALUES ('2361', '349', null, '柳南区', '450204');
INSERT INTO `kl_area` VALUES ('2362', '334', null, '龙川县', '441622');
INSERT INTO `kl_area` VALUES ('2363', '349', null, '柳北区', '450205');
INSERT INTO `kl_area` VALUES ('2364', '334', null, '连平县', '441623');
INSERT INTO `kl_area` VALUES ('2365', '349', null, '柳江县', '450221');
INSERT INTO `kl_area` VALUES ('2366', '334', null, '和平县', '441624');
INSERT INTO `kl_area` VALUES ('2367', '310', null, '市辖区', '440501');
INSERT INTO `kl_area` VALUES ('2368', '349', null, '柳城县', '450222');
INSERT INTO `kl_area` VALUES ('2369', '334', null, '东源县', '441625');
INSERT INTO `kl_area` VALUES ('2370', '310', null, '龙湖区', '440507');
INSERT INTO `kl_area` VALUES ('2371', '349', null, '鹿寨县', '450223');
INSERT INTO `kl_area` VALUES ('2372', '310', null, '金平区', '440511');
INSERT INTO `kl_area` VALUES ('2373', '349', null, '融安县', '450224');
INSERT INTO `kl_area` VALUES ('2374', '310', null, '濠江区', '440512');
INSERT INTO `kl_area` VALUES ('2375', '349', null, '融水苗族自治县', '450225');
INSERT INTO `kl_area` VALUES ('2376', '310', null, '潮阳区', '440513');
INSERT INTO `kl_area` VALUES ('2377', '349', null, '三江侗族自治县', '450226');
INSERT INTO `kl_area` VALUES ('2378', '310', null, '潮南区', '440514');
INSERT INTO `kl_area` VALUES ('2379', '310', null, '澄海区', '440515');
INSERT INTO `kl_area` VALUES ('2380', '310', null, '南澳县', '440523');
INSERT INTO `kl_area` VALUES ('2381', '336', null, '市辖区', '441701');
INSERT INTO `kl_area` VALUES ('2382', '336', null, '江城区', '441702');
INSERT INTO `kl_area` VALUES ('2383', '336', null, '阳西县', '441721');
INSERT INTO `kl_area` VALUES ('2384', '336', null, '阳东县', '441723');
INSERT INTO `kl_area` VALUES ('2385', '336', null, '阳春市', '441781');
INSERT INTO `kl_area` VALUES ('2386', '350', null, '市辖区', '450301');
INSERT INTO `kl_area` VALUES ('2387', '350', null, '秀峰区', '450302');
INSERT INTO `kl_area` VALUES ('2388', '350', null, '叠彩区', '450303');
INSERT INTO `kl_area` VALUES ('2389', '312', null, '市辖区', '440601');
INSERT INTO `kl_area` VALUES ('2390', '350', null, '象山区', '450304');
INSERT INTO `kl_area` VALUES ('2391', '312', null, '禅城区', '440604');
INSERT INTO `kl_area` VALUES ('2392', '350', null, '七星区', '450305');
INSERT INTO `kl_area` VALUES ('2393', '312', null, '南海区', '440605');
INSERT INTO `kl_area` VALUES ('2394', '350', null, '雁山区', '450311');
INSERT INTO `kl_area` VALUES ('2395', '312', null, '顺德区', '440606');
INSERT INTO `kl_area` VALUES ('2396', '350', null, '临桂区', '450312');
INSERT INTO `kl_area` VALUES ('2397', '312', null, '三水区', '440607');
INSERT INTO `kl_area` VALUES ('2398', '350', null, '阳朔县', '450321');
INSERT INTO `kl_area` VALUES ('2399', '312', null, '高明区', '440608');
INSERT INTO `kl_area` VALUES ('2400', '350', null, '灵川县', '450323');
INSERT INTO `kl_area` VALUES ('2401', '350', null, '全州县', '450324');
INSERT INTO `kl_area` VALUES ('2402', '350', null, '兴安县', '450325');
INSERT INTO `kl_area` VALUES ('2403', '350', null, '永福县', '450326');
INSERT INTO `kl_area` VALUES ('2404', '350', null, '灌阳县', '450327');
INSERT INTO `kl_area` VALUES ('2405', '350', null, '龙胜各族自治县', '450328');
INSERT INTO `kl_area` VALUES ('2406', '350', null, '资源县', '450329');
INSERT INTO `kl_area` VALUES ('2407', '350', null, '平乐县', '450330');
INSERT INTO `kl_area` VALUES ('2408', '350', null, '荔浦县', '450331');
INSERT INTO `kl_area` VALUES ('2409', '337', null, '市辖区', '441801');
INSERT INTO `kl_area` VALUES ('2410', '350', null, '恭城瑶族自治县', '450332');
INSERT INTO `kl_area` VALUES ('2411', '337', null, '清城区', '441802');
INSERT INTO `kl_area` VALUES ('2412', '337', null, '清新区', '441803');
INSERT INTO `kl_area` VALUES ('2413', '337', null, '佛冈县', '441821');
INSERT INTO `kl_area` VALUES ('2414', '337', null, '阳山县', '441823');
INSERT INTO `kl_area` VALUES ('2415', '337', null, '连山壮族瑶族自治县', '441825');
INSERT INTO `kl_area` VALUES ('2416', '337', null, '连南瑶族自治县', '441826');
INSERT INTO `kl_area` VALUES ('2417', '337', null, '英德市', '441881');
INSERT INTO `kl_area` VALUES ('2418', '337', null, '连州市', '441882');
INSERT INTO `kl_area` VALUES ('2419', '314', null, '市辖区', '440701');
INSERT INTO `kl_area` VALUES ('2420', '314', null, '蓬江区', '440703');
INSERT INTO `kl_area` VALUES ('2421', '314', null, '江海区', '440704');
INSERT INTO `kl_area` VALUES ('2422', '314', null, '新会区', '440705');
INSERT INTO `kl_area` VALUES ('2423', '314', null, '台山市', '440781');
INSERT INTO `kl_area` VALUES ('2424', '314', null, '开平市', '440783');
INSERT INTO `kl_area` VALUES ('2425', '314', null, '鹤山市', '440784');
INSERT INTO `kl_area` VALUES ('2426', '314', null, '恩平市', '440785');
INSERT INTO `kl_area` VALUES ('2427', '351', null, '市辖区', '450401');
INSERT INTO `kl_area` VALUES ('2428', '351', null, '万秀区', '450403');
INSERT INTO `kl_area` VALUES ('2429', '351', null, '长洲区', '450405');
INSERT INTO `kl_area` VALUES ('2430', '351', null, '龙圩区', '450406');
INSERT INTO `kl_area` VALUES ('2431', '351', null, '苍梧县', '450421');
INSERT INTO `kl_area` VALUES ('2432', '351', null, '藤县', '450422');
INSERT INTO `kl_area` VALUES ('2433', '351', null, '蒙山县', '450423');
INSERT INTO `kl_area` VALUES ('2434', '351', null, '岑溪市', '450481');
INSERT INTO `kl_area` VALUES ('2435', '317', null, '市辖区', '440801');
INSERT INTO `kl_area` VALUES ('2436', '317', null, '赤坎区', '440802');
INSERT INTO `kl_area` VALUES ('2437', '317', null, '霞山区', '440803');
INSERT INTO `kl_area` VALUES ('2438', '317', null, '坡头区', '440804');
INSERT INTO `kl_area` VALUES ('2439', '317', null, '麻章区', '440811');
INSERT INTO `kl_area` VALUES ('2440', '317', null, '遂溪县', '440823');
INSERT INTO `kl_area` VALUES ('2441', '317', null, '徐闻县', '440825');
INSERT INTO `kl_area` VALUES ('2442', '317', null, '廉江市', '440881');
INSERT INTO `kl_area` VALUES ('2443', '317', null, '雷州市', '440882');
INSERT INTO `kl_area` VALUES ('2444', '317', null, '吴川市', '440883');
INSERT INTO `kl_area` VALUES ('2445', '352', null, '市辖区', '450501');
INSERT INTO `kl_area` VALUES ('2446', '352', null, '海城区', '450502');
INSERT INTO `kl_area` VALUES ('2447', '352', null, '银海区', '450503');
INSERT INTO `kl_area` VALUES ('2448', '352', null, '铁山港区', '450512');
INSERT INTO `kl_area` VALUES ('2449', '352', null, '合浦县', '450521');
INSERT INTO `kl_area` VALUES ('2450', '340', null, '市辖区', '445101');
INSERT INTO `kl_area` VALUES ('2451', '320', null, '市辖区', '440901');
INSERT INTO `kl_area` VALUES ('2452', '340', null, '湘桥区', '445102');
INSERT INTO `kl_area` VALUES ('2453', '320', null, '茂南区', '440902');
INSERT INTO `kl_area` VALUES ('2454', '340', null, '潮安区', '445103');
INSERT INTO `kl_area` VALUES ('2455', '320', null, '茂港区', '440903');
INSERT INTO `kl_area` VALUES ('2456', '340', null, '饶平县', '445122');
INSERT INTO `kl_area` VALUES ('2457', '353', null, '市辖区', '450601');
INSERT INTO `kl_area` VALUES ('2458', '320', null, '电白县', '440923');
INSERT INTO `kl_area` VALUES ('2459', '353', null, '港口区', '450602');
INSERT INTO `kl_area` VALUES ('2460', '320', null, '高州市', '440981');
INSERT INTO `kl_area` VALUES ('2461', '353', null, '防城区', '450603');
INSERT INTO `kl_area` VALUES ('2462', '320', null, '化州市', '440982');
INSERT INTO `kl_area` VALUES ('2463', '353', null, '上思县', '450621');
INSERT INTO `kl_area` VALUES ('2464', '320', null, '信宜市', '440983');
INSERT INTO `kl_area` VALUES ('2465', '353', null, '东兴市', '450681');
INSERT INTO `kl_area` VALUES ('2466', '341', null, '市辖区', '445201');
INSERT INTO `kl_area` VALUES ('2467', '341', null, '榕城区', '445202');
INSERT INTO `kl_area` VALUES ('2468', '341', null, '揭东区', '445203');
INSERT INTO `kl_area` VALUES ('2469', '341', null, '揭西县', '445222');
INSERT INTO `kl_area` VALUES ('2470', '341', null, '惠来县', '445224');
INSERT INTO `kl_area` VALUES ('2471', '341', null, '普宁市', '445281');
INSERT INTO `kl_area` VALUES ('2472', '323', null, '市辖区', '441201');
INSERT INTO `kl_area` VALUES ('2473', '323', null, '端州区', '441202');
INSERT INTO `kl_area` VALUES ('2474', '355', null, '市辖区', '450701');
INSERT INTO `kl_area` VALUES ('2475', '323', null, '鼎湖区', '441203');
INSERT INTO `kl_area` VALUES ('2476', '355', null, '钦南区', '450702');
INSERT INTO `kl_area` VALUES ('2477', '323', null, '广宁县', '441223');
INSERT INTO `kl_area` VALUES ('2478', '355', null, '钦北区', '450703');
INSERT INTO `kl_area` VALUES ('2479', '323', null, '怀集县', '441224');
INSERT INTO `kl_area` VALUES ('2480', '355', null, '灵山县', '450721');
INSERT INTO `kl_area` VALUES ('2481', '323', null, '封开县', '441225');
INSERT INTO `kl_area` VALUES ('2482', '355', null, '浦北县', '450722');
INSERT INTO `kl_area` VALUES ('2483', '323', null, '德庆县', '441226');
INSERT INTO `kl_area` VALUES ('2484', '323', null, '高要市', '441283');
INSERT INTO `kl_area` VALUES ('2485', '323', null, '四会市', '441284');
INSERT INTO `kl_area` VALUES ('2486', '342', null, '市辖区', '445301');
INSERT INTO `kl_area` VALUES ('2487', '342', null, '云城区', '445302');
INSERT INTO `kl_area` VALUES ('2488', '342', null, '新兴县', '445321');
INSERT INTO `kl_area` VALUES ('2489', '342', null, '郁南县', '445322');
INSERT INTO `kl_area` VALUES ('2490', '342', null, '云安县', '445323');
INSERT INTO `kl_area` VALUES ('2491', '342', null, '罗定市', '445381');
INSERT INTO `kl_area` VALUES ('2492', '357', null, '市辖区', '450801');
INSERT INTO `kl_area` VALUES ('2493', '357', null, '港北区', '450802');
INSERT INTO `kl_area` VALUES ('2494', '326', null, '市辖区', '441301');
INSERT INTO `kl_area` VALUES ('2495', '357', null, '港南区', '450803');
INSERT INTO `kl_area` VALUES ('2496', '326', null, '惠城区', '441302');
INSERT INTO `kl_area` VALUES ('2497', '357', null, '覃塘区', '450804');
INSERT INTO `kl_area` VALUES ('2498', '326', null, '惠阳区', '441303');
INSERT INTO `kl_area` VALUES ('2499', '357', null, '平南县', '450821');
INSERT INTO `kl_area` VALUES ('2500', '326', null, '博罗县', '441322');
INSERT INTO `kl_area` VALUES ('2501', '357', null, '桂平市', '450881');
INSERT INTO `kl_area` VALUES ('2502', '326', null, '惠东县', '441323');
INSERT INTO `kl_area` VALUES ('2503', '326', null, '龙门县', '441324');
INSERT INTO `kl_area` VALUES ('2504', '363', null, '市辖区', '451101');
INSERT INTO `kl_area` VALUES ('2505', '363', null, '八步区', '451102');
INSERT INTO `kl_area` VALUES ('2506', '363', null, '昭平县', '451121');
INSERT INTO `kl_area` VALUES ('2507', '363', null, '钟山县', '451122');
INSERT INTO `kl_area` VALUES ('2508', '363', null, '富川瑶族自治县', '451123');
INSERT INTO `kl_area` VALUES ('2509', '359', null, '市辖区', '450901');
INSERT INTO `kl_area` VALUES ('2510', '359', null, '玉州区', '450902');
INSERT INTO `kl_area` VALUES ('2511', '359', null, '福绵区', '450903');
INSERT INTO `kl_area` VALUES ('2512', '359', null, '容县', '450921');
INSERT INTO `kl_area` VALUES ('2513', '359', null, '陆川县', '450922');
INSERT INTO `kl_area` VALUES ('2514', '359', null, '博白县', '450923');
INSERT INTO `kl_area` VALUES ('2515', '359', null, '兴业县', '450924');
INSERT INTO `kl_area` VALUES ('2516', '359', null, '北流市', '450981');
INSERT INTO `kl_area` VALUES ('2517', '82', null, '市辖区', '510101');
INSERT INTO `kl_area` VALUES ('2518', '82', null, '锦江区', '510104');
INSERT INTO `kl_area` VALUES ('2519', '82', null, '青羊区', '510105');
INSERT INTO `kl_area` VALUES ('2520', '82', null, '金牛区', '510106');
INSERT INTO `kl_area` VALUES ('2521', '82', null, '武侯区', '510107');
INSERT INTO `kl_area` VALUES ('2522', '365', null, '市辖区', '451201');
INSERT INTO `kl_area` VALUES ('2523', '82', null, '成华区', '510108');
INSERT INTO `kl_area` VALUES ('2524', '365', null, '金城江区', '451202');
INSERT INTO `kl_area` VALUES ('2525', '82', null, '龙泉驿区', '510112');
INSERT INTO `kl_area` VALUES ('2526', '365', null, '南丹县', '451221');
INSERT INTO `kl_area` VALUES ('2527', '82', null, '青白江区', '510113');
INSERT INTO `kl_area` VALUES ('2528', '365', null, '天峨县', '451222');
INSERT INTO `kl_area` VALUES ('2529', '82', null, '新都区', '510114');
INSERT INTO `kl_area` VALUES ('2530', '365', null, '凤山县', '451223');
INSERT INTO `kl_area` VALUES ('2531', '82', null, '温江区', '510115');
INSERT INTO `kl_area` VALUES ('2532', '365', null, '东兰县', '451224');
INSERT INTO `kl_area` VALUES ('2533', '82', null, '金堂县', '510121');
INSERT INTO `kl_area` VALUES ('2534', '361', null, '市辖区', '451001');
INSERT INTO `kl_area` VALUES ('2535', '365', null, '罗城仫佬族自治县', '451225');
INSERT INTO `kl_area` VALUES ('2536', '82', null, '双流县', '510122');
INSERT INTO `kl_area` VALUES ('2537', '361', null, '右江区', '451002');
INSERT INTO `kl_area` VALUES ('2538', '365', null, '环江毛南族自治县', '451226');
INSERT INTO `kl_area` VALUES ('2539', '82', null, '郫县', '510124');
INSERT INTO `kl_area` VALUES ('2540', '361', null, '田阳县', '451021');
INSERT INTO `kl_area` VALUES ('2541', '365', null, '巴马瑶族自治县', '451227');
INSERT INTO `kl_area` VALUES ('2542', '82', null, '大邑县', '510129');
INSERT INTO `kl_area` VALUES ('2543', '361', null, '田东县', '451022');
INSERT INTO `kl_area` VALUES ('2544', '365', null, '都安瑶族自治县', '451228');
INSERT INTO `kl_area` VALUES ('2545', '82', null, '蒲江县', '510131');
INSERT INTO `kl_area` VALUES ('2546', '361', null, '平果县', '451023');
INSERT INTO `kl_area` VALUES ('2547', '365', null, '大化瑶族自治县', '451229');
INSERT INTO `kl_area` VALUES ('2548', '361', null, '德保县', '451024');
INSERT INTO `kl_area` VALUES ('2549', '82', null, '新津县', '510132');
INSERT INTO `kl_area` VALUES ('2550', '365', null, '宜州市', '451281');
INSERT INTO `kl_area` VALUES ('2551', '82', null, '都江堰市', '510181');
INSERT INTO `kl_area` VALUES ('2552', '361', null, '靖西县', '451025');
INSERT INTO `kl_area` VALUES ('2553', '82', null, '彭州市', '510182');
INSERT INTO `kl_area` VALUES ('2554', '361', null, '那坡县', '451026');
INSERT INTO `kl_area` VALUES ('2555', '82', null, '邛崃市', '510183');
INSERT INTO `kl_area` VALUES ('2556', '361', null, '凌云县', '451027');
INSERT INTO `kl_area` VALUES ('2557', '82', null, '崇州市', '510184');
INSERT INTO `kl_area` VALUES ('2558', '361', null, '乐业县', '451028');
INSERT INTO `kl_area` VALUES ('2559', '361', null, '田林县', '451029');
INSERT INTO `kl_area` VALUES ('2560', '361', null, '西林县', '451030');
INSERT INTO `kl_area` VALUES ('2561', '361', null, '隆林各族自治县', '451031');
INSERT INTO `kl_area` VALUES ('2562', '367', null, '市辖区', '451301');
INSERT INTO `kl_area` VALUES ('2563', '367', null, '兴宾区', '451302');
INSERT INTO `kl_area` VALUES ('2564', '367', null, '忻城县', '451321');
INSERT INTO `kl_area` VALUES ('2565', '367', null, '象州县', '451322');
INSERT INTO `kl_area` VALUES ('2566', '367', null, '武宣县', '451323');
INSERT INTO `kl_area` VALUES ('2567', '85', null, '市辖区', '510301');
INSERT INTO `kl_area` VALUES ('2568', '367', null, '金秀瑶族自治县', '451324');
INSERT INTO `kl_area` VALUES ('2569', '85', null, '自流井区', '510302');
INSERT INTO `kl_area` VALUES ('2570', '367', null, '合山市', '451381');
INSERT INTO `kl_area` VALUES ('2571', '85', null, '贡井区', '510303');
INSERT INTO `kl_area` VALUES ('2572', '85', null, '大安区', '510304');
INSERT INTO `kl_area` VALUES ('2573', '85', null, '沿滩区', '510311');
INSERT INTO `kl_area` VALUES ('2574', '85', null, '荣县', '510321');
INSERT INTO `kl_area` VALUES ('2575', '85', null, '富顺县', '510322');
INSERT INTO `kl_area` VALUES ('2576', '369', null, '市辖区', '451401');
INSERT INTO `kl_area` VALUES ('2577', '369', null, '江州区', '451402');
INSERT INTO `kl_area` VALUES ('2578', '369', null, '扶绥县', '451421');
INSERT INTO `kl_area` VALUES ('2579', '369', null, '宁明县', '451422');
INSERT INTO `kl_area` VALUES ('2580', '369', null, '龙州县', '451423');
INSERT INTO `kl_area` VALUES ('2581', '87', null, '市辖区', '510401');
INSERT INTO `kl_area` VALUES ('2582', '369', null, '大新县', '451424');
INSERT INTO `kl_area` VALUES ('2583', '87', null, '东区', '510402');
INSERT INTO `kl_area` VALUES ('2584', '369', null, '天等县', '451425');
INSERT INTO `kl_area` VALUES ('2585', '87', null, '西区', '510403');
INSERT INTO `kl_area` VALUES ('2586', '369', null, '凭祥市', '451481');
INSERT INTO `kl_area` VALUES ('2587', '87', null, '仁和区', '510411');
INSERT INTO `kl_area` VALUES ('2588', '87', null, '米易县', '510421');
INSERT INTO `kl_area` VALUES ('2589', '87', null, '盐边县', '510422');
INSERT INTO `kl_area` VALUES ('2590', '47', null, '市辖区', '460101');
INSERT INTO `kl_area` VALUES ('2591', '47', null, '秀英区', '460105');
INSERT INTO `kl_area` VALUES ('2592', '47', null, '龙华区', '460106');
INSERT INTO `kl_area` VALUES ('2593', '47', null, '琼山区', '460107');
INSERT INTO `kl_area` VALUES ('2594', '47', null, '美兰区', '460108');
INSERT INTO `kl_area` VALUES ('2595', '90', null, '市辖区', '510501');
INSERT INTO `kl_area` VALUES ('2596', '90', null, '江阳区', '510502');
INSERT INTO `kl_area` VALUES ('2597', '90', null, '纳溪区', '510503');
INSERT INTO `kl_area` VALUES ('2598', '90', null, '龙马潭区', '510504');
INSERT INTO `kl_area` VALUES ('2599', '90', null, '泸县', '510521');
INSERT INTO `kl_area` VALUES ('2600', '90', null, '合江县', '510522');
INSERT INTO `kl_area` VALUES ('2601', '90', null, '叙永县', '510524');
INSERT INTO `kl_area` VALUES ('2602', '90', null, '古蔺县', '510525');
INSERT INTO `kl_area` VALUES ('2603', '48', null, '市辖区', '460201');
INSERT INTO `kl_area` VALUES ('2604', '93', null, '市辖区', '510601');
INSERT INTO `kl_area` VALUES ('2605', '93', null, '旌阳区', '510603');
INSERT INTO `kl_area` VALUES ('2606', '93', null, '中江县', '510623');
INSERT INTO `kl_area` VALUES ('2607', '93', null, '罗江县', '510626');
INSERT INTO `kl_area` VALUES ('2608', '93', null, '广汉市', '510681');
INSERT INTO `kl_area` VALUES ('2609', '93', null, '什邡市', '510682');
INSERT INTO `kl_area` VALUES ('2610', '93', null, '绵竹市', '510683');
INSERT INTO `kl_area` VALUES ('2611', '49', null, '西沙群岛', '460321');
INSERT INTO `kl_area` VALUES ('2612', '49', null, '南沙群岛', '460322');
INSERT INTO `kl_area` VALUES ('2613', '49', null, '中沙群岛的岛礁及其海域', '460323');
INSERT INTO `kl_area` VALUES ('2614', '96', null, '市辖区', '510701');
INSERT INTO `kl_area` VALUES ('2615', '96', null, '涪城区', '510703');
INSERT INTO `kl_area` VALUES ('2616', '96', null, '游仙区', '510704');
INSERT INTO `kl_area` VALUES ('2617', '50', null, '五指山市', '469001');
INSERT INTO `kl_area` VALUES ('2618', '96', null, '三台县', '510722');
INSERT INTO `kl_area` VALUES ('2619', '50', null, '琼海市', '469002');
INSERT INTO `kl_area` VALUES ('2620', '96', null, '盐亭县', '510723');
INSERT INTO `kl_area` VALUES ('2621', '50', null, '儋州市', '469003');
INSERT INTO `kl_area` VALUES ('2622', '96', null, '安县', '510724');
INSERT INTO `kl_area` VALUES ('2623', '50', null, '文昌市', '469005');
INSERT INTO `kl_area` VALUES ('2624', '96', null, '梓潼县', '510725');
INSERT INTO `kl_area` VALUES ('2625', '50', null, '万宁市', '469006');
INSERT INTO `kl_area` VALUES ('2626', '96', null, '北川羌族自治县', '510726');
INSERT INTO `kl_area` VALUES ('2627', '50', null, '东方市', '469007');
INSERT INTO `kl_area` VALUES ('2628', '96', null, '平武县', '510727');
INSERT INTO `kl_area` VALUES ('2629', '50', null, '定安县', '469021');
INSERT INTO `kl_area` VALUES ('2630', '96', null, '江油市', '510781');
INSERT INTO `kl_area` VALUES ('2631', '50', null, '屯昌县', '469022');
INSERT INTO `kl_area` VALUES ('2632', '50', null, '澄迈县', '469023');
INSERT INTO `kl_area` VALUES ('2633', '50', null, '临高县', '469024');
INSERT INTO `kl_area` VALUES ('2634', '50', null, '白沙黎族自治县', '469025');
INSERT INTO `kl_area` VALUES ('2635', '50', null, '昌江黎族自治县', '469026');
INSERT INTO `kl_area` VALUES ('2636', '50', null, '乐东黎族自治县', '469027');
INSERT INTO `kl_area` VALUES ('2637', '50', null, '陵水黎族自治县', '469028');
INSERT INTO `kl_area` VALUES ('2638', '50', null, '保亭黎族苗族自治县', '469029');
INSERT INTO `kl_area` VALUES ('2639', '50', null, '琼中黎族苗族自治县', '469030');
INSERT INTO `kl_area` VALUES ('2640', '99', null, '市辖区', '510801');
INSERT INTO `kl_area` VALUES ('2641', '99', null, '利州区', '510802');
INSERT INTO `kl_area` VALUES ('2642', '99', null, '元坝区', '510811');
INSERT INTO `kl_area` VALUES ('2643', '99', null, '朝天区', '510812');
INSERT INTO `kl_area` VALUES ('2644', '99', null, '旺苍县', '510821');
INSERT INTO `kl_area` VALUES ('2645', '99', null, '青川县', '510822');
INSERT INTO `kl_area` VALUES ('2646', '99', null, '剑阁县', '510823');
INSERT INTO `kl_area` VALUES ('2647', '99', null, '苍溪县', '510824');
INSERT INTO `kl_area` VALUES ('2648', '76', null, '万州区', '500101');
INSERT INTO `kl_area` VALUES ('2649', '76', null, '涪陵区', '500102');
INSERT INTO `kl_area` VALUES ('2650', '76', null, '渝中区', '500103');
INSERT INTO `kl_area` VALUES ('2651', '76', null, '大渡口区', '500104');
INSERT INTO `kl_area` VALUES ('2652', '76', null, '江北区', '500105');
INSERT INTO `kl_area` VALUES ('2653', '76', null, '沙坪坝区', '500106');
INSERT INTO `kl_area` VALUES ('2654', '76', null, '九龙坡区', '500107');
INSERT INTO `kl_area` VALUES ('2655', '76', null, '南岸区', '500108');
INSERT INTO `kl_area` VALUES ('2656', '76', null, '北碚区', '500109');
INSERT INTO `kl_area` VALUES ('2657', '76', null, '綦江区', '500110');
INSERT INTO `kl_area` VALUES ('2658', '76', null, '大足区', '500111');
INSERT INTO `kl_area` VALUES ('2659', '76', null, '渝北区', '500112');
INSERT INTO `kl_area` VALUES ('2660', '76', null, '巴南区', '500113');
INSERT INTO `kl_area` VALUES ('2661', '76', null, '黔江区', '500114');
INSERT INTO `kl_area` VALUES ('2662', '76', null, '长寿区', '500115');
INSERT INTO `kl_area` VALUES ('2663', '76', null, '江津区', '500116');
INSERT INTO `kl_area` VALUES ('2664', '76', null, '合川区', '500117');
INSERT INTO `kl_area` VALUES ('2665', '76', null, '永川区', '500118');
INSERT INTO `kl_area` VALUES ('2666', '76', null, '南川区', '500119');
INSERT INTO `kl_area` VALUES ('2667', '103', null, '市辖区', '510901');
INSERT INTO `kl_area` VALUES ('2668', '103', null, '船山区', '510903');
INSERT INTO `kl_area` VALUES ('2669', '103', null, '安居区', '510904');
INSERT INTO `kl_area` VALUES ('2670', '103', null, '蓬溪县', '510921');
INSERT INTO `kl_area` VALUES ('2671', '103', null, '射洪县', '510922');
INSERT INTO `kl_area` VALUES ('2672', '103', null, '大英县', '510923');
INSERT INTO `kl_area` VALUES ('2673', '78', null, '潼南县', '500223');
INSERT INTO `kl_area` VALUES ('2674', '78', null, '铜梁县', '500224');
INSERT INTO `kl_area` VALUES ('2675', '78', null, '荣昌县', '500226');
INSERT INTO `kl_area` VALUES ('2676', '78', null, '璧山县', '500227');
INSERT INTO `kl_area` VALUES ('2677', '78', null, '梁平县', '500228');
INSERT INTO `kl_area` VALUES ('2678', '78', null, '城口县', '500229');
INSERT INTO `kl_area` VALUES ('2679', '104', null, '市辖区', '511001');
INSERT INTO `kl_area` VALUES ('2680', '78', null, '丰都县', '500230');
INSERT INTO `kl_area` VALUES ('2681', '104', null, '市中区', '511002');
INSERT INTO `kl_area` VALUES ('2682', '78', null, '垫江县', '500231');
INSERT INTO `kl_area` VALUES ('2683', '104', null, '东兴区', '511011');
INSERT INTO `kl_area` VALUES ('2684', '78', null, '武隆县', '500232');
INSERT INTO `kl_area` VALUES ('2685', '78', null, '忠县', '500233');
INSERT INTO `kl_area` VALUES ('2686', '104', null, '威远县', '511024');
INSERT INTO `kl_area` VALUES ('2687', '78', null, '开县', '500234');
INSERT INTO `kl_area` VALUES ('2688', '104', null, '资中县', '511025');
INSERT INTO `kl_area` VALUES ('2689', '78', null, '云阳县', '500235');
INSERT INTO `kl_area` VALUES ('2690', '104', null, '隆昌县', '511028');
INSERT INTO `kl_area` VALUES ('2691', '78', null, '奉节县', '500236');
INSERT INTO `kl_area` VALUES ('2692', '78', null, '巫山县', '500237');
INSERT INTO `kl_area` VALUES ('2693', '78', null, '巫溪县', '500238');
INSERT INTO `kl_area` VALUES ('2694', '78', null, '石柱土家族自治县', '500240');
INSERT INTO `kl_area` VALUES ('2695', '78', null, '秀山土家族苗族自治县', '500241');
INSERT INTO `kl_area` VALUES ('2696', '78', null, '酉阳土家族苗族自治县', '500242');
INSERT INTO `kl_area` VALUES ('2697', '78', null, '彭水苗族土家族自治县', '500243');
INSERT INTO `kl_area` VALUES ('2698', '106', null, '市辖区', '511101');
INSERT INTO `kl_area` VALUES ('2699', '106', null, '市中区', '511102');
INSERT INTO `kl_area` VALUES ('2700', '106', null, '沙湾区', '511111');
INSERT INTO `kl_area` VALUES ('2701', '106', null, '五通桥区', '511112');
INSERT INTO `kl_area` VALUES ('2702', '106', null, '金口河区', '511113');
INSERT INTO `kl_area` VALUES ('2703', '106', null, '犍为县', '511123');
INSERT INTO `kl_area` VALUES ('2704', '106', null, '井研县', '511124');
INSERT INTO `kl_area` VALUES ('2705', '106', null, '夹江县', '511126');
INSERT INTO `kl_area` VALUES ('2706', '106', null, '沐川县', '511129');
INSERT INTO `kl_area` VALUES ('2707', '106', null, '峨边彝族自治县', '511132');
INSERT INTO `kl_area` VALUES ('2708', '106', null, '马边彝族自治县', '511133');
INSERT INTO `kl_area` VALUES ('2709', '106', null, '峨眉山市', '511181');
INSERT INTO `kl_area` VALUES ('2710', '108', null, '市辖区', '511301');
INSERT INTO `kl_area` VALUES ('2711', '108', null, '顺庆区', '511302');
INSERT INTO `kl_area` VALUES ('2712', '108', null, '高坪区', '511303');
INSERT INTO `kl_area` VALUES ('2713', '108', null, '嘉陵区', '511304');
INSERT INTO `kl_area` VALUES ('2714', '108', null, '南部县', '511321');
INSERT INTO `kl_area` VALUES ('2715', '108', null, '营山县', '511322');
INSERT INTO `kl_area` VALUES ('2716', '108', null, '蓬安县', '511323');
INSERT INTO `kl_area` VALUES ('2717', '108', null, '仪陇县', '511324');
INSERT INTO `kl_area` VALUES ('2718', '108', null, '西充县', '511325');
INSERT INTO `kl_area` VALUES ('2719', '108', null, '阆中市', '511381');
INSERT INTO `kl_area` VALUES ('2720', '120', null, '西昌市', '513401');
INSERT INTO `kl_area` VALUES ('2721', '120', null, '木里藏族自治县', '513422');
INSERT INTO `kl_area` VALUES ('2722', '120', null, '盐源县', '513423');
INSERT INTO `kl_area` VALUES ('2723', '120', null, '德昌县', '513424');
INSERT INTO `kl_area` VALUES ('2724', '120', null, '会理县', '513425');
INSERT INTO `kl_area` VALUES ('2725', '120', null, '会东县', '513426');
INSERT INTO `kl_area` VALUES ('2726', '120', null, '宁南县', '513427');
INSERT INTO `kl_area` VALUES ('2727', '120', null, '普格县', '513428');
INSERT INTO `kl_area` VALUES ('2728', '120', null, '布拖县', '513429');
INSERT INTO `kl_area` VALUES ('2729', '120', null, '金阳县', '513430');
INSERT INTO `kl_area` VALUES ('2730', '110', null, '市辖区', '511401');
INSERT INTO `kl_area` VALUES ('2731', '120', null, '昭觉县', '513431');
INSERT INTO `kl_area` VALUES ('2732', '110', null, '东坡区', '511402');
INSERT INTO `kl_area` VALUES ('2733', '120', null, '喜德县', '513432');
INSERT INTO `kl_area` VALUES ('2734', '110', null, '仁寿县', '511421');
INSERT INTO `kl_area` VALUES ('2735', '120', null, '冕宁县', '513433');
INSERT INTO `kl_area` VALUES ('2736', '110', null, '彭山县', '511422');
INSERT INTO `kl_area` VALUES ('2737', '120', null, '越西县', '513434');
INSERT INTO `kl_area` VALUES ('2738', '110', null, '洪雅县', '511423');
INSERT INTO `kl_area` VALUES ('2739', '120', null, '甘洛县', '513435');
INSERT INTO `kl_area` VALUES ('2740', '110', null, '丹棱县', '511424');
INSERT INTO `kl_area` VALUES ('2741', '120', null, '美姑县', '513436');
INSERT INTO `kl_area` VALUES ('2742', '110', null, '青神县', '511425');
INSERT INTO `kl_area` VALUES ('2743', '120', null, '雷波县', '513437');
INSERT INTO `kl_area` VALUES ('2744', '171', null, '市辖区', '530101');
INSERT INTO `kl_area` VALUES ('2745', '171', null, '五华区', '530102');
INSERT INTO `kl_area` VALUES ('2746', '171', null, '盘龙区', '530103');
INSERT INTO `kl_area` VALUES ('2747', '171', null, '官渡区', '530111');
INSERT INTO `kl_area` VALUES ('2748', '171', null, '西山区', '530112');
INSERT INTO `kl_area` VALUES ('2749', '171', null, '东川区', '530113');
INSERT INTO `kl_area` VALUES ('2750', '171', null, '呈贡区', '530114');
INSERT INTO `kl_area` VALUES ('2751', '171', null, '晋宁县', '530122');
INSERT INTO `kl_area` VALUES ('2752', '171', null, '富民县', '530124');
INSERT INTO `kl_area` VALUES ('2753', '171', null, '宜良县', '530125');
INSERT INTO `kl_area` VALUES ('2754', '171', null, '石林彝族自治县', '530126');
INSERT INTO `kl_area` VALUES ('2755', '171', null, '嵩明县', '530127');
INSERT INTO `kl_area` VALUES ('2756', '171', null, '禄劝彝族苗族自治县', '530128');
INSERT INTO `kl_area` VALUES ('2757', '171', null, '寻甸回族彝族自治县', '530129');
INSERT INTO `kl_area` VALUES ('2758', '171', null, '安宁市', '530181');
INSERT INTO `kl_area` VALUES ('2759', '112', null, '市辖区', '511501');
INSERT INTO `kl_area` VALUES ('2760', '139', null, '市辖区', '520101');
INSERT INTO `kl_area` VALUES ('2761', '112', null, '翠屏区', '511502');
INSERT INTO `kl_area` VALUES ('2762', '139', null, '南明区', '520102');
INSERT INTO `kl_area` VALUES ('2763', '112', null, '南溪区', '511503');
INSERT INTO `kl_area` VALUES ('2764', '139', null, '云岩区', '520103');
INSERT INTO `kl_area` VALUES ('2765', '112', null, '宜宾县', '511521');
INSERT INTO `kl_area` VALUES ('2766', '139', null, '花溪区', '520111');
INSERT INTO `kl_area` VALUES ('2767', '112', null, '江安县', '511523');
INSERT INTO `kl_area` VALUES ('2768', '139', null, '乌当区', '520112');
INSERT INTO `kl_area` VALUES ('2769', '112', null, '长宁县', '511524');
INSERT INTO `kl_area` VALUES ('2770', '112', null, '高县', '511525');
INSERT INTO `kl_area` VALUES ('2771', '139', null, '白云区', '520113');
INSERT INTO `kl_area` VALUES ('2772', '112', null, '珙县', '511526');
INSERT INTO `kl_area` VALUES ('2773', '174', null, '市辖区', '530301');
INSERT INTO `kl_area` VALUES ('2774', '139', null, '观山湖区', '520115');
INSERT INTO `kl_area` VALUES ('2775', '112', null, '筠连县', '511527');
INSERT INTO `kl_area` VALUES ('2776', '174', null, '麒麟区', '530302');
INSERT INTO `kl_area` VALUES ('2777', '139', null, '开阳县', '520121');
INSERT INTO `kl_area` VALUES ('2778', '174', null, '马龙县', '530321');
INSERT INTO `kl_area` VALUES ('2779', '112', null, '兴文县', '511528');
INSERT INTO `kl_area` VALUES ('2780', '139', null, '息烽县', '520122');
INSERT INTO `kl_area` VALUES ('2781', '174', null, '陆良县', '530322');
INSERT INTO `kl_area` VALUES ('2782', '112', null, '屏山县', '511529');
INSERT INTO `kl_area` VALUES ('2783', '139', null, '修文县', '520123');
INSERT INTO `kl_area` VALUES ('2784', '174', null, '师宗县', '530323');
INSERT INTO `kl_area` VALUES ('2785', '139', null, '清镇市', '520181');
INSERT INTO `kl_area` VALUES ('2786', '174', null, '罗平县', '530324');
INSERT INTO `kl_area` VALUES ('2787', '174', null, '富源县', '530325');
INSERT INTO `kl_area` VALUES ('2788', '174', null, '会泽县', '530326');
INSERT INTO `kl_area` VALUES ('2789', '174', null, '沾益县', '530328');
INSERT INTO `kl_area` VALUES ('2790', '174', null, '宣威市', '530381');
INSERT INTO `kl_area` VALUES ('2791', '113', null, '市辖区', '511601');
INSERT INTO `kl_area` VALUES ('2792', '113', null, '广安区', '511602');
INSERT INTO `kl_area` VALUES ('2793', '113', null, '前锋区', '511603');
INSERT INTO `kl_area` VALUES ('2794', '141', null, '钟山区', '520201');
INSERT INTO `kl_area` VALUES ('2795', '113', null, '岳池县', '511621');
INSERT INTO `kl_area` VALUES ('2796', '141', null, '六枝特区', '520203');
INSERT INTO `kl_area` VALUES ('2797', '113', null, '武胜县', '511622');
INSERT INTO `kl_area` VALUES ('2798', '141', null, '水城县', '520221');
INSERT INTO `kl_area` VALUES ('2799', '113', null, '邻水县', '511623');
INSERT INTO `kl_area` VALUES ('2800', '176', null, '市辖区', '530401');
INSERT INTO `kl_area` VALUES ('2801', '141', null, '盘县', '520222');
INSERT INTO `kl_area` VALUES ('2802', '113', null, '华蓥市', '511681');
INSERT INTO `kl_area` VALUES ('2803', '176', null, '红塔区', '530402');
INSERT INTO `kl_area` VALUES ('2804', '176', null, '江川县', '530421');
INSERT INTO `kl_area` VALUES ('2805', '176', null, '澄江县', '530422');
INSERT INTO `kl_area` VALUES ('2806', '176', null, '通海县', '530423');
INSERT INTO `kl_area` VALUES ('2807', '176', null, '华宁县', '530424');
INSERT INTO `kl_area` VALUES ('2808', '176', null, '易门县', '530425');
INSERT INTO `kl_area` VALUES ('2809', '176', null, '峨山彝族自治县', '530426');
INSERT INTO `kl_area` VALUES ('2810', '176', null, '新平彝族傣族自治县', '530427');
INSERT INTO `kl_area` VALUES ('2811', '176', null, '元江哈尼族彝族傣族自治县', '530428');
INSERT INTO `kl_area` VALUES ('2812', '143', null, '市辖区', '520301');
INSERT INTO `kl_area` VALUES ('2813', '114', null, '市辖区', '511701');
INSERT INTO `kl_area` VALUES ('2814', '143', null, '红花岗区', '520302');
INSERT INTO `kl_area` VALUES ('2815', '114', null, '通川区', '511702');
INSERT INTO `kl_area` VALUES ('2816', '143', null, '汇川区', '520303');
INSERT INTO `kl_area` VALUES ('2817', '178', null, '市辖区', '530501');
INSERT INTO `kl_area` VALUES ('2818', '114', null, '达川区', '511703');
INSERT INTO `kl_area` VALUES ('2819', '143', null, '遵义县', '520321');
INSERT INTO `kl_area` VALUES ('2820', '178', null, '隆阳区', '530502');
INSERT INTO `kl_area` VALUES ('2821', '114', null, '宣汉县', '511722');
INSERT INTO `kl_area` VALUES ('2822', '178', null, '施甸县', '530521');
INSERT INTO `kl_area` VALUES ('2823', '143', null, '桐梓县', '520322');
INSERT INTO `kl_area` VALUES ('2824', '114', null, '开江县', '511723');
INSERT INTO `kl_area` VALUES ('2825', '178', null, '腾冲县', '530522');
INSERT INTO `kl_area` VALUES ('2826', '143', null, '绥阳县', '520323');
INSERT INTO `kl_area` VALUES ('2827', '114', null, '大竹县', '511724');
INSERT INTO `kl_area` VALUES ('2828', '178', null, '龙陵县', '530523');
INSERT INTO `kl_area` VALUES ('2829', '143', null, '正安县', '520324');
INSERT INTO `kl_area` VALUES ('2830', '178', null, '昌宁县', '530524');
INSERT INTO `kl_area` VALUES ('2831', '114', null, '渠县', '511725');
INSERT INTO `kl_area` VALUES ('2832', '143', null, '道真仡佬族苗族自治县', '520325');
INSERT INTO `kl_area` VALUES ('2833', '114', null, '万源市', '511781');
INSERT INTO `kl_area` VALUES ('2834', '143', null, '务川仡佬族苗族自治县', '520326');
INSERT INTO `kl_area` VALUES ('2835', '143', null, '凤冈县', '520327');
INSERT INTO `kl_area` VALUES ('2836', '143', null, '湄潭县', '520328');
INSERT INTO `kl_area` VALUES ('2837', '143', null, '余庆县', '520329');
INSERT INTO `kl_area` VALUES ('2838', '143', null, '习水县', '520330');
INSERT INTO `kl_area` VALUES ('2839', '143', null, '赤水市', '520381');
INSERT INTO `kl_area` VALUES ('2840', '143', null, '仁怀市', '520382');
INSERT INTO `kl_area` VALUES ('2841', '180', null, '市辖区', '530601');
INSERT INTO `kl_area` VALUES ('2842', '115', null, '市辖区', '511801');
INSERT INTO `kl_area` VALUES ('2843', '180', null, '昭阳区', '530602');
INSERT INTO `kl_area` VALUES ('2844', '115', null, '雨城区', '511802');
INSERT INTO `kl_area` VALUES ('2845', '180', null, '鲁甸县', '530621');
INSERT INTO `kl_area` VALUES ('2846', '115', null, '名山区', '511803');
INSERT INTO `kl_area` VALUES ('2847', '180', null, '巧家县', '530622');
INSERT INTO `kl_area` VALUES ('2848', '115', null, '荥经县', '511822');
INSERT INTO `kl_area` VALUES ('2849', '180', null, '盐津县', '530623');
INSERT INTO `kl_area` VALUES ('2850', '115', null, '汉源县', '511823');
INSERT INTO `kl_area` VALUES ('2851', '180', null, '大关县', '530624');
INSERT INTO `kl_area` VALUES ('2852', '115', null, '石棉县', '511824');
INSERT INTO `kl_area` VALUES ('2853', '145', null, '市辖区', '520401');
INSERT INTO `kl_area` VALUES ('2854', '180', null, '永善县', '530625');
INSERT INTO `kl_area` VALUES ('2855', '145', null, '西秀区', '520402');
INSERT INTO `kl_area` VALUES ('2856', '115', null, '天全县', '511825');
INSERT INTO `kl_area` VALUES ('2857', '180', null, '绥江县', '530626');
INSERT INTO `kl_area` VALUES ('2858', '145', null, '平坝县', '520421');
INSERT INTO `kl_area` VALUES ('2859', '115', null, '芦山县', '511826');
INSERT INTO `kl_area` VALUES ('2860', '180', null, '镇雄县', '530627');
INSERT INTO `kl_area` VALUES ('2861', '115', null, '宝兴县', '511827');
INSERT INTO `kl_area` VALUES ('2862', '145', null, '普定县', '520422');
INSERT INTO `kl_area` VALUES ('2863', '180', null, '彝良县', '530628');
INSERT INTO `kl_area` VALUES ('2864', '145', null, '镇宁布依族苗族自治县', '520423');
INSERT INTO `kl_area` VALUES ('2865', '180', null, '威信县', '530629');
INSERT INTO `kl_area` VALUES ('2866', '145', null, '关岭布依族苗族自治县', '520424');
INSERT INTO `kl_area` VALUES ('2867', '180', null, '水富县', '530630');
INSERT INTO `kl_area` VALUES ('2868', '145', null, '紫云苗族布依族自治县', '520425');
INSERT INTO `kl_area` VALUES ('2869', '116', null, '市辖区', '511901');
INSERT INTO `kl_area` VALUES ('2870', '116', null, '巴州区', '511902');
INSERT INTO `kl_area` VALUES ('2871', '116', null, '恩阳区', '511903');
INSERT INTO `kl_area` VALUES ('2872', '116', null, '通江县', '511921');
INSERT INTO `kl_area` VALUES ('2873', '116', null, '南江县', '511922');
INSERT INTO `kl_area` VALUES ('2874', '182', null, '市辖区', '530701');
INSERT INTO `kl_area` VALUES ('2875', '116', null, '平昌县', '511923');
INSERT INTO `kl_area` VALUES ('2876', '182', null, '古城区', '530702');
INSERT INTO `kl_area` VALUES ('2877', '147', null, '市辖区', '520501');
INSERT INTO `kl_area` VALUES ('2878', '182', null, '玉龙纳西族自治县', '530721');
INSERT INTO `kl_area` VALUES ('2879', '147', null, '七星关区', '520502');
INSERT INTO `kl_area` VALUES ('2880', '182', null, '永胜县', '530722');
INSERT INTO `kl_area` VALUES ('2881', '147', null, '大方县', '520521');
INSERT INTO `kl_area` VALUES ('2882', '182', null, '华坪县', '530723');
INSERT INTO `kl_area` VALUES ('2883', '147', null, '黔西县', '520522');
INSERT INTO `kl_area` VALUES ('2884', '182', null, '宁蒗彝族自治县', '530724');
INSERT INTO `kl_area` VALUES ('2885', '147', null, '金沙县', '520523');
INSERT INTO `kl_area` VALUES ('2886', '147', null, '织金县', '520524');
INSERT INTO `kl_area` VALUES ('2887', '147', null, '纳雍县', '520525');
INSERT INTO `kl_area` VALUES ('2888', '147', null, '威宁彝族回族苗族自治县', '520526');
INSERT INTO `kl_area` VALUES ('2889', '147', null, '赫章县', '520527');
INSERT INTO `kl_area` VALUES ('2890', '117', null, '市辖区', '512001');
INSERT INTO `kl_area` VALUES ('2891', '117', null, '雁江区', '512002');
INSERT INTO `kl_area` VALUES ('2892', '117', null, '安岳县', '512021');
INSERT INTO `kl_area` VALUES ('2893', '117', null, '乐至县', '512022');
INSERT INTO `kl_area` VALUES ('2894', '117', null, '简阳市', '512081');
INSERT INTO `kl_area` VALUES ('2895', '184', null, '市辖区', '530801');
INSERT INTO `kl_area` VALUES ('2896', '184', null, '思茅区', '530802');
INSERT INTO `kl_area` VALUES ('2897', '184', null, '宁洱哈尼族彝族自治县', '530821');
INSERT INTO `kl_area` VALUES ('2898', '184', null, '墨江哈尼族自治县', '530822');
INSERT INTO `kl_area` VALUES ('2899', '184', null, '景东彝族自治县', '530823');
INSERT INTO `kl_area` VALUES ('2900', '184', null, '景谷傣族彝族自治县', '530824');
INSERT INTO `kl_area` VALUES ('2901', '149', null, '市辖区', '520601');
INSERT INTO `kl_area` VALUES ('2902', '184', null, '镇沅彝族哈尼族拉祜族自治县', '530825');
INSERT INTO `kl_area` VALUES ('2903', '149', null, '碧江区', '520602');
INSERT INTO `kl_area` VALUES ('2904', '184', null, '江城哈尼族彝族自治县', '530826');
INSERT INTO `kl_area` VALUES ('2905', '149', null, '万山区', '520603');
INSERT INTO `kl_area` VALUES ('2906', '184', null, '孟连傣族拉祜族佤族自治县', '530827');
INSERT INTO `kl_area` VALUES ('2907', '149', null, '江口县', '520621');
INSERT INTO `kl_area` VALUES ('2908', '184', null, '澜沧拉祜族自治县', '530828');
INSERT INTO `kl_area` VALUES ('2909', '149', null, '玉屏侗族自治县', '520622');
INSERT INTO `kl_area` VALUES ('2910', '184', null, '西盟佤族自治县', '530829');
INSERT INTO `kl_area` VALUES ('2911', '149', null, '石阡县', '520623');
INSERT INTO `kl_area` VALUES ('2912', '149', null, '思南县', '520624');
INSERT INTO `kl_area` VALUES ('2913', '118', null, '汶川县', '513221');
INSERT INTO `kl_area` VALUES ('2914', '149', null, '印江土家族苗族自治县', '520625');
INSERT INTO `kl_area` VALUES ('2915', '118', null, '理县', '513222');
INSERT INTO `kl_area` VALUES ('2916', '149', null, '德江县', '520626');
INSERT INTO `kl_area` VALUES ('2917', '118', null, '茂县', '513223');
INSERT INTO `kl_area` VALUES ('2918', '149', null, '沿河土家族自治县', '520627');
INSERT INTO `kl_area` VALUES ('2919', '118', null, '松潘县', '513224');
INSERT INTO `kl_area` VALUES ('2920', '149', null, '松桃苗族自治县', '520628');
INSERT INTO `kl_area` VALUES ('2921', '118', null, '九寨沟县', '513225');
INSERT INTO `kl_area` VALUES ('2922', '118', null, '金川县', '513226');
INSERT INTO `kl_area` VALUES ('2923', '118', null, '小金县', '513227');
INSERT INTO `kl_area` VALUES ('2924', '118', null, '黑水县', '513228');
INSERT INTO `kl_area` VALUES ('2925', '118', null, '马尔康县', '513229');
INSERT INTO `kl_area` VALUES ('2926', '118', null, '壤塘县', '513230');
INSERT INTO `kl_area` VALUES ('2927', '118', null, '阿坝县', '513231');
INSERT INTO `kl_area` VALUES ('2928', '118', null, '若尔盖县', '513232');
INSERT INTO `kl_area` VALUES ('2929', '118', null, '红原县', '513233');
INSERT INTO `kl_area` VALUES ('2930', '186', null, '市辖区', '530901');
INSERT INTO `kl_area` VALUES ('2931', '186', null, '临翔区', '530902');
INSERT INTO `kl_area` VALUES ('2932', '186', null, '凤庆县', '530921');
INSERT INTO `kl_area` VALUES ('2933', '186', null, '云县', '530922');
INSERT INTO `kl_area` VALUES ('2934', '186', null, '永德县', '530923');
INSERT INTO `kl_area` VALUES ('2935', '186', null, '镇康县', '530924');
INSERT INTO `kl_area` VALUES ('2936', '186', null, '双江拉祜族佤族布朗族傣族自治县', '530925');
INSERT INTO `kl_area` VALUES ('2937', '186', null, '耿马傣族佤族自治县', '530926');
INSERT INTO `kl_area` VALUES ('2938', '186', null, '沧源佤族自治县', '530927');
INSERT INTO `kl_area` VALUES ('2939', '150', null, '兴义市', '522301');
INSERT INTO `kl_area` VALUES ('2940', '150', null, '兴仁县', '522322');
INSERT INTO `kl_area` VALUES ('2941', '150', null, '普安县', '522323');
INSERT INTO `kl_area` VALUES ('2942', '150', null, '晴隆县', '522324');
INSERT INTO `kl_area` VALUES ('2943', '150', null, '贞丰县', '522325');
INSERT INTO `kl_area` VALUES ('2944', '150', null, '望谟县', '522326');
INSERT INTO `kl_area` VALUES ('2945', '150', null, '册亨县', '522327');
INSERT INTO `kl_area` VALUES ('2946', '119', null, '康定县', '513321');
INSERT INTO `kl_area` VALUES ('2947', '150', null, '安龙县', '522328');
INSERT INTO `kl_area` VALUES ('2948', '119', null, '泸定县', '513322');
INSERT INTO `kl_area` VALUES ('2949', '119', null, '丹巴县', '513323');
INSERT INTO `kl_area` VALUES ('2950', '119', null, '九龙县', '513324');
INSERT INTO `kl_area` VALUES ('2951', '119', null, '雅江县', '513325');
INSERT INTO `kl_area` VALUES ('2952', '119', null, '道孚县', '513326');
INSERT INTO `kl_area` VALUES ('2953', '119', null, '炉霍县', '513327');
INSERT INTO `kl_area` VALUES ('2954', '119', null, '甘孜县', '513328');
INSERT INTO `kl_area` VALUES ('2955', '119', null, '新龙县', '513329');
INSERT INTO `kl_area` VALUES ('2956', '119', null, '德格县', '513330');
INSERT INTO `kl_area` VALUES ('2957', '119', null, '白玉县', '513331');
INSERT INTO `kl_area` VALUES ('2958', '188', null, '楚雄市', '532301');
INSERT INTO `kl_area` VALUES ('2959', '119', null, '石渠县', '513332');
INSERT INTO `kl_area` VALUES ('2960', '188', null, '双柏县', '532322');
INSERT INTO `kl_area` VALUES ('2961', '119', null, '色达县', '513333');
INSERT INTO `kl_area` VALUES ('2962', '188', null, '牟定县', '532323');
INSERT INTO `kl_area` VALUES ('2963', '119', null, '理塘县', '513334');
INSERT INTO `kl_area` VALUES ('2964', '188', null, '南华县', '532324');
INSERT INTO `kl_area` VALUES ('2965', '119', null, '巴塘县', '513335');
INSERT INTO `kl_area` VALUES ('2966', '188', null, '姚安县', '532325');
INSERT INTO `kl_area` VALUES ('2967', '119', null, '乡城县', '513336');
INSERT INTO `kl_area` VALUES ('2968', '188', null, '大姚县', '532326');
INSERT INTO `kl_area` VALUES ('2969', '119', null, '稻城县', '513337');
INSERT INTO `kl_area` VALUES ('2970', '188', null, '永仁县', '532327');
INSERT INTO `kl_area` VALUES ('2971', '119', null, '得荣县', '513338');
INSERT INTO `kl_area` VALUES ('2972', '151', null, '凯里市', '522601');
INSERT INTO `kl_area` VALUES ('2973', '188', null, '元谋县', '532328');
INSERT INTO `kl_area` VALUES ('2974', '151', null, '黄平县', '522622');
INSERT INTO `kl_area` VALUES ('2975', '188', null, '武定县', '532329');
INSERT INTO `kl_area` VALUES ('2976', '151', null, '施秉县', '522623');
INSERT INTO `kl_area` VALUES ('2977', '188', null, '禄丰县', '532331');
INSERT INTO `kl_area` VALUES ('2978', '151', null, '三穗县', '522624');
INSERT INTO `kl_area` VALUES ('2979', '151', null, '镇远县', '522625');
INSERT INTO `kl_area` VALUES ('2980', '151', null, '岑巩县', '522626');
INSERT INTO `kl_area` VALUES ('2981', '151', null, '天柱县', '522627');
INSERT INTO `kl_area` VALUES ('2982', '151', null, '锦屏县', '522628');
INSERT INTO `kl_area` VALUES ('2983', '151', null, '剑河县', '522629');
INSERT INTO `kl_area` VALUES ('2984', '151', null, '台江县', '522630');
INSERT INTO `kl_area` VALUES ('2985', '151', null, '黎平县', '522631');
INSERT INTO `kl_area` VALUES ('2986', '151', null, '榕江县', '522632');
INSERT INTO `kl_area` VALUES ('2987', '151', null, '从江县', '522633');
INSERT INTO `kl_area` VALUES ('2988', '151', null, '雷山县', '522634');
INSERT INTO `kl_area` VALUES ('2989', '151', null, '麻江县', '522635');
INSERT INTO `kl_area` VALUES ('2990', '151', null, '丹寨县', '522636');
INSERT INTO `kl_area` VALUES ('2991', '190', null, '个旧市', '532501');
INSERT INTO `kl_area` VALUES ('2992', '190', null, '开远市', '532502');
INSERT INTO `kl_area` VALUES ('2993', '190', null, '蒙自市', '532503');
INSERT INTO `kl_area` VALUES ('2994', '190', null, '弥勒市', '532504');
INSERT INTO `kl_area` VALUES ('2995', '190', null, '屏边苗族自治县', '532523');
INSERT INTO `kl_area` VALUES ('2996', '192', null, '文山市', '532601');
INSERT INTO `kl_area` VALUES ('2997', '190', null, '建水县', '532524');
INSERT INTO `kl_area` VALUES ('2998', '192', null, '砚山县', '532622');
INSERT INTO `kl_area` VALUES ('2999', '190', null, '石屏县', '532525');
INSERT INTO `kl_area` VALUES ('3000', '192', null, '西畴县', '532623');
INSERT INTO `kl_area` VALUES ('3001', '190', null, '泸西县', '532527');
INSERT INTO `kl_area` VALUES ('3002', '192', null, '麻栗坡县', '532624');
INSERT INTO `kl_area` VALUES ('3003', '190', null, '元阳县', '532528');
INSERT INTO `kl_area` VALUES ('3004', '192', null, '马关县', '532625');
INSERT INTO `kl_area` VALUES ('3005', '152', null, '都匀市', '522701');
INSERT INTO `kl_area` VALUES ('3006', '190', null, '红河县', '532529');
INSERT INTO `kl_area` VALUES ('3007', '192', null, '丘北县', '532626');
INSERT INTO `kl_area` VALUES ('3008', '152', null, '福泉市', '522702');
INSERT INTO `kl_area` VALUES ('3009', '190', null, '金平苗族瑶族傣族自治县', '532530');
INSERT INTO `kl_area` VALUES ('3010', '192', null, '广南县', '532627');
INSERT INTO `kl_area` VALUES ('3011', '152', null, '荔波县', '522722');
INSERT INTO `kl_area` VALUES ('3012', '190', null, '绿春县', '532531');
INSERT INTO `kl_area` VALUES ('3013', '192', null, '富宁县', '532628');
INSERT INTO `kl_area` VALUES ('3014', '152', null, '贵定县', '522723');
INSERT INTO `kl_area` VALUES ('3015', '190', null, '河口瑶族自治县', '532532');
INSERT INTO `kl_area` VALUES ('3016', '152', null, '瓮安县', '522725');
INSERT INTO `kl_area` VALUES ('3017', '152', null, '独山县', '522726');
INSERT INTO `kl_area` VALUES ('3018', '152', null, '平塘县', '522727');
INSERT INTO `kl_area` VALUES ('3019', '152', null, '罗甸县', '522728');
INSERT INTO `kl_area` VALUES ('3020', '152', null, '长顺县', '522729');
INSERT INTO `kl_area` VALUES ('3021', '152', null, '龙里县', '522730');
INSERT INTO `kl_area` VALUES ('3022', '152', null, '惠水县', '522731');
INSERT INTO `kl_area` VALUES ('3023', '152', null, '三都水族自治县', '522732');
INSERT INTO `kl_area` VALUES ('3024', '194', null, '景洪市', '532801');
INSERT INTO `kl_area` VALUES ('3025', '194', null, '勐海县', '532822');
INSERT INTO `kl_area` VALUES ('3026', '194', null, '勐腊县', '532823');
INSERT INTO `kl_area` VALUES ('3027', '231', null, '那曲县', '542421');
INSERT INTO `kl_area` VALUES ('3028', '231', null, '嘉黎县', '542422');
INSERT INTO `kl_area` VALUES ('3029', '231', null, '比如县', '542423');
INSERT INTO `kl_area` VALUES ('3030', '196', null, '大理市', '532901');
INSERT INTO `kl_area` VALUES ('3031', '231', null, '聂荣县', '542424');
INSERT INTO `kl_area` VALUES ('3032', '196', null, '漾濞彝族自治县', '532922');
INSERT INTO `kl_area` VALUES ('3033', '231', null, '安多县', '542425');
INSERT INTO `kl_area` VALUES ('3034', '196', null, '祥云县', '532923');
INSERT INTO `kl_area` VALUES ('3035', '231', null, '申扎县', '542426');
INSERT INTO `kl_area` VALUES ('3036', '196', null, '宾川县', '532924');
INSERT INTO `kl_area` VALUES ('3037', '231', null, '索县', '542427');
INSERT INTO `kl_area` VALUES ('3038', '196', null, '弥渡县', '532925');
INSERT INTO `kl_area` VALUES ('3039', '231', null, '班戈县', '542428');
INSERT INTO `kl_area` VALUES ('3040', '196', null, '南涧彝族自治县', '532926');
INSERT INTO `kl_area` VALUES ('3041', '231', null, '巴青县', '542429');
INSERT INTO `kl_area` VALUES ('3042', '196', null, '巍山彝族回族自治县', '532927');
INSERT INTO `kl_area` VALUES ('3043', '231', null, '尼玛县', '542430');
INSERT INTO `kl_area` VALUES ('3044', '196', null, '永平县', '532928');
INSERT INTO `kl_area` VALUES ('3045', '231', null, '双湖县', '542431');
INSERT INTO `kl_area` VALUES ('3046', '196', null, '云龙县', '532929');
INSERT INTO `kl_area` VALUES ('3047', '196', null, '洱源县', '532930');
INSERT INTO `kl_area` VALUES ('3048', '196', null, '剑川县', '532931');
INSERT INTO `kl_area` VALUES ('3049', '196', null, '鹤庆县', '532932');
INSERT INTO `kl_area` VALUES ('3050', '232', null, '普兰县', '542521');
INSERT INTO `kl_area` VALUES ('3051', '232', null, '札达县', '542522');
INSERT INTO `kl_area` VALUES ('3052', '232', null, '噶尔县', '542523');
INSERT INTO `kl_area` VALUES ('3053', '232', null, '日土县', '542524');
INSERT INTO `kl_area` VALUES ('3054', '232', null, '革吉县', '542525');
INSERT INTO `kl_area` VALUES ('3055', '197', null, '瑞丽市', '533102');
INSERT INTO `kl_area` VALUES ('3056', '232', null, '改则县', '542526');
INSERT INTO `kl_area` VALUES ('3057', '197', null, '芒市', '533103');
INSERT INTO `kl_area` VALUES ('3058', '232', null, '措勤县', '542527');
INSERT INTO `kl_area` VALUES ('3059', '197', null, '梁河县', '533122');
INSERT INTO `kl_area` VALUES ('3060', '197', null, '盈江县', '533123');
INSERT INTO `kl_area` VALUES ('3061', '197', null, '陇川县', '533124');
INSERT INTO `kl_area` VALUES ('3062', '233', null, '林芝县', '542621');
INSERT INTO `kl_area` VALUES ('3063', '233', null, '工布江达县', '542622');
INSERT INTO `kl_area` VALUES ('3064', '233', null, '米林县', '542623');
INSERT INTO `kl_area` VALUES ('3065', '233', null, '墨脱县', '542624');
INSERT INTO `kl_area` VALUES ('3066', '199', null, '泸水县', '533321');
INSERT INTO `kl_area` VALUES ('3067', '233', null, '波密县', '542625');
INSERT INTO `kl_area` VALUES ('3068', '199', null, '福贡县', '533323');
INSERT INTO `kl_area` VALUES ('3069', '233', null, '察隅县', '542626');
INSERT INTO `kl_area` VALUES ('3070', '199', null, '贡山独龙族怒族自治县', '533324');
INSERT INTO `kl_area` VALUES ('3071', '233', null, '朗县', '542627');
INSERT INTO `kl_area` VALUES ('3072', '199', null, '兰坪白族普米族自治县', '533325');
INSERT INTO `kl_area` VALUES ('3073', '247', null, '市辖区', '610101');
INSERT INTO `kl_area` VALUES ('3074', '201', null, '香格里拉县', '533421');
INSERT INTO `kl_area` VALUES ('3075', '247', null, '新城区', '610102');
INSERT INTO `kl_area` VALUES ('3076', '201', null, '德钦县', '533422');
INSERT INTO `kl_area` VALUES ('3077', '247', null, '碑林区', '610103');
INSERT INTO `kl_area` VALUES ('3078', '201', null, '维西傈僳族自治县', '533423');
INSERT INTO `kl_area` VALUES ('3079', '247', null, '莲湖区', '610104');
INSERT INTO `kl_area` VALUES ('3080', '247', null, '灞桥区', '610111');
INSERT INTO `kl_area` VALUES ('3081', '247', null, '未央区', '610112');
INSERT INTO `kl_area` VALUES ('3082', '247', null, '雁塔区', '610113');
INSERT INTO `kl_area` VALUES ('3083', '247', null, '阎良区', '610114');
INSERT INTO `kl_area` VALUES ('3084', '247', null, '临潼区', '610115');
INSERT INTO `kl_area` VALUES ('3085', '247', null, '长安区', '610116');
INSERT INTO `kl_area` VALUES ('3086', '247', null, '蓝田县', '610122');
INSERT INTO `kl_area` VALUES ('3087', '247', null, '周至县', '610124');
INSERT INTO `kl_area` VALUES ('3088', '247', null, '户县', '610125');
INSERT INTO `kl_area` VALUES ('3089', '247', null, '高陵县', '610126');
INSERT INTO `kl_area` VALUES ('3090', '224', null, '市辖区', '540101');
INSERT INTO `kl_area` VALUES ('3091', '224', null, '城关区', '540102');
INSERT INTO `kl_area` VALUES ('3092', '224', null, '林周县', '540121');
INSERT INTO `kl_area` VALUES ('3093', '224', null, '当雄县', '540122');
INSERT INTO `kl_area` VALUES ('3094', '224', null, '尼木县', '540123');
INSERT INTO `kl_area` VALUES ('3095', '224', null, '曲水县', '540124');
INSERT INTO `kl_area` VALUES ('3096', '224', null, '堆龙德庆县', '540125');
INSERT INTO `kl_area` VALUES ('3097', '224', null, '达孜县', '540126');
INSERT INTO `kl_area` VALUES ('3098', '224', null, '墨竹工卡县', '540127');
INSERT INTO `kl_area` VALUES ('3099', '250', null, '市辖区', '610201');
INSERT INTO `kl_area` VALUES ('3100', '250', null, '王益区', '610202');
INSERT INTO `kl_area` VALUES ('3101', '250', null, '印台区', '610203');
INSERT INTO `kl_area` VALUES ('3102', '250', null, '耀州区', '610204');
INSERT INTO `kl_area` VALUES ('3103', '250', null, '宜君县', '610222');
INSERT INTO `kl_area` VALUES ('3104', '226', null, '昌都县', '542121');
INSERT INTO `kl_area` VALUES ('3105', '226', null, '江达县', '542122');
INSERT INTO `kl_area` VALUES ('3106', '226', null, '贡觉县', '542123');
INSERT INTO `kl_area` VALUES ('3107', '226', null, '类乌齐县', '542124');
INSERT INTO `kl_area` VALUES ('3108', '226', null, '丁青县', '542125');
INSERT INTO `kl_area` VALUES ('3109', '226', null, '察雅县', '542126');
INSERT INTO `kl_area` VALUES ('3110', '253', null, '市辖区', '610301');
INSERT INTO `kl_area` VALUES ('3111', '226', null, '八宿县', '542127');
INSERT INTO `kl_area` VALUES ('3112', '253', null, '渭滨区', '610302');
INSERT INTO `kl_area` VALUES ('3113', '226', null, '左贡县', '542128');
INSERT INTO `kl_area` VALUES ('3114', '253', null, '金台区', '610303');
INSERT INTO `kl_area` VALUES ('3115', '226', null, '芒康县', '542129');
INSERT INTO `kl_area` VALUES ('3116', '253', null, '陈仓区', '610304');
INSERT INTO `kl_area` VALUES ('3117', '226', null, '洛隆县', '542132');
INSERT INTO `kl_area` VALUES ('3118', '253', null, '凤翔县', '610322');
INSERT INTO `kl_area` VALUES ('3119', '226', null, '边坝县', '542133');
INSERT INTO `kl_area` VALUES ('3120', '253', null, '岐山县', '610323');
INSERT INTO `kl_area` VALUES ('3121', '253', null, '扶风县', '610324');
INSERT INTO `kl_area` VALUES ('3122', '253', null, '眉县', '610326');
INSERT INTO `kl_area` VALUES ('3123', '253', null, '陇县', '610327');
INSERT INTO `kl_area` VALUES ('3124', '253', null, '千阳县', '610328');
INSERT INTO `kl_area` VALUES ('3125', '253', null, '麟游县', '610329');
INSERT INTO `kl_area` VALUES ('3126', '253', null, '凤县', '610330');
INSERT INTO `kl_area` VALUES ('3127', '253', null, '太白县', '610331');
INSERT INTO `kl_area` VALUES ('3128', '228', null, '乃东县', '542221');
INSERT INTO `kl_area` VALUES ('3129', '228', null, '扎囊县', '542222');
INSERT INTO `kl_area` VALUES ('3130', '228', null, '贡嘎县', '542223');
INSERT INTO `kl_area` VALUES ('3131', '228', null, '桑日县', '542224');
INSERT INTO `kl_area` VALUES ('3132', '228', null, '琼结县', '542225');
INSERT INTO `kl_area` VALUES ('3133', '228', null, '曲松县', '542226');
INSERT INTO `kl_area` VALUES ('3134', '228', null, '措美县', '542227');
INSERT INTO `kl_area` VALUES ('3135', '228', null, '洛扎县', '542228');
INSERT INTO `kl_area` VALUES ('3136', '228', null, '加查县', '542229');
INSERT INTO `kl_area` VALUES ('3137', '228', null, '隆子县', '542231');
INSERT INTO `kl_area` VALUES ('3138', '256', null, '市辖区', '610401');
INSERT INTO `kl_area` VALUES ('3139', '228', null, '错那县', '542232');
INSERT INTO `kl_area` VALUES ('3140', '256', null, '秦都区', '610402');
INSERT INTO `kl_area` VALUES ('3141', '228', null, '浪卡子县', '542233');
INSERT INTO `kl_area` VALUES ('3142', '256', null, '杨陵区', '610403');
INSERT INTO `kl_area` VALUES ('3143', '256', null, '渭城区', '610404');
INSERT INTO `kl_area` VALUES ('3144', '256', null, '三原县', '610422');
INSERT INTO `kl_area` VALUES ('3145', '256', null, '泾阳县', '610423');
INSERT INTO `kl_area` VALUES ('3146', '256', null, '乾县', '610424');
INSERT INTO `kl_area` VALUES ('3147', '256', null, '礼泉县', '610425');
INSERT INTO `kl_area` VALUES ('3148', '256', null, '永寿县', '610426');
INSERT INTO `kl_area` VALUES ('3149', '256', null, '彬县', '610427');
INSERT INTO `kl_area` VALUES ('3150', '256', null, '长武县', '610428');
INSERT INTO `kl_area` VALUES ('3151', '256', null, '旬邑县', '610429');
INSERT INTO `kl_area` VALUES ('3152', '256', null, '淳化县', '610430');
INSERT INTO `kl_area` VALUES ('3153', '256', null, '武功县', '610431');
INSERT INTO `kl_area` VALUES ('3154', '256', null, '兴平市', '610481');
INSERT INTO `kl_area` VALUES ('3155', '230', null, '日喀则市', '542301');
INSERT INTO `kl_area` VALUES ('3156', '230', null, '南木林县', '542322');
INSERT INTO `kl_area` VALUES ('3157', '230', null, '江孜县', '542323');
INSERT INTO `kl_area` VALUES ('3158', '230', null, '定日县', '542324');
INSERT INTO `kl_area` VALUES ('3159', '230', null, '萨迦县', '542325');
INSERT INTO `kl_area` VALUES ('3160', '230', null, '拉孜县', '542326');
INSERT INTO `kl_area` VALUES ('3161', '230', null, '昂仁县', '542327');
INSERT INTO `kl_area` VALUES ('3162', '230', null, '谢通门县', '542328');
INSERT INTO `kl_area` VALUES ('3163', '230', null, '白朗县', '542329');
INSERT INTO `kl_area` VALUES ('3164', '230', null, '仁布县', '542330');
INSERT INTO `kl_area` VALUES ('3165', '230', null, '康马县', '542331');
INSERT INTO `kl_area` VALUES ('3166', '230', null, '定结县', '542332');
INSERT INTO `kl_area` VALUES ('3167', '230', null, '仲巴县', '542333');
INSERT INTO `kl_area` VALUES ('3168', '230', null, '亚东县', '542334');
INSERT INTO `kl_area` VALUES ('3169', '230', null, '吉隆县', '542335');
INSERT INTO `kl_area` VALUES ('3170', '230', null, '聂拉木县', '542336');
INSERT INTO `kl_area` VALUES ('3171', '230', null, '萨嘎县', '542337');
INSERT INTO `kl_area` VALUES ('3172', '258', null, '市辖区', '610501');
INSERT INTO `kl_area` VALUES ('3173', '230', null, '岗巴县', '542338');
INSERT INTO `kl_area` VALUES ('3174', '258', null, '临渭区', '610502');
INSERT INTO `kl_area` VALUES ('3175', '258', null, '华县', '610521');
INSERT INTO `kl_area` VALUES ('3176', '258', null, '潼关县', '610522');
INSERT INTO `kl_area` VALUES ('3177', '258', null, '大荔县', '610523');
INSERT INTO `kl_area` VALUES ('3178', '258', null, '合阳县', '610524');
INSERT INTO `kl_area` VALUES ('3179', '258', null, '澄城县', '610525');
INSERT INTO `kl_area` VALUES ('3180', '258', null, '蒲城县', '610526');
INSERT INTO `kl_area` VALUES ('3181', '258', null, '白水县', '610527');
INSERT INTO `kl_area` VALUES ('3182', '258', null, '富平县', '610528');
INSERT INTO `kl_area` VALUES ('3183', '258', null, '韩城市', '610581');
INSERT INTO `kl_area` VALUES ('3184', '258', null, '华阴市', '610582');
INSERT INTO `kl_area` VALUES ('3185', '261', null, '市辖区', '610601');
INSERT INTO `kl_area` VALUES ('3186', '261', null, '宝塔区', '610602');
INSERT INTO `kl_area` VALUES ('3187', '261', null, '延长县', '610621');
INSERT INTO `kl_area` VALUES ('3188', '261', null, '延川县', '610622');
INSERT INTO `kl_area` VALUES ('3189', '261', null, '子长县', '610623');
INSERT INTO `kl_area` VALUES ('3190', '261', null, '安塞县', '610624');
INSERT INTO `kl_area` VALUES ('3191', '261', null, '志丹县', '610625');
INSERT INTO `kl_area` VALUES ('3192', '261', null, '吴起县', '610626');
INSERT INTO `kl_area` VALUES ('3193', '261', null, '甘泉县', '610627');
INSERT INTO `kl_area` VALUES ('3194', '261', null, '富县', '610628');
INSERT INTO `kl_area` VALUES ('3195', '261', null, '洛川县', '610629');
INSERT INTO `kl_area` VALUES ('3196', '261', null, '宜川县', '610630');
INSERT INTO `kl_area` VALUES ('3197', '261', null, '黄龙县', '610631');
INSERT INTO `kl_area` VALUES ('3198', '261', null, '黄陵县', '610632');
INSERT INTO `kl_area` VALUES ('3199', '263', null, '市辖区', '610701');
INSERT INTO `kl_area` VALUES ('3200', '263', null, '汉台区', '610702');
INSERT INTO `kl_area` VALUES ('3201', '263', null, '南郑县', '610721');
INSERT INTO `kl_area` VALUES ('3202', '263', null, '城固县', '610722');
INSERT INTO `kl_area` VALUES ('3203', '263', null, '洋县', '610723');
INSERT INTO `kl_area` VALUES ('3204', '263', null, '西乡县', '610724');
INSERT INTO `kl_area` VALUES ('3205', '263', null, '勉县', '610725');
INSERT INTO `kl_area` VALUES ('3206', '263', null, '宁强县', '610726');
INSERT INTO `kl_area` VALUES ('3207', '263', null, '略阳县', '610727');
INSERT INTO `kl_area` VALUES ('3208', '263', null, '镇巴县', '610728');
INSERT INTO `kl_area` VALUES ('3209', '263', null, '留坝县', '610729');
INSERT INTO `kl_area` VALUES ('3210', '263', null, '佛坪县', '610730');
INSERT INTO `kl_area` VALUES ('3211', '265', null, '市辖区', '610801');
INSERT INTO `kl_area` VALUES ('3212', '265', null, '榆阳区', '610802');
INSERT INTO `kl_area` VALUES ('3213', '265', null, '神木县', '610821');
INSERT INTO `kl_area` VALUES ('3214', '265', null, '府谷县', '610822');
INSERT INTO `kl_area` VALUES ('3215', '265', null, '横山县', '610823');
INSERT INTO `kl_area` VALUES ('3216', '265', null, '靖边县', '610824');
INSERT INTO `kl_area` VALUES ('3217', '265', null, '定边县', '610825');
INSERT INTO `kl_area` VALUES ('3218', '265', null, '绥德县', '610826');
INSERT INTO `kl_area` VALUES ('3219', '265', null, '米脂县', '610827');
INSERT INTO `kl_area` VALUES ('3220', '265', null, '佳县', '610828');
INSERT INTO `kl_area` VALUES ('3221', '265', null, '吴堡县', '610829');
INSERT INTO `kl_area` VALUES ('3222', '265', null, '清涧县', '610830');
INSERT INTO `kl_area` VALUES ('3223', '265', null, '子洲县', '610831');
INSERT INTO `kl_area` VALUES ('3224', '294', null, '市辖区', '620801');
INSERT INTO `kl_area` VALUES ('3225', '294', null, '崆峒区', '620802');
INSERT INTO `kl_area` VALUES ('3226', '294', null, '泾川县', '620821');
INSERT INTO `kl_area` VALUES ('3227', '294', null, '灵台县', '620822');
INSERT INTO `kl_area` VALUES ('3228', '294', null, '崇信县', '620823');
INSERT INTO `kl_area` VALUES ('3229', '294', null, '华亭县', '620824');
INSERT INTO `kl_area` VALUES ('3230', '294', null, '庄浪县', '620825');
INSERT INTO `kl_area` VALUES ('3231', '294', null, '静宁县', '620826');
INSERT INTO `kl_area` VALUES ('3232', '267', null, '市辖区', '610901');
INSERT INTO `kl_area` VALUES ('3233', '267', null, '汉滨区', '610902');
INSERT INTO `kl_area` VALUES ('3234', '267', null, '汉阴县', '610921');
INSERT INTO `kl_area` VALUES ('3235', '267', null, '石泉县', '610922');
INSERT INTO `kl_area` VALUES ('3236', '267', null, '宁陕县', '610923');
INSERT INTO `kl_area` VALUES ('3237', '267', null, '紫阳县', '610924');
INSERT INTO `kl_area` VALUES ('3238', '267', null, '岚皋县', '610925');
INSERT INTO `kl_area` VALUES ('3239', '267', null, '平利县', '610926');
INSERT INTO `kl_area` VALUES ('3240', '325', null, '同仁县', '632321');
INSERT INTO `kl_area` VALUES ('3241', '267', null, '镇坪县', '610927');
INSERT INTO `kl_area` VALUES ('3242', '325', null, '尖扎县', '632322');
INSERT INTO `kl_area` VALUES ('3243', '267', null, '旬阳县', '610928');
INSERT INTO `kl_area` VALUES ('3244', '325', null, '泽库县', '632323');
INSERT INTO `kl_area` VALUES ('3245', '267', null, '白河县', '610929');
INSERT INTO `kl_area` VALUES ('3246', '325', null, '河南蒙古族自治县', '632324');
INSERT INTO `kl_area` VALUES ('3247', '295', null, '市辖区', '620901');
INSERT INTO `kl_area` VALUES ('3248', '295', null, '肃州区', '620902');
INSERT INTO `kl_area` VALUES ('3249', '295', null, '金塔县', '620921');
INSERT INTO `kl_area` VALUES ('3250', '295', null, '瓜州县', '620922');
INSERT INTO `kl_area` VALUES ('3251', '295', null, '肃北蒙古族自治县', '620923');
INSERT INTO `kl_area` VALUES ('3252', '295', null, '阿克塞哈萨克族自治县', '620924');
INSERT INTO `kl_area` VALUES ('3253', '295', null, '玉门市', '620981');
INSERT INTO `kl_area` VALUES ('3254', '295', null, '敦煌市', '620982');
INSERT INTO `kl_area` VALUES ('3255', '269', null, '市辖区', '611001');
INSERT INTO `kl_area` VALUES ('3256', '269', null, '商州区', '611002');
INSERT INTO `kl_area` VALUES ('3257', '269', null, '洛南县', '611021');
INSERT INTO `kl_area` VALUES ('3258', '269', null, '丹凤县', '611022');
INSERT INTO `kl_area` VALUES ('3259', '269', null, '商南县', '611023');
INSERT INTO `kl_area` VALUES ('3260', '327', null, '共和县', '632521');
INSERT INTO `kl_area` VALUES ('3261', '269', null, '山阳县', '611024');
INSERT INTO `kl_area` VALUES ('3262', '327', null, '同德县', '632522');
INSERT INTO `kl_area` VALUES ('3263', '269', null, '镇安县', '611025');
INSERT INTO `kl_area` VALUES ('3264', '327', null, '贵德县', '632523');
INSERT INTO `kl_area` VALUES ('3265', '269', null, '柞水县', '611026');
INSERT INTO `kl_area` VALUES ('3266', '327', null, '兴海县', '632524');
INSERT INTO `kl_area` VALUES ('3267', '327', null, '贵南县', '632525');
INSERT INTO `kl_area` VALUES ('3268', '296', null, '市辖区', '621001');
INSERT INTO `kl_area` VALUES ('3269', '296', null, '西峰区', '621002');
INSERT INTO `kl_area` VALUES ('3270', '296', null, '庆城县', '621021');
INSERT INTO `kl_area` VALUES ('3271', '296', null, '环县', '621022');
INSERT INTO `kl_area` VALUES ('3272', '296', null, '华池县', '621023');
INSERT INTO `kl_area` VALUES ('3273', '296', null, '合水县', '621024');
INSERT INTO `kl_area` VALUES ('3274', '296', null, '正宁县', '621025');
INSERT INTO `kl_area` VALUES ('3275', '296', null, '宁县', '621026');
INSERT INTO `kl_area` VALUES ('3276', '296', null, '镇原县', '621027');
INSERT INTO `kl_area` VALUES ('3277', '282', null, '市辖区', '620101');
INSERT INTO `kl_area` VALUES ('3278', '282', null, '城关区', '620102');
INSERT INTO `kl_area` VALUES ('3279', '331', null, '玛沁县', '632621');
INSERT INTO `kl_area` VALUES ('3280', '282', null, '七里河区', '620103');
INSERT INTO `kl_area` VALUES ('3281', '331', null, '班玛县', '632622');
INSERT INTO `kl_area` VALUES ('3282', '282', null, '西固区', '620104');
INSERT INTO `kl_area` VALUES ('3283', '331', null, '甘德县', '632623');
INSERT INTO `kl_area` VALUES ('3284', '282', null, '安宁区', '620105');
INSERT INTO `kl_area` VALUES ('3285', '331', null, '达日县', '632624');
INSERT INTO `kl_area` VALUES ('3286', '282', null, '红古区', '620111');
INSERT INTO `kl_area` VALUES ('3287', '331', null, '久治县', '632625');
INSERT INTO `kl_area` VALUES ('3288', '282', null, '永登县', '620121');
INSERT INTO `kl_area` VALUES ('3289', '331', null, '玛多县', '632626');
INSERT INTO `kl_area` VALUES ('3290', '282', null, '皋兰县', '620122');
INSERT INTO `kl_area` VALUES ('3291', '282', null, '榆中县', '620123');
INSERT INTO `kl_area` VALUES ('3292', '297', null, '市辖区', '621101');
INSERT INTO `kl_area` VALUES ('3293', '297', null, '安定区', '621102');
INSERT INTO `kl_area` VALUES ('3294', '297', null, '通渭县', '621121');
INSERT INTO `kl_area` VALUES ('3295', '297', null, '陇西县', '621122');
INSERT INTO `kl_area` VALUES ('3296', '297', null, '渭源县', '621123');
INSERT INTO `kl_area` VALUES ('3297', '297', null, '临洮县', '621124');
INSERT INTO `kl_area` VALUES ('3298', '297', null, '漳县', '621125');
INSERT INTO `kl_area` VALUES ('3299', '297', null, '岷县', '621126');
INSERT INTO `kl_area` VALUES ('3300', '333', null, '玉树市', '632701');
INSERT INTO `kl_area` VALUES ('3301', '333', null, '杂多县', '632722');
INSERT INTO `kl_area` VALUES ('3302', '285', null, '市辖区', '620201');
INSERT INTO `kl_area` VALUES ('3303', '333', null, '称多县', '632723');
INSERT INTO `kl_area` VALUES ('3304', '333', null, '治多县', '632724');
INSERT INTO `kl_area` VALUES ('3305', '333', null, '囊谦县', '632725');
INSERT INTO `kl_area` VALUES ('3306', '333', null, '曲麻莱县', '632726');
INSERT INTO `kl_area` VALUES ('3307', '298', null, '市辖区', '621201');
INSERT INTO `kl_area` VALUES ('3308', '298', null, '武都区', '621202');
INSERT INTO `kl_area` VALUES ('3309', '298', null, '成县', '621221');
INSERT INTO `kl_area` VALUES ('3310', '298', null, '文县', '621222');
INSERT INTO `kl_area` VALUES ('3311', '298', null, '宕昌县', '621223');
INSERT INTO `kl_area` VALUES ('3312', '298', null, '康县', '621224');
INSERT INTO `kl_area` VALUES ('3313', '298', null, '西和县', '621225');
INSERT INTO `kl_area` VALUES ('3314', '298', null, '礼县', '621226');
INSERT INTO `kl_area` VALUES ('3315', '288', null, '市辖区', '620301');
INSERT INTO `kl_area` VALUES ('3316', '298', null, '徽县', '621227');
INSERT INTO `kl_area` VALUES ('3317', '288', null, '金川区', '620302');
INSERT INTO `kl_area` VALUES ('3318', '298', null, '两当县', '621228');
INSERT INTO `kl_area` VALUES ('3319', '288', null, '永昌县', '620321');
INSERT INTO `kl_area` VALUES ('3320', '335', null, '格尔木市', '632801');
INSERT INTO `kl_area` VALUES ('3321', '335', null, '德令哈市', '632802');
INSERT INTO `kl_area` VALUES ('3322', '335', null, '乌兰县', '632821');
INSERT INTO `kl_area` VALUES ('3323', '335', null, '都兰县', '632822');
INSERT INTO `kl_area` VALUES ('3324', '335', null, '天峻县', '632823');
INSERT INTO `kl_area` VALUES ('3325', '299', null, '临夏市', '622901');
INSERT INTO `kl_area` VALUES ('3326', '290', null, '市辖区', '620401');
INSERT INTO `kl_area` VALUES ('3327', '299', null, '临夏县', '622921');
INSERT INTO `kl_area` VALUES ('3328', '290', null, '白银区', '620402');
INSERT INTO `kl_area` VALUES ('3329', '299', null, '康乐县', '622922');
INSERT INTO `kl_area` VALUES ('3330', '343', null, '市辖区', '640101');
INSERT INTO `kl_area` VALUES ('3331', '290', null, '平川区', '620403');
INSERT INTO `kl_area` VALUES ('3332', '343', null, '兴庆区', '640104');
INSERT INTO `kl_area` VALUES ('3333', '299', null, '永靖县', '622923');
INSERT INTO `kl_area` VALUES ('3334', '290', null, '靖远县', '620421');
INSERT INTO `kl_area` VALUES ('3335', '343', null, '西夏区', '640105');
INSERT INTO `kl_area` VALUES ('3336', '299', null, '广河县', '622924');
INSERT INTO `kl_area` VALUES ('3337', '290', null, '会宁县', '620422');
INSERT INTO `kl_area` VALUES ('3338', '343', null, '金凤区', '640106');
INSERT INTO `kl_area` VALUES ('3339', '299', null, '和政县', '622925');
INSERT INTO `kl_area` VALUES ('3340', '290', null, '景泰县', '620423');
INSERT INTO `kl_area` VALUES ('3341', '343', null, '永宁县', '640121');
INSERT INTO `kl_area` VALUES ('3342', '299', null, '东乡族自治县', '622926');
INSERT INTO `kl_area` VALUES ('3343', '343', null, '贺兰县', '640122');
INSERT INTO `kl_area` VALUES ('3344', '299', null, '积石山保安族东乡族撒拉族自治县', '622927');
INSERT INTO `kl_area` VALUES ('3345', '343', null, '灵武市', '640181');
INSERT INTO `kl_area` VALUES ('3346', '291', null, '市辖区', '620501');
INSERT INTO `kl_area` VALUES ('3347', '291', null, '秦州区', '620502');
INSERT INTO `kl_area` VALUES ('3348', '291', null, '麦积区', '620503');
INSERT INTO `kl_area` VALUES ('3349', '291', null, '清水县', '620521');
INSERT INTO `kl_area` VALUES ('3350', '291', null, '秦安县', '620522');
INSERT INTO `kl_area` VALUES ('3351', '300', null, '合作市', '623001');
INSERT INTO `kl_area` VALUES ('3352', '291', null, '甘谷县', '620523');
INSERT INTO `kl_area` VALUES ('3353', '300', null, '临潭县', '623021');
INSERT INTO `kl_area` VALUES ('3354', '344', null, '市辖区', '640201');
INSERT INTO `kl_area` VALUES ('3355', '291', null, '武山县', '620524');
INSERT INTO `kl_area` VALUES ('3356', '300', null, '卓尼县', '623022');
INSERT INTO `kl_area` VALUES ('3357', '344', null, '大武口区', '640202');
INSERT INTO `kl_area` VALUES ('3358', '291', null, '张家川回族自治县', '620525');
INSERT INTO `kl_area` VALUES ('3359', '300', null, '舟曲县', '623023');
INSERT INTO `kl_area` VALUES ('3360', '344', null, '惠农区', '640205');
INSERT INTO `kl_area` VALUES ('3361', '344', null, '平罗县', '640221');
INSERT INTO `kl_area` VALUES ('3362', '300', null, '迭部县', '623024');
INSERT INTO `kl_area` VALUES ('3363', '300', null, '玛曲县', '623025');
INSERT INTO `kl_area` VALUES ('3364', '300', null, '碌曲县', '623026');
INSERT INTO `kl_area` VALUES ('3365', '300', null, '夏河县', '623027');
INSERT INTO `kl_area` VALUES ('3366', '292', null, '市辖区', '620601');
INSERT INTO `kl_area` VALUES ('3367', '292', null, '凉州区', '620602');
INSERT INTO `kl_area` VALUES ('3368', '345', null, '市辖区', '640301');
INSERT INTO `kl_area` VALUES ('3369', '292', null, '民勤县', '620621');
INSERT INTO `kl_area` VALUES ('3370', '345', null, '利通区', '640302');
INSERT INTO `kl_area` VALUES ('3371', '292', null, '古浪县', '620622');
INSERT INTO `kl_area` VALUES ('3372', '345', null, '红寺堡区', '640303');
INSERT INTO `kl_area` VALUES ('3373', '316', null, '市辖区', '630101');
INSERT INTO `kl_area` VALUES ('3374', '292', null, '天祝藏族自治县', '620623');
INSERT INTO `kl_area` VALUES ('3375', '345', null, '盐池县', '640323');
INSERT INTO `kl_area` VALUES ('3376', '316', null, '城东区', '630102');
INSERT INTO `kl_area` VALUES ('3377', '345', null, '同心县', '640324');
INSERT INTO `kl_area` VALUES ('3378', '316', null, '城中区', '630103');
INSERT INTO `kl_area` VALUES ('3379', '345', null, '青铜峡市', '640381');
INSERT INTO `kl_area` VALUES ('3380', '316', null, '城西区', '630104');
INSERT INTO `kl_area` VALUES ('3381', '316', null, '城北区', '630105');
INSERT INTO `kl_area` VALUES ('3382', '316', null, '大通回族土族自治县', '630121');
INSERT INTO `kl_area` VALUES ('3383', '316', null, '湟中县', '630122');
INSERT INTO `kl_area` VALUES ('3384', '316', null, '湟源县', '630123');
INSERT INTO `kl_area` VALUES ('3385', '293', null, '市辖区', '620701');
INSERT INTO `kl_area` VALUES ('3386', '293', null, '甘州区', '620702');
INSERT INTO `kl_area` VALUES ('3387', '293', null, '肃南裕固族自治县', '620721');
INSERT INTO `kl_area` VALUES ('3388', '293', null, '民乐县', '620722');
INSERT INTO `kl_area` VALUES ('3389', '346', null, '市辖区', '640401');
INSERT INTO `kl_area` VALUES ('3390', '293', null, '临泽县', '620723');
INSERT INTO `kl_area` VALUES ('3391', '346', null, '原州区', '640402');
INSERT INTO `kl_area` VALUES ('3392', '293', null, '高台县', '620724');
INSERT INTO `kl_area` VALUES ('3393', '346', null, '西吉县', '640422');
INSERT INTO `kl_area` VALUES ('3394', '293', null, '山丹县', '620725');
INSERT INTO `kl_area` VALUES ('3395', '318', null, '乐都区', '630202');
INSERT INTO `kl_area` VALUES ('3396', '346', null, '隆德县', '640423');
INSERT INTO `kl_area` VALUES ('3397', '318', null, '平安县', '630221');
INSERT INTO `kl_area` VALUES ('3398', '346', null, '泾源县', '640424');
INSERT INTO `kl_area` VALUES ('3399', '318', null, '民和回族土族自治县', '630222');
INSERT INTO `kl_area` VALUES ('3400', '346', null, '彭阳县', '640425');
INSERT INTO `kl_area` VALUES ('3401', '318', null, '互助土族自治县', '630223');
INSERT INTO `kl_area` VALUES ('3402', '318', null, '化隆回族自治县', '630224');
INSERT INTO `kl_area` VALUES ('3403', '318', null, '循化撒拉族自治县', '630225');
INSERT INTO `kl_area` VALUES ('3404', '348', null, '市辖区', '640501');
INSERT INTO `kl_area` VALUES ('3405', '348', null, '沙坡头区', '640502');
INSERT INTO `kl_area` VALUES ('3406', '321', null, '门源回族自治县', '632221');
INSERT INTO `kl_area` VALUES ('3407', '348', null, '中宁县', '640521');
INSERT INTO `kl_area` VALUES ('3408', '321', null, '祁连县', '632222');
INSERT INTO `kl_area` VALUES ('3409', '348', null, '海原县', '640522');
INSERT INTO `kl_area` VALUES ('3410', '321', null, '海晏县', '632223');
INSERT INTO `kl_area` VALUES ('3411', '321', null, '刚察县', '632224');
INSERT INTO `kl_area` VALUES ('3412', '354', null, '市辖区', '650101');
INSERT INTO `kl_area` VALUES ('3413', '354', null, '天山区', '650102');
INSERT INTO `kl_area` VALUES ('3414', '354', null, '沙依巴克区', '650103');
INSERT INTO `kl_area` VALUES ('3415', '354', null, '新市区', '650104');
INSERT INTO `kl_area` VALUES ('3416', '354', null, '水磨沟区', '650105');
INSERT INTO `kl_area` VALUES ('3417', '354', null, '头屯河区', '650106');
INSERT INTO `kl_area` VALUES ('3418', '354', null, '达坂城区', '650107');
INSERT INTO `kl_area` VALUES ('3419', '354', null, '米东区', '650109');
INSERT INTO `kl_area` VALUES ('3420', '354', null, '乌鲁木齐县', '650121');
INSERT INTO `kl_area` VALUES ('3421', '372', null, '和田市', '653201');
INSERT INTO `kl_area` VALUES ('3422', '372', null, '和田县', '653221');
INSERT INTO `kl_area` VALUES ('3423', '372', null, '墨玉县', '653222');
INSERT INTO `kl_area` VALUES ('3424', '372', null, '皮山县', '653223');
INSERT INTO `kl_area` VALUES ('3425', '372', null, '洛浦县', '653224');
INSERT INTO `kl_area` VALUES ('3426', '372', null, '策勒县', '653225');
INSERT INTO `kl_area` VALUES ('3427', '372', null, '于田县', '653226');
INSERT INTO `kl_area` VALUES ('3428', '372', null, '民丰县', '653227');
INSERT INTO `kl_area` VALUES ('3429', '356', null, '市辖区', '650201');
INSERT INTO `kl_area` VALUES ('3430', '356', null, '独山子区', '650202');
INSERT INTO `kl_area` VALUES ('3431', '356', null, '克拉玛依区', '650203');
INSERT INTO `kl_area` VALUES ('3432', '356', null, '白碱滩区', '650204');
INSERT INTO `kl_area` VALUES ('3433', '356', null, '乌尔禾区', '650205');
INSERT INTO `kl_area` VALUES ('3434', '373', null, '伊宁市', '654002');
INSERT INTO `kl_area` VALUES ('3435', '373', null, '奎屯市', '654003');
INSERT INTO `kl_area` VALUES ('3436', '373', null, '伊宁县', '654021');
INSERT INTO `kl_area` VALUES ('3437', '358', null, '吐鲁番市', '652101');
INSERT INTO `kl_area` VALUES ('3438', '373', null, '察布查尔锡伯自治县', '654022');
INSERT INTO `kl_area` VALUES ('3439', '358', null, '鄯善县', '652122');
INSERT INTO `kl_area` VALUES ('3440', '373', null, '霍城县', '654023');
INSERT INTO `kl_area` VALUES ('3441', '358', null, '托克逊县', '652123');
INSERT INTO `kl_area` VALUES ('3442', '373', null, '巩留县', '654024');
INSERT INTO `kl_area` VALUES ('3443', '373', null, '新源县', '654025');
INSERT INTO `kl_area` VALUES ('3444', '373', null, '昭苏县', '654026');
INSERT INTO `kl_area` VALUES ('3445', '373', null, '特克斯县', '654027');
INSERT INTO `kl_area` VALUES ('3446', '373', null, '尼勒克县', '654028');
INSERT INTO `kl_area` VALUES ('3447', '360', null, '哈密市', '652201');
INSERT INTO `kl_area` VALUES ('3448', '360', null, '巴里坤哈萨克自治县', '652222');
INSERT INTO `kl_area` VALUES ('3449', '360', null, '伊吾县', '652223');
INSERT INTO `kl_area` VALUES ('3450', '374', null, '塔城市', '654201');
INSERT INTO `kl_area` VALUES ('3451', '374', null, '乌苏市', '654202');
INSERT INTO `kl_area` VALUES ('3452', '374', null, '额敏县', '654221');
INSERT INTO `kl_area` VALUES ('3453', '374', null, '沙湾县', '654223');
INSERT INTO `kl_area` VALUES ('3454', '374', null, '托里县', '654224');
INSERT INTO `kl_area` VALUES ('3455', '374', null, '裕民县', '654225');
INSERT INTO `kl_area` VALUES ('3456', '374', null, '和布克赛尔蒙古自治县', '654226');
INSERT INTO `kl_area` VALUES ('3457', '362', null, '昌吉市', '652301');
INSERT INTO `kl_area` VALUES ('3458', '362', null, '阜康市', '652302');
INSERT INTO `kl_area` VALUES ('3459', '362', null, '呼图壁县', '652323');
INSERT INTO `kl_area` VALUES ('3460', '362', null, '玛纳斯县', '652324');
INSERT INTO `kl_area` VALUES ('3461', '362', null, '奇台县', '652325');
INSERT INTO `kl_area` VALUES ('3462', '362', null, '吉木萨尔县', '652327');
INSERT INTO `kl_area` VALUES ('3463', '362', null, '木垒哈萨克自治县', '652328');
INSERT INTO `kl_area` VALUES ('3464', '375', null, '阿勒泰市', '654301');
INSERT INTO `kl_area` VALUES ('3465', '375', null, '布尔津县', '654321');
INSERT INTO `kl_area` VALUES ('3466', '375', null, '富蕴县', '654322');
INSERT INTO `kl_area` VALUES ('3467', '375', null, '福海县', '654323');
INSERT INTO `kl_area` VALUES ('3468', '375', null, '哈巴河县', '654324');
INSERT INTO `kl_area` VALUES ('3469', '375', null, '青河县', '654325');
INSERT INTO `kl_area` VALUES ('3470', '375', null, '吉木乃县', '654326');
INSERT INTO `kl_area` VALUES ('3471', '364', null, '博乐市', '652701');
INSERT INTO `kl_area` VALUES ('3472', '364', null, '阿拉山口市', '652702');
INSERT INTO `kl_area` VALUES ('3473', '364', null, '精河县', '652722');
INSERT INTO `kl_area` VALUES ('3474', '364', null, '温泉县', '652723');
INSERT INTO `kl_area` VALUES ('3475', '376', null, '石河子市', '659001');
INSERT INTO `kl_area` VALUES ('3476', '376', null, '阿拉尔市', '659002');
INSERT INTO `kl_area` VALUES ('3477', '376', null, '图木舒克市', '659003');
INSERT INTO `kl_area` VALUES ('3478', '376', null, '五家渠市', '659004');
INSERT INTO `kl_area` VALUES ('3479', '366', null, '库尔勒市', '652801');
INSERT INTO `kl_area` VALUES ('3480', '366', null, '轮台县', '652822');
INSERT INTO `kl_area` VALUES ('3481', '366', null, '尉犁县', '652823');
INSERT INTO `kl_area` VALUES ('3482', '366', null, '若羌县', '652824');
INSERT INTO `kl_area` VALUES ('3483', '366', null, '且末县', '652825');
INSERT INTO `kl_area` VALUES ('3484', '366', null, '焉耆回族自治县', '652826');
INSERT INTO `kl_area` VALUES ('3485', '366', null, '和静县', '652827');
INSERT INTO `kl_area` VALUES ('3486', '366', null, '和硕县', '652828');
INSERT INTO `kl_area` VALUES ('3487', '366', null, '博湖县', '652829');
INSERT INTO `kl_area` VALUES ('3488', '368', null, '阿克苏市', '652901');
INSERT INTO `kl_area` VALUES ('3489', '368', null, '温宿县', '652922');
INSERT INTO `kl_area` VALUES ('3490', '368', null, '库车县', '652923');
INSERT INTO `kl_area` VALUES ('3491', '368', null, '沙雅县', '652924');
INSERT INTO `kl_area` VALUES ('3492', '368', null, '新和县', '652925');
INSERT INTO `kl_area` VALUES ('3493', '368', null, '拜城县', '652926');
INSERT INTO `kl_area` VALUES ('3494', '368', null, '乌什县', '652927');
INSERT INTO `kl_area` VALUES ('3495', '368', null, '阿瓦提县', '652928');
INSERT INTO `kl_area` VALUES ('3496', '368', null, '柯坪县', '652929');
INSERT INTO `kl_area` VALUES ('3497', '370', null, '阿图什市', '653001');
INSERT INTO `kl_area` VALUES ('3498', '370', null, '阿克陶县', '653022');
INSERT INTO `kl_area` VALUES ('3499', '370', null, '阿合奇县', '653023');
INSERT INTO `kl_area` VALUES ('3500', '370', null, '乌恰县', '653024');
INSERT INTO `kl_area` VALUES ('3501', '371', null, '喀什市', '653101');
INSERT INTO `kl_area` VALUES ('3502', '371', null, '疏附县', '653121');
INSERT INTO `kl_area` VALUES ('3503', '371', null, '疏勒县', '653122');
INSERT INTO `kl_area` VALUES ('3504', '371', null, '英吉沙县', '653123');
INSERT INTO `kl_area` VALUES ('3505', '371', null, '泽普县', '653124');
INSERT INTO `kl_area` VALUES ('3506', '371', null, '莎车县', '653125');
INSERT INTO `kl_area` VALUES ('3507', '371', null, '叶城县', '653126');
INSERT INTO `kl_area` VALUES ('3508', '371', null, '麦盖提县', '653127');
INSERT INTO `kl_area` VALUES ('3509', '371', null, '岳普湖县', '653128');
INSERT INTO `kl_area` VALUES ('3510', '371', null, '伽师县', '653129');
INSERT INTO `kl_area` VALUES ('3511', '371', null, '巴楚县', '653130');
INSERT INTO `kl_area` VALUES ('3512', '371', null, '塔什库尔干塔吉克自治县', '653131');
INSERT INTO `kl_area` VALUES ('47402', '338', null, '市辖区', '441900');

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
  `is_original` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否原创',
  `src_link` varchar(255) NOT NULL DEFAULT '' COMMENT '转载的原文链接',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of kl_article
-- ----------------------------
INSERT INTO `kl_article` VALUES ('7', '1', '营养素会不会让人产生依赖性？病好后能不能停用？', '<p><br/></p><p><a href=\"<img class=\" title=\"1479518045493746.png\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\"><img class=\"lazy img-responsive w100\" src=\"/uploads/image/20161119/1479517894138467.png\"/><img src=\"/uploads/image/20161119/1479518045493746.png\" title=\"1479518045493746.png\" alt=\"QQ截图20161025103048.png\"/></a></p><p style=\"line-height: 16px;\"><img src=\"/public/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/uploads/file/other/20161119/1479518529101038.rar\" title=\"404页面.rar\">404页面.rar</a></p><p><a href=\"<img class=\" title=\"1479518045493746.png\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\"></a><br/></p><p style=\"line-height: 16px;\"><img src=\"/public/static/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/uploads/file/other/20161119/1479518470109748.gif\" title=\"21.gif\">21.gif</a></p><p><a href=\"<img class=\" title=\"1479518045493746.png\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\"></a><br/></p><p class=\"text-overflow plr5 mtb5\" style=\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\"><a href=\"<img class=\" title=\"1479518045493746.png\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\">神盾局特工第四季</a></p><p><a href=\"https://www.zhaokeli.com/cat/index.html\" target=\"_blank\" title=\"https://www.zhaokeli.com/cat/index.html\">https://www.zhaokeli.com/cat/index.html</a></p><p><a href style=\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\"></a></p><p><br/></p>', '7', '0', '', '1', '0', '#000000', '', '营养素,会不会,让人,产生,依赖性,病好,能不能,停用,营养,调理,营养素,我们,产生,这个', 'sdaf越来越多的会员通过营养调理获得了很好的调理效果，他们在高兴之余也多多少少有一些疑虑，不知道营养素会不会像一些特效药物一样让人体产生依赖性？下面我们一起来...', '1476081249', '1480733560', '1', '');
INSERT INTO `kl_article` VALUES ('6', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538926', '1', '');
INSERT INTO `kl_article` VALUES ('5', '1', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538926', '1', '');
INSERT INTO `kl_article` VALUES ('3', '2', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '-1', '0', '#000000', '', '', '', '1476081249', '1477358728', '1', '');
INSERT INTO `kl_article` VALUES ('4', '2', 'sadfasdf', '<p>sdaf</p>', '12', '0', '', '1', '0', '#000000', '', '', '', '1476081249', '1476538909', '1', '');
INSERT INTO `kl_article` VALUES ('8', '1', '99999999999999999999', '<p>5555555555<br/></p>', '0', '0', '', '1', '0', '#000000', '', '99999999999999999999,5555555555', '5555555555...', '1480904023', '1481370503', '1', '');
INSERT INTO `kl_article` VALUES ('9', '1', '555555555555555', '<p>6666666666666666666666666666<br/></p>', '0', '0', '', '1', '0', '#000000', '', '555555555555555,6666666666666666666666666666', '6666666666666666666666666666...', '1480905312', '1481369582', '1', '');

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
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类状态',
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of kl_config
-- ----------------------------
INSERT INTO `kl_config` VALUES ('2', '网站配置', 'web_config_4', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"www.ainiku.com\",\"shuiyin_text_color\":\"#FFFFFF\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"bottom_right\",\"thumb_model\":\"1\",\"shuiyin_image\":\"0\",\"admin_theme\":\"default\"}', '1480383448', '1480403157');
INSERT INTO `kl_config` VALUES ('3', '网站配置', 'web_config_3', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku5.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\"}', '1480728348', '1481467169');
INSERT INTO `kl_config` VALUES ('4', '网站配置', 'web_config_90', '{\"\\/sys_config\\/group_html\":\"\",\"filter_link\":\"1\",\"allow_domain\":\"www.zhaokeli.com\",\"denied_domain\":\"\"}', '1480733554', '1480734704');
INSERT INTO `kl_config` VALUES ('5', '网站配置', 'web_config_6', '{\"\\/sys_config\\/group_html\":\"\",\"baidu_push_article\":\"www.zhaokeli.com|j8pptT7xaAxv7tPc|http:\\/\\/www.zhaokeli.com\\/article\\/{id}.html\"}', '1480904857', '1481370947');

-- ----------------------------
-- Table structure for kl_consignee_address
-- ----------------------------
DROP TABLE IF EXISTS `kl_consignee_address`;
CREATE TABLE `kl_consignee_address` (
  `consignee_address_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee_name` varchar(255) NOT NULL DEFAULT '' COMMENT '配送人名字',
  `consignee_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '配送人电话',
  `consignee_diqu` varchar(255) NOT NULL DEFAULT '' COMMENT '配送人地址',
  `consignee_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '配送人详情地址',
  `consignee_youbian` varchar(255) NOT NULL DEFAULT '' COMMENT '配送人邮编',
  `consignee_email` varchar(255) NOT NULL DEFAULT '' COMMENT '配送人邮箱',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`consignee_address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户配送地址';

-- ----------------------------
-- Records of kl_consignee_address
-- ----------------------------
INSERT INTO `kl_consignee_address` VALUES ('1', '3', '赵凯旋', '13633719216', '1,33,405,0', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1020室', '4675000', '', '0', '1449192952');
INSERT INTO `kl_consignee_address` VALUES ('2', '3', '赵克立', '13633719215', '1,32,381,0', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '467500', '', '0', '1449195431');
INSERT INTO `kl_consignee_address` VALUES ('3', '3', '赵克立', '13633719215', '16,198,1911,0', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '4675000', '', '0', '1449192944');
INSERT INTO `kl_consignee_address` VALUES ('4', '3', '赵克立', '13633719215', '16,198,1911,0', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '467500', '', '0', '1449192936');
INSERT INTO `kl_consignee_address` VALUES ('6', '3', '张三', '13589758685', '4,84,595,0', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '460000', '735579768@qq.com', '0', '1449282590');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上传附件';

-- ----------------------------
-- Records of kl_file
-- ----------------------------
INSERT INTO `kl_file` VALUES ('1', '1', '21.gif', '1479518470109748.gif', '/uploads/file/other/20161119/1479518470109748.gif', '227792', '1479518470', '0');
INSERT INTO `kl_file` VALUES ('2', '1', '404页面.rar', '1479518529101038.rar', '/uploads/file/other/20161119/1479518529101038.rar', '830215', '1479518529', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='系统定义的表单项列表';

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
INSERT INTO `kl_form_item` VALUES ('77', '7', '文章状态', '', 'status', 'radio', '0:禁用\r\n1:正常\r\n2:草稿', '0', '3', '98', '1', '1', '', '', '', '', '0', '1476068050', '1480563569');
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
INSERT INTO `kl_form_item` VALUES ('134', '4', '网站前台主题', '前台网站使用的主题', 'index_theme', 'select', 'select_theme', '0', '3', '50', '1', 'default', '', '', '', '', '3', '1476944429', '1476944429');
INSERT INTO `kl_form_item` VALUES ('141', '4', '域名备案号', '', 'web_site_icp', 'string', '', '0', '3', '50', '1', '', '', '', '', '', '3', '1480168087', '1480168087');
INSERT INTO `kl_form_item` VALUES ('137', '3', '菜单的FONT图标类', '跟菜单一块显示的一个小图标', 'icon_class', 'string', '', '0', '3', '50', '1', 'fa-hand-o-right', '', '', '', '', '1', '1477672149', '1477672149');
INSERT INTO `kl_form_item` VALUES ('138', '12', 'SEO标题', '', 'meta_title', 'string', '', '0', '3', '31', '1', '', '', '', '', '', '1', '1478747317', '1478747458');
INSERT INTO `kl_form_item` VALUES ('139', '12', 'SEO关键字', '', 'meta_keywords', 'string', '', '0', '3', '32', '1', '', '', '', '', '', '1', '1478747355', '1478747459');
INSERT INTO `kl_form_item` VALUES ('140', '12', 'SEO描述', '', 'meta_descr', 'textarea', '', '0', '3', '33', '1', '', '', '', '', '', '1', '1478747392', '1478747461');
INSERT INTO `kl_form_item` VALUES ('142', '7', '是否原创', '此文章是否是原创文章', 'is_original', 'radio', '0:转载\r\n1:原创', '0', '3', '95', '1', '1', '', '', '', '', '0', '1480563548', '1480739853');
INSERT INTO `kl_form_item` VALUES ('143', '4', '域名白名单', '每个域名请用\',\'分隔,如 www.xxx.com,xxx.org,img.xxx.com', 'allow_domain', 'textarea', '', '0', '3', '55', '1', '', '', '', '', '', '90', '1480731221', '1480734117');
INSERT INTO `kl_form_item` VALUES ('144', '4', '过滤文章中不在域名白名单的外链', '添加编辑文章时自动过滤外链', 'filter_link', 'radio', '0:不过滤\r\n1:过滤', '0', '3', '50', '1', '0', '', '', '', '', '90', '1480733729', '1480733729');
INSERT INTO `kl_form_item` VALUES ('145', '4', '域名或ip黑名单', '禁止访问的域名或IP,用\',\'分隔', 'denied_domain', 'textarea', '', '0', '3', '56', '1', '', '', '', '', '', '90', '1480734094', '1480734121');
INSERT INTO `kl_form_item` VALUES ('146', '4', '百度链接主动推送', '依次填写推送的site|token|link用|分隔开,link中可用{id}为点位符替换文章id。', 'baidu_push_article', 'textarea', '', '0', '3', '50', '1', '', '', '', '', '', '6', '1480904747', '1480904747');
INSERT INTO `kl_form_item` VALUES ('147', '7', '原文链接', '转载的原文链接', 'src_link', 'string', '', '0', '3', '96', '1', '', '', '', '', '', '0', '1481247041', '1481247073');

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='系统后台菜单';

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
INSERT INTO `kl_menu` VALUES ('21', '2', '扩展管理', 'sys.addon/lis', '', '50', '0', '1', 'fa-plug', '1477022371', '1481547808');
INSERT INTO `kl_menu` VALUES ('24', '2', '插件名字', 'test/set', '已装扩展', '50', '', '1', 'fa-fire', '1477035127', '1481547816');
INSERT INTO `kl_menu` VALUES ('27', '2', '留言评论', 'comment/set', '已装扩展', '50', '', '1', 'fa-fire', '1477037782', '1481547817');
INSERT INTO `kl_menu` VALUES ('28', '8', '操作日志', 'sys.userlog/lis', '默认', '50', '0', '1', 'fa-history', '1477105775', '1477673319');
INSERT INTO `kl_menu` VALUES ('29', '2', '记事本', 'notepad/set', '已装扩展', '50', '', '1', 'fa-hand-o-right', '1481383255', '1481547818');
INSERT INTO `kl_menu` VALUES ('34', '2', 'QQ互联', 'qconnect/set', '已装扩展', '50', '', '1', 'fa-hand-o-right', '1481471081', '1481547819');
INSERT INTO `kl_menu` VALUES ('35', '2', '支付宝', 'alipay/set', '已装扩展', '50', '', '1', 'fa-hand-o-right', '1481549729', '1481549729');
INSERT INTO `kl_menu` VALUES ('36', '2', 'Excel表格导出', 'excel/set', '已装扩展', '50', '', '1', 'fa-hand-o-right', '1481640602', '1481640602');

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
-- Table structure for kl_order
-- ----------------------------
DROP TABLE IF EXISTS `kl_order`;
CREATE TABLE `kl_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `order_sn` varchar(255) NOT NULL DEFAULT '',
  `consignee_diqu` varchar(255) NOT NULL DEFAULT '',
  `consignee_name` varchar(255) NOT NULL DEFAULT '',
  `consignee_detail` varchar(255) NOT NULL DEFAULT '',
  `consignee_mobile` varchar(255) NOT NULL DEFAULT '',
  `consignee_email` varchar(255) NOT NULL DEFAULT '',
  `order_total` double NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pay_type` varchar(255) NOT NULL DEFAULT '',
  `pay_trade_no` varchar(255) NOT NULL DEFAULT '',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `fahuo_time` int(11) NOT NULL DEFAULT '0',
  `shouhuo_time` int(11) NOT NULL DEFAULT '0',
  `wuliu_name` varchar(255) NOT NULL DEFAULT '',
  `wuliu_danhao` varchar(255) NOT NULL DEFAULT '',
  `youbian` varchar(255) NOT NULL DEFAULT '',
  `order_note` varchar(255) NOT NULL DEFAULT '',
  `action_note` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品订单';

-- ----------------------------
-- Records of kl_order
-- ----------------------------
INSERT INTO `kl_order` VALUES ('10', '1', '1512051222437', '北京市市辖区石景山区', '赵克立', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13633719215', '', '100', '5', '', '', '1451887840', '1451887852', '1451887856', '', '', '467500', '你好请在周五发货', '', '1449281182');
INSERT INTO `kl_order` VALUES ('11', '1', '1512054892419', '山西省太原市杏花岭区', '张三', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13589758685', '', '200', '0', '', '', '0', '0', '0', '', '', '460000', 'asdfasdfasdfasdf', '', '1451892695');
INSERT INTO `kl_order` VALUES ('12', '1', '1512059939517', '河南省郑州市金水区', '赵克立', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13633719215', '', '700', '2', '', '', '1451889086', '0', '0', '', '', '4675000', '8888888888888888', '', '1449296280');
INSERT INTO `kl_order` VALUES ('9', '1', '1512055264858', '山西省太原市杏花岭区', '张三', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13589758685', '', '200', '5', '', '', '1453344234', '1453344238', '1453344249', '', '', '460000', '', '', '1451892600');
INSERT INTO `kl_order` VALUES ('13', '1', '1512059665134', '河南省郑州市金水区', '赵克立', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13633719215', '', '200', '0', '', '', '0', '0', '0', '', '', '4675000', '', '', '1449326370');
INSERT INTO `kl_order` VALUES ('14', '1', '1512068737973', '河南省郑州市金水区', '赵克立', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13633719215', '', '200', '5', '', '', '0', '1451889127', '1451892695', '', '', '4675000', '', '', '1449379726');
INSERT INTO `kl_order` VALUES ('15', '1', '1512062780160', '河南省郑州市金水区', '赵克立', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13633719215', '', '200', '0', '', '', '0', '0', '0', '', '', '4675000', '', '', '1449400544');
INSERT INTO `kl_order` VALUES ('16', '1', '1512075502008', '北京市市辖区石景山区', '赵克立', '河南省郑州市金水区文化路与北环路交叉口路西瀚海爱特中心1004室', '13633719215', '', '1', '0', '', '', '0', '0', '0', '', '', '467500', '', '', '1449449904');

-- ----------------------------
-- Table structure for kl_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `kl_order_detail`;
CREATE TABLE `kl_order_detail` (
  `order_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='订单里的产品';

-- ----------------------------
-- Records of kl_order_detail
-- ----------------------------
INSERT INTO `kl_order_detail` VALUES ('10', '1', '11', '1', '2', '100', '200', '1449282611', '1');
INSERT INTO `kl_order_detail` VALUES ('9', '1', '10', '1', '1', '100', '100', '1449281182', '0');
INSERT INTO `kl_order_detail` VALUES ('8', '1', '9', '1', '2', '100', '200', '1449280850', '5');
INSERT INTO `kl_order_detail` VALUES ('11', '1', '12', '1', '3', '100', '300', '1449296280', '1');
INSERT INTO `kl_order_detail` VALUES ('12', '1', '12', '1', '4', '100', '400', '1449296280', '1');
INSERT INTO `kl_order_detail` VALUES ('13', '1', '13', '1', '2', '100', '200', '1449326370', '1');
INSERT INTO `kl_order_detail` VALUES ('14', '1', '14', '1', '2', '100', '200', '1449379726', '1');
INSERT INTO `kl_order_detail` VALUES ('15', '1', '15', '1', '2', '100', '200', '1449400544', '1');
INSERT INTO `kl_order_detail` VALUES ('16', '1', '16', '1', '1', '100', '100', '1449449904', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='上传图片';

-- ----------------------------
-- Records of kl_picture
-- ----------------------------
INSERT INTO `kl_picture` VALUES ('7', '1', '公众号二维码1.jpg', '14787428236357.jpg', '/uploads/image/20161110/14787428236357.jpg', '/uploads/image/thumb/20161110/14787428236357.jpg', '1', '', '6440af2a659fe160793831919f53d351b342c8db', '6440af2a659fe160793831919f53d351b342c8db', '1478742823', '1480385349');
INSERT INTO `kl_picture` VALUES ('8', '1', '1720018504.jpeg', '1479478528258750.jpeg', '/uploads/image/20161118/1479478528258750.jpeg', '/uploads/image/20161118/1479478528258750.jpeg', '1', '', '56cf7e2e88e81f3e67fa13b109061f7343501103', '', '1479478528', '0');
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
INSERT INTO `kl_picture` VALUES ('19', '1', 'QQ截图20161117095322.png', '1479515273358885.png', '/uploads/image/20161119/1479515273358885.png', '/uploads/image/thumb/20161119/1479515273358885.png', '1', '', '942356cbe92d7ea749330c4f1b5a9593db19642c', '942356cbe92d7ea749330c4f1b5a9593db19642c', '1479515273', '1480385349');
INSERT INTO `kl_picture` VALUES ('20', '1', 'f03ac498ceb7cf45t.jpg', '1479517636121259.jpg', '/uploads/image/20161119/1479517636121259.jpg', '/uploads/image/thumb/20161119/1479517636121259.jpg', '1', 'ueditor', '921f3c5fef6bc007ff0676950b51e45c5f451f73', '921f3c5fef6bc007ff0676950b51e45c5f451f73', '1479517649', '1480385349');
INSERT INTO `kl_picture` VALUES ('21', '1', '624.jpg', '1479517639605242.jpg', '/uploads/image/20161119/1479517639605242.jpg', '/uploads/image/20161119/1479517639605242.jpg', '1', 'ueditor', '852a951c40c292a2d268adcbf79cb8179c4d8b9d', '', '1479517649', '0');
INSERT INTO `kl_picture` VALUES ('22', '1', '623.png', '1479517641101920.png', '/uploads/image/20161119/1479517641101920.png', '/uploads/image/thumb/20161119/1479517641101920.png', '1', 'ueditor', '0aac5512dcd27660b10a01f222f92bcf419ca5f5', '0aac5512dcd27660b10a01f222f92bcf419ca5f5', '1479517649', '1480385349');
INSERT INTO `kl_picture` VALUES ('23', '1', '201610126315928602.jpg', '1479517646102682.jpg', '/uploads/image/20161119/1479517646102682.jpg', '/uploads/image/thumb/20161119/1479517646102682.jpg', '1', 'ueditor', 'cf54c68195e4001f40c94935f6f6b2484ca8c204', 'cf54c68195e4001f40c94935f6f6b2484ca8c204', '1479517649', '1480385349');
INSERT INTO `kl_picture` VALUES ('24', '1', '4bb991d1f9fa569b.jpg', '1479517649752023.jpg', '/uploads/image/20161119/1479517649752023.jpg', '/uploads/image/thumb/20161119/1479517649752023.jpg', '1', 'ueditor', '375cb4d43246d449a27d480520f4a4064cb3aa02', '375cb4d43246d449a27d480520f4a4064cb3aa02', '1479517649', '1480385349');
INSERT INTO `kl_picture` VALUES ('25', '1', '674.png', '1479517894138467.png', '/uploads/image/20161119/1479517894138467.png', '/uploads/image/thumb/20161119/1479517894138467.png', '1', 'ueditor', '40309b93e065c603dccfc6f05832262f43dea293', '40309b93e065c603dccfc6f05832262f43dea293', '1479517894', '1480385349');
INSERT INTO `kl_picture` VALUES ('26', '1', 'getqrcode.png', '1479517930556099.png', '/uploads/image/20161119/1479517930556099.png', '/uploads/image/thumb/20161119/1479517930556099.png', '1', '', '85c4a1b96e6c22727b23de0f22851924d9ebab28', '85c4a1b96e6c22727b23de0f22851924d9ebab28', '1479517930', '1480385349');
INSERT INTO `kl_picture` VALUES ('27', '1', 'getqrcode.png', '1479518010611395.png', '/uploads/image/20161119/1479517930556099.png', '/uploads/image/thumb/20161119/1479517930556099.png', '1', '', '85c4a1b96e6c22727b23de0f22851924d9ebab28', '85c4a1b96e6c22727b23de0f22851924d9ebab28', '1479518010', '1480385349');
INSERT INTO `kl_picture` VALUES ('28', '1', 'QQ截图20161025103048.png', '1479518045493746.png', '/uploads/image/20161119/1479518045493746.png', '/uploads/image/thumb/20161119/1479518045493746.png', '1', '', 'f179450412bcfcf415cbb2a8864922b2bd556953', 'f179450412bcfcf415cbb2a8864922b2bd556953', '1479518045', '1480385349');
INSERT INTO `kl_picture` VALUES ('29', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402161', '0');
INSERT INTO `kl_picture` VALUES ('30', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402255136841.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402255', '0');
INSERT INTO `kl_picture` VALUES ('31', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402285264215.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402285', '0');
INSERT INTO `kl_picture` VALUES ('32', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402354643755.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402355', '0');
INSERT INTO `kl_picture` VALUES ('33', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402354119172.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402355', '0');
INSERT INTO `kl_picture` VALUES ('34', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402355146178.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402355', '0');
INSERT INTO `kl_picture` VALUES ('35', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402378441032.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402378', '0');
INSERT INTO `kl_picture` VALUES ('36', '1', 'pc-aad5e93c-31ba-11e4-b9bf-000c29f61318.png', '1480402393138966.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402393', '0');
INSERT INTO `kl_picture` VALUES ('37', '1', '1480400426500975.png', '1480402432110785.png', '/uploads/image/20161129/1480402161227164.png', '/uploads/image/20161129/1480402161227164.png', '1', 'ueditor', '019b58050957d1a7a78e0014bee846ad5b169ca0', '', '1480402432', '0');
INSERT INTO `kl_picture` VALUES ('38', '1', '2014021558044585.gif', '1480402449501234.gif', '/uploads/image/20161129/1480402449501234.gif', '/uploads/image/20161129/1480402449501234.gif', '1', 'ueditor', 'e0f8adfffbc29def933736ce876cf59289c61439', '', '1480402449', '0');
INSERT INTO `kl_picture` VALUES ('39', '1', '', '', '', '', '1', 'ueditor', '', '', '1480402976', '0');
INSERT INTO `kl_picture` VALUES ('40', '1', '154912h9qhn1x0kn5u591h.jpg', '1480403097927636.jpg', '/uploads/image/20161129/1480403097927636.jpg', '/uploads/image/20161129/1480403097927636.jpg', '1', 'ueditor', '158f66cb0d68298a68eed739e8e4fac9fba7473b', '', '1480403098', '0');
INSERT INTO `kl_picture` VALUES ('41', '1', '155239twzqezqfveza99ev.jpg', '1480403170158787.jpg', '/uploads/image/20161129/1480403170158787.jpg', '/uploads/image/20161129/1480403170158787.jpg', '1', 'ueditor', 'd85b094a927a1014686fe917c5f6c5fd3b2f541a', '', '1480403170', '0');
INSERT INTO `kl_picture` VALUES ('42', '1', '155239twzqezqfveza99ev.jpg', '1480403212731712.jpg', '/uploads/image/20161129/1480403170158787.jpg', '/uploads/image/20161129/1480403170158787.jpg', '1', 'ueditor', 'd85b094a927a1014686fe917c5f6c5fd3b2f541a', '', '1480403212', '0');
INSERT INTO `kl_picture` VALUES ('43', '1', '下载.png', '148109765169624.png', '/uploads/image/20161207/148109765169624.png', '/uploads/image/thumb/20161207/148109765169624.png', '1', 'uploadpic', '5c7dd41a7431e30f1f94e2acb3cc9ec4b0d8c735', '', '1481097651', '0');
INSERT INTO `kl_picture` VALUES ('44', '1', '241d34c.gif', '148109837696314.gif', '/uploads/image/20161207/148109837696314.gif', '/uploads/image/thumb/20161207/148109837696314.gif', '1', 'uploadpic', '653f5a399c6c962f1af7aecfcb720d9e7f11af8c', '', '1481098377', '0');
INSERT INTO `kl_picture` VALUES ('45', '1', '下载.png', '148109873733513.png', '/uploads/image/20161207/148109765169624.png', '/uploads/image/20161207/148109765169624.png', '1', 'uploadpic', '5c7dd41a7431e30f1f94e2acb3cc9ec4b0d8c735', '', '1481098737', '0');
INSERT INTO `kl_picture` VALUES ('46', '1', '下载.png', '148109882657920.png', '/uploads/image/20161207/148109765169624.png', '/uploads/image/20161207/148109765169624.png', '1', 'uploadpic', '5c7dd41a7431e30f1f94e2acb3cc9ec4b0d8c735', '', '1481098826', '0');

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
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `pic` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户头像',
  `login_error` int(10) NOT NULL DEFAULT '0' COMMENT '登陆错误次数',
  `error_msg` varchar(255) NOT NULL DEFAULT '' COMMENT '错误信息',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ互联id',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kl_user
-- ----------------------------
INSERT INTO `kl_user` VALUES ('1', '10000', '1', 'admin', '0c72320405722be71ba98ade695850b5', '啊哦', '3,58,485', 'asdf', '13633719215', '735579768@qq.com', '1', '', '127.0.0.1', '', '0', '23', '1', '0', '0', '登陆成功', '0', '1481801407', '');
INSERT INTO `kl_user` VALUES ('2', '', '1', 'testtest', '0c72320405722be71ba98ade695850b5', '测试', '1,32,380', '模压', '13633719216', '7355797688@qq.com', '0', '127.0.0.1', '', '', '0', '0', '1', '0', '0', '', '1476425240', '1477105571', '');
INSERT INTO `kl_user` VALUES ('3', '88318786', '2', '88318786', '', '٩(•̮̮̃•̃)─═SMAIL╄→', '', '', '', '', '0', '', '127.0.0.1', '', '1481810821', '0', '1', '0', '0', '', '1481810821', '1481810821', '372A677CC6CC64CE9EB3E9B30F79AF17');

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
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='用户登陆日志';

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
INSERT INTO `kl_user_log` VALUES ('152', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p>sdaf<img src=\\\"\\/uploads\\/image\\/20161110\\/14787428236357.jpg\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479515273358885.png\\\" title=\\\"1479515273358885.png\\\" alt=\\\"QQ\\u622a\\u56fe20161117095322.png\\\"\\/><\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765\\u770b\\u770b\\u8425\\u517b\\u533b\\u5b66\\u521b\\u59cb\\u4eba\\u738b\\u6d9b\\u535a\\u58eb\\u5bf9\\u4e8e\\u8fd9\\u4e2a\\u95ee\\u9898\\u662f\\u5982\\u4f55\\u89e3\\u6790\\u7684:<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u5927\\u5bb6\\u4e3a\\u4ec0\\u4e48\\u5173\\u5fc3\\u201c\\u53ef\\u4e0d\\u53ef\\u4ee5\\u4e0d\\u5403\\u8425\\u517b\\u7d20\\u201d\\uff0c\\u6211\\u60f3\\u662f\\u62c5\\u5fc3\\u4f1a\\u5bf9\\u5b83\\u4ea7\\u751f\\u4f9d\\u8d56\\uff0c\\u4ece\\u8425\\u517b\\u7d20\\u672c\\u8eab\\u6765\\u8bb2\\uff0c\\u5b83\\u4e0d\\u4f1a\\u4ea7\\u751f\\u4efb\\u4f55\\u4f9d\\u8d56\\uff0c\\u5426\\u5219\\u5b83\\u4e0d\\u53ef\\u80fd\\u88ab\\u5141\\u8bb8\\u81ea\\u7531\\u4e70\\u5356\\u3002\\u53e6\\u5916\\uff0c\\u4ece\\u8425\\u517b\\u8c03\\u7406\\u7684\\u89d2\\u5ea6\\u6765\\u8bb2\\uff0c\\u75c5\\u597d\\u4e4b\\u540e\\u8425\\u517b\\u7d20\\u5b8c\\u5168\\u53ef\\u4ee5\\u505c\\u6389\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u90a3\\u4e48\\u67d0\\u4e9b\\u7279\\u5b9a\\u7684\\u75c5\\u4eba\\u5173\\u5fc3\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u6bd4\\u5982\\u7cd6\\u5c3f\\u75c5\\u4eba\\uff0c\\u9ad8\\u8840\\u538b\\u75c5\\u4eba\\uff0c\\u6050\\u6015\\u662f\\u62c5\\u5fc3\\u5c06\\u6765\\u8981\\u50cf\\u5403\\u964d\\u7cd6\\u836f\\uff0c\\u964d\\u538b\\u836f\\u4e00\\u6837\\u5403\\u4e00\\u8f88\\u5b50\\u8425\\u517b\\u7d20\\u3002\\u56e0\\u4e3a\\u5927\\u5bb6\\u90fd\\u6709\\u8fd9\\u6837\\u7684\\u7ecf\\u9a8c\\uff0c\\u8fd9\\u4e9b\\u836f\\u4e00\\u505c\\uff0c\\u8840\\u7cd6\\u548c\\u8840\\u538b\\u7acb\\u523b\\u5c31\\u4e0a\\u6765\\u4e86\\u3002\\u4f46\\u6211\\u4eec\\u4e00\\u76f4\\u8bf4\\uff0c\\u4e4b\\u6240\\u4ee5\\u4e0d\\u80fd\\u505c\\u836f\\uff0c\\u662f\\u56e0\\u4e3a\\u8fd9\\u4e9b\\u836f\\u6ca1\\u6709\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u95ee\\u9898\\uff0c\\u800c\\u8425\\u517b\\u8c03\\u7406\\u662f\\u4ece\\u6839\\u672c\\u4e0a\\u89e3\\u51b3\\u4e86\\u8fd9\\u4e9b\\u6162\\u6027\\u75c5\\uff0c\\u90a3\\u5f53\\u7136\\u5c31\\u53ef\\u4ee5\\u505c\\u8425\\u517b\\u7d20\\u4e86\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 40px; text-indent: 2em; white-space: normal;\\\">\\u4ece\\u957f\\u4e45\\u7684\\u5065\\u5eb7\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u8981\\u6b63\\u786e\\u7406\\u89e3\\u8425\\u517b\\u7684\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\u5176\\u5b9e\\u6211\\u4eec\\u6bcf\\u5929\\u5403\\u996d\\u5c31\\u662f\\u5728\\u6444\\u53d6\\u8425\\u517b\\uff0c\\u800c\\u6211\\u4eec\\u4e4b\\u6240\\u4ee5\\u4f1a\\u751f\\u75c5\\uff0c\\u5219\\u662f\\u56e0\\u4e3a\\u8425\\u517b\\u4e0d\\u5747\\u8861\\u2014\\u2014\\u8425\\u517b\\u8c03\\u7406\\u53ef\\u4ee5\\u6301\\u7eed\\u5730\\u5e2e\\u52a9\\u5927\\u5bb6\\u89e3\\u51b3\\u8425\\u517b\\u5747\\u8861\\u7684\\u95ee\\u9898\\uff0c\\u8fbe\\u5230\\u201c\\u6ca1\\u75c5\\u201d\\u800c\\u4e14\\u201c\\u957f\\u5bff\\u201d\\u7684\\u76ee\\u7684\\u3002\\u800c\\u81ea\\u5df1\\u642d\\u914d\\u996e\\u98df\\u662f\\u5f88\\u96be\\u505a\\u5f97\\u8fd9\\u4e48\\u7cbe\\u786e\\u7684\\uff0c\\u6240\\u4ee5\\u4ece\\u8fd9\\u4e2a\\u89d2\\u5ea6\\u6765\\u8bf4\\uff0c\\u6211\\u4eec\\u662f\\u4e00\\u76f4\\u9700\\u8981\\u8425\\u517b\\u8c03\\u7406\\u7684\\u3002<\\/p><p><br\\/><\\/p>\"}', '1479515288', '1479515288');
INSERT INTO `kl_user_log` VALUES ('153', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"\"}', '1479517619', '1479517619');
INSERT INTO `kl_user_log` VALUES ('154', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"position\":[\"12\",\"13\"],\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1479518567', '1479518567');
INSERT INTO `kl_user_log` VALUES ('155', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1480138169', '1480138169');
INSERT INTO `kl_user_log` VALUES ('156', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1480138475', '1480138475');
INSERT INTO `kl_user_log` VALUES ('157', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1480138974', '1480138974');
INSERT INTO `kl_user_log` VALUES ('158', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1480139326', '1480139326');
INSERT INTO `kl_user_log` VALUES ('159', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1480139949', '1480139949');
INSERT INTO `kl_user_log` VALUES ('160', '1', '生成图片sha1值', '127.0.0.1', '', '{\"\\/sys_picture\\/resetsha1_html\":\"\"}', '1480382817', '1480382817');
INSERT INTO `kl_user_log` VALUES ('161', '1', '生成图片sha1值', '127.0.0.1', '', '{\"\\/sys_picture\\/resetsha1_html\":\"\"}', '1480383065', '1480383065');
INSERT INTO `kl_user_log` VALUES ('162', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480383324', '1480383324');
INSERT INTO `kl_user_log` VALUES ('163', '1', '生成图片sha1值', '127.0.0.1', '', '{\"\\/sys_picture\\/resetsha1_html\":\"\"}', '1480383407', '1480383407');
INSERT INTO `kl_user_log` VALUES ('164', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"0\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\",\"tab_id\":\"4\"}', '1480383447', '1480383447');
INSERT INTO `kl_user_log` VALUES ('165', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480383481', '1480383481');
INSERT INTO `kl_user_log` VALUES ('166', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480383800', '1480383800');
INSERT INTO `kl_user_log` VALUES ('167', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480383875', '1480383875');
INSERT INTO `kl_user_log` VALUES ('168', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480383924', '1480383924');
INSERT INTO `kl_user_log` VALUES ('169', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480383968', '1480383968');
INSERT INTO `kl_user_log` VALUES ('170', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384030', '1480384030');
INSERT INTO `kl_user_log` VALUES ('171', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384094', '1480384094');
INSERT INTO `kl_user_log` VALUES ('172', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384127', '1480384127');
INSERT INTO `kl_user_log` VALUES ('173', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384201', '1480384201');
INSERT INTO `kl_user_log` VALUES ('174', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384333', '1480384333');
INSERT INTO `kl_user_log` VALUES ('175', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384357', '1480384357');
INSERT INTO `kl_user_log` VALUES ('176', '1', '生成图片缩略图', '127.0.0.1', '', '{\"\\/sys_picture\\/greatethumb_html\":\"\"}', '1480384453', '1480384453');
INSERT INTO `kl_user_log` VALUES ('177', '1', '生成图片sha1值', '127.0.0.1', '', '{\"\\/sys_picture\\/resetsha1_html\":\"\"}', '1480385349', '1480385349');
INSERT INTO `kl_user_log` VALUES ('178', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480401591', '1480401591');
INSERT INTO `kl_user_log` VALUES ('179', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"\\u7231\\u4f60\\u9177\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"0\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\",\"tab_id\":\"4\"}', '1480402128', '1480402128');
INSERT INTO `kl_user_log` VALUES ('180', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"www.ainiku.com\",\"shuiyin_text_color\":\"#000000\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"0\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\",\"tab_id\":\"4\"}', '1480402484', '1480402484');
INSERT INTO `kl_user_log` VALUES ('181', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"www.ainiku.com\",\"shuiyin_text_color\":\"#FFFFFF\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"center_center\",\"thumb_model\":\"1\",\"shuiyin_image\":\"0\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\",\"tab_id\":\"4\"}', '1480403133', '1480403133');
INSERT INTO `kl_user_log` VALUES ('182', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"admin_title\":\"\\u7ba1\\u7406\\u5e73\\u53f0\",\"list_rows\":\"15\",\"thumb_size\":\"200*200\",\"shuiyin_text\":\"www.ainiku.com\",\"shuiyin_text_color\":\"#FFFFFF\",\"shuiyin_text_size\":\"14\",\"shuiyin_minsize\":\"200*200\",\"shuiyin_on\":\"1\",\"shuiyin_model\":\"1\",\"shuiyin_pos\":\"bottom_right\",\"thumb_model\":\"1\",\"shuiyin_image\":\"0\",\"admin_theme\":\"default\",\"app_debug\":\"0\",\"app_trace\":\"0\",\"tab_id\":\"4\"}', '1480403157', '1480403157');
INSERT INTO `kl_user_log` VALUES ('183', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1480405047', '1480405047');
INSERT INTO `kl_user_log` VALUES ('184', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"tab_id\":\"3\"}', '1480728348', '1480728348');
INSERT INTO `kl_user_log` VALUES ('185', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"textarea\",\"form_id\":\"4\",\"title\":\"\\u57df\\u540d\\u767d\\u540d\\u5355\",\"name\":\"\",\"note\":\"\\u6bcf\\u4e2a\\u57df\\u540d\\u8bf7\\u7528\',\'\\u5206\\u9694,\\u5982 www.xxx.com,xxx.org,img.xxx.com\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"90\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1480731128', '1480731128');
INSERT INTO `kl_user_log` VALUES ('186', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"textarea\",\"form_id\":\"4\",\"title\":\"\\u57df\\u540d\\u767d\\u540d\\u5355\",\"name\":\"\",\"note\":\"\\u6bcf\\u4e2a\\u57df\\u540d\\u8bf7\\u7528\',\'\\u5206\\u9694,\\u5982 www.xxx.com,xxx.org,img.xxx.com\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"90\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1480731221', '1480731221');
INSERT INTO `kl_user_log` VALUES ('187', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"textarea\",\"form_id\":\"4\",\"title\":\"\\u57df\\u540d\\u767d\\u540d\\u5355\",\"name\":\"allow_domain\",\"note\":\"\\u6bcf\\u4e2a\\u57df\\u540d\\u8bf7\\u7528\',\'\\u5206\\u9694,\\u5982 www.xxx.com,xxx.org,img.xxx.com\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"90\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"141\"}', '1480731246', '1480731246');
INSERT INTO `kl_user_log` VALUES ('188', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733105', '1480733105');
INSERT INTO `kl_user_log` VALUES ('189', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733122', '1480733122');
INSERT INTO `kl_user_log` VALUES ('190', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733175', '1480733175');
INSERT INTO `kl_user_log` VALUES ('191', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733202', '1480733202');
INSERT INTO `kl_user_log` VALUES ('192', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733244', '1480733244');
INSERT INTO `kl_user_log` VALUES ('193', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=775\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href=\\\"http:\\/\\/yingxiao.loc\\/video\\/about.php?movies_id=774\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733294', '1480733294');
INSERT INTO `kl_user_log` VALUES ('194', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733349', '1480733349');
INSERT INTO `kl_user_log` VALUES ('195', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733391', '1480733391');
INSERT INTO `kl_user_log` VALUES ('196', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733444', '1480733444');
INSERT INTO `kl_user_log` VALUES ('197', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733475', '1480733475');
INSERT INTO `kl_user_log` VALUES ('198', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733526', '1480733526');
INSERT INTO `kl_user_log` VALUES ('199', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"allow_domain\":\"www.zhaokeli.com\",\"tab_id\":\"90\"}', '1480733554', '1480733554');
INSERT INTO `kl_user_log` VALUES ('200', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u8ba9\\u4eba\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u75c5\\u597d\\u540e\\u80fd\\u4e0d\\u80fd\\u505c\\u7528\\uff1f\",\"color\":\"#000000\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\\u8425\\u517b\\u7d20,\\u4f1a\\u4e0d\\u4f1a,\\u8ba9\\u4eba,\\u4ea7\\u751f,\\u4f9d\\u8d56\\u6027,\\u75c5\\u597d,\\u80fd\\u4e0d\\u80fd,\\u505c\\u7528,\\u8425\\u517b,\\u8c03\\u7406,\\u8425\\u517b\\u7d20,\\u6211\\u4eec,\\u4ea7\\u751f,\\u8fd9\\u4e2a\",\"meta_descr\":\"sdaf\\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f1a\\u5458\\u901a\\u8fc7\\u8425\\u517b\\u8c03\\u7406\\u83b7\\u5f97\\u4e86\\u5f88\\u597d\\u7684\\u8c03\\u7406\\u6548\\u679c\\uff0c\\u4ed6\\u4eec\\u5728\\u9ad8\\u5174\\u4e4b\\u4f59\\u4e5f\\u591a\\u591a\\u5c11\\u5c11\\u6709\\u4e00\\u4e9b\\u7591\\u8651\\uff0c\\u4e0d\\u77e5\\u9053\\u8425\\u517b\\u7d20\\u4f1a\\u4e0d\\u4f1a\\u50cf\\u4e00\\u4e9b\\u7279\\u6548\\u836f\\u7269\\u4e00\\u6837\\u8ba9\\u4eba\\u4f53\\u4ea7\\u751f\\u4f9d\\u8d56\\u6027\\uff1f\\u4e0b\\u9762\\u6211\\u4eec\\u4e00\\u8d77\\u6765...\",\"pic\":\"7\",\"article_id\":\"7\",\"content\":\"<p><br\\/><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><img class=\\\"lazy img-responsive w100\\\" src=\\\"\\/uploads\\/image\\/20161119\\/1479517894138467.png\\\"\\/><img src=\\\"\\/uploads\\/image\\/20161119\\/1479518045493746.png\\\" title=\\\"1479518045493746.png\\\" alt=\\\"QQ\\u622a\\u56fe20161025103048.png\\\"\\/><\\/a><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518529101038.rar\\\" title=\\\"404\\u9875\\u9762.rar\\\">404\\u9875\\u9762.rar<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p style=\\\"line-height: 16px;\\\"><img src=\\\"\\/public\\/static\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\\\"\\/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"\\/uploads\\/file\\/other\\/20161119\\/1479518470109748.gif\\\" title=\\\"21.gif\\\">21.gif<\\/a><\\/p><p><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><br\\/><\\/p><p class=\\\"text-overflow plr5 mtb5\\\" style=\\\"box-sizing: border-box; padding-left: 5px; padding-right: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\\\"><a href=\\\"<img class=\\\" title=\\\"1479518045493746.png\\\" style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\">\\u795e\\u76fe\\u5c40\\u7279\\u5de5\\u7b2c\\u56db\\u5b63<\\/a><\\/p><p><a href=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\" target=\\\"_blank\\\" title=\\\"https:\\/\\/www.zhaokeli.com\\/cat\\/index.html\\\">https:\\/\\/www.zhaokeli.com\\/cat\\/index.html<\\/a><\\/p><p><a href style=\\\"box-sizing: border-box; color: rgb(51, 51, 51); text-decoration: none; background-color: transparent;\\\"><\\/a><\\/p><p><br\\/><\\/p>\"}', '1480733560', '1480733560');
INSERT INTO `kl_user_log` VALUES ('201', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"radio\",\"form_id\":\"4\",\"title\":\"\\u8fc7\\u6ee4\\u6587\\u7ae0\\u4e2d\\u4e0d\\u5728\\u57df\\u540d\\u767d\\u540d\\u5355\\u7684\\u5916\\u94fe\",\"name\":\"filter_link\",\"note\":\"\\u6dfb\\u52a0\\u7f16\\u8f91\\u6587\\u7ae0\\u65f6\\u81ea\\u52a8\\u8fc7\\u6ee4\\u5916\\u94fe\",\"value\":\"1\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"90\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"0:\\u4e0d\\u8fc7\\u6ee4\\r\\n1:\\u8fc7\\u6ee4\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1480733729', '1480733729');
INSERT INTO `kl_user_log` VALUES ('202', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"textarea\",\"form_id\":\"4\",\"title\":\"\\u57df\\u540d\\u6216ip\\u9ed1\\u540d\\u5355\",\"name\":\"denied_domain\",\"note\":\"\\u7981\\u6b62\\u8bbf\\u95ee\\u7684\\u57df\\u540d\\u6216IP,\\u7528\',\'\\u5206\\u9694\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"90\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1480734094', '1480734094');
INSERT INTO `kl_user_log` VALUES ('203', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"filter_link\":\"1\",\"allow_domain\":\"www.zhaokeli.com\",\"denied_domain\":\"127.0.0.1\",\"tab_id\":\"90\"}', '1480734704', '1480734704');
INSERT INTO `kl_user_log` VALUES ('204', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480737623', '1480737623');
INSERT INTO `kl_user_log` VALUES ('205', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480737655', '1480737655');
INSERT INTO `kl_user_log` VALUES ('206', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480737732', '1480737732');
INSERT INTO `kl_user_log` VALUES ('207', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480737788', '1480737788');
INSERT INTO `kl_user_log` VALUES ('208', '1', '删除表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/delete\\/form_item_id\\/135_html\":\"\",\"form_item_id\":\"135\"}', '1480737928', '1480737928');
INSERT INTO `kl_user_log` VALUES ('209', '1', '删除表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/delete\\/form_item_id\\/136_html\":\"\",\"form_item_id\":\"136\"}', '1480737936', '1480737936');
INSERT INTO `kl_user_log` VALUES ('210', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480737986', '1480737986');
INSERT INTO `kl_user_log` VALUES ('211', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480738093', '1480738093');
INSERT INTO `kl_user_log` VALUES ('212', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480738208', '1480738208');
INSERT INTO `kl_user_log` VALUES ('213', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480738239', '1480738239');
INSERT INTO `kl_user_log` VALUES ('214', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480738273', '1480738273');
INSERT INTO `kl_user_log` VALUES ('215', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480738313', '1480738313');
INSERT INTO `kl_user_log` VALUES ('216', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480738533', '1480738533');
INSERT INTO `kl_user_log` VALUES ('217', '1', '更新kl_article.is_original字段结构', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"radio\",\"form_id\":\"7\",\"title\":\"\\u662f\\u5426\\u539f\\u521b\",\"name\":\"is_original\",\"note\":\"\\u6b64\\u6587\\u7ae0\\u662f\\u5426\\u662f\\u539f\\u521b\\u6587\\u7ae0\",\"value\":\"1\",\"sort\":\"95\",\"is_require\":\"0\",\"tab_id\":\"0\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"0:\\u8f6c\\u8f7d\\r\\n1:\\u539f\\u521b\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"142\"}', '1480739853', '1480739853');
INSERT INTO `kl_user_log` VALUES ('218', '1', '编辑表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/edit_html\":\"\",\"type\":\"radio\",\"form_id\":\"7\",\"title\":\"\\u662f\\u5426\\u539f\\u521b\",\"name\":\"is_original\",\"note\":\"\\u6b64\\u6587\\u7ae0\\u662f\\u5426\\u662f\\u539f\\u521b\\u6587\\u7ae0\",\"value\":\"1\",\"sort\":\"95\",\"is_require\":\"0\",\"tab_id\":\"0\",\"auto_greate\":\"1\",\"status\":\"1\",\"extra\":\"0:\\u8f6c\\u8f7d\\r\\n1:\\u539f\\u521b\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\",\"form_item_id\":\"142\"}', '1480739853', '1480739853');
INSERT INTO `kl_user_log` VALUES ('219', '1', '添加文章', '127.0.0.1', '', '{\"\\/sys_article\\/add_html\":\"\",\"category_id\":\"1\",\"title\":\"99999999999999999999\",\"color\":\"#000000\",\"is_original\":\"1\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"0\",\"content\":\"<p>5555555555<br\\/><\\/p>\"}', '1480904023', '1480904023');
INSERT INTO `kl_user_log` VALUES ('220', '1', '添加表单项', '127.0.0.1', '', '{\"\\/sys_formitem\\/add_html\":\"\",\"type\":\"textarea\",\"form_id\":\"4\",\"title\":\"\\u767e\\u5ea6\\u94fe\\u63a5\\u4e3b\\u52a8\\u63a8\\u9001\",\"name\":\"baidu_push_article\",\"note\":\"\\u586b\\u5199\\u63a8\\u9001\\u7684site,token,link\\u7528|\\u5206\\u9694\\u5f00,link\\u4e2d\\u53ef\\u7528{id}\\u4e3a\\u70b9\\u4f4d\\u7b26\\u66ff\\u6362\\u6587\\u7ae0id\",\"value\":\"\",\"sort\":\"50\",\"is_require\":\"0\",\"tab_id\":\"6\",\"auto_greate\":\"0\",\"status\":\"1\",\"extra\":\"\",\"is_show\":\"3\",\"data_ts\":\"\",\"data_err\":\"\",\"data_ok\":\"\",\"data_reg\":\"\"}', '1480904747', '1480904747');
INSERT INTO `kl_user_log` VALUES ('221', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"baidu_push_article\":\"www.zhaokeli.com|j8pptT7xaAxv7tPc|http:\\/\\/www.zhaokeli.com\\/article\\/{id}.html\",\"tab_id\":\"6\"}', '1480904856', '1480904856');
INSERT INTO `kl_user_log` VALUES ('222', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1480905271', '1480905271');
INSERT INTO `kl_user_log` VALUES ('223', '1', '添加文章', '127.0.0.1', '', '{\"\\/sys_article\\/add_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"\",\"meta_descr\":\"\",\"pic\":\"0\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1480905312', '1480905312');
INSERT INTO `kl_user_log` VALUES ('224', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1480905530', '1480905530');
INSERT INTO `kl_user_log` VALUES ('225', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1481253977', '1481253977');
INSERT INTO `kl_user_log` VALUES ('226', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1481365165', '1481365165');
INSERT INTO `kl_user_log` VALUES ('227', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1481367841', '1481367841');
INSERT INTO `kl_user_log` VALUES ('228', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481367905', '1481367905');
INSERT INTO `kl_user_log` VALUES ('229', '1', '清理缓存', '127.0.0.1', '', '{\"\\/sys_other\\/clearcache_html\":\"\"}', '1481367915', '1481367915');
INSERT INTO `kl_user_log` VALUES ('230', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481367940', '1481367940');
INSERT INTO `kl_user_log` VALUES ('231', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368088', '1481368088');
INSERT INTO `kl_user_log` VALUES ('232', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368176', '1481368176');
INSERT INTO `kl_user_log` VALUES ('233', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368181', '1481368181');
INSERT INTO `kl_user_log` VALUES ('234', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368290', '1481368290');
INSERT INTO `kl_user_log` VALUES ('235', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368389', '1481368389');
INSERT INTO `kl_user_log` VALUES ('236', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368513', '1481368513');
INSERT INTO `kl_user_log` VALUES ('237', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368590', '1481368590');
INSERT INTO `kl_user_log` VALUES ('238', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368907', '1481368907');
INSERT INTO `kl_user_log` VALUES ('239', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481368999', '1481368999');
INSERT INTO `kl_user_log` VALUES ('240', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481369476', '1481369476');
INSERT INTO `kl_user_log` VALUES ('241', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"555555555555555\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"555555555555555,6666666666666666666666666666\",\"meta_descr\":\"6666666666666666666666666666...\",\"pic\":\"0\",\"article_id\":\"9\",\"content\":\"<p>6666666666666666666666666666<br\\/><\\/p>\"}', '1481369582', '1481369582');
INSERT INTO `kl_user_log` VALUES ('242', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481369594', '1481369594');
INSERT INTO `kl_user_log` VALUES ('243', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481369664', '1481369664');
INSERT INTO `kl_user_log` VALUES ('244', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481369911', '1481369911');
INSERT INTO `kl_user_log` VALUES ('245', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481369929', '1481369929');
INSERT INTO `kl_user_log` VALUES ('246', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481370106', '1481370106');
INSERT INTO `kl_user_log` VALUES ('247', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481370179', '1481370179');
INSERT INTO `kl_user_log` VALUES ('248', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481370492', '1481370492');
INSERT INTO `kl_user_log` VALUES ('249', '1', '编辑文章', '127.0.0.1', '', '{\"\\/sys_article\\/edit_html\":\"\",\"category_id\":\"1\",\"title\":\"99999999999999999999\",\"color\":\"#000000\",\"is_original\":\"1\",\"src_link\":\"\",\"status\":\"1\",\"meat_title\":\"\",\"meta_keywords\":\"99999999999999999999,5555555555\",\"meta_descr\":\"5555555555...\",\"pic\":\"0\",\"article_id\":\"8\",\"content\":\"<p>5555555555<br\\/><\\/p>\"}', '1481370503', '1481370503');
INSERT INTO `kl_user_log` VALUES ('250', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"baidu_push_article\":\"www.zhaokeli.com|j8pptT7xaAxv7tPc|http:\\/\\/www.zhaokeli.com\\/article\\/{id}.html\",\"tab_id\":\"6\"}', '1481370947', '1481370947');
INSERT INTO `kl_user_log` VALUES ('251', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/notepad_html\":\"\",\"name\":\"notepad\"}', '1481383255', '1481383255');
INSERT INTO `kl_user_log` VALUES ('252', '1', '退出登陆', '127.0.0.1', '', '{\"\\/sys_other\\/loginout_html\":\"\"}', '1481432550', '1481432550');
INSERT INTO `kl_user_log` VALUES ('253', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481467005', '1481467005');
INSERT INTO `kl_user_log` VALUES ('254', '1', '更新网站配置', '127.0.0.1', '', '{\"\\/sys_config\\/group_html\":\"\",\"web_domain\":\"http:\\/\\/www.ainiku5.loc\",\"web_meta_title\":\"\",\"web_meta_keywords\":\"\",\"web_meta_descr\":\"\",\"web_logo\":\"0\",\"third_code\":\"\",\"index_theme\":\"default\",\"web_site_icp\":\"\",\"tab_id\":\"3\"}', '1481467169', '1481467169');
INSERT INTO `kl_user_log` VALUES ('255', '1', '卸载插件', '127.0.0.1', '', '{\"\\/sys_addon\\/uninstall\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481470484', '1481470484');
INSERT INTO `kl_user_log` VALUES ('256', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481470499', '1481470499');
INSERT INTO `kl_user_log` VALUES ('257', '1', '卸载插件', '127.0.0.1', '', '{\"\\/sys_addon\\/uninstall\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481470623', '1481470623');
INSERT INTO `kl_user_log` VALUES ('258', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481470634', '1481470634');
INSERT INTO `kl_user_log` VALUES ('259', '1', '卸载插件', '127.0.0.1', '', '{\"\\/sys_addon\\/uninstall\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481470660', '1481470660');
INSERT INTO `kl_user_log` VALUES ('260', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481470962', '1481470962');
INSERT INTO `kl_user_log` VALUES ('261', '1', '卸载插件', '127.0.0.1', '', '{\"\\/sys_addon\\/uninstall\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481471065', '1481471065');
INSERT INTO `kl_user_log` VALUES ('262', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/qconnect_html\":\"\",\"name\":\"qconnect\"}', '1481471081', '1481471081');
INSERT INTO `kl_user_log` VALUES ('263', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/alipay_html\":\"\",\"name\":\"alipay\"}', '1481549729', '1481549729');
INSERT INTO `kl_user_log` VALUES ('264', '1', '安装插件', '127.0.0.1', '', '{\"\\/sys_addon\\/install\\/name\\/excel_html\":\"\",\"name\":\"excel\"}', '1481640602', '1481640602');

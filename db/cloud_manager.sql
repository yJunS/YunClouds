/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : cloud_manager

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-05-05 13:03:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_app
-- ----------------------------
DROP TABLE IF EXISTS `t_app`;
CREATE TABLE `t_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appName` varchar(255) DEFAULT NULL,
  `appServer` varchar(255) DEFAULT NULL,
  `yzKey` varchar(255) DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_app
-- ----------------------------
INSERT INTO `t_app` VALUES ('1', '会控系统', 'http://mymeeting.peony.cn', 'mymeeting', '1', '0');
INSERT INTO `t_app` VALUES ('2', 'WeiXin', null, 'weixin', '1', '1');

-- ----------------------------
-- Table structure for t_app_user
-- ----------------------------
DROP TABLE IF EXISTS `t_app_user`;
CREATE TABLE `t_app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `thirdServerUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_app_user
-- ----------------------------
INSERT INTO `t_app_user` VALUES ('2', '2', '1', '1');

-- ----------------------------
-- Table structure for t_buttom
-- ----------------------------
DROP TABLE IF EXISTS `t_buttom`;
CREATE TABLE `t_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `buttom` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buttom
-- ----------------------------
INSERT INTO `t_buttom` VALUES ('1', '新增', '<button type=\"button\" id=\"addFun\" class=\"btn btn-primary marR10\">新增</button>', '');
INSERT INTO `t_buttom` VALUES ('2', '编辑', '<button type=\"button\" id=\"editFun\" class=\"btn btn-info marR10\">编辑</button>', null);
INSERT INTO `t_buttom` VALUES ('3', '删除', '<button type=\"button\" id=\"delFun\" class=\"btn btn-danger marR10\">删除</button>', null);
INSERT INTO `t_buttom` VALUES ('4', '上传', '<button type=\"button\" id=\"upLoad\" class=\"btn btn-primary marR10\">上传</button>', null);
INSERT INTO `t_buttom` VALUES ('5', '下载', '<button type=\"button\" id=\"downLoad\" class=\"btn btn-primary marR10\">下载</button>', null);
INSERT INTO `t_buttom` VALUES ('6', '上移', '<button type=\"button\" id=\"lyGridUp\" class=\"btn btn-success marR10\">上移</button>', null);
INSERT INTO `t_buttom` VALUES ('7', '下移', '<button type=\"button\" id=\"lyGridDown\" class=\"btn btn btn-grey marR10\">下移</button>', null);
INSERT INTO `t_buttom` VALUES ('8', '分配权限', '<button type=\"button\" id=\"permissions\" class=\"btn btn btn-grey marR10\">分配权限</button>', null);

-- ----------------------------
-- Table structure for t_card
-- ----------------------------
DROP TABLE IF EXISTS `t_card`;
CREATE TABLE `t_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_card
-- ----------------------------
INSERT INTO `t_card` VALUES ('1', '1001918228000011', '000011');

-- ----------------------------
-- Table structure for t_cardserver
-- ----------------------------
DROP TABLE IF EXISTS `t_cardserver`;
CREATE TABLE `t_cardserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_cardserver
-- ----------------------------
INSERT INTO `t_cardserver` VALUES ('1', '211.145.15.141', '6959');

-- ----------------------------
-- Table structure for t_card_traninfo
-- ----------------------------
DROP TABLE IF EXISTS `t_card_traninfo`;
CREATE TABLE `t_card_traninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardId` int(11) DEFAULT NULL,
  `merchantId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchantName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terminalId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tranType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tranDate` datetime DEFAULT NULL,
  `tranAmount` double(100,2) DEFAULT NULL,
  `hostTranLs` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tranls_id` (`hostTranLs`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_card_traninfo
-- ----------------------------
INSERT INTO `t_card_traninfo` VALUES ('604', '1', '003010258120060', '测试', '00000060', '05', '2017-09-18 13:14:21', '0.02', '000000000055');
INSERT INTO `t_card_traninfo` VALUES ('605', '1', '003010258120060', '测试', '00000060', '05', '2017-09-18 10:11:23', '0.01', '000000000003');
INSERT INTO `t_card_traninfo` VALUES ('606', '1', '003010258120060', '测试', '00000060', '05', '2017-09-17 01:12:34', '0.01', '000000000002');

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `state` int(2) NOT NULL,
  `isAvailable` int(2) DEFAULT NULL,
  `partId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `t_company_ibfk_1` (`partId`),
  CONSTRAINT `t_company_ibfk_1` FOREIGN KEY (`partId`) REFERENCES `t_part` (`id`),
  CONSTRAINT `t_company_ibfk_2` FOREIGN KEY (`type`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '网智云通', '张向东', '123@123.com', '15826156271', '1', '1', '1', '1');
INSERT INTO `t_company` VALUES ('2', '汇海创新', '张欣宇', 'zxy@zec.com', '1862879271', '2', '1', '1', '1');
INSERT INTO `t_company` VALUES ('3', '新创同辉', '周庆隼', 'asd@asd.com', '15826156275', '3', '1', '1', '2');
INSERT INTO `t_company` VALUES ('6', '尚地股份有限公司', '孙尚', 'sad@sina.com', '15809392019', '4', '1', '1', '1');
INSERT INTO `t_company` VALUES ('7', '尚地股份有限公司1', '孙尚1', null, '15826156272', '3', '1', '1', '1');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `isAvailable` int(2) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`companyId`) USING BTREE,
  CONSTRAINT `t_dept_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `t_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '研发部', '1', '1', '0');
INSERT INTO `t_dept` VALUES ('2', '研发小组', '1', '1', '1');
INSERT INTO `t_dept` VALUES ('3', 'abc1', '1', '1', '2');
INSERT INTO `t_dept` VALUES ('4', 'ccc', '1', '1', '0');
INSERT INTO `t_dept` VALUES ('5', 'ddd', '1', '1', '4');
INSERT INTO `t_dept` VALUES ('6', 'eeee', '1', '1', '5');
INSERT INTO `t_dept` VALUES ('7', 'ggggg', '1', '1', '6');
INSERT INTO `t_dept` VALUES ('10', 'kkkkk', '1', '2', '0');
INSERT INTO `t_dept` VALUES ('11', '阿萨德', '1', '2', '10');
INSERT INTO `t_dept` VALUES ('12', '啊赛迪网企鹅', '1', '2', '0');

-- ----------------------------
-- Table structure for t_dept_person
-- ----------------------------
DROP TABLE IF EXISTS `t_dept_person`;
CREATE TABLE `t_dept_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptId` int(11) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `isLeader` int(2) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_dept_person` (`companyId`,`deptId`,`personId`) USING BTREE,
  KEY `companyId` (`companyId`) USING BTREE,
  KEY `personId` (`personId`) USING BTREE,
  KEY `deptId` (`deptId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept_person
-- ----------------------------
INSERT INTO `t_dept_person` VALUES ('14', '1', '11', null, '1');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_group_res
-- ----------------------------
DROP TABLE IF EXISTS `t_group_res`;
CREATE TABLE `t_group_res` (
  `groupId` int(11) NOT NULL,
  `resId` int(11) NOT NULL,
  PRIMARY KEY (`groupId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group_res
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `methods` varchar(30) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', 'admin', '系统管理', '用户管理-修改账号', '17050', '127.0.0.1', '2016-07-08 15:33:22', '执行成功!');
INSERT INTO `t_log` VALUES ('2', 'admin', '系统管理', '用户管理-修改账号', '16', '127.0.0.1', '2016-07-08 15:38:23', '执行成功!');
INSERT INTO `t_log` VALUES ('3', 'hdfdsfw', '系统管理', '用户管理-修改密码', '66813', '127.0.0.1', '2016-09-07 16:06:45', '执行成功!');
INSERT INTO `t_log` VALUES ('4', 'hdfdsfw', '系统管理', '用户管理-修改密码', '34218', '127.0.0.1', '2016-09-07 16:11:28', '执行成功!');
INSERT INTO `t_log` VALUES ('5', 'hdfdsfw', '系统管理', '用户管理-修改密码', '5492', '127.0.0.1', '2016-09-07 16:12:43', '执行成功!');
INSERT INTO `t_log` VALUES ('6', 'hdfdsfw', '系统管理', '用户管理-修改密码', '52568', '127.0.0.1', '2016-09-07 16:14:07', '执行成功!');
INSERT INTO `t_log` VALUES ('7', 'hdfdsfw', '系统管理', '用户管理-修改密码', '94010', '127.0.0.1', '2016-09-07 16:16:31', '执行成功!');
INSERT INTO `t_log` VALUES ('8', 'hdfdsfw', '系统管理', '用户管理-修改密码', '44896', '127.0.0.1', '2016-09-07 16:17:57', '执行成功!');
INSERT INTO `t_log` VALUES ('9', 'hdfdsfw', '系统管理', '用户管理-修改密码', '140569', '127.0.0.1', '2016-09-07 16:20:54', '执行成功!');
INSERT INTO `t_log` VALUES ('10', 'hdfdsfw', '系统管理', '用户管理-修改密码', '23527', '127.0.0.1', '2016-09-07 16:21:18', '执行成功!');
INSERT INTO `t_log` VALUES ('11', 'hdfdsfw', '系统管理', '用户管理-修改密码', '872283', '127.0.0.1', '2016-09-07 16:35:27', '执行成功!');
INSERT INTO `t_log` VALUES ('12', 'hdfdsfw', '系统管理', '用户管理-修改密码', '5092', '127.0.0.1', '2016-09-07 16:43:26', '执行成功!');
INSERT INTO `t_log` VALUES ('13', 'admin', '系统管理', '用户管理-新增账号', '1938', '127.0.0.1', '2016-09-08 15:02:08', '执行成功!');
INSERT INTO `t_log` VALUES ('14', 'admin', '系统管理', '用户管理-新增账号', '288', '127.0.0.1', '2016-09-08 15:05:49', '执行成功!');
INSERT INTO `t_log` VALUES ('15', 'admin', '系统管理', '用户管理-新增账号', '81958', '127.0.0.1', '2016-09-08 15:11:15', '执行成功!');
INSERT INTO `t_log` VALUES ('16', 'admin', '系统管理', '用户管理-新增账号', '127368', '127.0.0.1', '2016-09-08 15:25:28', '执行成功!');
INSERT INTO `t_log` VALUES ('17', 'admin', '系统管理', '用户管理-新增账号', '36754', '127.0.0.1', '2016-09-08 15:26:40', '执行成功!');
INSERT INTO `t_log` VALUES ('18', 'admin', '系统管理', '用户管理-修改密码', '68', '127.0.0.1', '2016-10-11 17:20:43', '执行成功!');
INSERT INTO `t_log` VALUES ('19', 'admin', '系统管理', '用户管理-修改密码', '207239', '127.0.0.1', '2016-10-11 17:31:19', '执行成功!');
INSERT INTO `t_log` VALUES ('20', 'admin', '系统管理', '用户管理-修改密码', '3009', '127.0.0.1', '2016-10-11 17:31:31', '执行成功!');
INSERT INTO `t_log` VALUES ('21', 'admin', '系统管理', '用户管理-修改密码', '2274', '127.0.0.1', '2016-10-11 17:32:44', '执行成功!');
INSERT INTO `t_log` VALUES ('22', 'admin', '系统管理', '用户管理-修改密码', '127', '127.0.0.1', '2016-10-11 17:35:18', '执行成功!');
INSERT INTO `t_log` VALUES ('23', 'admin', '系统管理', '用户管理-修改密码', '40', '127.0.0.1', '2016-10-11 17:35:37', '执行成功!');
INSERT INTO `t_log` VALUES ('24', 'admin', '系统管理', '公司管理-修改公司信息', '62', '127.0.0.1', '2017-07-18 10:15:01', '执行成功!');
INSERT INTO `t_log` VALUES ('25', 'admin', '系统管理', '公司管理-修改公司信息', '9', '127.0.0.1', '2017-07-18 10:15:11', '执行成功!');
INSERT INTO `t_log` VALUES ('26', 'admin', '系统管理', '公司管理-新增公司', '34436', '127.0.0.1', '2017-07-18 10:26:26', '执行成功!');
INSERT INTO `t_log` VALUES ('27', 'admin', '系统管理', '公司管理-新增公司', '10', '127.0.0.1', '2017-07-18 10:29:33', '执行成功!');
INSERT INTO `t_log` VALUES ('28', '15801829182', '系统管理', '用户管理-删除账号', '11', '127.0.0.1', '2017-07-18 12:07:12', '执行成功!');
INSERT INTO `t_log` VALUES ('29', '15801829182', '系统管理', '公司管理-删除公司', '5', '127.0.0.1', '2017-07-18 12:08:46', '执行成功!');
INSERT INTO `t_log` VALUES ('30', '15801829182', '系统管理', '公司管理-修改公司信息', '1', '127.0.0.1', '2017-07-18 14:17:45', '执行成功!');
INSERT INTO `t_log` VALUES ('31', '15801829182', '系统管理', '公司管理-修改公司信息', '12', '127.0.0.1', '2017-07-18 14:17:50', '执行成功!');
INSERT INTO `t_log` VALUES ('32', '15801829182', '系统管理', '用户管理-删除账号', '12', '127.0.0.1', '2017-07-19 16:44:35', '执行成功!');
INSERT INTO `t_log` VALUES ('33', '15801829182', '系统管理', '用户管理-删除账号', '9', '127.0.0.1', '2017-07-19 16:46:42', '执行成功!');
INSERT INTO `t_log` VALUES ('34', '15801829182', '系统管理', '用户管理-新增账号', '32', '127.0.0.1', '2017-07-19 17:09:19', '执行成功!');
INSERT INTO `t_log` VALUES ('35', '15801829182', '系统管理', '用户管理-删除账号', '10', '127.0.0.1', '2017-07-19 17:10:07', '执行成功!');
INSERT INTO `t_log` VALUES ('36', '15801829182', '系统管理', '用户管理-新增账号', '12', '127.0.0.1', '2017-07-19 17:27:02', '执行成功!');
INSERT INTO `t_log` VALUES ('37', '15801829182', '系统管理', '用户管理-新增账号', '8', '127.0.0.1', '2017-07-19 17:27:54', '执行成功!');
INSERT INTO `t_log` VALUES ('38', '15801829182', '系统管理', '用户管理-删除账号', '12103', '127.0.0.1', '2017-07-19 17:56:33', '执行成功!');
INSERT INTO `t_log` VALUES ('39', '15801829182', '系统管理', '用户管理/组管理-修改权限', '10', '127.0.0.1', '2017-07-19 18:09:00', '执行成功!');
INSERT INTO `t_log` VALUES ('40', '15801829182', '系统管理', '用户管理-删除账号', '6262', '127.0.0.1', '2017-07-19 18:09:41', '执行成功!');
INSERT INTO `t_log` VALUES ('41', '15801829182', '系统管理', '用户管理-新增账号', '19', '127.0.0.1', '2017-07-19 18:19:05', '执行成功!');
INSERT INTO `t_log` VALUES ('42', '15801829182', '系统管理', '用户管理-删除账号', '5422', '127.0.0.1', '2017-07-19 18:19:44', '执行成功!');
INSERT INTO `t_log` VALUES ('43', '无法获取登录用户信息！', '系统管理', '用户管理-新增账号', '9', '127.0.0.1', '2017-07-19 18:22:34', '执行成功!');
INSERT INTO `t_log` VALUES ('44', 'admin', '系统管理', '用户管理-新增账号', '15', '127.0.0.1', '2017-07-20 10:32:49', '执行成功!');
INSERT INTO `t_log` VALUES ('45', 'admin', '系统管理', '用户管理-删除账号', '64', '127.0.0.1', '2017-07-20 10:33:49', '执行成功!');
INSERT INTO `t_log` VALUES ('46', 'simple', '系统管理', '公司管理-新增员工', '3', '127.0.0.1', '2017-07-20 11:14:27', '执行成功!');
INSERT INTO `t_log` VALUES ('47', 'simple', '系统管理', '公司管理-新增员工', '61225', '127.0.0.1', '2017-07-20 11:25:52', '执行成功!');
INSERT INTO `t_log` VALUES ('48', 'simple', '系统管理', '公司管理-新增员工', '4703', '127.0.0.1', '2017-07-20 11:55:15', '执行成功!');
INSERT INTO `t_log` VALUES ('49', 'simple', '系统管理', '公司管理-删除员工', '13818', '127.0.0.1', '2017-07-20 12:14:44', '执行成功!');
INSERT INTO `t_log` VALUES ('50', 'simple', '系统管理', '公司管理-新增员工', '17272', '127.0.0.1', '2017-07-20 12:15:42', '执行成功!');
INSERT INTO `t_log` VALUES ('51', 'simple', '系统管理', '公司管理-新增员工', '114947', '127.0.0.1', '2017-07-20 12:18:13', '执行成功!');
INSERT INTO `t_log` VALUES ('52', 'simple', '系统管理', '公司管理-删除员工', '2008', '127.0.0.1', '2017-07-20 12:19:02', '执行成功!');
INSERT INTO `t_log` VALUES ('53', 'simple', '系统管理', '公司管理-新增员工', '10204', '127.0.0.1', '2017-07-20 12:19:41', '执行成功!');
INSERT INTO `t_log` VALUES ('54', 'simple', '系统管理', '公司管理-新增员工', '23432', '127.0.0.1', '2017-07-20 12:26:35', '执行成功!');
INSERT INTO `t_log` VALUES ('55', 'simple', '系统管理', '公司管理-删除员工', '464', '127.0.0.1', '2017-07-20 12:26:59', '执行成功!');
INSERT INTO `t_log` VALUES ('56', 'admin', '系统管理', '用户管理-新增账号', '15', '127.0.0.1', '2017-07-20 16:34:34', '执行成功!');
INSERT INTO `t_log` VALUES ('57', 'admin', '系统管理', '公司管理-新增公司', '1', '127.0.0.1', '2017-07-20 16:58:53', '执行成功!');
INSERT INTO `t_log` VALUES ('58', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 16:58:59', '执行成功!');
INSERT INTO `t_log` VALUES ('59', 'admin', '系统管理', '公司管理-新增公司', '7216', '127.0.0.1', '2017-07-20 17:10:34', '执行成功!');
INSERT INTO `t_log` VALUES ('60', 'admin', '系统管理', '公司管理-新增公司', '3205', '127.0.0.1', '2017-07-20 17:11:30', '执行成功!');
INSERT INTO `t_log` VALUES ('61', 'admin', '系统管理', '公司管理-新增公司', '2214', '127.0.0.1', '2017-07-20 17:11:52', '执行成功!');
INSERT INTO `t_log` VALUES ('62', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:13:05', '执行成功!');
INSERT INTO `t_log` VALUES ('63', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:13:41', '执行成功!');
INSERT INTO `t_log` VALUES ('64', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:17:43', '执行成功!');
INSERT INTO `t_log` VALUES ('65', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:18:01', '执行成功!');
INSERT INTO `t_log` VALUES ('66', 'admin', '系统管理', '公司管理-新增公司', '1', '127.0.0.1', '2017-07-20 17:18:51', '执行成功!');
INSERT INTO `t_log` VALUES ('67', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:19:11', '执行成功!');
INSERT INTO `t_log` VALUES ('68', 'admin', '系统管理', '公司管理-新增公司', '1', '127.0.0.1', '2017-07-20 17:19:29', '执行成功!');
INSERT INTO `t_log` VALUES ('69', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:25:27', '执行成功!');
INSERT INTO `t_log` VALUES ('70', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:26:34', '执行成功!');
INSERT INTO `t_log` VALUES ('71', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:27:11', '执行成功!');
INSERT INTO `t_log` VALUES ('72', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:28:07', '执行成功!');
INSERT INTO `t_log` VALUES ('73', 'admin', '系统管理', '公司管理-新增公司', '10', '127.0.0.1', '2017-07-20 17:40:52', '执行成功!');
INSERT INTO `t_log` VALUES ('74', 'admin', '系统管理', '公司管理-新增公司', '14', '127.0.0.1', '2017-07-20 17:41:14', '执行成功!');
INSERT INTO `t_log` VALUES ('75', 'admin', '系统管理', '公司管理-新增公司', '1', '127.0.0.1', '2017-07-20 17:44:39', '执行成功!');
INSERT INTO `t_log` VALUES ('76', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:45:37', '执行成功!');
INSERT INTO `t_log` VALUES ('77', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-20 17:45:46', '执行成功!');
INSERT INTO `t_log` VALUES ('78', 'admin', '系统管理', '公司管理-新增公司', '3196', '127.0.0.1', '2017-07-20 18:02:11', '执行成功!');
INSERT INTO `t_log` VALUES ('79', 'admin', '系统管理', '公司管理-新增公司', '6110', '127.0.0.1', '2017-07-21 15:29:20', '执行成功!');
INSERT INTO `t_log` VALUES ('80', 'admin', '系统管理', '公司管理-新增公司', '2725', '127.0.0.1', '2017-07-21 15:30:54', '执行成功!');
INSERT INTO `t_log` VALUES ('81', 'admin', '系统管理', '公司管理-新增公司', '0', '127.0.0.1', '2017-07-21 15:32:12', '执行成功!');
INSERT INTO `t_log` VALUES ('82', 'admin', '系统管理', '公司管理-新增公司', '627', '127.0.0.1', '2017-07-24 15:59:16', '执行成功!');
INSERT INTO `t_log` VALUES ('83', 'admin', '系统管理', '资源管理-新增资源', '2', '127.0.0.1', '2017-07-25 14:00:48', '执行成功!');
INSERT INTO `t_log` VALUES ('84', 'admin', '系统管理', '用户管理/组管理-修改权限', '95', '127.0.0.1', '2017-07-25 14:01:23', '执行成功!');
INSERT INTO `t_log` VALUES ('85', 'admin', '系统管理', '资源管理-新增资源', '2', '127.0.0.1', '2017-07-25 14:41:50', '执行成功!');
INSERT INTO `t_log` VALUES ('86', 'admin', '系统管理', '资源管理-新增资源', '2', '127.0.0.1', '2017-07-25 14:42:48', '执行成功!');
INSERT INTO `t_log` VALUES ('87', 'admin', '系统管理', '资源管理-新增资源', '2', '127.0.0.1', '2017-07-25 14:44:09', '执行成功!');
INSERT INTO `t_log` VALUES ('88', 'admin', '系统管理', '用户管理/组管理-修改权限', '9', '127.0.0.1', '2017-07-25 14:44:20', '执行成功!');
INSERT INTO `t_log` VALUES ('89', 'admin', '系统管理', '园区管理-修改园区', '2', '127.0.0.1', '2017-07-25 15:44:00', '执行成功!');
INSERT INTO `t_log` VALUES ('90', 'admin', '系统管理', '园区管理-修改园区', '4', '127.0.0.1', '2017-07-25 15:44:13', '执行成功!');
INSERT INTO `t_log` VALUES ('91', 'admin', '系统管理', '用户管理-新增账号', '63', '127.0.0.1', '2017-07-26 12:47:18', '执行成功!');
INSERT INTO `t_log` VALUES ('92', 'admin', '系统管理', '用户管理-新增账号', '8', '127.0.0.1', '2017-07-26 16:28:27', '执行成功!');
INSERT INTO `t_log` VALUES ('93', 'admin', '系统管理', '用户管理-新增账号', '105', '127.0.0.1', '2017-07-26 17:04:02', '执行成功!');
INSERT INTO `t_log` VALUES ('94', 'admin', '系统管理', '用户管理-修改账号', '0', '127.0.0.1', '2017-07-26 17:18:54', '执行成功!');
INSERT INTO `t_log` VALUES ('95', 'admin', '系统管理', '用户管理-修改账号', '0', '127.0.0.1', '2017-07-26 17:32:00', '执行成功!');
INSERT INTO `t_log` VALUES ('96', 'admin', '系统管理', '用户管理-修改账号', '0', '127.0.0.1', '2017-07-26 17:32:19', '执行成功!');
INSERT INTO `t_log` VALUES ('97', 'admin', '系统管理', '用户管理-修改账号', '0', '127.0.0.1', '2017-07-26 17:32:40', '执行成功!');
INSERT INTO `t_log` VALUES ('98', 'admin', '系统管理', '用户管理-修改账号', '0', '127.0.0.1', '2017-07-26 17:33:28', '执行成功!');
INSERT INTO `t_log` VALUES ('99', 'admin', '系统管理', '用户管理-新增账号', '6', '127.0.0.1', '2017-07-26 17:37:51', '执行成功!');
INSERT INTO `t_log` VALUES ('100', 'admin', '系统管理', '用户管理-删除账号', '8', '127.0.0.1', '2017-07-26 17:44:36', '执行成功!');
INSERT INTO `t_log` VALUES ('101', 'admin', '系统管理', '资源管理-新增资源', '2', '127.0.0.1', '2017-07-27 17:49:13', '执行成功!');
INSERT INTO `t_log` VALUES ('102', 'admin', '系统管理', '用户管理/组管理-修改权限', '567', '127.0.0.1', '2017-07-27 18:00:59', '执行成功!');
INSERT INTO `t_log` VALUES ('103', 'simple', '系统管理', '用户管理-修改密码', '15', '127.0.0.1', '2017-07-28 11:54:33', '执行成功!');
INSERT INTO `t_log` VALUES ('104', 'admin', '系统管理', '资源管理-修改资源', '3', '127.0.0.1', '2017-07-28 12:01:14', '执行成功!');
INSERT INTO `t_log` VALUES ('105', 'admin', '系统管理', '资源管理-修改资源', '2', '127.0.0.1', '2017-07-28 12:26:30', '执行成功!');
INSERT INTO `t_log` VALUES ('106', 'simple', '系统管理', '公司管理-分配员工', '18629', '127.0.0.1', '2017-07-31 10:29:24', '执行成功!');
INSERT INTO `t_log` VALUES ('107', 'simple', '系统管理', '公司管理-分配员工', '166616', '127.0.0.1', '2017-07-31 10:40:31', '执行成功!');
INSERT INTO `t_log` VALUES ('108', 'simple', '系统管理', '公司管理-分配员工', '21965', '127.0.0.1', '2017-07-31 10:43:49', '执行成功!');
INSERT INTO `t_log` VALUES ('109', 'simple', '系统管理', '公司管理-分配员工', '87732', '127.0.0.1', '2017-07-31 10:48:46', '执行成功!');
INSERT INTO `t_log` VALUES ('110', 'simple', '系统管理', '公司管理-分配员工', '19798', '127.0.0.1', '2017-07-31 11:07:04', '执行成功!');
INSERT INTO `t_log` VALUES ('111', 'simple', '系统管理', '公司管理-分配员工', '21560', '127.0.0.1', '2017-07-31 11:08:12', '执行成功!');
INSERT INTO `t_log` VALUES ('112', 'simple', '系统管理', '公司管理-分配员工', '70954', '127.0.0.1', '2017-08-01 12:15:24', '执行成功!');
INSERT INTO `t_log` VALUES ('113', 'simple', '系统管理', '公司管理-分配员工', '30450', '127.0.0.1', '2017-08-01 12:17:03', '执行成功!');
INSERT INTO `t_log` VALUES ('114', 'simple', '系统管理', '公司管理-分配员工', '8944', '127.0.0.1', '2017-08-01 12:18:46', '执行成功!');
INSERT INTO `t_log` VALUES ('115', 'simple', '系统管理', '用户管理-修改密码', '10111', '127.0.0.1', '2017-08-03 14:48:05', '执行成功!');
INSERT INTO `t_log` VALUES ('116', 'simple', '系统管理', '用户管理-修改密码', '2664', '127.0.0.1', '2017-08-03 14:49:11', '执行成功!');
INSERT INTO `t_log` VALUES ('117', 'admin', '系统管理', '公司管理-新增员工', '9813', '127.0.0.1', '2017-08-08 11:52:46', '执行成功!');
INSERT INTO `t_log` VALUES ('118', 'admin', '系统管理', '用户管理-删除账号', '12', '127.0.0.1', '2017-08-08 12:01:46', '执行成功!');
INSERT INTO `t_log` VALUES ('119', 'admin', '系统管理', '公司管理-新增员工', '16109', '127.0.0.1', '2017-08-08 12:02:22', '执行成功!');
INSERT INTO `t_log` VALUES ('120', 'admin', '系统管理', '用户管理-删除账号', '8', '127.0.0.1', '2017-08-08 12:02:34', '执行成功!');
INSERT INTO `t_log` VALUES ('121', 'admin', '系统管理', '公司管理-新增员工', '19734', '127.0.0.1', '2017-08-08 12:04:12', '执行成功!');
INSERT INTO `t_log` VALUES ('122', 'admin', '系统管理', '用户管理-删除账号', '70', '127.0.0.1', '2017-08-08 12:04:54', '执行成功!');
INSERT INTO `t_log` VALUES ('123', 'admin', '系统管理', '公司管理-新增员工', '26700', '127.0.0.1', '2017-08-08 12:11:04', '执行成功!');
INSERT INTO `t_log` VALUES ('124', 'admin', '系统管理', '用户管理-删除账号', '8', '127.0.0.1', '2017-08-08 12:11:15', '执行成功!');
INSERT INTO `t_log` VALUES ('125', 'admin', '系统管理', '公司管理-新增员工', '29257', '127.0.0.1', '2017-08-08 12:14:34', '执行成功!');
INSERT INTO `t_log` VALUES ('126', 'admin', '系统管理', '用户管理-删除账号', '10', '127.0.0.1', '2017-08-08 12:15:29', '执行成功!');
INSERT INTO `t_log` VALUES ('127', 'simple', '系统管理', '公司管理-新增员工', '15922', '127.0.0.1', '2017-08-08 12:16:25', '执行成功!');
INSERT INTO `t_log` VALUES ('128', 'admin', '系统管理', '公司管理-修改员工信息', '6', '127.0.0.1', '2017-08-08 12:34:44', '执行成功!');
INSERT INTO `t_log` VALUES ('129', 'admin', '系统管理', '资源管理-新增资源', '2', '127.0.0.1', '2017-08-21 17:35:02', '执行成功!');
INSERT INTO `t_log` VALUES ('130', 'admin', '系统管理', '资源管理-修改资源', '3', '127.0.0.1', '2017-08-21 17:35:39', '执行成功!');
INSERT INTO `t_log` VALUES ('131', 'admin', '系统管理', '用户管理/组管理-修改权限', '75', '127.0.0.1', '2017-08-21 17:35:59', '执行成功!');
INSERT INTO `t_log` VALUES ('132', 'admin', '系统管理', '资源管理-修改资源', '3', '127.0.0.1', '2017-08-21 17:36:47', '执行成功!');
INSERT INTO `t_log` VALUES ('133', 'admin', '系统管理', '资源管理-修改资源', '2', '127.0.0.1', '2017-08-21 17:36:59', '执行成功!');
INSERT INTO `t_log` VALUES ('134', 'admin', '系统管理', '用户管理/组管理-修改权限', '7', '127.0.0.1', '2017-08-21 18:06:53', '执行成功!');
INSERT INTO `t_log` VALUES ('135', 'admin', '系统管理', '资源管理-修改资源', '15796', '127.0.0.1', '2017-08-22 16:20:55', '执行成功!');
INSERT INTO `t_log` VALUES ('136', 'admin', '系统管理', '资源管理-新增资源', '3', '127.0.0.1', '2017-08-22 16:23:54', '执行成功!');
INSERT INTO `t_log` VALUES ('137', 'admin', '系统管理', '资源管理-删除资源', '78', '127.0.0.1', '2017-08-22 16:24:48', '执行成功!');
INSERT INTO `t_log` VALUES ('138', 'admin', '系统管理', '资源管理-新增资源', '8681', '127.0.0.1', '2017-08-22 16:32:42', '执行成功!');
INSERT INTO `t_log` VALUES ('139', 'admin', '系统管理', '资源管理-删除资源', '79', '127.0.0.1', '2017-08-22 16:32:58', '执行成功!');
INSERT INTO `t_log` VALUES ('140', 'admin', '系统管理', '资源管理-修改资源', '1656', '127.0.0.1', '2017-08-22 16:33:53', '执行成功!');
INSERT INTO `t_log` VALUES ('141', 'admin', '系统管理', '组管理-新增角色', '16', '127.0.0.1', '2017-08-22 17:34:52', '执行成功!');
INSERT INTO `t_log` VALUES ('142', 'admin', '系统管理', '组管理-新增第三方服务', '2', '127.0.0.1', '2017-08-22 17:58:44', '执行成功!');
INSERT INTO `t_log` VALUES ('143', 'admin', '系统管理', '资源管理-新增资源', '3358', '127.0.0.1', '2017-09-21 17:43:22', '执行成功!');
INSERT INTO `t_log` VALUES ('144', 'admin', '系统管理', '用户管理/组管理-修改权限', '88', '127.0.0.1', '2017-09-21 17:43:38', '执行成功!');
INSERT INTO `t_log` VALUES ('145', 'admin', '系统管理', '资源管理-修改资源', '2', '127.0.0.1', '2017-09-21 17:45:11', '执行成功!');
INSERT INTO `t_log` VALUES ('146', 'admin', '系统管理', '资源管理-新增资源', '4', '127.0.0.1', '2017-09-22 10:18:02', '执行成功!');
INSERT INTO `t_log` VALUES ('147', 'admin', '系统管理', '用户管理/组管理-修改权限', '91', '127.0.0.1', '2017-09-22 10:18:14', '执行成功!');
INSERT INTO `t_log` VALUES ('148', 'admin', '系统管理', '用户管理-修改账号', '11607', '127.0.0.1', '2017-09-22 12:45:22', '执行成功!');
INSERT INTO `t_log` VALUES ('149', 'admin', '系统管理', '用户管理-修改账号', '19192', '127.0.0.1', '2017-09-22 17:30:52', '执行成功!');
INSERT INTO `t_log` VALUES ('150', 'admin', '系统管理', '用户管理-修改账号', '6192', '127.0.0.1', '2017-09-22 17:51:32', '执行成功!');
INSERT INTO `t_log` VALUES ('151', 'admin', '系统管理', '用户管理-修改账号', '19699', '127.0.0.1', '2017-09-22 18:07:40', '执行成功!');
INSERT INTO `t_log` VALUES ('152', 'admin', '系统管理', '资源管理-新增资源', '85589', '127.0.0.1', '2017-09-25 15:39:02', '执行成功!');
INSERT INTO `t_log` VALUES ('153', 'admin', '系统管理', '资源管理-新增资源', '3624', '127.0.0.1', '2017-09-25 15:40:10', '执行成功!');
INSERT INTO `t_log` VALUES ('154', 'admin', '系统管理', '资源管理-新增资源', '3137', '127.0.0.1', '2017-09-25 15:41:19', '执行成功!');
INSERT INTO `t_log` VALUES ('155', 'admin', '系统管理', '用户管理/组管理-修改权限', '85', '127.0.0.1', '2017-09-25 15:41:36', '执行成功!');
INSERT INTO `t_log` VALUES ('156', 'admin', '系统管理', '资源管理-删除资源', '79', '127.0.0.1', '2017-09-25 15:42:33', '执行成功!');
INSERT INTO `t_log` VALUES ('157', 'admin', '系统管理', '资源管理-新增资源', '33650', '127.0.0.1', '2017-09-25 15:43:25', '执行成功!');
INSERT INTO `t_log` VALUES ('158', 'admin', '系统管理', '资源管理-删除资源', '83', '127.0.0.1', '2017-09-25 15:46:51', '执行成功!');
INSERT INTO `t_log` VALUES ('159', 'admin', '系统管理', '资源管理-新增资源', '14603', '127.0.0.1', '2017-09-25 15:47:23', '执行成功!');
INSERT INTO `t_log` VALUES ('160', 'admin', '系统管理', '资源管理-新增资源', '4', '127.0.0.1', '2017-09-25 15:47:44', '执行成功!');
INSERT INTO `t_log` VALUES ('161', 'admin', '系统管理', '用户管理/组管理-修改权限', '10', '127.0.0.1', '2017-09-25 15:48:01', '执行成功!');
INSERT INTO `t_log` VALUES ('162', 'admin', '系统管理', '组管理-删除第三方服务', '2', '127.0.0.1', '2017-09-25 17:39:26', '执行成功!');
INSERT INTO `t_log` VALUES ('163', 'admin', '系统管理', '用户管理/组管理-修改权限', '57', '127.0.0.1', '2017-09-26 11:43:06', '执行成功!');
INSERT INTO `t_log` VALUES ('164', 'admin', '系统管理', '资源管理-新增资源', '7', '127.0.0.1', '2017-09-26 15:39:02', '执行成功!');
INSERT INTO `t_log` VALUES ('165', 'admin', '系统管理', '资源管理-修改资源', '7', '127.0.0.1', '2017-09-26 15:39:23', '执行成功!');
INSERT INTO `t_log` VALUES ('166', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:39:41', '执行成功!');
INSERT INTO `t_log` VALUES ('167', 'admin', '系统管理', '用户管理/组管理-修改权限', '39', '127.0.0.1', '2017-09-26 15:40:00', '执行成功!');
INSERT INTO `t_log` VALUES ('168', 'admin', '系统管理', '资源管理-修改资源', '5', '127.0.0.1', '2017-09-26 15:40:56', '执行成功!');
INSERT INTO `t_log` VALUES ('169', 'admin', '系统管理', '资源管理-修改资源', '3', '127.0.0.1', '2017-09-26 15:41:43', '执行成功!');
INSERT INTO `t_log` VALUES ('170', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:42:10', '执行成功!');
INSERT INTO `t_log` VALUES ('171', 'admin', '系统管理', '资源管理-修改资源', '5', '127.0.0.1', '2017-09-26 15:42:27', '执行成功!');
INSERT INTO `t_log` VALUES ('172', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:42:59', '执行成功!');
INSERT INTO `t_log` VALUES ('173', 'admin', '系统管理', '资源管理-修改资源', '3', '127.0.0.1', '2017-09-26 15:43:44', '执行成功!');
INSERT INTO `t_log` VALUES ('174', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:43:55', '执行成功!');
INSERT INTO `t_log` VALUES ('175', 'admin', '系统管理', '资源管理-删除资源', '81', '127.0.0.1', '2017-09-26 15:44:00', '执行成功!');
INSERT INTO `t_log` VALUES ('176', 'admin', '系统管理', '资源管理-新增资源', '5', '127.0.0.1', '2017-09-26 15:44:21', '执行成功!');
INSERT INTO `t_log` VALUES ('177', 'admin', '系统管理', '用户管理/组管理-修改权限', '40', '127.0.0.1', '2017-09-26 15:44:40', '执行成功!');
INSERT INTO `t_log` VALUES ('178', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:47:30', '执行成功!');
INSERT INTO `t_log` VALUES ('179', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:54:56', '执行成功!');
INSERT INTO `t_log` VALUES ('180', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-09-26 15:55:12', '执行成功!');
INSERT INTO `t_log` VALUES ('181', 'admin', '系统管理', '资源管理-修改资源', '3032', '127.0.0.1', '2017-10-09 11:59:14', '执行成功!');
INSERT INTO `t_log` VALUES ('182', 'admin', '系统管理', '资源管理-新增资源', '2520', '127.0.0.1', '2017-10-09 11:59:50', '执行成功!');
INSERT INTO `t_log` VALUES ('183', 'admin', '系统管理', '用户管理/组管理-修改权限', '54', '127.0.0.1', '2017-10-09 12:00:32', '执行成功!');
INSERT INTO `t_log` VALUES ('184', 'admin', '系统管理', '用户管理/组管理-修改权限', '4', '127.0.0.1', '2017-10-09 12:00:43', '执行成功!');
INSERT INTO `t_log` VALUES ('185', 'admin', '系统管理', '用户管理/组管理-修改权限', '43', '127.0.0.1', '2017-10-09 12:00:54', '执行成功!');
INSERT INTO `t_log` VALUES ('186', 'admin', '系统管理', '用户管理/组管理-修改权限', '4', '127.0.0.1', '2017-10-09 12:01:05', '执行成功!');
INSERT INTO `t_log` VALUES ('187', 'admin', '系统管理', '用户管理/组管理-修改权限', '3', '127.0.0.1', '2017-10-09 12:01:16', '执行成功!');
INSERT INTO `t_log` VALUES ('188', 'admin', '系统管理', '用户管理/组管理-修改权限', '6', '127.0.0.1', '2017-10-09 12:01:25', '执行成功!');
INSERT INTO `t_log` VALUES ('189', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-10-09 15:55:27', '执行成功!');
INSERT INTO `t_log` VALUES ('190', 'admin', '系统管理', '资源管理-修改资源', '3', '127.0.0.1', '2017-10-09 15:55:49', '执行成功!');
INSERT INTO `t_log` VALUES ('191', 'admin', '系统管理', '资源管理-修改资源', '4', '127.0.0.1', '2017-10-09 15:56:00', '执行成功!');
INSERT INTO `t_log` VALUES ('192', 'admin', '系统管理', '用户管理-修改账号', '1390', '127.0.0.1', '2017-10-09 15:58:35', '执行成功!');
INSERT INTO `t_log` VALUES ('193', 'admin', '系统管理', '用户管理-修改账号', '3630', '127.0.0.1', '2017-10-09 16:03:13', '执行成功!');
INSERT INTO `t_log` VALUES ('194', 'admin', '系统管理', '用户管理-修改账号', '894', '127.0.0.1', '2017-10-09 16:13:56', '执行成功!');
INSERT INTO `t_log` VALUES ('195', 'admin', '系统管理', '用户管理-修改账号', '12264', '127.0.0.1', '2017-10-09 16:14:29', '执行成功!');
INSERT INTO `t_log` VALUES ('196', 'admin', '系统管理', '卡管理-删除一卡通', '2', '127.0.0.1', '2017-10-09 16:15:01', '执行成功!');
INSERT INTO `t_log` VALUES ('197', 'admin', '系统管理', '公司管理-删除员工', '8', '127.0.0.1', '2017-10-09 16:32:11', '执行成功!');
INSERT INTO `t_log` VALUES ('198', 'admin', '系统管理', '用户管理-修改账号', '2536', '127.0.0.1', '2017-10-09 17:15:39', '执行成功!');
INSERT INTO `t_log` VALUES ('199', 'admin', '系统管理', '用户管理-修改账号', '4940', '127.0.0.1', '2017-10-09 17:15:55', '执行成功!');
INSERT INTO `t_log` VALUES ('200', 'admin', '系统管理', '卡管理-删除一卡通', '3', '127.0.0.1', '2017-10-09 17:16:06', '执行成功!');
INSERT INTO `t_log` VALUES ('201', 'admin', '系统管理', '用户管理/组管理-修改权限', '87', '127.0.0.1', '2017-10-17 10:52:50', '执行成功!');
INSERT INTO `t_log` VALUES ('202', 'admin', '系统管理', '资源管理-新增资源', '5', '127.0.0.1', '2017-10-17 16:42:09', '执行成功!');
INSERT INTO `t_log` VALUES ('203', 'admin', '系统管理', '用户管理/组管理-修改权限', '6', '127.0.0.1', '2017-10-17 16:42:20', '执行成功!');
INSERT INTO `t_log` VALUES ('204', 'admin', '系统管理', '用户管理/组管理-修改权限', '14', '127.0.0.1', '2017-10-17 16:58:03', '执行成功!');
INSERT INTO `t_log` VALUES ('205', 'admin', '系统管理', '资源管理-新增资源', '5', '127.0.0.1', '2017-10-20 17:04:40', '执行成功!');
INSERT INTO `t_log` VALUES ('206', 'admin', '系统管理', '用户管理/组管理-修改权限', '67', '127.0.0.1', '2017-10-20 17:05:08', '执行成功!');

-- ----------------------------
-- Table structure for t_part
-- ----------------------------
DROP TABLE IF EXISTS `t_part`;
CREATE TABLE `t_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partName` varchar(255) DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_part
-- ----------------------------
INSERT INTO `t_part` VALUES ('1', '牡丹园区', '1');
INSERT INTO `t_part` VALUES ('2', '山东园区', '1');
INSERT INTO `t_part` VALUES ('3', '山西园区', '1');

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identityNum` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realAddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyId` int(11) DEFAULT '0',
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `identityNum` (`identityNum`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `companyId` (`companyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('1', 'admin', 'admin@admin.com', '0', '010-88539281', null, '15801829182', null, null, null, null, null, '0', '1');
INSERT INTO `t_person` VALUES ('2', '张向东', 'abc@abc.com', '1', '88539281', '010-31827182', '15826159897', null, null, null, '23071619920324675X', null, '1', '1');
INSERT INTO `t_person` VALUES ('3', 'root', 'root@123.com', '1', '88539281', '88539281', '15982718102', null, null, null, '610602199406101101', null, '2', '1');
INSERT INTO `t_person` VALUES ('7', '王江', 'wangjiang@123.com', '2', null, null, null, null, null, null, null, null, '2', '1');
INSERT INTO `t_person` VALUES ('9', '孙红', null, '2', null, null, null, null, null, null, null, null, '2', '1');
INSERT INTO `t_person` VALUES ('11', '王威', 'qwe@163.com', '2', '010-29182918', '010-29182817', '15801829183', null, null, null, '110291829182918291', null, '1', '1');
INSERT INTO `t_person` VALUES ('13', '王企鹅完全', null, '2', null, null, null, null, null, null, null, null, '1', '1');
INSERT INTO `t_person` VALUES ('15', '周庆隼', 'zhouqing@163.com', '1', '010-29182918', '010-29182817', '15826156275', null, null, null, null, null, '3', '1');
INSERT INTO `t_person` VALUES ('3421', '孙尚', 'sad@sina.com', '1', null, null, '15809392019', null, null, null, null, null, '6', '1');
INSERT INTO `t_person` VALUES ('3430', '测试用户1', 'wangpai1@163.com', '2', null, null, '15928210943', null, null, null, null, null, '0', '1');
INSERT INTO `t_person` VALUES ('3441', '21qewqe', 'qw56@123.com', '2', null, null, '15982718289', null, null, null, null, null, '1', '1');
INSERT INTO `t_person` VALUES ('3443', '王牌1', 'wangpai123@163.com', '0', null, null, '15928210970', null, null, null, null, null, '0', '1');
INSERT INTO `t_person` VALUES ('3444', '孙尚1', null, '1', null, null, '15826156272', null, null, null, '140981198809010014', null, '7', '1');
INSERT INTO `t_person` VALUES ('3460', '史彦军', 'shiyanjun@ceecloud.cn', '2', null, null, '15982711221', null, null, null, '410211198907107678', null, '1', '1');
INSERT INTO `t_person` VALUES ('3465', 'weqwqe', '123@qq.com', '2', null, null, null, null, null, null, null, null, '0', '1');
INSERT INTO `t_person` VALUES ('3466', 'zhanghu', '139@qq.com', '2', null, null, '13982918271', null, null, null, null, null, '0', '1');
INSERT INTO `t_person` VALUES ('3467', 'sunnan', '19382@qq.com', '2', null, null, '18291829102', null, null, null, null, null, '0', '1');

-- ----------------------------
-- Table structure for t_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_resources`;
CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resources
-- ----------------------------
INSERT INTO `t_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '1', 'fa-desktop', '0', '系统基础管理');
INSERT INTO `t_resources` VALUES ('2', '用户管理', '1', 'account', '1', '/user/list.shtml', '2', '', '0', '');
INSERT INTO `t_resources` VALUES ('3', '角色管理', '1', 'role', '1', '/role/list.shtml', '3', 'fa-list', '0', '组管理');
INSERT INTO `t_resources` VALUES ('4', '菜单管理', '1', 't_resources', '1', '/resources/list.shtml', '6', 'fa-list-alt', '0', '菜单管理');
INSERT INTO `t_resources` VALUES ('5', '新增用户', '2', 'account_add', '2', '/user/addUI.shtml', '1', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('6', '修改用户', '2', 'account_edit', '2', '/user/editUI.shtml', '2', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('7', '删除用户', '2', 'account_delete', '2', '/user/deleteById.shtml', '3', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('8', '新增角色', '3', 'role_add', '2', '/role/addUI.shtml', '1', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRole&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('9', '修改角色', '3', 'role_edit', '2', '/role/editUI.shtml', '2', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRole&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('10', '删除角色', '3', 'role_delete', '2', '/role/delete.shtml', '3', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delRole&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('11', '分配权限', '3', 'role_perss', '2', '/resources/permissions.shtml', '4', '无', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('25', '登陆信息管理', '0', 'ly_login', '0', 'ly_login', '3', 'fa-calendar', '0', '登陆信息管理');
INSERT INTO `t_resources` VALUES ('26', '用户登录记录', '25', 'ly_log_list', '1', '/userlogin/listUI.shtml', '1', '', '0', '用户登录记录');
INSERT INTO `t_resources` VALUES ('27', '操作日志管理', '0', 'ly_log', '0', 'ly_log', '4', 'fa-picture-o', '0', '操作日志管理');
INSERT INTO `t_resources` VALUES ('28', '日志查询', '27', 'ly_log_info', '1', '/log/list.shtml', '1', '', '0', '');
INSERT INTO `t_resources` VALUES ('29', '新增菜单资源', '4', 't_resources_add', '2', '/resources/addUI.shtml', '1', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('30', '修改菜单资源', '4', 't_resources_edit', '2', '/resources/editUI.shtml', '2', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('31', '删除菜单资源', '4', 't_resources_delete', '2', '/resources/delete.shtml', '3', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('32', '系统监控管理', '0', 'monitor', '0', 'monitor', '2', 'fa-tag', '0', '系统监控管理');
INSERT INTO `t_resources` VALUES ('33', '实时监控', '32', 'sysmonitor', '1', '/monitor/monitor.shtml', '1', '', '0', '实时监控');
INSERT INTO `t_resources` VALUES ('34', '分配权限', '2', 'permissions', '2', '/resources/permissions.shtml', '4', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('35', '告警列表', '32', 'monitor_warn', '1', '/monitor/list.shtml', '2', '', '0', '告警列表');
INSERT INTO `t_resources` VALUES ('37', '公司管理', '1', 'company', '1', '/company/list.shtml', '1', '', '0', '');
INSERT INTO `t_resources` VALUES ('38', '新增公司', '37', 'company_add', '2', '/company/addUI.shtml', '1', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('39', '修改公司', '37', 'company_edit', '2', '/company/editUI.shtml', '2', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('40', '删除公司', '37', 'company_delete', '2', '/company/delete.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('41', '成员列表', '1', 'person_list', '1', '/person/slist.shtml', '4', null, '0', '成员列表');
INSERT INTO `t_resources` VALUES ('42', '新增成员', '41', 'person_add', '2', '/person/saddUI.shtml', '1', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('43', '编辑成员', '41', 'person_edit', '2', '/person/seditUI.shtml', '2', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('44', '删除成员', '41', 'person_delete', '2', '/person/delete.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('45', '部门列表', '1', 'dept_list', '1', '/dept/slist.shtml', '5', null, '0', null);
INSERT INTO `t_resources` VALUES ('46', '新增部门', '45', 'dept_add', '2', '/dept/saddUI.shtml', '1', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('47', '编辑部门', '45', 'dept_edit', '2', '/dept/seditUI.shtml', '2', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('48', '删除部门', '45', 'dept_delete', '2', '/dept/delete.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('49', '园区管理', '54', 'part', '1', '/part/list.shtml', '1', null, '0', null);
INSERT INTO `t_resources` VALUES ('50', '新增园区', '49', 'part_add', '2', 'part/addUI.shtml', '1', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('51', '修改园区', '49', 'part_edit', '2', '/part/editUI.shtml', '2', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('52', '删除园区', '49', 'part_delete', '2', '/part/delete.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('53', '分配人员', '41', 'person_fix', '2', 'person_fixUI.shtml', '4', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配员工&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('54', '系统配置管理', '0', 'ly_info', '0', 'ly_info', '5', null, '0', '系统配置管理');
INSERT INTO `t_resources` VALUES ('55', '服务管理', '54', 'app', '1', '/app/list.shtml', '2', null, '0', null);
INSERT INTO `t_resources` VALUES ('56', '新增第三方服务', '55', 'app_add', '2', '/app/addUI.shtml', '1', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRole&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('57', '修改第三方服务', '55', 'app_edit', '2', '/app/editUI.shtml', '2', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRole&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('58', '删除第三方服务', '55', 'app_delete', '2', '/app/delete.shtml', '3', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('59', '一卡通管理', '68', 'card', '0', '/card/list.shtml', '1', null, '0', null);
INSERT INTO `t_resources` VALUES ('60', '交易明细', '68', 'cardTran', '0', '/cardTran/list.shtml', '3', null, '0', null);
INSERT INTO `t_resources` VALUES ('61', '新增一卡通', '59', 'add_card', '2', '/card/addUI.shtml', '1', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('65', '编辑一卡通', '59', 'edit_card', '2', '/card/editUI.shtml', '2', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('66', '删除一卡通', '59', 'delete_card', '2', '/card/delete.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `t_resources` VALUES ('68', '交易信息管理', '0', 'ly_tranInfo', '0', 'ly_tranInfo', '6', 'fa-picture-o', '0', '交易信息管理');
INSERT INTO `t_resources` VALUES ('69', '个人明细', '68', 'user_tran_info', '1', '/cardTran/list1.shtml', '7', null, '0', null);
INSERT INTO `t_resources` VALUES ('70', '视频会议使用情况', '68', 'video_info', '1', '/other/list.shtml', '8', null, '0', null);
INSERT INTO `t_resources` VALUES ('71', '运维网络出口', '68', 'operation_info', '1', '/other/operationlist.shtml', '9', null, '0', null);

-- ----------------------------
-- Table structure for t_res_user
-- ----------------------------
DROP TABLE IF EXISTS `t_res_user`;
CREATE TABLE `t_res_user` (
  `resId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_res_user
-- ----------------------------
INSERT INTO `t_res_user` VALUES ('1', '3438');
INSERT INTO `t_res_user` VALUES ('2', '3438');
INSERT INTO `t_res_user` VALUES ('5', '3438');
INSERT INTO `t_res_user` VALUES ('6', '3438');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '超级管理员', 'admin', '0');
INSERT INTO `t_role` VALUES ('2', '内部管理员', null, null, '0');
INSERT INTO `t_role` VALUES ('3', '内部员工', null, null, '0');
INSERT INTO `t_role` VALUES ('4', '企业管理员', '企业管理员', null, '0');
INSERT INTO `t_role` VALUES ('5', '企业员工', null, null, '0');
INSERT INTO `t_role` VALUES ('6', '普通用户', null, null, '0');

-- ----------------------------
-- Table structure for t_role_res
-- ----------------------------
DROP TABLE IF EXISTS `t_role_res`;
CREATE TABLE `t_role_res` (
  `roleId` int(11) NOT NULL,
  `resId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_res
-- ----------------------------
INSERT INTO `t_role_res` VALUES ('1', '1');
INSERT INTO `t_role_res` VALUES ('1', '2');
INSERT INTO `t_role_res` VALUES ('1', '3');
INSERT INTO `t_role_res` VALUES ('1', '4');
INSERT INTO `t_role_res` VALUES ('1', '5');
INSERT INTO `t_role_res` VALUES ('1', '6');
INSERT INTO `t_role_res` VALUES ('1', '7');
INSERT INTO `t_role_res` VALUES ('1', '8');
INSERT INTO `t_role_res` VALUES ('1', '9');
INSERT INTO `t_role_res` VALUES ('1', '10');
INSERT INTO `t_role_res` VALUES ('1', '11');
INSERT INTO `t_role_res` VALUES ('1', '25');
INSERT INTO `t_role_res` VALUES ('1', '26');
INSERT INTO `t_role_res` VALUES ('1', '27');
INSERT INTO `t_role_res` VALUES ('1', '28');
INSERT INTO `t_role_res` VALUES ('1', '29');
INSERT INTO `t_role_res` VALUES ('1', '30');
INSERT INTO `t_role_res` VALUES ('1', '31');
INSERT INTO `t_role_res` VALUES ('1', '32');
INSERT INTO `t_role_res` VALUES ('1', '33');
INSERT INTO `t_role_res` VALUES ('1', '34');
INSERT INTO `t_role_res` VALUES ('1', '35');
INSERT INTO `t_role_res` VALUES ('1', '37');
INSERT INTO `t_role_res` VALUES ('1', '38');
INSERT INTO `t_role_res` VALUES ('1', '39');
INSERT INTO `t_role_res` VALUES ('1', '40');
INSERT INTO `t_role_res` VALUES ('1', '49');
INSERT INTO `t_role_res` VALUES ('1', '50');
INSERT INTO `t_role_res` VALUES ('1', '51');
INSERT INTO `t_role_res` VALUES ('1', '52');
INSERT INTO `t_role_res` VALUES ('1', '54');
INSERT INTO `t_role_res` VALUES ('1', '55');
INSERT INTO `t_role_res` VALUES ('1', '56');
INSERT INTO `t_role_res` VALUES ('1', '57');
INSERT INTO `t_role_res` VALUES ('1', '58');
INSERT INTO `t_role_res` VALUES ('1', '59');
INSERT INTO `t_role_res` VALUES ('1', '60');
INSERT INTO `t_role_res` VALUES ('1', '61');
INSERT INTO `t_role_res` VALUES ('1', '65');
INSERT INTO `t_role_res` VALUES ('1', '66');
INSERT INTO `t_role_res` VALUES ('1', '68');
INSERT INTO `t_role_res` VALUES ('1', '69');
INSERT INTO `t_role_res` VALUES ('1', '70');
INSERT INTO `t_role_res` VALUES ('1', '71');
INSERT INTO `t_role_res` VALUES ('2', '1');
INSERT INTO `t_role_res` VALUES ('2', '37');
INSERT INTO `t_role_res` VALUES ('2', '38');
INSERT INTO `t_role_res` VALUES ('2', '39');
INSERT INTO `t_role_res` VALUES ('2', '40');
INSERT INTO `t_role_res` VALUES ('2', '68');
INSERT INTO `t_role_res` VALUES ('2', '69');
INSERT INTO `t_role_res` VALUES ('3', '68');
INSERT INTO `t_role_res` VALUES ('3', '69');
INSERT INTO `t_role_res` VALUES ('4', '1');
INSERT INTO `t_role_res` VALUES ('4', '41');
INSERT INTO `t_role_res` VALUES ('4', '42');
INSERT INTO `t_role_res` VALUES ('4', '43');
INSERT INTO `t_role_res` VALUES ('4', '44');
INSERT INTO `t_role_res` VALUES ('4', '45');
INSERT INTO `t_role_res` VALUES ('4', '46');
INSERT INTO `t_role_res` VALUES ('4', '47');
INSERT INTO `t_role_res` VALUES ('4', '48');
INSERT INTO `t_role_res` VALUES ('4', '53');
INSERT INTO `t_role_res` VALUES ('4', '68');
INSERT INTO `t_role_res` VALUES ('4', '69');
INSERT INTO `t_role_res` VALUES ('5', '1');
INSERT INTO `t_role_res` VALUES ('5', '41');
INSERT INTO `t_role_res` VALUES ('5', '68');
INSERT INTO `t_role_res` VALUES ('5', '69');
INSERT INTO `t_role_res` VALUES ('6', '68');
INSERT INTO `t_role_res` VALUES ('6', '69');

-- ----------------------------
-- Table structure for t_server_info
-- ----------------------------
DROP TABLE IF EXISTS `t_server_info`;
CREATE TABLE `t_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1928 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_server_info
-- ----------------------------
INSERT INTO `t_server_info` VALUES ('1', '61', '40', '56', '50', '66', '50', null, '2016-07-06 16:02:01', '<font color=\"red\">CPU当前：61%,超出预设值  40%<br>JVM当前：56%,超出预设值 50%<br>内存当前：66%,超出预设值  50%</font>');
INSERT INTO `t_server_info` VALUES ('2', '12', '40', '59', '50', '66', '50', null, '2016-07-06 16:03:01', '<font color=\"red\">JVM当前：59%,超出预设值 50%<br>内存当前：66%,超出预设值  50%</font>');
INSERT INTO `t_server_info` VALUES ('3', '11', '80', '72', '70', '67', '70', null, '2016-07-06 16:11:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('4', '8', '80', '72', '70', '67', '70', null, '2016-07-06 16:12:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('5', '9', '80', '72', '70', '67', '70', null, '2016-07-06 16:13:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('6', '6', '80', '76', '70', '67', '70', null, '2016-07-06 16:14:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('7', '13', '80', '76', '70', '68', '70', null, '2016-07-06 16:15:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('8', '9', '80', '76', '70', '67', '70', null, '2016-07-06 16:16:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('9', '6', '80', '80', '70', '67', '70', null, '2016-07-06 16:17:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('10', '96', '80', '80', '70', '70', '70', null, '2016-07-06 16:18:01', '<font color=\"red\">CPU当前：96%,超出预设值  80%<br>JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('11', '13', '80', '82', '70', '70', '70', null, '2016-07-06 16:19:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('12', '6', '80', '82', '70', '70', '70', null, '2016-07-06 16:20:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('13', '21', '80', '28', '70', '71', '70', null, '2016-07-06 16:22:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('14', '5', '80', '28', '70', '71', '70', null, '2016-07-06 16:23:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('15', '30', '80', '30', '70', '71', '70', null, '2016-07-06 16:25:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('16', '16', '80', '31', '70', '71', '70', null, '2016-07-06 16:28:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('17', '24', '80', '41', '70', '71', '70', null, '2016-07-06 16:30:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('18', '34', '80', '49', '70', '71', '70', null, '2016-07-06 16:32:04', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('19', '13', '80', '50', '70', '71', '70', null, '2016-07-06 16:33:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('20', '37', '80', '50', '70', '71', '70', null, '2016-07-06 16:34:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('21', '2', '80', '55', '70', '72', '70', null, '2016-07-06 16:35:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('22', '17', '80', '55', '70', '71', '70', null, '2016-07-06 16:36:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('23', '10', '80', '56', '70', '71', '70', null, '2016-07-06 16:37:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('24', '14', '80', '68', '70', '71', '70', null, '2016-07-06 16:38:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('25', '19', '80', '73', '70', '71', '70', null, '2016-07-06 16:39:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('26', '22', '80', '36', '70', '71', '70', null, '2016-07-06 16:43:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('27', '13', '80', '49', '70', '71', '70', null, '2016-07-06 16:47:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('28', '87', '80', '66', '70', '70', '70', null, '2016-07-06 16:50:01', '<font color=\"red\">CPU当前：87%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('29', '4', '80', '73', '70', '70', '70', null, '2016-07-06 16:52:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('30', '16', '80', '74', '70', '71', '70', null, '2016-07-06 16:53:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('31', '9', '80', '74', '70', '71', '70', null, '2016-07-06 16:54:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('32', '14', '80', '74', '70', '71', '70', null, '2016-07-06 16:55:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('33', '55', '80', '75', '70', '71', '70', null, '2016-07-06 16:56:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('34', '52', '80', '80', '70', '70', '70', null, '2016-07-06 16:59:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('35', '87', '80', '65', '70', '70', '70', null, '2016-07-06 17:03:02', '<font color=\"red\">CPU当前：87%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('36', '80', '80', '64', '70', '71', '70', null, '2016-07-06 17:16:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('37', '10', '80', '72', '70', '70', '70', null, '2016-07-06 17:17:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('38', '20', '80', '73', '70', '70', '70', null, '2016-07-06 17:18:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('39', '11', '80', '73', '70', '70', '70', null, '2016-07-06 17:19:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('40', '19', '80', '77', '70', '70', '70', null, '2016-07-06 17:20:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('41', '31', '80', '78', '70', '70', '70', null, '2016-07-06 17:21:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('42', '13', '80', '78', '70', '70', '70', null, '2016-07-06 17:22:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('43', '6', '80', '82', '70', '70', '70', null, '2016-07-06 17:23:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('44', '11', '80', '82', '70', '70', '70', null, '2016-07-06 17:24:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('45', '49', '80', '82', '70', '70', '70', null, '2016-07-06 17:25:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('46', '4', '80', '83', '70', '70', '70', null, '2016-07-06 17:26:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('47', '89', '80', '84', '70', '71', '70', null, '2016-07-06 17:27:10', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br>JVM当前：84%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('48', '81', '80', '85', '70', '70', '70', null, '2016-07-06 17:28:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br>JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('49', '83', '80', '85', '70', '71', '70', null, '2016-07-06 17:29:01', '<font color=\"red\">CPU当前：83%,超出预设值  80%<br>JVM当前：85%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('50', '32', '80', '85', '70', '72', '70', null, '2016-07-06 17:30:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('51', '32', '80', '77', '70', '72', '70', null, '2016-07-06 17:32:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('52', '14', '80', '77', '70', '71', '70', null, '2016-07-06 17:33:04', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('53', '4', '80', '77', '70', '71', '70', null, '2016-07-06 17:34:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('54', '37', '80', '29', '70', '71', '70', null, '2016-07-06 17:35:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('55', '22', '80', '30', '70', '71', '70', null, '2016-07-06 17:37:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('56', '4', '80', '35', '70', '71', '70', null, '2016-07-06 17:38:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('57', '30', '80', '35', '70', '71', '70', null, '2016-07-06 17:39:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('58', '73', '80', '36', '70', '71', '70', null, '2016-07-06 17:40:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('59', '96', '80', '36', '70', '71', '70', null, '2016-07-06 17:41:01', '<font color=\"red\">CPU当前：96%,超出预设值  80%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('60', '8', '80', '36', '70', '71', '70', null, '2016-07-06 17:42:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('61', '8', '80', '36', '70', '71', '70', null, '2016-07-06 17:43:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('62', '7', '80', '36', '70', '71', '70', null, '2016-07-06 17:44:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('63', '7', '80', '37', '70', '71', '70', null, '2016-07-06 17:45:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('64', '13', '80', '37', '70', '71', '70', null, '2016-07-06 17:46:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('65', '7', '80', '37', '70', '71', '70', null, '2016-07-06 17:47:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('66', '6', '80', '37', '70', '71', '70', null, '2016-07-06 17:48:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('67', '3', '80', '38', '70', '71', '70', null, '2016-07-06 17:49:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('68', '6', '80', '38', '70', '71', '70', null, '2016-07-06 17:50:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('69', '6', '80', '38', '70', '71', '70', null, '2016-07-06 17:51:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('70', '7', '80', '38', '70', '71', '70', null, '2016-07-06 17:52:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('71', '12', '80', '38', '70', '71', '70', null, '2016-07-06 17:53:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('72', '10', '80', '38', '70', '72', '70', null, '2016-07-06 17:54:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('73', '8', '80', '38', '70', '71', '70', null, '2016-07-06 17:55:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('74', '6', '80', '38', '70', '72', '70', null, '2016-07-06 17:56:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('75', '5', '80', '39', '70', '72', '70', null, '2016-07-06 17:57:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('76', '10', '80', '39', '70', '72', '70', null, '2016-07-06 17:58:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('77', '12', '80', '39', '70', '72', '70', null, '2016-07-06 17:59:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('78', '13', '80', '39', '70', '72', '70', null, '2016-07-06 18:00:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('79', '16', '80', '39', '70', '72', '70', null, '2016-07-06 18:01:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('80', '16', '80', '39', '70', '72', '70', null, '2016-07-06 18:02:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('81', '10', '80', '40', '70', '72', '70', null, '2016-07-06 18:03:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('82', '12', '80', '40', '70', '72', '70', null, '2016-07-06 18:04:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('83', '36', '80', '40', '70', '73', '70', null, '2016-07-06 18:05:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('84', '28', '80', '41', '70', '73', '70', null, '2016-07-06 18:06:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('85', '14', '80', '53', '70', '73', '70', null, '2016-07-06 18:07:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('86', '10', '80', '54', '70', '73', '70', null, '2016-07-06 18:08:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('87', '8', '80', '54', '70', '73', '70', null, '2016-07-06 18:09:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('88', '22', '80', '60', '70', '73', '70', null, '2016-07-06 18:10:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('89', '23', '80', '62', '70', '72', '70', null, '2016-07-06 18:11:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('90', '2', '80', '87', '70', '72', '70', null, '2016-07-06 18:12:01', '<font color=\"red\">JVM当前：87%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('91', '8', '80', '28', '70', '71', '70', null, '2016-07-06 18:13:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('92', '6', '80', '29', '70', '72', '70', null, '2016-07-06 18:14:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('93', '14', '80', '29', '70', '73', '70', null, '2016-07-06 18:15:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('94', '49', '80', '29', '70', '73', '70', null, '2016-07-06 18:16:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('95', '19', '80', '29', '70', '73', '70', null, '2016-07-06 18:17:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('96', '48', '80', '30', '70', '72', '70', null, '2016-07-06 18:18:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('97', '39', '80', '36', '70', '73', '70', null, '2016-07-06 18:19:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('98', '8', '80', '36', '70', '72', '70', null, '2016-07-06 18:20:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('99', '8', '80', '36', '70', '72', '70', null, '2016-07-06 18:21:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('100', '7', '80', '36', '70', '72', '70', null, '2016-07-06 18:22:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('101', '5', '80', '37', '70', '72', '70', null, '2016-07-06 18:23:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('102', '23', '80', '37', '70', '72', '70', null, '2016-07-06 18:24:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('103', '8', '80', '37', '70', '72', '70', null, '2016-07-06 18:25:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('104', '11', '80', '39', '70', '72', '70', null, '2016-07-06 18:26:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('105', '9', '80', '47', '70', '72', '70', null, '2016-07-06 18:27:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('106', '96', '80', '47', '70', '71', '70', null, '2016-07-06 18:28:01', '<font color=\"red\">CPU当前：96%,超出预设值  80%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('107', '31', '80', '47', '70', '72', '70', null, '2016-07-06 18:29:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('108', '43', '80', '52', '70', '72', '70', null, '2016-07-06 18:30:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('109', '23', '80', '55', '70', '71', '70', null, '2016-07-06 18:31:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('110', '7', '80', '60', '70', '72', '70', null, '2016-07-06 18:32:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('111', '25', '80', '61', '70', '71', '70', null, '2016-07-06 18:33:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('112', '12', '80', '63', '70', '72', '70', null, '2016-07-06 18:34:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('113', '11', '80', '63', '70', '71', '70', null, '2016-07-06 18:35:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('114', '46', '80', '64', '70', '72', '70', null, '2016-07-06 18:36:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('115', '10', '80', '64', '70', '72', '70', null, '2016-07-06 18:37:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('116', '15', '80', '64', '70', '72', '70', null, '2016-07-06 18:38:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('117', '16', '80', '65', '70', '72', '70', null, '2016-07-06 18:39:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('118', '91', '80', '65', '70', '71', '70', null, '2016-07-06 18:40:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('119', '18', '80', '66', '70', '72', '70', null, '2016-07-06 18:41:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('120', '12', '80', '66', '70', '72', '70', null, '2016-07-06 18:42:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('121', '28', '80', '66', '70', '72', '70', null, '2016-07-06 18:43:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('122', '47', '80', '72', '70', '72', '70', null, '2016-07-06 18:44:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('123', '92', '80', '75', '70', '72', '70', null, '2016-07-06 18:45:01', '<font color=\"red\">CPU当前：92%,超出预设值  80%<br>JVM当前：75%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('124', '10', '80', '75', '70', '72', '70', null, '2016-07-06 18:46:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('125', '27', '80', '75', '70', '72', '70', null, '2016-07-06 18:47:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('126', '20', '80', '77', '70', '72', '70', null, '2016-07-06 18:48:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('127', '23', '80', '77', '70', '72', '70', null, '2016-07-06 18:49:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('128', '9', '80', '78', '70', '72', '70', null, '2016-07-06 18:50:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('129', '63', '80', '84', '70', '48', '70', null, '2016-07-07 08:55:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('130', '9', '80', '71', '70', '50', '70', null, '2016-07-07 08:56:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('131', '3', '80', '80', '70', '50', '70', null, '2016-07-07 08:57:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('132', '100', '80', '29', '70', '52', '70', null, '2016-07-07 09:01:02', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('133', '86', '80', '57', '70', '55', '70', null, '2016-07-07 09:44:01', '<font color=\"red\">CPU当前：86%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('134', '89', '80', '57', '70', '55', '70', null, '2016-07-07 09:45:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('135', '99', '80', '70', '70', '55', '70', null, '2016-07-07 09:56:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('136', '6', '80', '75', '70', '56', '70', null, '2016-07-07 09:59:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('137', '87', '80', '76', '70', '56', '70', null, '2016-07-07 10:00:01', '<font color=\"red\">CPU当前：87%,超出预设值  80%<br>JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('138', '49', '80', '85', '70', '56', '70', null, '2016-07-07 10:01:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('139', '25', '80', '86', '70', '56', '70', null, '2016-07-07 10:02:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('140', '17', '80', '87', '70', '56', '70', null, '2016-07-07 10:03:01', '<font color=\"red\">JVM当前：87%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('141', '100', '80', '36', '70', '56', '70', null, '2016-07-07 10:07:01', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('142', '99', '80', '39', '70', '56', '70', null, '2016-07-07 10:08:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('143', '100', '80', '58', '70', '56', '70', null, '2016-07-07 10:11:34', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('144', '97', '80', '64', '70', '55', '70', null, '2016-07-07 10:16:01', '<font color=\"red\">CPU当前：97%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('145', '32', '80', '79', '70', '57', '70', null, '2016-07-07 10:17:16', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('146', '19', '80', '79', '70', '57', '70', null, '2016-07-07 10:18:16', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('147', '52', '80', '79', '70', '57', '70', null, '2016-07-07 10:19:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('148', '21', '80', '79', '70', '57', '70', null, '2016-07-07 10:20:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('149', '11', '80', '80', '70', '57', '70', null, '2016-07-07 10:21:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('150', '18', '80', '81', '70', '57', '70', null, '2016-07-07 10:22:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('151', '97', '80', '51', '70', '57', '70', null, '2016-07-07 10:23:02', '<font color=\"red\">CPU当前：97%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('152', '4', '80', '83', '70', '57', '70', null, '2016-07-07 10:24:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('153', '3', '80', '84', '70', '57', '70', null, '2016-07-07 10:25:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('154', '100', '80', '52', '70', '57', '70', null, '2016-07-07 10:27:02', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('155', '88', '80', '67', '70', '57', '70', null, '2016-07-07 10:34:01', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('156', '76', '80', '77', '70', '58', '70', null, '2016-07-07 10:35:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('157', '16', '80', '78', '70', '58', '70', null, '2016-07-07 10:36:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('158', '5', '80', '78', '70', '58', '70', null, '2016-07-07 10:37:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('159', '14', '80', '78', '70', '58', '70', null, '2016-07-07 10:38:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('160', '13', '80', '78', '70', '58', '70', null, '2016-07-07 10:39:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('161', '10', '80', '79', '70', '58', '70', null, '2016-07-07 10:40:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('162', '89', '80', '28', '70', '58', '70', null, '2016-07-07 10:43:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('163', '14', '80', '78', '70', '59', '70', null, '2016-07-07 11:07:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('164', '20', '80', '71', '70', '59', '70', null, '2016-07-07 11:09:14', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('165', '34', '80', '72', '70', '60', '70', null, '2016-07-07 11:12:38', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('166', '38', '80', '73', '70', '61', '70', null, '2016-07-07 11:13:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('167', '20', '80', '74', '70', '60', '70', null, '2016-07-07 11:14:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('168', '2', '80', '81', '70', '60', '70', null, '2016-07-07 11:15:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('169', '79', '80', '71', '70', '60', '70', null, '2016-07-07 11:17:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('170', '16', '80', '71', '70', '61', '70', null, '2016-07-07 11:18:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('171', '18', '80', '72', '70', '61', '70', null, '2016-07-07 11:19:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('172', '45', '80', '73', '70', '61', '70', null, '2016-07-07 11:20:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('173', '69', '80', '74', '70', '61', '70', null, '2016-07-07 11:21:05', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('174', '30', '80', '74', '70', '61', '70', null, '2016-07-07 11:23:23', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('175', '43', '80', '73', '70', '61', '70', null, '2016-07-07 11:26:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('176', '2', '80', '73', '70', '61', '70', null, '2016-07-07 11:27:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('177', '16', '80', '73', '70', '61', '70', null, '2016-07-07 11:28:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('178', '4', '80', '74', '70', '60', '70', null, '2016-07-07 11:29:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('179', '8', '80', '75', '70', '60', '70', null, '2016-07-07 11:30:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('180', '11', '80', '76', '70', '61', '70', null, '2016-07-07 11:31:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('181', '9', '80', '76', '70', '61', '70', null, '2016-07-07 11:32:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('182', '72', '80', '78', '70', '60', '70', null, '2016-07-07 11:33:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('183', '11', '80', '71', '70', '61', '70', null, '2016-07-07 11:34:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('184', '10', '80', '71', '70', '61', '70', null, '2016-07-07 11:35:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('185', '18', '80', '81', '70', '61', '70', null, '2016-07-07 11:36:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('186', '11', '80', '74', '70', '62', '70', null, '2016-07-07 11:49:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('187', '47', '80', '76', '70', '62', '70', null, '2016-07-07 11:50:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('188', '10', '80', '81', '70', '62', '70', null, '2016-07-07 11:51:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('189', '63', '80', '81', '70', '62', '70', null, '2016-07-07 11:52:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('190', '12', '80', '82', '70', '62', '70', null, '2016-07-07 11:53:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('191', '12', '80', '82', '70', '63', '70', null, '2016-07-07 11:54:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('192', '27', '80', '83', '70', '62', '70', null, '2016-07-07 11:55:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('193', '8', '80', '83', '70', '62', '70', null, '2016-07-07 11:56:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('194', '22', '80', '73', '70', '62', '70', null, '2016-07-07 11:58:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('195', '14', '80', '74', '70', '62', '70', null, '2016-07-07 11:59:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('196', '24', '80', '74', '70', '62', '70', null, '2016-07-07 12:00:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('197', '62', '80', '75', '70', '63', '70', null, '2016-07-07 12:01:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('198', '17', '80', '76', '70', '62', '70', null, '2016-07-07 12:02:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('199', '8', '80', '78', '70', '62', '70', null, '2016-07-07 12:03:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('200', '9', '80', '75', '70', '62', '70', null, '2016-07-07 12:04:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('201', '54', '80', '76', '70', '62', '70', null, '2016-07-07 12:06:48', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('202', '6', '80', '72', '70', '63', '70', null, '2016-07-07 13:21:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('203', '49', '80', '72', '70', '63', '70', null, '2016-07-07 13:22:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('204', '32', '80', '74', '70', '63', '70', null, '2016-07-07 13:23:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('205', '20', '80', '81', '70', '64', '70', null, '2016-07-07 13:24:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('206', '11', '80', '84', '70', '63', '70', null, '2016-07-07 13:25:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('207', '9', '80', '85', '70', '63', '70', null, '2016-07-07 13:26:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('208', '93', '80', '85', '70', '63', '70', null, '2016-07-07 13:27:01', '<font color=\"red\">CPU当前：93%,超出预设值  80%<br>JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('209', '52', '80', '85', '70', '65', '70', null, '2016-07-07 13:28:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('210', '17', '80', '85', '70', '65', '70', null, '2016-07-07 13:29:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('211', '65', '80', '85', '70', '65', '70', null, '2016-07-07 13:30:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('212', '91', '80', '32', '70', '64', '70', null, '2016-07-07 13:40:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('213', '98', '80', '35', '70', '64', '70', null, '2016-07-07 13:41:01', '<font color=\"red\">CPU当前：98%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('214', '30', '80', '81', '70', '63', '70', null, '2016-07-07 13:56:04', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('215', '81', '80', '48', '70', '63', '70', null, '2016-07-07 14:07:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('216', '12', '80', '79', '70', '64', '70', null, '2016-07-07 14:19:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('217', '87', '80', '37', '70', '63', '70', null, '2016-07-07 14:21:01', '<font color=\"red\">CPU当前：87%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('218', '13', '80', '77', '70', '63', '70', null, '2016-07-07 14:23:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('219', '24', '80', '77', '70', '64', '70', null, '2016-07-07 14:24:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('220', '9', '80', '78', '70', '63', '70', null, '2016-07-07 14:25:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('221', '9', '80', '84', '70', '63', '70', null, '2016-07-07 14:26:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('222', '5', '80', '84', '70', '63', '70', null, '2016-07-07 14:27:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('223', '8', '80', '84', '70', '63', '70', null, '2016-07-07 14:28:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('224', '2', '80', '84', '70', '63', '70', null, '2016-07-07 14:29:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('225', '22', '80', '73', '70', '64', '70', null, '2016-07-07 15:01:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('226', '16', '80', '74', '70', '64', '70', null, '2016-07-07 15:02:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('227', '18', '80', '75', '70', '64', '70', null, '2016-07-07 15:03:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('228', '15', '80', '84', '70', '65', '70', null, '2016-07-07 15:04:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('229', '17', '80', '83', '70', '63', '70', null, '2016-07-07 15:09:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('230', '14', '80', '73', '70', '63', '70', null, '2016-07-07 15:14:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('231', '24', '80', '83', '70', '63', '70', null, '2016-07-07 15:15:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('232', '13', '80', '80', '70', '63', '70', null, '2016-07-07 15:18:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('233', '36', '80', '77', '70', '63', '70', null, '2016-07-07 15:19:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('234', '13', '80', '82', '70', '64', '70', null, '2016-07-07 15:35:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('235', '5', '80', '82', '70', '63', '70', null, '2016-07-07 15:36:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('236', '6', '80', '83', '70', '63', '70', null, '2016-07-07 15:37:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('237', '13', '80', '83', '70', '63', '70', null, '2016-07-07 15:38:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('238', '74', '80', '83', '70', '64', '70', null, '2016-07-07 15:39:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('239', '6', '80', '88', '70', '63', '70', null, '2016-07-07 15:40:01', '<font color=\"red\">JVM当前：88%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('240', '70', '80', '88', '70', '63', '70', null, '2016-07-07 15:41:01', '<font color=\"red\">JVM当前：88%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('241', '92', '80', '34', '70', '69', '70', null, '2016-07-07 15:49:01', '<font color=\"red\">CPU当前：92%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('242', '92', '80', '34', '70', '69', '70', null, '2016-07-07 15:50:01', '<font color=\"red\">CPU当前：92%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('243', '18', '80', '35', '70', '71', '70', null, '2016-07-07 15:59:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('244', '16', '80', '35', '70', '73', '70', null, '2016-07-07 16:08:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('245', '45', '80', '35', '70', '72', '70', null, '2016-07-07 16:09:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('246', '13', '80', '35', '70', '73', '70', null, '2016-07-07 16:10:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('247', '6', '80', '36', '70', '73', '70', null, '2016-07-07 16:11:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('248', '8', '80', '36', '70', '73', '70', null, '2016-07-07 16:12:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('249', '64', '80', '36', '70', '73', '70', null, '2016-07-07 16:13:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('250', '10', '80', '36', '70', '73', '70', null, '2016-07-07 16:14:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('251', '51', '80', '36', '70', '73', '70', null, '2016-07-07 16:15:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('252', '8', '80', '36', '70', '73', '70', null, '2016-07-07 16:16:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('253', '10', '80', '36', '70', '73', '70', null, '2016-07-07 16:17:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('254', '6', '80', '36', '70', '73', '70', null, '2016-07-07 16:18:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('255', '8', '80', '37', '70', '73', '70', null, '2016-07-07 16:19:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('256', '7', '80', '37', '70', '73', '70', null, '2016-07-07 16:20:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('257', '4', '80', '37', '70', '73', '70', null, '2016-07-07 16:21:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('258', '20', '80', '38', '70', '74', '70', null, '2016-07-07 16:22:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('259', '86', '80', '47', '70', '69', '70', null, '2016-07-07 16:33:01', '<font color=\"red\">CPU当前：86%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('260', '87', '80', '52', '70', '69', '70', null, '2016-07-07 16:39:01', '<font color=\"red\">CPU当前：87%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('261', '5', '80', '78', '70', '70', '70', null, '2016-07-07 18:16:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('262', '1', '80', '79', '70', '70', '70', null, '2016-07-07 18:17:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('263', '40', '80', '79', '70', '65', '70', null, '2016-07-07 18:18:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('264', '24', '80', '59', '70', '72', '70', null, '2016-07-07 18:22:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('265', '16', '80', '59', '70', '71', '70', null, '2016-07-07 18:23:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('266', '10', '80', '59', '70', '71', '70', null, '2016-07-07 18:24:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('267', '5', '80', '80', '70', '51', '70', null, '2016-07-08 08:40:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('268', '13', '80', '80', '70', '51', '70', null, '2016-07-08 08:41:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('269', '71', '80', '80', '70', '50', '70', null, '2016-07-08 08:42:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('270', '81', '80', '44', '70', '52', '70', null, '2016-07-08 08:49:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('271', '84', '80', '58', '70', '54', '70', null, '2016-07-08 09:37:03', '<font color=\"red\">CPU当前：84%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('272', '98', '80', '44', '70', '57', '70', null, '2016-07-08 10:33:04', '<font color=\"red\">CPU当前：98%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('273', '82', '80', '54', '70', '57', '70', null, '2016-07-08 10:43:06', '<font color=\"red\">CPU当前：82%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('274', '88', '80', '62', '70', '59', '70', null, '2016-07-08 10:53:01', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('275', '96', '80', '58', '70', '58', '70', null, '2016-07-08 10:57:01', '<font color=\"red\">CPU当前：96%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('276', '32', '80', '71', '70', '59', '70', null, '2016-07-08 10:58:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('277', '16', '80', '71', '70', '60', '70', null, '2016-07-08 10:59:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('278', '6', '80', '71', '70', '60', '70', null, '2016-07-08 11:00:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('279', '16', '80', '71', '70', '60', '70', null, '2016-07-08 11:01:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('280', '16', '80', '72', '70', '60', '70', null, '2016-07-08 11:02:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('281', '8', '80', '72', '70', '60', '70', null, '2016-07-08 11:03:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('282', '14', '80', '72', '70', '60', '70', null, '2016-07-08 11:04:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('283', '6', '80', '72', '70', '60', '70', null, '2016-07-08 11:05:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('284', '52', '80', '72', '70', '60', '70', null, '2016-07-08 11:06:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('285', '6', '80', '72', '70', '59', '70', null, '2016-07-08 11:07:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('286', '85', '80', '72', '70', '59', '70', null, '2016-07-08 11:08:01', '<font color=\"red\">CPU当前：85%,超出预设值  80%<br>JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('287', '5', '80', '78', '70', '59', '70', null, '2016-07-08 11:09:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('288', '9', '80', '86', '70', '59', '70', null, '2016-07-08 11:10:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('289', '10', '80', '86', '70', '59', '70', null, '2016-07-08 11:11:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('290', '42', '80', '87', '70', '60', '70', null, '2016-07-08 11:12:01', '<font color=\"red\">JVM当前：87%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('291', '37', '80', '87', '70', '60', '70', null, '2016-07-08 11:13:01', '<font color=\"red\">JVM当前：87%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('292', '19', '80', '87', '70', '60', '70', null, '2016-07-08 11:14:16', '<font color=\"red\">JVM当前：87%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('293', '94', '80', '88', '70', '59', '70', null, '2016-07-08 11:15:02', '<font color=\"red\">CPU当前：94%,超出预设值  80%<br>JVM当前：88%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('294', '87', '80', '69', '70', '63', '70', null, '2016-07-08 11:26:01', '<font color=\"red\">CPU当前：87%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('295', '81', '80', '70', '70', '64', '70', null, '2016-07-08 11:34:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('296', '2', '80', '71', '70', '65', '70', null, '2016-07-08 11:48:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('297', '2', '80', '71', '70', '65', '70', null, '2016-07-08 11:49:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('298', '33', '80', '71', '70', '65', '70', null, '2016-07-08 11:50:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('299', '49', '80', '71', '70', '65', '70', null, '2016-07-08 11:51:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('300', '23', '80', '71', '70', '65', '70', null, '2016-07-08 11:52:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('301', '17', '80', '71', '70', '65', '70', null, '2016-07-08 11:53:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('302', '4', '80', '71', '70', '65', '70', null, '2016-07-08 11:54:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('303', '5', '80', '71', '70', '66', '70', null, '2016-07-08 11:55:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('304', '8', '80', '72', '70', '66', '70', null, '2016-07-08 11:56:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('305', '52', '80', '72', '70', '66', '70', null, '2016-07-08 11:57:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('306', '10', '80', '72', '70', '66', '70', null, '2016-07-08 11:58:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('307', '66', '80', '72', '70', '66', '70', null, '2016-07-08 11:59:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('308', '20', '80', '72', '70', '66', '70', null, '2016-07-08 12:00:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('309', '19', '80', '72', '70', '66', '70', null, '2016-07-08 12:01:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('310', '4', '80', '72', '70', '66', '70', null, '2016-07-08 12:02:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('311', '18', '80', '73', '70', '66', '70', null, '2016-07-08 12:03:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('312', '24', '80', '73', '70', '66', '70', null, '2016-07-08 12:04:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('313', '16', '80', '73', '70', '66', '70', null, '2016-07-08 12:05:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('314', '6', '80', '73', '70', '66', '70', null, '2016-07-08 12:06:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('315', '20', '80', '73', '70', '66', '70', null, '2016-07-08 12:07:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('316', '1', '80', '73', '70', '67', '70', null, '2016-07-08 12:08:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('317', '2', '80', '73', '70', '67', '70', null, '2016-07-08 12:09:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('318', '7', '80', '73', '70', '67', '70', null, '2016-07-08 12:10:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('319', '5', '80', '74', '70', '67', '70', null, '2016-07-08 12:11:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('320', '7', '80', '74', '70', '67', '70', null, '2016-07-08 12:12:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('321', '3', '80', '74', '70', '67', '70', null, '2016-07-08 12:13:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('322', '2', '80', '74', '70', '67', '70', null, '2016-07-08 12:14:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('323', '6', '80', '74', '70', '67', '70', null, '2016-07-08 12:15:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('324', '5', '80', '74', '70', '67', '70', null, '2016-07-08 12:16:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('325', '2', '80', '74', '70', '67', '70', null, '2016-07-08 12:17:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('326', '5', '80', '74', '70', '67', '70', null, '2016-07-08 12:18:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('327', '2', '80', '75', '70', '67', '70', null, '2016-07-08 12:19:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('328', '1', '80', '75', '70', '67', '70', null, '2016-07-08 12:20:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('329', '3', '80', '75', '70', '67', '70', null, '2016-07-08 12:21:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('330', '5', '80', '75', '70', '67', '70', null, '2016-07-08 12:22:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('331', '6', '80', '75', '70', '67', '70', null, '2016-07-08 12:23:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('332', '5', '80', '75', '70', '67', '70', null, '2016-07-08 12:24:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('333', '3', '80', '75', '70', '67', '70', null, '2016-07-08 12:25:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('334', '18', '80', '75', '70', '67', '70', null, '2016-07-08 12:26:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('335', '16', '80', '76', '70', '68', '70', null, '2016-07-08 12:27:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('336', '2', '80', '76', '70', '68', '70', null, '2016-07-08 12:28:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('337', '3', '80', '76', '70', '67', '70', null, '2016-07-08 12:29:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('338', '3', '80', '76', '70', '67', '70', null, '2016-07-08 12:30:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('339', '4', '80', '76', '70', '67', '70', null, '2016-07-08 12:31:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('340', '5', '80', '76', '70', '67', '70', null, '2016-07-08 12:32:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('341', '3', '80', '76', '70', '67', '70', null, '2016-07-08 12:33:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('342', '7', '80', '77', '70', '67', '70', null, '2016-07-08 12:34:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('343', '8', '80', '77', '70', '67', '70', null, '2016-07-08 12:35:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('344', '3', '80', '77', '70', '67', '70', null, '2016-07-08 12:36:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('345', '7', '80', '77', '70', '67', '70', null, '2016-07-08 12:37:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('346', '2', '80', '77', '70', '67', '70', null, '2016-07-08 12:38:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('347', '2', '80', '77', '70', '67', '70', null, '2016-07-08 12:39:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('348', '13', '80', '78', '70', '67', '70', null, '2016-07-08 12:40:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('349', '6', '80', '78', '70', '67', '70', null, '2016-07-08 12:41:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('350', '4', '80', '78', '70', '67', '70', null, '2016-07-08 12:42:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('351', '1', '80', '78', '70', '67', '70', null, '2016-07-08 12:43:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('352', '2', '80', '78', '70', '67', '70', null, '2016-07-08 12:44:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('353', '3', '80', '78', '70', '67', '70', null, '2016-07-08 12:45:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('354', '8', '80', '78', '70', '67', '70', null, '2016-07-08 12:46:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('355', '8', '80', '78', '70', '67', '70', null, '2016-07-08 12:47:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('356', '8', '80', '79', '70', '68', '70', null, '2016-07-08 12:48:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('357', '9', '80', '79', '70', '68', '70', null, '2016-07-08 12:49:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('358', '6', '80', '79', '70', '67', '70', null, '2016-07-08 12:50:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('359', '8', '80', '79', '70', '67', '70', null, '2016-07-08 12:51:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('360', '6', '80', '79', '70', '67', '70', null, '2016-07-08 12:52:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('361', '6', '80', '79', '70', '67', '70', null, '2016-07-08 12:53:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('362', '2', '80', '79', '70', '67', '70', null, '2016-07-08 12:54:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('363', '2', '80', '79', '70', '67', '70', null, '2016-07-08 12:55:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('364', '1', '80', '79', '70', '67', '70', null, '2016-07-08 12:56:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('365', '7', '80', '80', '70', '68', '70', null, '2016-07-08 12:57:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('366', '8', '80', '80', '70', '68', '70', null, '2016-07-08 12:58:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('367', '6', '80', '80', '70', '68', '70', null, '2016-07-08 12:59:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('368', '1', '80', '80', '70', '68', '70', null, '2016-07-08 13:00:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('369', '5', '80', '81', '70', '68', '70', null, '2016-07-08 13:01:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('370', '4', '80', '81', '70', '68', '70', null, '2016-07-08 13:02:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('371', '4', '80', '81', '70', '68', '70', null, '2016-07-08 13:03:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('372', '8', '80', '81', '70', '68', '70', null, '2016-07-08 13:04:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('373', '6', '80', '81', '70', '67', '70', null, '2016-07-08 13:05:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('374', '2', '80', '81', '70', '67', '70', null, '2016-07-08 13:06:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('375', '3', '80', '81', '70', '67', '70', null, '2016-07-08 13:07:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('376', '2', '80', '81', '70', '67', '70', null, '2016-07-08 13:08:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('377', '7', '80', '81', '70', '68', '70', null, '2016-07-08 13:09:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('378', '5', '80', '82', '70', '68', '70', null, '2016-07-08 13:10:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('379', '4', '80', '82', '70', '67', '70', null, '2016-07-08 13:11:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('380', '1', '80', '82', '70', '68', '70', null, '2016-07-08 13:12:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('381', '5', '80', '82', '70', '67', '70', null, '2016-07-08 13:13:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('382', '5', '80', '82', '70', '67', '70', null, '2016-07-08 13:14:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('383', '5', '80', '82', '70', '67', '70', null, '2016-07-08 13:15:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('384', '6', '80', '82', '70', '67', '70', null, '2016-07-08 13:16:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('385', '3', '80', '82', '70', '67', '70', null, '2016-07-08 13:17:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('386', '12', '80', '83', '70', '68', '70', null, '2016-07-08 13:18:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('387', '1', '80', '83', '70', '68', '70', null, '2016-07-08 13:19:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('388', '6', '80', '83', '70', '68', '70', null, '2016-07-08 13:20:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('389', '3', '80', '83', '70', '68', '70', null, '2016-07-08 13:21:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('390', '5', '80', '83', '70', '68', '70', null, '2016-07-08 13:22:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('391', '5', '80', '83', '70', '68', '70', null, '2016-07-08 13:23:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('392', '3', '80', '83', '70', '68', '70', null, '2016-07-08 13:24:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('393', '6', '80', '83', '70', '68', '70', null, '2016-07-08 13:25:01', '<font color=\"red\">JVM当前：83%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('394', '4', '80', '84', '70', '68', '70', null, '2016-07-08 13:26:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('395', '11', '80', '84', '70', '68', '70', null, '2016-07-08 13:27:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('396', '5', '80', '84', '70', '69', '70', null, '2016-07-08 13:28:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('397', '6', '80', '84', '70', '69', '70', null, '2016-07-08 13:29:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('398', '1', '80', '84', '70', '69', '70', null, '2016-07-08 13:30:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('399', '8', '80', '84', '70', '68', '70', null, '2016-07-08 13:31:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('400', '5', '80', '85', '70', '68', '70', null, '2016-07-08 13:32:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('401', '4', '80', '85', '70', '68', '70', null, '2016-07-08 13:33:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('402', '2', '80', '85', '70', '68', '70', null, '2016-07-08 13:34:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('403', '6', '80', '85', '70', '68', '70', null, '2016-07-08 13:35:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('404', '9', '80', '85', '70', '68', '70', null, '2016-07-08 13:36:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('405', '14', '80', '85', '70', '68', '70', null, '2016-07-08 13:37:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('406', '5', '80', '85', '70', '68', '70', null, '2016-07-08 13:38:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('407', '10', '80', '85', '70', '69', '70', null, '2016-07-08 13:39:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('408', '21', '80', '85', '70', '68', '70', null, '2016-07-08 13:40:01', '<font color=\"red\">JVM当前：85%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('409', '10', '80', '86', '70', '68', '70', null, '2016-07-08 13:41:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('410', '10', '80', '86', '70', '68', '70', null, '2016-07-08 13:42:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('411', '5', '80', '86', '70', '68', '70', null, '2016-07-08 13:43:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('412', '6', '80', '86', '70', '68', '70', null, '2016-07-08 13:44:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('413', '6', '80', '86', '70', '68', '70', null, '2016-07-08 13:45:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('414', '8', '80', '86', '70', '68', '70', null, '2016-07-08 13:46:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('415', '5', '80', '86', '70', '68', '70', null, '2016-07-08 13:47:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('416', '11', '80', '86', '70', '68', '70', null, '2016-07-08 13:48:01', '<font color=\"red\">JVM当前：86%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('417', '93', '80', '27', '70', '69', '70', null, '2016-07-08 13:51:01', '<font color=\"red\">CPU当前：93%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('418', '19', '80', '84', '70', '65', '70', null, '2016-07-08 14:25:01', '<font color=\"red\">JVM当前：84%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('419', '51', '80', '74', '70', '65', '70', null, '2016-07-08 14:33:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('420', '15', '80', '74', '70', '65', '70', null, '2016-07-08 14:34:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('421', '19', '80', '74', '70', '65', '70', null, '2016-07-08 14:35:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('422', '16', '80', '74', '70', '65', '70', null, '2016-07-08 14:36:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('423', '82', '80', '74', '70', '65', '70', null, '2016-07-08 14:37:01', '<font color=\"red\">CPU当前：82%,超出预设值  80%<br>JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('424', '16', '80', '75', '70', '66', '70', null, '2016-07-08 14:38:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('425', '77', '80', '82', '70', '61', '70', null, '2016-07-08 15:30:05', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('426', '93', '80', '74', '70', '61', '70', null, '2016-07-08 15:32:01', '<font color=\"red\">CPU当前：93%,超出预设值  80%<br>JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('427', '81', '80', '26', '70', '60', '70', null, '2016-07-08 15:38:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('428', '89', '80', '64', '70', '62', '70', null, '2016-07-08 15:46:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('429', '12', '80', '81', '70', '62', '70', null, '2016-07-08 15:51:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('430', '84', '80', '40', '70', '61', '70', null, '2016-07-08 15:54:01', '<font color=\"red\">CPU当前：84%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('431', '80', '80', '71', '70', '61', '70', null, '2016-07-08 16:08:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('432', '31', '80', '71', '70', '68', '70', null, '2016-07-08 16:09:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('433', '45', '80', '71', '70', '68', '70', null, '2016-07-08 16:10:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('434', '35', '80', '71', '70', '69', '70', null, '2016-07-08 16:11:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('435', '4', '80', '71', '70', '65', '70', null, '2016-07-08 16:12:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('436', '18', '80', '71', '70', '65', '70', null, '2016-07-08 16:13:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('437', '12', '80', '71', '70', '65', '70', null, '2016-07-08 16:14:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('438', '11', '80', '72', '70', '65', '70', null, '2016-07-08 16:15:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('439', '13', '80', '72', '70', '65', '70', null, '2016-07-08 16:16:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('440', '7', '80', '72', '70', '65', '70', null, '2016-07-08 16:17:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('441', '14', '80', '72', '70', '66', '70', null, '2016-07-08 16:18:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('442', '13', '80', '72', '70', '66', '70', null, '2016-07-08 16:19:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('443', '10', '80', '72', '70', '65', '70', null, '2016-07-08 16:20:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('444', '14', '80', '72', '70', '66', '70', null, '2016-07-08 16:21:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('445', '8', '80', '72', '70', '66', '70', null, '2016-07-08 16:22:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('446', '19', '80', '73', '70', '66', '70', null, '2016-07-08 16:23:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('447', '25', '80', '73', '70', '66', '70', null, '2016-07-08 16:24:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('448', '10', '80', '73', '70', '66', '70', null, '2016-07-08 16:25:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('449', '12', '80', '73', '70', '65', '70', null, '2016-07-08 16:26:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('450', '12', '80', '73', '70', '66', '70', null, '2016-07-08 16:27:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('451', '6', '80', '73', '70', '66', '70', null, '2016-07-08 16:28:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('452', '21', '80', '73', '70', '66', '70', null, '2016-07-08 16:29:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('453', '91', '80', '73', '70', '65', '70', null, '2016-07-08 16:30:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br>JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('454', '7', '80', '74', '70', '65', '70', null, '2016-07-08 16:31:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('455', '45', '80', '74', '70', '65', '70', null, '2016-07-08 16:32:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('456', '6', '80', '74', '70', '65', '70', null, '2016-07-08 16:33:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('457', '3', '80', '74', '70', '65', '70', null, '2016-07-08 16:34:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('458', '5', '80', '74', '70', '65', '70', null, '2016-07-08 16:35:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('459', '7', '80', '74', '70', '65', '70', null, '2016-07-08 16:36:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('460', '4', '80', '74', '70', '65', '70', null, '2016-07-08 16:37:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('461', '5', '80', '75', '70', '65', '70', null, '2016-07-08 16:38:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('462', '4', '80', '75', '70', '65', '70', null, '2016-07-08 16:39:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('463', '62', '80', '76', '70', '65', '70', null, '2016-07-08 16:40:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('464', '3', '80', '76', '70', '65', '70', null, '2016-07-08 16:41:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('465', '4', '80', '76', '70', '65', '70', null, '2016-07-08 16:42:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('466', '25', '80', '76', '70', '65', '70', null, '2016-07-08 16:43:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('467', '13', '80', '76', '70', '65', '70', null, '2016-07-08 16:44:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('468', '2', '80', '76', '70', '65', '70', null, '2016-07-08 16:45:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('469', '9', '80', '76', '70', '65', '70', null, '2016-07-08 16:46:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('470', '4', '80', '77', '70', '65', '70', null, '2016-07-08 16:47:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('471', '1', '80', '77', '70', '65', '70', null, '2016-07-08 16:48:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('472', '5', '80', '77', '70', '65', '70', null, '2016-07-08 16:49:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('473', '2', '80', '77', '70', '65', '70', null, '2016-07-08 16:50:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('474', '49', '80', '77', '70', '66', '70', null, '2016-07-08 16:51:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('475', '8', '80', '77', '70', '66', '70', null, '2016-07-08 16:52:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('476', '5', '80', '77', '70', '65', '70', null, '2016-07-08 16:53:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('477', '2', '80', '77', '70', '68', '70', null, '2016-07-08 16:54:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('478', '17', '80', '78', '70', '68', '70', null, '2016-07-08 16:55:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('479', '22', '80', '78', '70', '68', '70', null, '2016-07-08 16:56:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('480', '7', '80', '78', '70', '67', '70', null, '2016-07-08 16:57:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('481', '9', '80', '78', '70', '67', '70', null, '2016-07-08 16:58:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('482', '11', '80', '78', '70', '67', '70', null, '2016-07-08 16:59:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('483', '11', '80', '78', '70', '67', '70', null, '2016-07-08 17:00:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('484', '6', '80', '78', '70', '67', '70', null, '2016-07-08 17:01:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('485', '9', '80', '78', '70', '67', '70', null, '2016-07-08 17:02:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('486', '11', '80', '79', '70', '67', '70', null, '2016-07-08 17:03:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('487', '4', '80', '79', '70', '67', '70', null, '2016-07-08 17:04:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('488', '3', '80', '79', '70', '67', '70', null, '2016-07-08 17:05:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('489', '5', '80', '79', '70', '67', '70', null, '2016-07-08 17:06:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('490', '10', '80', '79', '70', '67', '70', null, '2016-07-08 17:07:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('491', '3', '80', '79', '70', '65', '70', null, '2016-07-08 17:08:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('492', '10', '80', '80', '70', '66', '70', null, '2016-07-08 17:09:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('493', '4', '80', '80', '70', '65', '70', null, '2016-07-08 17:10:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('494', '3', '80', '80', '70', '65', '70', null, '2016-07-08 17:11:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('495', '8', '80', '80', '70', '65', '70', null, '2016-07-08 17:12:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('496', '2', '80', '80', '70', '65', '70', null, '2016-07-08 17:13:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('497', '7', '80', '80', '70', '66', '70', null, '2016-07-08 17:14:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('498', '32', '80', '80', '70', '68', '70', null, '2016-07-08 17:15:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('499', '44', '80', '80', '70', '68', '70', null, '2016-07-08 17:16:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('500', '69', '80', '81', '70', '67', '70', null, '2016-07-08 17:17:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('501', '13', '80', '81', '70', '71', '70', null, '2016-07-08 17:18:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('502', '46', '80', '81', '70', '71', '70', null, '2016-07-08 17:19:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('503', '8', '80', '81', '70', '72', '70', null, '2016-07-08 17:20:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('504', '13', '80', '81', '70', '72', '70', null, '2016-07-08 17:21:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('505', '6', '80', '81', '70', '73', '70', null, '2016-07-08 17:22:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('506', '13', '80', '81', '70', '73', '70', null, '2016-07-08 17:23:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('507', '12', '80', '81', '70', '75', '70', null, '2016-07-08 17:24:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('508', '4', '80', '82', '70', '75', '70', null, '2016-07-08 17:25:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('509', '13', '80', '82', '70', '77', '70', null, '2016-07-08 17:26:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br>内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('510', '13', '80', '82', '70', '78', '70', null, '2016-07-08 17:27:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br>内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('511', '54', '80', '82', '70', '79', '70', null, '2016-07-08 17:28:01', '<font color=\"red\">JVM当前：82%,超出预设值 70%<br>内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('512', '10', '80', '31', '70', '79', '70', null, '2016-07-08 17:29:01', '<font color=\"red\">内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('513', '25', '80', '38', '70', '80', '70', null, '2016-07-08 17:30:01', '<font color=\"red\">内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('514', '6', '80', '38', '70', '80', '70', null, '2016-07-08 17:31:01', '<font color=\"red\">内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('515', '50', '80', '38', '70', '76', '70', null, '2016-07-08 17:32:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('516', '2', '80', '38', '70', '77', '70', null, '2016-07-08 17:33:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('517', '95', '80', '45', '70', '69', '70', null, '2016-07-10 11:22:01', '<font color=\"red\">CPU当前：95%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('518', '10', '80', '45', '70', '71', '70', null, '2016-07-10 11:27:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('519', '32', '80', '46', '70', '72', '70', null, '2016-07-10 11:28:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('520', '17', '80', '46', '70', '72', '70', null, '2016-07-10 11:29:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('521', '12', '80', '46', '70', '72', '70', null, '2016-07-10 11:30:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('522', '13', '80', '46', '70', '72', '70', null, '2016-07-10 11:31:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('523', '11', '80', '46', '70', '72', '70', null, '2016-07-10 11:32:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('524', '16', '80', '46', '70', '72', '70', null, '2016-07-10 11:33:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('525', '13', '80', '47', '70', '72', '70', null, '2016-07-10 11:34:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('526', '16', '80', '47', '70', '73', '70', null, '2016-07-10 11:35:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('527', '51', '80', '47', '70', '72', '70', null, '2016-07-10 11:36:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('528', '54', '80', '47', '70', '72', '70', null, '2016-07-10 11:37:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('529', '82', '80', '62', '70', '62', '70', null, '2016-07-10 12:14:01', '<font color=\"red\">CPU当前：82%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('530', '85', '80', '30', '70', '63', '70', null, '2016-07-10 12:32:01', '<font color=\"red\">CPU当前：85%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('531', '91', '80', '26', '70', '63', '70', null, '2016-07-10 12:35:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('532', '59', '80', '45', '70', '72', '70', null, '2016-07-10 12:48:01', '<font color=\"red\">内存当前：72%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('533', '56', '80', '45', '70', '74', '70', null, '2016-07-10 12:49:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('534', '45', '80', '46', '70', '74', '70', null, '2016-07-10 12:50:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('535', '77', '80', '46', '70', '75', '70', null, '2016-07-10 12:51:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('536', '54', '80', '46', '70', '75', '70', null, '2016-07-10 12:52:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('537', '64', '80', '46', '70', '75', '70', null, '2016-07-10 12:53:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('538', '63', '80', '46', '70', '76', '70', null, '2016-07-10 12:54:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('539', '69', '80', '47', '70', '76', '70', null, '2016-07-10 12:55:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('540', '69', '80', '47', '70', '76', '70', null, '2016-07-10 12:56:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('541', '66', '80', '47', '70', '77', '70', null, '2016-07-10 12:57:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('542', '55', '80', '47', '70', '77', '70', null, '2016-07-10 12:58:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('543', '38', '80', '47', '70', '77', '70', null, '2016-07-10 12:59:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('544', '38', '80', '47', '70', '77', '70', null, '2016-07-10 13:00:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('545', '43', '80', '48', '70', '77', '70', null, '2016-07-10 13:01:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('546', '41', '80', '48', '70', '77', '70', null, '2016-07-10 13:02:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('547', '41', '80', '48', '70', '77', '70', null, '2016-07-10 13:03:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('548', '62', '80', '48', '70', '78', '70', null, '2016-07-10 13:04:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('549', '46', '80', '48', '70', '77', '70', null, '2016-07-10 13:05:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('550', '70', '80', '49', '70', '77', '70', null, '2016-07-10 13:06:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('551', '52', '80', '49', '70', '77', '70', null, '2016-07-10 13:07:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('552', '51', '80', '49', '70', '77', '70', null, '2016-07-10 13:08:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('553', '40', '80', '49', '70', '77', '70', null, '2016-07-10 13:09:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('554', '69', '80', '49', '70', '77', '70', null, '2016-07-10 13:10:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('555', '50', '80', '49', '70', '71', '70', null, '2016-07-10 13:11:01', '<font color=\"red\">内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('556', '52', '80', '50', '70', '74', '70', null, '2016-07-10 13:12:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('557', '20', '80', '50', '70', '75', '70', null, '2016-07-10 13:13:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('558', '91', '80', '50', '70', '76', '70', null, '2016-07-10 13:14:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br>内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('559', '99', '80', '51', '70', '75', '70', null, '2016-07-10 13:15:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('560', '93', '80', '51', '70', '77', '70', null, '2016-07-10 13:16:01', '<font color=\"red\">CPU当前：93%,超出预设值  80%<br>内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('561', '88', '80', '52', '70', '77', '70', null, '2016-07-10 13:17:01', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br>内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('562', '52', '80', '52', '70', '77', '70', null, '2016-07-10 13:18:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('563', '96', '80', '53', '70', '78', '70', null, '2016-07-10 13:20:01', '<font color=\"red\">CPU当前：96%,超出预设值  80%<br>内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('564', '43', '80', '31', '70', '78', '70', null, '2016-07-10 13:21:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('565', '83', '80', '32', '70', '79', '70', null, '2016-07-10 13:22:01', '<font color=\"red\">CPU当前：83%,超出预设值  80%<br>内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('566', '71', '80', '44', '70', '79', '70', null, '2016-07-10 13:23:01', '<font color=\"red\">内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('567', '96', '80', '47', '70', '80', '70', null, '2016-07-10 13:26:07', '<font color=\"red\">CPU当前：96%,超出预设值  80%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('568', '61', '80', '66', '70', '81', '70', null, '2016-07-10 13:34:15', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('569', '92', '80', '33', '70', '79', '70', null, '2016-07-10 13:35:01', '<font color=\"red\">CPU当前：92%,超出预设值  80%<br>内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('570', '56', '80', '33', '70', '80', '70', null, '2016-07-10 13:36:01', '<font color=\"red\">内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('571', '69', '80', '33', '70', '79', '70', null, '2016-07-10 13:37:01', '<font color=\"red\">内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('572', '100', '80', '35', '70', '81', '70', null, '2016-07-10 13:38:04', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('573', '62', '80', '36', '70', '80', '70', null, '2016-07-10 13:39:01', '<font color=\"red\">内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('574', '75', '80', '36', '70', '80', '70', null, '2016-07-10 13:40:01', '<font color=\"red\">内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('575', '57', '80', '37', '70', '81', '70', null, '2016-07-10 13:41:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('576', '99', '80', '37', '70', '81', '70', null, '2016-07-10 13:42:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('577', '99', '80', '37', '70', '80', '70', null, '2016-07-10 13:43:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('578', '100', '80', '67', '70', '81', '70', null, '2016-07-10 13:45:01', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('579', '91', '80', '68', '70', '80', '70', null, '2016-07-10 13:46:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('580', '88', '80', '68', '70', '81', '70', null, '2016-07-10 13:47:01', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('581', '100', '80', '69', '70', '81', '70', null, '2016-07-10 13:48:01', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('582', '53', '80', '60', '70', '80', '70', null, '2016-07-10 13:50:01', '<font color=\"red\">内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('583', '63', '80', '30', '70', '82', '70', null, '2016-07-10 13:51:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('584', '76', '80', '30', '70', '84', '70', null, '2016-07-10 13:52:01', '<font color=\"red\">内存当前：84%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('585', '56', '80', '31', '70', '85', '70', null, '2016-07-10 13:53:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('586', '68', '80', '31', '70', '85', '70', null, '2016-07-10 13:54:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('587', '73', '80', '32', '70', '83', '70', null, '2016-07-10 13:55:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('588', '91', '80', '32', '70', '84', '70', null, '2016-07-10 13:56:01', '<font color=\"red\">CPU当前：91%,超出预设值  80%<br>内存当前：84%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('589', '38', '80', '32', '70', '83', '70', null, '2016-07-10 13:57:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('590', '17', '80', '32', '70', '83', '70', null, '2016-07-10 13:58:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('591', '70', '80', '33', '70', '85', '70', null, '2016-07-10 13:59:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('592', '99', '80', '33', '70', '85', '70', null, '2016-07-10 14:00:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br>内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('593', '78', '80', '33', '70', '87', '70', null, '2016-07-10 14:01:01', '<font color=\"red\">内存当前：87%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('594', '90', '80', '46', '70', '83', '70', null, '2016-07-10 14:03:01', '<font color=\"red\">CPU当前：90%,超出预设值  80%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('595', '77', '80', '60', '70', '83', '70', null, '2016-07-10 14:04:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('596', '65', '80', '71', '70', '83', '70', null, '2016-07-10 14:05:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('597', '100', '80', '72', '70', '83', '70', null, '2016-07-10 14:06:07', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>JVM当前：72%,超出预设值 70%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('598', '94', '80', '72', '70', '85', '70', null, '2016-07-10 14:07:01', '<font color=\"red\">CPU当前：94%,超出预设值  80%<br>JVM当前：72%,超出预设值 70%<br>内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('599', '7', '80', '73', '70', '75', '70', null, '2016-07-10 14:08:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('600', '38', '80', '76', '70', '75', '70', null, '2016-07-10 14:09:02', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('601', '13', '80', '77', '70', '75', '70', null, '2016-07-10 14:10:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('602', '17', '80', '77', '70', '75', '70', null, '2016-07-10 14:11:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('603', '89', '80', '79', '70', '75', '70', null, '2016-07-10 14:12:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br>JVM当前：79%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('604', '13', '80', '66', '70', '73', '70', null, '2016-07-10 14:36:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('605', '14', '80', '73', '70', '73', '70', null, '2016-07-10 14:37:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('606', '4', '80', '73', '70', '73', '70', null, '2016-07-10 14:38:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('607', '78', '80', '61', '70', '75', '70', null, '2016-07-10 14:51:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('608', '77', '80', '71', '70', '76', '70', null, '2016-07-10 14:52:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('609', '8', '80', '72', '70', '75', '70', null, '2016-07-10 14:53:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('610', '7', '80', '72', '70', '76', '70', null, '2016-07-10 14:54:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('611', '81', '80', '72', '70', '76', '70', null, '2016-07-10 14:55:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br>JVM当前：72%,超出预设值 70%<br>内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('612', '46', '80', '31', '70', '76', '70', null, '2016-07-10 14:59:18', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('613', '8', '80', '42', '70', '76', '70', null, '2016-07-10 15:00:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('614', '3', '80', '42', '70', '76', '70', null, '2016-07-10 15:01:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('615', '16', '80', '42', '70', '76', '70', null, '2016-07-10 15:02:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('616', '11', '80', '28', '70', '76', '70', null, '2016-07-10 15:04:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('617', '10', '80', '28', '70', '76', '70', null, '2016-07-10 15:05:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('618', '10', '80', '28', '70', '76', '70', null, '2016-07-10 15:06:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('619', '100', '80', '28', '70', '77', '70', null, '2016-07-10 15:07:02', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('620', '8', '80', '28', '70', '78', '70', null, '2016-07-10 15:08:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('621', '11', '80', '30', '70', '78', '70', null, '2016-07-10 15:09:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('622', '10', '80', '30', '70', '78', '70', null, '2016-07-10 15:10:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('623', '21', '80', '30', '70', '78', '70', null, '2016-07-10 15:11:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('624', '39', '80', '30', '70', '78', '70', null, '2016-07-10 15:12:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('625', '98', '80', '30', '70', '77', '70', null, '2016-07-10 15:13:01', '<font color=\"red\">CPU当前：98%,超出预设值  80%<br>内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('626', '15', '80', '30', '70', '77', '70', null, '2016-07-10 15:14:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('627', '11', '80', '30', '70', '79', '70', null, '2016-07-10 15:15:01', '<font color=\"red\">内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('628', '7', '80', '31', '70', '78', '70', null, '2016-07-10 15:16:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('629', '9', '80', '31', '70', '78', '70', null, '2016-07-10 15:17:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('630', '17', '80', '32', '70', '78', '70', null, '2016-07-10 15:18:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('631', '48', '80', '32', '70', '78', '70', null, '2016-07-10 15:19:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('632', '27', '80', '69', '70', '78', '70', null, '2016-07-10 15:20:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('633', '10', '80', '69', '70', '78', '70', null, '2016-07-10 15:21:01', '<font color=\"red\">内存当前：78%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('634', '19', '80', '69', '70', '79', '70', null, '2016-07-10 15:22:01', '<font color=\"red\">内存当前：79%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('635', '12', '80', '70', '70', '81', '70', null, '2016-07-10 15:23:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('636', '19', '80', '70', '70', '81', '70', null, '2016-07-10 15:24:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('637', '14', '80', '71', '70', '80', '70', null, '2016-07-10 15:25:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('638', '99', '80', '72', '70', '81', '70', null, '2016-07-10 15:26:01', '<font color=\"red\">CPU当前：99%,超出预设值  80%<br>JVM当前：72%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('639', '34', '80', '73', '70', '81', '70', null, '2016-07-10 15:27:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('640', '8', '80', '73', '70', '83', '70', null, '2016-07-10 15:28:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('641', '74', '80', '73', '70', '83', '70', null, '2016-07-10 15:29:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('642', '77', '80', '75', '70', '82', '70', null, '2016-07-10 15:30:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('643', '16', '80', '75', '70', '81', '70', null, '2016-07-10 15:31:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('644', '21', '80', '75', '70', '81', '70', null, '2016-07-10 15:32:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('645', '13', '80', '76', '70', '81', '70', null, '2016-07-10 15:33:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('646', '12', '80', '77', '70', '80', '70', null, '2016-07-10 15:34:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('647', '6', '80', '77', '70', '81', '70', null, '2016-07-10 15:35:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('648', '6', '80', '77', '70', '81', '70', null, '2016-07-10 15:36:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('649', '16', '80', '77', '70', '81', '70', null, '2016-07-10 15:37:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('650', '9', '80', '78', '70', '81', '70', null, '2016-07-10 15:38:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('651', '65', '80', '78', '70', '81', '70', null, '2016-07-10 15:39:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('652', '13', '80', '78', '70', '81', '70', null, '2016-07-10 15:40:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('653', '48', '80', '78', '70', '81', '70', null, '2016-07-10 15:41:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('654', '40', '80', '78', '70', '81', '70', null, '2016-07-10 15:42:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('655', '82', '80', '80', '70', '81', '70', null, '2016-07-10 15:43:13', '<font color=\"red\">CPU当前：82%,超出预设值  80%<br>JVM当前：80%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('656', '13', '80', '81', '70', '81', '70', null, '2016-07-10 15:44:01', '<font color=\"red\">JVM当前：81%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('657', '27', '80', '57', '70', '82', '70', null, '2016-07-10 15:45:09', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('658', '19', '80', '57', '70', '82', '70', null, '2016-07-10 15:46:18', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('659', '21', '80', '58', '70', '82', '70', null, '2016-07-10 15:47:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('660', '13', '80', '58', '70', '81', '70', null, '2016-07-10 15:48:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('661', '40', '80', '58', '70', '82', '70', null, '2016-07-10 15:49:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('662', '89', '80', '60', '70', '82', '70', null, '2016-07-10 15:50:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br>内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('663', '24', '80', '60', '70', '82', '70', null, '2016-07-10 15:51:40', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('664', '21', '80', '60', '70', '82', '70', null, '2016-07-10 15:52:12', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('665', '42', '80', '60', '70', '82', '70', null, '2016-07-10 15:53:12', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('666', '10', '80', '61', '70', '82', '70', null, '2016-07-10 15:54:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('667', '61', '80', '38', '70', '82', '70', null, '2016-07-10 15:56:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('668', '48', '80', '45', '70', '83', '70', null, '2016-07-10 15:57:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('669', '11', '80', '45', '70', '82', '70', null, '2016-07-10 15:58:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('670', '13', '80', '45', '70', '82', '70', null, '2016-07-10 15:59:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('671', '24', '80', '45', '70', '82', '70', null, '2016-07-10 16:00:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('672', '7', '80', '47', '70', '82', '70', null, '2016-07-10 16:01:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('673', '15', '80', '47', '70', '82', '70', null, '2016-07-10 16:02:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('674', '13', '80', '47', '70', '82', '70', null, '2016-07-10 16:03:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('675', '46', '80', '63', '70', '82', '70', null, '2016-07-10 16:09:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('676', '84', '80', '32', '70', '83', '70', null, '2016-07-10 16:10:01', '<font color=\"red\">CPU当前：84%,超出预设值  80%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('677', '85', '80', '32', '70', '82', '70', null, '2016-07-10 16:11:01', '<font color=\"red\">CPU当前：85%,超出预设值  80%<br>内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('678', '34', '80', '32', '70', '82', '70', null, '2016-07-10 16:12:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('679', '6', '80', '65', '70', '82', '70', null, '2016-07-10 16:14:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('680', '95', '80', '65', '70', '82', '70', null, '2016-07-10 16:15:01', '<font color=\"red\">CPU当前：95%,超出预设值  80%<br>内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('681', '77', '80', '66', '70', '82', '70', null, '2016-07-10 16:16:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('682', '73', '80', '66', '70', '82', '70', null, '2016-07-10 16:17:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('683', '24', '80', '66', '70', '83', '70', null, '2016-07-10 16:18:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('684', '16', '80', '66', '70', '83', '70', null, '2016-07-10 16:19:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('685', '23', '80', '68', '70', '82', '70', null, '2016-07-10 16:20:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('686', '13', '80', '68', '70', '82', '70', null, '2016-07-10 16:21:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('687', '32', '80', '68', '70', '82', '70', null, '2016-07-10 16:22:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('688', '13', '80', '68', '70', '82', '70', null, '2016-07-10 16:23:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('689', '37', '80', '68', '70', '82', '70', null, '2016-07-10 16:24:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('690', '20', '80', '69', '70', '82', '70', null, '2016-07-10 16:25:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('691', '15', '80', '69', '70', '83', '70', null, '2016-07-10 16:26:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('692', '13', '80', '69', '70', '83', '70', null, '2016-07-10 16:27:01', '<font color=\"red\">内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('693', '12', '80', '69', '70', '84', '70', null, '2016-07-10 16:28:01', '<font color=\"red\">内存当前：84%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('694', '19', '80', '70', '70', '84', '70', null, '2016-07-10 16:29:01', '<font color=\"red\">内存当前：84%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('695', '11', '80', '70', '70', '84', '70', null, '2016-07-10 16:30:01', '<font color=\"red\">内存当前：84%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('696', '78', '80', '66', '70', '84', '70', null, '2016-07-10 16:32:01', '<font color=\"red\">内存当前：84%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('697', '18', '80', '67', '70', '85', '70', null, '2016-07-10 16:33:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('698', '9', '80', '32', '70', '85', '70', null, '2016-07-10 16:35:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('699', '88', '80', '38', '70', '85', '70', null, '2016-07-10 16:37:01', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br>内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('700', '7', '80', '40', '70', '85', '70', null, '2016-07-10 16:38:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('701', '49', '80', '40', '70', '85', '70', null, '2016-07-10 16:39:01', '<font color=\"red\">内存当前：85%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('702', '12', '80', '61', '70', '73', '70', null, '2016-07-10 16:41:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('703', '86', '80', '34', '70', '73', '70', null, '2016-07-10 16:42:01', '<font color=\"red\">CPU当前：86%,超出预设值  80%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('704', '49', '80', '34', '70', '74', '70', null, '2016-07-10 16:43:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('705', '6', '80', '34', '70', '73', '70', null, '2016-07-10 16:44:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('706', '17', '80', '35', '70', '73', '70', null, '2016-07-10 16:45:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('707', '23', '80', '35', '70', '73', '70', null, '2016-07-10 16:46:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('708', '25', '80', '27', '70', '74', '70', null, '2016-07-10 16:48:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('709', '15', '80', '27', '70', '74', '70', null, '2016-07-10 16:49:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('710', '11', '80', '27', '70', '74', '70', null, '2016-07-10 16:50:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('711', '29', '80', '27', '70', '74', '70', null, '2016-07-10 16:51:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('712', '8', '80', '27', '70', '74', '70', null, '2016-07-10 16:52:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('713', '63', '80', '28', '70', '73', '70', null, '2016-07-10 16:53:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('714', '15', '80', '29', '70', '74', '70', null, '2016-07-10 16:54:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('715', '66', '80', '59', '70', '73', '70', null, '2016-07-10 16:55:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('716', '4', '80', '63', '70', '74', '70', null, '2016-07-10 16:56:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('717', '13', '80', '63', '70', '74', '70', null, '2016-07-10 16:57:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('718', '9', '80', '63', '70', '74', '70', null, '2016-07-10 16:58:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('719', '10', '80', '63', '70', '74', '70', null, '2016-07-10 16:59:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('720', '16', '80', '64', '70', '74', '70', null, '2016-07-10 17:00:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('721', '92', '80', '30', '70', '73', '70', null, '2016-07-10 17:02:01', '<font color=\"red\">CPU当前：92%,超出预设值  80%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('722', '8', '80', '32', '70', '74', '70', null, '2016-07-10 17:03:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('723', '6', '80', '33', '70', '75', '70', null, '2016-07-10 17:04:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('724', '31', '80', '31', '70', '75', '70', null, '2016-07-10 17:06:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('725', '66', '80', '32', '70', '75', '70', null, '2016-07-10 17:07:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('726', '17', '80', '32', '70', '75', '70', null, '2016-07-10 17:08:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('727', '9', '80', '32', '70', '75', '70', null, '2016-07-10 17:09:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('728', '39', '80', '32', '70', '75', '70', null, '2016-07-10 17:10:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('729', '64', '80', '28', '70', '74', '70', null, '2016-07-10 17:11:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('730', '100', '80', '30', '70', '75', '70', null, '2016-07-10 17:12:02', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('731', '10', '80', '55', '70', '75', '70', null, '2016-07-10 17:13:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('732', '9', '80', '55', '70', '75', '70', null, '2016-07-10 17:14:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('733', '9', '80', '55', '70', '74', '70', null, '2016-07-10 17:15:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('734', '7', '80', '57', '70', '74', '70', null, '2016-07-10 17:16:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('735', '34', '80', '57', '70', '74', '70', null, '2016-07-10 17:17:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('736', '6', '80', '57', '70', '74', '70', null, '2016-07-10 17:18:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('737', '9', '80', '57', '70', '75', '70', null, '2016-07-10 17:19:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('738', '10', '80', '57', '70', '74', '70', null, '2016-07-10 17:20:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('739', '13', '80', '57', '70', '75', '70', null, '2016-07-10 17:21:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('740', '9', '80', '57', '70', '75', '70', null, '2016-07-10 17:22:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('741', '26', '80', '57', '70', '75', '70', null, '2016-07-10 17:23:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('742', '34', '80', '58', '70', '75', '70', null, '2016-07-10 17:24:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('743', '15', '80', '58', '70', '75', '70', null, '2016-07-10 17:25:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('744', '12', '80', '58', '70', '75', '70', null, '2016-07-10 17:26:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('745', '19', '80', '59', '70', '75', '70', null, '2016-07-10 17:27:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('746', '19', '80', '59', '70', '77', '70', null, '2016-07-10 17:28:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('747', '100', '80', '59', '70', '77', '70', null, '2016-07-10 17:29:29', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('748', '20', '80', '59', '70', '77', '70', null, '2016-07-10 17:30:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('749', '95', '80', '59', '70', '76', '70', null, '2016-07-10 17:31:01', '<font color=\"red\">CPU当前：95%,超出预设值  80%<br>内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('750', '28', '80', '59', '70', '77', '70', null, '2016-07-10 17:32:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('751', '38', '80', '59', '70', '77', '70', null, '2016-07-10 17:33:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('752', '23', '80', '59', '70', '77', '70', null, '2016-07-10 17:34:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('753', '25', '80', '59', '70', '77', '70', null, '2016-07-10 17:35:01', '<font color=\"red\">内存当前：77%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('754', '78', '80', '59', '70', '81', '70', null, '2016-07-10 17:36:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('755', '37', '80', '59', '70', '81', '70', null, '2016-07-10 17:37:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('756', '34', '80', '60', '70', '81', '70', null, '2016-07-10 17:38:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('757', '30', '80', '60', '70', '81', '70', null, '2016-07-10 17:39:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('758', '27', '80', '60', '70', '82', '70', null, '2016-07-10 17:40:01', '<font color=\"red\">内存当前：82%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('759', '30', '80', '60', '70', '81', '70', null, '2016-07-10 17:41:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('760', '25', '80', '60', '70', '81', '70', null, '2016-07-10 17:42:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('761', '33', '80', '60', '70', '81', '70', null, '2016-07-10 17:43:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('762', '45', '80', '61', '70', '81', '70', null, '2016-07-10 17:44:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('763', '55', '80', '61', '70', '81', '70', null, '2016-07-10 17:45:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('764', '100', '80', '62', '70', '81', '70', null, '2016-07-10 17:58:45', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('765', '61', '80', '63', '70', '81', '70', null, '2016-07-10 17:59:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('766', '26', '80', '70', '70', '81', '70', null, '2016-07-10 18:00:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('767', '24', '80', '70', '70', '81', '70', null, '2016-07-10 18:01:01', '<font color=\"red\">内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('768', '26', '80', '71', '70', '81', '70', null, '2016-07-10 18:02:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('769', '27', '80', '71', '70', '81', '70', null, '2016-07-10 18:03:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('770', '19', '80', '71', '70', '81', '70', null, '2016-07-10 18:04:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('771', '21', '80', '71', '70', '81', '70', null, '2016-07-10 18:05:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('772', '26', '80', '71', '70', '81', '70', null, '2016-07-10 18:06:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('773', '24', '80', '72', '70', '81', '70', null, '2016-07-10 18:07:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('774', '42', '80', '72', '70', '81', '70', null, '2016-07-10 18:08:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('775', '24', '80', '72', '70', '81', '70', null, '2016-07-10 18:09:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('776', '64', '80', '72', '70', '81', '70', null, '2016-07-10 18:10:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：81%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('777', '15', '80', '72', '70', '80', '70', null, '2016-07-10 18:11:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('778', '46', '80', '72', '70', '80', '70', null, '2016-07-10 18:12:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：80%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('779', '10', '80', '73', '70', '83', '70', null, '2016-07-10 18:13:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：83%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('780', '43', '80', '73', '70', '87', '70', null, '2016-07-10 18:14:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：87%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('781', '29', '80', '73', '70', '87', '70', null, '2016-07-10 18:15:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：87%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('782', '100', '80', '62', '70', '58', '70', null, '2016-07-11 09:51:01', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('783', '95', '80', '62', '70', '58', '70', null, '2016-07-11 09:53:01', '<font color=\"red\">CPU当前：95%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('784', '82', '80', '66', '70', '58', '70', null, '2016-07-11 09:58:01', '<font color=\"red\">CPU当前：82%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('785', '94', '80', '69', '70', '59', '70', null, '2016-07-11 10:00:01', '<font color=\"red\">CPU当前：94%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('786', '18', '80', '71', '70', '59', '70', null, '2016-07-11 10:01:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('787', '6', '80', '71', '70', '59', '70', null, '2016-07-11 10:02:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('788', '95', '80', '63', '70', '59', '70', null, '2016-07-11 10:04:01', '<font color=\"red\">CPU当前：95%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('789', '83', '80', '68', '70', '60', '70', null, '2016-07-11 10:14:01', '<font color=\"red\">CPU当前：83%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('790', '94', '80', '60', '70', '62', '70', null, '2016-07-11 11:17:01', '<font color=\"red\">CPU当前：94%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('791', '86', '80', '61', '70', '62', '70', null, '2016-07-11 11:21:01', '<font color=\"red\">CPU当前：86%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('792', '81', '80', '66', '70', '64', '70', null, '2016-07-11 12:42:01', '<font color=\"red\">CPU当前：81%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('793', '89', '80', '66', '70', '64', '70', null, '2016-07-11 12:45:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('794', '89', '80', '68', '70', '69', '70', null, '2016-07-11 12:51:01', '<font color=\"red\">CPU当前：89%,超出预设值  80%<br></font>');
INSERT INTO `t_server_info` VALUES ('795', '3', '80', '71', '70', '70', '70', null, '2016-07-11 13:12:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('796', '6', '80', '71', '70', '70', '70', null, '2016-07-11 13:13:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('797', '5', '80', '71', '70', '70', '70', null, '2016-07-11 13:14:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('798', '7', '80', '71', '70', '70', '70', null, '2016-07-11 13:15:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('799', '3', '80', '71', '70', '70', '70', null, '2016-07-11 13:16:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('800', '2', '80', '71', '70', '69', '70', null, '2016-07-11 13:17:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('801', '4', '80', '71', '70', '69', '70', null, '2016-07-11 13:18:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('802', '2', '80', '72', '70', '69', '70', null, '2016-07-11 13:19:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('803', '6', '80', '72', '70', '69', '70', null, '2016-07-11 13:20:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('804', '6', '80', '72', '70', '69', '70', null, '2016-07-11 13:21:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('805', '4', '80', '72', '70', '69', '70', null, '2016-07-11 13:22:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('806', '2', '80', '72', '70', '70', '70', null, '2016-07-11 13:23:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('807', '2', '80', '72', '70', '69', '70', null, '2016-07-11 13:24:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('808', '4', '80', '72', '70', '70', '70', null, '2016-07-11 13:25:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('809', '9', '80', '72', '70', '70', '70', null, '2016-07-11 13:26:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('810', '21', '80', '72', '70', '70', '70', null, '2016-07-11 13:27:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('811', '6', '80', '73', '70', '71', '70', null, '2016-07-11 13:28:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('812', '18', '80', '73', '70', '71', '70', null, '2016-07-11 13:29:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('813', '17', '80', '73', '70', '71', '70', null, '2016-07-11 13:30:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('814', '15', '80', '73', '70', '71', '70', null, '2016-07-11 13:31:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('815', '6', '80', '73', '70', '71', '70', null, '2016-07-11 13:32:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('816', '2', '80', '73', '70', '71', '70', null, '2016-07-11 13:33:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('817', '2', '80', '73', '70', '71', '70', null, '2016-07-11 13:34:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('818', '9', '80', '73', '70', '71', '70', null, '2016-07-11 13:35:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('819', '5', '80', '73', '70', '71', '70', null, '2016-07-11 13:36:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('820', '4', '80', '74', '70', '71', '70', null, '2016-07-11 13:37:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('821', '5', '80', '74', '70', '71', '70', null, '2016-07-11 13:38:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('822', '5', '80', '74', '70', '71', '70', null, '2016-07-11 13:39:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('823', '1', '80', '74', '70', '71', '70', null, '2016-07-11 13:40:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('824', '1', '80', '74', '70', '71', '70', null, '2016-07-11 13:41:01', '<font color=\"red\">JVM当前：74%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('825', '6', '80', '75', '70', '71', '70', null, '2016-07-11 13:42:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('826', '3', '80', '75', '70', '71', '70', null, '2016-07-11 13:43:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('827', '2', '80', '75', '70', '71', '70', null, '2016-07-11 13:44:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('828', '4', '80', '75', '70', '71', '70', null, '2016-07-11 13:45:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('829', '2', '80', '75', '70', '70', '70', null, '2016-07-11 13:46:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('830', '5', '80', '75', '70', '71', '70', null, '2016-07-11 13:47:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('831', '6', '80', '75', '70', '71', '70', null, '2016-07-11 13:48:01', '<font color=\"red\">JVM当前：75%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('832', '6', '80', '76', '70', '70', '70', null, '2016-07-11 13:49:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('833', '2', '80', '76', '70', '70', '70', null, '2016-07-11 13:50:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('834', '5', '80', '76', '70', '70', '70', null, '2016-07-11 13:51:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('835', '4', '80', '76', '70', '71', '70', null, '2016-07-11 13:52:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('836', '4', '80', '76', '70', '70', '70', null, '2016-07-11 13:53:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('837', '7', '80', '76', '70', '70', '70', null, '2016-07-11 13:54:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('838', '5', '80', '76', '70', '71', '70', null, '2016-07-11 13:55:01', '<font color=\"red\">JVM当前：76%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('839', '2', '80', '77', '70', '71', '70', null, '2016-07-11 13:56:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('840', '6', '80', '77', '70', '71', '70', null, '2016-07-11 13:57:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('841', '4', '80', '77', '70', '71', '70', null, '2016-07-11 13:58:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('842', '3', '80', '77', '70', '71', '70', null, '2016-07-11 13:59:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('843', '6', '80', '77', '70', '71', '70', null, '2016-07-11 14:00:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('844', '5', '80', '77', '70', '71', '70', null, '2016-07-11 14:01:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('845', '4', '80', '77', '70', '71', '70', null, '2016-07-11 14:02:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('846', '3', '80', '77', '70', '71', '70', null, '2016-07-11 14:03:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('847', '6', '80', '77', '70', '71', '70', null, '2016-07-11 14:04:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('848', '5', '80', '77', '70', '71', '70', null, '2016-07-11 14:05:01', '<font color=\"red\">JVM当前：77%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('849', '12', '80', '78', '70', '71', '70', null, '2016-07-11 14:06:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：71%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('850', '15', '80', '78', '70', '73', '70', null, '2016-07-11 14:07:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('851', '4', '80', '78', '70', '73', '70', null, '2016-07-11 14:08:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('852', '6', '80', '78', '70', '74', '70', null, '2016-07-11 14:09:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('853', '18', '80', '78', '70', '73', '70', null, '2016-07-11 14:10:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('854', '29', '80', '78', '70', '73', '70', null, '2016-07-11 14:11:01', '<font color=\"red\">JVM当前：78%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('855', '43', '80', '79', '70', '73', '70', null, '2016-07-11 14:12:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('856', '13', '80', '79', '70', '74', '70', null, '2016-07-11 14:13:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('857', '10', '80', '79', '70', '73', '70', null, '2016-07-11 14:14:01', '<font color=\"red\">JVM当前：79%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('858', '17', '80', '80', '70', '73', '70', null, '2016-07-11 14:15:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('859', '5', '80', '80', '70', '73', '70', null, '2016-07-11 14:16:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('860', '28', '80', '80', '70', '73', '70', null, '2016-07-11 14:17:01', '<font color=\"red\">JVM当前：80%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('861', '88', '80', '67', '70', '73', '70', null, '2016-07-11 14:18:01', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('862', '9', '80', '68', '70', '73', '70', null, '2016-07-11 14:19:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('863', '13', '80', '68', '70', '73', '70', null, '2016-07-11 14:20:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('864', '17', '80', '68', '70', '73', '70', null, '2016-07-11 14:21:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('865', '72', '80', '68', '70', '73', '70', null, '2016-07-11 14:22:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('866', '52', '80', '70', '70', '76', '70', null, '2016-07-11 14:23:01', '<font color=\"red\">内存当前：76%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('867', '12', '80', '70', '70', '75', '70', null, '2016-07-11 14:24:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('868', '17', '80', '70', '70', '75', '70', null, '2016-07-11 14:25:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('869', '20', '80', '70', '70', '75', '70', null, '2016-07-11 14:26:01', '<font color=\"red\">内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('870', '13', '80', '70', '70', '74', '70', null, '2016-07-11 14:27:01', '<font color=\"red\">内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('871', '3', '80', '70', '70', '73', '70', null, '2016-07-11 14:28:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('872', '7', '80', '70', '70', '73', '70', null, '2016-07-11 14:29:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('873', '7', '80', '70', '70', '73', '70', null, '2016-07-11 14:30:01', '<font color=\"red\">内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('874', '97', '80', '71', '70', '73', '70', null, '2016-07-11 14:31:01', '<font color=\"red\">CPU当前：97%,超出预设值  80%<br>JVM当前：71%,超出预设值 70%<br>内存当前：73%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('875', '13', '80', '71', '70', '74', '70', null, '2016-07-11 14:32:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('876', '95', '80', '71', '70', '74', '70', null, '2016-07-11 14:33:01', '<font color=\"red\">CPU当前：95%,超出预设值  80%<br>JVM当前：71%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('877', '42', '80', '71', '70', '74', '70', null, '2016-07-11 14:34:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('878', '3', '80', '71', '70', '74', '70', null, '2016-07-11 14:35:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('879', '86', '80', '71', '70', '74', '70', null, '2016-07-11 14:36:01', '<font color=\"red\">CPU当前：86%,超出预设值  80%<br>JVM当前：71%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('880', '8', '80', '71', '70', '74', '70', null, '2016-07-11 14:37:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('881', '10', '80', '71', '70', '75', '70', null, '2016-07-11 14:38:01', '<font color=\"red\">JVM当前：71%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('882', '20', '80', '72', '70', '75', '70', null, '2016-07-11 14:39:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('883', '50', '80', '72', '70', '74', '70', null, '2016-07-11 14:40:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：74%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('884', '13', '80', '72', '70', '75', '70', null, '2016-07-11 14:41:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('885', '19', '80', '72', '70', '75', '70', null, '2016-07-11 14:42:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('886', '4', '80', '72', '70', '75', '70', null, '2016-07-11 14:43:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br>内存当前：75%,超出预设值  70%</font>');
INSERT INTO `t_server_info` VALUES ('887', '51', '80', '72', '70', '70', '70', null, '2016-07-11 14:44:01', '<font color=\"red\">JVM当前：72%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('888', '18', '80', '73', '70', '68', '70', null, '2016-07-11 14:45:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('889', '38', '80', '73', '70', '68', '70', null, '2016-07-11 14:46:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('890', '4', '80', '73', '70', '68', '70', null, '2016-07-11 14:47:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('891', '9', '80', '73', '70', '68', '70', null, '2016-07-11 14:48:01', '<font color=\"red\">JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('892', '100', '80', '73', '70', '70', '70', null, '2016-07-11 14:49:02', '<font color=\"red\">CPU当前：100%,超出预设值  80%<br>JVM当前：73%,超出预设值 70%<br></font>');
INSERT INTO `t_server_info` VALUES ('893', '100', '90', '61', '90', '69', '90', null, '2016-07-15 10:34:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('894', '97', '90', '65', '90', '69', '90', null, '2016-07-15 11:02:01', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('895', '93', '90', '32', '90', '80', '90', null, '2016-07-15 12:53:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('896', '100', '90', '39', '90', '87', '90', null, '2016-07-15 15:29:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('897', '99', '90', '40', '90', '83', '90', null, '2016-07-15 15:53:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('898', '96', '90', '42', '90', '84', '90', null, '2016-07-15 16:35:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('899', '93', '90', '63', '90', '83', '90', null, '2016-07-15 17:01:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('900', '91', '90', '66', '90', '89', '90', null, '2016-07-15 17:16:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('901', '99', '90', '66', '90', '89', '90', null, '2016-07-15 17:18:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('902', '93', '90', '66', '90', '89', '90', null, '2016-07-15 17:27:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('903', '99', '90', '66', '90', '90', '90', null, '2016-07-15 17:38:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('904', '24', '90', '67', '90', '91', '90', null, '2016-07-15 17:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('905', '17', '90', '67', '90', '91', '90', null, '2016-07-15 17:44:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('906', '98', '90', '67', '90', '90', '90', null, '2016-07-15 17:50:02', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('907', '67', '90', '67', '90', '91', '90', null, '2016-07-15 17:53:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('908', '65', '90', '67', '90', '91', '90', null, '2016-07-15 17:54:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('909', '17', '90', '68', '90', '91', '90', null, '2016-07-15 17:55:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('910', '16', '90', '68', '90', '91', '90', null, '2016-07-15 17:56:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('911', '16', '90', '68', '90', '91', '90', null, '2016-07-15 17:57:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('912', '7', '90', '68', '90', '91', '90', null, '2016-07-15 17:58:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('913', '99', '90', '68', '90', '90', '90', null, '2016-07-15 18:10:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('914', '13', '90', '69', '90', '91', '90', null, '2016-07-15 18:18:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('915', '19', '90', '69', '90', '91', '90', null, '2016-07-15 18:20:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('916', '34', '90', '69', '90', '91', '90', null, '2016-07-15 18:21:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('917', '6', '90', '69', '90', '91', '90', null, '2016-07-15 18:23:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('918', '3', '90', '69', '90', '91', '90', null, '2016-07-15 18:24:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('919', '96', '90', '69', '90', '90', '90', null, '2016-07-15 18:26:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('920', '20', '90', '69', '90', '91', '90', null, '2016-07-15 18:28:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('921', '13', '90', '69', '90', '91', '90', null, '2016-07-15 18:29:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('922', '5', '90', '70', '90', '91', '90', null, '2016-07-15 18:30:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('923', '59', '90', '70', '90', '93', '90', null, '2016-07-15 18:31:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('924', '9', '90', '70', '90', '92', '90', null, '2016-07-15 18:32:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('925', '8', '90', '70', '90', '92', '90', null, '2016-07-15 18:33:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('926', '8', '90', '70', '90', '92', '90', null, '2016-07-15 18:34:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('927', '4', '90', '71', '90', '92', '90', null, '2016-07-15 18:35:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('928', '10', '90', '71', '90', '92', '90', null, '2016-07-15 18:36:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('929', '6', '90', '71', '90', '92', '90', null, '2016-07-15 18:37:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('930', '6', '90', '71', '90', '92', '90', null, '2016-07-15 18:38:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('931', '99', '90', '46', '90', '70', '90', null, '2016-07-16 11:45:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('932', '98', '90', '47', '90', '72', '90', null, '2016-07-16 11:59:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('933', '94', '90', '47', '90', '68', '90', null, '2016-07-16 12:03:01', '<font color=\"red\">CPU当前：94%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('934', '100', '90', '51', '90', '79', '90', null, '2016-07-16 13:20:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('935', '100', '90', '53', '90', '91', '90', null, '2016-07-16 14:00:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('936', '52', '90', '53', '90', '92', '90', null, '2016-07-16 14:01:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('937', '100', '90', '53', '90', '91', '90', null, '2016-07-16 14:02:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('938', '98', '90', '53', '90', '92', '90', null, '2016-07-16 14:03:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('939', '100', '90', '53', '90', '92', '90', null, '2016-07-16 14:04:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('940', '96', '90', '53', '90', '92', '90', null, '2016-07-16 14:05:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('941', '100', '90', '53', '90', '93', '90', null, '2016-07-16 14:06:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('942', '77', '90', '54', '90', '93', '90', null, '2016-07-16 14:07:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('943', '92', '90', '54', '90', '87', '90', null, '2016-07-16 14:08:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('944', '100', '90', '54', '90', '93', '90', null, '2016-07-16 14:09:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('945', '100', '90', '54', '90', '93', '90', null, '2016-07-16 14:10:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('946', '48', '90', '54', '90', '94', '90', null, '2016-07-16 14:11:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('947', '100', '90', '55', '90', '92', '90', null, '2016-07-16 14:16:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('948', '100', '90', '55', '90', '87', '90', null, '2016-07-16 14:17:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('949', '93', '90', '55', '90', '88', '90', null, '2016-07-16 14:18:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('950', '100', '90', '55', '90', '88', '90', null, '2016-07-16 14:21:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('951', '100', '90', '55', '90', '88', '90', null, '2016-07-16 14:25:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('952', '91', '90', '55', '90', '90', '90', null, '2016-07-16 14:29:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('953', '61', '90', '56', '90', '91', '90', null, '2016-07-16 14:32:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('954', '95', '90', '56', '90', '91', '90', null, '2016-07-16 14:33:01', '<font color=\"red\">CPU当前：95%,超出预设值  90%<br>内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('955', '66', '90', '56', '90', '92', '90', null, '2016-07-16 14:34:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('956', '100', '90', '56', '90', '86', '90', null, '2016-07-16 14:36:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('957', '100', '90', '56', '90', '92', '90', null, '2016-07-16 14:37:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('958', '99', '90', '56', '90', '92', '90', null, '2016-07-16 14:38:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('959', '70', '90', '56', '90', '92', '90', null, '2016-07-16 14:39:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('960', '59', '90', '56', '90', '92', '90', null, '2016-07-16 14:40:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('961', '49', '90', '57', '90', '93', '90', null, '2016-07-16 14:41:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('962', '68', '90', '57', '90', '93', '90', null, '2016-07-16 14:42:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('963', '42', '90', '57', '90', '93', '90', null, '2016-07-16 14:43:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('964', '42', '90', '57', '90', '93', '90', null, '2016-07-16 14:44:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('965', '35', '90', '57', '90', '93', '90', null, '2016-07-16 14:45:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('966', '29', '90', '57', '90', '94', '90', null, '2016-07-16 14:46:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('967', '30', '90', '58', '90', '94', '90', null, '2016-07-16 14:47:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('968', '33', '90', '58', '90', '94', '90', null, '2016-07-16 14:48:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('969', '29', '90', '58', '90', '95', '90', null, '2016-07-16 14:49:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('970', '18', '90', '58', '90', '95', '90', null, '2016-07-16 14:50:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('971', '29', '90', '58', '90', '93', '90', null, '2016-07-16 14:51:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('972', '30', '90', '58', '90', '94', '90', null, '2016-07-16 14:52:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('973', '20', '90', '58', '90', '94', '90', null, '2016-07-16 14:53:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('974', '27', '90', '59', '90', '94', '90', null, '2016-07-16 14:54:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('975', '35', '90', '59', '90', '94', '90', null, '2016-07-16 14:55:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('976', '30', '90', '59', '90', '95', '90', null, '2016-07-16 14:56:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('977', '90', '90', '59', '90', '95', '90', null, '2016-07-16 14:57:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('978', '23', '90', '59', '90', '95', '90', null, '2016-07-16 14:58:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('979', '99', '90', '60', '90', '85', '90', null, '2016-07-16 15:19:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('980', '100', '90', '56', '90', '60', '90', null, '2016-07-18 08:42:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('981', '94', '90', '59', '90', '65', '90', null, '2016-07-18 08:54:01', '<font color=\"red\">CPU当前：94%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('982', '93', '90', '59', '90', '64', '90', null, '2016-07-18 08:58:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('983', '98', '90', '59', '90', '71', '90', null, '2016-07-18 09:09:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('984', '100', '90', '64', '90', '74', '90', null, '2016-07-18 09:49:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('985', '99', '90', '65', '90', '69', '90', null, '2016-07-18 10:14:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('986', '99', '90', '66', '90', '71', '90', null, '2016-07-18 10:26:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('987', '95', '90', '66', '90', '71', '90', null, '2016-07-18 10:30:01', '<font color=\"red\">CPU当前：95%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('988', '92', '90', '66', '90', '74', '90', null, '2016-07-18 10:39:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('989', '91', '90', '70', '90', '77', '90', null, '2016-07-18 11:03:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('990', '96', '90', '72', '90', '80', '90', null, '2016-07-18 11:21:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('991', '99', '90', '72', '90', '81', '90', null, '2016-07-18 11:23:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('992', '96', '90', '20', '90', '82', '90', null, '2016-07-18 11:45:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('993', '99', '90', '20', '90', '84', '90', null, '2016-07-18 11:54:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('994', '97', '90', '25', '90', '84', '90', null, '2016-07-18 13:51:01', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('995', '92', '90', '25', '90', '84', '90', null, '2016-07-18 13:52:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('996', '93', '90', '25', '90', '87', '90', null, '2016-07-18 13:58:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('997', '98', '90', '26', '90', '87', '90', null, '2016-07-18 14:04:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('998', '93', '90', '33', '90', '88', '90', null, '2016-07-18 15:07:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('999', '6', '90', '36', '90', '92', '90', null, '2016-07-18 15:28:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1000', '3', '90', '36', '90', '92', '90', null, '2016-07-18 15:29:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1001', '6', '90', '36', '90', '92', '90', null, '2016-07-18 15:30:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1002', '6', '90', '36', '90', '92', '90', null, '2016-07-18 15:31:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1003', '2', '90', '36', '90', '91', '90', null, '2016-07-18 15:32:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1004', '5', '90', '36', '90', '91', '90', null, '2016-07-18 15:33:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1005', '3', '90', '37', '90', '92', '90', null, '2016-07-18 15:34:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1006', '7', '90', '37', '90', '92', '90', null, '2016-07-18 15:35:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1007', '6', '90', '37', '90', '92', '90', null, '2016-07-18 15:36:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1008', '5', '90', '37', '90', '92', '90', null, '2016-07-18 15:37:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1009', '6', '90', '37', '90', '91', '90', null, '2016-07-18 15:38:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1010', '31', '90', '37', '90', '91', '90', null, '2016-07-18 15:39:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1011', '10', '90', '37', '90', '91', '90', null, '2016-07-18 15:40:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1012', '31', '90', '38', '90', '92', '90', null, '2016-07-18 15:41:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1013', '13', '90', '38', '90', '91', '90', null, '2016-07-18 15:42:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1014', '12', '90', '38', '90', '91', '90', null, '2016-07-18 15:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1015', '10', '90', '38', '90', '91', '90', null, '2016-07-18 15:44:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1016', '10', '90', '38', '90', '92', '90', null, '2016-07-18 15:45:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1017', '11', '90', '38', '90', '92', '90', null, '2016-07-18 15:46:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1018', '2', '90', '38', '90', '92', '90', null, '2016-07-18 15:47:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1019', '9', '90', '38', '90', '92', '90', null, '2016-07-18 15:48:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1020', '16', '90', '39', '90', '92', '90', null, '2016-07-18 15:49:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1021', '13', '90', '39', '90', '92', '90', null, '2016-07-18 15:50:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1022', '7', '90', '39', '90', '91', '90', null, '2016-07-18 15:51:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1023', '5', '90', '39', '90', '91', '90', null, '2016-07-18 15:52:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1024', '8', '90', '39', '90', '92', '90', null, '2016-07-18 15:53:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1025', '33', '90', '39', '90', '92', '90', null, '2016-07-18 15:54:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1026', '13', '90', '39', '90', '92', '90', null, '2016-07-18 15:55:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1027', '9', '90', '39', '90', '92', '90', null, '2016-07-18 15:56:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1028', '20', '90', '39', '90', '92', '90', null, '2016-07-18 15:57:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1029', '50', '90', '40', '90', '92', '90', null, '2016-07-18 15:58:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1030', '17', '90', '40', '90', '92', '90', null, '2016-07-18 15:59:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1031', '24', '90', '40', '90', '92', '90', null, '2016-07-18 16:00:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1032', '2', '90', '40', '90', '92', '90', null, '2016-07-18 16:01:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1033', '15', '90', '40', '90', '92', '90', null, '2016-07-18 16:02:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1034', '2', '90', '40', '90', '92', '90', null, '2016-07-18 16:03:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1035', '41', '90', '40', '90', '92', '90', null, '2016-07-18 16:04:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1036', '26', '90', '40', '90', '92', '90', null, '2016-07-18 16:05:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1037', '29', '90', '40', '90', '92', '90', null, '2016-07-18 16:06:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1038', '76', '90', '41', '90', '92', '90', null, '2016-07-18 16:07:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1039', '31', '90', '41', '90', '92', '90', null, '2016-07-18 16:08:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1040', '27', '90', '41', '90', '92', '90', null, '2016-07-18 16:09:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1041', '87', '90', '41', '90', '91', '90', null, '2016-07-18 16:10:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1042', '8', '90', '41', '90', '92', '90', null, '2016-07-18 16:11:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1043', '47', '90', '41', '90', '92', '90', null, '2016-07-18 16:12:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1044', '17', '90', '43', '90', '92', '90', null, '2016-07-18 16:13:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1045', '19', '90', '44', '90', '93', '90', null, '2016-07-18 16:14:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1046', '9', '90', '44', '90', '93', '90', null, '2016-07-18 16:15:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1047', '21', '90', '44', '90', '93', '90', null, '2016-07-18 16:16:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1048', '9', '90', '44', '90', '93', '90', null, '2016-07-18 16:17:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1049', '71', '90', '44', '90', '93', '90', null, '2016-07-18 16:18:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1050', '22', '90', '44', '90', '93', '90', null, '2016-07-18 16:19:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1051', '92', '90', '44', '90', '93', '90', null, '2016-07-18 16:20:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br>内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1052', '98', '90', '44', '90', '92', '90', null, '2016-07-18 16:21:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1053', '19', '90', '45', '90', '93', '90', null, '2016-07-18 16:22:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1054', '63', '90', '45', '90', '93', '90', null, '2016-07-18 16:23:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1055', '31', '90', '45', '90', '94', '90', null, '2016-07-18 16:24:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1056', '39', '90', '45', '90', '93', '90', null, '2016-07-18 16:25:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1057', '23', '90', '45', '90', '94', '90', null, '2016-07-18 16:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1058', '17', '90', '45', '90', '94', '90', null, '2016-07-18 16:27:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1059', '22', '90', '45', '90', '94', '90', null, '2016-07-18 16:28:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1060', '25', '90', '45', '90', '93', '90', null, '2016-07-18 16:29:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1061', '48', '90', '46', '90', '93', '90', null, '2016-07-18 16:30:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1062', '18', '90', '46', '90', '93', '90', null, '2016-07-18 16:31:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1063', '17', '90', '46', '90', '93', '90', null, '2016-07-18 16:32:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1064', '70', '90', '46', '90', '93', '90', null, '2016-07-18 16:33:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1065', '8', '90', '46', '90', '93', '90', null, '2016-07-18 16:34:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1066', '37', '90', '46', '90', '93', '90', null, '2016-07-18 16:35:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1067', '13', '90', '46', '90', '94', '90', null, '2016-07-18 16:36:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1068', '15', '90', '46', '90', '93', '90', null, '2016-07-18 16:37:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1069', '13', '90', '46', '90', '94', '90', null, '2016-07-18 16:38:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1070', '93', '90', '47', '90', '94', '90', null, '2016-07-18 16:39:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br>内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1071', '15', '90', '47', '90', '93', '90', null, '2016-07-18 16:40:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1072', '8', '90', '47', '90', '94', '90', null, '2016-07-18 16:41:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1073', '27', '90', '47', '90', '94', '90', null, '2016-07-18 16:42:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1074', '13', '90', '47', '90', '94', '90', null, '2016-07-18 16:43:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1075', '52', '90', '47', '90', '94', '90', null, '2016-07-18 16:44:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1076', '29', '90', '47', '90', '95', '90', null, '2016-07-18 16:45:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1077', '51', '90', '48', '90', '95', '90', null, '2016-07-18 16:46:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1078', '13', '90', '48', '90', '95', '90', null, '2016-07-18 16:47:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1079', '53', '90', '48', '90', '95', '90', null, '2016-07-18 16:48:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1080', '98', '90', '48', '90', '95', '90', null, '2016-07-18 16:49:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1081', '16', '90', '50', '90', '95', '90', null, '2016-07-18 16:50:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1082', '26', '90', '51', '90', '95', '90', null, '2016-07-18 16:51:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1083', '17', '90', '51', '90', '95', '90', null, '2016-07-18 16:52:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1084', '24', '90', '51', '90', '95', '90', null, '2016-07-18 16:53:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1085', '60', '90', '51', '90', '95', '90', null, '2016-07-18 16:54:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1086', '13', '90', '51', '90', '94', '90', null, '2016-07-18 16:55:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1087', '33', '90', '53', '90', '95', '90', null, '2016-07-18 16:56:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1088', '9', '90', '54', '90', '95', '90', null, '2016-07-18 16:57:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1089', '22', '90', '54', '90', '96', '90', null, '2016-07-18 16:58:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1090', '28', '90', '54', '90', '96', '90', null, '2016-07-18 16:59:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1091', '13', '90', '54', '90', '96', '90', null, '2016-07-18 17:00:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1092', '18', '90', '54', '90', '96', '90', null, '2016-07-18 17:01:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1093', '31', '90', '54', '90', '96', '90', null, '2016-07-18 17:02:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1094', '14', '90', '54', '90', '96', '90', null, '2016-07-18 17:03:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1095', '16', '90', '54', '90', '97', '90', null, '2016-07-18 17:04:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1096', '88', '90', '55', '90', '96', '90', null, '2016-07-18 17:05:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1097', '28', '90', '55', '90', '97', '90', null, '2016-07-18 17:06:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1098', '15', '90', '55', '90', '96', '90', null, '2016-07-18 17:07:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1099', '8', '90', '55', '90', '97', '90', null, '2016-07-18 17:08:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1100', '20', '90', '55', '90', '97', '90', null, '2016-07-18 17:09:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1101', '44', '90', '55', '90', '97', '90', null, '2016-07-18 17:10:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1102', '19', '90', '55', '90', '97', '90', null, '2016-07-18 17:11:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1103', '14', '90', '55', '90', '97', '90', null, '2016-07-18 17:12:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1104', '22', '90', '55', '90', '97', '90', null, '2016-07-18 17:13:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1105', '33', '90', '56', '90', '97', '90', null, '2016-07-18 17:14:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1106', '59', '90', '56', '90', '97', '90', null, '2016-07-18 17:15:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1107', '6', '90', '56', '90', '97', '90', null, '2016-07-18 17:16:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1108', '44', '90', '56', '90', '97', '90', null, '2016-07-18 17:17:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1109', '93', '90', '56', '90', '97', '90', null, '2016-07-18 17:18:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1110', '11', '90', '56', '90', '97', '90', null, '2016-07-18 17:19:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1111', '10', '90', '57', '90', '97', '90', null, '2016-07-18 17:20:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1112', '7', '90', '57', '90', '97', '90', null, '2016-07-18 17:21:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1113', '21', '90', '57', '90', '97', '90', null, '2016-07-18 17:22:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1114', '28', '90', '57', '90', '97', '90', null, '2016-07-18 17:23:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1115', '6', '90', '57', '90', '97', '90', null, '2016-07-18 17:24:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1116', '45', '90', '57', '90', '97', '90', null, '2016-07-18 17:25:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1117', '32', '90', '57', '90', '98', '90', null, '2016-07-18 17:26:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1118', '13', '90', '57', '90', '98', '90', null, '2016-07-18 17:27:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1119', '25', '90', '57', '90', '99', '90', null, '2016-07-18 17:28:01', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1120', '6', '90', '58', '90', '98', '90', null, '2016-07-18 17:29:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1121', '39', '90', '58', '90', '99', '90', null, '2016-07-18 17:30:01', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1122', '30', '90', '58', '90', '95', '90', null, '2016-07-18 17:31:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1123', '66', '90', '58', '90', '95', '90', null, '2016-07-18 17:32:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1124', '32', '90', '58', '90', '96', '90', null, '2016-07-18 17:33:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1125', '30', '90', '59', '90', '97', '90', null, '2016-07-18 17:34:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1126', '20', '90', '60', '90', '93', '90', null, '2016-07-18 17:35:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1127', '39', '90', '60', '90', '94', '90', null, '2016-07-18 17:36:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1128', '21', '90', '60', '90', '96', '90', null, '2016-07-18 17:37:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1129', '21', '90', '60', '90', '96', '90', null, '2016-07-18 17:38:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1130', '15', '90', '60', '90', '96', '90', null, '2016-07-18 17:39:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1131', '18', '90', '60', '90', '96', '90', null, '2016-07-18 17:40:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1132', '20', '90', '60', '90', '97', '90', null, '2016-07-18 17:41:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1133', '88', '90', '60', '90', '97', '90', null, '2016-07-18 17:42:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1134', '20', '90', '60', '90', '96', '90', null, '2016-07-18 17:43:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1135', '40', '90', '61', '90', '97', '90', null, '2016-07-18 17:44:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1136', '79', '90', '61', '90', '96', '90', null, '2016-07-18 17:45:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1137', '89', '90', '61', '90', '95', '90', null, '2016-07-18 17:46:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1138', '91', '90', '61', '90', '96', '90', null, '2016-07-18 17:47:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1139', '35', '90', '61', '90', '96', '90', null, '2016-07-18 17:48:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1140', '54', '90', '61', '90', '96', '90', null, '2016-07-18 17:49:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1141', '92', '90', '62', '90', '88', '90', null, '2016-07-18 17:54:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1142', '89', '90', '62', '90', '91', '90', null, '2016-07-18 17:56:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1143', '99', '90', '63', '90', '95', '90', null, '2016-07-18 17:57:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1144', '35', '90', '63', '90', '95', '90', null, '2016-07-18 17:58:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1145', '14', '90', '63', '90', '95', '90', null, '2016-07-18 17:59:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1146', '78', '90', '63', '90', '96', '90', null, '2016-07-18 18:00:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1147', '52', '90', '63', '90', '96', '90', null, '2016-07-18 18:01:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1148', '23', '90', '63', '90', '95', '90', null, '2016-07-18 18:02:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1149', '17', '90', '63', '90', '95', '90', null, '2016-07-18 18:03:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1150', '21', '90', '63', '90', '95', '90', null, '2016-07-18 18:04:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1151', '13', '90', '64', '90', '95', '90', null, '2016-07-18 18:05:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1152', '5', '90', '64', '90', '95', '90', null, '2016-07-18 18:06:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1153', '22', '90', '64', '90', '95', '90', null, '2016-07-18 18:07:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1154', '13', '90', '64', '90', '92', '90', null, '2016-07-18 18:11:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1155', '25', '90', '65', '90', '92', '90', null, '2016-07-18 18:47:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1156', '92', '90', '38', '90', '77', '90', null, '2016-07-19 09:40:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1157', '95', '90', '39', '90', '77', '90', null, '2016-07-19 09:51:01', '<font color=\"red\">CPU当前：95%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1158', '93', '90', '41', '90', '79', '90', null, '2016-07-19 10:02:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1159', '95', '90', '56', '90', '86', '90', null, '2016-07-19 11:22:01', '<font color=\"red\">CPU当前：95%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1160', '99', '90', '58', '90', '88', '90', null, '2016-07-19 11:52:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1161', '6', '90', '59', '90', '91', '90', null, '2016-07-19 12:10:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1162', '15', '90', '59', '90', '94', '90', null, '2016-07-19 12:14:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1163', '4', '90', '59', '90', '94', '90', null, '2016-07-19 12:15:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1164', '6', '90', '60', '90', '94', '90', null, '2016-07-19 12:16:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1165', '12', '90', '60', '90', '93', '90', null, '2016-07-19 12:17:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1166', '10', '90', '60', '90', '94', '90', null, '2016-07-19 12:18:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1167', '7', '90', '60', '90', '94', '90', null, '2016-07-19 12:19:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1168', '4', '90', '60', '90', '94', '90', null, '2016-07-19 12:20:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1169', '10', '90', '60', '90', '94', '90', null, '2016-07-19 12:21:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1170', '20', '90', '60', '90', '94', '90', null, '2016-07-19 12:22:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1171', '6', '90', '60', '90', '94', '90', null, '2016-07-19 12:23:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1172', '6', '90', '61', '90', '94', '90', null, '2016-07-19 12:24:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1173', '8', '90', '61', '90', '96', '90', null, '2016-07-19 12:25:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1174', '6', '90', '61', '90', '94', '90', null, '2016-07-19 12:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1175', '13', '90', '61', '90', '94', '90', null, '2016-07-19 12:27:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1176', '11', '90', '61', '90', '95', '90', null, '2016-07-19 12:28:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1177', '17', '90', '62', '90', '95', '90', null, '2016-07-19 12:29:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1178', '6', '90', '62', '90', '95', '90', null, '2016-07-19 12:30:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1179', '10', '90', '62', '90', '99', '90', null, '2016-07-19 12:31:01', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1180', '13', '90', '62', '90', '95', '90', null, '2016-07-19 12:32:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1181', '11', '90', '62', '90', '95', '90', null, '2016-07-19 12:33:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1182', '13', '90', '62', '90', '95', '90', null, '2016-07-19 12:34:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1183', '22', '90', '62', '90', '95', '90', null, '2016-07-19 12:35:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1184', '10', '90', '62', '90', '95', '90', null, '2016-07-19 12:36:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1185', '11', '90', '63', '90', '95', '90', null, '2016-07-19 12:37:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1186', '5', '90', '63', '90', '97', '90', null, '2016-07-19 12:38:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1187', '18', '90', '63', '90', '97', '90', null, '2016-07-19 12:39:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1188', '14', '90', '63', '90', '96', '90', null, '2016-07-19 12:40:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1189', '6', '90', '63', '90', '97', '90', null, '2016-07-19 12:41:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1190', '20', '90', '63', '90', '97', '90', null, '2016-07-19 12:42:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1191', '6', '90', '63', '90', '97', '90', null, '2016-07-19 12:43:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1192', '38', '90', '63', '90', '96', '90', null, '2016-07-19 12:44:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1193', '11', '90', '63', '90', '96', '90', null, '2016-07-19 12:45:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1194', '4', '90', '64', '90', '96', '90', null, '2016-07-19 12:46:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1195', '14', '90', '64', '90', '96', '90', null, '2016-07-19 12:47:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1196', '5', '90', '64', '90', '96', '90', null, '2016-07-19 12:48:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1197', '40', '90', '64', '90', '98', '90', null, '2016-07-19 12:49:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1198', '40', '90', '65', '90', '99', '90', null, '2016-07-19 12:50:01', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1199', '48', '90', '65', '90', '98', '90', null, '2016-07-19 12:51:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1200', '91', '90', '65', '90', '99', '90', null, '2016-07-19 12:52:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br>内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1201', '68', '90', '65', '90', '98', '90', null, '2016-07-19 12:53:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1202', '11', '90', '66', '90', '97', '90', null, '2016-07-19 12:54:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1203', '31', '90', '66', '90', '97', '90', null, '2016-07-19 12:55:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1204', '18', '90', '66', '90', '97', '90', null, '2016-07-19 12:56:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1205', '28', '90', '66', '90', '97', '90', null, '2016-07-19 12:57:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1206', '30', '90', '66', '90', '97', '90', null, '2016-07-19 12:58:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1207', '23', '90', '67', '90', '97', '90', null, '2016-07-19 12:59:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1208', '17', '90', '67', '90', '97', '90', null, '2016-07-19 13:00:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1209', '20', '90', '67', '90', '97', '90', null, '2016-07-19 13:01:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1210', '88', '90', '67', '90', '96', '90', null, '2016-07-19 13:02:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1211', '69', '90', '67', '90', '98', '90', null, '2016-07-19 13:03:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1212', '14', '90', '68', '90', '97', '90', null, '2016-07-19 13:04:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1213', '7', '90', '68', '90', '98', '90', null, '2016-07-19 13:05:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1214', '16', '90', '68', '90', '97', '90', null, '2016-07-19 13:06:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1215', '6', '90', '68', '90', '97', '90', null, '2016-07-19 13:07:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1216', '5', '90', '68', '90', '97', '90', null, '2016-07-19 13:08:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1217', '4', '90', '68', '90', '97', '90', null, '2016-07-19 13:09:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1218', '10', '90', '69', '90', '97', '90', null, '2016-07-19 13:10:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1219', '9', '90', '69', '90', '97', '90', null, '2016-07-19 13:11:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1220', '7', '90', '69', '90', '97', '90', null, '2016-07-19 13:12:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1221', '4', '90', '69', '90', '97', '90', null, '2016-07-19 13:13:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1222', '6', '90', '69', '90', '97', '90', null, '2016-07-19 13:14:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1223', '7', '90', '69', '90', '97', '90', null, '2016-07-19 13:15:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1224', '7', '90', '69', '90', '97', '90', null, '2016-07-19 13:16:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1225', '12', '90', '69', '90', '97', '90', null, '2016-07-19 13:17:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1226', '21', '90', '70', '90', '97', '90', null, '2016-07-19 13:18:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1227', '10', '90', '70', '90', '97', '90', null, '2016-07-19 13:19:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1228', '9', '90', '70', '90', '97', '90', null, '2016-07-19 13:20:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1229', '12', '90', '70', '90', '97', '90', null, '2016-07-19 13:21:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1230', '8', '90', '70', '90', '97', '90', null, '2016-07-19 13:22:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1231', '7', '90', '70', '90', '97', '90', null, '2016-07-19 13:23:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1232', '7', '90', '70', '90', '97', '90', null, '2016-07-19 13:24:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1233', '10', '90', '70', '90', '97', '90', null, '2016-07-19 13:25:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1234', '10', '90', '71', '90', '97', '90', null, '2016-07-19 13:26:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1235', '11', '90', '71', '90', '97', '90', null, '2016-07-19 13:27:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1236', '11', '90', '71', '90', '98', '90', null, '2016-07-19 13:28:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1237', '9', '90', '71', '90', '98', '90', null, '2016-07-19 13:29:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1238', '10', '90', '22', '90', '98', '90', null, '2016-07-19 13:30:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1239', '9', '90', '22', '90', '98', '90', null, '2016-07-19 13:31:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1240', '4', '90', '22', '90', '98', '90', null, '2016-07-19 13:32:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1241', '4', '90', '23', '90', '98', '90', null, '2016-07-19 13:33:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1242', '5', '90', '23', '90', '98', '90', null, '2016-07-19 13:34:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1243', '19', '90', '23', '90', '98', '90', null, '2016-07-19 13:35:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1244', '12', '90', '23', '90', '98', '90', null, '2016-07-19 13:36:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1245', '10', '90', '23', '90', '97', '90', null, '2016-07-19 13:37:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1246', '100', '90', '24', '90', '97', '90', null, '2016-07-19 13:38:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1247', '75', '90', '29', '90', '98', '90', null, '2016-07-19 13:39:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1248', '75', '90', '29', '90', '98', '90', null, '2016-07-19 13:40:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1249', '99', '90', '30', '90', '98', '90', null, '2016-07-19 13:41:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1250', '87', '90', '30', '90', '97', '90', null, '2016-07-19 13:42:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1251', '11', '90', '30', '90', '98', '90', null, '2016-07-19 13:43:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1252', '29', '90', '30', '90', '94', '90', null, '2016-07-19 13:44:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1253', '10', '90', '31', '90', '93', '90', null, '2016-07-19 13:45:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1254', '59', '90', '31', '90', '93', '90', null, '2016-07-19 13:46:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1255', '81', '90', '31', '90', '92', '90', null, '2016-07-19 13:47:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1256', '19', '90', '31', '90', '93', '90', null, '2016-07-19 13:48:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1257', '12', '90', '31', '90', '93', '90', null, '2016-07-19 13:49:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1258', '100', '90', '31', '90', '93', '90', null, '2016-07-19 13:50:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1259', '25', '90', '31', '90', '93', '90', null, '2016-07-19 13:51:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1260', '11', '90', '32', '90', '94', '90', null, '2016-07-19 13:52:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1261', '60', '90', '32', '90', '95', '90', null, '2016-07-19 13:53:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1262', '22', '90', '33', '90', '96', '90', null, '2016-07-19 13:54:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1263', '19', '90', '33', '90', '96', '90', null, '2016-07-19 13:55:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1264', '11', '90', '33', '90', '96', '90', null, '2016-07-19 13:56:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1265', '38', '90', '33', '90', '97', '90', null, '2016-07-19 13:57:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1266', '18', '90', '33', '90', '97', '90', null, '2016-07-19 13:58:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1267', '13', '90', '34', '90', '97', '90', null, '2016-07-19 13:59:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1268', '12', '90', '34', '90', '97', '90', null, '2016-07-19 14:00:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1269', '16', '90', '34', '90', '97', '90', null, '2016-07-19 14:01:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1270', '7', '90', '34', '90', '97', '90', null, '2016-07-19 14:02:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1271', '12', '90', '34', '90', '97', '90', null, '2016-07-19 14:03:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1272', '12', '90', '34', '90', '97', '90', null, '2016-07-19 14:04:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1273', '10', '90', '34', '90', '97', '90', null, '2016-07-19 14:05:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1274', '10', '90', '34', '90', '97', '90', null, '2016-07-19 14:06:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1275', '10', '90', '35', '90', '97', '90', null, '2016-07-19 14:07:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1276', '10', '90', '35', '90', '97', '90', null, '2016-07-19 14:08:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1277', '15', '90', '35', '90', '97', '90', null, '2016-07-19 14:09:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1278', '13', '90', '35', '90', '97', '90', null, '2016-07-19 14:10:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1279', '22', '90', '35', '90', '97', '90', null, '2016-07-19 14:11:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1280', '5', '90', '35', '90', '97', '90', null, '2016-07-19 14:12:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1281', '10', '90', '35', '90', '97', '90', null, '2016-07-19 14:13:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1282', '8', '90', '35', '90', '98', '90', null, '2016-07-19 14:14:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1283', '5', '90', '36', '90', '97', '90', null, '2016-07-19 14:15:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1284', '8', '90', '36', '90', '97', '90', null, '2016-07-19 14:16:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1285', '8', '90', '36', '90', '97', '90', null, '2016-07-19 14:17:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1286', '10', '90', '36', '90', '97', '90', null, '2016-07-19 14:18:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1287', '8', '90', '36', '90', '97', '90', null, '2016-07-19 14:19:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1288', '8', '90', '36', '90', '97', '90', null, '2016-07-19 14:20:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1289', '11', '90', '36', '90', '97', '90', null, '2016-07-19 14:21:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1290', '5', '90', '36', '90', '97', '90', null, '2016-07-19 14:22:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1291', '22', '90', '36', '90', '98', '90', null, '2016-07-19 14:23:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1292', '5', '90', '36', '90', '98', '90', null, '2016-07-19 14:24:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1293', '7', '90', '37', '90', '98', '90', null, '2016-07-19 14:25:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1294', '5', '90', '37', '90', '98', '90', null, '2016-07-19 14:26:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1295', '6', '90', '37', '90', '98', '90', null, '2016-07-19 14:27:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1296', '10', '90', '37', '90', '98', '90', null, '2016-07-19 14:28:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1297', '5', '90', '37', '90', '98', '90', null, '2016-07-19 14:29:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1298', '9', '90', '38', '90', '98', '90', null, '2016-07-19 14:30:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1299', '7', '90', '38', '90', '98', '90', null, '2016-07-19 14:31:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1300', '7', '90', '38', '90', '98', '90', null, '2016-07-19 14:32:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1301', '5', '90', '38', '90', '98', '90', null, '2016-07-19 14:33:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1302', '6', '90', '38', '90', '98', '90', null, '2016-07-19 14:34:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1303', '42', '90', '38', '90', '98', '90', null, '2016-07-19 14:35:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1304', '6', '90', '38', '90', '98', '90', null, '2016-07-19 14:36:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1305', '25', '90', '38', '90', '99', '90', null, '2016-07-19 14:37:01', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1306', '71', '90', '38', '90', '93', '90', null, '2016-07-19 14:38:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1307', '35', '90', '38', '90', '94', '90', null, '2016-07-19 14:39:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1308', '25', '90', '38', '90', '92', '90', null, '2016-07-19 14:40:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1309', '32', '90', '39', '90', '95', '90', null, '2016-07-19 14:41:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1310', '12', '90', '39', '90', '94', '90', null, '2016-07-19 14:42:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1311', '75', '90', '39', '90', '94', '90', null, '2016-07-19 14:43:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1312', '71', '90', '39', '90', '95', '90', null, '2016-07-19 14:44:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1313', '82', '90', '40', '90', '94', '90', null, '2016-07-19 14:45:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1314', '66', '90', '41', '90', '94', '90', null, '2016-07-19 14:46:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1315', '18', '90', '41', '90', '93', '90', null, '2016-07-19 14:47:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1316', '14', '90', '41', '90', '93', '90', null, '2016-07-19 14:48:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1317', '16', '90', '41', '90', '95', '90', null, '2016-07-19 14:49:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1318', '37', '90', '41', '90', '94', '90', null, '2016-07-19 14:50:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1319', '75', '90', '41', '90', '95', '90', null, '2016-07-19 14:51:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1320', '20', '90', '41', '90', '94', '90', null, '2016-07-19 14:52:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1321', '15', '90', '41', '90', '95', '90', null, '2016-07-19 14:53:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1322', '62', '90', '41', '90', '94', '90', null, '2016-07-19 14:54:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1323', '33', '90', '42', '90', '94', '90', null, '2016-07-19 14:55:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1324', '18', '90', '42', '90', '94', '90', null, '2016-07-19 14:56:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1325', '26', '90', '42', '90', '95', '90', null, '2016-07-19 14:57:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1326', '18', '90', '42', '90', '95', '90', null, '2016-07-19 14:58:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1327', '13', '90', '42', '90', '94', '90', null, '2016-07-19 14:59:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1328', '17', '90', '42', '90', '94', '90', null, '2016-07-19 15:00:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1329', '13', '90', '43', '90', '94', '90', null, '2016-07-19 15:01:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1330', '27', '90', '43', '90', '95', '90', null, '2016-07-19 15:02:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1331', '51', '90', '43', '90', '95', '90', null, '2016-07-19 15:03:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1332', '13', '90', '43', '90', '95', '90', null, '2016-07-19 15:04:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1333', '19', '90', '43', '90', '94', '90', null, '2016-07-19 15:05:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1334', '38', '90', '43', '90', '94', '90', null, '2016-07-19 15:06:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1335', '11', '90', '43', '90', '94', '90', null, '2016-07-19 15:07:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1336', '10', '90', '43', '90', '94', '90', null, '2016-07-19 15:08:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1337', '96', '90', '44', '90', '94', '90', null, '2016-07-19 15:09:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br>内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1338', '23', '90', '44', '90', '94', '90', null, '2016-07-19 15:10:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1339', '17', '90', '44', '90', '95', '90', null, '2016-07-19 15:11:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1340', '35', '90', '44', '90', '95', '90', null, '2016-07-19 15:12:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1341', '23', '90', '44', '90', '95', '90', null, '2016-07-19 15:13:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1342', '100', '90', '44', '90', '96', '90', null, '2016-07-19 15:14:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1343', '34', '90', '44', '90', '94', '90', null, '2016-07-19 15:15:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1344', '40', '90', '44', '90', '95', '90', null, '2016-07-19 15:16:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1345', '53', '90', '44', '90', '96', '90', null, '2016-07-19 15:17:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1346', '17', '90', '44', '90', '96', '90', null, '2016-07-19 15:18:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1347', '23', '90', '44', '90', '96', '90', null, '2016-07-19 15:19:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1348', '72', '90', '45', '90', '94', '90', null, '2016-07-19 15:20:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1349', '29', '90', '45', '90', '96', '90', null, '2016-07-19 15:21:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1350', '100', '90', '45', '90', '97', '90', null, '2016-07-19 15:22:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1351', '37', '90', '45', '90', '96', '90', null, '2016-07-19 15:23:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1352', '58', '90', '45', '90', '96', '90', null, '2016-07-19 15:24:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1353', '22', '90', '45', '90', '95', '90', null, '2016-07-19 15:25:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1354', '88', '90', '46', '90', '94', '90', null, '2016-07-19 15:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1355', '30', '90', '46', '90', '96', '90', null, '2016-07-19 15:27:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1356', '56', '90', '46', '90', '95', '90', null, '2016-07-19 15:28:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1357', '8', '90', '46', '90', '96', '90', null, '2016-07-19 15:29:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1358', '39', '90', '46', '90', '96', '90', null, '2016-07-19 15:30:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1359', '24', '90', '46', '90', '96', '90', null, '2016-07-19 15:31:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1360', '99', '90', '46', '90', '95', '90', null, '2016-07-19 15:32:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1361', '29', '90', '46', '90', '96', '90', null, '2016-07-19 15:33:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1362', '70', '90', '46', '90', '96', '90', null, '2016-07-19 15:34:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1363', '39', '90', '47', '90', '97', '90', null, '2016-07-19 15:35:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1364', '16', '90', '47', '90', '96', '90', null, '2016-07-19 15:36:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1365', '100', '90', '47', '90', '97', '90', null, '2016-07-19 15:37:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1366', '88', '90', '47', '90', '97', '90', null, '2016-07-19 15:38:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1367', '27', '90', '47', '90', '97', '90', null, '2016-07-19 15:39:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1368', '92', '90', '47', '90', '97', '90', null, '2016-07-19 15:40:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1369', '40', '90', '48', '90', '98', '90', null, '2016-07-19 15:41:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1370', '68', '90', '48', '90', '97', '90', null, '2016-07-19 15:42:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1371', '14', '90', '49', '90', '97', '90', null, '2016-07-19 15:43:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1372', '62', '90', '49', '90', '98', '90', null, '2016-07-19 15:44:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1373', '11', '90', '49', '90', '97', '90', null, '2016-07-19 15:45:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1374', '77', '90', '50', '90', '96', '90', null, '2016-07-19 15:46:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1375', '9', '90', '50', '90', '96', '90', null, '2016-07-19 15:47:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1376', '14', '90', '50', '90', '96', '90', null, '2016-07-19 15:48:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1377', '8', '90', '50', '90', '96', '90', null, '2016-07-19 15:49:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1378', '62', '90', '50', '90', '97', '90', null, '2016-07-19 15:50:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1379', '9', '90', '51', '90', '96', '90', null, '2016-07-19 15:51:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1380', '9', '90', '51', '90', '96', '90', null, '2016-07-19 15:52:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1381', '61', '90', '51', '90', '97', '90', null, '2016-07-19 15:53:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1382', '15', '90', '51', '90', '96', '90', null, '2016-07-19 15:54:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1383', '52', '90', '51', '90', '96', '90', null, '2016-07-19 15:55:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1384', '16', '90', '52', '90', '97', '90', null, '2016-07-19 15:56:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1385', '20', '90', '52', '90', '97', '90', null, '2016-07-19 15:57:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1386', '17', '90', '53', '90', '97', '90', null, '2016-07-19 15:58:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1387', '16', '90', '53', '90', '97', '90', null, '2016-07-19 15:59:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1388', '19', '90', '53', '90', '97', '90', null, '2016-07-19 16:00:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1389', '59', '90', '53', '90', '98', '90', null, '2016-07-19 16:01:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1390', '10', '90', '53', '90', '98', '90', null, '2016-07-19 16:02:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1391', '9', '90', '53', '90', '97', '90', null, '2016-07-19 16:03:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1392', '67', '90', '53', '90', '98', '90', null, '2016-07-19 16:04:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1393', '31', '90', '54', '90', '99', '90', null, '2016-07-19 16:05:01', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1394', '44', '90', '55', '90', '94', '90', null, '2016-07-19 16:06:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1395', '48', '90', '55', '90', '94', '90', null, '2016-07-19 16:07:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1396', '69', '90', '55', '90', '94', '90', null, '2016-07-19 16:08:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1397', '48', '90', '55', '90', '95', '90', null, '2016-07-19 16:09:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1398', '16', '90', '55', '90', '95', '90', null, '2016-07-19 16:10:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1399', '6', '90', '55', '90', '95', '90', null, '2016-07-19 16:11:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1400', '88', '90', '55', '90', '96', '90', null, '2016-07-19 16:12:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1401', '19', '90', '55', '90', '95', '90', null, '2016-07-19 16:13:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1402', '25', '90', '55', '90', '95', '90', null, '2016-07-19 16:14:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1403', '14', '90', '55', '90', '96', '90', null, '2016-07-19 16:15:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1404', '27', '90', '55', '90', '96', '90', null, '2016-07-19 16:16:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1405', '38', '90', '56', '90', '96', '90', null, '2016-07-19 16:17:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1406', '22', '90', '56', '90', '96', '90', null, '2016-07-19 16:18:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1407', '7', '90', '56', '90', '96', '90', null, '2016-07-19 16:19:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1408', '43', '90', '56', '90', '97', '90', null, '2016-07-19 16:20:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1409', '13', '90', '56', '90', '97', '90', null, '2016-07-19 16:21:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1410', '5', '90', '56', '90', '96', '90', null, '2016-07-19 16:22:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1411', '26', '90', '56', '90', '96', '90', null, '2016-07-19 16:23:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1412', '39', '90', '57', '90', '96', '90', null, '2016-07-19 16:24:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1413', '21', '90', '57', '90', '96', '90', null, '2016-07-19 16:25:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1414', '6', '90', '57', '90', '97', '90', null, '2016-07-19 16:26:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1415', '12', '90', '57', '90', '96', '90', null, '2016-07-19 16:27:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1416', '25', '90', '57', '90', '97', '90', null, '2016-07-19 16:28:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1417', '37', '90', '57', '90', '97', '90', null, '2016-07-19 16:29:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1418', '75', '90', '58', '90', '97', '90', null, '2016-07-19 16:30:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1419', '36', '90', '58', '90', '97', '90', null, '2016-07-19 16:31:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1420', '100', '90', '58', '90', '96', '90', null, '2016-07-19 16:32:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1421', '96', '90', '58', '90', '95', '90', null, '2016-07-19 16:33:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1422', '13', '90', '58', '90', '95', '90', null, '2016-07-19 16:34:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1423', '28', '90', '58', '90', '95', '90', null, '2016-07-19 16:35:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1424', '87', '90', '58', '90', '95', '90', null, '2016-07-19 16:36:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1425', '10', '90', '58', '90', '95', '90', null, '2016-07-19 16:37:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1426', '10', '90', '58', '90', '95', '90', null, '2016-07-19 16:38:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1427', '12', '90', '58', '90', '95', '90', null, '2016-07-19 16:39:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1428', '9', '90', '59', '90', '95', '90', null, '2016-07-19 16:40:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1429', '8', '90', '59', '90', '95', '90', null, '2016-07-19 16:41:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1430', '24', '90', '59', '90', '96', '90', null, '2016-07-19 16:42:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1431', '13', '90', '59', '90', '96', '90', null, '2016-07-19 16:43:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1432', '39', '90', '59', '90', '96', '90', null, '2016-07-19 16:44:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1433', '10', '90', '60', '90', '97', '90', null, '2016-07-19 16:45:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1434', '16', '90', '60', '90', '97', '90', null, '2016-07-19 16:46:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1435', '13', '90', '60', '90', '98', '90', null, '2016-07-19 16:47:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1436', '24', '90', '61', '90', '97', '90', null, '2016-07-19 16:48:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1437', '18', '90', '61', '90', '97', '90', null, '2016-07-19 16:49:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1438', '25', '90', '66', '90', '98', '90', null, '2016-07-19 16:50:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1439', '68', '90', '67', '90', '98', '90', null, '2016-07-19 16:51:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1440', '68', '90', '67', '90', '98', '90', null, '2016-07-19 16:52:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1441', '19', '90', '73', '90', '97', '90', null, '2016-07-19 16:53:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1442', '15', '90', '73', '90', '98', '90', null, '2016-07-19 16:54:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1443', '96', '90', '25', '90', '97', '90', null, '2016-07-19 16:55:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1444', '22', '90', '25', '90', '97', '90', null, '2016-07-19 16:56:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1445', '49', '90', '25', '90', '97', '90', null, '2016-07-19 16:57:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1446', '16', '90', '25', '90', '98', '90', null, '2016-07-19 16:58:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1447', '9', '90', '26', '90', '94', '90', null, '2016-07-19 16:59:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1448', '35', '90', '26', '90', '93', '90', null, '2016-07-19 17:00:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1449', '99', '90', '27', '90', '88', '90', null, '2016-07-19 17:09:02', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1450', '93', '90', '27', '90', '90', '90', null, '2016-07-19 17:25:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1451', '30', '90', '27', '90', '91', '90', null, '2016-07-19 17:28:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1452', '36', '90', '28', '90', '91', '90', null, '2016-07-19 17:29:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1453', '7', '90', '28', '90', '91', '90', null, '2016-07-19 17:32:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1454', '7', '90', '28', '90', '91', '90', null, '2016-07-19 17:39:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1455', '5', '90', '28', '90', '91', '90', null, '2016-07-19 17:40:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1456', '9', '90', '28', '90', '91', '90', null, '2016-07-19 17:41:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1457', '85', '90', '28', '90', '92', '90', null, '2016-07-19 17:42:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1458', '83', '90', '28', '90', '91', '90', null, '2016-07-19 17:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1459', '88', '90', '28', '90', '91', '90', null, '2016-07-19 17:44:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1460', '16', '90', '29', '90', '91', '90', null, '2016-07-19 17:45:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1461', '91', '90', '29', '90', '91', '90', null, '2016-07-19 17:46:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br>内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1462', '89', '90', '29', '90', '92', '90', null, '2016-07-19 17:47:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1463', '18', '90', '29', '90', '93', '90', null, '2016-07-19 17:48:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1464', '83', '90', '29', '90', '92', '90', null, '2016-07-19 17:49:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1465', '33', '90', '29', '90', '92', '90', null, '2016-07-19 17:50:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1466', '11', '90', '29', '90', '91', '90', null, '2016-07-19 17:51:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1467', '61', '90', '29', '90', '91', '90', null, '2016-07-19 17:52:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1468', '8', '90', '30', '90', '93', '90', null, '2016-07-19 17:53:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1469', '4', '90', '30', '90', '94', '90', null, '2016-07-19 17:54:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1470', '8', '90', '30', '90', '94', '90', null, '2016-07-19 17:55:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1471', '3', '90', '30', '90', '94', '90', null, '2016-07-19 17:56:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1472', '7', '90', '30', '90', '94', '90', null, '2016-07-19 17:57:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1473', '6', '90', '30', '90', '94', '90', null, '2016-07-19 17:58:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1474', '41', '90', '30', '90', '94', '90', null, '2016-07-19 17:59:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1475', '31', '90', '31', '90', '95', '90', null, '2016-07-19 18:00:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1476', '98', '90', '31', '90', '95', '90', null, '2016-07-19 18:01:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1477', '38', '90', '31', '90', '95', '90', null, '2016-07-19 18:02:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1478', '27', '90', '31', '90', '95', '90', null, '2016-07-19 18:03:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1479', '66', '90', '32', '90', '95', '90', null, '2016-07-19 18:04:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1480', '7', '90', '32', '90', '95', '90', null, '2016-07-19 18:05:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1481', '10', '90', '32', '90', '93', '90', null, '2016-07-19 18:06:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1482', '11', '90', '33', '90', '94', '90', null, '2016-07-19 18:07:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1483', '7', '90', '33', '90', '94', '90', null, '2016-07-19 18:08:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1484', '26', '90', '33', '90', '95', '90', null, '2016-07-19 18:09:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1485', '16', '90', '33', '90', '96', '90', null, '2016-07-19 18:10:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1486', '99', '90', '33', '90', '97', '90', null, '2016-07-19 18:11:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1487', '9', '90', '33', '90', '96', '90', null, '2016-07-19 18:12:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1488', '96', '90', '33', '90', '96', '90', null, '2016-07-19 18:13:02', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1489', '38', '90', '33', '90', '97', '90', null, '2016-07-19 18:14:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1490', '32', '90', '33', '90', '97', '90', null, '2016-07-19 18:15:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1491', '25', '90', '34', '90', '96', '90', null, '2016-07-19 18:16:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1492', '19', '90', '34', '90', '94', '90', null, '2016-07-19 18:17:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1493', '45', '90', '34', '90', '94', '90', null, '2016-07-19 18:18:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1494', '22', '90', '35', '90', '94', '90', null, '2016-07-19 18:19:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1495', '39', '90', '35', '90', '94', '90', null, '2016-07-19 18:20:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1496', '47', '90', '36', '90', '95', '90', null, '2016-07-19 18:21:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1497', '23', '90', '36', '90', '94', '90', null, '2016-07-19 18:22:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1498', '18', '90', '36', '90', '95', '90', null, '2016-07-19 18:23:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1499', '24', '90', '36', '90', '94', '90', null, '2016-07-19 18:24:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1500', '5', '90', '36', '90', '95', '90', null, '2016-07-19 18:25:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1501', '6', '90', '37', '90', '95', '90', null, '2016-07-19 18:26:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1502', '56', '90', '37', '90', '96', '90', null, '2016-07-19 18:27:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1503', '11', '90', '37', '90', '96', '90', null, '2016-07-19 18:28:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1504', '21', '90', '37', '90', '97', '90', null, '2016-07-19 18:29:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1505', '17', '90', '37', '90', '96', '90', null, '2016-07-19 18:30:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1506', '29', '90', '37', '90', '95', '90', null, '2016-07-19 18:31:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1507', '19', '90', '38', '90', '97', '90', null, '2016-07-19 18:32:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1508', '24', '90', '38', '90', '97', '90', null, '2016-07-19 18:33:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1509', '24', '90', '38', '90', '97', '90', null, '2016-07-19 18:34:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1510', '34', '90', '38', '90', '97', '90', null, '2016-07-19 18:35:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1511', '71', '90', '38', '90', '97', '90', null, '2016-07-19 18:36:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1512', '24', '90', '38', '90', '97', '90', null, '2016-07-19 18:37:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1513', '96', '90', '38', '90', '96', '90', null, '2016-07-19 18:38:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1514', '22', '90', '38', '90', '96', '90', null, '2016-07-19 18:39:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1515', '20', '90', '38', '90', '96', '90', null, '2016-07-19 18:40:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1516', '25', '90', '39', '90', '97', '90', null, '2016-07-19 18:41:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1517', '59', '90', '39', '90', '96', '90', null, '2016-07-19 18:42:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1518', '17', '90', '58', '90', '95', '90', null, '2016-07-19 18:45:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1519', '86', '90', '59', '90', '96', '90', null, '2016-07-19 18:47:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1520', '27', '90', '60', '90', '98', '90', null, '2016-07-19 18:48:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1521', '17', '90', '64', '90', '97', '90', null, '2016-07-19 18:49:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1522', '21', '90', '71', '90', '97', '90', null, '2016-07-19 18:50:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1523', '33', '90', '71', '90', '96', '90', null, '2016-07-19 18:51:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1524', '15', '90', '71', '90', '97', '90', null, '2016-07-19 18:52:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1525', '19', '90', '72', '90', '97', '90', null, '2016-07-19 18:53:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1526', '13', '90', '72', '90', '97', '90', null, '2016-07-19 18:54:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1527', '13', '90', '72', '90', '98', '90', null, '2016-07-19 18:55:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1528', '10', '90', '72', '90', '98', '90', null, '2016-07-19 18:56:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1529', '4', '90', '72', '90', '96', '90', null, '2016-07-19 18:57:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1530', '3', '90', '72', '90', '97', '90', null, '2016-07-19 18:58:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1531', '8', '90', '72', '90', '97', '90', null, '2016-07-19 18:59:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1532', '4', '90', '60', '90', '96', '90', null, '2016-07-20 16:01:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1533', '9', '90', '60', '90', '96', '90', null, '2016-07-20 16:02:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1534', '53', '90', '61', '90', '95', '90', null, '2016-07-20 16:03:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1535', '6', '90', '61', '90', '96', '90', null, '2016-07-20 16:04:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1536', '7', '90', '61', '90', '96', '90', null, '2016-07-20 16:05:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1537', '3', '90', '62', '90', '96', '90', null, '2016-07-20 16:06:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1538', '5', '90', '62', '90', '96', '90', null, '2016-07-20 16:07:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1539', '4', '90', '62', '90', '96', '90', null, '2016-07-20 16:08:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1540', '6', '90', '62', '90', '96', '90', null, '2016-07-20 16:09:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1541', '7', '90', '62', '90', '96', '90', null, '2016-07-20 16:10:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1542', '5', '90', '62', '90', '96', '90', null, '2016-07-20 16:11:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1543', '5', '90', '62', '90', '96', '90', null, '2016-07-20 16:12:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1544', '5', '90', '63', '90', '96', '90', null, '2016-07-20 16:13:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1545', '6', '90', '63', '90', '96', '90', null, '2016-07-20 16:14:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1546', '2', '90', '63', '90', '96', '90', null, '2016-07-20 16:15:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1547', '3', '90', '63', '90', '96', '90', null, '2016-07-20 16:16:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1548', '3', '90', '63', '90', '96', '90', null, '2016-07-20 16:17:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1549', '8', '90', '63', '90', '96', '90', null, '2016-07-20 16:18:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1550', '5', '90', '63', '90', '96', '90', null, '2016-07-20 16:19:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1551', '6', '90', '63', '90', '96', '90', null, '2016-07-20 16:20:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1552', '13', '90', '64', '90', '96', '90', null, '2016-07-20 16:21:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1553', '16', '90', '64', '90', '96', '90', null, '2016-07-20 16:22:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1554', '16', '90', '64', '90', '96', '90', null, '2016-07-20 16:23:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1555', '16', '90', '64', '90', '96', '90', null, '2016-07-20 16:24:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1556', '22', '90', '64', '90', '96', '90', null, '2016-07-20 16:25:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1557', '57', '90', '64', '90', '96', '90', null, '2016-07-20 16:26:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1558', '27', '90', '64', '90', '97', '90', null, '2016-07-20 16:27:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1559', '5', '90', '64', '90', '97', '90', null, '2016-07-20 16:28:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1560', '7', '90', '64', '90', '96', '90', null, '2016-07-20 16:29:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1561', '6', '90', '65', '90', '97', '90', null, '2016-07-20 16:30:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1562', '6', '90', '65', '90', '97', '90', null, '2016-07-20 16:31:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1563', '94', '90', '65', '90', '96', '90', null, '2016-07-20 16:32:01', '<font color=\"red\">CPU当前：94%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1564', '8', '90', '65', '90', '97', '90', null, '2016-07-20 16:33:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1565', '15', '90', '65', '90', '97', '90', null, '2016-07-20 16:34:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1566', '10', '90', '65', '90', '97', '90', null, '2016-07-20 16:35:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1567', '23', '90', '65', '90', '98', '90', null, '2016-07-20 16:36:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1568', '38', '90', '66', '90', '98', '90', null, '2016-07-20 16:37:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1569', '14', '90', '66', '90', '97', '90', null, '2016-07-20 16:38:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1570', '21', '90', '66', '90', '97', '90', null, '2016-07-20 16:39:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1571', '14', '90', '66', '90', '97', '90', null, '2016-07-20 16:40:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1572', '85', '90', '66', '90', '97', '90', null, '2016-07-20 16:41:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1573', '10', '90', '66', '90', '97', '90', null, '2016-07-20 16:42:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1574', '10', '90', '66', '90', '97', '90', null, '2016-07-20 16:43:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1575', '8', '90', '67', '90', '97', '90', null, '2016-07-20 16:44:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1576', '7', '90', '67', '90', '97', '90', null, '2016-07-20 16:45:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1577', '17', '90', '67', '90', '97', '90', null, '2016-07-20 16:46:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1578', '12', '90', '67', '90', '97', '90', null, '2016-07-20 16:47:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1579', '8', '90', '67', '90', '98', '90', null, '2016-07-20 16:48:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1580', '60', '90', '67', '90', '98', '90', null, '2016-07-20 16:49:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1581', '30', '90', '37', '90', '94', '90', null, '2016-07-20 16:50:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1582', '32', '90', '37', '90', '94', '90', null, '2016-07-20 16:51:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1583', '7', '90', '38', '90', '94', '90', null, '2016-07-20 16:52:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1584', '19', '90', '38', '90', '93', '90', null, '2016-07-20 16:53:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1585', '2', '90', '38', '90', '93', '90', null, '2016-07-20 16:54:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1586', '6', '90', '39', '90', '94', '90', null, '2016-07-20 16:55:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1587', '10', '90', '39', '90', '94', '90', null, '2016-07-20 16:56:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1588', '7', '90', '39', '90', '94', '90', null, '2016-07-20 16:57:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1589', '23', '90', '39', '90', '95', '90', null, '2016-07-20 16:58:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1590', '22', '90', '40', '90', '95', '90', null, '2016-07-20 16:59:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1591', '91', '90', '40', '90', '95', '90', null, '2016-07-20 17:00:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1592', '66', '90', '40', '90', '93', '90', null, '2016-07-20 17:01:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1593', '59', '90', '40', '90', '91', '90', null, '2016-07-20 17:02:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1594', '23', '90', '40', '90', '92', '90', null, '2016-07-20 17:04:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1595', '17', '90', '41', '90', '92', '90', null, '2016-07-20 17:05:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1596', '22', '90', '41', '90', '92', '90', null, '2016-07-20 17:07:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1597', '8', '90', '41', '90', '91', '90', null, '2016-07-20 17:08:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1598', '9', '90', '41', '90', '91', '90', null, '2016-07-20 17:09:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1599', '6', '90', '41', '90', '91', '90', null, '2016-07-20 17:10:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1600', '92', '90', '41', '90', '86', '90', null, '2016-07-20 17:12:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1601', '13', '90', '41', '90', '92', '90', null, '2016-07-20 17:13:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1602', '5', '90', '43', '90', '92', '90', null, '2016-07-20 17:14:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1603', '16', '90', '43', '90', '93', '90', null, '2016-07-20 17:15:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1604', '12', '90', '43', '90', '93', '90', null, '2016-07-20 17:16:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1605', '14', '90', '43', '90', '93', '90', null, '2016-07-20 17:17:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1606', '30', '90', '43', '90', '93', '90', null, '2016-07-20 17:18:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1607', '5', '90', '43', '90', '92', '90', null, '2016-07-20 17:19:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1608', '20', '90', '51', '90', '93', '90', null, '2016-07-20 17:20:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1609', '7', '90', '51', '90', '93', '90', null, '2016-07-20 17:21:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1610', '17', '90', '52', '90', '92', '90', null, '2016-07-20 17:22:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1611', '8', '90', '52', '90', '93', '90', null, '2016-07-20 17:23:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1612', '25', '90', '52', '90', '93', '90', null, '2016-07-20 17:24:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1613', '18', '90', '52', '90', '93', '90', null, '2016-07-20 17:25:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1614', '8', '90', '52', '90', '94', '90', null, '2016-07-20 17:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1615', '43', '90', '52', '90', '93', '90', null, '2016-07-20 17:27:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1616', '10', '90', '52', '90', '95', '90', null, '2016-07-20 17:28:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1617', '49', '90', '52', '90', '95', '90', null, '2016-07-20 17:29:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1618', '4', '90', '52', '90', '94', '90', null, '2016-07-20 17:30:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1619', '17', '90', '53', '90', '94', '90', null, '2016-07-20 17:31:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1620', '3', '90', '53', '90', '93', '90', null, '2016-07-20 17:32:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1621', '6', '90', '53', '90', '93', '90', null, '2016-07-20 17:33:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1622', '11', '90', '53', '90', '93', '90', null, '2016-07-20 17:34:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1623', '6', '90', '53', '90', '93', '90', null, '2016-07-20 17:35:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1624', '9', '90', '53', '90', '93', '90', null, '2016-07-20 17:36:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1625', '8', '90', '53', '90', '93', '90', null, '2016-07-20 17:37:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1626', '20', '90', '53', '90', '92', '90', null, '2016-07-20 17:38:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1627', '6', '90', '53', '90', '93', '90', null, '2016-07-20 17:39:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1628', '8', '90', '54', '90', '93', '90', null, '2016-07-20 17:40:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1629', '23', '90', '54', '90', '94', '90', null, '2016-07-20 17:41:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1630', '6', '90', '54', '90', '94', '90', null, '2016-07-20 17:42:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1631', '3', '90', '54', '90', '94', '90', null, '2016-07-20 17:43:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1632', '11', '90', '32', '90', '91', '90', null, '2016-07-21 14:45:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1633', '28', '90', '33', '90', '94', '90', null, '2016-07-21 14:54:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1634', '7', '90', '33', '90', '93', '90', null, '2016-07-21 14:55:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1635', '11', '90', '33', '90', '96', '90', null, '2016-07-21 14:56:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1636', '3', '90', '33', '90', '91', '90', null, '2016-07-21 14:57:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1637', '6', '90', '33', '90', '91', '90', null, '2016-07-21 14:58:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1638', '5', '90', '33', '90', '92', '90', null, '2016-07-21 14:59:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1639', '7', '90', '33', '90', '92', '90', null, '2016-07-21 15:00:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1640', '16', '90', '33', '90', '92', '90', null, '2016-07-21 15:01:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1641', '7', '90', '33', '90', '92', '90', null, '2016-07-21 15:02:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1642', '13', '90', '34', '90', '93', '90', null, '2016-07-21 15:03:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1643', '6', '90', '34', '90', '93', '90', null, '2016-07-21 15:04:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1644', '11', '90', '34', '90', '93', '90', null, '2016-07-21 15:05:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1645', '7', '90', '34', '90', '92', '90', null, '2016-07-21 15:06:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1646', '8', '90', '34', '90', '93', '90', null, '2016-07-21 15:07:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1647', '26', '90', '35', '90', '94', '90', null, '2016-07-21 15:08:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1648', '11', '90', '35', '90', '93', '90', null, '2016-07-21 15:09:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1649', '88', '90', '35', '90', '93', '90', null, '2016-07-21 15:10:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1650', '5', '90', '35', '90', '92', '90', null, '2016-07-21 15:11:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1651', '6', '90', '35', '90', '92', '90', null, '2016-07-21 15:12:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1652', '6', '90', '35', '90', '93', '90', null, '2016-07-21 15:13:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1653', '6', '90', '35', '90', '93', '90', null, '2016-07-21 15:14:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1654', '9', '90', '35', '90', '93', '90', null, '2016-07-21 15:15:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1655', '10', '90', '35', '90', '94', '90', null, '2016-07-21 15:16:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1656', '7', '90', '36', '90', '94', '90', null, '2016-07-21 15:17:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1657', '6', '90', '36', '90', '94', '90', null, '2016-07-21 15:18:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1658', '11', '90', '36', '90', '94', '90', null, '2016-07-21 15:19:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1659', '73', '90', '36', '90', '94', '90', null, '2016-07-21 15:20:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1660', '74', '90', '36', '90', '94', '90', null, '2016-07-21 15:21:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1661', '49', '90', '36', '90', '94', '90', null, '2016-07-21 15:22:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1662', '5', '90', '36', '90', '94', '90', null, '2016-07-21 15:23:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1663', '26', '90', '37', '90', '94', '90', null, '2016-07-21 15:24:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1664', '13', '90', '52', '90', '94', '90', null, '2016-07-21 15:25:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1665', '90', '90', '68', '90', '94', '90', null, '2016-07-21 15:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1666', '15', '90', '68', '90', '95', '90', null, '2016-07-21 15:27:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1667', '38', '90', '68', '90', '94', '90', null, '2016-07-21 15:28:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1668', '42', '90', '68', '90', '94', '90', null, '2016-07-21 15:29:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1669', '43', '90', '68', '90', '94', '90', null, '2016-07-21 15:30:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1670', '16', '90', '68', '90', '94', '90', null, '2016-07-21 15:31:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1671', '20', '90', '68', '90', '95', '90', null, '2016-07-21 15:32:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1672', '8', '90', '69', '90', '93', '90', null, '2016-07-21 15:33:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1673', '59', '90', '69', '90', '92', '90', null, '2016-07-21 15:34:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1674', '14', '90', '69', '90', '93', '90', null, '2016-07-21 15:35:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1675', '60', '90', '69', '90', '92', '90', null, '2016-07-21 15:36:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1676', '7', '90', '69', '90', '93', '90', null, '2016-07-21 15:37:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1677', '60', '90', '69', '90', '92', '90', null, '2016-07-21 15:38:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1678', '10', '90', '70', '90', '93', '90', null, '2016-07-21 15:39:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1679', '65', '90', '70', '90', '92', '90', null, '2016-07-21 15:40:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1680', '11', '90', '70', '90', '93', '90', null, '2016-07-21 15:41:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1681', '4', '90', '70', '90', '93', '90', null, '2016-07-21 15:42:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1682', '6', '90', '70', '90', '92', '90', null, '2016-07-21 15:43:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1683', '3', '90', '70', '90', '93', '90', null, '2016-07-21 15:44:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1684', '4', '90', '70', '90', '93', '90', null, '2016-07-21 15:45:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1685', '11', '90', '18', '90', '94', '90', null, '2016-07-21 15:46:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1686', '5', '90', '19', '90', '94', '90', null, '2016-07-21 15:47:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1687', '10', '90', '19', '90', '94', '90', null, '2016-07-21 15:48:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1688', '13', '90', '19', '90', '94', '90', null, '2016-07-21 15:49:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1689', '8', '90', '19', '90', '95', '90', null, '2016-07-21 15:50:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1690', '6', '90', '19', '90', '95', '90', null, '2016-07-21 15:51:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1691', '6', '90', '19', '90', '94', '90', null, '2016-07-21 15:52:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1692', '5', '90', '19', '90', '94', '90', null, '2016-07-21 15:53:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1693', '48', '90', '19', '90', '94', '90', null, '2016-07-21 15:54:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1694', '46', '90', '19', '90', '95', '90', null, '2016-07-21 15:55:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1695', '18', '90', '20', '90', '95', '90', null, '2016-07-21 15:56:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1696', '12', '90', '20', '90', '94', '90', null, '2016-07-21 15:57:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1697', '7', '90', '20', '90', '94', '90', null, '2016-07-21 15:58:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1698', '26', '90', '20', '90', '94', '90', null, '2016-07-21 15:59:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1699', '10', '90', '20', '90', '95', '90', null, '2016-07-21 16:00:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1700', '5', '90', '20', '90', '95', '90', null, '2016-07-21 16:01:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1701', '16', '90', '20', '90', '95', '90', null, '2016-07-21 16:02:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1702', '7', '90', '20', '90', '94', '90', null, '2016-07-21 16:03:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1703', '9', '90', '21', '90', '94', '90', null, '2016-07-21 16:04:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1704', '6', '90', '21', '90', '94', '90', null, '2016-07-21 16:05:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1705', '13', '90', '21', '90', '94', '90', null, '2016-07-21 16:06:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1706', '6', '90', '21', '90', '94', '90', null, '2016-07-21 16:07:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1707', '22', '90', '21', '90', '93', '90', null, '2016-07-21 16:08:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1708', '9', '90', '22', '90', '93', '90', null, '2016-07-21 16:09:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1709', '6', '90', '22', '90', '93', '90', null, '2016-07-21 16:10:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1710', '9', '90', '22', '90', '93', '90', null, '2016-07-21 16:11:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1711', '4', '90', '22', '90', '93', '90', null, '2016-07-21 16:12:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1712', '7', '90', '22', '90', '93', '90', null, '2016-07-21 16:13:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1713', '16', '90', '22', '90', '95', '90', null, '2016-07-21 16:14:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1714', '4', '90', '22', '90', '93', '90', null, '2016-07-21 16:15:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1715', '5', '90', '22', '90', '93', '90', null, '2016-07-21 16:16:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1716', '18', '90', '23', '90', '93', '90', null, '2016-07-21 16:17:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1717', '10', '90', '23', '90', '93', '90', null, '2016-07-21 16:18:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1718', '24', '90', '23', '90', '93', '90', null, '2016-07-21 16:19:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1719', '20', '90', '23', '90', '93', '90', null, '2016-07-21 16:20:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1720', '24', '90', '23', '90', '93', '90', null, '2016-07-21 16:21:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1721', '25', '90', '23', '90', '93', '90', null, '2016-07-21 16:22:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1722', '24', '90', '23', '90', '94', '90', null, '2016-07-21 16:23:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1723', '22', '90', '23', '90', '94', '90', null, '2016-07-21 16:24:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1724', '6', '90', '23', '90', '94', '90', null, '2016-07-21 16:25:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1725', '52', '90', '24', '90', '94', '90', null, '2016-07-21 16:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1726', '10', '90', '24', '90', '94', '90', null, '2016-07-21 16:27:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1727', '8', '90', '24', '90', '94', '90', null, '2016-07-21 16:28:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1728', '10', '90', '24', '90', '93', '90', null, '2016-07-21 16:29:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1729', '10', '90', '24', '90', '93', '90', null, '2016-07-21 16:30:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1730', '11', '90', '24', '90', '93', '90', null, '2016-07-21 16:31:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1731', '8', '90', '24', '90', '93', '90', null, '2016-07-21 16:32:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1732', '11', '90', '24', '90', '94', '90', null, '2016-07-21 16:33:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1733', '20', '90', '24', '90', '94', '90', null, '2016-07-21 16:34:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1734', '13', '90', '25', '90', '93', '90', null, '2016-07-21 16:35:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1735', '4', '90', '25', '90', '93', '90', null, '2016-07-21 16:36:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1736', '6', '90', '29', '90', '93', '90', null, '2016-07-21 16:37:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1737', '6', '90', '29', '90', '93', '90', null, '2016-07-21 16:38:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1738', '11', '90', '29', '90', '93', '90', null, '2016-07-21 16:39:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1739', '21', '90', '29', '90', '94', '90', null, '2016-07-21 16:40:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1740', '17', '90', '29', '90', '94', '90', null, '2016-07-21 16:41:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1741', '10', '90', '29', '90', '94', '90', null, '2016-07-21 16:42:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1742', '8', '90', '29', '90', '94', '90', null, '2016-07-21 16:43:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1743', '11', '90', '30', '90', '94', '90', null, '2016-07-21 16:44:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1744', '8', '90', '30', '90', '94', '90', null, '2016-07-21 16:45:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1745', '17', '90', '30', '90', '94', '90', null, '2016-07-21 16:46:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1746', '16', '90', '30', '90', '94', '90', null, '2016-07-21 16:47:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1747', '15', '90', '30', '90', '94', '90', null, '2016-07-21 16:48:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1748', '13', '90', '30', '90', '94', '90', null, '2016-07-21 16:49:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1749', '17', '90', '30', '90', '94', '90', null, '2016-07-21 16:50:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1750', '11', '90', '31', '90', '94', '90', null, '2016-07-21 16:51:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1751', '16', '90', '31', '90', '94', '90', null, '2016-07-21 16:52:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1752', '10', '90', '31', '90', '94', '90', null, '2016-07-21 16:53:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1753', '17', '90', '31', '90', '94', '90', null, '2016-07-21 16:54:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1754', '11', '90', '31', '90', '94', '90', null, '2016-07-21 16:55:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1755', '13', '90', '31', '90', '94', '90', null, '2016-07-21 16:56:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1756', '14', '90', '31', '90', '94', '90', null, '2016-07-21 16:57:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1757', '12', '90', '31', '90', '94', '90', null, '2016-07-21 16:58:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1758', '9', '90', '31', '90', '94', '90', null, '2016-07-21 16:59:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1759', '10', '90', '32', '90', '94', '90', null, '2016-07-21 17:00:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1760', '5', '90', '32', '90', '94', '90', null, '2016-07-21 17:01:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1761', '4', '90', '32', '90', '94', '90', null, '2016-07-21 17:02:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1762', '3', '90', '32', '90', '94', '90', null, '2016-07-21 17:03:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1763', '6', '90', '32', '90', '94', '90', null, '2016-07-21 17:04:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1764', '8', '90', '32', '90', '94', '90', null, '2016-07-21 17:05:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1765', '5', '90', '33', '90', '94', '90', null, '2016-07-21 17:06:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1766', '8', '90', '33', '90', '94', '90', null, '2016-07-21 17:07:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1767', '4', '90', '33', '90', '94', '90', null, '2016-07-21 17:08:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1768', '11', '90', '33', '90', '94', '90', null, '2016-07-21 17:09:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1769', '53', '90', '33', '90', '94', '90', null, '2016-07-21 17:10:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1770', '13', '90', '33', '90', '94', '90', null, '2016-07-21 17:11:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1771', '4', '90', '33', '90', '94', '90', null, '2016-07-21 17:12:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1772', '9', '90', '34', '90', '95', '90', null, '2016-07-21 17:13:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1773', '19', '90', '34', '90', '95', '90', null, '2016-07-21 17:14:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1774', '13', '90', '34', '90', '94', '90', null, '2016-07-21 17:15:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1775', '13', '90', '34', '90', '94', '90', null, '2016-07-21 17:16:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1776', '3', '90', '34', '90', '94', '90', null, '2016-07-21 17:17:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1777', '9', '90', '34', '90', '95', '90', null, '2016-07-21 17:18:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1778', '25', '90', '34', '90', '95', '90', null, '2016-07-21 17:19:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1779', '5', '90', '34', '90', '94', '90', null, '2016-07-21 17:20:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1780', '24', '90', '35', '90', '95', '90', null, '2016-07-21 17:21:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1781', '5', '90', '35', '90', '95', '90', null, '2016-07-21 17:22:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1782', '12', '90', '35', '90', '94', '90', null, '2016-07-21 17:23:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1783', '34', '90', '35', '90', '94', '90', null, '2016-07-21 17:24:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1784', '36', '90', '35', '90', '94', '90', null, '2016-07-21 17:25:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1785', '11', '90', '35', '90', '94', '90', null, '2016-07-21 17:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1786', '26', '90', '35', '90', '93', '90', null, '2016-07-21 17:27:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1787', '9', '90', '35', '90', '95', '90', null, '2016-07-21 17:28:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1788', '10', '90', '36', '90', '95', '90', null, '2016-07-21 17:29:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1789', '9', '90', '36', '90', '95', '90', null, '2016-07-21 17:30:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1790', '29', '90', '36', '90', '94', '90', null, '2016-07-21 17:31:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1791', '10', '90', '36', '90', '94', '90', null, '2016-07-21 17:32:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1792', '64', '90', '36', '90', '94', '90', null, '2016-07-21 17:33:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1793', '7', '90', '36', '90', '95', '90', null, '2016-07-21 17:34:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1794', '15', '90', '36', '90', '93', '90', null, '2016-07-21 17:35:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1795', '9', '90', '37', '90', '95', '90', null, '2016-07-21 17:36:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1796', '42', '90', '37', '90', '95', '90', null, '2016-07-21 17:37:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1797', '30', '90', '37', '90', '95', '90', null, '2016-07-21 17:38:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1798', '2', '90', '37', '90', '95', '90', null, '2016-07-21 17:39:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1799', '6', '90', '37', '90', '95', '90', null, '2016-07-21 17:40:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1800', '9', '90', '37', '90', '95', '90', null, '2016-07-21 17:41:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1801', '3', '90', '38', '90', '95', '90', null, '2016-07-21 17:42:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1802', '16', '90', '38', '90', '95', '90', null, '2016-07-21 17:43:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1803', '99', '90', '38', '90', '91', '90', null, '2016-07-21 17:44:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1804', '7', '90', '38', '90', '92', '90', null, '2016-07-21 17:45:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1805', '2', '90', '38', '90', '92', '90', null, '2016-07-21 17:46:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1806', '2', '90', '38', '90', '92', '90', null, '2016-07-21 17:47:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1807', '92', '90', '39', '90', '73', '90', null, '2016-07-22 11:38:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1808', '96', '90', '39', '90', '70', '90', null, '2016-07-22 11:40:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1809', '94', '90', '40', '90', '75', '90', null, '2016-07-22 12:13:01', '<font color=\"red\">CPU当前：94%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1810', '91', '90', '51', '90', '84', '90', null, '2016-07-25 18:15:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1811', '97', '90', '51', '90', '84', '90', null, '2016-07-25 18:21:01', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1812', '96', '90', '24', '90', '79', '90', null, '2016-07-26 10:49:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1813', '45', '90', '35', '90', '94', '90', null, '2016-07-26 14:22:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1814', '18', '90', '35', '90', '93', '90', null, '2016-07-26 14:23:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1815', '11', '90', '35', '90', '95', '90', null, '2016-07-26 14:24:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1816', '12', '90', '35', '90', '93', '90', null, '2016-07-26 14:25:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1817', '41', '90', '35', '90', '94', '90', null, '2016-07-26 14:26:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1818', '15', '90', '36', '90', '94', '90', null, '2016-07-26 14:27:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1819', '16', '90', '36', '90', '92', '90', null, '2016-07-26 14:28:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1820', '13', '90', '36', '90', '91', '90', null, '2016-07-26 14:29:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1821', '21', '90', '36', '90', '91', '90', null, '2016-07-26 14:30:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1822', '27', '90', '36', '90', '91', '90', null, '2016-07-26 14:31:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1823', '9', '90', '36', '90', '91', '90', null, '2016-07-26 14:32:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1824', '4', '90', '36', '90', '91', '90', null, '2016-07-26 14:33:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1825', '46', '90', '37', '90', '91', '90', null, '2016-07-26 14:34:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1826', '8', '90', '37', '90', '91', '90', null, '2016-07-26 14:35:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1827', '12', '90', '37', '90', '91', '90', null, '2016-07-26 14:36:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1828', '5', '90', '37', '90', '91', '90', null, '2016-07-26 14:37:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1829', '5', '90', '37', '90', '91', '90', null, '2016-07-26 14:38:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1830', '6', '90', '37', '90', '91', '90', null, '2016-07-26 14:39:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1831', '6', '90', '37', '90', '91', '90', null, '2016-07-26 14:40:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1832', '5', '90', '37', '90', '91', '90', null, '2016-07-26 14:41:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1833', '6', '90', '37', '90', '91', '90', null, '2016-07-26 14:42:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1834', '5', '90', '37', '90', '91', '90', null, '2016-07-26 14:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1835', '7', '90', '38', '90', '91', '90', null, '2016-07-26 14:44:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1836', '8', '90', '38', '90', '91', '90', null, '2016-07-26 14:45:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1837', '4', '90', '38', '90', '91', '90', null, '2016-07-26 14:46:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1838', '5', '90', '38', '90', '91', '90', null, '2016-07-26 14:47:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1839', '2', '90', '38', '90', '91', '90', null, '2016-07-26 14:48:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1840', '4', '90', '38', '90', '91', '90', null, '2016-07-26 14:49:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1841', '5', '90', '38', '90', '91', '90', null, '2016-07-26 14:50:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1842', '6', '90', '39', '90', '91', '90', null, '2016-07-26 14:51:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1843', '5', '90', '39', '90', '91', '90', null, '2016-07-26 14:52:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1844', '9', '90', '39', '90', '91', '90', null, '2016-07-26 14:53:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1845', '9', '90', '39', '90', '91', '90', null, '2016-07-26 14:54:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1846', '8', '90', '39', '90', '91', '90', null, '2016-07-26 14:55:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1847', '10', '90', '39', '90', '91', '90', null, '2016-07-26 14:56:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1848', '13', '90', '40', '90', '91', '90', null, '2016-07-26 14:57:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1849', '6', '90', '41', '90', '95', '90', null, '2016-07-26 14:58:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1850', '9', '90', '41', '90', '95', '90', null, '2016-07-26 14:59:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1851', '5', '90', '41', '90', '95', '90', null, '2016-07-26 15:00:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1852', '6', '90', '41', '90', '95', '90', null, '2016-07-26 15:01:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1853', '31', '90', '41', '90', '97', '90', null, '2016-07-26 15:02:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1854', '15', '90', '41', '90', '98', '90', null, '2016-07-26 15:03:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1855', '13', '90', '41', '90', '96', '90', null, '2016-07-26 15:04:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1856', '43', '90', '41', '90', '98', '90', null, '2016-07-26 15:05:01', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1857', '15', '90', '42', '90', '97', '90', null, '2016-07-26 15:06:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1858', '13', '90', '42', '90', '97', '90', null, '2016-07-26 15:07:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1859', '13', '90', '42', '90', '97', '90', null, '2016-07-26 15:08:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1860', '93', '90', '34', '90', '69', '90', null, '2016-07-27 11:27:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1861', '99', '90', '39', '90', '79', '90', null, '2016-07-27 13:28:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1862', '100', '90', '46', '90', '71', '90', null, '2016-07-27 16:37:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1863', '91', '90', '36', '90', '84', '90', null, '2016-08-01 14:51:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1864', '99', '90', '44', '90', '80', '90', null, '2016-08-01 15:27:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1865', '100', '90', '47', '90', '82', '90', null, '2016-08-01 15:56:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1866', '94', '90', '48', '90', '85', '90', null, '2016-08-01 16:00:01', '<font color=\"red\">CPU当前：94%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1867', '93', '90', '48', '90', '84', '90', null, '2016-08-01 16:06:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1868', '97', '90', '49', '90', '85', '90', null, '2016-08-01 16:25:01', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1869', '99', '90', '49', '90', '85', '90', null, '2016-08-01 16:28:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1870', '100', '90', '50', '90', '85', '90', null, '2016-08-01 16:41:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1871', '97', '90', '50', '90', '85', '90', null, '2016-08-01 16:43:01', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1872', '100', '90', '51', '90', '85', '90', null, '2016-08-01 16:50:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1873', '100', '90', '51', '90', '86', '90', null, '2016-08-01 16:51:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1874', '98', '90', '52', '90', '88', '90', null, '2016-08-01 17:14:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1875', '96', '90', '52', '90', '87', '90', null, '2016-08-01 17:15:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1876', '100', '90', '53', '90', '87', '90', null, '2016-08-01 17:21:02', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1877', '97', '90', '53', '90', '87', '90', null, '2016-08-01 17:23:01', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1878', '100', '90', '53', '90', '87', '90', null, '2016-08-01 17:27:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1879', '71', '90', '54', '90', '91', '90', null, '2016-08-01 17:35:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1880', '9', '90', '54', '90', '91', '90', null, '2016-08-01 17:36:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1881', '11', '90', '54', '90', '91', '90', null, '2016-08-01 17:37:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1882', '13', '90', '54', '90', '92', '90', null, '2016-08-01 17:38:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1883', '6', '90', '54', '90', '92', '90', null, '2016-08-01 17:39:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1884', '14', '90', '54', '90', '92', '90', null, '2016-08-01 17:40:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1885', '8', '90', '54', '90', '92', '90', null, '2016-08-01 17:41:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1886', '4', '90', '54', '90', '92', '90', null, '2016-08-01 17:42:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1887', '9', '90', '54', '90', '91', '90', null, '2016-08-01 17:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1888', '99', '90', '56', '90', '86', '90', null, '2016-08-01 18:01:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1889', '91', '90', '87', '90', '69', '90', null, '2016-08-03 09:04:01', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1890', '100', '90', '17', '90', '74', '90', null, '2016-08-03 09:34:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1891', '98', '90', '18', '90', '72', '90', null, '2016-08-03 09:40:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1892', '92', '90', '58', '90', '73', '90', null, '2016-08-03 09:54:01', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1893', '99', '90', '60', '90', '74', '90', null, '2016-08-03 09:59:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1894', '96', '90', '60', '90', '70', '90', null, '2016-08-03 10:00:01', '<font color=\"red\">CPU当前：96%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1895', '93', '90', '64', '90', '86', '90', null, '2016-08-03 12:13:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1896', '93', '90', '69', '90', '87', '90', null, '2016-08-03 14:11:01', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1897', '36', '90', '73', '90', '91', '90', null, '2016-08-03 15:36:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1898', '38', '90', '73', '90', '91', '90', null, '2016-08-03 15:37:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1899', '35', '90', '73', '90', '94', '90', null, '2016-08-03 15:38:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1900', '24', '90', '73', '90', '91', '90', null, '2016-08-03 15:42:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1901', '31', '90', '74', '90', '91', '90', null, '2016-08-03 15:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1902', '50', '90', '74', '90', '91', '90', null, '2016-08-03 15:44:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1903', '39', '90', '74', '90', '92', '90', null, '2016-08-03 15:45:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1904', '39', '90', '74', '90', '95', '90', null, '2016-08-03 15:46:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1905', '37', '90', '74', '90', '91', '90', null, '2016-08-03 15:47:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1906', '20', '90', '74', '90', '92', '90', null, '2016-08-03 15:48:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1907', '22', '90', '75', '90', '92', '90', null, '2016-08-03 16:04:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1908', '13', '90', '75', '90', '93', '90', null, '2016-08-03 16:05:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1909', '12', '90', '75', '90', '93', '90', null, '2016-08-03 16:06:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1910', '35', '90', '75', '90', '93', '90', null, '2016-08-03 16:07:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1911', '18', '90', '75', '90', '93', '90', null, '2016-08-03 16:08:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1912', '99', '90', '75', '90', '93', '90', null, '2016-08-03 16:09:01', '<font color=\"red\">CPU当前：99%,超出预设值  90%<br>内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1913', '17', '90', '75', '90', '93', '90', null, '2016-08-03 16:10:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1914', '23', '90', '76', '90', '93', '90', null, '2016-08-03 16:11:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1915', '39', '90', '76', '90', '93', '90', null, '2016-08-03 16:12:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1916', '39', '90', '76', '90', '93', '90', null, '2016-08-03 16:13:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1917', '10', '90', '76', '90', '93', '90', null, '2016-08-03 16:14:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1918', '22', '90', '76', '90', '94', '90', null, '2016-08-03 16:15:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1919', '16', '90', '76', '90', '91', '90', null, '2016-08-03 16:16:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1920', '13', '90', '76', '90', '91', '90', null, '2016-08-03 16:17:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1921', '6', '90', '76', '90', '91', '90', null, '2016-08-03 16:18:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1922', '11', '90', '77', '90', '91', '90', null, '2016-08-03 16:22:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1923', '4', '90', '77', '90', '91', '90', null, '2016-08-03 16:23:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1924', '28', '90', '78', '90', '91', '90', null, '2016-08-03 16:48:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1925', '98', '90', '78', '90', '74', '90', null, '2016-08-03 16:50:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>');
INSERT INTO `t_server_info` VALUES ('1926', '52', '90', '80', '90', '94', '90', null, '2016-08-03 17:27:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>');
INSERT INTO `t_server_info` VALUES ('1927', '100', '90', '82', '90', '76', '90', null, '2016-08-03 18:26:01', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>');

-- ----------------------------
-- Table structure for t_third_server_user
-- ----------------------------
DROP TABLE IF EXISTS `t_third_server_user`;
CREATE TABLE `t_third_server_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unionid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_third_server_user
-- ----------------------------
INSERT INTO `t_third_server_user` VALUES ('1', 'orYd-087cGHJmZVcf13AW0LgfrCc', 'SyJun??', null, 'CN', 'Haidian', null, 'ocXqgw9p-y_0tQsW2UEQoBAJdV5k', null, '2');
INSERT INTO `t_third_server_user` VALUES ('2', 'orYd-0wjesFtoAEksPOwkDq9O0vA', '王琪', null, 'CN', 'East', null, 'ocXqgw5Q_rFCTu3-9cJJeeb2dJpk', null, '2');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '内部公司');
INSERT INTO `t_type` VALUES ('2', '国企');
INSERT INTO `t_type` VALUES ('3', '私企');
INSERT INTO `t_type` VALUES ('4', '外企');
INSERT INTO `t_type` VALUES ('5', '事业单位');
INSERT INTO `t_type` VALUES ('6', '行政单位');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isLock` int(2) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `role` int(2) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `credentialsSalt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`username`) USING BTREE,
  UNIQUE KEY `personId` (`personId`) USING BTREE,
  KEY `role` (`role`) USING BTREE,
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `t_person` (`id`),
  CONSTRAINT `t_user_ibfk_2` FOREIGN KEY (`role`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3466 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '32abf0331c131ec9069b63bbe6823a9a', '0', '1', '1', '1', '488472627edd10fa0ca5748bf7d8e811');
INSERT INTO `t_user` VALUES ('2', 'zhangxd', '8205c5cab671d762da69ad965ceebb52', '0', '1', '4', '2', '55ba293ad5a1167641893470065916a2');
INSERT INTO `t_user` VALUES ('8', 'root', 'a143b9a6f220f23e48418fc399d9c7fa', '0', '1', '4', '3', 'c2cc77b175b2184d189806b457ebbbb3');
INSERT INTO `t_user` VALUES ('11', 'wangjiang', 'bbab0326dfe45dd64b5ed7b3278386cb', '0', '1', '5', '7', '774b1917d120aac71de17412f97d5b02');
INSERT INTO `t_user` VALUES ('13', 'sunhong', '5cb938712dd46f1a0b16abfe2fac860a', '0', '1', '5', '9', '3c17a6a0b53caa907a5d93ad8bf9dc10');
INSERT INTO `t_user` VALUES ('15', 'wqewqe', '767f79cec0fb73fb32a14a5e0932c831', '0', '1', '5', '11', '037e4c66a754e6e7a9026316d4a20fbf');
INSERT INTO `t_user` VALUES ('17', 'wqewqeqe', 'ea9bc80a772f41ae7b176ebce8dea4ca', '0', '1', '5', '13', '62ecbe8fa9d895bddcb6458fd54ddd00');
INSERT INTO `t_user` VALUES ('19', 'zhouqing', '123766e4f19d58813ff8e93091b64b21', '0', '1', '4', '15', '6da061d58ed01da2be21e98330920913');
INSERT INTO `t_user` VALUES ('3431', 'sunshang', '70181a14b528e7f23c9c329a929fd1f4', '0', '1', '4', '3421', '52e10cb8f7af3f85b3d76792fd40203b');
INSERT INTO `t_user` VALUES ('3438', 'ceshi2', 'c3d7c543a2f7f672d6af65817dd4995c', '0', '1', '6', '3430', '6ba9b0f8117d1d11bdcd688ea55d61af');
INSERT INTO `t_user` VALUES ('3448', 'eqwwqe213', '0a57b475407b2ba490df716d795c86a1', '0', '1', '5', '3441', 'f289ec78bbd4797ae5b1c4152061a31b');
INSERT INTO `t_user` VALUES ('3450', 'wangpai123', 'e6caa983a1ec19232c49bf1ec750792d', '0', '1', '6', '3443', '6b67b62fe46d48d3713d4098c42c717b');
INSERT INTO `t_user` VALUES ('3451', 'sunshang1', '30e559fed8f7d1c9f456ed37613d1eb6', '0', '1', '4', '3444', 'ee9b60e6b68864c058f596c784b50494');
INSERT INTO `t_user` VALUES ('3458', 'shiyanjun', 'ea054fe3530be2d7bb9342adbe7c242e', '0', '1', '5', '3460', '6b3d98496cade562943f27b77ccc91f5');
INSERT INTO `t_user` VALUES ('3463', 'weqwqe', '721c1ec70edaeeb1cbde0f45558d6186', '0', '1', '6', '3465', '1bc0e41faf39352a16fc7f98f768301c');
INSERT INTO `t_user` VALUES ('3464', 'zhanghu', 'd0206f6e14c499252121203f19416ea5', '0', '1', '6', '3466', 'b15a92a014008d8a943a7e902d36b15e');
INSERT INTO `t_user` VALUES ('3465', 'sunnan', '6912539863bb9b9274dbc69d0a48706e', '0', '1', '6', '3467', '8cbb6b526a3e2537e780d80aaa40958a');

-- ----------------------------
-- Table structure for t_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `t_userlogin`;
CREATE TABLE `t_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userlogin
-- ----------------------------
INSERT INTO `t_userlogin` VALUES ('1', '1', 'admin', '2016-06-26 10:43:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('2', '1', 'admin', '2016-06-26 10:44:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('3', '1', 'admin', '2016-06-26 19:43:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('4', '1', 'admin', '2016-06-27 10:11:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('5', '1', 'admin', '2016-06-27 11:18:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('6', '1', 'admin', '2016-06-27 12:49:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('7', '1', 'admin', '2016-06-27 13:25:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('8', '1', 'admin', '2016-06-27 13:25:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('9', '1', 'admin', '2016-06-27 13:25:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('10', '1', 'admin', '2016-06-27 13:25:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('11', '1', 'admin', '2016-06-27 13:26:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('12', '1', 'admin', '2016-06-27 13:43:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('13', '1', 'admin', '2016-06-27 14:18:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('14', '1', 'admin', '2016-06-27 14:27:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('15', '1', 'admin', '2016-06-27 14:32:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('16', '1', 'admin', '2016-06-27 16:01:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('17', '1', 'admin', '2016-06-27 16:07:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('18', '1', 'admin', '2016-06-27 16:15:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('19', '1', 'admin', '2016-06-27 16:22:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('20', '1', 'admin', '2016-06-27 16:54:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('21', '1', 'admin', '2016-06-27 17:31:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('22', '1', 'admin', '2016-06-27 17:43:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('23', '1', 'admin', '2016-06-27 18:28:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('24', '1', 'admin', '2016-06-27 18:42:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('25', '1', 'admin', '2016-06-27 18:46:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('26', '1', 'admin', '2016-06-28 08:47:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('27', '1', 'admin', '2016-06-28 09:20:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('28', '1', 'admin', '2016-06-28 09:46:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('29', '1', 'admin', '2016-06-28 10:37:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('30', '1', 'admin', '2016-06-28 10:44:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('31', '1', 'admin', '2016-06-28 10:56:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('32', '1', 'admin', '2016-06-28 11:08:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('33', '1', 'admin', '2016-06-28 11:21:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('34', '1', 'admin', '2016-06-28 13:04:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('35', '1', 'admin', '2016-06-28 16:11:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('36', '1', 'admin', '2016-06-28 16:28:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('37', '1', 'admin', '2016-06-28 16:41:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('38', '1', 'admin', '2016-06-28 16:45:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('39', '1', 'admin', '2016-06-28 16:51:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('40', '1', 'admin', '2016-06-28 17:12:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('41', '1', 'admin', '2016-06-28 17:33:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('42', '1', 'admin', '2016-06-28 17:39:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('43', '1', 'admin', '2016-06-28 17:43:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('44', '1', 'admin', '2016-06-28 17:45:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('45', '1', 'admin', '2016-06-28 17:58:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('46', '1', 'admin', '2016-06-28 18:02:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('47', '1', 'admin', '2016-06-28 18:06:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('48', '1', 'admin', '2016-06-28 18:15:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('49', '1', 'admin', '2016-06-28 18:23:07', '192.168.2.133');
INSERT INTO `t_userlogin` VALUES ('50', '1', 'admin', '2016-06-28 18:23:54', '192.168.2.133');
INSERT INTO `t_userlogin` VALUES ('51', '1', 'admin', '2016-06-29 09:32:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('52', '1', 'admin', '2016-06-29 09:53:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('53', '1', 'admin', '2016-06-29 09:58:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('54', '1', 'admin', '2016-06-29 10:46:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('55', '1', 'admin', '2016-06-29 11:41:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('56', '1', 'admin', '2016-06-29 11:55:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('57', '1', 'admin', '2016-06-29 12:11:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('58', '1', 'admin', '2016-06-29 12:17:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('59', '1', 'admin', '2016-06-29 12:27:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('60', '1', 'admin', '2016-06-29 13:41:35', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('61', '1', 'admin', '2016-06-29 13:44:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('62', '1', 'admin', '2016-06-29 14:02:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('63', '1', 'admin', '2016-06-29 14:08:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('64', '2', 'simple', '2016-06-29 14:08:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('65', '11', 'wangjiang', '2016-06-29 14:12:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('66', '1', 'admin', '2016-06-29 14:19:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('67', '1', 'admin', '2016-06-29 15:05:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('68', '1', 'admin', '2016-06-29 15:45:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('69', '1', 'admin', '2016-06-29 16:02:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('70', '1', 'admin', '2016-06-29 16:05:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('71', '1', 'admin', '2016-06-29 16:09:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('72', '1', 'admin', '2016-06-29 16:18:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('73', '1', 'admin', '2016-06-29 16:25:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('74', '1', 'admin', '2016-06-29 17:04:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('75', '1', 'admin', '2016-06-30 09:53:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('76', '1', 'admin', '2016-06-30 10:19:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('77', '1', 'admin', '2016-06-30 10:43:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('78', '1', 'admin', '2016-06-30 10:56:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('79', '1', 'admin', '2016-06-30 11:02:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('80', '1', 'admin', '2016-06-30 12:12:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('81', '1', 'admin', '2016-06-30 13:23:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('82', '1', 'admin', '2016-06-30 13:39:13', '192.168.2.173');
INSERT INTO `t_userlogin` VALUES ('83', '1', 'admin', '2016-06-30 13:44:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('84', '1', 'admin', '2016-06-30 14:18:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('85', '1', 'admin', '2016-06-30 17:05:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('86', '1', 'admin', '2016-06-30 17:58:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('87', '1', 'admin', '2016-07-01 09:50:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('88', '1', 'admin', '2016-07-01 09:50:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('89', '1', 'admin', '2016-07-01 13:13:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('90', '1', 'admin', '2016-07-01 13:16:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('91', '1', 'admin', '2016-07-01 13:35:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('92', '1', 'admin', '2016-07-01 13:40:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('93', '1', 'admin', '2016-07-01 16:15:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('94', '1', 'admin', '2016-07-01 16:18:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('95', '1', 'admin', '2016-07-01 16:21:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('96', '1', 'admin', '2016-07-01 16:24:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('97', '1', 'admin', '2016-07-01 16:32:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('98', '1', 'admin', '2016-07-01 16:50:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('99', '1', 'admin', '2016-07-01 16:58:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('100', '1', 'admin', '2016-07-01 17:45:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('101', '1', 'admin', '2016-07-01 18:39:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('102', '1', 'admin', '2016-07-01 18:46:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('103', '1', 'admin', '2016-07-01 23:08:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('104', '1', 'admin', '2016-07-01 23:13:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('105', '1', 'admin', '2016-07-03 16:26:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('106', '1', 'admin', '2016-07-03 18:21:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('107', '1', 'admin', '2016-07-03 19:27:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('108', '1', 'admin', '2016-07-03 22:15:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('109', '8', 'root', '2016-07-03 22:30:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('110', '1', 'admin', '2016-07-03 22:30:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('111', '1', 'admin', '2016-07-03 22:45:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('112', '1', 'admin', '2016-07-03 22:52:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('113', '1', 'admin', '2016-07-03 22:57:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('114', '1', 'admin', '2016-07-03 23:02:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('115', '1', 'admin', '2016-07-03 23:06:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('116', '1', 'admin', '2016-07-03 23:21:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('117', '1', 'admin', '2016-07-04 09:55:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('118', '1', 'admin', '2016-07-04 10:04:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('119', '1', 'admin', '2016-07-04 11:15:35', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('120', '1', 'admin', '2016-07-04 11:31:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('121', '1', 'admin', '2016-07-04 11:34:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('122', '2', 'simple', '2016-07-04 11:38:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('123', '2', 'simple', '2016-07-04 11:40:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('124', '2', 'simple', '2016-07-04 11:41:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('125', '2', 'simple', '2016-07-04 11:59:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('126', '2', 'simple', '2016-07-04 12:05:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('127', '1', 'admin', '2016-07-04 12:52:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('128', '2', 'simple', '2016-07-04 12:52:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('129', '2', 'simple', '2016-07-04 12:55:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('130', '1', 'admin', '2016-07-04 13:16:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('131', '1', 'admin', '2016-07-04 13:24:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('132', '1', 'admin', '2016-07-04 13:47:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('133', '2', 'simple', '2016-07-04 13:48:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('134', '2', 'simple', '2016-07-04 13:49:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('135', '2', 'simple', '2016-07-04 13:51:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('136', '1', 'admin', '2016-07-04 13:54:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('137', '1', 'admin', '2016-07-04 15:18:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('138', '1', 'admin', '2016-07-04 17:12:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('139', '1', 'admin', '2016-07-04 18:54:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('140', '1', 'admin', '2016-07-05 09:36:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('141', '8', 'root', '2016-07-05 09:45:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('142', '1', 'admin', '2016-07-05 10:05:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('143', '8', 'root', '2016-07-05 10:08:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('144', '1', 'admin', '2016-07-05 10:09:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('145', '1', 'admin', '2016-07-05 10:09:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('146', '8', 'root', '2016-07-05 10:10:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('147', '8', 'root', '2016-07-05 10:36:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('148', '1', 'admin', '2016-07-05 10:46:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('149', '8', 'root', '2016-07-05 10:54:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('150', '8', 'root', '2016-07-05 10:58:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('151', '1', 'admin', '2016-07-05 11:26:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('152', '8', 'root', '2016-07-05 11:28:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('153', '1', 'admin', '2016-07-05 11:30:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('154', '2', 'simple', '2016-07-05 11:30:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('155', '1', 'admin', '2016-07-05 11:34:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('156', '2', 'simple', '2016-07-05 11:41:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('157', '1', 'admin', '2016-07-05 11:42:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('158', '2', 'simple', '2016-07-05 11:59:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('159', '1', 'admin', '2016-07-05 12:07:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('160', '1', 'admin', '2016-07-05 13:01:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('161', '8', 'root', '2016-07-05 13:02:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('162', '1', 'admin', '2016-07-05 13:03:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('163', '8', 'root', '2016-07-05 13:04:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('164', '1', 'admin', '2016-07-05 13:04:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('165', '8', 'root', '2016-07-05 13:19:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('166', '1', 'admin', '2016-07-05 13:23:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('167', '17', 'wqewqeqe', '2016-07-05 13:24:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('168', '1', 'admin', '2016-07-05 13:24:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('169', '2', 'simple', '2016-07-05 14:11:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('170', '1', 'admin', '2016-07-05 14:16:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('171', '1', 'admin', '2016-07-05 14:58:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('172', '1', 'admin', '2016-07-05 15:09:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('173', '1', 'admin', '2016-07-05 15:26:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('174', '1', 'admin', '2016-07-05 15:27:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('175', '1', 'admin', '2016-07-05 15:30:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('176', '1', 'admin', '2016-07-05 16:15:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('177', '1', 'admin', '2016-07-05 16:36:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('178', '1', 'admin', '2016-07-05 16:52:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('179', '1', 'admin', '2016-07-06 08:40:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('180', '1', 'admin', '2016-07-06 08:49:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('181', '1', 'admin', '2016-07-06 10:11:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('182', '1', 'admin', '2016-07-06 10:37:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('183', '1', 'admin', '2016-07-06 11:07:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('184', '1', 'admin', '2016-07-06 11:11:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('185', '1', 'admin', '2016-07-06 11:15:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('186', '1', 'admin', '2016-07-06 12:31:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('187', '1', 'admin', '2016-07-06 14:18:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('188', '1', 'admin', '2016-07-06 17:01:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('189', '1', 'admin', '2016-07-06 17:02:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('190', '1', 'admin', '2016-07-06 17:32:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('191', '1', 'admin', '2016-07-07 08:55:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('192', '1', 'admin', '2016-07-07 10:23:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('193', '1', 'admin', '2016-07-07 10:27:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('194', '1', 'admin', '2016-07-07 10:50:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('195', '1', 'admin', '2016-07-07 11:07:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('196', '1', 'admin', '2016-07-07 11:10:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('197', '1', 'admin', '2016-07-07 11:15:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('198', '1', 'admin', '2016-07-07 11:24:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('199', '1', 'admin', '2016-07-07 11:33:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('200', '1', 'admin', '2016-07-07 11:48:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('201', '1', 'admin', '2016-07-07 11:57:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('202', '1', 'admin', '2016-07-07 12:03:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('203', '1', 'admin', '2016-07-07 13:19:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('204', '1', 'admin', '2016-07-07 13:52:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('205', '1', 'admin', '2016-07-07 13:55:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('206', '1', 'admin', '2016-07-07 14:21:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('207', '8', 'root', '2016-07-07 15:04:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('208', '8', 'root', '2016-07-07 15:07:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('209', '8', 'root', '2016-07-07 15:13:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('210', '2', 'simple', '2016-07-07 15:15:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('211', '2', 'simple', '2016-07-07 15:18:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('212', '1', 'admin', '2016-07-07 15:19:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('213', '1', 'admin', '2016-07-07 16:24:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('214', '1', 'admin', '2016-07-07 18:18:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('215', '1', 'admin', '2016-07-08 08:42:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('216', '8', 'root', '2016-07-08 08:58:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('217', '8', 'root', '2016-07-08 09:11:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('218', '8', 'root', '2016-07-08 09:32:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('219', '1', 'admin', '2016-07-08 10:42:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('220', '8', 'root', '2016-07-08 10:44:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('221', '8', 'root', '2016-07-08 10:53:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('222', '8', 'root', '2016-07-08 10:54:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('223', '8', 'root', '2016-07-08 10:54:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('224', '1', 'admin', '2016-07-08 10:55:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('225', '1', 'admin', '2016-07-08 11:18:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('226', '8', 'root', '2016-07-08 11:19:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('227', '1', 'admin', '2016-07-08 11:19:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('228', '1', 'admin', '2016-07-08 14:24:35', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('229', '1', 'admin', '2016-07-08 14:31:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('230', '1', 'admin', '2016-07-08 14:39:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('231', '1', 'admin', '2016-07-08 14:50:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('232', '1', 'admin', '2016-07-08 14:54:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('233', '1', 'admin', '2016-07-08 15:32:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('234', '1', 'admin', '2016-07-08 15:38:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('235', '1', 'admin', '2016-07-08 16:39:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('236', '8', 'root', '2016-07-08 17:28:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('237', '1', 'admin', '2016-07-08 17:28:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('238', '1', 'admin', '2016-07-10 11:15:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('239', '1', 'admin', '2016-07-10 12:35:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('240', '1', 'admin', '2016-07-10 12:35:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('241', '1', 'admin', '2016-07-10 13:15:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('242', '1', 'admin', '2016-07-10 13:22:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('280', null, null, '2016-07-10 14:12:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('281', null, null, '2016-07-10 14:12:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('282', null, null, '2016-07-10 14:12:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('283', null, null, '2016-07-10 14:36:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('284', null, null, '2016-07-10 14:36:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('285', null, null, '2016-07-10 14:36:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('286', null, null, '2016-07-10 14:36:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('287', null, null, '2016-07-10 14:51:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('288', null, null, '2016-07-10 14:51:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('289', null, null, '2016-07-10 14:51:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('290', null, null, '2016-07-10 14:51:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('291', '1', 'admin', '2016-07-10 14:59:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('292', null, null, '2016-07-10 15:19:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('293', null, null, '2016-07-10 15:19:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('294', null, null, '2016-07-10 15:19:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('295', null, null, '2016-07-10 15:19:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('296', null, null, '2016-07-10 15:25:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('297', null, null, '2016-07-10 15:25:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('298', null, null, '2016-07-10 15:25:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('299', null, null, '2016-07-10 15:25:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('300', null, null, '2016-07-10 15:26:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('301', null, null, '2016-07-10 15:26:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('302', null, null, '2016-07-10 15:26:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('303', null, null, '2016-07-10 15:26:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('304', null, null, '2016-07-10 15:29:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('305', null, null, '2016-07-10 15:29:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('306', null, null, '2016-07-10 15:29:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('307', null, null, '2016-07-10 15:29:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('308', null, null, '2016-07-10 15:29:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('309', null, null, '2016-07-10 15:29:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('310', null, null, '2016-07-10 15:29:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('311', null, null, '2016-07-10 15:29:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('312', null, null, '2016-07-10 15:33:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('313', null, null, '2016-07-10 15:33:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('314', null, null, '2016-07-10 15:33:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('315', null, null, '2016-07-10 15:33:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('316', null, null, '2016-07-10 15:42:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('317', null, null, '2016-07-10 15:42:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('318', null, null, '2016-07-10 15:42:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('319', null, null, '2016-07-10 15:42:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('320', null, null, '2016-07-10 15:42:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('321', null, null, '2016-07-10 15:42:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('322', null, null, '2016-07-10 15:42:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('323', null, null, '2016-07-10 15:42:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('324', '1', null, '2016-07-10 15:55:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('325', '1', null, '2016-07-10 15:56:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('326', '1', null, '2016-07-10 15:56:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('327', '1', null, '2016-07-10 15:56:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('328', '1', 'admin', '2016-07-10 15:56:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('329', '1', 'admin', '2016-07-10 16:36:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('330', '1', 'admin', '2016-07-10 17:12:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('331', '1', 'admin', '2016-07-10 17:58:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('332', '1', 'admin', '2016-07-11 16:46:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('333', '1', 'admin', '2016-07-11 18:43:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('334', '1', 'admin', '2016-07-12 14:06:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('335', '1', 'admin', '2016-07-12 14:07:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('336', '1', 'admin', '2016-07-15 10:31:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('337', '1', 'admin', '2016-07-15 10:36:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('338', '1', 'admin', '2016-07-15 11:54:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('339', '1', 'admin', '2016-07-15 16:39:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('340', '1', 'admin', '2016-07-15 17:14:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('341', '1', 'admin', '2016-07-16 11:44:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('342', '1', 'admin', '2016-07-16 15:47:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('343', '1', 'admin', '2016-07-18 08:41:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('344', '1', 'admin', '2016-07-18 08:46:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('345', '1', 'admin', '2016-07-18 09:17:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('346', '1', 'admin', '2016-07-18 09:19:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('347', '1', 'admin', '2016-07-18 10:57:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('348', '1', 'admin', '2016-07-18 10:59:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('349', '1', 'admin', '2016-07-18 11:07:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('350', '1', 'admin', '2016-07-18 14:38:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('351', '1', 'admin', '2016-07-18 14:45:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('352', '1', 'admin', '2016-07-18 14:50:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('353', '1', 'admin', '2016-07-18 15:13:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('354', '1', 'admin', '2016-07-18 15:18:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('355', '1', 'admin', '2016-07-18 16:12:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('356', '1', 'admin', '2016-07-18 16:13:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('357', '1', 'admin', '2016-07-18 16:49:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('358', '1', 'admin', '2016-07-18 16:50:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('359', '1', 'admin', '2016-07-18 16:55:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('360', '1', 'admin', '2016-07-18 16:56:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('361', '1', 'admin', '2016-07-18 17:33:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('362', '1', 'admin', '2016-07-18 17:49:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('363', '1', 'admin', '2016-07-19 09:26:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('364', '1', 'admin', '2016-07-19 09:34:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('365', '1', 'admin', '2016-07-19 09:42:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('366', '1', 'admin', '2016-07-19 09:56:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('367', '1', 'admin', '2016-07-19 10:02:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('368', '1', 'admin', '2016-07-19 10:46:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('369', '1', 'admin', '2016-07-19 12:49:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('370', '1', 'admin', '2016-07-19 13:37:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('371', '1', 'admin', '2016-07-19 13:42:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('372', '1', 'admin', '2016-07-19 13:51:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('373', '1', 'admin', '2016-07-19 14:44:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('374', '1', 'admin', '2016-07-19 15:40:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('375', '1', 'admin', '2016-07-19 15:45:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('376', '1', 'admin', '2016-07-19 15:55:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('377', '1', 'admin', '2016-07-19 16:04:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('378', '1', 'admin', '2016-07-19 16:44:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('379', '1', 'admin', '2016-07-19 16:49:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('380', '17', 'wqewqeqe', '2016-07-19 16:51:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('381', '1', 'admin', '2016-07-19 16:53:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('382', '1', 'admin', '2016-07-19 18:03:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('383', '1', 'admin', '2016-07-19 18:18:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('384', '1', 'admin', '2016-07-19 18:20:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('385', '1', 'admin', '2016-07-20 16:49:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('386', '1', 'admin', '2016-07-20 16:54:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('387', '1', 'admin', '2016-07-20 17:13:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('388', '1', 'admin', '2016-07-20 17:19:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('389', '1', 'admin', '2016-07-21 14:35:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('390', '1', 'admin', '2016-07-21 15:24:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('391', '1', 'admin', '2016-07-21 16:36:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('392', '1', 'admin', '2016-07-22 08:56:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('393', '1', 'admin', '2016-07-25 18:01:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('394', '1', 'admin', '2016-07-26 09:52:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('395', '1', 'admin', '2016-07-26 12:30:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('396', '1', 'admin', '2016-07-26 14:57:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('397', '1', 'admin', '2016-07-26 15:49:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('398', '1', 'admin', '2016-07-27 11:03:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('399', '1', 'admin', '2016-08-01 14:46:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('400', '1', 'admin', '2016-08-01 15:29:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('401', '1', 'admin', '2016-08-01 18:07:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('402', '1', 'admin', '2016-08-03 09:42:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('403', '1', 'admin', '2016-08-03 10:51:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('404', '1', 'admin', '2016-08-03 11:04:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('405', '1', 'admin', '2016-08-03 11:38:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('406', '1', 'admin', '2016-08-11 13:29:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('407', '1', 'admin', '2016-08-11 13:38:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('408', '1', 'admin', '2016-08-11 14:43:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('409', '1', 'admin', '2016-08-11 15:09:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('410', '1', 'admin', '2016-08-11 15:12:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('411', '1', 'admin', '2016-08-11 15:23:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('412', '1', 'admin', '2016-08-11 16:21:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('413', '1', 'admin', '2016-08-11 16:43:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('414', '1', 'admin', '2016-08-12 09:55:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('415', '1', 'admin', '2016-08-12 10:01:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('416', '18', 'seeAll', '2016-08-15 13:35:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('417', '1', 'admin', '2016-08-15 13:58:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('418', '34', 'tttttt', '2016-08-15 16:57:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('419', '35', 'xxxxxx', '2016-08-15 16:59:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('420', '42', 'kkkkkkg', '2016-08-16 09:40:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('421', '1', 'admin', '2016-08-16 11:30:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('422', '42', 'kkkkkkg', '2016-08-16 11:59:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('423', '42', 'kkkkkkg', '2016-08-16 12:03:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('424', '42', 'kkkkkkg', '2016-08-16 12:06:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('425', '1', 'admin', '2016-08-16 12:13:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('426', '1', 'admin', '2016-08-16 14:30:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('427', '42', 'kkkkkkg', '2016-08-16 15:36:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('428', '1', 'admin', '2016-08-17 10:49:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('429', '1', 'admin', '2016-08-17 10:49:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('430', '1', 'admin', '2016-08-17 10:49:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('431', '1', 'admin', '2016-08-17 10:49:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('432', '1', 'admin', '2016-08-17 10:50:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('433', '1', 'admin', '2016-08-17 10:50:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('434', '1', 'admin', '2016-08-17 10:50:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('435', '1', 'admin', '2016-08-17 10:50:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('436', '1', 'admin', '2016-08-17 10:51:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('437', '1', 'admin', '2016-08-17 10:51:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('438', '1', 'admin', '2016-08-17 10:51:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('439', '1', 'admin', '2016-08-17 10:51:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('440', '1', 'admin', '2016-08-17 10:52:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('441', '1', 'admin', '2016-08-17 10:52:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('442', '1', 'admin', '2016-08-17 10:52:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('443', '1', 'admin', '2016-08-17 10:52:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('444', '1', 'admin', '2016-08-17 10:57:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('445', '1', 'admin', '2016-08-17 10:57:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('446', '1', 'admin', '2016-08-17 10:57:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('447', '1', 'admin', '2016-08-17 10:57:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('448', '1', 'admin', '2016-08-17 11:00:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('449', '1', 'admin', '2016-08-17 11:00:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('450', '1', 'admin', '2016-08-17 11:00:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('451', '1', 'admin', '2016-08-17 11:01:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('452', '1', 'admin', '2016-08-17 11:02:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('453', '1', 'admin', '2016-08-17 11:02:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('454', '1', 'admin', '2016-08-17 11:02:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('455', '1', 'admin', '2016-08-17 11:02:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('456', '1', 'admin', '2016-08-17 11:03:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('457', '1', 'admin', '2016-08-17 11:03:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('458', '1', 'admin', '2016-08-17 11:03:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('459', '1', 'admin', '2016-08-17 11:03:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('460', '1', 'admin', '2016-08-17 11:06:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('461', '1', 'admin', '2016-08-17 11:10:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('462', '1', 'admin', '2016-08-17 11:27:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('463', '1', 'admin', '2016-08-17 11:59:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('464', '1', 'admin', '2016-08-17 11:59:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('465', '1', 'admin', '2016-08-17 11:59:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('466', '1', 'admin', '2016-08-17 11:59:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('467', '1', 'admin', '2016-08-17 12:02:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('468', '1', 'admin', '2016-08-17 12:02:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('469', '1', 'admin', '2016-08-17 12:02:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('470', '1', 'admin', '2016-08-17 12:02:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('471', '1', 'admin', '2016-08-17 12:10:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('472', '1', 'admin', '2016-08-17 16:38:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('473', '1', 'admin', '2016-08-17 16:47:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('474', '1', 'admin', '2016-08-17 16:47:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('475', '1', 'admin', '2016-08-17 16:47:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('476', '1', 'admin', '2016-08-17 16:47:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('477', '1', 'admin', '2016-08-17 16:49:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('478', '1', 'admin', '2016-08-17 16:49:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('479', '1', 'admin', '2016-08-17 16:49:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('480', '1', 'admin', '2016-08-17 16:49:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('481', '1', 'admin', '2016-08-17 17:30:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('482', '1', 'admin', '2016-08-17 17:30:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('483', '1', 'admin', '2016-08-17 17:30:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('484', '1', 'admin', '2016-08-17 17:30:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('485', '1', 'admin', '2016-08-17 17:35:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('486', '1', 'admin', '2016-08-17 17:35:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('487', '1', 'admin', '2016-08-17 17:35:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('488', '1', 'admin', '2016-08-17 17:35:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('489', '1', 'admin', '2016-08-17 17:35:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('490', '1', 'admin', '2016-08-17 17:35:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('491', '1', 'admin', '2016-08-17 17:35:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('492', '1', 'admin', '2016-08-17 17:35:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('493', '1', 'admin', '2016-08-17 17:40:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('494', '1', 'admin', '2016-08-17 17:40:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('495', '1', 'admin', '2016-08-17 17:40:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('496', '1', 'admin', '2016-08-17 17:40:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('497', '1', 'admin', '2016-08-17 17:41:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('498', '1', 'admin', '2016-08-17 17:41:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('499', '1', 'admin', '2016-08-17 17:41:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('500', '1', 'admin', '2016-08-17 17:41:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('501', '1', 'admin', '2016-08-17 17:49:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('502', '1', 'admin', '2016-08-17 17:49:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('503', '1', 'admin', '2016-08-17 17:49:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('504', '1', 'admin', '2016-08-17 17:49:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('505', '1', 'admin', '2016-08-17 17:50:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('506', '1', 'admin', '2016-08-17 17:50:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('507', '1', 'admin', '2016-08-17 17:50:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('508', '1', 'admin', '2016-08-17 17:50:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('509', '1', 'admin', '2016-08-17 17:57:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('510', '1', 'admin', '2016-08-17 17:57:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('511', '1', 'admin', '2016-08-17 17:57:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('512', '1', 'admin', '2016-08-17 17:57:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('513', '1', 'admin', '2016-08-17 17:59:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('514', '1', 'admin', '2016-08-17 18:02:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('515', '1', 'admin', '2016-08-17 18:02:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('516', '1', 'admin', '2016-08-17 18:03:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('517', '1', 'admin', '2016-08-17 18:05:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('518', '1', 'admin', '2016-08-17 18:11:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('519', '1', 'admin', '2016-08-17 18:12:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('520', '1', 'admin', '2016-08-17 18:12:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('521', '43', 'lklklk', '2016-08-17 18:16:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('522', '1', 'admin', '2016-08-18 10:44:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('523', '1', 'admin', '2016-08-18 11:00:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('524', '44', 'dsdsds', '2016-08-18 11:10:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('525', '44', 'dsdsds', '2016-08-18 11:40:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('526', '1', 'admin', '2016-08-18 14:56:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('527', '1', 'admin', '2016-08-18 16:06:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('528', '1', 'admin', '2016-08-19 11:58:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('529', '1', 'admin', '2016-08-19 16:36:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('530', '1', 'admin', '2016-08-22 10:07:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('531', '2', 'simple', '2016-08-22 10:36:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('532', '2', 'simple', '2016-08-22 11:26:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('533', '2', 'simple', '2016-08-22 12:24:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('534', '2', 'simple', '2016-08-22 16:13:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('535', '2', 'simple', '2016-08-22 17:58:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('536', '2', 'simple', '2016-08-24 16:31:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('537', '2', 'simple', '2016-08-26 15:51:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('538', '8', 'root', '2016-08-30 16:52:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('539', '1', 'admin', '2016-09-05 10:02:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('540', '2', 'simple', '2016-09-05 10:11:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('541', '1', 'admin', '2016-09-05 10:24:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('542', '42', 'kkkkkkg', '2016-09-05 10:29:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('543', '42', 'kkkkkkg', '2016-09-05 10:47:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('544', '42', 'kkkkkkg', '2016-09-05 11:03:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('545', '42', 'kkkkkkg', '2016-09-05 15:25:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('546', '1', 'admin', '2016-09-05 15:26:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('547', '1', 'admin', '2016-09-05 15:41:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('548', '52', 'gdsqwe', '2016-09-06 18:02:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('549', '1', 'admin', '2016-09-07 13:31:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('550', '54', 'hdfdsfw', '2016-09-07 16:04:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('551', '54', 'hdfdsfw', '2016-09-07 16:42:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('552', '54', 'hdfdsfw', '2016-09-07 16:50:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('553', '1', 'admin', '2016-09-07 17:37:35', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('554', '1', 'admin', '2016-09-08 10:12:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('555', '54', 'hdfdsfw', '2016-09-08 11:43:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('556', '54', 'hdfdsfw', '2016-09-08 14:22:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('557', '1', 'admin', '2016-09-08 14:54:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('558', '1', 'admin', '2016-09-08 16:21:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('559', '1', 'admin', '2016-09-08 16:40:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('560', '1', 'admin', '2016-09-09 10:21:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('561', '1', 'admin', '2016-09-09 16:53:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('562', '1', 'admin', '2016-09-12 11:06:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('563', '1', 'admin', '2016-09-12 11:44:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('564', '1', 'admin', '2016-09-12 14:15:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('565', '1749', 'tianjintest', '2016-09-12 15:04:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('566', '1', 'admin', '2016-10-11 17:20:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('567', '1', 'admin', '2016-10-11 17:27:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('568', '1', 'admin', '2016-10-11 17:32:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('569', '1', 'admin', '2016-10-11 17:33:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('570', '1', 'admin', '2016-10-11 17:35:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('571', '1', 'admin', '2016-10-11 17:35:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('572', '1', 'admin', '2016-10-11 17:35:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('573', '1', 'admin', '2016-10-11 17:39:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('574', '8', 'root', '2016-10-11 17:42:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('575', '8', 'root', '2016-10-11 17:43:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('576', '8', 'root', '2016-10-11 17:45:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('577', '1', 'admin', '2016-10-14 15:17:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('578', '1', 'admin', '2016-10-17 10:00:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('579', '1', 'admin', '2016-10-17 10:06:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('580', '1', 'admin', '2016-10-17 13:51:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('581', '1', 'admin', '2016-10-18 10:56:54', '192.168.5.79');
INSERT INTO `t_userlogin` VALUES ('582', '1', 'admin', '2016-10-18 11:11:13', '192.168.5.79');
INSERT INTO `t_userlogin` VALUES ('583', '1', 'admin', '2016-10-18 11:20:12', '192.168.5.79');
INSERT INTO `t_userlogin` VALUES ('584', '1', 'admin', '2016-12-12 17:36:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('585', '1', 'admin', '2017-03-27 09:29:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('586', '1743', 'ceeadmin', '2017-06-22 10:40:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('587', '1', 'admin', '2017-06-22 12:27:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('588', '1', 'admin', '2017-06-22 12:28:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('589', '1', 'admin', '2017-06-22 12:30:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('590', '1', 'admin', '2017-06-30 11:30:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('591', '1', 'admin', '2017-07-03 09:44:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('592', '1', 'admin', '2017-07-03 09:45:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('593', '1', 'admin', '2017-07-03 09:45:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('594', '1', 'admin', '2017-07-04 10:16:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('595', '1', 'admin', '2017-07-04 11:10:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('596', '1', 'admin', '2017-07-04 11:25:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('597', '1', 'admin', '2017-07-04 11:27:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('598', '1', 'admin', '2017-07-11 16:07:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('599', '1', 'admin', '2017-07-11 16:07:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('600', '1', 'admin', '2017-07-11 16:22:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('601', '1', 'admin', '2017-07-11 17:31:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('602', '1', 'admin', '2017-07-11 17:39:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('603', '1', 'admin', '2017-07-13 14:04:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('604', '1', 'admin', '2017-07-13 15:06:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('605', '1', 'admin', '2017-07-17 11:40:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('606', '1', 'admin', '2017-07-17 11:43:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('607', '1', 'admin', '2017-07-17 12:12:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('608', '1', 'admin', '2017-07-17 12:15:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('609', '1', 'admin', '2017-07-17 12:38:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('610', '1', 'admin', '2017-07-17 12:48:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('611', '1', 'admin', '2017-07-17 14:11:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('612', '1', 'admin', '2017-07-17 14:15:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('613', '1', 'admin', '2017-07-17 14:27:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('614', '1', 'admin', '2017-07-17 15:15:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('615', '1', 'admin', '2017-07-17 15:55:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('616', '1', 'admin', '2017-07-17 16:03:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('617', '1', 'admin', '2017-07-17 16:08:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('618', '1', 'admin', '2017-07-17 16:31:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('619', '1', 'admin', '2017-07-17 16:45:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('620', '1', 'admin', '2017-07-17 17:45:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('621', '1', 'admin', '2017-07-18 09:36:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('622', '1', 'admin', '2017-07-18 10:28:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('623', '1', 'admin', '2017-07-18 10:39:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('624', '1', 'admin', '2017-07-18 10:40:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('625', '1', 'admin', '2017-07-18 10:48:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('626', '1', 'admin', '2017-07-18 12:05:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('627', '1', 'admin', '2017-07-18 13:58:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('628', '1', 'admin', '2017-07-18 14:15:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('629', '2', 'simple', '2017-07-18 14:33:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('630', '2', 'simple', '2017-07-18 16:39:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('631', '1', 'admin', '2017-07-19 15:27:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('632', '1', 'admin', '2017-07-19 15:59:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('633', '1', 'admin', '2017-07-19 16:11:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('634', '1', 'admin', '2017-07-19 16:14:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('635', '1', 'admin', '2017-07-19 16:17:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('636', '1', 'admin', '2017-07-19 16:18:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('637', '1', 'admin', '2017-07-19 16:25:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('638', '1', 'admin', '2017-07-19 16:33:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('639', '1', 'admin', '2017-07-19 16:43:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('640', '1', 'admin', '2017-07-19 16:58:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('641', '1', 'admin', '2017-07-19 16:59:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('642', '1', 'admin', '2017-07-19 17:08:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('643', '1', 'admin', '2017-07-19 17:46:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('644', '1', 'admin', '2017-07-19 17:52:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('645', '1', 'admin', '2017-07-19 17:56:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('646', '1', 'admin', '2017-07-19 18:07:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('647', '1', 'admin', '2017-07-19 18:18:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('648', '1', 'admin', '2017-07-19 18:23:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('649', '1', 'admin', '2017-07-20 09:49:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('650', '1', 'admin', '2017-07-20 10:31:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('651', '2', 'simple', '2017-07-20 10:37:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('652', '2', 'simple', '2017-07-20 11:23:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('653', '2', 'simple', '2017-07-20 11:43:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('654', '1', 'admin', '2017-07-20 12:32:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('655', '1', 'admin', '2017-07-20 14:24:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('656', '1', 'admin', '2017-07-20 15:55:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('657', '1', 'admin', '2017-07-20 17:10:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('658', '1', 'admin', '2017-07-20 17:25:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('659', '1', 'admin', '2017-07-20 17:36:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('660', '1', 'admin', '2017-07-21 09:55:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('661', '1', 'admin', '2017-07-21 10:30:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('662', '1', 'admin', '2017-07-21 11:22:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('663', '1', 'admin', '2017-07-21 14:03:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('664', '1', 'admin', '2017-07-21 14:08:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('665', '1', 'admin', '2017-07-21 14:36:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('666', '1', 'admin', '2017-07-21 14:57:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('667', '1', 'admin', '2017-07-21 15:12:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('668', '1', 'admin', '2017-07-21 16:25:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('669', '1', 'admin', '2017-07-21 17:34:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('670', '1', 'admin', '2017-07-24 09:32:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('671', '1', 'admin', '2017-07-24 14:56:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('672', '1', 'admin', '2017-07-24 16:34:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('673', '1', 'admin', '2017-07-24 16:39:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('674', '1', 'admin', '2017-07-24 16:57:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('675', '1', 'admin', '2017-07-24 17:12:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('676', '1', 'admin', '2017-07-24 17:14:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('677', '1', 'admin', '2017-07-24 17:32:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('678', '1', 'admin', '2017-07-24 17:35:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('679', '1', 'admin', '2017-07-24 17:53:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('680', '1', 'admin', '2017-07-24 18:14:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('681', '1', 'admin', '2017-07-24 18:27:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('682', '1', 'admin', '2017-07-25 09:45:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('683', '1', 'admin', '2017-07-25 11:50:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('684', '1', 'admin', '2017-07-25 11:58:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('685', '1', 'admin', '2017-07-25 13:40:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('686', '1', 'admin', '2017-07-25 13:59:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('687', '1', 'admin', '2017-07-25 15:15:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('688', '1', 'admin', '2017-07-25 15:44:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('689', '1', 'admin', '2017-07-25 17:04:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('690', '1', 'admin', '2017-07-25 17:35:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('691', '1', 'admin', '2017-07-26 09:45:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('692', '1', 'admin', '2017-07-26 10:40:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('693', '1', 'admin', '2017-07-26 11:29:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('694', '1', 'admin', '2017-07-26 11:36:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('695', '1', 'admin', '2017-07-26 11:53:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('696', '1', 'admin', '2017-07-26 11:58:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('697', '1', 'admin', '2017-07-26 12:13:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('698', '1', 'admin', '2017-07-26 12:16:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('699', '3452', 'wangpai2', '2017-07-26 12:47:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('700', '1', 'admin', '2017-07-26 12:49:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('701', '1', 'admin', '2017-07-26 12:50:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('702', '1', 'admin', '2017-07-26 14:19:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('703', '1', 'admin', '2017-07-26 15:12:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('704', '1', 'admin', '2017-07-26 15:14:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('705', '1', 'admin', '2017-07-26 15:33:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('706', '1', 'admin', '2017-07-26 15:34:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('707', '1', 'admin', '2017-07-26 15:34:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('708', '1', 'admin', '2017-07-26 16:12:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('709', '1', 'admin', '2017-07-26 16:41:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('710', '1', 'admin', '2017-07-26 17:03:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('711', '1', 'admin', '2017-07-27 09:57:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('712', '1', 'admin', '2017-07-27 11:02:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('713', '1', 'admin', '2017-07-27 11:10:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('714', '1', 'admin', '2017-07-27 11:16:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('715', '1', 'admin', '2017-07-27 11:33:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('716', '1', 'admin', '2017-07-27 12:09:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('717', '1', 'admin', '2017-07-27 13:55:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('718', '1', 'admin', '2017-07-27 13:55:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('719', '1', 'admin', '2017-07-27 14:22:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('720', '2', 'simple', '2017-07-27 18:00:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('721', '1', 'admin', '2017-07-27 18:00:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('722', '2', 'simple', '2017-07-27 18:01:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('723', '1', 'admin', '2017-07-28 11:53:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('724', '1', 'admin', '2017-07-28 11:53:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('725', '2', 'simple', '2017-07-28 11:54:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('726', '1', 'admin', '2017-07-28 11:59:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('727', '2', 'simple', '2017-07-28 12:24:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('728', '1', 'admin', '2017-07-28 12:25:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('729', '2', 'simple', '2017-07-28 12:26:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('730', '2', 'simple', '2017-07-28 12:38:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('731', '1', 'admin', '2017-07-28 12:41:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('732', '1', 'admin', '2017-07-28 14:14:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('733', '1', 'admin', '2017-07-28 14:14:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('734', '1', 'admin', '2017-07-28 14:15:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('735', '2', 'simple', '2017-07-28 14:15:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('736', '2', 'simple', '2017-07-28 14:27:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('737', '2', 'simple', '2017-07-28 14:35:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('738', '2', 'simple', '2017-07-28 15:14:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('739', '2', 'simple', '2017-07-28 15:31:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('740', '2', 'simple', '2017-07-28 16:36:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('741', '2', 'simple', '2017-07-28 16:40:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('742', '2', 'simple', '2017-07-28 16:48:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('743', '2', 'simple', '2017-07-28 16:54:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('744', '2', 'simple', '2017-07-28 16:56:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('745', '2', 'simple', '2017-07-28 17:01:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('746', '2', 'simple', '2017-07-28 17:03:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('747', '2', 'simple', '2017-07-28 17:04:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('748', '2', 'simple', '2017-07-28 17:19:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('749', '2', 'simple', '2017-07-28 17:20:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('750', '2', 'simple', '2017-07-28 17:21:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('751', '2', 'simple', '2017-07-28 17:23:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('752', '2', 'simple', '2017-07-28 17:26:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('753', '2', 'simple', '2017-07-28 17:59:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('754', '1', 'admin', '2017-07-31 09:23:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('755', '2', 'simple', '2017-07-31 09:31:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('756', '2', 'simple', '2017-07-31 09:46:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('757', '2', 'simple', '2017-07-31 10:25:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('758', '2', 'simple', '2017-07-31 10:28:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('759', '2', 'simple', '2017-07-31 10:33:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('760', '2', 'simple', '2017-07-31 10:36:14', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('761', '2', 'simple', '2017-07-31 10:41:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('762', '2', 'simple', '2017-07-31 10:42:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('763', '2', 'simple', '2017-07-31 10:46:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('764', '2', 'simple', '2017-07-31 10:52:35', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('765', '2', 'simple', '2017-07-31 10:53:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('766', '2', 'simple', '2017-07-31 11:03:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('767', '2', 'simple', '2017-07-31 11:06:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('768', '1', 'admin', '2017-07-31 11:09:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('769', '1', 'admin', '2017-07-31 11:24:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('770', '1', 'admin', '2017-07-31 11:48:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('771', '1', 'admin', '2017-07-31 11:53:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('772', '1', 'admin', '2017-07-31 16:22:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('773', '1', 'admin', '2017-08-01 12:02:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('774', '2', 'simple', '2017-08-01 12:12:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('775', '2', 'simple', '2017-08-01 12:13:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('776', '2', 'simple', '2017-08-01 12:17:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('777', '1', 'admin', '2017-08-01 12:23:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('778', '1', 'admin', '2017-08-01 12:23:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('779', '1', 'admin', '2017-08-01 12:24:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('780', '1', 'admin', '2017-08-01 12:29:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('781', '1', 'admin', '2017-08-01 12:30:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('782', '1', 'admin', '2017-08-01 12:34:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('783', '1', 'admin', '2017-08-01 13:49:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('784', '1', 'admin', '2017-08-01 13:51:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('785', '1', 'admin', '2017-08-01 13:51:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('786', '1', 'admin', '2017-08-01 14:07:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('787', '1', 'admin', '2017-08-01 14:08:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('788', '1', 'admin', '2017-08-01 14:08:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('789', '1', 'admin', '2017-08-01 14:34:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('790', '1', 'admin', '2017-08-01 14:37:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('791', '1', 'admin', '2017-08-01 14:37:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('792', '1', 'admin', '2017-08-01 14:37:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('793', '1', 'admin', '2017-08-01 14:37:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('794', '1', 'admin', '2017-08-01 14:39:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('795', '1', 'admin', '2017-08-01 14:40:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('796', '1', 'admin', '2017-08-01 14:40:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('797', '1', 'admin', '2017-08-01 14:46:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('798', '1', 'admin', '2017-08-01 14:51:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('799', '1', 'admin', '2017-08-01 14:51:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('800', '1', 'admin', '2017-08-01 14:51:16', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('801', '1', 'admin', '2017-08-01 14:51:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('802', '1', 'admin', '2017-08-01 14:54:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('803', '1', 'admin', '2017-08-01 16:23:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('804', '1', 'admin', '2017-08-01 16:23:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('805', '1', 'admin', '2017-08-01 16:24:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('806', '1', 'admin', '2017-08-01 16:30:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('807', '1', 'admin', '2017-08-01 17:04:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('808', '1', 'admin', '2017-08-01 17:07:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('809', '1', 'admin', '2017-08-01 17:07:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('810', '1', 'admin', '2017-08-01 17:07:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('811', '1', 'admin', '2017-08-01 17:08:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('812', '1', 'admin', '2017-08-01 17:13:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('813', '1', 'admin', '2017-08-01 17:14:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('814', '1', 'admin', '2017-08-01 17:17:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('815', '1', 'admin', '2017-08-01 17:17:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('816', '1', 'admin', '2017-08-01 17:24:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('817', '1', 'admin', '2017-08-01 17:39:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('818', '2', 'simple', '2017-08-03 14:45:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('819', '2', 'simple', '2017-08-03 14:48:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('820', '2', 'simple', '2017-08-03 14:48:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('821', '1', 'admin', '2017-08-07 13:33:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('822', '1', 'admin', '2017-08-08 11:27:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('823', '1', 'admin', '2017-08-08 11:49:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('824', '2', 'simple', '2017-08-08 12:15:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('825', '1', 'admin', '2017-08-08 12:29:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('826', '1', 'admin', '2017-08-11 12:13:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('827', '1', 'admin', '2017-08-11 12:18:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('828', '1', 'admin', '2017-08-14 10:19:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('829', '1', 'admin', '2017-08-21 17:31:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('830', '1', 'admin', '2017-08-21 17:45:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('831', '1', 'admin', '2017-08-21 17:45:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('832', '1', 'admin', '2017-08-21 18:05:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('833', '1', 'admin', '2017-08-22 10:14:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('834', '1', 'admin', '2017-08-22 10:58:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('835', '1', 'admin', '2017-08-22 11:52:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('836', '1', 'admin', '2017-08-22 12:07:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('837', '1', 'admin', '2017-08-22 12:13:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('838', '1', 'admin', '2017-08-22 13:04:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('839', '1', 'admin', '2017-08-22 15:09:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('840', '1', 'admin', '2017-08-22 15:15:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('841', '1', 'admin', '2017-08-22 15:45:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('842', '1', 'admin', '2017-08-22 16:17:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('843', '1', 'admin', '2017-08-22 16:19:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('844', '1', 'admin', '2017-08-22 16:26:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('845', '1', 'admin', '2017-08-22 16:32:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('846', '1', 'admin', '2017-08-22 17:34:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('847', '1', 'admin', '2017-08-22 18:14:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('848', '1', 'admin', '2017-08-23 10:12:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('849', '1', 'admin', '2017-08-23 11:51:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('850', '3460', 'asddsa', '2017-08-23 12:06:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('851', '3461', 'qwesad', '2017-08-23 15:34:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('852', '3462', 'qwsdfs', '2017-08-23 15:36:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('853', '3463', 'weqwqe', '2017-08-23 15:59:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('854', '1', 'admin', '2017-08-24 10:01:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('855', '1', 'admin', '2017-08-24 11:56:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('856', '1', 'admin', '2017-08-24 17:41:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('857', '1', 'admin', '2017-08-24 18:04:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('858', '1', 'admin', '2017-08-25 10:38:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('859', '1', 'admin', '2017-08-25 10:54:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('860', '1', 'admin', '2017-08-25 10:54:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('861', '1', 'admin', '2017-08-25 11:11:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('862', '1', 'admin', '2017-08-25 11:37:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('863', '1', 'admin', '2017-08-25 14:05:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('864', '1', 'admin', '2017-09-04 10:11:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('865', '1', 'admin', '2017-09-04 10:15:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('866', '1', 'admin', '2017-09-04 12:18:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('867', '1', 'admin', '2017-09-04 14:10:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('868', '1', 'admin', '2017-09-04 14:12:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('869', '1', 'admin', '2017-09-05 10:10:40', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('870', '3458', 'shiyanjun', '2017-09-13 10:07:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('871', '3458', 'shiyanjun', '2017-09-13 10:13:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('872', '3458', 'shiyanjun', '2017-09-13 10:13:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('873', '3458', 'shiyanjun', '2017-09-13 10:17:09', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('874', '3458', 'shiyanjun', '2017-09-13 10:46:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('875', '3458', 'shiyanjun', '2017-09-13 11:02:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('876', '3458', 'shiyanjun', '2017-09-13 11:09:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('877', '3464', 'zhanghu', '2017-09-13 11:41:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('878', '3465', 'sunnan', '2017-09-13 11:42:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('879', '3465', 'sunnan', '2017-09-13 11:52:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('880', '3458', 'shiyanjun', '2017-09-19 12:07:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('881', '3458', 'shiyanjun', '2017-09-19 12:08:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('882', '3458', 'shiyanjun', '2017-09-19 12:08:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('883', '3458', 'shiyanjun', '2017-09-19 12:12:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('884', '1', 'admin', '2017-09-21 14:31:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('885', '1', 'admin', '2017-09-21 17:18:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('886', '1', 'admin', '2017-09-21 17:40:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('887', '1', 'admin', '2017-09-21 17:46:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('888', '1', 'admin', '2017-09-21 17:47:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('889', '1', 'admin', '2017-09-21 17:50:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('890', '1', 'admin', '2017-09-21 17:51:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('891', '1', 'admin', '2017-09-21 17:57:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('892', '1', 'admin', '2017-09-21 18:01:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('893', '1', 'admin', '2017-09-21 18:02:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('894', '1', 'admin', '2017-09-22 09:54:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('895', '1', 'admin', '2017-09-22 10:19:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('896', '1', 'admin', '2017-09-22 10:23:00', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('897', '1', 'admin', '2017-09-22 10:40:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('898', '1', 'admin', '2017-09-22 11:04:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('899', '1', 'admin', '2017-09-22 11:24:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('900', '1', 'admin', '2017-09-22 11:24:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('901', '1', 'admin', '2017-09-22 12:13:12', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('902', '1', 'admin', '2017-09-22 12:19:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('903', '1', 'admin', '2017-09-22 12:21:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('904', '1', 'admin', '2017-09-22 12:26:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('905', '1', 'admin', '2017-09-22 12:29:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('906', '1', 'admin', '2017-09-22 12:33:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('907', '1', 'admin', '2017-09-22 12:42:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('908', '1', 'admin', '2017-09-22 12:44:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('909', '1', 'admin', '2017-09-22 14:26:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('910', '1', 'admin', '2017-09-22 14:34:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('911', '1', 'admin', '2017-09-22 14:36:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('912', '1', 'admin', '2017-09-22 15:01:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('913', '1', 'admin', '2017-09-22 15:04:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('914', '1', 'admin', '2017-09-22 15:06:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('915', '1', 'admin', '2017-09-22 15:13:51', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('916', '1', 'admin', '2017-09-22 15:15:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('917', '1', 'admin', '2017-09-22 15:17:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('918', '1', 'admin', '2017-09-22 15:34:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('919', '1', 'admin', '2017-09-22 15:44:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('920', '1', 'admin', '2017-09-22 15:46:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('921', '1', 'admin', '2017-09-22 15:53:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('922', '1', 'admin', '2017-09-22 15:58:13', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('923', '1', 'admin', '2017-09-22 16:03:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('924', '1', 'admin', '2017-09-22 16:07:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('925', '1', 'admin', '2017-09-22 16:11:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('926', '1', 'admin', '2017-09-22 16:29:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('927', '1', 'admin', '2017-09-22 16:29:43', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('928', '1', 'admin', '2017-09-22 16:46:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('929', '1', 'admin', '2017-09-22 17:30:10', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('930', '1', 'admin', '2017-09-22 17:38:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('931', '1', 'admin', '2017-09-22 17:47:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('932', '1', 'admin', '2017-09-22 17:52:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('933', '1', 'admin', '2017-09-22 17:54:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('934', '1', 'admin', '2017-09-22 18:02:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('935', '1', 'admin', '2017-09-25 09:59:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('936', '1', 'admin', '2017-09-25 10:13:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('937', '1', 'admin', '2017-09-25 10:25:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('938', '1', 'admin', '2017-09-25 10:31:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('939', '1', 'admin', '2017-09-25 15:28:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('940', '1', 'admin', '2017-09-25 15:36:36', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('941', '1', 'admin', '2017-09-25 15:46:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('942', '1', 'admin', '2017-09-25 15:49:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('943', '1', 'admin', '2017-09-25 16:03:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('944', '1', 'admin', '2017-09-25 16:37:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('945', '1', 'admin', '2017-09-25 17:00:46', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('946', '1', 'admin', '2017-09-25 17:11:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('947', '1', 'admin', '2017-09-25 17:16:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('948', '1', 'admin', '2017-09-26 09:59:38', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('949', '1', 'admin', '2017-09-26 10:00:05', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('950', '1', 'admin', '2017-09-26 10:00:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('951', '1', 'admin', '2017-09-26 10:02:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('952', '1', 'admin', '2017-09-26 10:05:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('953', '1', 'admin', '2017-09-26 10:05:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('954', '1', 'admin', '2017-09-26 10:09:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('955', '1', 'admin', '2017-09-26 10:18:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('956', '1', 'admin', '2017-09-26 10:36:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('957', '1', 'admin', '2017-09-26 10:37:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('958', '1', 'admin', '2017-09-26 11:14:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('959', '3438', 'ceshi2', '2017-09-26 11:43:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('960', '1', 'admin', '2017-09-26 15:25:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('961', '1', 'admin', '2017-09-26 15:27:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('962', '1', 'admin', '2017-09-26 15:27:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('963', '1', 'admin', '2017-09-26 15:28:54', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('964', '1', 'admin', '2017-09-26 15:33:22', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('965', '1', 'admin', '2017-09-26 15:43:20', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('966', '1', 'admin', '2017-09-27 10:09:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('967', '1', 'admin', '2017-09-27 11:10:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('968', '1', 'admin', '2017-09-27 16:18:59', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('969', '1', 'admin', '2017-09-27 16:24:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('970', '1', 'admin', '2017-09-27 16:28:03', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('971', '1', 'admin', '2017-09-27 17:24:47', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('972', '1', 'admin', '2017-10-09 10:20:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('973', '1', 'admin', '2017-10-09 10:53:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('974', '1', 'admin', '2017-10-09 11:03:41', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('975', '1', 'admin', '2017-10-09 11:06:08', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('976', '1', 'admin', '2017-10-09 11:08:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('977', '1', 'admin', '2017-10-09 11:10:23', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('978', '1', 'admin', '2017-10-09 11:12:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('979', '1', 'admin', '2017-10-09 11:16:52', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('980', '1', 'admin', '2017-10-09 11:18:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('981', '1', 'admin', '2017-10-09 11:21:19', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('982', '1', 'admin', '2017-10-09 11:23:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('983', '1', 'admin', '2017-10-09 11:58:56', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('984', '1', 'admin', '2017-10-09 14:46:06', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('985', '1', 'admin', '2017-10-09 14:46:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('986', '2', 'zhangxd', '2017-10-09 14:51:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('987', '2', 'zhangxd', '2017-10-09 15:01:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('988', '1', 'admin', '2017-10-09 15:07:25', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('989', '1', 'admin', '2017-10-09 15:43:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('990', '1', 'admin', '2017-10-09 15:48:57', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('991', '1', 'admin', '2017-10-09 15:55:15', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('992', '1', 'admin', '2017-10-09 16:06:44', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('993', '1', 'admin', '2017-10-09 16:13:34', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('994', '1', 'admin', '2017-10-09 16:20:45', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('995', '1', 'admin', '2017-10-09 16:23:55', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('996', '1', 'admin', '2017-10-09 16:31:37', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('997', '1', 'admin', '2017-10-09 16:54:29', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('998', '1', 'admin', '2017-10-09 17:14:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('999', '1', 'admin', '2017-10-09 17:20:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1000', '1', 'admin', '2017-10-09 17:21:07', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1001', '1', 'admin', '2017-10-09 17:24:58', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1002', '1', 'admin', '2017-10-09 17:25:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1003', '1', 'admin', '2017-10-09 17:33:11', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1004', '2', 'zhangxd', '2017-10-09 17:33:35', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1005', '2', 'zhangxd', '2017-10-09 17:58:02', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1006', '2', 'zhangxd', '2017-10-09 17:59:42', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1007', '2', 'zhangxd', '2017-10-09 18:02:27', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1008', '2', 'zhangxd', '2017-10-09 18:03:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1009', '1', 'admin', '2017-10-17 10:49:30', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1010', '1', 'admin', '2017-10-17 15:09:32', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1011', '1', 'admin', '2017-10-17 15:11:26', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1012', '1', 'admin', '2017-10-17 15:14:24', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1013', '1', 'admin', '2017-10-17 15:19:48', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1014', '1', 'admin', '2017-10-17 15:25:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1015', '1', 'admin', '2017-10-17 15:29:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1016', '1', 'admin', '2017-10-17 15:33:21', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1017', '1', 'admin', '2017-10-17 16:40:49', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1018', '1', 'admin', '2017-10-17 16:52:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1019', '1', 'admin', '2017-10-17 17:50:04', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1020', '1', 'admin', '2017-10-18 09:53:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1021', '1', 'admin', '2017-10-18 10:17:53', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1022', '1', 'admin', '2017-10-18 10:45:18', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1023', '1', 'admin', '2017-10-18 10:46:50', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1024', '1', 'admin', '2017-10-18 10:50:17', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1025', '1', 'admin', '2017-10-18 10:57:33', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1026', '1', 'admin', '2017-10-18 12:16:01', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1027', '1', 'admin', '2017-10-20 15:02:31', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1028', '1', 'admin', '2017-10-20 16:21:39', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1029', '1', 'admin', '2017-10-20 17:06:28', '127.0.0.1');
INSERT INTO `t_userlogin` VALUES ('1030', '1', 'admin', '2017-10-20 17:22:14', '127.0.0.1');

-- ----------------------------
-- Table structure for t_user_card
-- ----------------------------
DROP TABLE IF EXISTS `t_user_card`;
CREATE TABLE `t_user_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `cardId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_user_card
-- ----------------------------
INSERT INTO `t_user_card` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');

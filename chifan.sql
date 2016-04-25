/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : chifan

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-04-25 16:56:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge
-- ----------------------------

-- ----------------------------
-- Table structure for main_order
-- ----------------------------
DROP TABLE IF EXISTS `main_order`;
CREATE TABLE `main_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(11,0) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of main_order
-- ----------------------------
INSERT INTO `main_order` VALUES ('7', '40', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('8', '55', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('9', '40', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('10', '40', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('11', '0', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('12', '0', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('13', '10', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('14', '1', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('15', '1', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('16', '1', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('17', '20', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('18', '10', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('19', '1', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('20', '1', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('21', '10', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('22', '10', '1', '2016-04-25');
INSERT INTO `main_order` VALUES ('23', '40', '0', '2016-04-25');
INSERT INTO `main_order` VALUES ('24', '40', '0', '2016-04-25');

-- ----------------------------
-- Table structure for theorder
-- ----------------------------
DROP TABLE IF EXISTS `theorder`;
CREATE TABLE `theorder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '0 充值 1 消费',
  `Number` double(11,2) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `MainID` int(255) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of theorder
-- ----------------------------
INSERT INTO `theorder` VALUES ('19', '10.00', '呵呵呵', '7', '0');
INSERT INTO `theorder` VALUES ('20', '10.00', '呸呸呸', '7', '0');
INSERT INTO `theorder` VALUES ('21', '10.00', '解决', '7', '0');
INSERT INTO `theorder` VALUES ('22', '10.00', 'hh', '7', '0');
INSERT INTO `theorder` VALUES ('23', '20.00', '呵呵呵', '8', '0');
INSERT INTO `theorder` VALUES ('24', '10.00', '呸呸呸', '8', '0');
INSERT INTO `theorder` VALUES ('25', '15.00', '解决', '8', '0');
INSERT INTO `theorder` VALUES ('26', '10.00', 'hh', '8', '0');
INSERT INTO `theorder` VALUES ('27', '10.00', '呵呵呵', '9', '0');
INSERT INTO `theorder` VALUES ('28', '10.00', '呸呸呸', '9', '0');
INSERT INTO `theorder` VALUES ('29', '10.00', '解决', '9', '0');
INSERT INTO `theorder` VALUES ('30', '10.00', 'hh', '9', '0');
INSERT INTO `theorder` VALUES ('31', '10.00', '呵呵呵', '10', '0');
INSERT INTO `theorder` VALUES ('32', '10.00', '呸呸呸', '10', '0');
INSERT INTO `theorder` VALUES ('33', '10.00', '解决', '10', '0');
INSERT INTO `theorder` VALUES ('34', '10.00', 'hh', '10', '0');
INSERT INTO `theorder` VALUES ('39', '0.00', '呵呵呵', '16', '1');
INSERT INTO `theorder` VALUES ('40', '0.00', '呸呸呸', '16', '1');
INSERT INTO `theorder` VALUES ('41', '0.00', '解决', '16', '1');
INSERT INTO `theorder` VALUES ('42', '0.00', 'hh', '16', '1');
INSERT INTO `theorder` VALUES ('43', '5.00', '呵呵呵', '17', '1');
INSERT INTO `theorder` VALUES ('44', '5.00', '呸呸呸', '17', '1');
INSERT INTO `theorder` VALUES ('45', '5.00', '解决', '17', '1');
INSERT INTO `theorder` VALUES ('46', '5.00', 'hh', '17', '1');
INSERT INTO `theorder` VALUES ('47', '2.50', '呵呵呵', '18', '1');
INSERT INTO `theorder` VALUES ('48', '2.50', '呸呸呸', '18', '1');
INSERT INTO `theorder` VALUES ('49', '2.50', '解决', '18', '1');
INSERT INTO `theorder` VALUES ('50', '2.50', 'hh', '18', '1');
INSERT INTO `theorder` VALUES ('51', '0.25', '呵呵呵', '19', '1');
INSERT INTO `theorder` VALUES ('52', '0.25', '呸呸呸', '19', '1');
INSERT INTO `theorder` VALUES ('53', '0.25', '解决', '19', '1');
INSERT INTO `theorder` VALUES ('54', '0.25', 'hh', '19', '1');
INSERT INTO `theorder` VALUES ('55', '0.25', '呵呵呵', '20', '1');
INSERT INTO `theorder` VALUES ('56', '0.25', '呸呸呸', '20', '1');
INSERT INTO `theorder` VALUES ('57', '0.25', '解决', '20', '1');
INSERT INTO `theorder` VALUES ('58', '0.25', 'hh', '20', '1');
INSERT INTO `theorder` VALUES ('59', '2.50', '呵呵呵', '21', '1');
INSERT INTO `theorder` VALUES ('60', '2.50', '呸呸呸', '21', '1');
INSERT INTO `theorder` VALUES ('61', '2.50', '解决', '21', '1');
INSERT INTO `theorder` VALUES ('62', '2.50', 'hh', '21', '1');
INSERT INTO `theorder` VALUES ('63', '2.50', '呵呵呵', '22', '1');
INSERT INTO `theorder` VALUES ('64', '2.50', '呸呸呸', '22', '1');
INSERT INTO `theorder` VALUES ('65', '2.50', '解决', '22', '1');
INSERT INTO `theorder` VALUES ('66', '2.50', 'hh', '22', '1');
INSERT INTO `theorder` VALUES ('67', '10.00', '呵呵呵', '23', '0');
INSERT INTO `theorder` VALUES ('68', '10.00', '呸呸呸', '23', '0');
INSERT INTO `theorder` VALUES ('69', '10.00', '解决', '23', '0');
INSERT INTO `theorder` VALUES ('70', '10.00', 'hh', '23', '0');
INSERT INTO `theorder` VALUES ('71', '10.00', '呵呵呵', '24', '0');
INSERT INTO `theorder` VALUES ('72', '10.00', '呸呸呸', '24', '0');
INSERT INTO `theorder` VALUES ('73', '10.00', '解决', '24', '0');
INSERT INTO `theorder` VALUES ('74', '10.00', 'hh', '24', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '呵呵呵');
INSERT INTO `user` VALUES ('3', '呸呸呸');
INSERT INTO `user` VALUES ('5', '解决');
INSERT INTO `user` VALUES ('7', 'hh');

/*
 Navicat MySQL Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : erweishu

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 12/04/2022 12:52:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `gname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名字',
  `gtypeid` int(11) NULL DEFAULT NULL COMMENT '项目类型id',
  `price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '商品库存',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `sid` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `suid` int(11) NULL DEFAULT NULL COMMENT '商家id',
  `paddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`gid`) USING BTREE,
  UNIQUE INDEX `gonly1`(`gname`) USING BTREE,
  INDEX `gtypeid`(`gtypeid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `suid`(`suid`) USING BTREE,
  CONSTRAINT `gtypeid` FOREIGN KEY (`gtypeid`) REFERENCES `gtype` (`gtypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `shop` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `suid` FOREIGN KEY (`suid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '杜蕾斯001水性聚氨酯避孕套-倍润装', 3, 50.55, 99, '有储精囊，含润滑剂，润滑剂未添加杀精剂，不杀伤精子。', 1, 2, 'img/a.png');
INSERT INTO `goods` VALUES (2, '杜蕾斯凸点螺纹装', 3, 75.20, 99, '异型结构设计，表面有凸点和螺纹，无色透明，有香味', 1, 2, 'img/b.png');
INSERT INTO `goods` VALUES (3, '真美中脉优品laca金色短文胸女美体塑身内衣', 2, 65.00, 29, '骚骚骚，比我的尿还骚', 2, 11, 'img/d.png');
INSERT INTO `goods` VALUES (4, '先进包皮去质器', 4, 288.00, 999, '无一差评，一秒去质', 1, 2, 'img/gebaopi.jpg');
INSERT INTO `goods` VALUES (5, '万熊神油镇店之宝', 4, 980.00, 5, '差也差不多', 1, 2, 'img/wanjia.jpg');
INSERT INTO `goods` VALUES (6, '科比4', 3, 999.00, 5, '万熊推荐谁穿谁好看', 1, 2, 'img/asdas.jpg');
INSERT INTO `goods` VALUES (7, '品牌专供', 2, 89.00, 5, 'PERFECT DIARY/完美日\r\n记小细跟口红0.8g#周迅同款##送女朋友#送\r\n礼推荐#情人节礼物', 1, 2, 'img/ASHDHUOD.jpg');
INSERT INTO `goods` VALUES (8, '进口口罩', 2, 0.10, 5, '独立包装高颜值3D口罩女立体一次性三层防护透气黑白色口罩显脸小', 1, 2, 'img/50600073955d60a304a5623051f4cd5.jpg');

-- ----------------------------
-- Table structure for gtype
-- ----------------------------
DROP TABLE IF EXISTS `gtype`;
CREATE TABLE `gtype`  (
  `gtypeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `gtypename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类型名字',
  PRIMARY KEY (`gtypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gtype
-- ----------------------------
INSERT INTO `gtype` VALUES (1, '单身情趣');
INSERT INTO `gtype` VALUES (2, '情趣衣物');
INSERT INTO `gtype` VALUES (3, '多人运动');
INSERT INTO `gtype` VALUES (4, '工具类');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名字',
  PRIMARY KEY (`sid`) USING BTREE,
  UNIQUE INDEX `only1`(`sname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 'durex');
INSERT INTO `shop` VALUES (2, '品如');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名字',
  `upassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `utypeid` int(11) NULL DEFAULT NULL COMMENT '用户类型id',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `utypeid`(`utypeid`) USING BTREE,
  CONSTRAINT `utypeid` FOREIGN KEY (`utypeid`) REFERENCES `utype` (`utypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', '157194', 1);
INSERT INTO `user` VALUES (2, '花开富贵', '112233', 2);
INSERT INTO `user` VALUES (3, '1', '1', 3);
INSERT INTO `user` VALUES (4, '2', '2', 3);
INSERT INTO `user` VALUES (7, '3', '3', 3);
INSERT INTO `user` VALUES (10, '4', '4', 3);
INSERT INTO `user` VALUES (11, '品如本人', '123456', 2);
INSERT INTO `user` VALUES (22, 'kali', '2002', 1);

-- ----------------------------
-- Table structure for utype
-- ----------------------------
DROP TABLE IF EXISTS `utype`;
CREATE TABLE `utype`  (
  `utypeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户类型id',
  `utypename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型名字',
  PRIMARY KEY (`utypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of utype
-- ----------------------------
INSERT INTO `utype` VALUES (1, '管理员');
INSERT INTO `utype` VALUES (2, '商家');
INSERT INTO `utype` VALUES (3, '普通用户');

SET FOREIGN_KEY_CHECKS = 1;

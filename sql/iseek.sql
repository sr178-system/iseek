/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : iseek

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-10-17 17:39:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `login_name` varchar(64) NOT NULL COMMENT '登录用户名',
  `nick_name` varchar(32) NOT NULL COMMENT '昵称',
  `pass_word` varchar(512) NOT NULL,
  `mobile` varchar(32) NOT NULL COMMENT '手机号码',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `member_expiry_day` datetime DEFAULT NULL COMMENT '会员到期日期',
  `status` int(11) NOT NULL COMMENT '账户状态 0 正常   1被封号',
  `share_compress` int(11) NOT NULL DEFAULT '2' COMMENT '2不共享压缩包  1共享压缩包',
  `share_file_count` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '共享文件个数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_time` datetime NOT NULL COMMENT '用户创建日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

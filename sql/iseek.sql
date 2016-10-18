/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : iseek

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-10-18 13:56:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` bigint(20) NOT NULL,
  `login_name` varchar(64) NOT NULL COMMENT '登录用户名',
  `name` varchar(32) NOT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL COMMENT '1男  2女',
  `pass_word` varchar(512) NOT NULL,
  `status` int(11) NOT NULL COMMENT '账户状态 0 正常   1被封号',
  `power` varchar(6) NOT NULL DEFAULT '0' COMMENT '权限',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_time` datetime NOT NULL COMMENT '用户创建日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------

-- ----------------------------
-- Table structure for charge_config
-- ----------------------------
DROP TABLE IF EXISTS `charge_config`;
CREATE TABLE `charge_config` (
  `fee_per_month` double(5,0) NOT NULL COMMENT '会员月费，一月多少钱',
  `remind_day` int(11) NOT NULL DEFAULT '10' COMMENT '少于这个天数就发送充值提醒'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge_config
-- ----------------------------

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` bigint(20) NOT NULL,
  `hash` varchar(32) NOT NULL COMMENT '文件MD5',
  `name` varchar(512) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1：MP3，2：Wav，3：压缩文件',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `time_span` int(11) NOT NULL DEFAULT '0' COMMENT '可选，音乐时间长度',
  `kbps` int(11) NOT NULL DEFAULT '0' COMMENT '可选，音乐比特率',
  `src_count` int(11) NOT NULL DEFAULT '0' COMMENT '源数量 即该文件关联的用户数量',
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for mobile_verify
-- ----------------------------
DROP TABLE IF EXISTS `mobile_verify`;
CREATE TABLE `mobile_verify` (
  `mobile` varchar(16) NOT NULL,
  `verify_code` varchar(8) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobile_verify
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `new_title` varchar(512) NOT NULL,
  `news_url` varchar(512) NOT NULL,
  `updated_time` datetime NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for news_config
-- ----------------------------
DROP TABLE IF EXISTS `news_config`;
CREATE TABLE `news_config` (
  `id` int(11) NOT NULL,
  `big_picture_url` varchar(255) NOT NULL,
  `small_picture_url` varchar(255) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_config
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `notice_content` varchar(1024) NOT NULL,
  `notice_url` varchar(512) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for payment_log
-- ----------------------------
DROP TABLE IF EXISTS `payment_log`;
CREATE TABLE `payment_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '该笔订单的交易额',
  `befor_vip_time` datetime DEFAULT NULL COMMENT '充值成功前vip到期时间',
  `after_vip_time` datetime DEFAULT NULL COMMENT '充值之后vip到期时间',
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_log
-- ----------------------------

-- ----------------------------
-- Table structure for payment_order
-- ----------------------------
DROP TABLE IF EXISTS `payment_order`;
CREATE TABLE `payment_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '该笔订单的交易额',
  `status` int(11) NOT NULL DEFAULT '0',
  `pay_user_id` int(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `bank_order_id` varchar(128) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_order
-- ----------------------------

-- ----------------------------
-- Table structure for reg_question
-- ----------------------------
DROP TABLE IF EXISTS `reg_question`;
CREATE TABLE `reg_question` (
  `id` int(11) NOT NULL,
  `question` varchar(64) NOT NULL,
  `answer_one` varchar(64) NOT NULL,
  `answer_two` varchar(64) NOT NULL,
  `answer_three` varchar(64) NOT NULL,
  `answer_four` varchar(64) NOT NULL,
  `right_answer` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reg_question
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `login_name` varchar(64) NOT NULL COMMENT '登录用户名',
  `nick_name` varchar(32) NOT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL COMMENT '1男  2女',
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

-- ----------------------------
-- Table structure for user_files
-- ----------------------------
DROP TABLE IF EXISTS `user_files`;
CREATE TABLE `user_files` (
  `user_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `name` varchar(512) NOT NULL COMMENT '文件名',
  `share_dir` varchar(512) NOT NULL COMMENT '文件所在的，软件设置的共享目录，两级目录间用“\\”隔开，路径最后要带上“\\”',
  `sub_dir` varchar(512) NOT NULL COMMENT '软件设置的共享目录之下的相对路径，两级目录间用“\\”隔开，路径最后要带上“\\”',
  UNIQUE KEY `user_id,file_id` (`user_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_files
-- ----------------------------

-- ----------------------------
-- Table structure for user_friends
-- ----------------------------
DROP TABLE IF EXISTS `user_friends`;
CREATE TABLE `user_friends` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `friend_id` bigint(20) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_friends
-- ----------------------------

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1：会员续费或充值成功提醒，2：会员到期提醒，3：公告信息',
  `content` varchar(512) NOT NULL,
  `url` varchar(512) DEFAULT NULL,
  `read_status` int(11) NOT NULL COMMENT '0未读  1已读',
  `created_date` date NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------

-- ----------------------------
-- Table structure for user_notice_status
-- ----------------------------
DROP TABLE IF EXISTS `user_notice_status`;
CREATE TABLE `user_notice_status` (
  `user_id` bigint(20) NOT NULL,
  `notice_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_notice_status
-- ----------------------------

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `version_num` int(11) NOT NULL DEFAULT '0',
  `urlandtype` varchar(1024) NOT NULL COMMENT 'url和类型的字符串  type 1：安装包',
  `update_flag` int(11) NOT NULL COMMENT '1：无需更新，2：非强制更新，3：强制更新',
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version
-- ----------------------------

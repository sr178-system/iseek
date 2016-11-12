/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : iseek

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-11-12 17:20:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录用户名',
  `name` varchar(32) NOT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL COMMENT '1男  2女',
  `pass_word` varchar(512) NOT NULL,
  `status` int(11) NOT NULL COMMENT '账户状态 0 正常   1被封号',
  `power` varchar(16) NOT NULL DEFAULT '0' COMMENT '权限',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_time` datetime NOT NULL COMMENT '用户创建日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '超级管理员2', '2', 'bgdjuOrbj4t2e03T5G1E3v6i+8ittnhktYYTVCY3WYyKJCUWxKs9W+Buw1Mf9lL5', '0', '11110110', '2016-11-12 17:16:58', '2016-11-07 18:03:12');

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
INSERT INTO `charge_config` VALUES ('28', '15');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL COMMENT '文件MD5',
  `name` varchar(512) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1：MP3，2：Wav，3：压缩文件',
  `search_type` int(11) NOT NULL COMMENT '1：音频文件，2：压缩文件 用户搜索优化 ',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `time_span` int(11) NOT NULL DEFAULT '0' COMMENT '可选，音乐时间长度',
  `kbps` int(11) NOT NULL DEFAULT '0' COMMENT '可选，音乐比特率',
  `src_count` int(11) NOT NULL DEFAULT '0' COMMENT '源数量 即该文件关联的用户数量',
  `created_time` datetime NOT NULL,
  `index_hash_type_size_time_span_kbps` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_hash` (`index_hash_type_size_time_span_kbps`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('1', '1', '1', '1', '0', '1', '0', '0', '0', '2016-10-27 12:09:29', '');
INSERT INTO `files` VALUES ('12', 'hash1', '吻别.mp3', '1', '1', '102400', '1500', '80', '1', '2016-11-04 14:04:28', '8A317824B3F1BA6D621CC054FF60F412');
INSERT INTO `files` VALUES ('13', 'hash2', '爱你一万年.wav', '2', '1', '102400', '1500', '80', '1', '2016-11-04 14:04:28', 'F2D4A6AC2614D0E0394E95A79C4FE942');
INSERT INTO `files` VALUES ('14', 'hash3', '一起跳舞.mp3', '1', '1', '102400', '1500', '80', '1', '2016-11-04 14:04:28', '6BE83952783AE00739B80CCEA0520348');
INSERT INTO `files` VALUES ('15', 'hash4', '危城.mp3', '1', '1', '102400', '1500', '80', '1', '2016-11-04 14:04:28', '8EB1FD5B98C995932E434EA8636DBD13');
INSERT INTO `files` VALUES ('16', 'hash5', '工具.zip', '1', '1', '102400', '1500', '80', '0', '2016-11-04 14:04:28', '05279D9EB4F2CFBEFDD712A138611C73');
INSERT INTO `files` VALUES ('19', 'hash5', '工具.zip', '3', '2', '102400', '1500', '80', '1', '2016-11-04 14:12:20', '4F84565C71B708E905DFE87D66D7A5DD');
INSERT INTO `files` VALUES ('20', 'hash6', '吻别6.mp3', '1', '1', '102400', '1500', '80', '1', '2016-11-04 14:19:50', 'A8A24E3364CD076E8562C543F9C78B38');
INSERT INTO `files` VALUES ('21', 'hash7', '爱你一万年7.wav', '2', '1', '102400', '1500', '80', '1', '2016-11-04 14:19:50', 'B41A13D2BA4C4EB083DA5FD3208692D5');
INSERT INTO `files` VALUES ('22', 'hash8', '一起跳舞8.mp3', '1', '1', '102400', '1500', '80', '1', '2016-11-04 14:19:50', '5CACE83F399124F90B6FD26C13EFBF9B');
INSERT INTO `files` VALUES ('23', 'hash9', '危城9.mp3', '1', '1', '102400', '1500', '80', '1', '2016-11-04 14:19:50', '16CA51D5823BED6AE1A0DA2491AA64E2');
INSERT INTO `files` VALUES ('24', 'hash10', '工具10.zip', '3', '2', '102400', '1500', '80', '1', '2016-11-04 14:19:50', '1A3B2913A7965D1DDB2BBBA43E5F256F');

-- ----------------------------
-- Table structure for mobile_verify
-- ----------------------------
DROP TABLE IF EXISTS `mobile_verify`;
CREATE TABLE `mobile_verify` (
  `mobile` varchar(16) NOT NULL,
  `verify_code` varchar(8) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 初始化  1 验证通过 2验证失败',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobile_verify
-- ----------------------------
INSERT INTO `mobile_verify` VALUES ('13507418135', '628522', '0', '2016-11-05 11:56:24', '2016-11-05 11:46:41');
INSERT INTO `mobile_verify` VALUES ('13534277314', '733700', '0', '2016-11-05 11:48:23', '2016-11-04 13:33:51');
INSERT INTO `mobile_verify` VALUES ('15919820372', '118613', '1', '2016-11-05 14:47:26', '2016-10-29 12:02:15');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_title` varchar(512) NOT NULL,
  `news_url` varchar(512) NOT NULL,
  `updated_time` datetime NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '123', 'http://adfasdf.x', '2016-10-19 16:08:10', '2016-10-19 16:08:13');
INSERT INTO `news` VALUES ('2', '456', 'http://sadfasf', '2016-10-19 16:10:59', '2016-10-19 16:11:02');

-- ----------------------------
-- Table structure for news_config
-- ----------------------------
DROP TABLE IF EXISTS `news_config`;
CREATE TABLE `news_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `big_picture_url` varchar(255) NOT NULL,
  `small_picture_url` varchar(255) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_config
-- ----------------------------
INSERT INTO `news_config` VALUES ('1', 'asdf', 'ffff', '2016-10-19 16:11:16');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_content` varchar(1024) NOT NULL,
  `notice_url` varchar(512) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '你好', 'http://www.baidu.com', '2016-11-04 14:22:39');
INSERT INTO `notice` VALUES ('2', '公告2', 'http://www.google.com', '2016-11-04 14:23:32');
INSERT INTO `notice` VALUES ('3', '最新公告内容', 'http://www.google.com', '2016-11-12 17:18:21');
INSERT INTO `notice` VALUES ('4', '最新公告内容2', '', '2016-11-12 17:18:43');

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
  KEY `user_id` (`user_id`),
  KEY `created_time` (`created_time`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
  `pay_user_id` bigint(20) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `bank_order_id` varchar(128) DEFAULT NULL,
  `num` int(64) DEFAULT NULL COMMENT '购买会员的月份数',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_order
-- ----------------------------
INSERT INTO `payment_order` VALUES ('1', 'ISK201611051234571001', '6', '150.00', '0', '0', '0', '', '6', '25', null, '2016-11-05 12:34:57');
INSERT INTO `payment_order` VALUES ('2', 'ISK201611051235311002', '6', '25.00', '0', '0', '0', '', '1', '25', null, '2016-11-05 12:35:32');
INSERT INTO `payment_order` VALUES ('3', 'ISK201611051251211001', '6', '25.00', '1', '0', '1', '2016110521001004480233730337', '1', '25', null, '2016-11-05 12:51:22');

-- ----------------------------
-- Table structure for reg_question
-- ----------------------------
DROP TABLE IF EXISTS `reg_question`;
CREATE TABLE `reg_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(64) NOT NULL,
  `answer_one` varchar(64) NOT NULL,
  `answer_two` varchar(64) NOT NULL,
  `answer_three` varchar(64) NOT NULL,
  `answer_four` varchar(64) NOT NULL,
  `right_answer` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reg_question
-- ----------------------------
INSERT INTO `reg_question` VALUES ('1', '你是男是女？', '男', '女', '是男是女', '非男非女', '4');
INSERT INTO `reg_question` VALUES ('2', '你最喜欢的人是谁？', '凤姐', '芙蓉姐姐', 'TFBOYS', '刘德华', '4');
INSERT INTO `reg_question` VALUES ('3', '你最喜欢的体育项目？', '排球', '篮球', '足球', '游泳', '4');
INSERT INTO `reg_question` VALUES ('4', '杨过和小龙女最后生了几个孩子？', '1个', '2个', '3个', '0个', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录用户名',
  `nick_name` varchar(32) NOT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL COMMENT '1男  2女',
  `pass_word` varchar(512) NOT NULL,
  `mobile` varchar(32) NOT NULL COMMENT '手机号码',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `member_expiry_day` date DEFAULT NULL COMMENT '会员到期日期',
  `status` int(11) NOT NULL COMMENT '账户状态 0 正常   1被封号',
  `share_compress` int(11) NOT NULL DEFAULT '2' COMMENT '2不共享压缩包  1共享压缩包',
  `share_file_count` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '共享文件个数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `transfer_key` varchar(32) DEFAULT NULL COMMENT '上次登录生成的登录key',
  `created_time` datetime NOT NULL COMMENT '用户创建日期',
  PRIMARY KEY (`user_id`),
  KEY `login_name-nick` (`login_name`,`nick_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', 'dogdog7788', '潮哥2', '2', 'mExY8fmqBhwdQCPOwPYxmswu2ES2Nxhdmr5ZFQO8gM6KJCUWxKs9W+Buw1Mf9lL5', '13507418135', 'dogdog7788@qq.com', '2016-12-15', '0', '1', '00000000010', '2016-11-04 13:20:23', 'CAAC92F78774F4BC22DC657FEA7DB748', '2016-11-03 15:11:38');
INSERT INTO `user` VALUES ('10', 'fiona', '小明', '1', 'mExY8fmqBhwdQCPOwPYxmswu2ES2Nxhdmr5ZFQO8gM6KJCUWxKs9W+Buw1Mf9lL5', '15919820372', 'dogdog7788@qq.com', '2016-11-09', '0', '2', '00000000000', null, null, '2016-11-12 14:02:48');
INSERT INTO `user` VALUES ('11', 'fiona2', '22', '2', 'mExY8fmqBhwdQCPOwPYxmswu2ES2Nxhdmr5ZFQO8gM6KJCUWxKs9W+Buw1Mf9lL5', '13534277314', 'service@submsg.cn', '2016-11-09', '0', '2', '00000000000', null, null, '2016-11-12 14:09:23');

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
  `search_type` varchar(128) NOT NULL COMMENT '用户搜索风格类型的字段，取sub_dir第一个斜杠之前的内容 精确搜索',
  `search_zj` varchar(128) NOT NULL COMMENT '用于搜索专辑的关键字  是sub_dir第一个斜杠后面的内容 用户搜索优化，模糊搜索',
  `created_time` datetime NOT NULL,
  UNIQUE KEY `user_id,file_id` (`user_id`,`file_id`),
  KEY `search_type` (`search_type`),
  FULLTEXT KEY `search_zj` (`search_zj`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_files
-- ----------------------------
INSERT INTO `user_files` VALUES ('1', '1', '1', '1', '1', '1', '1', '2016-10-27 12:09:15');
INSERT INTO `user_files` VALUES ('6', '12', '吻别.mp3', '\\我的文档\\我的音乐\\张学友\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '13', '爱你一万年.wav', '\\我的文档\\我的音乐\\刘德华\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '14', '一起跳舞.mp3', '\\我的文档\\我的音乐\\黎明\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '15', '危城.mp3', '\\我的文档\\我的音乐\\郭富城\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '19', '工具.zip', '\\我的文档\\我的音乐\\工具集\\', '工具\\好用的工具\\', '工具', '好用的工具\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '20', '吻别6.mp3', '\\我的文档\\我的音乐\\张学友\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '21', '爱你一万年7.wav', '\\我的文档\\我的音乐\\刘德华\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '22', '一起跳舞8.mp3', '\\我的文档\\我的音乐\\黎明\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '23', '危城9.mp3', '\\我的文档\\我的音乐\\郭富城\\', '流行音乐\\抒情歌曲\\', '流行音乐', '抒情歌曲\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('6', '24', '工具10.zip', '\\我的文档\\我的音乐\\工具集\\', '工具\\好用的工具\\', '工具', '好用的工具\\', '2016-11-04 14:19:50');
INSERT INTO `user_files` VALUES ('7', '24', '工具10.zip', '\\我的文档\\我的音乐\\工具集\\', '工具\\好用的工具\\', '工具', '好用的工具\\', '2016-11-04 14:19:50');

-- ----------------------------
-- Table structure for user_friends
-- ----------------------------
DROP TABLE IF EXISTS `user_friends`;
CREATE TABLE `user_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `friend_id` bigint(20) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id,friend_id` (`user_id`,`friend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_friends
-- ----------------------------
INSERT INTO `user_friends` VALUES ('2', '6', '7', '2016-11-04 14:38:33');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `urlandtype` varchar(1024) NOT NULL COMMENT 'url和类型的字符串  type 1：安装包  url:type|url2:type2以竖线和分号隔开',
  `update_flag` int(11) NOT NULL COMMENT '1：无需更新，2：非强制更新，3：强制更新',
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('2', 'http://akkk.adf/adf.exe@1|http://jdjdjdjd@2', '2');

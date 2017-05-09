/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : iseek

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-09 16:20:50
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '超级管理员2', '2', 'oE8xVlOOZKWa4pWQUjUj7XzrgCzDbVF1THpEhv+BNBI=', '0', '11111111', '2017-05-09 15:56:16', '2016-11-07 18:03:12');
INSERT INTO `admin_user` VALUES ('3', 'dogdog7788', '潮哥', '1', 'oE8xVlOOZKWa4pWQUjUj7XzrgCzDbVF1THpEhv+BNBI=', '0', '10100000', '2016-11-18 16:35:07', '2016-11-17 17:33:26');

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
INSERT INTO `charge_config` VALUES ('28', '18');

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
INSERT INTO `mobile_verify` VALUES ('13507418135', '934208', '0', '2016-12-27 12:28:46', '2016-11-05 11:46:41');
INSERT INTO `mobile_verify` VALUES ('13534277314', '733700', '0', '2016-11-05 11:48:23', '2016-11-04 13:33:51');
INSERT INTO `mobile_verify` VALUES ('15919820372', null, '0', null, '2016-10-29 12:02:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '123', 'http://adfasdf.x', '2016-10-19 16:08:10', '2016-10-19 16:08:13');
INSERT INTO `news` VALUES ('2', '456', 'http://sadfasf', '2016-10-19 16:10:59', '2016-10-19 16:11:02');
INSERT INTO `news` VALUES ('3', '订单的', '打发', '2016-11-15 12:49:45', '2016-11-15 12:49:45');
INSERT INTO `news` VALUES ('4', '新加新闻12', 'http://www.baidu.com.cc', '2016-11-15 12:50:41', '2016-11-15 12:50:41');
INSERT INTO `news` VALUES ('5', '2', '2', '2016-11-15 12:50:56', '2016-11-15 12:50:56');
INSERT INTO `news` VALUES ('6', '3', '4', '2016-11-15 12:50:59', '2016-11-15 12:50:59');
INSERT INTO `news` VALUES ('7', '123', '1231', '2016-11-17 15:55:00', '2016-11-17 15:55:00');
INSERT INTO `news` VALUES ('8', '123', '1231', '2016-11-17 15:55:04', '2016-11-17 15:55:04');
INSERT INTO `news` VALUES ('11', '123', '123', '2016-11-17 15:58:19', '2016-11-17 15:58:19');
INSERT INTO `news` VALUES ('12', '123', '123', '2016-11-17 16:01:37', '2016-11-17 16:01:37');
INSERT INTO `news` VALUES ('13', '123', '123', '2017-03-06 18:28:04', '2017-03-06 18:28:04');
INSERT INTO `news` VALUES ('14', '123', '1234', '2017-03-06 18:28:10', '2017-03-06 18:28:10');
INSERT INTO `news` VALUES ('15', '123', '123', '2017-03-06 18:29:27', '2017-03-06 18:29:27');
INSERT INTO `news` VALUES ('16', '223', '4444', '2017-04-25 12:25:04', '2017-04-25 12:25:04');

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
INSERT INTO `news_config` VALUES ('1', '85f46f26208f4e19.png', 'c36f39664ec7a522.jpg', '2016-10-19 16:11:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '你好', 'http://www.baidu.com', '2016-11-04 14:22:39');
INSERT INTO `notice` VALUES ('2', '公告2', 'http://www.google.com', '2016-11-04 14:23:32');
INSERT INTO `notice` VALUES ('3', '最新公告内容', 'http://www.google.com', '2016-11-12 17:18:21');
INSERT INTO `notice` VALUES ('4', '', '', '2016-11-12 17:18:43');
INSERT INTO `notice` VALUES ('5', '', '', '2017-04-22 12:09:38');
INSERT INTO `notice` VALUES ('6', '213', '', '2017-04-22 12:09:52');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_log
-- ----------------------------
INSERT INTO `payment_log` VALUES ('1', '6', '123123', '25.00', '2016-11-14 18:14:39', '2016-11-14 18:14:58', '2016-11-14 18:14:45');
INSERT INTO `payment_log` VALUES ('2', '10', '123123', '26.00', '2016-11-14 18:14:39', '2016-11-14 18:15:00', '2016-11-14 18:14:45');
INSERT INTO `payment_log` VALUES ('3', '11', '123123', '27.00', '2016-11-14 18:14:39', '2016-11-14 18:15:03', '2016-11-14 18:14:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_order
-- ----------------------------
INSERT INTO `payment_order` VALUES ('1', 'ISK201611051234571001', '6', '150.00', '0', '0', '0', '', '6', '25', null, '2016-11-05 12:34:57');
INSERT INTO `payment_order` VALUES ('2', 'ISK201611051235311002', '6', '25.00', '0', '0', '0', '', '1', '25', null, '2016-11-05 12:35:32');
INSERT INTO `payment_order` VALUES ('3', 'ISK201611051251211001', '6', '25.00', '1', '0', '1', '2016110521001004480233730337', '1', '25', null, '2016-11-05 12:51:22');
INSERT INTO `payment_order` VALUES ('4', 'ISK201704251415241001', '6', '280.00', '0', '0', '0', '', '5', '28', null, '2017-04-25 14:15:25');
INSERT INTO `payment_order` VALUES ('5', 'ISK201704251415391002', '6', '140.00', '0', '0', '0', '', '4', '28', null, '2017-04-25 14:15:40');
INSERT INTO `payment_order` VALUES ('6', 'ISK201704251415481003', '6', '76.00', '0', '0', '0', '', '3', '28', null, '2017-04-25 14:15:49');
INSERT INTO `payment_order` VALUES ('7', 'ISK201704251415541004', '6', '28.00', '0', '0', '0', '', '2', '28', null, '2017-04-25 14:15:55');
INSERT INTO `payment_order` VALUES ('8', 'ISK201704251415591005', '6', '7.00', '0', '0', '0', '', '1', '28', null, '2017-04-25 14:16:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reg_question
-- ----------------------------
INSERT INTO `reg_question` VALUES ('1', '问题一 ：  大部分酒吧DJ台使用的声卡是哪个品牌？', '1、Traktor', '2、M-Audio', '3、Final Scratch', '4、Serato Rane ', '4');
INSERT INTO `reg_question` VALUES ('2', '问题二 ：  S L软件的转盘界面上可以设定几个CUE点？', '1、1个', '2、3个', '3、5个', '4、8个', '3');
INSERT INTO `reg_question` VALUES ('3', '问题三 ： 酒吧DJ台上大部分配备使用的CD播放机是什么品牌？', '1、Pioneer ', '2、Denon ', '3、Numark', '4、VOXOA', '1');

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
  `member_expiry_day` datetime DEFAULT NULL COMMENT '会员到期日期',
  `status` int(11) NOT NULL COMMENT '账户状态 0 正常   1被封号',
  `share_compress` int(11) NOT NULL DEFAULT '2' COMMENT '2不共享压缩包  1共享压缩包',
  `share_file_count` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '共享文件个数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `transfer_key` varchar(32) DEFAULT NULL COMMENT '上次登录生成的登录key',
  `created_time` datetime NOT NULL COMMENT '用户创建日期',
  PRIMARY KEY (`user_id`),
  KEY `login_name-nick` (`login_name`,`nick_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', 'dogdog7788', '潮哥', '1', 'oE8xVlOOZKWa4pWQUjUj7XzrgCzDbVF1THpEhv+BNBI=', '15919820372', 'dogdog7788@qq.com', '2017-05-09 23:59:59', '0', '2', '00000000000', '2017-04-25 13:23:25', 'BA21240CA9F4695AEF288B54DE3A64D5', '2017-04-25 13:20:47');

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
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `search_zj_name` (`name`,`search_zj`)
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
INSERT INTO `user_files` VALUES ('7', '12', '工具10.zip', '\\我的文档\\我的音乐\\工具集\\', '工具\\好用的工具\\', '工具', '好用的工具\\', '2016-11-04 14:19:50');

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

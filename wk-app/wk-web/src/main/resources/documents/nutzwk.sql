/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost
 Source Database       : nutzwk

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : utf-8

 Date: 11/05/2018 02:30:25 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `SYS_QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `SYS_QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `SYS_QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_CALENDARS`;
CREATE TABLE `SYS_QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_CRON_TRIGGERS`;
CREATE TABLE `SYS_QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `SYS_QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `SYS_QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_SYS_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_SYS_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_SYS_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_SYS_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_JOB_DETAILS`;
CREATE TABLE `SYS_QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_SYS_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_LOCKS`;
CREATE TABLE `SYS_QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SYS_QRTZ_LOCKS`
-- ----------------------------
BEGIN;
INSERT INTO `SYS_QRTZ_LOCKS` VALUES ('defaultScheduler', 'STATE_ACCESS'), ('defaultScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `SYS_QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `SYS_QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_SCHEDULER_STATE`;
CREATE TABLE `SYS_QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SYS_QRTZ_SCHEDULER_STATE`
-- ----------------------------
BEGIN;
INSERT INTO `SYS_QRTZ_SCHEDULER_STATE` VALUES ('defaultScheduler', 'RongSenMacBook-Pro.local1541240050145', '1541240050290', '20000');
COMMIT;

-- ----------------------------
--  Table structure for `SYS_QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `SYS_QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `SYS_QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `SYS_QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `SYS_QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_QRTZ_TRIGGERS`;
CREATE TABLE `SYS_QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_SYS_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_SYS_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_SYS_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_SYS_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_SYS_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_SYS_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `sys_qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `SYS_QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `shopid` varchar(32) DEFAULT NULL COMMENT '预留商城ID',
  `title` varchar(120) DEFAULT NULL COMMENT '文章标题',
  `info` varchar(500) DEFAULT NULL COMMENT '文章简介',
  `author` varchar(50) DEFAULT NULL COMMENT '文章作者',
  `picurl` varchar(255) DEFAULT NULL COMMENT '标题图',
  `content` text COMMENT '文章内容',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `publishAt` int(32) DEFAULT NULL COMMENT '发布时间',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `channelId` varchar(32) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `shopid` varchar(32) DEFAULT NULL COMMENT '预留商城ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `type` varchar(20) DEFAULT NULL COMMENT '栏目类型',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `isShow` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_class_link`
-- ----------------------------
DROP TABLE IF EXISTS `cms_class_link`;
CREATE TABLE `cms_class_link` (
  `classId` varchar(32) DEFAULT NULL,
  `linkId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_link`
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(120) DEFAULT NULL COMMENT '链接名称',
  `type` varchar(20) DEFAULT NULL COMMENT '链接类型',
  `picurl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `classId` varchar(32) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_link_class`
-- ----------------------------
DROP TABLE IF EXISTS `cms_link_class`;
CREATE TABLE `cms_link_class` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(120) DEFAULT NULL COMMENT '分类名称',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_site`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `shopid` varchar(32) DEFAULT NULL COMMENT '预留商城ID',
  `site_name` varchar(120) DEFAULT NULL COMMENT '名称',
  `site_domain` varchar(120) DEFAULT NULL COMMENT '域名',
  `site_icp` varchar(120) DEFAULT NULL COMMENT 'ICP',
  `site_logo` varchar(255) DEFAULT NULL COMMENT 'LOGO',
  `site_wap_logo` varchar(255) DEFAULT NULL COMMENT 'WAPLOGO',
  `site_qq` varchar(20) DEFAULT NULL COMMENT '客服QQ',
  `site_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `site_tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `weibo_name` varchar(50) DEFAULT NULL COMMENT '微博',
  `weibo_url` varchar(255) DEFAULT NULL COMMENT '微博地址',
  `weibo_qrcode` varchar(255) DEFAULT NULL COMMENT '微博二维码',
  `wechat_name` varchar(50) DEFAULT NULL COMMENT '微信名称',
  `wechat_id` varchar(50) DEFAULT NULL COMMENT '微信ID',
  `wechat_qrcode` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `seo_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `footer_content` text COMMENT '底部版权',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_site`
-- ----------------------------
BEGIN;
INSERT INTO `cms_site` VALUES ('site', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540698660', '0');
COMMIT;

-- ----------------------------
--  Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `className` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parentTable` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parentTableFk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `createBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` varchar(32) DEFAULT NULL COMMENT '更新者',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(11) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `genTableName` (`name`),
  KEY `genTableDelFlag` (`delFlag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
--  Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `genTableId` varchar(32) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comment` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbcType` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `javaType` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `javaField` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `isPk` char(1) DEFAULT NULL COMMENT '是否主键',
  `isNull` char(1) DEFAULT NULL COMMENT '是否可为空',
  `isInsert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `isEdit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `isList` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `isQuery` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `queryType` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `showType` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dictType` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` float(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `createBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` varchar(32) DEFAULT NULL COMMENT '更新者',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(11) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `genTableColumnTableId` (`genTableId`),
  KEY `genTableColumnName` (`name`),
  KEY `genTableColumnSort` (`sort`),
  KEY `genTableColumnDel_flag` (`delFlag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

-- ----------------------------
--  Table structure for `sys_api`
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api` (
  `id` varchar(32) NOT NULL,
  `appName` varchar(20) DEFAULT NULL COMMENT 'appName',
  `appId` varchar(255) DEFAULT NULL COMMENT 'appId',
  `appSecret` varchar(255) DEFAULT NULL COMMENT 'appSecret',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `configKey` varchar(100) NOT NULL,
  `configValue` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`configKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('AppDomain', '127.0.0.1', '系统域名', '', '1540698620', '0'), ('AppName', 'NutzWk 开发框架', '系统名称', '', '1540698620', '0'), ('AppShrotName', 'NutzWk', '系统短名称', '', '1540698620', '0'), ('AppUploadPath', '/upload', '文件上传文件夹', '', '1540698620', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `code` varchar(20) DEFAULT NULL COMMENT '机构编码',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_DICT_PATH` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_log_`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_`;
CREATE TABLE `sys_log_` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '创建昵称',
  `type` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `tag` varchar(50) DEFAULT NULL COMMENT '日志标识',
  `src` varchar(255) DEFAULT NULL COMMENT '执行类',
  `ip` varchar(255) DEFAULT NULL COMMENT '来源IP',
  `msg` text COMMENT '日志内容',
  `param` text COMMENT '请求结果',
  `result` text COMMENT '执行结果',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_log_201810`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_201810`;
CREATE TABLE `sys_log_201810` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '创建昵称',
  `type` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `tag` varchar(50) DEFAULT NULL COMMENT '日志标识',
  `src` varchar(255) DEFAULT NULL COMMENT '执行类',
  `ip` varchar(255) DEFAULT NULL COMMENT '来源IP',
  `msg` text COMMENT '日志内容',
  `param` text COMMENT '请求结果',
  `result` text COMMENT '执行结果',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_log_201810`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log_201810` VALUES ('1', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540698627', null), ('2', '超级管理员', 'info', '用户登出', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#logout', '0:0:0:0:0:0:0:1', '成功退出系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540700032', null), ('3', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540701812', null), ('4', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540731094', null), ('5', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540735405', null), ('6', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540816772', null), ('7', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:研发工具', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817073', '0'), ('8', '超级管理员', 'platform', '删除菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#delete', '0:0:0:0:0:0:0:1', '菜单名称:研发工具', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817128', '0'), ('9', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:研发工具', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817165', '0'), ('10', '超级管理员', 'platform', '启用菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#enable', '0:0:0:0:0:0:0:1', '菜单名称:研发工具', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817173', '0'), ('11', '超级管理员', 'platform', '修改角色菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysRoleController#editMenuDo', '0:0:0:0:0:0:0:1', '角色名称:系统管理员', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817199', '0'), ('12', '超级管理员', 'info', '用户登出', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#logout', '0:0:0:0:0:0:0:1', '成功退出系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540817219', null), ('13', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540817220', null), ('14', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:代码生成工具', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817412', '0'), ('15', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:代码生成实例', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817472', '0'), ('16', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:代码生成实例', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817538', '0'), ('17', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:单表/主子表', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817584', '0'), ('18', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:单表/主子表', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817684', '0'), ('19', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:树表/树结构表', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817765', '0'), ('20', '超级管理员', 'platform', '修改角色菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysRoleController#editMenuDo', '0:0:0:0:0:0:0:1', '角色名称:系统管理员', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540817781', '0'), ('21', '超级管理员', 'info', '用户登出', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#logout', '0:0:0:0:0:0:0:1', '成功退出系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540817794', null), ('22', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540817795', null), ('23', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540817809', null), ('24', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1540985979', null), ('25', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:IOT', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986086', '0'), ('26', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:IOT', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986123', '0'), ('27', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:IOT', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986131', '0'), ('28', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:设备管理', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986329', '0'), ('29', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:IOT', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986344', '0'), ('30', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:消息推送', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986621', '0'), ('31', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:消息推送', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986638', '0'), ('32', '超级管理员', 'platform', '新建菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#addDo', '0:0:0:0:0:0:0:1', '菜单名称:未完成消息', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986747', '0'), ('33', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:消息列表', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1540986768', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log_201811`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_201811`;
CREATE TABLE `sys_log_201811` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '创建昵称',
  `type` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `tag` varchar(50) DEFAULT NULL COMMENT '日志标识',
  `src` varchar(255) DEFAULT NULL COMMENT '执行类',
  `ip` varchar(255) DEFAULT NULL COMMENT '来源IP',
  `msg` text COMMENT '日志内容',
  `param` text COMMENT '请求结果',
  `result` text COMMENT '执行结果',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_log_201811`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log_201811` VALUES ('1', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1541159912', null), ('2', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:消息管理', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1541160023', '0'), ('3', '超级管理员', 'platform', '修改角色菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysRoleController#editMenuDo', '0:0:0:0:0:0:0:1', '角色名称:系统管理员', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1541160040', '0'), ('4', '超级管理员', 'info', '用户登出', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#logout', '0:0:0:0:0:0:0:1', '成功退出系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1541160050', null), ('5', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1541160052', null), ('6', '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '0:0:0:0:0:0:0:1', '成功登录系统！', null, null, '888035d9afaa4dab81dca8ba7f31f12a', '1541237306', null), ('7', '超级管理员', 'platform', '编辑菜单', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysMenuController#editDo', '0:0:0:0:0:0:0:1', '菜单名称:代码生成工具', '', '', '888035d9afaa4dab81dca8ba7f31f12a', '1541238958', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `aliasName` varchar(100) DEFAULT NULL COMMENT '菜单别名',
  `type` varchar(10) DEFAULT NULL COMMENT '资源类型',
  `href` varchar(255) DEFAULT NULL COMMENT '菜单链接',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `isShow` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `note` varchar(255) DEFAULT NULL COMMENT '菜单介绍',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_MENU_PATH` (`path`),
  UNIQUE KEY `INDEX_SYS_MENU_PREM` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('0014caebb91a4cc0b9131605a38c67fb', 'cc6cbaef63fc43589a10113eb76a54a9', '000100030001', '消息管理', null, 'menu', '/platform/sys/msg', 'data-pax', '', '1', '0', 'sys.manager.msg', null, '65', '0', '888035d9afaa4dab81dca8ba7f31f12a', '1541160023', '0'), ('02e86a61e99746bea34236ea73dd52a5', '', '0003', 'CMS', 'CMS', 'menu', '', '', '', '1', '0', 'cms', null, '9', '1', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468895671', '0'), ('0706112ff5dc46e388064a99bcdb0561', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030004', '关键词回复', 'Keyword', 'menu', '/platform/wx/reply/conf/keyword', 'data-pjax', '', '1', '0', 'wx.reply.keyword', null, '10', '0', '', '1467472362', '0'), ('077cb6be4c7c41cc8955ee045a4f0286', '68cdbf694f71445c8587a20234d6fe31', '0003000300020001', '添加链接', 'Add', 'data', '', '', '', '0', '0', 'cms.link.link.add', null, '47', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468897043', '0'), ('0a43d291e0c94ad88c8b690009279e34', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020004', '保存排序', 'Save', 'data', '', '', '', '0', '0', 'wx.conf.menu.sort', null, '0', '0', '', '1467474314', '0'), ('0a972ce655cb4c84809d58668b655900', '17e1ee23ca1443f1bc886c2f5eb7c24b', '0002000300020002', '修改图文', 'Edit', 'data', '', '', '', '0', '0', 'wx.reply.news.edit', null, '0', '0', '', '1467473596', '0'), ('0ac7ef857cdb4322ae6bd5ae1711ef00', '9de37add73e248bb9e888d632e028833', '0001000100020003', '删除用户', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.user.delete', null, '10', '0', '', '1540698621', '0'), ('1006e04f361d40b888e4b87f266f3c83', '4ced1bc4f6c14a5bbbdc6321edbb87e0', '0001000100060001', '清除日志', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.log.delete', null, '26', '0', '', '1540698621', '0'), ('110241bbc3ef42a0befd8363564be750', '4ee06b12dc6341428d73d4bfa1fc74a0', '00010002', '研发工具', null, 'menu', '', '', 'ti-code', '1', '0', 'sys.devtools', null, '57', '1', '888035d9afaa4dab81dca8ba7f31f12a', '1540817164', '0'), ('1364352bdcfa467fb645e23958baf867', '13e6f276c99c460394c71e9d9ffa735a', '0001000100090002', '修改应用', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.api.edit', null, '37', '0', '', '1540698621', '0'), ('1385ae887e5c4b8aa33fbf228be7f907', '6afc5075913d4df4b44a6476080e35a0', '000200050001', '模板编号', 'Id', 'menu', '/platform/wx/tpl/id', 'data-pjax', '', '1', '0', 'wx.tpl.id', null, '51', '0', '', '1470406854', '0'), ('13e6f276c99c460394c71e9d9ffa735a', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010009', '应用管理', 'App', 'menu', '/platform/sys/api', 'data-pjax', null, '1', '0', 'sys.manager.api', null, '35', '0', '', '1540698621', '0'), ('1734e586e96941268a4c5248b593cef9', 'f426468abf714b1599729f8c36ebbb0d', '0002000200010001', '回复消息', 'Reply', 'data', '', '', '', '0', '0', 'wx.msg.user.reply', null, '0', '0', '', '1467473127', '0'), ('17500ef3a9e44b4fabb240162a164fcb', '6075fc0cf0ef441b9d93cc3cab3445bf', '0003000200020003', '删除文章', 'Delete', 'data', '', '', '', '0', '0', 'cms.content.article.delete', null, '40', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896170', '0'), ('17e1ee23ca1443f1bc886c2f5eb7c24b', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030002', '图文内容', 'News', 'menu', '/platform/wx/reply/news', 'data-pjax', '', '1', '0', 'wx.reply.news', null, '8', '0', '', '1467471926', '0'), ('1af4e5fdeb06466da90746cbe76e14b3', 'b13443479fb945f09a8f0275b7581fa2', '0001000100080003', '删除路由', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.route.delete', null, '34', '0', '', '1540698621', '0'), ('1b7d81ff1e6746d1aee94e99d7becf5d', '9de37add73e248bb9e888d632e028833', '0001000100020001', '添加用户', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.user.add', null, '8', '0', '', '1540698621', '0'), ('1e19ac1b34804e6e86920a8d6cd17b1d', 'b13443479fb945f09a8f0275b7581fa2', '0001000100080002', '修改路由', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.route.edit', null, '33', '0', '', '1540698621', '0'), ('2068976ebd70453eb103abe6a8617cb2', '13e6f276c99c460394c71e9d9ffa735a', '0001000100090003', '删除应用', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.api.delete', null, '38', '0', '', '1540698621', '0'), ('2275cb125710414e91b617dd7c62f12c', '17e1ee23ca1443f1bc886c2f5eb7c24b', '0002000300020001', '添加图文', 'add', 'data', '', '', '', '0', '0', 'wx.reply.news.add', null, '0', '0', '', '1467473585', '0'), ('234f8ec3c2bc42bf9f6202aecae36fd6', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030001', '文本内容', 'Txt', 'menu', '/platform/wx/reply/txt', 'data-pjax', '', '1', '0', 'wx.reply.txt', null, '7', '0', '', '1467471884', '0'), ('2445b3bee15f44709213d43fdaae1867', '9c6cae75a4284a2f906540aeb68e8171', '00040001', '设备管理', null, 'menu', '', '', 'ti-settings', '1', '0', 'iot.device', null, '63', '0', '888035d9afaa4dab81dca8ba7f31f12a', '1540986329', '0'), ('2a63040409094f1e9dc535dd78ce15b7', '2cb327ad59b140828fd26eb2a46cb948', '0002000300030003', '删除绑定', 'Delete', 'data', '', '', '', '0', '0', 'wx.reply.follow.delete', null, '0', '0', '', '1467474080', '0'), ('2cb327ad59b140828fd26eb2a46cb948', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030003', '关注自动回复', 'Follow', 'menu', '/platform/wx/reply/conf/follow', 'data-pjax', '', '1', '0', 'wx.reply.follow', null, '9', '0', '', '1467472280', '0'), ('2fab774f8b6d40cb9d7e187babab2d91', 'bcf64d623fdd4519ae345b7a08c071a1', '000200040002', '菜单配置', 'Menu', 'menu', '/platform/wx/conf/menu', 'data-pjax', '', '1', '0', 'wx.conf.menu', null, '13', '0', '', '1467472649', '0'), ('303aa06cbda54bd78dc8a7768899d0c3', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010007', '定时任务', 'Task', 'menu', '/platform/sys/task', 'data-pjax', null, '1', '0', 'sys.manager.task', null, '27', '0', '', '1540698621', '0'), ('3099f497480c4b1987bce3f3a26c3fb4', '6bb17a41f6394ed0a8a6faf5ff781354', '0002000200020003', '群发消息', 'Push', 'data', '', '', '', '0', '0', 'wx.msg.mass.pushNews', null, '0', '0', '', '1467473400', '0'), ('309dc29ad3c34408a68df8f867a5c9ff', '66cc21d7ce104dd6877cbce114c59fb3', '0002000400010001', '添加帐号', 'Add', 'data', '', '', '', '0', '0', 'wx.conf.account.add', null, '0', '0', '', '1467474187', '0'), ('30a5e70a1456447ebf90b5546e9bc321', '2cb327ad59b140828fd26eb2a46cb948', '0002000300030002', '修改绑定', 'Edit', 'data', '', '', '', '0', '0', 'wx.reply.follow.edit', null, '0', '0', '', '1467474056', '0'), ('31ed2243077c44448cce26abfd5ae574', '9822bafbe3454dfd8e8b974ebc304d03', '0003000300010002', '修改分类', 'Edit', 'data', '', '', '', '0', '0', 'cms.link.class.edit', null, '44', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896957', '0'), ('33aed9298643424783116e0cf0f7fcbe', '6075fc0cf0ef441b9d93cc3cab3445bf', '0003000200020001', '添加文章', 'Add', 'data', '', '', '', '0', '0', 'cms.content.article.add', null, '38', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896151', '0'), ('350b56a6440840d8a807183d92e7179c', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010010', '数据字典', 'Dict', 'menu', '/platform/sys/dict', 'data-pjax', null, '1', '0', 'sys.manager.dict', null, '39', '0', '', '1540698621', '0'), ('36e0faf5062b4f6b95d4167cbb1f8fea', '68cdbf694f71445c8587a20234d6fe31', '0003000300020002', '修改链接', 'Edit', 'data', '', '', '', '0', '0', 'cms.link.link.edit', null, '48', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468897051', '0'), ('3809caec209b4252b7be056e549668d4', 'b4a516e3d2314ef18d42cb9064a3ea71', '0001000100110003', '删除插件', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.plugin.delete', null, '46', '0', '', '1540698621', '0'), ('3888f05aa4064f788ba7ec51c495ce7c', '1385ae887e5c4b8aa33fbf228be7f907', '0002000500010002', '删除编号', 'Delete', 'data', '', '', '', '0', '0', 'wx.tpl.id.delete', null, '55', '0', '', '1470407068', '0'), ('3ac4cb0a642842f692cf3f455d5f32d5', 'd8617660e8c947dcb91f4320d9703ecf', '0001000100030002', '修改角色', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.role.edit', null, '13', '0', '', '1540698621', '0'), ('3c24111091ad4a70ad2d9cc361311d2f', '68cdbf694f71445c8587a20234d6fe31', '0003000300020003', '删除链接', 'Delete', 'data', '', '', '', '0', '0', 'cms.link.link.delete', null, '49', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468897060', '0'), ('3cd2192fba524aac891a2258b0fce34a', 'bbe6948234394f21bc56eaa862b28469', '0001000100050002', '修改参数', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.conf.edit', null, '23', '0', '', '1540698621', '0'), ('3f330d729ca34dc9825c46122be1bfae', '02e86a61e99746bea34236ea73dd52a5', '00030003', '广告链接', 'AD', 'menu', '', '', 'ti-link', '1', '0', 'cms.link', null, '41', '1', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896230', '0'), ('44da90bc76a5419a841f4924333f7a66', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020002', '修改菜单', 'Edit', 'data', '', '', '', '0', '0', 'wx.conf.menu.edit', null, '0', '0', '', '1467474294', '0'), ('454aea9c7cc24f4d9b0264165eff046e', 'bbe6948234394f21bc56eaa862b28469', '0001000100050003', '删除参数', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.conf.delete', null, '24', '0', '', '1540698621', '0'), ('45d958ca78304f25b51f6c71cf66f6d8', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020001', '添加菜单', 'Add', 'data', '', '', '', '0', '0', 'wx.conf.menu.add', null, '0', '0', '', '1467474283', '0'), ('4781372b00bb4d52b429b58e72b80c68', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010001', '添加栏目', 'Add', 'data', '', '', '', '0', '0', 'cms.content.channel.add', null, '33', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896049', '0'), ('48b13da344d0478db60fa8530577c7bb', '6eb6c345c20543ba9f172e27dbb139d1', '0001000100010001', '添加单位', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.unit.add', null, '4', '0', '', '1540698621', '0'), ('4c61cdc515e9481f89a6b6429fc1600a', 'd8617660e8c947dcb91f4320d9703ecf', '0001000100030005', '分配用户', 'SetUser', 'data', null, null, null, '0', '0', 'sys.manager.role.user', null, '16', '0', '', '1540698621', '0'), ('4cd8e4e9519e4cff95465194fdcc8d88', 'b0edc6861a494b79b97990dc05f0a524', '00020003', '自动回复', 'AutoReply', 'menu', '', '', 'ti-back-left', '1', '0', 'wx.reply', null, '6', '1', '', '1467471610', '0'), ('4ced1bc4f6c14a5bbbdc6321edbb87e0', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010006', '日志管理', 'Log', 'menu', '/platform/sys/log', 'data-pjax', null, '1', '0', 'sys.manager.log', null, '25', '0', '', '1540698621', '0'), ('4cf35c7e27a844de84afc2097a349ecb', '6eb6c345c20543ba9f172e27dbb139d1', '0001000100010003', '删除单位', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.unit.delete', null, '6', '0', '', '1540698621', '0'), ('4dc997fef71e4862b9db22de8e99a618', 'b19b23b0459a4754bf1fb8cb234450f2', '0002000100010001', '同步会员信息', 'Sync', 'data', '', '', '', '0', '0', 'wx.user.list.sync', null, '0', '0', '', '1467473044', '0'), ('4ee06b12dc6341428d73d4bfa1fc74a0', '', '0001', '系统', 'System', 'menu', '', '', '', '1', '0', 'sys', '系统', '10', '1', '', '1540698620', '0'), ('50ba60ee650e4c739e6abc3ab71e4960', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010004', '栏目排序', 'Sort', 'data', '', '', '', '0', '0', 'cms.content.channel.sort', null, '36', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896092', '0'), ('5244f5c38eb24b918e9ad64d456daa38', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020005', '推送到微信', 'Push', 'data', '', '', '', '0', '0', 'wx.conf.menu.push', null, '0', '0', '', '1467474330', '0'), ('55087de4fcdd47918ffe9158db7f9651', '303aa06cbda54bd78dc8a7768899d0c3', '0001000100070001', '添加任务', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.task.add', null, '28', '0', '', '1540698621', '0'), ('56d0658c5a8848818ac05e8ffa5c0570', '6bb17a41f6394ed0a8a6faf5ff781354', '0002000200020001', '添加图文', 'Add', 'data', '', '', '', '0', '0', 'wx.msg.mass.addNews', null, '0', '0', '', '1467473338', '0'), ('6075fc0cf0ef441b9d93cc3cab3445bf', '6b6de8c720c645a1808e1c3e9ccbfc90', '000300020002', '文章管理', 'Article', 'menu', '/platform/cms/article', 'data-pjax', '', '1', '0', 'cms.content.article', null, '37', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896141', '0'), ('66cc21d7ce104dd6877cbce114c59fb3', 'bcf64d623fdd4519ae345b7a08c071a1', '000200040001', '帐号配置', 'Account', 'menu', '/platform/wx/conf/account', 'data-pjax', '', '1', '0', 'wx.conf.account', null, '12', '0', '', '1467472624', '0'), ('688a7ae5f94b47aab9c3cd1452b24ef1', '13e6f276c99c460394c71e9d9ffa735a', '0001000100090001', '添加应用', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.api.add', null, '36', '0', '', '1540698621', '0'), ('68cdbf694f71445c8587a20234d6fe31', '3f330d729ca34dc9825c46122be1bfae', '000300030002', '链接管理', 'Link', 'menu', '/platform/cms/link/link', 'data-pjax', '', '1', '0', 'cms.link.link', null, '46', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468897031', '0'), ('6931c73b89df4cc2a3de336edeea144f', 'd8617660e8c947dcb91f4320d9703ecf', '0001000100030004', '分配菜单', 'SetMenu', 'data', null, null, null, '0', '0', 'sys.manager.role.menu', null, '15', '0', '', '1540698621', '0'), ('6afc5075913d4df4b44a6476080e35a0', 'b0edc6861a494b79b97990dc05f0a524', '00020005', '模板消息', 'Template', 'menu', '', '', 'ti-notepad', '1', '0', 'wx.tpl', null, '50', '1', '', '1470406797', '0'), ('6b6de8c720c645a1808e1c3e9ccbfc90', '02e86a61e99746bea34236ea73dd52a5', '00030002', '内容管理', 'Content', 'menu', '', '', 'ti-pencil-alt', '1', '0', 'cms.content', null, '31', '1', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468895990', '0'), ('6bb17a41f6394ed0a8a6faf5ff781354', '9f20a757a6bc40ddbb650c70debbf660', '000200020002', '群发消息', 'Mass', 'menu', '/platform/wx/msg/mass', 'data-pjax', '', '1', '0', 'wx.msg.mass', null, '5', '0', '', '1467471561', '0'), ('6eb6c345c20543ba9f172e27dbb139d1', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010001', '单位管理', 'Unit', 'menu', '/platform/sys/unit', 'data-pjax', null, '1', '0', 'sys.manager.unit', null, '3', '0', '', '1540698620', '0'), ('7125a72beee34b21ab3df9bf01b7bce6', '9822bafbe3454dfd8e8b974ebc304d03', '0003000300010003', '删除分类', 'Delete', 'data', '', '', '', '0', '0', 'cms.link.class.delete', null, '45', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896968', '0'), ('733d3f35d49f45af99ca9220048583ba', '0706112ff5dc46e388064a99bcdb0561', '0002000300040003', '删除绑定', 'Delete', 'data', '', '', '', '0', '0', 'wx.reply.keyword.delete', null, '0', '0', '', '1467474136', '0'), ('73a29d3f99224426b5a87c92da122275', 'd1e991ad38a8424daf9f7eb000ee27f4', '0003000100010001', '保存配置', 'Save', 'data', '', '', '', '0', '0', 'cms.site.settings.save', null, '30', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468895899', '0'), ('7754338fec2c4f9193e7a42631e1c45b', '303aa06cbda54bd78dc8a7768899d0c3', '0001000100070002', '修改任务', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.task.edit', null, '29', '0', '', '1540698621', '0'), ('7a83ae76a3074f83a24c635ebb4d0d68', 'd8617660e8c947dcb91f4320d9703ecf', '0001000100030003', '删除角色', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.role.delete', null, '14', '0', '', '1540698621', '0'), ('7c040dfd8db347e5956a3bc1764653dc', '234f8ec3c2bc42bf9f6202aecae36fd6', '0002000300010003', '删除文本', 'Delete', 'data', '', '', '', '0', '0', 'wx.reply.txt.delete', null, '0', '0', '', '1467473540', '0'), ('7db6207d0dab4d6e95a7eee4f2efe875', '9822bafbe3454dfd8e8b974ebc304d03', '0003000300010001', '添加分类', 'Add', 'data', '', '', '', '0', '0', 'cms.link.class.add', null, '43', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896947', '0'), ('7efde82105f947fda1cf4bdc3dec96d4', '9de37add73e248bb9e888d632e028833', '0001000100020002', '修改用户', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.user.edit', null, '9', '0', '', '1540698621', '0'), ('85f8504e29c946908dcf798fece97364', 'c591fd5f18234be494cdda64021f178c', '0001000100040001', '添加菜单', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.menu.add', null, '18', '0', '', '1540698621', '0'), ('8d4bb9eda1c14f7180c066e508eb04c4', '350b56a6440840d8a807183d92e7179c', '0001000100100002', '修改字典', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.dict.edit', null, '41', '0', '', '1540698621', '0'), ('8ee7b5d72ea948c8bb75c22dfd5100b2', 'b13443479fb945f09a8f0275b7581fa2', '0001000100080001', '添加路由', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.route.add', null, '32', '0', '', '1540698621', '0'), ('902d3812e5684b7fb2190a3fcc641694', '303aa06cbda54bd78dc8a7768899d0c3', '0001000100070003', '删除任务', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.task.delete', null, '30', '0', '', '1540698621', '0'), ('94dfd675613945508bd656d46e65663a', 'c591fd5f18234be494cdda64021f178c', '0001000100040003', '删除菜单', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.menu.delete', null, '20', '0', '', '1540698621', '0'), ('96554b09a2dd4f82bab7546fa59acd35', '66cc21d7ce104dd6877cbce114c59fb3', '0002000400010002', '修改帐号', 'Edit', 'data', '', '', '', '0', '0', 'wx.conf.account.edit', null, '0', '0', '', '1467474197', '0'), ('9822bafbe3454dfd8e8b974ebc304d03', '3f330d729ca34dc9825c46122be1bfae', '000300030001', '链接分类', 'Class', 'menu', '/platform/cms/link/class', 'data-pjax', '', '1', '0', 'cms.link.class', null, '42', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896932', '0'), ('9a9557177d334c209cf73c3817fe3b63', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020003', '删除菜单', 'Delete', 'data', '', '', '', '0', '0', 'wx.conf.menu.delete', null, '0', '0', '', '1467474304', '0'), ('9c6cae75a4284a2f906540aeb68e8171', '', '0004', 'IOT', null, 'menu', '', '', '', '1', '0', 'iot', null, '62', '1', '888035d9afaa4dab81dca8ba7f31f12a', '1540986344', '0'), ('9de37add73e248bb9e888d632e028833', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010002', '用户管理', 'User', 'menu', '/platform/sys/user', 'data-pjax', null, '1', '0', 'sys.manager.user', null, '7', '0', '', '1540698621', '0'), ('9f20a757a6bc40ddbb650c70debbf660', 'b0edc6861a494b79b97990dc05f0a524', '00020002', '消息管理', 'Message', 'menu', '', '', 'ti-pencil-alt', '1', '0', 'wx.msg', null, '3', '1', '', '1467471415', '0'), ('a11163584dfe456cbfd6fb2d4b74391b', 'cabbe834a7474675b899e8442b5c2604', '0002000500020001', '获取列表', 'Get', 'data', '', '', '', '0', '0', 'wx.tpl.list.get', null, '56', '0', '', '1470407390', '0'), ('a4dc95b076744ffc9242fbe72d64c1ed', '350b56a6440840d8a807183d92e7179c', '0001000100100001', '添加字典', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.dict.add', null, '40', '0', '', '1540698621', '0'), ('ad4f25d44d9048b89966ea61d81d05ed', '350b56a6440840d8a807183d92e7179c', '0001000100100003', '删除字典', 'Delete', 'data', null, null, null, '0', '0', 'sys.manager.dict.delete', null, '42', '0', '', '1540698621', '0'), ('b0edc6861a494b79b97990dc05f0a524', '', '0002', '微信', 'Wechat', 'menu', '', '', '', '1', '0', 'wx', null, '8', '1', '', '1467471229', '0'), ('b13443479fb945f09a8f0275b7581fa2', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010008', '自定义路由', 'Route', 'menu', '/platform/sys/route', 'data-pjax', null, '1', '0', 'sys.manager.route', null, '31', '0', '', '1540698621', '0'), ('b19b23b0459a4754bf1fb8cb234450f2', 'e4256d7b0ffc4a02906cf900322b6213', '000200010001', '会员列表', 'List', 'menu', '/platform/wx/user/index', 'data-pjax', '', '1', '0', 'wx.user.list', null, '2', '0', '', '1467471357', '0'), ('b2631bbdbf824cc4b74d819c87962c0d', '6b6de8c720c645a1808e1c3e9ccbfc90', '000300020001', '栏目管理', 'Channel', 'menu', '/platform/cms/channel', 'data-pjax', '', '1', '0', 'cms.content.channel', null, '32', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896018', '0'), ('b417137aea664c02897aa9677810195c', '110241bbc3ef42a0befd8363564be750', '000100020002', '代码生成实例', null, 'menu', '', '', '', '1', '0', 'sys.devtools.case', null, '59', '1', '888035d9afaa4dab81dca8ba7f31f12a', '1540817538', '0'), ('b4a516e3d2314ef18d42cb9064a3ea71', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010011', '插件管理', 'Plugin', 'menu', '/platform/sys/plugin', 'data-pjax', null, '1', '0', 'sys.manager.plugin', null, '43', '0', '', '1540698621', '0'), ('b6ecdc0cd6694ad4a8fa781a6d65906a', '4ee06b12dc6341428d73d4bfa1fc74a0', '00010001', '系统管理', 'Manager', 'menu', '', '', 'ti-settings', '1', '0', 'sys.manager', '系统管理', '2', '1', '', '1540698620', '0'), ('bbe6948234394f21bc56eaa862b28469', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010005', '系统参数', 'Param', 'menu', '/platform/sys/conf', 'data-pjax', null, '1', '0', 'sys.manager.conf', null, '21', '0', '', '1540698621', '0'), ('bcf64d623fdd4519ae345b7a08c071a1', 'b0edc6861a494b79b97990dc05f0a524', '00020004', '微信配置', 'Config', 'menu', '', '', 'fa fa-weixin', '1', '0', 'wx.conf', null, '11', '1', '', '1467472498', '0'), ('be0f365c9ba54b1ca216dcb51ce73d6c', 'b417137aea664c02897aa9677810195c', '0001000200020001', '单表/主子表', null, 'menu', '/case/caseData/list', 'data-pax', '', '1', '0', 'sys.devtools.case.single', null, '60', '0', '888035d9afaa4dab81dca8ba7f31f12a', '1540817684', '0'), ('c3a44b478d3241b899b9c3f4611bc2b6', '234f8ec3c2bc42bf9f6202aecae36fd6', '0002000300010001', '添加文本', 'Add', 'data', '', '', '', '0', '0', 'wx.reply.txt.add', null, '0', '0', '', '1467473460', '0'), ('c591fd5f18234be494cdda64021f178c', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010004', '菜单管理', 'Menu', 'menu', '/platform/sys/menu', 'data-pjax', null, '1', '0', 'sys.manager.menu', null, '17', '0', '', '1540698621', '0'), ('c5cfa2e7700a4e2b9899e12dd30c9af2', 'c591fd5f18234be494cdda64021f178c', '0001000100040002', '修改菜单', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.menu.edit', null, '19', '0', '', '1540698621', '0'), ('c76a84f871d047db955dd1465c845ac1', '6afc5075913d4df4b44a6476080e35a0', '000200050003', '发送记录', 'Log', 'menu', '/platform/wx/tpl/log', 'data-pjax', '', '1', '0', 'wx.tpl.log', null, '53', '0', '', '1470406926', '0'), ('c9e6f8003fa44c38a49394604fdae6a0', 'b4a516e3d2314ef18d42cb9064a3ea71', '0001000100110001', '添加插件', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.plugin.add', null, '44', '0', '', '1540698621', '0'), ('cabbe834a7474675b899e8442b5c2604', '6afc5075913d4df4b44a6476080e35a0', '000200050002', '模板列表', 'List', 'menu', '/platform/wx/tpl/list', 'data-pjax', '', '1', '0', 'wx.tpl.list', null, '52', '0', '', '1470406883', '0'), ('cc6cbaef63fc43589a10113eb76a54a9', '4ee06b12dc6341428d73d4bfa1fc74a0', '00010003', '消息推送', null, 'menu', '', '', 'ti-setting', '1', '0', 'sys.msg', null, '64', '1', '888035d9afaa4dab81dca8ba7f31f12a', '1540986638', '0'), ('ce709456e867425297955b3c40406d7e', '6bb17a41f6394ed0a8a6faf5ff781354', '0002000200020002', '删除图文', 'Delete', 'data', '', '', '', '0', '0', 'wx.msg.mass.delNews', null, '0', '0', '', '1467473363', '0'), ('d0d6eac892b64b88850c48d76a17922d', '110241bbc3ef42a0befd8363564be750', '000100020001', '代码生成工具', null, 'menu', '/gen/table', 'data-pjax', '', '1', '0', 'sys.devtools.gen', null, '58', '0', '888035d9afaa4dab81dca8ba7f31f12a', '1541238958', '0'), ('d1e991ad38a8424daf9f7eb000ee27f4', 'd920314e925c451da6d881e7a29743b7', '000300010001', '网站配置', 'Settings', 'menu', '/platform/cms/site', 'data-pjax', '', '1', '0', 'cms.site.settings', null, '29', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468895881', '0'), ('d568f4c2b687404e8aec7b9edcae5767', '66cc21d7ce104dd6877cbce114c59fb3', '0002000400010003', '删除帐号', 'Delete', 'data', '', '', '', '0', '0', 'wx.conf.account.delete', null, '0', '0', '', '1467474209', '0'), ('d651a2d984174a09a0872b3590e0be75', 'b417137aea664c02897aa9677810195c', '0001000200020002', '树表/树结构表', null, 'menu', '/case/caseTree/list', 'data-pax', '', '1', '0', 'sys.devtools.case.tree', null, '61', '0', '888035d9afaa4dab81dca8ba7f31f12a', '1540817765', '0'), ('d8617660e8c947dcb91f4320d9703ecf', 'b6ecdc0cd6694ad4a8fa781a6d65906a', '000100010003', '角色管理', 'Role', 'menu', '/platform/sys/role', 'data-pjax', null, '1', '0', 'sys.manager.role', null, '11', '0', '', '1540698621', '0'), ('d920314e925c451da6d881e7a29743b7', '02e86a61e99746bea34236ea73dd52a5', '00030001', '站点管理', 'Site', 'menu', '', '', 'ti-world', '1', '0', 'cms.site', null, '28', '1', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468895821', '0'), ('dbbf4046bc1641af86ffeaf090d48af1', 'd8617660e8c947dcb91f4320d9703ecf', '0001000100030001', '添加角色', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.role.add', null, '12', '0', '', '1540698621', '0'), ('dd965b2c1dfd493fb5efc7e4bcac99d4', '2cb327ad59b140828fd26eb2a46cb948', '0002000300030001', '添加绑定', 'Add', 'data', '', '', '', '0', '0', 'wx.reply.follow.add', null, '0', '0', '', '1467474026', '0'), ('e4256d7b0ffc4a02906cf900322b6213', 'b0edc6861a494b79b97990dc05f0a524', '00020001', '微信会员', 'Member', 'menu', '', '', 'fa fa-user', '1', '0', 'wx.user', null, '1', '1', '', '1467471292', '0'), ('e461c62a1d5441619cd35612f3b40691', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010002', '修改栏目', 'Edit', 'data', '', '', '', '0', '0', 'cms.content.channel.edit', null, '34', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896060', '0'), ('e6b6224617b04090a76e46a4b048fb96', '1385ae887e5c4b8aa33fbf228be7f907', '0002000500010001', '添加编号', 'Add', 'data', '', '', '', '0', '0', 'wx.tpl.id.add', null, '54', '0', '', '1470407055', '0'), ('e864c78aba63448892cbcb6a3a7f4da7', '0706112ff5dc46e388064a99bcdb0561', '0002000300040001', '添加绑定', 'Add', 'data', '', '', '', '0', '0', 'wx.reply.keyword.add', null, '0', '0', '', '1467474113', '0'), ('ed686fb12d0f4fa6877ce23edfb08380', '6eb6c345c20543ba9f172e27dbb139d1', '0001000100010002', '修改单位', 'Edit', 'data', null, null, null, '0', '0', 'sys.manager.unit.edit', null, '5', '0', '', '1540698621', '0'), ('ef9f436c61654ec09efbfa79a40061cf', '6075fc0cf0ef441b9d93cc3cab3445bf', '0003000200020002', '修改文章', 'Edit', 'data', '', '', '', '0', '0', 'cms.content.article.edit', null, '39', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896159', '0'), ('f426468abf714b1599729f8c36ebbb0d', '9f20a757a6bc40ddbb650c70debbf660', '000200020001', '会员消息', 'Msg', 'menu', '/platform/wx/msg/user', 'data-pjax', '', '1', '0', 'wx.msg.user', null, '4', '1', '', '1467471478', '0'), ('f6fba69c3b704d79834b8bd2cc753729', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010003', '删除栏目', 'Delete', 'data', '', '', '', '0', '0', 'cms.content.channel.delete', null, '35', '0', '1a19ef09b12344b4a797d6e6dfe7fb29', '1468896072', '0'), ('fa7c7322a2aa48a4b19ee692771a6a46', 'b4a516e3d2314ef18d42cb9064a3ea71', '0001000100110002', '启用禁用', 'Update', 'data', null, null, null, '0', '0', 'sys.manager.plugin.update', null, '45', '0', '', '1540698621', '0'), ('fc52d5284b8f4522802383c1ef732242', '17e1ee23ca1443f1bc886c2f5eb7c24b', '0002000300020003', '删除图文', 'Delete', 'data', '', '', '', '0', '0', 'wx.reply.news.delete', null, '0', '0', '', '1467473606', '0'), ('fd63a8e389e04ff3a86c3cea53a3b9d5', '234f8ec3c2bc42bf9f6202aecae36fd6', '0002000300010002', '修改文本', 'Edit', 'data', '', '', '', '0', '0', 'wx.reply.txt.edit', null, '0', '0', '', '1467473519', '0'), ('fe36db743a9040aa857893edf16aed32', 'bbe6948234394f21bc56eaa862b28469', '0001000100050001', '添加参数', 'Add', 'data', null, null, null, '0', '0', 'sys.manager.conf.add', null, '22', '0', '', '1540698621', '0'), ('ff6cd243a77c4ae98dacf6149c816c75', '0706112ff5dc46e388064a99bcdb0561', '0002000300040002', '修改绑定', 'Edit', 'data', '', '', '', '0', '0', 'wx.reply.keyword.edit', null, '0', '0', '', '1467474125', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_msg`
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `content` text COMMENT '信息内容',
  `replyId` varchar(32) DEFAULT NULL COMMENT '回复ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_plugin`;
CREATE TABLE `sys_plugin` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `code` varchar(255) DEFAULT NULL COMMENT '唯一标识',
  `className` varchar(255) DEFAULT NULL COMMENT '类名',
  `args` varchar(255) DEFAULT NULL COMMENT '执行参数',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_PLUGIN` (`code`),
  UNIQUE KEY `INDEX_SYS_CLASSNAME` (`className`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `aliasName` varchar(50) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `unitid` varchar(32) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_ROLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('2657d81c9f4e45139fe20ee945975205', '系统管理员', 'sysadmin', 'Sysadmin', '0', '', 'System Admin', '', '1540698621', '0'), ('44c27a3775b040ffa01d9adb575d3993', '公共角色', 'public', 'Public', '0', '', 'All user has role', '', '1540698621', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `roleId` varchar(32) DEFAULT NULL,
  `menuId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('2657d81c9f4e45139fe20ee945975205', '4dc997fef71e4862b9db22de8e99a618'), ('2657d81c9f4e45139fe20ee945975205', '1734e586e96941268a4c5248b593cef9'), ('2657d81c9f4e45139fe20ee945975205', '56d0658c5a8848818ac05e8ffa5c0570'), ('2657d81c9f4e45139fe20ee945975205', 'ce709456e867425297955b3c40406d7e'), ('2657d81c9f4e45139fe20ee945975205', '3099f497480c4b1987bce3f3a26c3fb4'), ('2657d81c9f4e45139fe20ee945975205', 'c3a44b478d3241b899b9c3f4611bc2b6'), ('2657d81c9f4e45139fe20ee945975205', 'fd63a8e389e04ff3a86c3cea53a3b9d5'), ('2657d81c9f4e45139fe20ee945975205', '7c040dfd8db347e5956a3bc1764653dc'), ('2657d81c9f4e45139fe20ee945975205', '2275cb125710414e91b617dd7c62f12c'), ('2657d81c9f4e45139fe20ee945975205', '0a972ce655cb4c84809d58668b655900'), ('2657d81c9f4e45139fe20ee945975205', 'fc52d5284b8f4522802383c1ef732242'), ('2657d81c9f4e45139fe20ee945975205', 'dd965b2c1dfd493fb5efc7e4bcac99d4'), ('2657d81c9f4e45139fe20ee945975205', '30a5e70a1456447ebf90b5546e9bc321'), ('2657d81c9f4e45139fe20ee945975205', '2a63040409094f1e9dc535dd78ce15b7'), ('2657d81c9f4e45139fe20ee945975205', 'e864c78aba63448892cbcb6a3a7f4da7'), ('2657d81c9f4e45139fe20ee945975205', 'ff6cd243a77c4ae98dacf6149c816c75'), ('2657d81c9f4e45139fe20ee945975205', '733d3f35d49f45af99ca9220048583ba'), ('2657d81c9f4e45139fe20ee945975205', '309dc29ad3c34408a68df8f867a5c9ff'), ('2657d81c9f4e45139fe20ee945975205', '96554b09a2dd4f82bab7546fa59acd35'), ('2657d81c9f4e45139fe20ee945975205', 'd568f4c2b687404e8aec7b9edcae5767'), ('2657d81c9f4e45139fe20ee945975205', '45d958ca78304f25b51f6c71cf66f6d8'), ('2657d81c9f4e45139fe20ee945975205', '44da90bc76a5419a841f4924333f7a66'), ('2657d81c9f4e45139fe20ee945975205', '9a9557177d334c209cf73c3817fe3b63'), ('2657d81c9f4e45139fe20ee945975205', '0a43d291e0c94ad88c8b690009279e34'), ('2657d81c9f4e45139fe20ee945975205', '5244f5c38eb24b918e9ad64d456daa38'), ('2657d81c9f4e45139fe20ee945975205', 'e6b6224617b04090a76e46a4b048fb96'), ('2657d81c9f4e45139fe20ee945975205', '3888f05aa4064f788ba7ec51c495ce7c'), ('2657d81c9f4e45139fe20ee945975205', 'a11163584dfe456cbfd6fb2d4b74391b'), ('2657d81c9f4e45139fe20ee945975205', 'c76a84f871d047db955dd1465c845ac1'), ('2657d81c9f4e45139fe20ee945975205', '73a29d3f99224426b5a87c92da122275'), ('2657d81c9f4e45139fe20ee945975205', '4781372b00bb4d52b429b58e72b80c68'), ('2657d81c9f4e45139fe20ee945975205', 'e461c62a1d5441619cd35612f3b40691'), ('2657d81c9f4e45139fe20ee945975205', 'f6fba69c3b704d79834b8bd2cc753729'), ('2657d81c9f4e45139fe20ee945975205', '50ba60ee650e4c739e6abc3ab71e4960'), ('2657d81c9f4e45139fe20ee945975205', '33aed9298643424783116e0cf0f7fcbe'), ('2657d81c9f4e45139fe20ee945975205', 'ef9f436c61654ec09efbfa79a40061cf'), ('2657d81c9f4e45139fe20ee945975205', '17500ef3a9e44b4fabb240162a164fcb'), ('2657d81c9f4e45139fe20ee945975205', '7db6207d0dab4d6e95a7eee4f2efe875'), ('2657d81c9f4e45139fe20ee945975205', '31ed2243077c44448cce26abfd5ae574'), ('2657d81c9f4e45139fe20ee945975205', '7125a72beee34b21ab3df9bf01b7bce6'), ('2657d81c9f4e45139fe20ee945975205', '077cb6be4c7c41cc8955ee045a4f0286'), ('2657d81c9f4e45139fe20ee945975205', '36e0faf5062b4f6b95d4167cbb1f8fea'), ('2657d81c9f4e45139fe20ee945975205', '3c24111091ad4a70ad2d9cc361311d2f'), ('2657d81c9f4e45139fe20ee945975205', '48b13da344d0478db60fa8530577c7bb'), ('2657d81c9f4e45139fe20ee945975205', 'ed686fb12d0f4fa6877ce23edfb08380'), ('2657d81c9f4e45139fe20ee945975205', '4cf35c7e27a844de84afc2097a349ecb'), ('2657d81c9f4e45139fe20ee945975205', '1b7d81ff1e6746d1aee94e99d7becf5d'), ('2657d81c9f4e45139fe20ee945975205', '7efde82105f947fda1cf4bdc3dec96d4'), ('2657d81c9f4e45139fe20ee945975205', '0ac7ef857cdb4322ae6bd5ae1711ef00'), ('2657d81c9f4e45139fe20ee945975205', 'dbbf4046bc1641af86ffeaf090d48af1'), ('2657d81c9f4e45139fe20ee945975205', '3ac4cb0a642842f692cf3f455d5f32d5'), ('2657d81c9f4e45139fe20ee945975205', '7a83ae76a3074f83a24c635ebb4d0d68'), ('2657d81c9f4e45139fe20ee945975205', '6931c73b89df4cc2a3de336edeea144f'), ('2657d81c9f4e45139fe20ee945975205', '4c61cdc515e9481f89a6b6429fc1600a'), ('2657d81c9f4e45139fe20ee945975205', '85f8504e29c946908dcf798fece97364'), ('2657d81c9f4e45139fe20ee945975205', 'c5cfa2e7700a4e2b9899e12dd30c9af2'), ('2657d81c9f4e45139fe20ee945975205', '94dfd675613945508bd656d46e65663a'), ('2657d81c9f4e45139fe20ee945975205', 'fe36db743a9040aa857893edf16aed32'), ('2657d81c9f4e45139fe20ee945975205', '3cd2192fba524aac891a2258b0fce34a'), ('2657d81c9f4e45139fe20ee945975205', '454aea9c7cc24f4d9b0264165eff046e'), ('2657d81c9f4e45139fe20ee945975205', '1006e04f361d40b888e4b87f266f3c83'), ('2657d81c9f4e45139fe20ee945975205', '55087de4fcdd47918ffe9158db7f9651'), ('2657d81c9f4e45139fe20ee945975205', '7754338fec2c4f9193e7a42631e1c45b'), ('2657d81c9f4e45139fe20ee945975205', '902d3812e5684b7fb2190a3fcc641694'), ('2657d81c9f4e45139fe20ee945975205', '8ee7b5d72ea948c8bb75c22dfd5100b2'), ('2657d81c9f4e45139fe20ee945975205', '1e19ac1b34804e6e86920a8d6cd17b1d'), ('2657d81c9f4e45139fe20ee945975205', '1af4e5fdeb06466da90746cbe76e14b3'), ('2657d81c9f4e45139fe20ee945975205', '688a7ae5f94b47aab9c3cd1452b24ef1'), ('2657d81c9f4e45139fe20ee945975205', '1364352bdcfa467fb645e23958baf867'), ('2657d81c9f4e45139fe20ee945975205', '2068976ebd70453eb103abe6a8617cb2'), ('2657d81c9f4e45139fe20ee945975205', 'a4dc95b076744ffc9242fbe72d64c1ed'), ('2657d81c9f4e45139fe20ee945975205', '8d4bb9eda1c14f7180c066e508eb04c4'), ('2657d81c9f4e45139fe20ee945975205', 'ad4f25d44d9048b89966ea61d81d05ed'), ('2657d81c9f4e45139fe20ee945975205', 'c9e6f8003fa44c38a49394604fdae6a0'), ('2657d81c9f4e45139fe20ee945975205', 'fa7c7322a2aa48a4b19ee692771a6a46'), ('2657d81c9f4e45139fe20ee945975205', '3809caec209b4252b7be056e549668d4'), ('2657d81c9f4e45139fe20ee945975205', 'd0d6eac892b64b88850c48d76a17922d'), ('2657d81c9f4e45139fe20ee945975205', 'be0f365c9ba54b1ca216dcb51ce73d6c'), ('2657d81c9f4e45139fe20ee945975205', 'd651a2d984174a09a0872b3590e0be75'), ('2657d81c9f4e45139fe20ee945975205', 'cc6cbaef63fc43589a10113eb76a54a9'), ('2657d81c9f4e45139fe20ee945975205', '0014caebb91a4cc0b9131605a38c67fb'), ('2657d81c9f4e45139fe20ee945975205', 'b19b23b0459a4754bf1fb8cb234450f2'), ('2657d81c9f4e45139fe20ee945975205', 'e4256d7b0ffc4a02906cf900322b6213'), ('2657d81c9f4e45139fe20ee945975205', 'b0edc6861a494b79b97990dc05f0a524'), ('2657d81c9f4e45139fe20ee945975205', 'f426468abf714b1599729f8c36ebbb0d'), ('2657d81c9f4e45139fe20ee945975205', '9f20a757a6bc40ddbb650c70debbf660'), ('2657d81c9f4e45139fe20ee945975205', '6bb17a41f6394ed0a8a6faf5ff781354'), ('2657d81c9f4e45139fe20ee945975205', '234f8ec3c2bc42bf9f6202aecae36fd6'), ('2657d81c9f4e45139fe20ee945975205', '4cd8e4e9519e4cff95465194fdcc8d88'), ('2657d81c9f4e45139fe20ee945975205', '17e1ee23ca1443f1bc886c2f5eb7c24b'), ('2657d81c9f4e45139fe20ee945975205', '2cb327ad59b140828fd26eb2a46cb948'), ('2657d81c9f4e45139fe20ee945975205', '0706112ff5dc46e388064a99bcdb0561'), ('2657d81c9f4e45139fe20ee945975205', '66cc21d7ce104dd6877cbce114c59fb3'), ('2657d81c9f4e45139fe20ee945975205', 'bcf64d623fdd4519ae345b7a08c071a1'), ('2657d81c9f4e45139fe20ee945975205', '2fab774f8b6d40cb9d7e187babab2d91'), ('2657d81c9f4e45139fe20ee945975205', '1385ae887e5c4b8aa33fbf228be7f907'), ('2657d81c9f4e45139fe20ee945975205', '6afc5075913d4df4b44a6476080e35a0'), ('2657d81c9f4e45139fe20ee945975205', 'cabbe834a7474675b899e8442b5c2604'), ('2657d81c9f4e45139fe20ee945975205', 'd1e991ad38a8424daf9f7eb000ee27f4'), ('2657d81c9f4e45139fe20ee945975205', 'd920314e925c451da6d881e7a29743b7'), ('2657d81c9f4e45139fe20ee945975205', '02e86a61e99746bea34236ea73dd52a5'), ('2657d81c9f4e45139fe20ee945975205', 'b2631bbdbf824cc4b74d819c87962c0d'), ('2657d81c9f4e45139fe20ee945975205', '6b6de8c720c645a1808e1c3e9ccbfc90'), ('2657d81c9f4e45139fe20ee945975205', '6075fc0cf0ef441b9d93cc3cab3445bf'), ('2657d81c9f4e45139fe20ee945975205', '9822bafbe3454dfd8e8b974ebc304d03'), ('2657d81c9f4e45139fe20ee945975205', '3f330d729ca34dc9825c46122be1bfae'), ('2657d81c9f4e45139fe20ee945975205', '68cdbf694f71445c8587a20234d6fe31'), ('2657d81c9f4e45139fe20ee945975205', '6eb6c345c20543ba9f172e27dbb139d1'), ('2657d81c9f4e45139fe20ee945975205', 'b6ecdc0cd6694ad4a8fa781a6d65906a'), ('2657d81c9f4e45139fe20ee945975205', '4ee06b12dc6341428d73d4bfa1fc74a0'), ('2657d81c9f4e45139fe20ee945975205', '9de37add73e248bb9e888d632e028833'), ('2657d81c9f4e45139fe20ee945975205', 'd8617660e8c947dcb91f4320d9703ecf'), ('2657d81c9f4e45139fe20ee945975205', 'c591fd5f18234be494cdda64021f178c'), ('2657d81c9f4e45139fe20ee945975205', 'bbe6948234394f21bc56eaa862b28469'), ('2657d81c9f4e45139fe20ee945975205', '4ced1bc4f6c14a5bbbdc6321edbb87e0'), ('2657d81c9f4e45139fe20ee945975205', '303aa06cbda54bd78dc8a7768899d0c3'), ('2657d81c9f4e45139fe20ee945975205', 'b13443479fb945f09a8f0275b7581fa2'), ('2657d81c9f4e45139fe20ee945975205', '13e6f276c99c460394c71e9d9ffa735a'), ('2657d81c9f4e45139fe20ee945975205', '350b56a6440840d8a807183d92e7179c'), ('2657d81c9f4e45139fe20ee945975205', 'b4a516e3d2314ef18d42cb9064a3ea71'), ('2657d81c9f4e45139fe20ee945975205', '110241bbc3ef42a0befd8363564be750'), ('2657d81c9f4e45139fe20ee945975205', 'b417137aea664c02897aa9677810195c');
COMMIT;

-- ----------------------------
--  Table structure for `sys_route`
-- ----------------------------
DROP TABLE IF EXISTS `sys_route`;
CREATE TABLE `sys_route` (
  `id` varchar(32) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '原始路径',
  `toUrl` varchar(255) DEFAULT NULL COMMENT '跳转路径',
  `type` varchar(10) DEFAULT NULL COMMENT '转发类型',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_route`
-- ----------------------------
BEGIN;
INSERT INTO `sys_route` VALUES ('33e273014e3b4dff9f2b76e322b60ac2', '/sysadmin', '/platform/login', 'hide', '0', '', '1540698622', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_task`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '任务名',
  `jobClass` varchar(255) DEFAULT NULL COMMENT '执行类',
  `note` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `cron` varchar(50) DEFAULT NULL COMMENT '定时规则',
  `data` text COMMENT '执行参数',
  `exeAt` int(32) DEFAULT NULL COMMENT '执行时间',
  `exeResult` text COMMENT '执行结果',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_task`
-- ----------------------------
BEGIN;
INSERT INTO `sys_task` VALUES ('da1a7e36202c4cc99d343f824f804a6f', '测试任务', 'cn.wizzer.app.web.commons.quartz.job.TestJob', '微信号：wizzer | 欢迎发送红包以示支持，多谢。。', '*/5 * * * * ?', '{\"hi\":\"Wechat:wizzer | send red packets of support,thank u\"}', null, null, '1', '', '1540698622', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_unit`
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `aliasName` varchar(100) DEFAULT NULL COMMENT '单位别名',
  `unitcode` varchar(20) DEFAULT NULL COMMENT '机构编码',
  `note` varchar(255) DEFAULT NULL COMMENT '单位介绍',
  `address` varchar(100) DEFAULT NULL COMMENT '单位地址',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '单位邮箱',
  `website` varchar(100) DEFAULT NULL COMMENT '单位网站',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_UNIT_PATH` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_unit`
-- ----------------------------
BEGIN;
INSERT INTO `sys_unit` VALUES ('86e142eb28024fdcbbe6d7d31b4426c7', '', '0001', '系统管理', 'System', null, null, '银河-太阳系-地球', '', 'wizzer@qq.com', 'http://www.wizzer.cn', '1', '0', '', '1540698620', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `loginname` varchar(120) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '密码盐',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `isOnline` tinyint(1) DEFAULT NULL COMMENT '是否在线',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `email` varchar(255) DEFAULT NULL,
  `loginAt` int(32) DEFAULT NULL COMMENT '登陆时间',
  `loginIp` varchar(255) DEFAULT NULL COMMENT '登陆IP',
  `loginCount` int(32) DEFAULT NULL COMMENT '登陆次数',
  `customMenu` varchar(255) DEFAULT NULL COMMENT '常用菜单',
  `loginTheme` varchar(100) DEFAULT NULL COMMENT '皮肤样式',
  `loginSidebar` tinyint(1) DEFAULT NULL,
  `loginBoxed` tinyint(1) DEFAULT NULL,
  `loginScroll` tinyint(1) DEFAULT NULL,
  `loginPjax` tinyint(1) DEFAULT NULL,
  `unitid` varchar(32) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_USER_LOGINNAMAE` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('888035d9afaa4dab81dca8ba7f31f12a', 'superadmin', 'JFzgqmhMVJSqTpFUBoYmIKjgc8gzgfQ37jjomVwIkCo=', 'MldzV4fg7oWYkzr26gTx8w==', '超级管理员', '1', '0', 'wizzer@qq.com', '1541237306', '127.0.0.1', '12', null, 'palette.css', '0', '0', '0', '1', '86e142eb28024fdcbbe6d7d31b4426c7', '', '1540698621', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `userId` varchar(32) DEFAULT NULL,
  `roleId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('888035d9afaa4dab81dca8ba7f31f12a', '2657d81c9f4e45139fe20ee945975205');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_unit`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_unit`;
CREATE TABLE `sys_user_unit` (
  `userId` varchar(32) DEFAULT NULL,
  `unitId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user_unit`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_unit` VALUES ('888035d9afaa4dab81dca8ba7f31f12a', '86e142eb28024fdcbbe6d7d31b4426c7');
COMMIT;

-- ----------------------------
--  Table structure for `wx_config`
-- ----------------------------
DROP TABLE IF EXISTS `wx_config`;
CREATE TABLE `wx_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `appname` varchar(120) DEFAULT NULL COMMENT '公众号名称',
  `ghid` varchar(100) DEFAULT NULL COMMENT '原始ID',
  `appid` varchar(50) DEFAULT NULL COMMENT 'Appid',
  `appsecret` varchar(50) DEFAULT NULL COMMENT 'Appsecret',
  `encodingAESKey` varchar(100) DEFAULT NULL COMMENT 'EncodingAESKey',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `access_token` varchar(255) DEFAULT NULL COMMENT 'access_token',
  `access_token_expires` int(32) DEFAULT NULL COMMENT 'access_token_expires',
  `access_token_lastat` varchar(50) DEFAULT NULL COMMENT 'access_token_lastat',
  `payEnabled` tinyint(1) DEFAULT NULL COMMENT '禁用支付',
  `payInfo` text COMMENT '支付信息',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_mass`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mass`;
CREATE TABLE `wx_mass` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '群发名称',
  `type` varchar(20) DEFAULT NULL COMMENT '群发类型',
  `media_id` varchar(255) DEFAULT NULL COMMENT '媒体文件ID',
  `scope` varchar(20) DEFAULT NULL COMMENT 'Scope',
  `content` text COMMENT 'Content',
  `status` int(32) DEFAULT NULL COMMENT '发送状态',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_mass_news`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mass_news`;
CREATE TABLE `wx_mass_news` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `thumb_media_id` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `author` varchar(120) DEFAULT NULL COMMENT '作者',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content_source_url` varchar(255) DEFAULT NULL COMMENT '原地址',
  `content` text COMMENT '图文内容',
  `digest` text COMMENT '摘要',
  `show_cover_pic` int(32) DEFAULT NULL COMMENT '显示封面',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_mass_send`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mass_send`;
CREATE TABLE `wx_mass_send` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `massId` varchar(32) DEFAULT NULL COMMENT '群发ID',
  `receivers` text COMMENT 'Openid列表',
  `status` int(32) DEFAULT NULL COMMENT '发送状态',
  `msgId` varchar(32) DEFAULT NULL COMMENT 'msgId',
  `errCode` varchar(32) DEFAULT NULL COMMENT 'errCode',
  `errMsg` varchar(255) DEFAULT NULL COMMENT 'errMsg',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `menuName` varchar(20) DEFAULT NULL COMMENT '菜单名称',
  `menuType` varchar(20) DEFAULT NULL COMMENT '菜单类型',
  `menuKey` varchar(20) DEFAULT NULL COMMENT '关键词',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `appid` varchar(255) DEFAULT NULL COMMENT '小程序appid',
  `pagepath` varchar(255) DEFAULT NULL COMMENT '小程序入口页',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_msg`
-- ----------------------------
DROP TABLE IF EXISTS `wx_msg`;
CREATE TABLE `wx_msg` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `content` text COMMENT '信息内容',
  `replyId` varchar(32) DEFAULT NULL COMMENT '回复ID',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_msg_reply`
-- ----------------------------
DROP TABLE IF EXISTS `wx_msg_reply`;
CREATE TABLE `wx_msg_reply` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `msgid` varchar(32) DEFAULT NULL COMMENT 'msgid',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `content` text COMMENT '信息内容',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_reply`
-- ----------------------------
DROP TABLE IF EXISTS `wx_reply`;
CREATE TABLE `wx_reply` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `type` varchar(20) DEFAULT NULL COMMENT '回复类型',
  `msgType` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键词',
  `content` text COMMENT '回复内容',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_reply_news`
-- ----------------------------
DROP TABLE IF EXISTS `wx_reply_news`;
CREATE TABLE `wx_reply_news` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '摘要',
  `picUrl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '文章路径',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_reply_txt`
-- ----------------------------
DROP TABLE IF EXISTS `wx_reply_txt`;
CREATE TABLE `wx_reply_txt` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_tpl_id`
-- ----------------------------
DROP TABLE IF EXISTS `wx_tpl_id`;
CREATE TABLE `wx_tpl_id` (
  `id` varchar(32) NOT NULL COMMENT '模板编号',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板ID',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_tpl_list`
-- ----------------------------
DROP TABLE IF EXISTS `wx_tpl_list`;
CREATE TABLE `wx_tpl_list` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `template_id` varchar(100) DEFAULT NULL COMMENT '模板ID',
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `primary_industry` varchar(100) DEFAULT NULL COMMENT '主营行业',
  `deputy_industry` varchar(100) DEFAULT NULL COMMENT '副营行业',
  `content` varchar(300) DEFAULT NULL COMMENT '模板内容',
  `example` varchar(300) DEFAULT NULL COMMENT '模板示例',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_WX_TPL_LIST` (`template_id`,`wxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_tpl_log`
-- ----------------------------
DROP TABLE IF EXISTS `wx_tpl_log`;
CREATE TABLE `wx_tpl_log` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `content` text COMMENT '发送内容',
  `status` int(32) DEFAULT NULL COMMENT '发送状态',
  `result` text COMMENT '发送结果',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `unionid` varchar(50) DEFAULT NULL COMMENT 'unionid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `subscribe` tinyint(1) DEFAULT NULL COMMENT '是否关注',
  `subscribeAt` int(32) DEFAULT NULL COMMENT '关注时间',
  `sex` int(32) DEFAULT NULL COMMENT '性别',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_WX_USER_OPENID` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

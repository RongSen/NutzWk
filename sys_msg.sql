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

 Date: 11/01/2018 07:40:51 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;

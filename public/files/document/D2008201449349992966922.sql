/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : yuteng

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-08-10 16:42:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `archive`
-- ----------------------------
DROP TABLE IF EXISTS `archive`;
CREATE TABLE `archive` (
  `archive_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '档案id',
  `archive_user` char(8) NOT NULL COMMENT '档案用户',
  `archive_name` varchar(255) NOT NULL COMMENT '档案名称',
  `archive_file_name` varchar(255) NOT NULL COMMENT '档案文件名',
  `archive_file_size` decimal(4,2) NOT NULL COMMENT '档案文件大小',
  `archive_path` varchar(40) NOT NULL COMMENT '档案路径',
  `archive_createuser` char(8) NOT NULL COMMENT '档案创建用户',
  `archive_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '档案创建时间',
  PRIMARY KEY (`archive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '教案id',
  `document_name` varchar(30) NOT NULL COMMENT '教案名称',
  `document_department` int(10) unsigned NOT NULL COMMENT '教案校区',
  `document_subject` int(10) unsigned NOT NULL COMMENT '教案科目',
  `document_grade` int(10) unsigned NOT NULL COMMENT '教案年级',
  `document_semester` varchar(5) NOT NULL COMMENT '教案学期',
  `document_file_name` varchar(255) NOT NULL COMMENT '教案文件名',
  `document_file_size` decimal(4,2) NOT NULL COMMENT '教案文件大小',
  `document_path` varchar(40) NOT NULL COMMENT '教案路径',
  `document_createuser` char(8) NOT NULL COMMENT '教案创建用户',
  `document_download_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '教案下载次数',
  `document_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '教案创建时间',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `hour`
-- ----------------------------
DROP TABLE IF EXISTS `hour`;
CREATE TABLE `hour` (
  `hour_student` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `hour_course` int(10) unsigned NOT NULL COMMENT '课程id',
  `hour_remain` decimal(10,1) unsigned NOT NULL COMMENT '剩余课时',
  `hour_used` decimal(10,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '已用课时',
  `hour_average_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均单价',
  PRIMARY KEY (`hour_student`,`hour_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_class` char(10) NOT NULL COMMENT '班级id',
  `member_student` char(10) NOT NULL COMMENT '学生id',
  `member_course` char(10) NOT NULL COMMENT '课程id',
  `member_createuser` char(8) NOT NULL COMMENT '添加用户',
  `member_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`member_class`,`member_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `page_id` varchar(40) NOT NULL COMMENT '页面id',
  `page_name` varchar(15) NOT NULL COMMENT '页面名称',
  `page_category` varchar(10) NOT NULL DEFAULT '公司管理' COMMENT '页面类别',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('companyClassroom', '公司管理-教室设置', '公司管理');

-- ----------------------------
-- Table structure for `participant`
-- ----------------------------
DROP TABLE IF EXISTS `participant`;
CREATE TABLE `participant` (
  `participant_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上课成员记录id',
  `participant_schedule` int(10) unsigned NOT NULL COMMENT '课程安排id',
  `participant_student` char(10) NOT NULL COMMENT '学生成员id',
  `participant_attend_status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '学生考勤状态(1：正常，2：请假，3：旷课)',
  `participant_course` int(10) unsigned NOT NULL COMMENT '扣除课程id',
  `participant_amount` decimal(10,1) unsigned NOT NULL COMMENT '扣除课程课时数量',
  `participant_checked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '上课记录复核状态(0：待审核，1：已审核)',
  `participant_checked_user` char(8) NOT NULL DEFAULT '' COMMENT '上课记录复核用户',
  `participant_createuser` char(8) NOT NULL COMMENT '课程成员添加用户',
  `participant_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '课程成员添加时间',
  PRIMARY KEY (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6740 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participant
-- ----------------------------


-- ----------------------------
-- Table structure for `payment_method`
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `payment_method_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付方式id',
  `payment_method_name` varchar(5) NOT NULL COMMENT '支付方式名称',
  `payment_method_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '支付方式可用状态(0：删除，1：可用)',
  `payment_method_createuser` char(8) NOT NULL COMMENT '支付方式创建用户',
  `payment_method_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付方式创建时间',
  PRIMARY KEY (`payment_method_id`),
  UNIQUE KEY `payment_method_name` (`payment_method_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_method
-- ----------------------------
INSERT INTO `payment_method` VALUES ('1', '现金', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `payment_method` VALUES ('2', '银行', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `payment_method` VALUES ('3', '微信', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `payment_method` VALUES ('4', '支付宝', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `payment_method` VALUES ('5', '其它', '1', 'yuto2018', '2020-01-02 10:58:04');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `position_name` varchar(10) NOT NULL COMMENT '岗位名称',
  `position_section` int(10) unsigned NOT NULL COMMENT '岗位所属部门',
  `position_level` int(10) unsigned NOT NULL COMMENT '岗位等级',
  `position_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '岗位可用状态(0：删除，1：可用)',
  `position_createuser` char(8) NOT NULL COMMENT '岗位创建用户',
  `position_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '岗位创建时间',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '育藤总经理', '1', '1', '1', 'yuto2018', '2020-01-01 21:06:19');
INSERT INTO `position` VALUES ('27', '教学经理', '1', '3', '1', 'yuto2018', '2020-07-04 08:17:20');
INSERT INTO `position` VALUES ('28', '教研院长', '1', '3', '1', 'yuto2018', '2020-07-04 08:18:04');
INSERT INTO `position` VALUES ('29', '市场总监', '1', '3', '1', 'yuto2018', '2020-07-04 08:18:33');
INSERT INTO `position` VALUES ('30', '行政主管', '9', '6', '1', 'yuto2018', '2020-07-04 08:18:58');
INSERT INTO `position` VALUES ('31', '财务专员', '9', '8', '1', 'yuto2018', '2020-07-04 08:19:51');
INSERT INTO `position` VALUES ('32', '人事专员', '9', '8', '1', 'yuto2018', '2020-07-04 08:20:14');
INSERT INTO `position` VALUES ('33', '咨询主管', '10', '6', '1', 'yuto2018', '2020-07-04 08:21:04');
INSERT INTO `position` VALUES ('34', '校长', '1', '5', '1', 'yuto2018', '2020-07-04 08:22:14');
INSERT INTO `position` VALUES ('35', '运营主管', '11', '6', '1', 'yuto2018', '2020-07-04 08:23:03');
INSERT INTO `position` VALUES ('36', '教学主管', '12', '6', '1', 'yuto2018', '2020-07-04 08:23:21');
INSERT INTO `position` VALUES ('37', '课程顾问', '10', '9', '1', 'yuto2018', '2020-07-04 08:23:45');
INSERT INTO `position` VALUES ('38', '班主任', '11', '8', '1', 'yuto2018', '2020-07-04 08:24:12');
INSERT INTO `position` VALUES ('39', '语文老师', '12', '8', '1', 'yuto2018', '2020-07-04 08:24:39');
INSERT INTO `position` VALUES ('40', '数学老师', '12', '8', '1', 'yuto2018', '2020-07-04 08:25:12');
INSERT INTO `position` VALUES ('41', '英语老师', '12', '8', '1', 'yuto2018', '2020-07-04 08:25:36');
INSERT INTO `position` VALUES ('42', '物理老师', '12', '8', '1', 'yuto2018', '2020-07-04 08:25:59');
INSERT INTO `position` VALUES ('43', '化学老师', '12', '8', '1', 'yuto2018', '2020-07-04 08:26:23');
INSERT INTO `position` VALUES ('44', '地理老师', '12', '9', '1', 'yuto2018', '2020-07-08 16:49:12');

-- ----------------------------
-- Table structure for `refund`
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款原因id',
  `refund_student` char(10) NOT NULL COMMENT '学生id',
  `refund_course` int(10) unsigned NOT NULL COMMENT '课程id',
  `refund_remain` decimal(10,1) unsigned NOT NULL COMMENT '退款剩余课时数量',
  `refund_used` decimal(10,1) unsigned NOT NULL COMMENT '退款前已使用课时数量',
  `refund_unit_price` decimal(10,2) NOT NULL COMMENT '购课原单价',
  `refund_amount` decimal(10,2) NOT NULL COMMENT '实际退款金额',
  `refund_reason` varchar(10) NOT NULL COMMENT '退费原因',
  `refund_payment_method` varchar(5) NOT NULL COMMENT '退费付款方式',
  `refund_date` date NOT NULL COMMENT '退费日期',
  `refund_remark` varchar(255) NOT NULL COMMENT '退费备注',
  `refund_checked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '退费审核状态(0：未审核，1：已审核)',
  `refund_checked_user` char(8) NOT NULL DEFAULT '' COMMENT '退费复核用户',
  `refund_createuser` char(8) NOT NULL COMMENT '添加用户',
  `refund_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `refund_reason`
-- ----------------------------
DROP TABLE IF EXISTS `refund_reason`;
CREATE TABLE `refund_reason` (
  `refund_reason_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款原因id',
  `refund_reason_name` varchar(10) NOT NULL COMMENT '退款原因名称',
  `refund_reason_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '退款原因可用状态(0：删除，1：可用)',
  `refund_reason_createuser` char(8) NOT NULL COMMENT '退款原因创建用户',
  `refund_reason_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '退款原因创建时间',
  PRIMARY KEY (`refund_reason_id`),
  UNIQUE KEY `refund_reason_name` (`refund_reason_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refund_reason
-- ----------------------------
INSERT INTO `refund_reason` VALUES ('1', '教学质量', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `refund_reason` VALUES ('2', '学生转课', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `refund_reason` VALUES ('3', '学生转学', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `refund_reason` VALUES ('4', '购课过多', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `refund_reason` VALUES ('5', '收费价格', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `refund_reason` VALUES ('6', '学生纪律', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `refund_reason` VALUES ('7', '其它原因', '1', 'yuto2018', '2020-01-02 10:58:04');

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程安排id',
  `schedule_department` int(10) unsigned NOT NULL COMMENT '课程安排校区',
  `schedule_participant` char(10) NOT NULL COMMENT '学生或班级id',
  `schedule_participant_type` tinyint(4) NOT NULL COMMENT '上课成员类型(0：学生，1：班级)',
  `schedule_teacher` char(8) NOT NULL COMMENT '教师id',
  `schedule_course` int(10) unsigned NOT NULL COMMENT '课程id',
  `schedule_subject` int(10) unsigned NOT NULL COMMENT '课程科目',
  `schedule_grade` int(10) unsigned NOT NULL COMMENT '课程年级',
  `schedule_classroom` int(10) unsigned NOT NULL COMMENT '课程教室',
  `schedule_date` date NOT NULL COMMENT '课程安排日期',
  `schedule_start` time NOT NULL COMMENT '课程安排上课时间',
  `schedule_end` time NOT NULL COMMENT '课程安排下课时间',
  `schedule_time` int(10) unsigned NOT NULL COMMENT '课程时长',
  `schedule_student_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程人数',
  `schedule_attended_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '正常上课人数',
  `schedule_leave_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '请假人数',
  `schedule_absence_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '旷课人数',
  `schedule_attended` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程安排考勤状态(0：待考勤，1：已上课)',
  `schedule_attended_user` char(8) NOT NULL DEFAULT '' COMMENT '课程安排考勤用户',
  `schedule_createuser` char(8) NOT NULL COMMENT '课程安排添加用户',
  `schedule_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '课程安排添加时间',
  PRIMARY KEY (`schedule_id`),
  KEY `index_schedule_techer` (`schedule_teacher`),
  KEY `index_schedule_participant` (`schedule_participant`)
) ENGINE=InnoDB AUTO_INCREMENT=8215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `section_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `section_name` varchar(10) NOT NULL COMMENT '部门名称',
  `section_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '部门可用状态(0：删除，1：可用)',
  `section_createuser` char(8) NOT NULL COMMENT '部门创建用户',
  `section_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '部门创建时间',
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `section_name` (`section_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', '总经办', '1', 'yuto2018', '2020-01-01 21:06:19');
INSERT INTO `section` VALUES ('9', '行政部', '1', 'yuto2018', '2020-07-04 08:14:33');
INSERT INTO `section` VALUES ('10', '咨询部', '1', 'yuto2018', '2020-07-04 08:14:49');
INSERT INTO `section` VALUES ('11', '运营部', '1', 'yuto2018', '2020-07-04 08:15:49');
INSERT INTO `section` VALUES ('12', '教学部', '1', 'yuto2018', '2020-07-04 08:16:03');
INSERT INTO `section` VALUES ('13', '校长', '0', 'yuto2018', '2020-07-04 08:20:29');

-- ----------------------------
-- Table structure for `source`
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '来源id',
  `source_name` varchar(10) NOT NULL COMMENT '来源名称',
  `source_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '来源可用状态(0：删除，1：可用)',
  `source_createuser` char(8) NOT NULL COMMENT '来源创建用户',
  `source_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '来源创建时间',
  PRIMARY KEY (`source_id`),
  UNIQUE KEY `source_name` (`source_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES ('1', '学生转介绍', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('2', '客户转介绍', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('3', '员工转介绍', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('4', '短信', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('5', '广告', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('6', '传单', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('7', '网络', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('8', '地推', '1', 'yuto2018', '2020-01-02 10:58:04');
INSERT INTO `source` VALUES ('9', '其它', '1', 'yuto2018', '2020-01-02 10:58:04');

-- ----------------------------
-- Table structure for `user_department`
-- ----------------------------
DROP TABLE IF EXISTS `user_department`;
CREATE TABLE `user_department` (
  `user_department_user` char(8) NOT NULL COMMENT '用户id',
  `user_department_department` int(10) unsigned NOT NULL COMMENT '用户校区权限',
  PRIMARY KEY (`user_department_user`,`user_department_department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `user_page`
-- ----------------------------
DROP TABLE IF EXISTS `user_page`;
CREATE TABLE `user_page` (
  `user_page_user` char(8) NOT NULL COMMENT '用户id',
  `user_page_page` varchar(40) NOT NULL COMMENT '用户权限页面',
  PRIMARY KEY (`user_page_user`,`user_page_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



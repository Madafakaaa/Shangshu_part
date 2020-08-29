/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : shangshu

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-08-29 14:14:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `access`
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `access_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面权限id',
  `access_category` varchar(10) NOT NULL COMMENT '类别名称',
  `access_page` varchar(10) NOT NULL COMMENT '页面名称',
  `access_feature` varchar(10) NOT NULL COMMENT '功能名称',
  `access_controller` varchar(40) NOT NULL COMMENT '控制器/页面',
  `access_function` varchar(30) NOT NULL COMMENT '页面控制器函数',
  `access_url` varchar(40) NOT NULL COMMENT '页面url',
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES ('1', '公司管理', '校区设置', '查看', 'CompanyDepartmentController', 'department', '/company/department');
INSERT INTO `access` VALUES ('2', '公司管理', '校区设置', '添加', 'CompanyDepartmentController', 'departmentCreate', '/company/department/create');
INSERT INTO `access` VALUES ('3', '公司管理', '校区设置', '修改', 'CompanyDepartmentController', 'departmentEdit', '/company/department/edit');
INSERT INTO `access` VALUES ('4', '公司管理', '校区设置', '删除', 'CompanyDepartmentController', 'departmentDelete', '/company/department/delete');
INSERT INTO `access` VALUES ('5', '公司管理', '课程设置', '查看', 'CompanyCourseController', 'course', '/company/course');
INSERT INTO `access` VALUES ('6', '公司管理', '课程设置', '添加', 'CompanyCourseController', 'courseCreate', '/company/course/create');
INSERT INTO `access` VALUES ('7', '公司管理', '课程设置', '修改', 'CompanyCourseController', 'courseEdit', '/company/course/edit');
INSERT INTO `access` VALUES ('8', '公司管理', '课程设置', '停课', 'CompanyCourseController', 'courseDelete', '/company/course/delete');
INSERT INTO `access` VALUES ('9', '公司管理', '课程设置', '恢复', 'CompanyCourseController', 'courseRestore', '/company/course/restore');
INSERT INTO `access` VALUES ('10', '公司管理', '晚托设置', '查看', 'CompanyDaycareController', 'daycare', '/company/daycare');
INSERT INTO `access` VALUES ('11', '公司管理', '晚托设置', '添加', 'CompanyDaycareController', 'daycareCreate', '/company/daycare/create');
INSERT INTO `access` VALUES ('12', '公司管理', '晚托设置', '修改', 'CompanyDaycareController', 'daycareEdit', '/company/daycare/edit');
INSERT INTO `access` VALUES ('13', '公司管理', '晚托设置', '停课', 'CompanyDaycareController', 'daycareDelete', '/company/daycare/delete');
INSERT INTO `access` VALUES ('14', '公司管理', '晚托设置', '恢复', 'CompanyDaycareController', 'daycareRestore', '/company/daycare/restore');
INSERT INTO `access` VALUES ('15', '公司管理', '用户管理', '查看', 'CompanyUserController', 'user', '/company/user');
INSERT INTO `access` VALUES ('16', '公司管理', '用户管理', '添加', 'CompanyUserController', 'userCreate', '/company/user/create');
INSERT INTO `access` VALUES ('17', '公司管理', '用户管理', '修改', 'CompanyUserController', 'userEdit', '/company/user/edit');
INSERT INTO `access` VALUES ('18', '公司管理', '用户管理', '删除', 'CompanyUserController', 'userDelete', '/company/user/delete');
INSERT INTO `access` VALUES ('19', '公司管理', '用户管理', '权限', 'CompanyUserController', 'userAccess', '/company/user/access');
INSERT INTO `access` VALUES ('20', '公司管理', '教师评级', '查看', 'CompanyTeacherTypeController', 'teacherType', '/company/teacherType');
INSERT INTO `access` VALUES ('21', '公司管理', '教师评级', '添加', 'CompanyTeacherTypeController', 'teacherTypeCreate', '/company/teacherType/create');
INSERT INTO `access` VALUES ('22', '公司管理', '教师评级', '修改', 'CompanyTeacherTypeController', 'teacherTypeEdit', '/company/teacherType/edit');
INSERT INTO `access` VALUES ('23', '公司管理', '员工工资', '查看', 'CompanySalaryController', 'salary', '/company/salary');
INSERT INTO `access` VALUES ('24', '公司管理', '员工工资', '结算', 'CompanySalaryController', 'salaryCreate', '/company/salary/create');
INSERT INTO `access` VALUES ('25', '教务运营', '学生管理', '查看', 'EducationStudentController', 'student', '/education/student');
INSERT INTO `access` VALUES ('26', '教务运营', '学生管理', '添加', 'EducationStudentController', 'studentCreate', '/education/student/create');
INSERT INTO `access` VALUES ('27', '教务运营', '学生管理', '删除', 'EducationStudentController', 'studentDelete', '/education/student/delete');
INSERT INTO `access` VALUES ('28', '教务运营', '学生管理', '购课时', 'EducationStudentController', 'studentPaymentCreate', '/education/student/payment/create');
INSERT INTO `access` VALUES ('29', '教务运营', '学生管理', '购晚托', 'EducationStudentController', 'studentDaycareCreate', '/education/student/daycare/create');
INSERT INTO `access` VALUES ('30', '教务运营', '学生课时', '查看', 'EducationHourController', 'hour', '/education/hour');
INSERT INTO `access` VALUES ('31', '教务运营', '学生课时', '退费', 'EducationHourController', 'hourRefundCreate', '/education/hour/refund/create');
INSERT INTO `access` VALUES ('32', '教务运营', '学生晚托', '查看', 'EducationDaycareController', 'daycare', '/education/daycare');
INSERT INTO `access` VALUES ('33', '教务运营', '学生晚托', '退费', 'EducationDaycareController', 'daycareRefundCreate', '/education/daycare/refund/create');
INSERT INTO `access` VALUES ('34', '教务运营', '班级管理', '查看', 'EducationClassController', 'class', '/education/class');
INSERT INTO `access` VALUES ('35', '教务运营', '班级管理', '添加', 'EducationClassController', 'classCreate', '/education/class/create');
INSERT INTO `access` VALUES ('36', '教务运营', '班级管理', '删除', 'EducationClassController', 'classDelete', '/education/class/delete');
INSERT INTO `access` VALUES ('37', '教务运营', '班级管理', '点名', 'EducationClassController', 'classLessonCreate', '/education/class/lesson/create');
INSERT INTO `access` VALUES ('38', '教务运营', '上课记录', '查看', 'EducationLessonController', 'lesson', '/education/lesson');
INSERT INTO `access` VALUES ('39', '教务运营', '上课记录', '复核', 'EducationLessonController', 'lessonReview', '/education/lesson/review');
INSERT INTO `access` VALUES ('40', '教务运营', '上课记录', '删除', 'EducationLessonController', 'lessonDelete', '/education/lesson/delete');
INSERT INTO `access` VALUES ('41', '财务中心', '购课记录', '查看', 'FinancePaymentController', 'payment', '/finance/payment');
INSERT INTO `access` VALUES ('42', '财务中心', '购课记录', '复核', 'FinancePaymentController', 'paymentReview', '/finance/payment/review');
INSERT INTO `access` VALUES ('43', '财务中心', '购课记录', '删除', 'FinancePaymentController', 'paymentDelete', '/finance/payment/delete');
INSERT INTO `access` VALUES ('44', '财务中心', '购晚托记录', '查看', 'FinanceDaycareRecordController', 'daycareRecord', '/finance/daycareRecord');
INSERT INTO `access` VALUES ('45', '财务中心', '购晚托记录', '复核', 'FinanceDaycareRecordController', 'daycareRecordReview', '/finance/daycareRecord/review');
INSERT INTO `access` VALUES ('46', '财务中心', '购晚托记录', '删除', 'FinanceDaycareRecordController', 'daycareRecordDelete', '/finance/daycareRecord/delete');
INSERT INTO `access` VALUES ('47', '财务中心', '课时退费记录', '查看', 'FinanceRefundPaymentController', 'refundPayment', '/finance/refund/payment');
INSERT INTO `access` VALUES ('48', '财务中心', '课时退费记录', '复核', 'FinanceRefundPaymentController', 'refundPaymentReview', '/finance/refund/payment/review');
INSERT INTO `access` VALUES ('49', '财务中心', '晚托退费记录', '查看', 'FinanceRefundDaycareController', 'refundDaycare', '/finance/refund/daycare');
INSERT INTO `access` VALUES ('50', '财务中心', '晚托退费记录', '复核', 'FinanceRefundDaycareController', 'refundDaycareReview', '/finance/refund/daycare/review');
INSERT INTO `access` VALUES ('51', '详情资料', '学生详情', '查看', 'StudentController', 'student', '/student');
INSERT INTO `access` VALUES ('52', '详情资料', '班级详情', '查看', 'ClassController', 'class', '/class');
INSERT INTO `access` VALUES ('53', '详情资料', '用户详情', '查看', 'UserController', 'user', '/user');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` char(10) NOT NULL COMMENT '班级id',
  `class_name` varchar(20) NOT NULL COMMENT '班级名称',
  `class_department` int(10) unsigned NOT NULL COMMENT '班级校区',
  `class_grade` int(10) unsigned NOT NULL COMMENT '班级年级',
  `class_subject` int(10) unsigned NOT NULL COMMENT '班级科目',
  `class_teacher` char(8) NOT NULL COMMENT '负责教师',
  `class_max_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '班级最大人数',
  `class_current_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级当前人数',
  `class_attended_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级上课记录数量',
  `class_is_available` tinyint(4) NOT NULL DEFAULT '1' COMMENT '班级可用状态(0：删除，1：可用)',
  `class_create_user` char(8) NOT NULL COMMENT '班级创建用户',
  `class_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '班级创建时间',
  `class_modified_user` char(8) NOT NULL COMMENT '班级修改用户',
  `class_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '班级修改时间',
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_name` (`class_name`,`class_department`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `course_name` varchar(10) NOT NULL COMMENT '课程名称',
  `course_grade` int(10) unsigned NOT NULL COMMENT '课程年级',
  `course_type` int(10) NOT NULL COMMENT '课程人数类型',
  `course_quarter` char(2) NOT NULL COMMENT '课程季度',
  `course_unit_price` decimal(10,2) NOT NULL COMMENT '课程单价',
  `course_is_available` tinyint(4) NOT NULL DEFAULT '1' COMMENT '课程可用状态(0：删除，1：可用)',
  `course_create_user` char(8) NOT NULL COMMENT '课程创建用户',
  `course_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '课程创建时间',
  `course_modified_user` char(8) NOT NULL COMMENT '课程修改用户',
  `course_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '课程修改时间',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name` (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `daycare`
-- ----------------------------
DROP TABLE IF EXISTS `daycare`;
CREATE TABLE `daycare` (
  `daycare_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 晚托id',
  `daycare_name` varchar(10) NOT NULL COMMENT '晚托名称',
  `daycare_grade` int(10) unsigned NOT NULL COMMENT '晚托年级',
  `daycare_unit_price` decimal(10,2) NOT NULL COMMENT '晚托单价(元/30天)',
  `daycare_is_available` tinyint(4) NOT NULL DEFAULT '1' COMMENT '晚托可用状态(0：删除，1：可用)',
  `daycare_create_user` char(8) NOT NULL COMMENT '晚托创建用户',
  `daycare_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '晚托创建时间',
  `daycare_modified_user` char(8) NOT NULL COMMENT '晚托修改用户',
  `daycare_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '晚托修改时间',
  PRIMARY KEY (`daycare_id`),
  UNIQUE KEY `daycare_name` (`daycare_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daycare
-- ----------------------------

-- ----------------------------
-- Table structure for `daycare_record`
-- ----------------------------
DROP TABLE IF EXISTS `daycare_record`;
CREATE TABLE `daycare_record` (
  `daycare_record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 晚托记录id',
  `daycare_record_daycare` int(10) unsigned NOT NULL COMMENT '晚托记录晚托',
  `daycare_record_daycare_unit_price` decimal(10,2) unsigned NOT NULL COMMENT '晚托单价',
  `daycare_record_student` char(10) NOT NULL COMMENT '晚托记录学生',
  `daycare_record_month` decimal(10,1) unsigned NOT NULL COMMENT '购买月数',
  `daycare_record_original_price` decimal(10,2) unsigned NOT NULL COMMENT '折前费用',
  `daycare_record_discount_percentage` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣优惠',
  `daycare_record_discount_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `daycare_record_discount_total` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '共计优惠金额',
  `daycare_record_total_price` decimal(10,2) unsigned NOT NULL COMMENT '实际付款',
  `daycare_record_method` char(5) NOT NULL DEFAULT '现金' COMMENT '付款方式',
  `daycare_record_remark` varchar(50) DEFAULT '' COMMENT '购晚托备注',
  `daycare_record_date` date NOT NULL COMMENT '购晚托日期',
  `daycare_record_start` date NOT NULL COMMENT '晚托开始日期',
  `daycare_record_end` date NOT NULL COMMENT '晚托结束日期',
  `daycare_record_is_refunded` tinyint(4) NOT NULL DEFAULT '0' COMMENT '晚托退费状态(0：未退费，1：已退费)',
  `daycare_record_create_user` char(8) NOT NULL COMMENT '晚托记录创建用户',
  `daycare_record_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '晚托记录创建时间',
  `daycare_record_review_user` char(8) DEFAULT NULL COMMENT '晚托记录复核用户',
  `daycare_record_review_time` timestamp NULL DEFAULT NULL COMMENT '晚托记录复核时间',
  PRIMARY KEY (`daycare_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daycare_record
-- ----------------------------

-- ----------------------------
-- Table structure for `daycare_refund`
-- ----------------------------
DROP TABLE IF EXISTS `daycare_refund`;
CREATE TABLE `daycare_refund` (
  `daycare_refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '晚托退款id',
  `daycare_refund_student` char(10) NOT NULL COMMENT '学生id',
  `daycare_refund_daycare_record` int(10) unsigned NOT NULL COMMENT '晚托购买记录id',
  `daycare_refund_fee` decimal(10,2) NOT NULL COMMENT '实际退款金额',
  `daycare_refund_date` date NOT NULL COMMENT '退费日期',
  `daycare_refund_method` varchar(30) NOT NULL COMMENT '退费付款方式账户',
  `daycare_refund_remark` varchar(50) NOT NULL COMMENT '退费备注',
  `daycare_refund_reviewed_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '退费审核状态(0：未审核，1：通过，2：拒绝)',
  `daycare_refund_reviewed_user` char(8) DEFAULT NULL COMMENT '退费审核用户',
  `daycare_refund_reviewed_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `daycare_refund_create_user` char(8) NOT NULL COMMENT '添加用户',
  `daycare_refund_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`daycare_refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daycare_refund
-- ----------------------------

-- ----------------------------
-- Table structure for `deduction`
-- ----------------------------
DROP TABLE IF EXISTS `deduction`;
CREATE TABLE `deduction` (
  `deduction_teacher_type` int(10) unsigned NOT NULL COMMENT '教师评级',
  `deduction_grade` int(10) unsigned NOT NULL COMMENT '年级id',
  `deduction_student_num` int(10) unsigned NOT NULL COMMENT '上课人数',
  `deduction_fee` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课时费',
  `deduction_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提成创建时间',
  PRIMARY KEY (`deduction_teacher_type`,`deduction_grade`,`deduction_student_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deduction
-- ----------------------------
INSERT INTO `deduction` VALUES ('1', '1', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '1', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '1', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '1', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '1', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '1', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '2', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '2', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '2', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '2', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '2', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '2', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '3', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '3', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '3', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '3', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '3', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '3', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '4', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '4', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '4', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '4', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '4', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '4', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '5', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '5', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '5', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '5', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '5', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '5', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '6', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '6', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '6', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '6', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '6', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '6', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '7', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '7', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '7', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '7', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '7', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '7', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '8', '1', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '8', '2', '50', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '8', '3', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '8', '4', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '8', '5', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '8', '6', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '9', '1', '60', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '9', '2', '60', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '9', '3', '80', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '9', '4', '100', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '9', '5', '120', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '9', '6', '140', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '10', '1', '60', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '10', '2', '60', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '10', '3', '80', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '10', '4', '100', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '10', '5', '120', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '10', '6', '140', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '11', '1', '60', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '11', '2', '60', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '11', '3', '80', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '11', '4', '100', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '11', '5', '120', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '11', '6', '140', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '12', '1', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '12', '2', '70', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '12', '3', '90', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '12', '4', '110', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '12', '5', '130', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('1', '12', '6', '150', '2019-08-09 20:49:11');
INSERT INTO `deduction` VALUES ('2', '1', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '1', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '1', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '1', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '1', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '1', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '2', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '2', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '2', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '2', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '2', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '2', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '3', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '3', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '3', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '3', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '3', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '3', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '4', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '4', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '4', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '4', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '4', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '4', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '5', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '5', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '5', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '5', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '5', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '5', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '6', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '6', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '6', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '6', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '6', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '6', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '7', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '7', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '7', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '7', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '7', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '7', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '8', '1', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '8', '2', '40', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '8', '3', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '8', '4', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '8', '5', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '8', '6', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '9', '1', '50', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '9', '2', '50', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '9', '3', '70', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '9', '4', '90', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '9', '5', '110', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '9', '6', '130', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '10', '1', '50', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '10', '2', '50', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '10', '3', '70', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '10', '4', '90', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '10', '5', '110', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '10', '6', '130', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '11', '1', '50', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '11', '2', '50', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '11', '3', '70', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '11', '4', '90', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '11', '5', '110', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '11', '6', '130', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '12', '1', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '12', '2', '60', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '12', '3', '80', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '12', '4', '100', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '12', '5', '120', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('2', '12', '6', '140', '2019-08-10 12:44:56');
INSERT INTO `deduction` VALUES ('3', '1', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '1', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '1', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '1', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '1', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '1', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '2', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '2', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '2', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '2', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '2', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '2', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '3', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '3', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '3', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '3', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '3', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '3', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '4', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '4', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '4', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '4', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '4', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '4', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '5', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '5', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '5', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '5', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '5', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '5', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '6', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '6', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '6', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '6', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '6', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '6', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '7', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '7', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '7', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '7', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '7', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '7', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '8', '1', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '8', '2', '60', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '8', '3', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '8', '4', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '8', '5', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '8', '6', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '9', '1', '70', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '9', '2', '70', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '9', '3', '90', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '9', '4', '110', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '9', '5', '130', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '9', '6', '150', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '10', '1', '70', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '10', '2', '70', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '10', '3', '90', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '10', '4', '110', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '10', '5', '130', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '10', '6', '150', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '11', '1', '70', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '11', '2', '70', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '11', '3', '90', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '11', '4', '110', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '11', '5', '130', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '11', '6', '150', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '12', '1', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '12', '2', '80', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '12', '3', '100', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '12', '4', '120', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '12', '5', '140', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('3', '12', '6', '160', '2019-08-10 12:45:12');
INSERT INTO `deduction` VALUES ('4', '1', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '1', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '1', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '1', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '1', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '1', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '2', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '2', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '2', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '2', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '2', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '2', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '3', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '3', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '3', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '3', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '3', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '3', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '4', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '4', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '4', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '4', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '4', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '4', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '5', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '5', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '5', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '5', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '5', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '5', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '6', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '6', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '6', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '6', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '6', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '6', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '7', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '7', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '7', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '7', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '7', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '7', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '8', '1', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '8', '2', '70', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '8', '3', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '8', '4', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '8', '5', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '8', '6', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '9', '1', '80', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '9', '2', '80', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '9', '3', '100', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '9', '4', '120', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '9', '5', '120', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '9', '6', '160', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '10', '1', '80', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '10', '2', '80', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '10', '3', '100', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '10', '4', '120', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '10', '5', '140', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '10', '6', '160', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '11', '1', '80', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '11', '2', '80', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '11', '3', '100', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '11', '4', '120', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '11', '5', '140', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '11', '6', '160', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '12', '1', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '12', '2', '90', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '12', '3', '110', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '12', '4', '130', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '12', '5', '150', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('4', '12', '6', '170', '2019-08-10 12:45:29');
INSERT INTO `deduction` VALUES ('5', '1', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '1', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '1', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '1', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '1', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '1', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '2', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '2', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '2', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '2', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '2', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '2', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '3', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '3', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '3', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '3', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '3', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '3', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '4', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '4', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '4', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '4', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '4', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '4', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '5', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '5', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '5', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '5', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '5', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '5', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '6', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '6', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '6', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '6', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '6', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '6', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '7', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '7', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '7', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '7', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '7', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '7', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '8', '1', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '8', '2', '200', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '8', '3', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '8', '4', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '8', '5', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '8', '6', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '9', '1', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '9', '2', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '9', '3', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '9', '4', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '9', '5', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '9', '6', '450', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '10', '1', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '10', '2', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '10', '3', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '10', '4', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '10', '5', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '10', '6', '450', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '11', '1', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '11', '2', '250', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '11', '3', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '11', '4', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '11', '5', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '11', '6', '450', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '12', '1', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '12', '2', '300', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '12', '3', '350', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '12', '4', '400', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '12', '5', '450', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('5', '12', '6', '500', '2019-08-10 12:45:41');
INSERT INTO `deduction` VALUES ('6', '1', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '1', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '1', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '1', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '1', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '1', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '2', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '2', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '2', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '2', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '2', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '2', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '3', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '3', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '3', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '3', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '3', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '3', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '4', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '4', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '4', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '4', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '4', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '4', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '5', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '5', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '5', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '5', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '5', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '5', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '6', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '6', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '6', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '6', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '6', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '6', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '7', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '7', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '7', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '7', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '7', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '7', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '8', '1', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '8', '2', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '8', '3', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '8', '4', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '8', '5', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '8', '6', '40', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '9', '1', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '9', '2', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '9', '3', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '9', '4', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '9', '5', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '9', '6', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '10', '1', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '10', '2', '50', '2019-08-10 13:00:56');
INSERT INTO `deduction` VALUES ('6', '10', '3', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '10', '4', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '10', '5', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '10', '6', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '11', '1', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '11', '2', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '11', '3', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '11', '4', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '11', '5', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '11', '6', '50', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '12', '1', '60', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '12', '2', '60', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '12', '3', '60', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '12', '4', '60', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '12', '5', '60', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('6', '12', '6', '60', '2019-08-10 13:00:57');
INSERT INTO `deduction` VALUES ('7', '1', '1', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '1', '2', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '1', '3', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '1', '4', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '1', '5', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '1', '6', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '2', '1', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '2', '2', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '2', '3', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '2', '4', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '2', '5', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '2', '6', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '3', '1', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '3', '2', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '3', '3', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '3', '4', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '3', '5', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '3', '6', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '4', '1', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '4', '2', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '4', '3', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '4', '4', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '4', '5', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '4', '6', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '5', '1', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '5', '2', '70', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '5', '3', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '5', '4', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '5', '5', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '5', '6', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '6', '1', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '6', '2', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '6', '3', '100', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '6', '4', '120', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '6', '5', '140', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '6', '6', '160', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '7', '1', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '7', '2', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '7', '3', '100', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '7', '4', '120', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '7', '5', '140', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '7', '6', '160', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '8', '1', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '8', '2', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '8', '3', '100', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '8', '4', '120', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '8', '5', '140', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '8', '6', '160', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '9', '1', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '9', '2', '80', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '9', '3', '100', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '9', '4', '120', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '9', '5', '140', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '9', '6', '160', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '10', '1', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '10', '2', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '10', '3', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '10', '4', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '10', '5', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '10', '6', '170', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '11', '1', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '11', '2', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '11', '3', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '11', '4', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '11', '5', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '11', '6', '170', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '12', '1', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '12', '2', '90', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '12', '3', '110', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '12', '4', '130', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '12', '5', '150', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('7', '12', '6', '170', '2019-10-11 09:37:57');
INSERT INTO `deduction` VALUES ('8', '1', '1', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '1', '2', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '1', '3', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '1', '4', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '1', '5', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '1', '6', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '2', '1', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '2', '2', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '2', '3', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '2', '4', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '2', '5', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '2', '6', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '3', '1', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '3', '2', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '3', '3', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '3', '4', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '3', '5', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '3', '6', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '4', '1', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '4', '2', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '4', '3', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '4', '4', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '4', '5', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '4', '6', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '5', '1', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '5', '2', '60', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '5', '3', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '5', '4', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '5', '5', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '5', '6', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '6', '1', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '6', '2', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '6', '3', '90', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '6', '4', '110', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '6', '5', '130', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '6', '6', '150', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '7', '1', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '7', '2', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '7', '3', '90', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '7', '4', '110', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '7', '5', '130', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '7', '6', '150', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '8', '1', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '8', '2', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '8', '3', '90', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '8', '4', '110', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '8', '5', '130', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '8', '6', '150', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '9', '1', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '9', '2', '70', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '9', '3', '90', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '9', '4', '110', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '9', '5', '130', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '9', '6', '150', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '10', '1', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '10', '2', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '10', '3', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '10', '4', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '10', '5', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '10', '6', '160', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '11', '1', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '11', '2', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '11', '3', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '11', '4', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '11', '5', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '11', '6', '160', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '12', '1', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '12', '2', '80', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '12', '3', '100', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '12', '4', '120', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '12', '5', '140', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('8', '12', '6', '160', '2019-10-11 09:38:17');
INSERT INTO `deduction` VALUES ('9', '1', '1', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '1', '2', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '1', '3', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '1', '4', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '1', '5', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '1', '6', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '2', '1', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '2', '2', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '2', '3', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '2', '4', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '2', '5', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '2', '6', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '3', '1', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '3', '2', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '3', '3', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '3', '4', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '3', '5', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '3', '6', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '4', '1', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '4', '2', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '4', '3', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '4', '4', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '4', '5', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '4', '6', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '5', '1', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '5', '2', '50', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '5', '3', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '5', '4', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '5', '5', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '5', '6', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '6', '1', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '6', '2', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '6', '3', '80', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '6', '4', '100', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '6', '5', '120', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '6', '6', '140', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '7', '1', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '7', '2', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '7', '3', '80', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '7', '4', '100', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '7', '5', '120', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '7', '6', '140', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '8', '1', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '8', '2', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '8', '3', '80', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '8', '4', '100', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '8', '5', '120', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '8', '6', '140', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '9', '1', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '9', '2', '60', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '9', '3', '80', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '9', '4', '100', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '9', '5', '120', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '9', '6', '140', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '10', '1', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '10', '2', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '10', '3', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '10', '4', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '10', '5', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '10', '6', '150', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '11', '1', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '11', '2', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '11', '3', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '11', '4', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '11', '5', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '11', '6', '150', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '12', '1', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '12', '2', '70', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '12', '3', '90', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '12', '4', '110', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '12', '5', '130', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('9', '12', '6', '150', '2019-10-11 13:39:20');
INSERT INTO `deduction` VALUES ('10', '1', '1', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '1', '2', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '1', '3', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '1', '4', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '1', '5', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '1', '6', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '2', '1', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '2', '2', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '2', '3', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '2', '4', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '2', '5', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '2', '6', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '3', '1', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '3', '2', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '3', '3', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '3', '4', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '3', '5', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '3', '6', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '4', '1', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '4', '2', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '4', '3', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '4', '4', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '4', '5', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '4', '6', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '5', '1', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '5', '2', '55', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '5', '3', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '5', '4', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '5', '5', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '5', '6', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '6', '1', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '6', '2', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '6', '3', '85', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '6', '4', '105', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '6', '5', '125', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '6', '6', '145', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '7', '1', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '7', '2', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '7', '3', '85', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '7', '4', '105', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '7', '5', '125', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '7', '6', '145', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '8', '1', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '8', '2', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '8', '3', '85', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '8', '4', '105', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '8', '5', '125', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '8', '6', '145', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '9', '1', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '9', '2', '65', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '9', '3', '85', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '9', '4', '105', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '9', '5', '125', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '9', '6', '145', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '10', '1', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '10', '2', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '10', '3', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '10', '4', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '10', '5', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '10', '6', '155', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '11', '1', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '11', '2', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '11', '3', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '11', '4', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '11', '5', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '11', '6', '155', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '12', '1', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '12', '2', '75', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '12', '3', '95', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '12', '4', '115', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '12', '5', '135', '2019-10-14 17:40:00');
INSERT INTO `deduction` VALUES ('10', '12', '6', '155', '2019-10-14 17:40:00');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `department_name` varchar(5) NOT NULL COMMENT '名称',
  `department_is_available` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可用状态(0：删除，1：可用)(0：删除，1：可用)',
  `department_create_user` char(8) NOT NULL COMMENT '创建用户',
  `department_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `department_modified_user` char(8) NOT NULL COMMENT '修改用户',
  `department_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '新场', '1', 'admi0001', '2020-01-01 00:00:00', 'admi0001', '2020-01-01 00:00:00');

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '教案id',
  `document_name` varchar(255) NOT NULL COMMENT '教案名',
  `document_department` int(10) unsigned NOT NULL COMMENT '教案校区',
  `document_subject` int(10) unsigned NOT NULL COMMENT '教案科目',
  `document_grade` int(10) unsigned NOT NULL COMMENT '教案年级',
  `document_teacher` char(8) NOT NULL COMMENT '教案老师',
  `document_path` varchar(40) NOT NULL COMMENT '教案路径',
  `document_file_size` decimal(5,2) NOT NULL COMMENT '教案文件大小',
  `document_downloaded_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '教案下载次数',
  `document_create_user` char(8) NOT NULL COMMENT '添加用户',
  `document_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '年级id',
  `grade_name` varchar(255) NOT NULL COMMENT '年级名称',
  `grade_type` varchar(2) NOT NULL COMMENT '年级类型',
  PRIMARY KEY (`grade_id`),
  UNIQUE KEY `grade_name` (`grade_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '小一', '小学');
INSERT INTO `grade` VALUES ('2', '小二', '小学');
INSERT INTO `grade` VALUES ('3', '小三', '小学');
INSERT INTO `grade` VALUES ('4', '小四', '小学');
INSERT INTO `grade` VALUES ('5', '小五', '小学');
INSERT INTO `grade` VALUES ('6', '预备', '初中');
INSERT INTO `grade` VALUES ('7', '初一', '初中');
INSERT INTO `grade` VALUES ('8', '初二', '初中');
INSERT INTO `grade` VALUES ('9', '初三', '初中');
INSERT INTO `grade` VALUES ('10', '高一', '高中');
INSERT INTO `grade` VALUES ('11', '高二', '高中');
INSERT INTO `grade` VALUES ('12', '高三', '高中');

-- ----------------------------
-- Table structure for `hour`
-- ----------------------------
DROP TABLE IF EXISTS `hour`;
CREATE TABLE `hour` (
  `hour_student` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `hour_course` int(10) unsigned NOT NULL COMMENT '课程id',
  `hour_remain` int(10) unsigned NOT NULL COMMENT '剩余课时',
  `hour_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已用课时',
  `hour_refunded` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已退课时',
  `hour_unit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课时单价',
  PRIMARY KEY (`hour_student`,`hour_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hour
-- ----------------------------

-- ----------------------------
-- Table structure for `hour_refund`
-- ----------------------------
DROP TABLE IF EXISTS `hour_refund`;
CREATE TABLE `hour_refund` (
  `hour_refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程退款id',
  `hour_refund_student` char(10) NOT NULL COMMENT '学生id',
  `hour_refund_course` int(10) unsigned NOT NULL COMMENT '课程id',
  `hour_refund_amount` decimal(10,1) unsigned NOT NULL COMMENT '退款课时数量',
  `hour_refund_value` decimal(10,2) NOT NULL COMMENT '退款课时价值',
  `hour_refund_fee` decimal(10,2) NOT NULL COMMENT '实际退款金额',
  `hour_refund_date` date NOT NULL COMMENT '退费日期',
  `hour_refund_method` varchar(30) NOT NULL COMMENT '退费付款方式账户',
  `hour_refund_remark` varchar(50) NOT NULL COMMENT '退费备注',
  `hour_refund_reviewed_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '退费审核状态(0：未审核，1：通过，2：拒绝)',
  `hour_refund_reviewed_user` char(8) DEFAULT NULL COMMENT '退费审核用户',
  `hour_refund_reviewed_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `hour_refund_create_user` char(8) NOT NULL COMMENT '添加用户',
  `hour_refund_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`hour_refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hour_refund
-- ----------------------------

-- ----------------------------
-- Table structure for `lesson`
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `lesson_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上课记录id',
  `lesson_class` char(10) NOT NULL COMMENT '班级id',
  `lesson_teacher` char(8) NOT NULL COMMENT '教师id',
  `lesson_date` date NOT NULL COMMENT '上课日期',
  `lesson_start` time NOT NULL COMMENT '上课时间',
  `lesson_student_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程人数',
  `lesson_attended_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '正常上课人数',
  `lesson_leave_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '请假人数',
  `lesson_absence_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '旷课人数',
  `lesson_document` int(10) unsigned NOT NULL COMMENT '教案id',
  `lesson_teacher_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '教师课时费',
  `lesson_hour_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '消耗课时价值',
  `lesson_create_user` char(8) NOT NULL COMMENT '添加用户',
  `lesson_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `lesson_review_user` char(8) DEFAULT NULL COMMENT '复核用户',
  `lesson_review_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '复核时间',
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_class` char(10) NOT NULL COMMENT '班级id',
  `member_student` char(10) NOT NULL COMMENT '学生id',
  `member_create_user` char(8) NOT NULL COMMENT '添加用户',
  `member_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`member_class`,`member_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for `month_assessment`
-- ----------------------------
DROP TABLE IF EXISTS `month_assessment`;
CREATE TABLE `month_assessment` (
  `month_assessment_user` char(8) NOT NULL COMMENT '月考核用户',
  `month_assessment_month` varchar(10) NOT NULL COMMENT '月考核月份',
  `month_assessment_1` int(10) unsigned DEFAULT NULL COMMENT '月考核自评分数',
  `month_assessment_2` int(10) unsigned DEFAULT NULL COMMENT '月考核教务分数',
  `month_assessment_3` int(10) unsigned DEFAULT NULL COMMENT '月考核校长分数',
  PRIMARY KEY (`month_assessment_user`,`month_assessment_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of month_assessment
-- ----------------------------

-- ----------------------------
-- Table structure for `paper`
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `paper_name` varchar(40) NOT NULL COMMENT '试卷名称',
  `paper_subject` int(10) unsigned NOT NULL COMMENT '试卷科目',
  `paper_grade` int(10) unsigned NOT NULL COMMENT '试卷年级',
  `paper_semester` int(10) unsigned NOT NULL COMMENT '试卷学期',
  `paper_document` varchar(50) NOT NULL COMMENT '试卷路径',
  `paper_create_user` char(8) NOT NULL COMMENT '试卷上传用户',
  `paper_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '试卷上传时间',
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2286 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('3', '6B复习要点及习题', '3', '6', '1', 'paper/12251940074884516.doc', 'admi0001', '2019-12-25 19:40:07');
INSERT INTO `paper` VALUES ('4', '6B所有单元对应作文', '3', '6', '1', 'paper/12251940442491620.doc', 'admi0001', '2019-12-25 19:40:44');
INSERT INTO `paper` VALUES ('5', '6年级开学考试卷-基础', '3', '6', '1', 'paper/12251941289988352.doc', 'admi0001', '2019-12-25 19:41:28');
INSERT INTO `paper` VALUES ('8', '6年级开学考试卷-提高', '3', '6', '1', 'paper/12251942261406216.doc', 'admi0001', '2019-12-25 19:42:26');
INSERT INTO `paper` VALUES ('9', '2016-2017学年培佳双语6A英语期中试卷', '3', '6', '1', 'paper/12251943235174531.docx', 'admi0001', '2019-12-25 19:43:23');
INSERT INTO `paper` VALUES ('10', '2016-2017学年上海市浦东新区预初第一学期英语期中试卷', '3', '6', '1', 'paper/12251943563972773.docx', 'admi0001', '2019-12-25 19:43:56');
INSERT INTO `paper` VALUES ('11', '2016年第二学期市西六年级期末测试卷', '3', '6', '2', 'paper/12251945026267726.docx', 'admi0001', '2019-12-25 19:45:02');
INSERT INTO `paper` VALUES ('12', '2016学年金苹果六年级第二学期期中试卷', '3', '6', '2', 'paper/12251945397789381.docx', 'admi0001', '2019-12-25 19:45:39');
INSERT INTO `paper` VALUES ('13', '2016学年青浦毓秀中学六年级5月月考试卷', '3', '6', '2', 'paper/12251946253067738.docx', 'admi0001', '2019-12-25 19:46:25');
INSERT INTO `paper` VALUES ('14', '2016学年上宝中学第二学期预初英语期中复习卷（二）', '3', '6', '2', 'paper/12251947042609551.docx', 'admi0001', '2019-12-25 19:47:04');
INSERT INTO `paper` VALUES ('15', '2016学年上宝中学第二学期预初英语期中复习卷（三）', '3', '6', '2', 'paper/12251949515389199.docx', 'admi0001', '2019-12-25 19:49:51');
INSERT INTO `paper` VALUES ('17', '2016学年上宝中学第二学期预初英语期中复习卷（四）', '3', '6', '2', 'paper/12251951055231702.docx', 'admi0001', '2019-12-25 19:51:05');
INSERT INTO `paper` VALUES ('18', '2016学年上宝中学第二学期预初英语期中复习卷（五）', '3', '6', '2', 'paper/12251952003069656.docx', 'admi0001', '2019-12-25 19:52:00');
INSERT INTO `paper` VALUES ('19', '2016学年上宝中学第二学期预初英语期中复习卷（一）', '3', '6', '2', 'paper/12251952427586335.docx', 'admi0001', '2019-12-25 19:52:42');
INSERT INTO `paper` VALUES ('20', '2016学年上宝中学预初下Exercise for 6BU1', '3', '6', '2', 'paper/12252006019543748.docx', 'admi0001', '2019-12-25 20:06:01');
INSERT INTO `paper` VALUES ('21', '2016学年上宝中学预初下Exercise for 6BU3', '3', '6', '2', 'paper/12252006321813130.docx', 'admi0001', '2019-12-25 20:06:32');
INSERT INTO `paper` VALUES ('22', '2016学年上宝中学预初下Exercise for 6BU4', '3', '6', '2', 'paper/12252007051721117.docx', 'admi0001', '2019-12-25 20:07:05');
INSERT INTO `paper` VALUES ('23', '2016学年上海市静安区育才中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/12252007496309559.doc', 'admi0001', '2019-12-25 20:07:49');
INSERT INTO `paper` VALUES ('24', '2016学年上海市卢湾区向明中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/12252008348311965.doc', 'admi0001', '2019-12-25 20:08:34');
INSERT INTO `paper` VALUES ('26', '19年秋季坦直中学九年级英语期中测试', '3', '9', '1', 'paper/01071520499511062.docx', 'neck1908', '2020-01-07 15:20:49');
INSERT INTO `paper` VALUES ('27', '2020年杨浦初三数学一模卷', '2', '9', '1', 'paper/01131652297336247.docx', 'favs1911', '2020-01-13 16:52:29');
INSERT INTO `paper` VALUES ('28', '2020年宝山初三数学一模卷', '2', '9', '1', 'paper/01131658334362586.pdf', 'favs1911', '2020-01-13 16:58:33');
INSERT INTO `paper` VALUES ('29', '2020年普陀初三数学一模卷', '2', '9', '1', 'paper/01131702517744046.pdf', 'favs1911', '2020-01-13 17:02:51');
INSERT INTO `paper` VALUES ('30', '2020年松江高三数学一模卷', '2', '12', '1', 'paper/01131705557999787.pdf', 'favs1911', '2020-01-13 17:05:55');
INSERT INTO `paper` VALUES ('31', '2020年青浦高三数学一模卷', '2', '12', '1', 'paper/01131706505015774.pdf', 'favs1911', '2020-01-13 17:06:50');
INSERT INTO `paper` VALUES ('32', '2020年崇明高三数学一模卷', '2', '12', '1', 'paper/01131821596358561.doc', 'favs1911', '2020-01-13 18:21:59');
INSERT INTO `paper` VALUES ('34', '2017-2018浦东第四教育署六下英语五月考试', '3', '6', '2', 'paper/05011137349215230.doc', 'oqrj1908', '2020-05-01 11:37:34');
INSERT INTO `paper` VALUES ('35', '2017-2018学年廊下中学六下英语期末', '3', '6', '2', 'paper/05011138253016880.doc', 'oqrj1908', '2020-05-01 11:38:25');
INSERT INTO `paper` VALUES ('36', '2017-2018学年浦东新区七下英语期末考试', '3', '7', '2', 'paper/05011154053631233.docx', 'oqrj1908', '2020-05-01 11:54:05');
INSERT INTO `paper` VALUES ('37', '2017-2018学年普陀区八下英语期末', '3', '8', '2', 'paper/05011155394320359.docx', 'oqrj1908', '2020-05-01 11:55:39');
INSERT INTO `paper` VALUES ('38', '2017-2018学年普陀区七下英语期末考试', '3', '7', '2', 'paper/05011156373915491.docx', 'oqrj1908', '2020-05-01 11:56:37');
INSERT INTO `paper` VALUES ('39', '2017-2018学年西南模范九下阶段反馈（三模）', '3', '9', '2', 'paper/05011222391403652.docx', 'oqrj1908', '2020-05-01 12:22:39');
INSERT INTO `paper` VALUES ('40', '2017-2018学年西南模范七下英语五月月考', '3', '7', '2', 'paper/05011223152700096.docx', 'oqrj1908', '2020-05-01 12:23:15');
INSERT INTO `paper` VALUES ('41', '2017-2018学年西南位育初三考前复习卷(1)', '3', '9', '2', 'paper/05011223491682853.docx', 'oqrj1908', '2020-05-01 12:23:49');
INSERT INTO `paper` VALUES ('42', '2017-2018学年新华初六下Unit_6-7拓展练习', '3', '6', '2', 'paper/05011224197992260.docx', 'oqrj1908', '2020-05-01 12:24:19');
INSERT INTO `paper` VALUES ('43', '2017-2018学年新华初六下英语Unit_7-8_单元测试', '3', '6', '2', 'paper/05011224448541631.docx', 'oqrj1908', '2020-05-01 12:24:44');
INSERT INTO `paper` VALUES ('44', '2018-2019_西南模九年级期终练习卷（一）', '3', '9', '2', 'paper/05011225155407104.docx', 'oqrj1908', '2020-05-01 12:25:15');
INSERT INTO `paper` VALUES ('45', '2018-2019年文绮中学六下英语期中考试', '3', '6', '2', 'paper/05011225404377021.doc', 'oqrj1908', '2020-05-01 12:25:40');
INSERT INTO `paper` VALUES ('46', '2018-2019学年复旦二附中七下英语期中', '3', '7', '2', 'paper/05011226049625866.docx', 'oqrj1908', '2020-05-01 12:26:04');
INSERT INTO `paper` VALUES ('47', '2018-2019学年复兴七下单元测试Unit_7', '3', '7', '2', 'paper/05011226266185020.docx', 'oqrj1908', '2020-05-01 12:26:26');
INSERT INTO `paper` VALUES ('48', '2018-2019学年复兴七下英语单元测试U6', '3', '7', '2', 'paper/05011226496236270.docx', 'oqrj1908', '2020-05-01 12:26:49');
INSERT INTO `paper` VALUES ('49', '2018-2019学年华东模范中学八下英语单元测试Unit_5_Exercise', '3', '8', '2', 'paper/05011227189006927.docx', 'oqrj1908', '2020-05-01 12:27:18');
INSERT INTO `paper` VALUES ('50', '2018-2019学年华东模范中学八下英语单元测试Unit_5_Exercise', '3', '8', '2', 'paper/05011227436714309.docx', 'oqrj1908', '2020-05-01 12:27:43');
INSERT INTO `paper` VALUES ('51', '2018-2019学年华育中学六下英语单元测试Unit_4&5', '3', '6', '2', 'paper/05011228076930212.docx', 'oqrj1908', '2020-05-01 12:28:07');
INSERT INTO `paper` VALUES ('52', '2018-2019学年华育中学六下英语阶段测试', '3', '6', '2', 'paper/05011228288480550.docx', 'oqrj1908', '2020-05-01 12:28:28');
INSERT INTO `paper` VALUES ('53', '2018-2019学年华政附中八下英语单元测试_Unit_5', '3', '8', '2', 'paper/05011228499415519.docx', 'oqrj1908', '2020-05-01 12:28:49');
INSERT INTO `paper` VALUES ('54', '2018-2019学年华政附中八下英语期末复习2', '3', '8', '2', 'paper/05011229176154725.docx', 'oqrj1908', '2020-05-01 12:29:17');
INSERT INTO `paper` VALUES ('55', '2018-2019学年黄浦区（格致、大同等）八下英语期中考试', '3', '8', '2', 'paper/05011229512087114.doc', 'oqrj1908', '2020-05-01 12:29:51');
INSERT INTO `paper` VALUES ('56', '2018-2019学年静教院附中六下英语期中', '3', '6', '2', 'paper/05011231341180861.docx', 'oqrj1908', '2020-05-01 12:31:34');
INSERT INTO `paper` VALUES ('57', '2018-2019学年静教院附中七下英语期中考试', '3', '7', '2', 'paper/05011231586502787.docx', 'oqrj1908', '2020-05-01 12:31:58');
INSERT INTO `paper` VALUES ('58', '2018-2019学年兰生复旦七下英语周练4', '3', '7', '2', 'paper/05011232225580409.docx', 'oqrj1908', '2020-05-01 12:32:22');
INSERT INTO `paper` VALUES ('59', '2018-2019学年浦东第四教育署七下英语期中考试', '3', '7', '2', 'paper/05011232473627873.docx', 'oqrj1908', '2020-05-01 12:32:47');
INSERT INTO `paper` VALUES ('60', '2018-2019学年浦东外国语八下英语期中考试（平行班牛津）', '3', '8', '2', 'paper/05011233172385988.docx', 'oqrj1908', '2020-05-01 12:33:17');
INSERT INTO `paper` VALUES ('61', '2018-2019学年浦东外国语七下英语周练', '3', '7', '2', 'paper/05011234074532949.docx', 'oqrj1908', '2020-05-01 12:34:07');
INSERT INTO `paper` VALUES ('62', '2018-2019学年浦东新区七下英语期中考试', '3', '7', '2', 'paper/05011234343185308.docx', 'oqrj1908', '2020-05-01 12:34:34');
INSERT INTO `paper` VALUES ('63', '2018-2019学年上宝中学7B单元测试U7', '3', '7', '2', 'paper/05011235184922249.docx', 'oqrj1908', '2020-05-01 12:35:18');
INSERT INTO `paper` VALUES ('64', '2018-2019学年上海市第十中学六下5月月考', '3', '6', '2', 'paper/05011235414512838.docx', 'oqrj1908', '2020-05-01 12:35:41');
INSERT INTO `paper` VALUES ('65', '2018-2019学年上师大附中七下单元测试u7', '3', '7', '2', 'paper/05011236151468456.docx', 'oqrj1908', '2020-05-01 12:36:15');
INSERT INTO `paper` VALUES ('66', '2018-2019学年上师大附中七下英语期中考试', '3', '7', '2', 'paper/05011236381024781.docx', 'oqrj1908', '2020-05-01 12:36:38');
INSERT INTO `paper` VALUES ('67', '2018-2019学年上外八下单元测试Unit_4(2)', '3', '8', '2', 'paper/05011237007248831.docx', 'oqrj1908', '2020-05-01 12:37:00');
INSERT INTO `paper` VALUES ('68', '2018-2019学年上外八下单元测试Unit_4_(1)', '3', '8', '2', 'paper/05011237263519169.docx', 'oqrj1908', '2020-05-01 12:37:26');
INSERT INTO `paper` VALUES ('69', '2018-2019学年市西中学六下英语期中', '3', '6', '2', 'paper/05011238153251775.docx', 'oqrj1908', '2020-05-01 12:38:15');
INSERT INTO `paper` VALUES ('70', '2018-2019学年市西中学七下英语期中考试', '3', '7', '2', 'paper/05011238408900888.docx', 'oqrj1908', '2020-05-01 12:38:40');
INSERT INTO `paper` VALUES ('71', '2018-2019学年位育初级六下英语5月月考', '3', '6', '2', 'paper/05011239042281757.docx', 'oqrj1908', '2020-05-01 12:39:04');
INSERT INTO `paper` VALUES ('72', '2018-2019学年文绮中学六下英语周末测试卷', '3', '6', '2', 'paper/05011239228560268.docx', 'oqrj1908', '2020-05-01 12:39:22');
INSERT INTO `paper` VALUES ('73', '2018-2019学年西南模范6B期中模拟试卷', '3', '6', '2', 'paper/05011239464259369.docx', 'oqrj1908', '2020-05-01 12:39:46');
INSERT INTO `paper` VALUES ('74', '2018-2019学年杨浦区八下英语期中考试', '3', '8', '2', 'paper/05011240129842274.docx', 'oqrj1908', '2020-05-01 12:40:12');
INSERT INTO `paper` VALUES ('75', '2018-2019学年杨浦区六下英语期中考试', '3', '6', '2', 'paper/05011240459890297.docx', 'oqrj1908', '2020-05-01 12:40:45');
INSERT INTO `paper` VALUES ('76', '2018-2019学年杨浦区七下英语期中考试', '3', '7', '2', 'paper/05011241136197039.docx', 'oqrj1908', '2020-05-01 12:41:13');
INSERT INTO `paper` VALUES ('77', '2019届宝山区中考英语二模（修改版，请重新下载）', '3', '9', '2', 'paper/05011241473853153.docx', 'oqrj1908', '2020-05-01 12:41:47');
INSERT INTO `paper` VALUES ('78', '2019届虹口区中考英语二模', '3', '9', '2', 'paper/05011242105028671.docx', 'oqrj1908', '2020-05-01 12:42:10');
INSERT INTO `paper` VALUES ('79', '2019届浦东新区九下英语二模', '3', '9', '2', 'paper/05011242358570250.docx', 'oqrj1908', '2020-05-01 12:42:35');
INSERT INTO `paper` VALUES ('80', '2019届青浦区中考英语二模', '3', '9', '2', 'paper/05011242575160801.docx', 'oqrj1908', '2020-05-01 12:42:57');
INSERT INTO `paper` VALUES ('81', '2019届松江区中考英语二模', '3', '9', '2', 'paper/05011243182927010.docx', 'oqrj1908', '2020-05-01 12:43:18');
INSERT INTO `paper` VALUES ('82', '2019届徐汇区中考英语二模（修改版）', '3', '9', '2', 'paper/05011243409271909.docx', 'oqrj1908', '2020-05-01 12:43:40');
INSERT INTO `paper` VALUES ('83', '2019届杨浦区九下英语三模', '3', '9', '2', 'paper/05011244028691368.doc', 'oqrj1908', '2020-05-01 12:44:02');
INSERT INTO `paper` VALUES ('84', '2016-2017学年静教院附中八下英语期中考试', '3', '8', '2', 'paper/05011246222375587.docx', 'oqrj1908', '2020-05-01 12:46:22');
INSERT INTO `paper` VALUES ('86', '2016-2017学年明珠中学七下英语期中考试', '3', '7', '2', 'paper/05011247558997179.docx', 'oqrj1908', '2020-05-01 12:47:55');
INSERT INTO `paper` VALUES ('87', '2016华二自招', '4', '9', '2', 'paper/05011656408267282.doc', 'fetj1908', '2020-05-01 16:56:40');
INSERT INTO `paper` VALUES ('88', '2017自招物理试题选编-学生版', '4', '9', '2', 'paper/05011703007974764.docx', 'fetj1908', '2020-05-01 17:03:00');
INSERT INTO `paper` VALUES ('89', '2018控江中学自招卷', '4', '9', '2', 'paper/05011715456210894.docx', 'fetj1908', '2020-05-01 17:15:45');
INSERT INTO `paper` VALUES ('90', '2018年上中自招物理', '4', '9', '2', 'paper/05011716315261030.docx', 'fetj1908', '2020-05-01 17:16:31');
INSERT INTO `paper` VALUES ('91', '2019年复旦附中自招题(1)', '4', '9', '2', 'paper/05011717047125831.doc', 'fetj1908', '2020-05-01 17:17:04');
INSERT INTO `paper` VALUES ('92', '2019年交附嘉分自招物理试题', '4', '9', '2', 'paper/05011717538682784.docx', 'fetj1908', '2020-05-01 17:17:53');
INSERT INTO `paper` VALUES ('93', '华二初级中学物理自招练习单选题解析', '4', '9', '2', 'paper/05011718281154857.doc', 'fetj1908', '2020-05-01 17:18:28');
INSERT INTO `paper` VALUES ('94', '华师大二附中自招真题', '4', '9', '2', 'paper/05011718582683074.doc', 'fetj1908', '2020-05-01 17:18:58');
INSERT INTO `paper` VALUES ('95', '华师大二附中综合能力测试卷--静安共康校区（含答案 word版）', '4', '9', '2', 'paper/05011719235967929.docx', 'fetj1908', '2020-05-01 17:19:23');
INSERT INTO `paper` VALUES ('96', '交附自招试卷', '4', '9', '2', 'paper/05011720594964042.docx', 'fetj1908', '2020-05-01 17:20:59');
INSERT INTO `paper` VALUES ('97', '上海市初三自招试题整理', '4', '9', '2', 'paper/05011721231650830.docx', 'fetj1908', '2020-05-01 17:21:23');
INSERT INTO `paper` VALUES ('98', '上海自招部分真题解析', '4', '9', '2', 'paper/05011721466745875.docx', 'fetj1908', '2020-05-01 17:21:46');
INSERT INTO `paper` VALUES ('99', '上外—浮力竞赛11个专题', '4', '9', '2', 'paper/05011722191881288.doc', 'fetj1908', '2020-05-01 17:22:19');
INSERT INTO `paper` VALUES ('100', '四校自招模拟卷--静安共康校区（含答案 word版）', '4', '9', '2', 'paper/05011723161221295.docx', 'fetj1908', '2020-05-01 17:23:16');
INSERT INTO `paper` VALUES ('101', '四校自招物理卷解析--静安共康校区（含答案 word版）', '4', '9', '2', 'paper/05011727591528194.docx', 'fetj1908', '2020-05-01 17:27:59');
INSERT INTO `paper` VALUES ('102', '文莱班自招竞赛--力学', '4', '9', '2', 'paper/05011730011025081.docx', 'fetj1908', '2020-05-01 17:30:01');
INSERT INTO `paper` VALUES ('103', '自招题 力学含答案', '4', '9', '2', 'paper/05011737412915830.docx', 'fetj1908', '2020-05-01 17:37:41');
INSERT INTO `paper` VALUES ('104', '自主招生物理学科知识精讲', '4', '9', '2', 'paper/05011738109800252.doc', 'fetj1908', '2020-05-01 17:38:10');
INSERT INTO `paper` VALUES ('105', '6B复习要点及习题', '3', '6', '2', 'paper/05011738258989723.doc', 'neck1908', '2020-05-01 17:38:25');
INSERT INTO `paper` VALUES ('106', '6B所有单元对应作文', '3', '6', '2', 'paper/05011738561734825.doc', 'neck1908', '2020-05-01 17:38:56');
INSERT INTO `paper` VALUES ('107', '6年级开学考试卷-基础', '3', '6', '2', 'paper/05011739488633023.doc', 'neck1908', '2020-05-01 17:39:48');
INSERT INTO `paper` VALUES ('108', '6年级开学考试卷-提高', '3', '6', '2', 'paper/05011740075677522.doc', 'neck1908', '2020-05-01 17:40:07');
INSERT INTO `paper` VALUES ('109', '2016-2017学年培佳双语6A英语期中试卷', '3', '6', '1', 'paper/05011740274112002.docx', 'neck1908', '2020-05-01 17:40:27');
INSERT INTO `paper` VALUES ('110', '2016-2017学年上海市浦东新区预初第一学期英语期中试卷', '3', '6', '1', 'paper/05011740509215044.docx', 'neck1908', '2020-05-01 17:40:50');
INSERT INTO `paper` VALUES ('111', '2016年第二学期市西六年级期末测试卷', '3', '6', '2', 'paper/05011741055126574.docx', 'neck1908', '2020-05-01 17:41:05');
INSERT INTO `paper` VALUES ('112', '2016学年金苹果六年级第二学期期中试卷', '3', '6', '2', 'paper/05011741223965693.docx', 'neck1908', '2020-05-01 17:41:22');
INSERT INTO `paper` VALUES ('113', '2016学年青浦毓秀中学六年级5月月考试卷', '3', '6', '2', 'paper/05011742168484587.docx', 'neck1908', '2020-05-01 17:42:16');
INSERT INTO `paper` VALUES ('114', '2016学年上宝中学第二学期预初英语期中复习卷（二）', '3', '6', '2', 'paper/05011742416775373.docx', 'neck1908', '2020-05-01 17:42:41');
INSERT INTO `paper` VALUES ('115', '2016学年上宝中学第二学期预初英语期中复习卷（三）', '3', '6', '2', 'paper/05011742588013570.docx', 'neck1908', '2020-05-01 17:42:58');
INSERT INTO `paper` VALUES ('116', '2017自招物理试题汇编-教师版', '4', '9', '2', 'paper/05011743116178647.doc', 'fetj1908', '2020-05-01 17:43:11');
INSERT INTO `paper` VALUES ('117', '2016学年上宝中学第二学期预初英语期中复习卷（四）', '3', '6', '2', 'paper/05011743185487636.docx', 'neck1908', '2020-05-01 17:43:18');
INSERT INTO `paper` VALUES ('118', '2016学年上宝中学第二学期预初英语期中复习卷（五）', '3', '6', '2', 'paper/05011743399199288.docx', 'neck1908', '2020-05-01 17:43:39');
INSERT INTO `paper` VALUES ('119', '2016学年上宝中学第二学期预初英语期中复习卷（一）', '3', '6', '2', 'paper/05011744015163043.docx', 'neck1908', '2020-05-01 17:44:01');
INSERT INTO `paper` VALUES ('120', '2016学年上宝中学预初下Exercise for 6BU1', '3', '6', '2', 'paper/05011744232589866.docx', 'neck1908', '2020-05-01 17:44:23');
INSERT INTO `paper` VALUES ('121', '2016学年上宝中学预初下Exercise for 6BU3', '3', '6', '2', 'paper/05011744382099548.docx', 'neck1908', '2020-05-01 17:44:38');
INSERT INTO `paper` VALUES ('122', '2016学年上宝中学预初下Exercise for 6BU4', '3', '6', '2', 'paper/05011744595333672.docx', 'neck1908', '2020-05-01 17:44:59');
INSERT INTO `paper` VALUES ('123', '2016学年上海市静安区育才中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011745192846991.doc', 'neck1908', '2020-05-01 17:45:19');
INSERT INTO `paper` VALUES ('124', '2016学年上海市卢湾区向明中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011745367788445.doc', 'neck1908', '2020-05-01 17:45:36');
INSERT INTO `paper` VALUES ('125', '2016学年上海市浦东新区 六年级下学期期中英语', '3', '6', '2', 'paper/05011745589455586.doc', 'neck1908', '2020-05-01 17:45:58');
INSERT INTO `paper` VALUES ('126', '2016学年毓秀中学六年级第二学期期中试卷', '3', '6', '2', 'paper/05011746171877900.docx', 'neck1908', '2020-05-01 17:46:17');
INSERT INTO `paper` VALUES ('127', '2017-2018学年度兰生复旦中学6B期末考试', '3', '6', '2', 'paper/05011746374365583.docx', 'neck1908', '2020-05-01 17:46:37');
INSERT INTO `paper` VALUES ('128', '2017-2018学年复兴六下U2单元测试', '3', '6', '2', 'paper/05011747035450450.docx', 'neck1908', '2020-05-01 17:47:03');
INSERT INTO `paper` VALUES ('129', '2017-2018学年立达中学六下英语3月考试', '3', '6', '2', 'paper/05011747413044177.docx', 'neck1908', '2020-05-01 17:47:41');
INSERT INTO `paper` VALUES ('130', '2017-2018学年六年级第二学期英语期中模拟测试卷', '3', '6', '2', 'paper/05011747571690074.docx', 'neck1908', '2020-05-01 17:47:57');
INSERT INTO `paper` VALUES ('131', '2017-2018学年浦东新区预初第二学期期中英语试卷', '3', '6', '2', 'paper/05011748197765295.doc', 'neck1908', '2020-05-01 17:48:19');
INSERT INTO `paper` VALUES ('132', '2019-2020学年度第二学期上海市西南模范中学初三物理 练习物 理 部 分 ', '4', '9', '2', 'paper/05011748497433087.doc', 'fetj1908', '2020-05-01 17:48:49');
INSERT INTO `paper` VALUES ('133', '2017-2018学年上宝中学六年级第一学期期中复习卷', '3', '6', '2', 'paper/05011749108688855.docx', 'neck1908', '2020-05-01 17:49:10');
INSERT INTO `paper` VALUES ('134', '2017-2018学年上海市奉贤区弘文学校六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011749395787982.docx', 'neck1908', '2020-05-01 17:49:39');
INSERT INTO `paper` VALUES ('135', '2020年上海西外外国语学校初三3月份月考物理   word 无答案', '4', '9', '2', 'paper/05011749444197510.docx', 'fetj1908', '2020-05-01 17:49:44');
INSERT INTO `paper` VALUES ('136', '2017-2018学年文绮中学六年级上英语月考卷', '3', '6', '2', 'paper/05011750018024467.docx', 'neck1908', '2020-05-01 17:50:01');
INSERT INTO `paper` VALUES ('137', '初三压力压强单元检测（2019.9）徐汇中学', '4', '9', '2', 'paper/05011750142518807.doc', 'fetj1908', '2020-05-01 17:50:14');
INSERT INTO `paper` VALUES ('138', '2017-2018学年预初第二学期期中英语试卷', '3', '6', '2', 'paper/05011750218061990.doc', 'neck1908', '2020-05-01 17:50:21');
INSERT INTO `paper` VALUES ('139', '上宝-第三周双基天天练-教师版(1)', '4', '9', '2', 'paper/05011750437034189.docx', 'fetj1908', '2020-05-01 17:50:43');
INSERT INTO `paper` VALUES ('140', '2017虹口区6A期中教学质量调研抽测', '3', '6', '1', 'paper/05011751021611401.docx', 'neck1908', '2020-05-01 17:51:02');
INSERT INTO `paper` VALUES ('141', '2017年金汇初级中学六年级第一学期月考英语试卷', '3', '6', '1', 'paper/05011751281370865.docx', 'neck1908', '2020-05-01 17:51:28');
INSERT INTO `paper` VALUES ('142', '上宝-第三周双基天天练-教师版(2)', '4', '9', '2', 'paper/05011751399914820.docx', 'fetj1908', '2020-05-01 17:51:39');
INSERT INTO `paper` VALUES ('143', '2017上外预初下月考', '3', '6', '1', 'paper/05011751566713671.docx', 'neck1908', '2020-05-01 17:51:56');
INSERT INTO `paper` VALUES ('144', '上宝-第三周双基天天练-教师版(3)', '4', '9', '2', 'paper/05011752012980688.docx', 'fetj1908', '2020-05-01 17:52:01');
INSERT INTO `paper` VALUES ('145', '2017学年6年级下学期期中易错题', '3', '6', '1', 'paper/05011752153098822.docx', 'neck1908', '2020-05-01 17:52:15');
INSERT INTO `paper` VALUES ('146', '上宝-第三周双基天天练教师版(4)', '4', '9', '2', 'paper/05011752205267178.docx', 'fetj1908', '2020-05-01 17:52:20');
INSERT INTO `paper` VALUES ('148', '2017学年第二学期六年级英语第一次阶段调研', '3', '6', '2', 'paper/05011752506737938.doc', 'neck1908', '2020-05-01 17:52:50');
INSERT INTO `paper` VALUES ('149', '2017学年第二学期期中预备年级英语学科调研试卷', '3', '6', '2', 'paper/05011753267912042.docx', 'neck1908', '2020-05-01 17:53:26');
INSERT INTO `paper` VALUES ('150', '上宝-第三周双基天天练-教师版(5)', '4', '9', '2', 'paper/05011753535353235.docx', 'fetj1908', '2020-05-01 17:53:53');
INSERT INTO `paper` VALUES ('151', '2017学年度嘉定区六年级第一学期期末考试英语试卷', '3', '6', '2', 'paper/05011753584661958.doc', 'neck1908', '2020-05-01 17:53:58');
INSERT INTO `paper` VALUES ('152', '上宝-第三周双基天天练-教师版(6)', '4', '9', '2', 'paper/05011754366955961.docx', 'fetj1908', '2020-05-01 17:54:36');
INSERT INTO `paper` VALUES ('153', '上宝-第三周双基天天练-教师版(7)', '4', '9', '2', 'paper/05011754583009693.docx', 'fetj1908', '2020-05-01 17:54:58');
INSERT INTO `paper` VALUES ('154', '2017学年清河湾中学第二学期期中考试六年级英语试卷', '3', '6', '2', 'paper/05011801321764378.docx', 'neck1908', '2020-05-01 18:01:32');
INSERT INTO `paper` VALUES ('155', '2017学年上海市静安区市西初级六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011801524701289.docx', 'neck1908', '2020-05-01 18:01:52');
INSERT INTO `paper` VALUES ('156', '2017学年上海市静安区市西初级中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011802105318300.docx', 'neck1908', '2020-05-01 18:02:10');
INSERT INTO `paper` VALUES ('157', '上宝-双基天天练-教案(6)', '4', '9', '2', 'paper/05011825144905555.docx', 'fetj1908', '2020-05-01 18:25:14');
INSERT INTO `paper` VALUES ('158', '上宝-双基天天练-教案(7)', '4', '9', '2', 'paper/05011825429688409.docx', 'fetj1908', '2020-05-01 18:25:42');
INSERT INTO `paper` VALUES ('159', '上宝-双基天天练-教案(7)', '4', '9', '2', 'paper/05011825434649977.docx', 'fetj1908', '2020-05-01 18:25:43');
INSERT INTO `paper` VALUES ('160', '上宝-双基天天练-教师版(1)', '4', '9', '2', 'paper/05011826175495198.docx', 'fetj1908', '2020-05-01 18:26:17');
INSERT INTO `paper` VALUES ('161', '上宝-双基天天练-教师版(3)', '4', '9', '2', 'paper/05011828113857685.docx', 'fetj1908', '2020-05-01 18:28:11');
INSERT INTO `paper` VALUES ('162', '上宝-双基天天练-教师版(4)', '4', '9', '2', 'paper/05011828313814551.docx', 'fetj1908', '2020-05-01 18:28:31');
INSERT INTO `paper` VALUES ('163', '上宝-双基天天练教师版(5)', '4', '9', '2', 'paper/05011828515615731.docx', 'fetj1908', '2020-05-01 18:28:51');
INSERT INTO `paper` VALUES ('164', '上宝-双基天天练-学案(6)', '4', '9', '2', 'paper/05011829102488417.docx', 'fetj1908', '2020-05-01 18:29:10');
INSERT INTO `paper` VALUES ('165', '上宝-双基天天练-学案(7)', '4', '9', '2', 'paper/05011829296435262.docx', 'fetj1908', '2020-05-01 18:29:29');
INSERT INTO `paper` VALUES ('166', '2017学年上海市浦东新区上海中学东校六年级下学期期中英语测试卷.doc', '3', '6', '2', 'paper/05011837105386358.doc', 'neck1908', '2020-05-01 18:37:10');
INSERT INTO `paper` VALUES ('167', '2017学年上海市实验中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011837371746681.doc', 'neck1908', '2020-05-01 18:37:37');
INSERT INTO `paper` VALUES ('168', '2017学年上海市松江区上九亭中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011837588112905.doc', 'neck1908', '2020-05-01 18:37:58');
INSERT INTO `paper` VALUES ('169', '2017学年上海市长宁区延安中学六年级下学期期中英语测试卷', '3', '6', '2', 'paper/05011838452062004.docx', 'neck1908', '2020-05-01 18:38:45');
INSERT INTO `paper` VALUES ('170', '2017学年新竹园预备年级第一学期英语周末拓展（二）', '3', '6', '2', 'paper/05011839014829967.doc', 'neck1908', '2020-05-01 18:39:01');
INSERT INTO `paper` VALUES ('171', '2017学年新竹园预备年级第一学期英语周末拓展（三）', '3', '6', '1', 'paper/05011839224085102.doc', 'neck1908', '2020-05-01 18:39:22');
INSERT INTO `paper` VALUES ('172', '2017学年新竹园预备年级第一学期英语周末拓展（四）', '3', '6', '1', 'paper/05011839433853822.docx', 'neck1908', '2020-05-01 18:39:43');
INSERT INTO `paper` VALUES ('173', '2017学年新竹园预备年级第一学期英语周末拓展（二）', '3', '6', '1', 'paper/05011840037453708.doc', 'neck1908', '2020-05-01 18:40:03');
INSERT INTO `paper` VALUES ('174', '2017学年新竹园预备年级第一学期英语周末拓展（五）', '3', '6', '1', 'paper/05011840241758686.docx', 'neck1908', '2020-05-01 18:40:24');
INSERT INTO `paper` VALUES ('175', '2017学年新竹园预备年级第一学期英语周末拓展（一）', '3', '6', '1', 'paper/05011840429496653.doc', 'neck1908', '2020-05-01 18:40:42');
INSERT INTO `paper` VALUES ('176', '2017学年徐汇区位育中学预初年级上学期10月月考', '3', '6', '1', 'paper/05011841044729953.docx', 'neck1908', '2020-05-01 18:41:04');
INSERT INTO `paper` VALUES ('177', '2018-19 学年第一学期 尚德中学 六年级 开学考试 英语', '3', '6', '1', 'paper/05011841219875229.docx', 'neck1908', '2020-05-01 18:41:21');
INSERT INTO `paper` VALUES ('178', '2018-2019九亭中学六年级上半学期第一次月考卷', '3', '6', '1', 'paper/05011841391109441.docx', 'neck1908', '2020-05-01 18:41:39');
INSERT INTO `paper` VALUES ('179', '2018-2019学年虹口实验中学六上单元测试', '3', '6', '1', 'paper/05011841582200767.docx', 'neck1908', '2020-05-01 18:41:58');
INSERT INTO `paper` VALUES ('180', '2018-2019学年建平实验六上英语单元测试', '3', '6', '1', 'paper/05011842163684714.doc', 'neck1908', '2020-05-01 18:42:16');
INSERT INTO `paper` VALUES ('181', '2018—2019学年上海市虹口区上海外国语大学附属中学预初上10月份月考复习卷', '3', '6', '1', 'paper/05011842384532125.doc', 'neck1908', '2020-05-01 18:42:38');
INSERT INTO `paper` VALUES ('182', '2018-2019学年上海市嘉定区怀少中学六年级上学期10月月考卷', '3', '6', '1', 'paper/05011842575439126.docx', 'neck1908', '2020-05-01 18:42:57');
INSERT INTO `paper` VALUES ('183', '2018-2019学年上海市静安区风华初级中学六年级上学期期中', '3', '6', '1', 'paper/05011843222895568.docx', 'neck1908', '2020-05-01 18:43:22');
INSERT INTO `paper` VALUES ('184', '2018-2019学年上海市浦东新区尚德实验预初上英语摸底考试卷', '3', '6', '1', 'paper/05011843402009621.docx', 'neck1908', '2020-05-01 18:43:40');
INSERT INTO `paper` VALUES ('185', '2018〜2019学年上外预初衔接练习', '3', '6', '1', 'paper/05011843593076193.docx', 'neck1908', '2020-05-01 18:43:59');
INSERT INTO `paper` VALUES ('186', '2018-2019学年杨浦实验中学六上英语第一次月考', '3', '6', '1', 'paper/05011844208312243.docx', 'neck1908', '2020-05-01 18:44:20');
INSERT INTO `paper` VALUES ('187', '2018-2019学年长宁区华二6A英语期中考试复习卷U3U4', '3', '6', '1', 'paper/05011844421350755.doc', 'neck1908', '2020-05-01 18:44:42');
INSERT INTO `paper` VALUES ('188', '2018-2019学年长宁区华二6A英语期中考试复习卷二', '3', '6', '1', 'paper/05011845024849318.docx', 'neck1908', '2020-05-01 18:45:02');
INSERT INTO `paper` VALUES ('189', '2018-2019学年长宁区华二6A英语期中考试模拟卷', '3', '6', '1', 'paper/05011845187693373.docx', 'neck1908', '2020-05-01 18:45:18');
INSERT INTO `paper` VALUES ('190', '2018建平实验六上英语单元测试', '3', '6', '1', 'paper/05011845386962384.docx', 'neck1908', '2020-05-01 18:45:38');
INSERT INTO `paper` VALUES ('191', '2018年华育中学预初英语', '3', '6', '1', 'paper/05011845572933266.docx', 'neck1908', '2020-05-01 18:45:57');
INSERT INTO `paper` VALUES ('192', '2018年七宝二中预初十月月考卷', '3', '6', '1', 'paper/05011846226098501.docx', 'neck1908', '2020-05-01 18:46:22');
INSERT INTO `paper` VALUES ('193', '2018年七宝三中预初期中考试卷', '3', '6', '1', 'paper/05011846376810343.docx', 'neck1908', '2020-05-01 18:46:37');
INSERT INTO `paper` VALUES ('194', '2018年尚德六年级Unit 5单元练习', '3', '6', '1', 'paper/05011846557428669.docx', 'neck1908', '2020-05-01 18:46:55');
INSERT INTO `paper` VALUES ('195', '2018七宝二中预初期中考试卷', '3', '6', '1', 'paper/05011847159833980.docx', 'neck1908', '2020-05-01 18:47:15');
INSERT INTO `paper` VALUES ('196', '2018市北 初级中学英语6上单元测试 Unit 3', '3', '6', '1', 'paper/05011847339504092.docx', 'neck1908', '2020-05-01 18:47:33');
INSERT INTO `paper` VALUES ('197', '2018暑期7月英语阶段测试卷（新预初A卷）', '3', '6', '1', 'paper/05011847515983350.doc', 'neck1908', '2020-05-01 18:47:51');
INSERT INTO `paper` VALUES ('198', '2018学年第一学期上闵外预初周测卷', '3', '6', '1', 'paper/05011848075088156.doc', 'neck1908', '2020-05-01 18:48:07');
INSERT INTO `paper` VALUES ('199', '2018学年第一学期颛桥上宝班六年级期中考试试卷', '3', '6', '1', 'paper/05011848311241959.docx', 'neck1908', '2020-05-01 18:48:31');
INSERT INTO `paper` VALUES ('200', '2018学年汇贤中学第一学期六年级英语月考试卷', '3', '6', '1', 'paper/05011848467948753.docx', 'neck1908', '2020-05-01 18:48:46');
INSERT INTO `paper` VALUES ('201', '2018学年立达中学第一学期预备年级英语过关练习一', '3', '6', '1', 'paper/05011849113770457.docx', 'neck1908', '2020-05-01 18:49:11');
INSERT INTO `paper` VALUES ('202', '2018学年六年级英语上学期期中模拟卷', '3', '6', '1', 'paper/05011849305731403.docx', 'neck1908', '2020-05-01 18:49:30');
INSERT INTO `paper` VALUES ('203', '2018学年上海市松江区九峰实验学校六年级上学期10月考试卷', '3', '6', '1', 'paper/05011854049650084.doc', 'neck1908', '2020-05-01 18:54:04');
INSERT INTO `paper` VALUES ('204', '2018学年松江区 九亭中学六年级上学期 U1测试卷', '3', '6', '1', 'paper/05011854206287019.docx', 'neck1908', '2020-05-01 18:54:20');
INSERT INTO `paper` VALUES ('205', '2018学年新华初 6AU2含答案', '3', '6', '1', 'paper/05011854359052595.doc', 'neck1908', '2020-05-01 18:54:35');
INSERT INTO `paper` VALUES ('206', '风华初级中学2018学年第一学期六年级英语学科阶段测试', '3', '6', '1', 'paper/05011854529327454.docx', 'neck1908', '2020-05-01 18:54:52');
INSERT INTO `paper` VALUES ('207', '弘文学校2017学年第二学期期中质量检测', '3', '6', '1', 'paper/05011855074057978.docx', 'neck1908', '2020-05-01 18:55:07');
INSERT INTO `paper` VALUES ('208', '虹口区2018学年度第一学期中教学质量诊断', '3', '6', '1', 'paper/05011856029519687.docx', 'neck1908', '2020-05-01 18:56:02');
INSERT INTO `paper` VALUES ('209', '华二实验6BU6测试卷', '3', '6', '1', 'paper/05011856171581467.docx', 'neck1908', '2020-05-01 18:56:17');
INSERT INTO `paper` VALUES ('210', '华育六年级(上)英语Test for 9', '3', '6', '1', 'paper/05011856437604249.doc', 'neck1908', '2020-05-01 18:56:43');
INSERT INTO `paper` VALUES ('211', '康外实中六年级期中测试卷', '3', '6', '1', 'paper/05011857018412435.docx', 'neck1908', '2020-05-01 18:57:01');
INSERT INTO `paper` VALUES ('212', '兰生复旦小升初分班英语试卷', '3', '6', '1', 'paper/05011857184872271.doc', 'neck1908', '2020-05-01 18:57:18');
INSERT INTO `paper` VALUES ('213', '兰生复旦中学2016学年第二学期六年级英语期末试卷.docx', '3', '6', '2', 'paper/05011857348224163.docx', 'neck1908', '2020-05-01 18:57:34');
INSERT INTO `paper` VALUES ('214', '兰生复旦中学六年级(下)英语第一阶段测试', '3', '6', '2', 'paper/05011857578110000.docx', 'neck1908', '2020-05-01 18:57:57');
INSERT INTO `paper` VALUES ('215', '立达中学2017学年第一学期预备年级1月月考卷', '3', '6', '2', 'paper/05011858143853267.docx', 'neck1908', '2020-05-01 18:58:14');
INSERT INTO `paper` VALUES ('216', '六年级第二学期期中考试模拟卷', '3', '6', '2', 'paper/05011858306476324.docx', 'neck1908', '2020-05-01 18:58:30');
INSERT INTO `paper` VALUES ('217', '六年级开学考试卷（基础）', '3', '6', '2', 'paper/05011858484603545.doc', 'neck1908', '2020-05-01 18:58:48');
INSERT INTO `paper` VALUES ('218', '牛津六年级单元检测卷6AU1', '3', '6', '1', 'paper/05011859088337153.docx', 'neck1908', '2020-05-01 18:59:08');
INSERT INTO `paper` VALUES ('219', '七一中学6B-2017期中复习', '3', '6', '2', 'paper/05011859317735329.docx', 'neck1908', '2020-05-01 18:59:31');
INSERT INTO `paper` VALUES ('220', '青浦复旦附中6B校本错题整理', '3', '6', '2', 'paper/05011859494344555.docx', 'neck1908', '2020-05-01 18:59:49');
INSERT INTO `paper` VALUES ('221', '上宝中学6B U7测试卷', '3', '6', '2', 'paper/05011900056403063.docx', 'neck1908', '2020-05-01 19:00:05');
INSERT INTO `paper` VALUES ('222', '上宝中学6BU1-2测试卷', '3', '6', '2', 'paper/05011908033016158.doc', 'neck1908', '2020-05-01 19:08:03');
INSERT INTO `paper` VALUES ('223', '上宝中学6BU1-2测试卷精析', '3', '6', '2', 'paper/05011908224114879.doc', 'neck1908', '2020-05-01 19:08:22');
INSERT INTO `paper` VALUES ('224', '上宝中学6BU3-4测试卷', '3', '6', '2', 'paper/05011908494530128.docx', 'neck1908', '2020-05-01 19:08:49');
INSERT INTO `paper` VALUES ('225', '上宝中学6BU7-U9 测试卷', '3', '6', '2', 'paper/05011909192472661.docx', 'neck1908', '2020-05-01 19:09:19');
INSERT INTO `paper` VALUES ('226', '上宝中学6BU7测试卷', '3', '6', '2', 'paper/05011909401984745.docx', 'neck1908', '2020-05-01 19:09:40');
INSERT INTO `paper` VALUES ('227', '上宝中学6BU9测试卷', '3', '6', '2', 'paper/05011909547162572.docx', 'neck1908', '2020-05-01 19:09:54');
INSERT INTO `paper` VALUES ('228', '上宝中学2017年下学期U3-4测验卷', '3', '6', '2', 'paper/05011910156422961.docx', 'neck1908', '2020-05-01 19:10:15');
INSERT INTO `paper` VALUES ('229', '上海普陀区重点中学进华中学2017-2018学年第一学期预初英语期末考试卷', '3', '6', '2', 'paper/05011910317711046.docx', 'neck1908', '2020-05-01 19:10:31');
INSERT INTO `paper` VALUES ('230', '上海市复旦实验初中2018学年六年级第一学期Module One测验卷精析.do', '3', '6', '1', 'paper/05011910575152753.docx', 'neck1908', '2020-05-01 19:10:57');
INSERT INTO `paper` VALUES ('231', '上海市民办大同中学2018学年六年级第一学期9月月考卷', '3', '6', '1', 'paper/05011911248428508.docx', 'neck1908', '2020-05-01 19:11:24');
INSERT INTO `paper` VALUES ('232', '上海新竹园中学六下英语周末拓展(二)', '3', '6', '2', 'paper/05011911447145877.docx', 'neck1908', '2020-05-01 19:11:44');
INSERT INTO `paper` VALUES ('233', '上海新竹园中学六下英语周末拓展(三)', '3', '6', '2', 'paper/05011912003250772.docx', 'neck1908', '2020-05-01 19:12:00');
INSERT INTO `paper` VALUES ('234', '上海新竹园中学六下英语周末拓展(一)', '3', '6', '2', 'paper/05011912197419058.docx', 'neck1908', '2020-05-01 19:12:19');
INSERT INTO `paper` VALUES ('235', '上海中学东校2017学年预初第二学期期中试卷', '3', '6', '2', 'paper/05011912392470640.docx', 'neck1908', '2020-05-01 19:12:39');
INSERT INTO `paper` VALUES ('236', '上外双语六年级2017年英语期末考试模拟卷', '3', '6', '2', 'paper/05011912564412674.docx', 'neck1908', '2020-05-01 19:12:56');
INSERT INTO `paper` VALUES ('237', '上外预初10月份月考复习卷', '3', '6', '1', 'paper/05011913558890876.doc', 'neck1908', '2020-05-01 19:13:55');
INSERT INTO `paper` VALUES ('238', '上外预初上周周练之月考复习卷', '3', '6', '1', 'paper/05011914132758250.docx', 'neck1908', '2020-05-01 19:14:13');
INSERT INTO `paper` VALUES ('239', '上外预初周周练', '3', '6', '1', 'paper/05011914319993020.docx', 'neck1908', '2020-05-01 19:14:31');
INSERT INTO `paper` VALUES ('240', '尚德2017-2018学年预备年级第二学期3月素养测评', '3', '6', '2', 'paper/05011914581517390.docx', 'neck1908', '2020-05-01 19:14:58');
INSERT INTO `paper` VALUES ('241', '世外  小六Weekly Paper 4 for Year Six', '3', '6', '1', 'paper/05011922047828905.docx', 'neck1908', '2020-05-01 19:22:04');
INSERT INTO `paper` VALUES ('242', '世外 小六  Weekly Paper 5 for Year Six', '3', '6', '1', 'paper/05011922217005918.docx', 'neck1908', '2020-05-01 19:22:21');
INSERT INTO `paper` VALUES ('243', '世外 小六 Weekly Paper6', '3', '6', '1', 'paper/05011922369589551.docx', 'neck1908', '2020-05-01 19:22:36');
INSERT INTO `paper` VALUES ('244', '市西中学     6B期中考试', '3', '6', '2', 'paper/05011922544971724.docx', 'neck1908', '2020-05-01 19:22:54');
INSERT INTO `paper` VALUES ('245', '暑期8月英语阶段测试卷（新预初）', '3', '6', '1', 'paper/05011923333652881.doc', 'neck1908', '2020-05-01 19:23:33');
INSERT INTO `paper` VALUES ('246', '文来中学  六年级新生暑假英语作业（二）（适用于小升初择校)', '3', '6', '1', 'paper/05011923493069003.docx', 'neck1908', '2020-05-01 19:23:49');
INSERT INTO `paper` VALUES ('247', '文来中学 六年级新生暑假英语作业 （三）（适用于小升初使用', '3', '6', '1', 'paper/05011924063786460.docx', 'neck1908', '2020-05-01 19:24:06');
INSERT INTO `paper` VALUES ('248', '文来中学 六年级新生暑假英语作业（四）（适用于小升初使用）', '3', '6', '1', 'paper/05011924238986485.docx', 'neck1908', '2020-05-01 19:24:23');
INSERT INTO `paper` VALUES ('249', '文来中学 六年级新生暑假英语作业(五)（适用于小升初使用）', '3', '6', '1', 'paper/05011924422662863.docx', 'neck1908', '2020-05-01 19:24:42');
INSERT INTO `paper` VALUES ('250', '文来中学 六年级新生暑假英语作业(一）（适用于小升初择校）', '3', '6', '1', 'paper/05011924587477115.docx', 'neck1908', '2020-05-01 19:24:58');
INSERT INTO `paper` VALUES ('251', '文莱中学六年级期中试卷', '3', '6', '1', 'paper/05011925164350728.docx', 'neck1908', '2020-05-01 19:25:16');
INSERT INTO `paper` VALUES ('252', '小升初开学模拟考试卷', '3', '6', '1', 'paper/05011925325416608.docx', 'neck1908', '2020-05-01 19:25:32');
INSERT INTO `paper` VALUES ('253', '新泾中学预初2017学年度第二学期期中考试试卷', '3', '6', '1', 'paper/05011925514908117.docx', 'neck1908', '2020-05-01 19:25:51');
INSERT INTO `paper` VALUES ('254', '上宝-双基天天练-学生版(1)', '4', '9', '2', 'paper/05011926007286039.docx', 'fetj1908', '2020-05-01 19:26:00');
INSERT INTO `paper` VALUES ('255', '新预初英语练习卷 9', '3', '6', '1', 'paper/05011926114464261.docx', 'neck1908', '2020-05-01 19:26:11');
INSERT INTO `paper` VALUES ('256', '上宝-双基天天练-学生版(2)', '4', '9', '2', 'paper/05011926236510970.docx', 'fetj1908', '2020-05-01 19:26:23');
INSERT INTO `paper` VALUES ('257', '新预初英语练习卷1', '3', '6', '1', 'paper/05011926309029577.docx', 'neck1908', '2020-05-01 19:26:30');
INSERT INTO `paper` VALUES ('258', '上宝-双基天天练学生版(3)', '4', '9', '2', 'paper/05011926447941100.docx', 'fetj1908', '2020-05-01 19:26:44');
INSERT INTO `paper` VALUES ('259', '新预初英语练习卷2', '3', '6', '1', 'paper/05011926488412170.docx', 'neck1908', '2020-05-01 19:26:48');
INSERT INTO `paper` VALUES ('260', '新预初英语练习卷3', '3', '6', '1', 'paper/05011927044836149.docx', 'neck1908', '2020-05-01 19:27:04');
INSERT INTO `paper` VALUES ('261', '上宝-双基天天练-学生版(4)', '4', '9', '2', 'paper/05011927074676691.docx', 'fetj1908', '2020-05-01 19:27:07');
INSERT INTO `paper` VALUES ('262', '新预初英语练习卷4', '3', '6', '1', 'paper/05011927193827442.docx', 'neck1908', '2020-05-01 19:27:19');
INSERT INTO `paper` VALUES ('263', '上宝-双基天天练学生版(5)', '4', '9', '2', 'paper/05011927274245114.docx', 'fetj1908', '2020-05-01 19:27:27');
INSERT INTO `paper` VALUES ('264', '新预初英语练习卷5', '3', '6', '1', 'paper/05011927331935547.docx', 'neck1908', '2020-05-01 19:27:33');
INSERT INTO `paper` VALUES ('265', '新预初英语练习卷7', '3', '6', '1', 'paper/05011927534257363.doc', 'neck1908', '2020-05-01 19:27:53');
INSERT INTO `paper` VALUES ('266', '上海民办存志中学2020学年初三第二学期月考物理线上教学检测试卷（Word版无答', '4', '9', '2', 'paper/05011927548913259.doc', 'fetj1908', '2020-05-01 19:27:54');
INSERT INTO `paper` VALUES ('267', '新预初英语练习卷8', '3', '6', '1', 'paper/05011928149371514.docx', 'neck1908', '2020-05-01 19:28:14');
INSERT INTO `paper` VALUES ('268', '新预初英语练习卷11', '3', '6', '1', 'paper/05011928294784248.docx', 'neck1908', '2020-05-01 19:28:29');
INSERT INTO `paper` VALUES ('269', '上海市华育中学2019－2020学年九年级（上）期末测验物理试题（解析版）', '4', '9', '1', 'paper/05011928303106168.doc', 'fetj1908', '2020-05-01 19:28:30');
INSERT INTO `paper` VALUES ('270', '新预初英语练习卷12', '3', '6', '1', 'paper/05011928594900083.docx', 'neck1908', '2020-05-01 19:28:59');
INSERT INTO `paper` VALUES ('271', '新预初英语练习卷13', '3', '6', '1', 'paper/05011929139727677.docx', 'neck1908', '2020-05-01 19:29:13');
INSERT INTO `paper` VALUES ('272', '新预初英语练习卷14', '3', '6', '1', 'paper/05011929283928755.docx', 'neck1908', '2020-05-01 19:29:28');
INSERT INTO `paper` VALUES ('273', '新竹园六年级上册第八单元练习卷', '3', '6', '1', 'paper/05011929473093431.doc', 'neck1908', '2020-05-01 19:29:47');
INSERT INTO `paper` VALUES ('274', '新竹园六年级上册第九单元练习卷', '3', '6', '1', 'paper/05011930083737794.doc', 'neck1908', '2020-05-01 19:30:08');
INSERT INTO `paper` VALUES ('275', '新竹园六年级上册第六单元练习卷', '3', '6', '1', 'paper/05011930238101238.docx', 'neck1908', '2020-05-01 19:30:23');
INSERT INTO `paper` VALUES ('276', '新竹园六年级上册第七单元练习卷', '3', '6', '1', 'paper/05011930396656638.docx', 'neck1908', '2020-05-01 19:30:39');
INSERT INTO `paper` VALUES ('277', '新竹园六年级上册第十单元练习卷', '3', '6', '1', 'paper/05011930592177106.docx', 'neck1908', '2020-05-01 19:30:59');
INSERT INTO `paper` VALUES ('278', '新竹园六年级上册第十二单元练习卷', '3', '6', '1', 'paper/05011931169319422.doc', 'neck1908', '2020-05-01 19:31:16');
INSERT INTO `paper` VALUES ('279', '新竹园六年级上册第十一单元练习卷', '3', '6', '1', 'paper/05011931314831898.docx', 'neck1908', '2020-05-01 19:31:31');
INSERT INTO `paper` VALUES ('280', '新竹园六年级上学期第二单元测试卷', '3', '6', '1', 'paper/05011931484563062.docx', 'neck1908', '2020-05-01 19:31:48');
INSERT INTO `paper` VALUES ('281', '新竹园六年级上学期第三单元测试卷', '3', '6', '1', 'paper/05011932082407710.docx', 'neck1908', '2020-05-01 19:32:08');
INSERT INTO `paper` VALUES ('282', '上海市华育中学2019－2020学年九年级（上）期末测验物理试题（学生版）', '4', '9', '1', 'paper/05011933143694206.doc', 'fetj1908', '2020-05-01 19:33:14');
INSERT INTO `paper` VALUES ('283', '新竹园六年级上学期第四单元测试卷', '3', '6', '1', 'paper/05011933376566828.doc', 'neck1908', '2020-05-01 19:33:37');
INSERT INTO `paper` VALUES ('284', '上海市黄浦区敬业中学2019-2020学年高一下学期期中考试物理试题（教师版）', '4', '10', '2', 'paper/05011933514362527.doc', 'fetj1908', '2020-05-01 19:33:51');
INSERT INTO `paper` VALUES ('285', '新竹园六年级上学期第五单元测试卷', '3', '6', '1', 'paper/05011933522869356.doc', 'neck1908', '2020-05-01 19:33:52');
INSERT INTO `paper` VALUES ('286', '新竹园六年级上学期第一单元测试卷', '3', '6', '1', 'paper/05011934157982330.docx', 'neck1908', '2020-05-01 19:34:15');
INSERT INTO `paper` VALUES ('287', '熠林预初英语（1-8班） 阅读理解－综合练习一', '3', '6', '1', 'paper/05011934337224206.docx', 'neck1908', '2020-05-01 19:34:33');
INSERT INTO `paper` VALUES ('288', '熠林预初英语（1-8班）阅读理解－综合练习二', '3', '6', '1', 'paper/05011934516404977.docx', 'neck1908', '2020-05-01 19:34:51');
INSERT INTO `paper` VALUES ('289', '育才中学     6A期末考试', '3', '6', '1', 'paper/05011935097785417.docx', 'neck1908', '2020-05-01 19:35:09');
INSERT INTO `paper` VALUES ('290', '张江集团学校2016学年第二学期预初英语单元测验', '3', '6', '1', 'paper/05011935425793779.docx', 'neck1908', '2020-05-01 19:35:42');
INSERT INTO `paper` VALUES ('291', '上海市黄浦区敬业中学2019-2020学年高一下学期期中考试物理试题（教师版）', '4', '8', '2', 'paper/05011935471917764.doc', 'fetj1908', '2020-05-01 19:35:47');
INSERT INTO `paper` VALUES ('292', '上海市建平中学西校2019-2020学年八年级3月月考物理试题（学生版）', '4', '8', '2', 'paper/05011936232551278.doc', 'fetj1908', '2020-05-01 19:36:23');
INSERT INTO `paper` VALUES ('293', '2019-2020学年复旦附中英语练习---汉译英100句及参考答案', '3', '9', '2', 'paper/05011937374759684.docx', 'neck1908', '2020-05-01 19:37:37');
INSERT INTO `paper` VALUES ('294', '上海市静安区实验中学2019-2020学年八年级单元练习物理试题（机械和功）（解', '4', '8', '2', 'paper/05011937433337072.doc', 'fetj1908', '2020-05-01 19:37:43');
INSERT INTO `paper` VALUES ('295', '2019-2020学年浦外9B月考1－含答案', '3', '9', '2', 'paper/05011937558752092.docx', 'neck1908', '2020-05-01 19:37:55');
INSERT INTO `paper` VALUES ('296', '上海市静安区实验中学2019-2020学年八年级单元练习物理试题（机械和功）（学', '4', '8', '2', 'paper/05011938121479814.doc', 'fetj1908', '2020-05-01 19:38:12');
INSERT INTO `paper` VALUES ('297', '上海市静安区实验中学2019-2020学年八年级单元练习物理试题（机械和功）（学', '4', '8', '2', 'paper/05011938141713078.doc', 'fetj1908', '2020-05-01 19:38:14');
INSERT INTO `paper` VALUES ('298', '上海市静安区实验中学2019-2020学年八年级课时练习物理试题（滑轮）（解析版', '4', '8', '2', 'paper/05011938448071998.doc', 'fetj1908', '2020-05-01 19:38:44');
INSERT INTO `paper` VALUES ('299', '2019-2020学年上海市静安区市西初级中学八年级下学期英语Unit1测试卷', '3', '8', '2', 'paper/05011938503254767.docx', 'neck1908', '2020-05-01 19:38:50');
INSERT INTO `paper` VALUES ('300', '上海市静安区实验中学2019-2020学年八年级课时练习物理试题（滑轮）（学生版', '4', '8', '2', 'paper/05011939104853342.doc', 'fetj1908', '2020-05-01 19:39:10');
INSERT INTO `paper` VALUES ('301', '2019-2020学年上海市静安区市西初级中学八年级下学期英语Unit2测试卷', '3', '8', '2', 'paper/05011939134383558.docx', 'neck1908', '2020-05-01 19:39:13');
INSERT INTO `paper` VALUES ('302', '上海市静安区实验中学2019-2020学年九年级单元练习物理试题（运动和力2）', '4', '9', '2', 'paper/05011939466655843.doc', 'fetj1908', '2020-05-01 19:39:46');
INSERT INTO `paper` VALUES ('303', '2019-2020学年上海市静安区市西初级中学八年级下学期英语Unit3测试卷', '3', '8', '2', 'paper/05011940016585701.docx', 'neck1908', '2020-05-01 19:40:01');
INSERT INTO `paper` VALUES ('304', '上海市静安区实验中学2019-2020学年九年级单元练习物理试题（运动和力2）（', '4', '9', '2', 'paper/05011940117643648.doc', 'fetj1908', '2020-05-01 19:40:11');
INSERT INTO `paper` VALUES ('305', '2019-2020学年上海市静安区市西初级中学八年级下学期英语Unit4测试卷', '3', '8', '2', 'paper/05011940418111145.docx', 'neck1908', '2020-05-01 19:40:41');
INSERT INTO `paper` VALUES ('306', '2019-2020学年上海市静安区市西初级中学八年级下学期英语Unit5测试卷', '3', '8', '2', 'paper/05011940593763713.docx', 'neck1908', '2020-05-01 19:40:59');
INSERT INTO `paper` VALUES ('307', '2019-2020学年上海市静安区市西初级中学八年级下学期英语学科期中考试卷', '3', '8', '2', 'paper/05011941179498212.doc', 'neck1908', '2020-05-01 19:41:17');
INSERT INTO `paper` VALUES ('308', '徐汇中学2019学年初三上期中物理考试(1)', '4', '9', '1', 'paper/05011941217843842.doc', 'fetj1908', '2020-05-01 19:41:21');
INSERT INTO `paper` VALUES ('309', '2019-2020学年世外初三下学期第二次自我评估卷-适用于135 学生', '3', '9', '2', 'paper/05011941401565043.docx', 'neck1908', '2020-05-01 19:41:40');
INSERT INTO `paper` VALUES ('310', '2019-2020学年世外初三下学期第一次自我评估卷--适用于125 学生', '3', '9', '2', 'paper/05011943479956077.docx', 'neck1908', '2020-05-01 19:43:47');
INSERT INTO `paper` VALUES ('311', '2019-2020学年新华初八年级英语8BU1测试卷  教师版', '3', '8', '2', 'paper/05011944184136025.docx', 'neck1908', '2020-05-01 19:44:18');
INSERT INTO `paper` VALUES ('312', '2020年上海外国语大学西外外国语学校初三3月份月考英语阶段反馈试卷(英语) W', '3', '9', '2', 'paper/05011944463745075.doc', 'neck1908', '2020-05-01 19:44:46');
INSERT INTO `paper` VALUES ('313', '2020年上海中考化学仿真模拟卷1', '5', '9', '2', 'paper/05011945081277551.docx', 'fetj1908', '2020-05-01 19:45:08');
INSERT INTO `paper` VALUES ('314', '复兴中学初一年级英语单元测试 7BU1 教师版', '3', '7', '2', 'paper/05011945182157816.docx', 'neck1908', '2020-05-01 19:45:18');
INSERT INTO `paper` VALUES ('315', '复兴中学初一年级英语单元测试 7BU1 学生版', '3', '7', '2', 'paper/05011945372102882.docx', 'neck1908', '2020-05-01 19:45:37');
INSERT INTO `paper` VALUES ('316', '2020年上海中考化学仿真模拟卷2', '5', '9', '2', 'paper/05011945395954758.docx', 'fetj1908', '2020-05-01 19:45:39');
INSERT INTO `paper` VALUES ('317', '行知二中网课学习资料-模块二：名词', '3', '7', '2', 'paper/05011945575187522.doc', 'neck1908', '2020-05-01 19:45:57');
INSERT INTO `paper` VALUES ('318', '2020年上海中考化学仿真模拟卷3', '5', '9', '2', 'paper/05011945599231845.docx', 'fetj1908', '2020-05-01 19:45:59');
INSERT INTO `paper` VALUES ('319', '行知二中网课学习资料-模块三：代词', '3', '7', '2', 'paper/05011946134993384.doc', 'neck1908', '2020-05-01 19:46:13');
INSERT INTO `paper` VALUES ('320', '行知二中网课学习资料-模块一：句子结构', '3', '7', '2', 'paper/05011946313939584.doc', 'neck1908', '2020-05-01 19:46:31');
INSERT INTO `paper` VALUES ('321', '上海市松江区西外外国语学校2019-2020学年九年级下学期3月份月考化学试题（', '5', '9', '2', 'paper/05011946359541629.doc', 'fetj1908', '2020-05-01 19:46:35');
INSERT INTO `paper` VALUES ('322', '名校语法填空分考点汇编4月16日by南方商城高中组', '3', '7', '2', 'paper/05011946563155602.doc', 'neck1908', '2020-05-01 19:46:56');
INSERT INTO `paper` VALUES ('323', '上海市松江区西外外国语学校2019-2020学年九年级下学期3月份月考化学试题（', '5', '9', '2', 'paper/05011946588631747.doc', 'fetj1908', '2020-05-01 19:46:58');
INSERT INTO `paper` VALUES ('324', '上海市静安区实验中学上海英语牛津版五四制八年级下册U4语法点同步习题（解析版）', '3', '8', '2', 'paper/05011947175168720.doc', 'neck1908', '2020-05-01 19:47:17');
INSERT INTO `paper` VALUES ('325', '2017_2018学年交大附中自招试卷（答案版）', '5', '9', '2', 'paper/05011947406426885.docx', 'fetj1908', '2020-05-01 19:47:40');
INSERT INTO `paper` VALUES ('326', '上中东9B 周练5答案', '3', '9', '2', 'paper/05011947406667515.docx', 'neck1908', '2020-05-01 19:47:40');
INSERT INTO `paper` VALUES ('327', '2017_2018学年交大附中自招试卷（解析版）', '5', '9', '2', 'paper/05011948069053639.docx', 'fetj1908', '2020-05-01 19:48:06');
INSERT INTO `paper` VALUES ('328', '苏民中学八年级英语阶段测试试题', '3', '8', '2', 'paper/05011948181197471.doc', 'neck1908', '2020-05-01 19:48:18');
INSERT INTO `paper` VALUES ('329', '2018-2019学年上海市宝山区交大附中自招练习（答案版）', '5', '9', '2', 'paper/05011948319561712.docx', 'fetj1908', '2020-05-01 19:48:31');
INSERT INTO `paper` VALUES ('330', '2018-2019学年上海市宝山区交大附中自招练习（解析版）', '5', '9', '2', 'paper/05011949024457764.docx', 'fetj1908', '2020-05-01 19:49:02');
INSERT INTO `paper` VALUES ('331', '2019格致中学自招化学试题回忆版（答案版）', '5', '9', '2', 'paper/05011949272093267.docx', 'fetj1908', '2020-05-01 19:49:27');
INSERT INTO `paper` VALUES ('332', '2019格致中学自招化学试题回忆版（解析版）', '5', '9', '2', 'paper/05011949475682635.docx', 'fetj1908', '2020-05-01 19:49:47');
INSERT INTO `paper` VALUES ('333', '2019年闵行中学化学自招试题', '5', '9', '2', 'paper/05011950107527634.docx', 'fetj1908', '2020-05-01 19:50:10');
INSERT INTO `paper` VALUES ('334', '2019自招试题回忆版（解析版）', '5', '9', '2', 'paper/05011950342088381.docx', 'fetj1908', '2020-05-01 19:50:34');
INSERT INTO `paper` VALUES ('335', '华二化学自招试题回忆版', '5', '9', '2', 'paper/05011951035648121.docx', 'fetj1908', '2020-05-01 19:51:03');
INSERT INTO `paper` VALUES ('336', '2016-2017学年上海川沙南校六下英语期中考试', '3', '6', '2', 'paper/05012002439564018.docx', 'oqrj1908', '2020-05-01 20:02:43');
INSERT INTO `paper` VALUES ('337', '2016-2017学年西南位育八下英语期中考试', '3', '8', '2', 'paper/05012004222916055.docx', 'oqrj1908', '2020-05-01 20:04:22');
INSERT INTO `paper` VALUES ('338', '2016-2017学年育才中学六下英语期中考试', '3', '6', '2', 'paper/05012004566275814.doc', 'oqrj1908', '2020-05-01 20:04:56');
INSERT INTO `paper` VALUES ('339', '2017-2018学年第四教育署七下英语期中', '3', '7', '2', 'paper/05012006082773497.docx', 'oqrj1908', '2020-05-01 20:06:08');
INSERT INTO `paper` VALUES ('340', '2017-2018学年甘泉外国语八下英语期中考试', '3', '8', '2', 'paper/05012007158405459.docx', 'oqrj1908', '2020-05-01 20:07:15');
INSERT INTO `paper` VALUES ('341', '2017-2018学年虹口区六下英语期中考', '3', '6', '2', 'paper/05012007346051962.docx', 'oqrj1908', '2020-05-01 20:07:34');
INSERT INTO `paper` VALUES ('342', '2017-2018学年建平实验八下英语期中复习Unit3测试_', '3', '8', '2', 'paper/05012007564087103.docx', 'oqrj1908', '2020-05-01 20:07:56');
INSERT INTO `paper` VALUES ('343', '2017-2018学年建平香梅中学八下英语期中考试', '3', '8', '2', 'paper/05012008161770119.doc', 'oqrj1908', '2020-05-01 20:08:16');
INSERT INTO `paper` VALUES ('344', '2017-2018学年九亭二中六下英语期中考试', '3', '6', '2', 'paper/05012008418231168.doc', 'oqrj1908', '2020-05-01 20:08:41');
INSERT INTO `paper` VALUES ('345', '2017-2018学年立达中学八下英语期中考试', '3', '8', '2', 'paper/05012009036558156.docx', 'oqrj1908', '2020-05-01 20:09:03');
INSERT INTO `paper` VALUES ('346', '2017-2018学年闵行区十校联考七下英语期中考试', '3', '7', '2', 'paper/05012009237638455.docx', 'oqrj1908', '2020-05-01 20:09:23');
INSERT INTO `paper` VALUES ('347', '2017-2018学年培佳双语七下英语_Unit_Three周练卷', '3', '7', '2', 'paper/05012009441273521.docx', 'oqrj1908', '2020-05-01 20:09:44');
INSERT INTO `paper` VALUES ('348', '2017-2018学年浦东北蔡中学六下英语期中考试', '3', '6', '2', 'paper/05012010067903046.doc', 'oqrj1908', '2020-05-01 20:10:06');
INSERT INTO `paper` VALUES ('349', '2017-2018学年普陀区八年级下学期期中考试英语试题', '3', '8', '2', 'paper/05012010336472820.doc', 'oqrj1908', '2020-05-01 20:10:33');
INSERT INTO `paper` VALUES ('350', '2017-2018学年普陀区七下英语期中', '3', '7', '2', 'paper/05012013247459943.doc', 'oqrj1908', '2020-05-01 20:13:24');
INSERT INTO `paper` VALUES ('351', '2017-2018学年上海普陀区六下英语期中考试', '3', '6', '2', 'paper/05012016136537245.doc', 'oqrj1908', '2020-05-01 20:16:13');
INSERT INTO `paper` VALUES ('352', '2017-2018学年上海实验中学六下英语期中考试', '3', '6', '2', 'paper/05012016394662473.docx', 'oqrj1908', '2020-05-01 20:16:39');
INSERT INTO `paper` VALUES ('353', '2017-2018学年上中东六下英语期中考试', '3', '6', '2', 'paper/05012017139550836.docx', 'oqrj1908', '2020-05-01 20:17:13');
INSERT INTO `paper` VALUES ('354', '2017-2018学年市三女中七下英语期中考试', '3', '7', '2', 'paper/05012017366528681.docx', 'oqrj1908', '2020-05-01 20:17:36');
INSERT INTO `paper` VALUES ('355', '2017-2018学年市西中学六下英语期中考试', '3', '6', '2', 'paper/05012017581349907.docx', 'oqrj1908', '2020-05-01 20:17:58');
INSERT INTO `paper` VALUES ('356', '2017-2018学年文来中学八下周练第十周', '3', '8', '2', 'paper/05012018209647612.docx', 'oqrj1908', '2020-05-01 20:18:20');
INSERT INTO `paper` VALUES ('357', '2017-2018学年西南模范八下英语单元测试(Unit_4)', '3', '8', '2', 'paper/05012018548987133.docx', 'oqrj1908', '2020-05-01 20:18:54');
INSERT INTO `paper` VALUES ('358', '2017-2018学年西南位育七下英语期中考试', '3', '7', '2', 'paper/05012019278734775.docx', 'oqrj1908', '2020-05-01 20:19:27');
INSERT INTO `paper` VALUES ('359', '2017-2018学年新华初级六下英语期中考试', '3', '6', '2', 'paper/05012019508905415.docx', 'oqrj1908', '2020-05-01 20:19:50');
INSERT INTO `paper` VALUES ('360', '2017-2018学年新径中学7BU1-3测试卷', '3', '7', '2', 'paper/05012020197490928.docx', 'oqrj1908', '2020-05-01 20:20:19');
INSERT INTO `paper` VALUES ('361', '2017-2018学年中远实验七下英语期中考试', '3', '7', '2', 'paper/05012020463385297.docx', 'oqrj1908', '2020-05-01 20:20:46');
INSERT INTO `paper` VALUES ('362', '2018-2019华政附中八下英语单元测试U2', '3', '8', '2', 'paper/05012021134717331.docx', 'oqrj1908', '2020-05-01 20:21:13');
INSERT INTO `paper` VALUES ('363', '2018-2019学年虹口实验八下英语单元测试Unit_2', '3', '8', '2', 'paper/05012021414736287.docx', 'oqrj1908', '2020-05-01 20:21:41');
INSERT INTO `paper` VALUES ('364', '2018-2019学年华育七下英语M1U2-U3_测试题', '3', '7', '2', 'paper/05012022065912158.docx', 'oqrj1908', '2020-05-01 20:22:06');
INSERT INTO `paper` VALUES ('365', '2018-2019学年华政期中八下期中复习卷', '3', '8', '2', 'paper/05012022356278042.docx', 'oqrj1908', '2020-05-01 20:22:35');
INSERT INTO `paper` VALUES ('366', '2018-2019学年进才中学初升高自招英语模拟卷一', '3', '9', '2', 'paper/05012023048631319.docx', 'oqrj1908', '2020-05-01 20:23:04');
INSERT INTO `paper` VALUES ('367', '2018-2019学年浦东新区六下英语期中考试', '3', '6', '2', 'paper/05012023269474440.docx', 'oqrj1908', '2020-05-01 20:23:26');
INSERT INTO `paper` VALUES ('368', '2018-2019学年上宝中学八下英语3月月考', '3', '8', '2', 'paper/05012023501024587.docx', 'oqrj1908', '2020-05-01 20:23:50');
INSERT INTO `paper` VALUES ('369', '2018-2019学年西南模范七下英语三月月考', '3', '7', '2', 'paper/05012024189869706.docx', 'oqrj1908', '2020-05-01 20:24:18');
INSERT INTO `paper` VALUES ('370', '2018-2019学年新复兴六下英语单元测试', '3', '6', '2', 'paper/05012024432982071.docx', 'oqrj1908', '2020-05-01 20:24:43');
INSERT INTO `paper` VALUES ('371', '2018-2019学年新复兴七下英语单元测试Unit3', '3', '7', '2', 'paper/05012025069383890.docx', 'oqrj1908', '2020-05-01 20:25:06');
INSERT INTO `paper` VALUES ('372', '2018-2019学年新华初九下英语第一次月考', '3', '9', '2', 'paper/05012025268439686.docx', 'oqrj1908', '2020-05-01 20:25:26');
INSERT INTO `paper` VALUES ('373', '2019届崇明区中考英语二模', '3', '9', '2', 'paper/05012025467470929.docx', 'oqrj1908', '2020-05-01 20:25:46');
INSERT INTO `paper` VALUES ('374', '2019届奉贤区中考英语二模', '3', '9', '2', 'paper/05012026098492367.docx', 'oqrj1908', '2020-05-01 20:26:09');
INSERT INTO `paper` VALUES ('375', '2019届黄浦区中考英语二模', '3', '9', '2', 'paper/05012026254150881.docx', 'oqrj1908', '2020-05-01 20:26:25');
INSERT INTO `paper` VALUES ('376', '2019届嘉定区中考英语二模', '3', '9', '2', 'paper/05012026429968280.docx', 'oqrj1908', '2020-05-01 20:26:42');
INSERT INTO `paper` VALUES ('377', '2019届金山区中考英语二模', '3', '9', '2', 'paper/05012027017927795.docx', 'oqrj1908', '2020-05-01 20:27:01');
INSERT INTO `paper` VALUES ('378', '2019届静安区中考英语二模', '3', '9', '2', 'paper/05012027156812740.docx', 'oqrj1908', '2020-05-01 20:27:15');
INSERT INTO `paper` VALUES ('379', '2019届闵行区中考英语二模', '3', '9', '2', 'paper/05012027306968990.docx', 'oqrj1908', '2020-05-01 20:27:30');
INSERT INTO `paper` VALUES ('380', '2019届普陀区中考英语二模', '3', '9', '2', 'paper/05012027459975876.docx', 'oqrj1908', '2020-05-01 20:27:45');
INSERT INTO `paper` VALUES ('381', '2019届杨浦区中考英语二模', '3', '9', '2', 'paper/05012028104589966.docx', 'oqrj1908', '2020-05-01 20:28:10');
INSERT INTO `paper` VALUES ('382', '2019届长宁区中考英语二模', '3', '9', '2', 'paper/05012028259638587.docx', 'oqrj1908', '2020-05-01 20:28:25');
INSERT INTO `paper` VALUES ('383', '上外附中初三复习语法练习Exercise_Three(50题）', '3', '9', '2', 'paper/05012028419655482.docx', 'oqrj1908', '2020-05-01 20:28:41');
INSERT INTO `paper` VALUES ('384', '2016-2017学年进华中学七下英语周测', '3', '7', '2', 'paper/05012034218221816.docx', 'oqrj1908', '2020-05-01 20:34:21');
INSERT INTO `paper` VALUES ('385', '2017-2018学年明珠中学六下英语三月考试', '3', '6', '2', 'paper/05012034448891461.docx', 'oqrj1908', '2020-05-01 20:34:44');
INSERT INTO `paper` VALUES ('386', '2017-2018学年南洋模范八下英语三月月考', '3', '8', '2', 'paper/05012035039598991.docx', 'oqrj1908', '2020-05-01 20:35:03');
INSERT INTO `paper` VALUES ('387', '2017-2018学年上海中学东校七下单元测试Unit_1', '3', '7', '2', 'paper/05012035464244415.docx', 'oqrj1908', '2020-05-01 20:35:46');
INSERT INTO `paper` VALUES ('388', '2017-2018学年桃李园七下英语三月考试', '3', '7', '2', 'paper/05012036031094903.docx', 'oqrj1908', '2020-05-01 20:36:03');
INSERT INTO `paper` VALUES ('389', '2017-2018学年文绮中学九下英语四月周练', '3', '9', '2', 'paper/05012036205794560.docx', 'oqrj1908', '2020-05-01 20:36:20');
INSERT INTO `paper` VALUES ('390', '2017-2018学年西南模八下英语单元测试Unit_2', '3', '8', '2', 'paper/05012036364952583.docx', 'oqrj1908', '2020-05-01 20:36:36');
INSERT INTO `paper` VALUES ('391', '2017-2018学年西南模范七下英语M1测试', '3', '7', '2', 'paper/05012036527555081.docx', 'oqrj1908', '2020-05-01 20:36:52');
INSERT INTO `paper` VALUES ('392', '2017-2018学年新华初八下英语单元测试U1', '3', '8', '2', 'paper/05012037102159542.docx', 'oqrj1908', '2020-05-01 20:37:10');
INSERT INTO `paper` VALUES ('393', '2017-2018学年新华初六下英语三月考试', '3', '6', '2', 'paper/05012037591877207.docx', 'oqrj1908', '2020-05-01 20:37:59');
INSERT INTO `paper` VALUES ('394', '2017-2018学年育才初级中学八下英语跟踪练习', '3', '8', '2', 'paper/05012038202212060.docx', 'oqrj1908', '2020-05-01 20:38:20');
INSERT INTO `paper` VALUES ('395', '2018-2019学年复旦附中八下英语3月考试', '3', '8', '2', 'paper/05012038414606720.docx', 'oqrj1908', '2020-05-01 20:38:41');
INSERT INTO `paper` VALUES ('396', '2018-2019学年复兴七下英语Unit_1', '3', '7', '2', 'paper/05012039004740447.docx', 'oqrj1908', '2020-05-01 20:39:00');
INSERT INTO `paper` VALUES ('397', '2018-2019学年复兴七下英语单元测试U2', '3', '7', '2', 'paper/05012039143085812.docx', 'oqrj1908', '2020-05-01 20:39:14');
INSERT INTO `paper` VALUES ('398', '2018-2019学年华政附中八下英语单元测试', '3', '8', '2', 'paper/05012039284361539.docx', 'oqrj1908', '2020-05-01 20:39:28');
INSERT INTO `paper` VALUES ('399', '2018-2019学年建平实验七下周周练练习题', '3', '7', '2', 'paper/05012039493406011.docx', 'oqrj1908', '2020-05-01 20:39:49');
INSERT INTO `paper` VALUES ('400', '2018-2019学年静安区七下第一单元测试题', '3', '7', '2', 'paper/05012040068107432.docx', 'oqrj1908', '2020-05-01 20:40:06');
INSERT INTO `paper` VALUES ('401', '2018-2019学年静安区七下英语单元Unit_3练习题', '3', '7', '2', 'paper/05012040253781925.docx', 'oqrj1908', '2020-05-01 20:40:25');
INSERT INTO `paper` VALUES ('402', '2018-2019学年南洋模范九下英语3月月考', '3', '9', '2', 'paper/05012040517591423.docx', 'oqrj1908', '2020-05-01 20:40:51');
INSERT INTO `paper` VALUES ('403', '2018-2019学年上宝中学八下英语周末卷', '3', '8', '2', 'paper/05012041133803253.docx', 'oqrj1908', '2020-05-01 20:41:13');
INSERT INTO `paper` VALUES ('404', '2018-2019学年位育中学六下英语三月考试', '3', '6', '2', 'paper/05012041344547397.docx', 'oqrj1908', '2020-05-01 20:41:34');
INSERT INTO `paper` VALUES ('405', '2018-2019学年西延安九下英语三月月考', '3', '9', '2', 'paper/05012041594908769.docx', 'oqrj1908', '2020-05-01 20:41:59');
INSERT INTO `paper` VALUES ('406', '2018-2019学年新华初八下英语单元测试', '3', '8', '2', 'paper/05012042184155140.docx', 'oqrj1908', '2020-05-01 20:42:18');
INSERT INTO `paper` VALUES ('407', '2018-2019学年新华初七下英语单元测试', '3', '7', '2', 'paper/05012042348695485.docx', 'oqrj1908', '2020-05-01 20:42:34');
INSERT INTO `paper` VALUES ('408', '2018-2019学年徐教院附中七下英语三月月考', '3', '7', '2', 'paper/05012042511830098.docx', 'oqrj1908', '2020-05-01 20:42:51');
INSERT INTO `paper` VALUES ('409', '2018年中考二模汇编（动词时态语态和非谓语动词）', '3', '9', '2', 'paper/05012043074382832.docx', 'oqrj1908', '2020-05-01 20:43:07');
INSERT INTO `paper` VALUES ('410', '2018年中考二模汇编（介词、连词、形容词副词）', '3', '9', '2', 'paper/05012043239536130.docx', 'oqrj1908', '2020-05-01 20:43:23');
INSERT INTO `paper` VALUES ('411', '2018年中考二模汇编（名词、代词、冠词、音标）', '3', '9', '2', 'paper/05012043387316910.docx', 'oqrj1908', '2020-05-01 20:43:38');
INSERT INTO `paper` VALUES ('412', '2018年中考二模汇编（情境对话等）', '3', '9', '2', 'paper/05012043541552655.docx', 'oqrj1908', '2020-05-01 20:43:54');
INSERT INTO `paper` VALUES ('413', '2018年中考二模汇编（情态动词、感叹句、祈使句等）', '3', '9', '2', 'paper/05012044093918562.docx', 'oqrj1908', '2020-05-01 20:44:09');
INSERT INTO `paper` VALUES ('414', '2019届中考一模完整语法汇编--（动词、非谓语动词、固定搭配等）', '3', '9', '2', 'paper/05012044239953385.docx', 'oqrj1908', '2020-05-01 20:44:23');
INSERT INTO `paper` VALUES ('415', '2019届中考一模完整语法汇编--（情境对话、连词、状语从句等）', '3', '9', '2', 'paper/05012044387976163.docx', 'oqrj1908', '2020-05-01 20:44:38');
INSERT INTO `paper` VALUES ('416', '2019届中考一模完整语法汇编--（音标、代词、数词、形容词等）', '3', '9', '2', 'paper/05012044525764666.docx', 'oqrj1908', '2020-05-01 20:44:52');
INSERT INTO `paper` VALUES ('417', '上宝中学初三首字母阅读练习10篇', '3', '9', '2', 'paper/05012045087800492.docx', 'oqrj1908', '2020-05-01 20:45:08');
INSERT INTO `paper` VALUES ('418', '上外附中初三复习语法练习Exercise_One_(50题）', '3', '9', '2', 'paper/05012046172480581.docx', 'oqrj1908', '2020-05-01 20:46:17');
INSERT INTO `paper` VALUES ('419', '上外附中初三复习语法练习Exercise_Two(50题）', '3', '9', '2', 'paper/05012046371393456.docx', 'oqrj1908', '2020-05-01 20:46:37');
INSERT INTO `paper` VALUES ('420', '中考首字母填空--技巧篇（附试题）', '3', '9', '2', 'paper/05012046558736727.docx', 'oqrj1908', '2020-05-01 20:46:55');
INSERT INTO `paper` VALUES ('421', '中考首字母填空--真题汇编（2007-2018）', '3', '9', '2', 'paper/05012047144283718.doc', 'oqrj1908', '2020-05-01 20:47:14');
INSERT INTO `paper` VALUES ('422', '中考英语首字母高频词单句练习题--A-D', '3', '9', '2', 'paper/05012047378357706.docx', 'oqrj1908', '2020-05-01 20:47:37');
INSERT INTO `paper` VALUES ('423', '中考英语首字母高频词单句练习题--E-N', '3', '9', '2', 'paper/05012047554224662.docx', 'oqrj1908', '2020-05-01 20:47:55');
INSERT INTO `paper` VALUES ('424', '中考英语首字母高频词单句练习题--O-W', '3', '9', '2', 'paper/05012048125349576.docx', 'oqrj1908', '2020-05-01 20:48:12');
INSERT INTO `paper` VALUES ('425', '中考英语--字母_J_K_L_(词性分类汇编）', '3', '9', '2', 'paper/05012048276688451.docx', 'oqrj1908', '2020-05-01 20:48:27');
INSERT INTO `paper` VALUES ('426', '中考英语--字母_M_N_O(词性分类汇编）', '3', '9', '2', 'paper/05012048448319388.docx', 'oqrj1908', '2020-05-01 20:48:44');
INSERT INTO `paper` VALUES ('427', '中考英语--字母_P_Q_R_(词性分类汇编）', '3', '9', '2', 'paper/05012049004106521.docx', 'oqrj1908', '2020-05-01 20:49:00');
INSERT INTO `paper` VALUES ('428', '中考英语--字母_S_T_U_(词性分类汇编）', '3', '9', '2', 'paper/05012049168328994.docx', 'oqrj1908', '2020-05-01 20:49:16');
INSERT INTO `paper` VALUES ('429', '字母_U_-_Z(词性分类汇编）', '3', '9', '2', 'paper/05012049346171859.docx', 'oqrj1908', '2020-05-01 20:49:34');
INSERT INTO `paper` VALUES ('430', '中考英语--字母A_B_C_（词性分类汇编）', '3', '9', '2', 'paper/05012049515841454.docx', 'oqrj1908', '2020-05-01 20:49:51');
INSERT INTO `paper` VALUES ('431', '中考英语--字母D_E_F_(词性分类汇编）', '3', '9', '2', 'paper/05012050129587482.docx', 'oqrj1908', '2020-05-01 20:50:12');
INSERT INTO `paper` VALUES ('432', '中考英语--字母G_H_I_(词性分类汇编）', '3', '9', '2', 'paper/05012050295367446.docx', 'oqrj1908', '2020-05-01 20:50:29');
INSERT INTO `paper` VALUES ('433', '优等生（二模冲刺用）易错题--汇编1', '3', '9', '2', 'paper/05012053029218281.docx', 'oqrj1908', '2020-05-01 20:53:02');
INSERT INTO `paper` VALUES ('434', '优等生（二模冲刺用）易错题--汇编2', '3', '9', '2', 'paper/05012053173400498.docx', 'oqrj1908', '2020-05-01 20:53:17');
INSERT INTO `paper` VALUES ('435', '优等生（二模冲刺用）易错题--汇编3', '3', '9', '2', 'paper/05012053301981103.docx', 'oqrj1908', '2020-05-01 20:53:30');
INSERT INTO `paper` VALUES ('436', '优等生（二模冲刺用）易错题--汇编4', '3', '9', '2', 'paper/05012053441936296.docx', 'oqrj1908', '2020-05-01 20:53:44');
INSERT INTO `paper` VALUES ('437', '优等生（二模冲刺用）易错题--汇编5', '3', '9', '2', 'paper/05012053573136286.docx', 'oqrj1908', '2020-05-01 20:53:57');
INSERT INTO `paper` VALUES ('438', '2018普陀区高考英语二模--重点词汇汇总', '3', '12', '2', 'paper/05012057329383172.docx', 'oqrj1908', '2020-05-01 20:57:32');
INSERT INTO `paper` VALUES ('439', '2018青浦区高考英语二模--重点词汇汇总', '3', '12', '2', 'paper/05012057481546424.docx', 'oqrj1908', '2020-05-01 20:57:48');
INSERT INTO `paper` VALUES ('440', '字母A', '3', '12', '2', 'paper/05012058108546790.docx', 'oqrj1908', '2020-05-01 20:58:10');
INSERT INTO `paper` VALUES ('441', '字母B_', '3', '12', '2', 'paper/05012058258547011.docx', 'oqrj1908', '2020-05-01 20:58:25');
INSERT INTO `paper` VALUES ('442', '字母C', '3', '12', '2', 'paper/05012058413431222.docx', 'oqrj1908', '2020-05-01 20:58:41');
INSERT INTO `paper` VALUES ('443', '字母D_', '3', '12', '2', 'paper/05012059282328013.docx', 'oqrj1908', '2020-05-01 20:59:28');
INSERT INTO `paper` VALUES ('444', '字母E', '3', '12', '2', 'paper/05012059434348555.docx', 'oqrj1908', '2020-05-01 20:59:43');
INSERT INTO `paper` VALUES ('445', '词汇专练--近年高三联考十一选十汇编', '3', '12', '2', 'paper/05012059576804259.docx', 'oqrj1908', '2020-05-01 20:59:57');
INSERT INTO `paper` VALUES ('446', '高一期中考试复习准备--翻译（四校汇编）', '3', '10', '2', 'paper/05012100264126592.docx', 'oqrj1908', '2020-05-01 21:00:26');
INSERT INTO `paper` VALUES ('447', '高一期中考试复习准备--十一选十（四校汇编）', '3', '10', '2', 'paper/05012101031760821.docx', 'oqrj1908', '2020-05-01 21:01:03');
INSERT INTO `paper` VALUES ('448', '高一期中考试复习准备--新题型（四校汇编）', '3', '10', '2', 'paper/05012101226453073.docx', 'oqrj1908', '2020-05-01 21:01:22');
INSERT INTO `paper` VALUES ('449', '高一期中考试复习准备--语法知识专练（牛津版）', '3', '10', '2', 'paper/05012101363026894.docx', 'oqrj1908', '2020-05-01 21:01:36');
INSERT INTO `paper` VALUES ('450', '完型专练--近年高三联考十一选十汇编', '3', '12', '2', 'paper/05012101543962086.docx', 'oqrj1908', '2020-05-01 21:01:54');
INSERT INTO `paper` VALUES ('451', '2016-2017学年高考二模新题型-非谓语动词（doing_)解析版', '3', '12', '2', 'paper/05012102108579660.docx', 'oqrj1908', '2020-05-01 21:02:10');
INSERT INTO `paper` VALUES ('452', '2016-2017学年高考二模新题型-非谓语动词（v+ed)解析版', '3', '12', '2', 'paper/05012102255214430.docx', 'oqrj1908', '2020-05-01 21:02:25');
INSERT INTO `paper` VALUES ('453', '2016-2017学年高考二模新题型-非谓语动词（to_do_)解析版', '3', '12', '2', 'paper/05012102529129275.docx', 'oqrj1908', '2020-05-01 21:02:52');
INSERT INTO `paper` VALUES ('454', '2016-2017学年高考二模新题型-代词解析版', '3', '12', '2', 'paper/05012103104292955.docx', 'oqrj1908', '2020-05-01 21:03:10');
INSERT INTO `paper` VALUES ('455', '2016-2017学年高考二模新题型-定语从句解析版', '3', '12', '2', 'paper/05012103301002447.docx', 'oqrj1908', '2020-05-01 21:03:30');
INSERT INTO `paper` VALUES ('456', '2016-2017学年高考二模新题型-其他部分解析版', '3', '12', '2', 'paper/05012103467796107.docx', 'oqrj1908', '2020-05-01 21:03:46');
INSERT INTO `paper` VALUES ('457', '2016-2017学年高考二模新题型-介词或介词短语解析版', '3', '12', '2', 'paper/05012104008539171.docx', 'oqrj1908', '2020-05-01 21:04:00');
INSERT INTO `paper` VALUES ('458', '2016-2017学年高考二模新题型-名词性从句解析版', '3', '12', '2', 'paper/05012104151212438.docx', 'oqrj1908', '2020-05-01 21:04:15');
INSERT INTO `paper` VALUES ('459', '2016-2017学年高考二模新题型-情态动词解析版', '3', '12', '2', 'paper/05012104358556967.docx', 'oqrj1908', '2020-05-01 21:04:35');
INSERT INTO `paper` VALUES ('460', '2016-2017学年高考二模新题型-动词适当形式解析版', '3', '12', '2', 'paper/05012104534257032.docx', 'oqrj1908', '2020-05-01 21:04:53');
INSERT INTO `paper` VALUES ('461', '语法专练--近年高三联考语法填空汇编', '3', '12', '2', 'paper/05012105102983403.docx', 'oqrj1908', '2020-05-01 21:05:10');
INSERT INTO `paper` VALUES ('462', '2016-2017学年高考二模新题型-状语从句解析版', '3', '12', '2', 'paper/05012105262949639.docx', 'oqrj1908', '2020-05-01 21:05:26');
INSERT INTO `paper` VALUES ('463', '作文-2018年高三一模作文汇编_-徐汇区、黄浦、普陀区', '3', '12', '2', 'paper/05012105416900123.docx', 'oqrj1908', '2020-05-01 21:05:41');
INSERT INTO `paper` VALUES ('464', '作文-2018年高三一模作文汇编_-杨浦区、虹口区、浦东', '3', '12', '2', 'paper/05012105548085815.docx', 'oqrj1908', '2020-05-01 21:05:54');
INSERT INTO `paper` VALUES ('465', '作文-2018年高三一模作文汇编-松江区、长宁、宝山区', '3', '12', '2', 'paper/05012106096801594.docx', 'oqrj1908', '2020-05-01 21:06:09');
INSERT INTO `paper` VALUES ('466', '2017-2018学年崇明区高一上英语期末', '3', '10', '1', 'paper/05012107283831604.docx', 'oqrj1908', '2020-05-01 21:07:28');
INSERT INTO `paper` VALUES ('467', '2017-2018学年奉贤区高一上英语调研测试卷', '3', '10', '1', 'paper/05012107435932785.docx', 'oqrj1908', '2020-05-01 21:07:43');
INSERT INTO `paper` VALUES ('468', '2017-2018学年嘉定区高一上英语期末', '3', '10', '1', 'paper/05012107568254245.docx', 'oqrj1908', '2020-05-01 21:07:56');
INSERT INTO `paper` VALUES ('470', '2017-2018学年金山中学高二上英语期末', '3', '11', '1', 'paper/05012110337012646.docx', 'oqrj1908', '2020-05-01 21:10:33');
INSERT INTO `paper` VALUES ('471', '2017-2018学年松江二中高一上英语期末考试', '3', '10', '1', 'paper/05012113065787731.docx', 'oqrj1908', '2020-05-01 21:13:06');
INSERT INTO `paper` VALUES ('472', '2017-2018学年金山中学高二上英语期末', '3', '11', '1', 'paper/05012149575130473.docx', 'oqrj1908', '2020-05-01 21:49:57');
INSERT INTO `paper` VALUES ('473', '2017-2018学年松江二中高一上英语期末考试', '3', '10', '1', 'paper/05012150188279202.docx', 'oqrj1908', '2020-05-01 21:50:18');
INSERT INTO `paper` VALUES ('474', '近五年上海高考英语作文题目及范文', '3', '12', '1', 'paper/05012150408202079.docx', 'oqrj1908', '2020-05-01 21:50:40');
INSERT INTO `paper` VALUES ('475', '2018-2019学年北虹高级中学高二上英语期末', '3', '11', '1', 'paper/05012151051590782.docx', 'oqrj1908', '2020-05-01 21:51:05');
INSERT INTO `paper` VALUES ('476', '2018-2019学年曹杨二中高二上英语期末', '3', '11', '1', 'paper/05012152297732247.docx', 'oqrj1908', '2020-05-01 21:52:29');
INSERT INTO `paper` VALUES ('477', '2018-2019学年复旦附中高二1月单元复习题', '3', '11', '1', 'paper/05012152468500202.docx', 'oqrj1908', '2020-05-01 21:52:46');
INSERT INTO `paper` VALUES ('478', '2018-2019学年复旦附中高二上英语期末', '3', '11', '1', 'paper/05012153041738027.docx', 'oqrj1908', '2020-05-01 21:53:04');
INSERT INTO `paper` VALUES ('479', '2018-2019学年高三iread试卷7', '3', '12', '1', 'paper/05012153317101168.docx', 'oqrj1908', '2020-05-01 21:53:31');
INSERT INTO `paper` VALUES ('480', '2018-2019学年高三iread试卷8', '3', '12', '1', 'paper/05012154059228832.docx', 'oqrj1908', '2020-05-01 21:54:05');
INSERT INTO `paper` VALUES ('481', '2018-2019学年高三iread试卷9', '3', '12', '1', 'paper/05012154234837735.docx', 'oqrj1908', '2020-05-01 21:54:23');
INSERT INTO `paper` VALUES ('482', '2018-2019学年高三iread试卷10', '3', '12', '1', 'paper/05012154415781013.docx', 'oqrj1908', '2020-05-01 21:54:41');
INSERT INTO `paper` VALUES ('483', '2018-2019学年虹口区高一上英语期末', '3', '10', '1', 'paper/05012154598812418.docx', 'oqrj1908', '2020-05-01 21:54:59');
INSERT INTO `paper` VALUES ('484', '2018-2019学年嘉定区高二上英语期末', '3', '11', '1', 'paper/05012155199278911.docx', 'oqrj1908', '2020-05-01 21:55:19');
INSERT INTO `paper` VALUES ('485', '2018-2019学年交大附中高一上英语期末', '3', '10', '1', 'paper/05012155352306543.docx', 'oqrj1908', '2020-05-01 21:55:35');
INSERT INTO `paper` VALUES ('486', '2018-2019学年市北中学高二上期末', '3', '11', '1', 'paper/05012155508235333.docx', 'oqrj1908', '2020-05-01 21:55:50');
INSERT INTO `paper` VALUES ('487', '2018-2019学年市西中学高一上英语期末', '3', '10', '1', 'paper/05012156086284133.docx', 'oqrj1908', '2020-05-01 21:56:08');
INSERT INTO `paper` VALUES ('488', '2018-2019学年西南模范高三上英语周测', '3', '12', '1', 'paper/05012156288742919.docx', 'oqrj1908', '2020-05-01 21:56:28');
INSERT INTO `paper` VALUES ('489', '2018-2019学年徐汇区高二上英语期末', '3', '11', '1', 'paper/05012156475949290.docx', 'oqrj1908', '2020-05-01 21:56:47');
INSERT INTO `paper` VALUES ('490', '2019届高考一模听力16区完整版', '3', '12', '1', 'paper/05012157413111427.docx', 'oqrj1908', '2020-05-01 21:57:41');
INSERT INTO `paper` VALUES ('491', '2019届高三一模汇编---11选10（含答案）', '3', '12', '1', 'paper/05012158329136664.docx', 'oqrj1908', '2020-05-01 21:58:32');
INSERT INTO `paper` VALUES ('492', '2019届高三一模汇编---翻译（含答案）', '3', '12', '1', 'paper/05012201087387326.docx', 'oqrj1908', '2020-05-01 22:01:08');
INSERT INTO `paper` VALUES ('493', '2019届高三一模汇编---完型填空（含答案）', '3', '12', '1', 'paper/05012201271674846.docx', 'oqrj1908', '2020-05-01 22:01:27');
INSERT INTO `paper` VALUES ('494', '2019届高三一模汇编---语法填空（含答案）', '3', '12', '1', 'paper/05012201433350559.docx', 'oqrj1908', '2020-05-01 22:01:43');
INSERT INTO `paper` VALUES ('495', '词汇练习1（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012201584715588.docx', 'oqrj1908', '2020-05-01 22:01:58');
INSERT INTO `paper` VALUES ('496', '词汇练习2（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012202129362927.docx', 'oqrj1908', '2020-05-01 22:02:12');
INSERT INTO `paper` VALUES ('497', '词汇练习3（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012202256652607.docx', 'oqrj1908', '2020-05-01 22:02:25');
INSERT INTO `paper` VALUES ('498', '词汇练习4（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012202409693282.docx', 'oqrj1908', '2020-05-01 22:02:40');
INSERT INTO `paper` VALUES ('499', '词汇练习5（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012202545250895.docx', 'oqrj1908', '2020-05-01 22:02:54');
INSERT INTO `paper` VALUES ('500', '词汇练习6（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012203091755267.docx', 'oqrj1908', '2020-05-01 22:03:09');
INSERT INTO `paper` VALUES ('501', '词汇练习7（高中词汇延伸词--四级词汇）', '3', '12', '1', 'paper/05012203234652762.docx', 'oqrj1908', '2020-05-01 22:03:23');
INSERT INTO `paper` VALUES ('502', '高中常用词汇词性转换（A-F)（6页）', '3', '12', '1', 'paper/05012203396165231.docx', 'oqrj1908', '2020-05-01 22:03:39');
INSERT INTO `paper` VALUES ('503', '高中常用词汇词性转换（G-Z)（6页）', '3', '12', '1', 'paper/05012203559864129.docx', 'oqrj1908', '2020-05-01 22:03:55');
INSERT INTO `paper` VALUES ('504', '重点词汇--2019届宝山区高三英语一模', '3', '12', '1', 'paper/05012204132204927.docx', 'oqrj1908', '2020-05-01 22:04:13');
INSERT INTO `paper` VALUES ('505', '重点词汇--2019届崇明区高三英语一模', '3', '12', '1', 'paper/05012204377411672.docx', 'oqrj1908', '2020-05-01 22:04:37');
INSERT INTO `paper` VALUES ('506', '重点词汇--2019届奉贤区高三英语一模', '3', '12', '1', 'paper/05012205164604062.docx', 'oqrj1908', '2020-05-01 22:05:16');
INSERT INTO `paper` VALUES ('507', '重点词汇--2019届虹口区高三英语一模', '3', '12', '1', 'paper/05012205377765621.docx', 'oqrj1908', '2020-05-01 22:05:37');
INSERT INTO `paper` VALUES ('508', '重点词汇--2019届嘉定区高三英语一模', '3', '12', '1', 'paper/05012205517295902.docx', 'oqrj1908', '2020-05-01 22:05:51');
INSERT INTO `paper` VALUES ('509', '重点词汇--2019届金山区高三英语一模', '3', '12', '1', 'paper/05012206066989881.docx', 'oqrj1908', '2020-05-01 22:06:06');
INSERT INTO `paper` VALUES ('510', '重点词汇--2019届静安区高三英语一模', '3', '12', '1', 'paper/05012206222280633.docx', 'oqrj1908', '2020-05-01 22:06:22');
INSERT INTO `paper` VALUES ('511', '重点词汇--2019届闵行区高三英语一模', '3', '12', '1', 'paper/05012206388702936.docx', 'oqrj1908', '2020-05-01 22:06:38');
INSERT INTO `paper` VALUES ('512', '重点词汇--2019届浦东新区高三英语一模', '3', '12', '1', 'paper/05012206575077528.docx', 'oqrj1908', '2020-05-01 22:06:57');
INSERT INTO `paper` VALUES ('513', '重点词汇--2019届青浦区高三英语一模', '3', '12', '1', 'paper/05012207126351675.docx', 'oqrj1908', '2020-05-01 22:07:12');
INSERT INTO `paper` VALUES ('514', '重点词汇--2019届松江区高三英语一模', '3', '12', '1', 'paper/05012207287560202.docx', 'oqrj1908', '2020-05-01 22:07:28');
INSERT INTO `paper` VALUES ('515', '重点词汇--2019届徐汇区高三英语一模', '3', '12', '1', 'paper/05012207438257010.docx', 'oqrj1908', '2020-05-01 22:07:43');
INSERT INTO `paper` VALUES ('516', '重点词汇--2019届杨浦区高三英语一模', '3', '12', '1', 'paper/05012207598023838.docx', 'oqrj1908', '2020-05-01 22:07:59');
INSERT INTO `paper` VALUES ('517', '重点词汇--2019届长宁区高三英语一模', '3', '12', '1', 'paper/05012208139384008.docx', 'oqrj1908', '2020-05-01 22:08:13');
INSERT INTO `paper` VALUES ('518', '高中英语话题写作必备词汇分类总结（体育、购物、饮食、假日等）', '3', '12', '1', 'paper/05012210094379065.docx', 'oqrj1908', '2020-05-01 22:10:09');
INSERT INTO `paper` VALUES ('519', '2017-2018届建平中学高三下英语3月周练', '3', '12', '2', 'paper/05012210358808355.docx', 'oqrj1908', '2020-05-01 22:10:35');
INSERT INTO `paper` VALUES ('520', '2017-2018学年建平中学高三英语开学考', '3', '12', '2', 'paper/05012211468762496.docx', 'oqrj1908', '2020-05-01 22:11:46');
INSERT INTO `paper` VALUES ('521', '2017-2018学年控江中学高一下开学考', '3', '10', '2', 'paper/05012212079693506.docx', 'oqrj1908', '2020-05-01 22:12:07');
INSERT INTO `paper` VALUES ('522', '2017-2018学年闵行中学高一下英语三月考试', '3', '10', '2', 'paper/05012213338777777.docx', 'oqrj1908', '2020-05-01 22:13:33');
INSERT INTO `paper` VALUES ('523', '2017-2018学年南汇中学高二下英语月考', '3', '11', '2', 'paper/05012213512278732.docx', 'oqrj1908', '2020-05-01 22:13:51');
INSERT INTO `paper` VALUES ('524', '2017-2018学年南洋模范高三下三月考试', '3', '12', '2', 'paper/05012214085935315.docx', 'oqrj1908', '2020-05-01 22:14:08');
INSERT INTO `paper` VALUES ('525', '2017-2018学年浦东外国语高二下英语3月月考', '3', '11', '2', 'paper/05012214251212503.docx', 'oqrj1908', '2020-05-01 22:14:25');
INSERT INTO `paper` VALUES ('526', '2017-2018学年七宝中学高三下英语三月考试', '3', '12', '2', 'paper/05012214424965524.docx', 'oqrj1908', '2020-05-01 22:14:42');
INSERT INTO `paper` VALUES ('527', '2017-2018学年上海中学高三下英语3月周练', '3', '12', '2', 'paper/05012215006694668.docx', 'oqrj1908', '2020-05-01 22:15:00');
INSERT INTO `paper` VALUES ('528', '2017-2018学年上师大附中高三下英语三月月考', '3', '12', '2', 'paper/05012216203491792.docx', 'oqrj1908', '2020-05-01 22:16:20');
INSERT INTO `paper` VALUES ('529', '2017届七宝中学高三下高考冲刺周练卷', '3', '12', '2', 'paper/05012216438453457.doc', 'oqrj1908', '2020-05-01 22:16:43');
INSERT INTO `paper` VALUES ('530', '2018-2019曹杨二中高一下英语3月月考', '3', '10', '2', 'paper/05012217069090190.docx', 'oqrj1908', '2020-05-01 22:17:06');
INSERT INTO `paper` VALUES ('531', '2018-2019学年复旦附中高二下英语开学考', '3', '11', '2', 'paper/05012218037535783.docx', 'oqrj1908', '2020-05-01 22:18:03');
INSERT INTO `paper` VALUES ('532', '2018-2019学年复附高二下英语3月周练1', '3', '11', '2', 'paper/05012218251987926.docx', 'oqrj1908', '2020-05-01 22:18:25');
INSERT INTO `paper` VALUES ('533', '2018-2019学年高三iread试卷11', '3', '12', '2', 'paper/05012218432733090.docx', 'oqrj1908', '2020-05-01 22:18:43');
INSERT INTO `paper` VALUES ('534', '2018-2019学年高三iread试卷12', '3', '12', '2', 'paper/05012218588152555.docx', 'oqrj1908', '2020-05-01 22:18:58');
INSERT INTO `paper` VALUES ('535', '2018-2019学年格致中学高二下三月月考', '3', '11', '2', 'paper/05012219152715785.docx', 'oqrj1908', '2020-05-01 22:19:15');
INSERT INTO `paper` VALUES ('536', '2018-2019学年建平、控江中学高三下英语3月周考', '3', '12', '2', 'paper/05012219502839719.docx', 'oqrj1908', '2020-05-01 22:19:50');
INSERT INTO `paper` VALUES ('537', '2018-2019学年建平中学高三下英语开学考', '3', '12', '2', 'paper/05012220049219093.docx', 'oqrj1908', '2020-05-01 22:20:04');
INSERT INTO `paper` VALUES ('538', '2018-2019学年建平中学高三下英语周练', '3', '12', '2', 'paper/05012220263357218.docx', 'oqrj1908', '2020-05-01 22:20:26');
INSERT INTO `paper` VALUES ('540', '2018-2019学年交大附中高二下英语摸底考', '3', '11', '2', 'paper/05012220438683364.docx', 'oqrj1908', '2020-05-01 22:20:43');
INSERT INTO `paper` VALUES ('541', '2018-2019学年进才中学高三下英语3月月考', '3', '12', '2', 'paper/05012222306126110.docx', 'oqrj1908', '2020-05-01 22:22:30');
INSERT INTO `paper` VALUES ('542', '2018-2019学年进才中学高三下英语开学考', '3', '12', '2', 'paper/05012235144365798.docx', 'oqrj1908', '2020-05-01 22:35:14');
INSERT INTO `paper` VALUES ('543', '2018-2019学年进才中学高三英语三月周考', '3', '12', '2', 'paper/05012237466679265.docx', 'oqrj1908', '2020-05-01 22:37:46');
INSERT INTO `paper` VALUES ('544', '2018-2019学年晋元高级中学英语高二下3月月考', '3', '11', '2', 'paper/05012238099796650.docx', 'oqrj1908', '2020-05-01 22:38:09');
INSERT INTO `paper` VALUES ('545', '2018-2019学年卢湾高级中学高三下三月月考', '3', '12', '2', 'paper/05012238286779785.docx', 'oqrj1908', '2020-05-01 22:38:28');
INSERT INTO `paper` VALUES ('546', '2018-2019学年上师大附中高三下英语三月月考', '3', '12', '2', 'paper/05012238433730171.docx', 'oqrj1908', '2020-05-01 22:38:43');
INSERT INTO `paper` VALUES ('547', '2018-2019学年上外附中（闵行分校）高三下英语第一次月考', '3', '12', '2', 'paper/05012239018436729.docx', 'oqrj1908', '2020-05-01 22:39:01');
INSERT INTO `paper` VALUES ('548', '2018-2019学年上外附中高二下英语周练', '3', '11', '2', 'paper/05012239238874640.docx', 'oqrj1908', '2020-05-01 22:39:23');
INSERT INTO `paper` VALUES ('549', '2018-2019学年洋泾中学高二下英语3月月考', '3', '11', '2', 'paper/05012239575040994.docx', 'oqrj1908', '2020-05-01 22:39:57');
INSERT INTO `paper` VALUES ('550', '2018年IRead试卷作文范文12篇', '3', '12', '2', 'paper/05012240159802811.doc', 'oqrj1908', '2020-05-01 22:40:15');
INSERT INTO `paper` VALUES ('551', '2019届宝山区高考英语二模', '3', '12', '2', 'paper/05012240419228649.docx', 'oqrj1908', '2020-05-01 22:40:41');
INSERT INTO `paper` VALUES ('552', '2019届高考一模作文汇编', '3', '12', '2', 'paper/05012241009755265.docx', 'oqrj1908', '2020-05-01 22:41:00');
INSERT INTO `paper` VALUES ('553', '复旦附中高中汉译英练习100句', '3', '12', '2', 'paper/05012241363634320.docx', 'oqrj1908', '2020-05-01 22:41:36');
INSERT INTO `paper` VALUES ('554', '高考词汇3500词练习题A--C', '3', '12', '2', 'paper/05012241511260522.docx', 'oqrj1908', '2020-05-01 22:41:51');
INSERT INTO `paper` VALUES ('555', '高考词汇3500词练习题D--H', '3', '12', '2', 'paper/05012242069753918.docx', 'oqrj1908', '2020-05-01 22:42:06');
INSERT INTO `paper` VALUES ('556', '高考词汇3500词练习题I--O', '3', '12', '2', 'paper/05012242201919913.docx', 'oqrj1908', '2020-05-01 22:42:20');
INSERT INTO `paper` VALUES ('557', '高考词汇3500词练习题P-S', '3', '12', '2', 'paper/05012243478508474.docx', 'oqrj1908', '2020-05-01 22:43:47');
INSERT INTO `paper` VALUES ('558', '高考词汇3500词练习题T-Z', '3', '12', '2', 'paper/05012244014540516.docx', 'oqrj1908', '2020-05-01 22:44:01');
INSERT INTO `paper` VALUES ('559', '高考作文学生易犯错误和指导策略', '3', '12', '2', 'paper/05012244561647303.docx', 'oqrj1908', '2020-05-01 22:44:56');
INSERT INTO `paper` VALUES ('560', '高中英语话题写作必备词汇分类总结（网络、科技、语言、自然等）', '3', '12', '2', 'paper/05012245106025451.docx', 'oqrj1908', '2020-05-01 22:45:10');
INSERT INTO `paper` VALUES ('561', '高中英语试题短语练习集', '3', '12', '2', 'paper/05012245251883039.doc', 'oqrj1908', '2020-05-01 22:45:25');
INSERT INTO `paper` VALUES ('562', '高中英语长难句分析--技巧篇（附练习题）', '3', '12', '2', 'paper/05012245407035012.doc', 'oqrj1908', '2020-05-01 22:45:40');
INSERT INTO `paper` VALUES ('563', '高中英语长难句分析--模拟卷汇编1（多个从句综合）', '3', '12', '2', 'paper/05012245543085529.docx', 'oqrj1908', '2020-05-01 22:45:54');
INSERT INTO `paper` VALUES ('564', '高中英语长难句分析--长句分析1（附语法分析）', '3', '12', '2', 'paper/05012246353265334.docx', 'oqrj1908', '2020-05-01 22:46:35');
INSERT INTO `paper` VALUES ('565', '高中英语长难句分析--长句分析2（附语法分析）', '3', '12', '2', 'paper/05012246507377665.docx', 'oqrj1908', '2020-05-01 22:46:50');
INSERT INTO `paper` VALUES ('566', '上海高考翻译常见动词搭配', '3', '12', '2', 'paper/05012247144776642.docx', 'oqrj1908', '2020-05-01 22:47:14');
INSERT INTO `paper` VALUES ('567', '上海高考翻译常见名词搭配', '3', '12', '2', 'paper/05012247281214046.docx', 'oqrj1908', '2020-05-01 22:47:28');
INSERT INTO `paper` VALUES ('568', '上海高考翻译常见形容词搭配', '3', '12', '2', 'paper/05012247438743046.docx', 'oqrj1908', '2020-05-01 22:47:43');
INSERT INTO `paper` VALUES ('569', '上海高考作文指导写作练习12篇', '3', '12', '2', 'paper/05012248019384737.docx', 'oqrj1908', '2020-05-01 22:48:01');
INSERT INTO `paper` VALUES ('570', '2017-2018学年行知中学高二上英语12月月考', '3', '11', '1', 'paper/05012253488561854.docx', 'oqrj1908', '2020-05-01 22:53:48');
INSERT INTO `paper` VALUES ('571', '2017-2018学年静安区新中高级中学高三上英语12月考试', '3', '12', '1', 'paper/05012254127141053.docx', 'oqrj1908', '2020-05-01 22:54:12');
INSERT INTO `paper` VALUES ('572', '2017-2018学年浦东新区高二上英语期末', '3', '11', '1', 'paper/05012254328546117.docx', 'oqrj1908', '2020-05-01 22:54:32');
INSERT INTO `paper` VALUES ('573', '沪教版八年级上数学 一课一练及单元测试卷和参考答案', '2', '8', '1', 'paper/05012319487559575.doc', 'vkjt1908', '2020-05-01 23:19:48');
INSERT INTO `paper` VALUES ('576', '沪教版九年级（上）数学一课一练及单元测试卷和参考答案', '2', '9', '1', 'paper/05012322495705536.doc', 'vkjt1908', '2020-05-01 23:22:49');
INSERT INTO `paper` VALUES ('577', '沪教版九年级（下）数学一课一练及单元测试卷和参考答案', '2', '9', '2', 'paper/05012323188617058.doc', 'vkjt1908', '2020-05-01 23:23:18');
INSERT INTO `paper` VALUES ('578', '沪教版七年级（下）数学一课一练及单元测试卷和参考答案_20190823_1800', '2', '7', '2', 'paper/05012324144606566.doc', 'vkjt1908', '2020-05-01 23:24:14');
INSERT INTO `paper` VALUES ('579', '沪教版数学八年级下一课一练及单元测试卷和参考答案', '2', '8', '2', 'paper/05012325188980181.doc', 'vkjt1908', '2020-05-01 23:25:18');
INSERT INTO `paper` VALUES ('580', '沪教版数学六年级（上）一课一练及单元测试卷和参考答案', '2', '6', '1', 'paper/05012325589940191.doc', 'vkjt1908', '2020-05-01 23:25:58');
INSERT INTO `paper` VALUES ('581', '沪教版数学六年级（下）一课一练及单元测试卷和参考答案', '2', '6', '2', 'paper/05012326388345833.doc', 'vkjt1908', '2020-05-01 23:26:38');
INSERT INTO `paper` VALUES ('582', '沪教版数学七年级上一课一练及单元测试卷和参考答案', '2', '7', '1', 'paper/05012327361784382.doc', 'vkjt1908', '2020-05-01 23:27:36');
INSERT INTO `paper` VALUES ('583', '沪教版九年级（上）数学一课一练及单元测试卷和参考答案', '2', '9', '1', 'paper/05012331255941222.doc', 'vkjt1908', '2020-05-01 23:31:25');
INSERT INTO `paper` VALUES ('584', '2016-2017学年上海市普陀区进华初一第二学期英语月考试卷', '3', '7', '2', 'paper/05021140597517678.docx', 'neck1908', '2020-05-02 11:40:59');
INSERT INTO `paper` VALUES ('585', '2016年第一学期七年级英语期末考试试卷', '3', '7', '1', 'paper/05021141303857519.doc', 'neck1908', '2020-05-02 11:41:30');
INSERT INTO `paper` VALUES ('586', '2016年上海市浦东新区第四教育署七年级上学期期中质量抽测英语试题', '3', '7', '1', 'paper/05021141525070608.doc', 'neck1908', '2020-05-02 11:41:52');
INSERT INTO `paper` VALUES ('587', '2016学年第一学期初一年级英语考试', '3', '7', '1', 'paper/05021142118317806.docx', 'neck1908', '2020-05-02 11:42:11');
INSERT INTO `paper` VALUES ('588', '2016学年华育第一学期七年级英语期中考试试题', '3', '7', '1', 'paper/05021142318626548.docx', 'neck1908', '2020-05-02 11:42:31');
INSERT INTO `paper` VALUES ('589', '2016学年兰生复旦7A第一次月考', '3', '7', '1', 'paper/05021142481360842.docx', 'neck1908', '2020-05-02 11:42:48');
INSERT INTO `paper` VALUES ('590', '2016学年上海外国语大学附属浦东外国语学校第二学期初一SBS学科平行班 期中卷', '3', '7', '1', 'paper/05021143173652025.docx', 'neck1908', '2020-05-02 11:43:17');
INSERT INTO `paper` VALUES ('591', '2016学年文来中学七年级第二学期期中考试试卷', '3', '7', '2', 'paper/05021143372598618.docx', 'neck1908', '2020-05-02 11:43:37');
INSERT INTO `paper` VALUES ('592', '2017-2018名校7年级上学期期末试复习卷1', '3', '7', '1', 'paper/05021143574276962.docx', 'neck1908', '2020-05-02 11:43:57');
INSERT INTO `paper` VALUES ('593', '2017-2018名校7年级上学期期末试复习卷2', '3', '7', '1', 'paper/05021144167694373.docx', 'neck1908', '2020-05-02 11:44:16');
INSERT INTO `paper` VALUES ('594', '2017-2018名校7年级上学期期末试复习卷3', '3', '7', '1', 'paper/05021144346415624.doc', 'neck1908', '2020-05-02 11:44:34');
INSERT INTO `paper` VALUES ('595', '2017-2018上海市立达七年级11月练习卷', '3', '7', '2', 'paper/05021144577574819.doc', 'neck1908', '2020-05-02 11:44:57');
INSERT INTO `paper` VALUES ('596', '2017-2018上海市上外附中七上期中考试', '3', '7', '1', 'paper/05021145361619756.docx', 'neck1908', '2020-05-02 11:45:36');
INSERT INTO `paper` VALUES ('597', '2017-2018学年建平西校七下英语三月考试', '3', '7', '2', 'paper/05021145565774174.docx', 'neck1908', '2020-05-02 11:45:56');
INSERT INTO `paper` VALUES ('598', '2017-2018学年浦东新区初一第二学期期中英语试卷', '3', '7', '2', 'paper/05021146202064584.doc', 'neck1908', '2020-05-02 11:46:20');
INSERT INTO `paper` VALUES ('599', '2017-2018学年上海市交通大学第二附属中学七年级上英语周测试卷', '3', '7', '1', 'paper/05021146411660711.docx', 'neck1908', '2020-05-02 11:46:41');
INSERT INTO `paper` VALUES ('600', '2017-2018学年上海市立达中学初一U1L1练习', '3', '7', '1', 'paper/05021147027824440.docx', 'neck1908', '2020-05-02 11:47:02');
INSERT INTO `paper` VALUES ('601', '2017-2018学年上海中学东校七下英语三月月考', '3', '7', '2', 'paper/05021147231555718.docx', 'neck1908', '2020-05-02 11:47:23');
INSERT INTO `paper` VALUES ('602', '2017-2018学年西南模范七上英语期中考试', '3', '7', '1', 'paper/05021147421629673.docx', 'neck1908', '2020-05-02 11:47:42');
INSERT INTO `paper` VALUES ('603', '2017-2018学年西南模范七下英语三月考试', '3', '7', '2', 'paper/05021148032771972.docx', 'neck1908', '2020-05-02 11:48:03');
INSERT INTO `paper` VALUES ('604', '2017-2018学年西南位育7AU2-U3单元卷', '3', '7', '1', 'paper/05021148296348164.doc', 'neck1908', '2020-05-02 11:48:29');
INSERT INTO `paper` VALUES ('605', '2017-2018学年西南位育初一竞赛题汇总1', '3', '7', '1', 'paper/05021155348071592.docx', 'neck1908', '2020-05-02 11:55:34');
INSERT INTO `paper` VALUES ('606', '2017-2018学年西南位育初一竞赛题汇总2', '3', '7', '1', 'paper/05021155527445204.docx', 'neck1908', '2020-05-02 11:55:52');
INSERT INTO `paper` VALUES ('607', '2017华育初一第二学期期末模拟卷', '3', '7', '2', 'paper/05021156145456312.doc', 'neck1908', '2020-05-02 11:56:14');
INSERT INTO `paper` VALUES ('608', '2017年新华初初一7BU5单元测试卷', '3', '7', '2', 'paper/05021156328423838.doc', 'neck1908', '2020-05-02 11:56:32');
INSERT INTO `paper` VALUES ('609', '2017上海市华育七年级上期中考试试卷', '3', '7', '1', 'paper/05021156546784894.docx', 'neck1908', '2020-05-02 11:56:54');
INSERT INTO `paper` VALUES ('610', '2017世外7A Quiz 3', '3', '7', '1', 'paper/05021157135769951.docx', 'neck1908', '2020-05-02 11:57:13');
INSERT INTO `paper` VALUES ('611', '2017学年第二学期七年级期中考试试卷', '3', '7', '2', 'paper/05021157344075520.docx', 'neck1908', '2020-05-02 11:57:34');
INSERT INTO `paper` VALUES ('612', '2017学年第二学期七年级英语学科期中试卷', '3', '7', '2', 'paper/05021158221595031.docx', 'neck1908', '2020-05-02 11:58:22');
INSERT INTO `paper` VALUES ('613', '2017学年第一学期田林三中七年级英语学科期中试卷', '3', '7', '1', 'paper/05021158441411111.doc', 'neck1908', '2020-05-02 11:58:44');
INSERT INTO `paper` VALUES ('614', '2017学年东延安七年级期中试卷（含有答案解析）', '3', '7', '1', 'paper/05021159039044719.docx', 'neck1908', '2020-05-02 11:59:03');
INSERT INTO `paper` VALUES ('615', '2017学年上中东七年级上学期期中试卷', '3', '7', '1', 'paper/05021159242320223.docx', 'neck1908', '2020-05-02 11:59:24');
INSERT INTO `paper` VALUES ('616', '2017学年市三女中第二学期七年级期中考试（含有解析）', '3', '7', '2', 'paper/05021159469845870.docx', 'neck1908', '2020-05-02 11:59:46');
INSERT INTO `paper` VALUES ('617', '2017学年西南模范英语七年级下五月月考试卷 (2)', '3', '7', '2', 'paper/05021200051821351.docx', 'neck1908', '2020-05-02 12:00:05');
INSERT INTO `paper` VALUES ('618', '2017学年西南模范英语七年级下五月月考试卷', '3', '7', '2', 'paper/05021200271750536.docx', 'neck1908', '2020-05-02 12:00:27');
INSERT INTO `paper` VALUES ('619', '2017学年仙霞中学初一期中试卷', '3', '7', '2', 'paper/05021200454953963.docx', 'neck1908', '2020-05-02 12:00:45');
INSERT INTO `paper` VALUES ('620', '2017学年新复兴7B期中附加卷', '3', '7', '2', 'paper/05021201047292936.doc', 'neck1908', '2020-05-02 12:01:04');
INSERT INTO `paper` VALUES ('621', '2017学年新华初7BU8-U9单元测试卷', '3', '7', '2', 'paper/05021201251504932.docx', 'neck1908', '2020-05-02 12:01:25');
INSERT INTO `paper` VALUES ('622', '2017学年毓秀中学第二学期七年级第二次5月份月考英语试卷', '3', '7', '2', 'paper/05021202581218731.docx', 'neck1908', '2020-05-02 12:02:58');
INSERT INTO `paper` VALUES ('623', '2017学年长宁中学七年级期中考试试卷', '3', '7', '2', 'paper/05021203211034615.doc', 'neck1908', '2020-05-02 12:03:21');
INSERT INTO `paper` VALUES ('624', '2017学年中远实验第二学期七年级英语学科期中试卷', '3', '7', '2', 'paper/05021203554120316.docx', 'neck1908', '2020-05-02 12:03:55');
INSERT INTO `paper` VALUES ('625', '2018-2019十九中初一上英语期中试卷', '3', '7', '1', 'paper/05021204169198583.docx', 'neck1908', '2020-05-02 12:04:16');
INSERT INTO `paper` VALUES ('626', '2018-2019新学年大同中学七年级英语第一学期开学考', '3', '7', '1', 'paper/05021204402429312.docx', 'neck1908', '2020-05-02 12:04:40');
INSERT INTO `paper` VALUES ('627', '2018-2019学年第一学期莘光中学七年级月考卷', '3', '7', '1', 'paper/05021205012713846.docx', 'neck1908', '2020-05-02 12:05:01');
INSERT INTO `paper` VALUES ('628', '2018-2019学年复兴七年级单元测试U2', '3', '7', '1', 'paper/05021205216674404.docx', 'neck1908', '2020-05-02 12:05:21');
INSERT INTO `paper` VALUES ('629', '2018-2019学年晋元附校七年级月考试卷', '3', '7', '1', 'paper/05021207208730804.doc', 'neck1908', '2020-05-02 12:07:20');
INSERT INTO `paper` VALUES ('630', '2018-2019学年立达中学七上英语10月月考试', '3', '7', '1', 'paper/05021207424931407.docx', 'neck1908', '2020-05-02 12:07:42');
INSERT INTO `paper` VALUES ('631', '2018-2019学年上宝中学七上单元测试U1-2', '3', '7', '1', 'paper/05021208013512146.docx', 'neck1908', '2020-05-02 12:08:01');
INSERT INTO `paper` VALUES ('632', '2018-2019学年上海市立达初一上英语U1L1试题', '3', '7', '1', 'paper/05021208179589475.docx', 'neck1908', '2020-05-02 12:08:17');
INSERT INTO `paper` VALUES ('633', '2018-2019学年上海市闵行区文来中学初一上学期周测英语试卷', '3', '7', '1', 'paper/05021208366686145.doc', 'neck1908', '2020-05-02 12:08:36');
INSERT INTO `paper` VALUES ('634', '2018-2019学年上海市浦东新区五三中学七年级下学期英语月考试卷', '3', '7', '2', 'paper/05021208564324129.doc', 'neck1908', '2020-05-02 12:08:56');
INSERT INTO `paper` VALUES ('635', '2018-2019学年天山中学初一第一学期10月份第四次阶段测试卷', '3', '7', '1', 'paper/05021209175577385.docx', 'neck1908', '2020-05-02 12:09:17');
INSERT INTO `paper` VALUES ('636', '2018-2019学年新华初级七上英语单元测试', '3', '7', '1', 'paper/05021211192062286.docx', 'neck1908', '2020-05-02 12:11:19');
INSERT INTO `paper` VALUES ('637', '2018-2019学年新竹园7A U7单元卷', '3', '7', '1', 'paper/05021211362916125.docx', 'neck1908', '2020-05-02 12:11:36');
INSERT INTO `paper` VALUES ('638', '2018-2019学年徐教院附中七上英语期中试卷', '3', '7', '1', 'paper/05021211551158632.docx', 'neck1908', '2020-05-02 12:11:55');
INSERT INTO `paper` VALUES ('639', '2018年桃李园七年级9月第一学期英语试卷', '3', '7', '1', 'paper/05021216512896683.docx', 'neck1908', '2020-05-02 12:16:52');
INSERT INTO `paper` VALUES ('640', '2018新华初7B期末复习二', '3', '7', '2', 'paper/05021219099859156.docx', 'neck1908', '2020-05-02 12:19:09');
INSERT INTO `paper` VALUES ('641', '2018新华初7B期末复习一', '3', '7', '2', 'paper/05021219274359066.docx', 'neck1908', '2020-05-02 12:19:27');
INSERT INTO `paper` VALUES ('642', '2018学年大同初级中学七年级第一学期英语阶段性检测', '3', '7', '1', 'paper/05021220173574465.docx', 'neck1908', '2020-05-02 12:20:17');
INSERT INTO `paper` VALUES ('643', '2018学年普陀区进华中学初一上学期unit3-4', '3', '7', '1', 'paper/05021220343088577.docx', 'neck1908', '2020-05-02 12:20:34');
INSERT INTO `paper` VALUES ('644', '2018学年七年级英语上学期期中模拟卷', '3', '7', '1', 'paper/05021220575718766.doc', 'neck1908', '2020-05-02 12:20:57');
INSERT INTO `paper` VALUES ('645', '2018学年上海市黄浦区大同中学初一10月月考卷', '3', '7', '1', 'paper/05021221147149475.docx', 'neck1908', '2020-05-02 12:21:14');
INSERT INTO `paper` VALUES ('646', '2018学年上海市浦东区第四教育署七年级上学期英语第一次月考', '3', '7', '1', 'paper/05021221333587525.docx', 'neck1908', '2020-05-02 12:21:33');
INSERT INTO `paper` VALUES ('647', '2018学年上海中学东校7BU1单元测试卷', '3', '7', '2', 'paper/05021221589405974.docx', 'neck1908', '2020-05-02 12:21:58');
INSERT INTO `paper` VALUES ('648', '2018学杨实验初一年级第一学期阶段考试试卷', '3', '7', '1', 'paper/05021222202257997.docx', 'neck1908', '2020-05-02 12:22:20');
INSERT INTO `paper` VALUES ('649', '2018张江7A周末阅读', '3', '7', '1', 'paper/05021222394314046.docx', 'neck1908', '2020-05-02 12:22:39');
INSERT INTO `paper` VALUES ('650', '存志中学2017学年第一学期初一年级开学测试', '3', '7', '1', 'paper/05021222578877706.doc', 'neck1908', '2020-05-02 12:22:57');
INSERT INTO `paper` VALUES ('651', '大同2016年初一第一学期开学考试卷.', '3', '7', '1', 'paper/05021223135872877.docx', 'neck1908', '2020-05-02 12:23:13');
INSERT INTO `paper` VALUES ('652', '奉贤区第一学期新初一英语开学摸底测验卷', '3', '7', '1', 'paper/05021223324310901.doc', 'neck1908', '2020-05-02 12:23:32');
INSERT INTO `paper` VALUES ('653', '格致七年级下2016学年期中考试试卷', '3', '7', '2', 'paper/05021223513511021.doc', 'neck1908', '2020-05-02 12:23:51');
INSERT INTO `paper` VALUES ('654', '华师二附初中2017学年第二学期七年级期末质量检测英语学科加试试卷', '3', '7', '2', 'paper/05021224104135472.docx', 'neck1908', '2020-05-02 12:24:10');
INSERT INTO `paper` VALUES ('655', '华育中学七年级上单元测试卷Unit 1(7A)', '3', '7', '1', 'paper/05021224328044347.docx', 'neck1908', '2020-05-02 12:24:32');
INSERT INTO `paper` VALUES ('656', '建平西校2017学年第二学期初一英语周练3', '3', '7', '2', 'paper/05021224544334033.docx', 'neck1908', '2020-05-02 12:24:54');
INSERT INTO `paper` VALUES ('657', '兰生复旦2018年第二学期初一月考试卷', '3', '7', '2', 'paper/05021225176851063.docx', 'neck1908', '2020-05-02 12:25:17');
INSERT INTO `paper` VALUES ('658', '兰生复旦初一上周练卷', '3', '7', '1', 'paper/05021225354325308.doc', 'neck1908', '2020-05-02 12:25:35');
INSERT INTO `paper` VALUES ('659', '兰生复旦中学2016年度第一学期第一阶段考', '3', '7', '1', 'paper/05021226016382445.docx', 'neck1908', '2020-05-02 12:26:01');
INSERT INTO `paper` VALUES ('660', '兰生复旦中学2016学年度第一学期期中考试 (2)', '3', '7', '1', 'paper/05021226227598105.docx', 'neck1908', '2020-05-02 12:26:22');
INSERT INTO `paper` VALUES ('661', '兰生复旦中学2016学年度第一学期期中考试', '3', '7', '1', 'paper/05021226442585790.docx', 'neck1908', '2020-05-02 12:26:44');
INSERT INTO `paper` VALUES ('662', '兰生复旦中学2017学年度第一学期期中测试', '3', '7', '1', 'paper/05021227091184629.docx', 'neck1908', '2020-05-02 12:27:09');
INSERT INTO `paper` VALUES ('663', '兰生复旦中学七年级(下)英语第一阶段测试', '3', '7', '2', 'paper/05021227491584896.docx', 'neck1908', '2020-05-02 12:27:49');
INSERT INTO `paper` VALUES ('664', '立达过关卷七年级下U2L1', '3', '7', '2', 'paper/05021228069135415.docx', 'neck1908', '2020-05-02 12:28:06');
INSERT INTO `paper` VALUES ('665', '立达中学七年级第一学期开学考英语试卷', '3', '7', '1', 'paper/05021228278320682.docx', 'neck1908', '2020-05-02 12:28:27');
INSERT INTO `paper` VALUES ('666', '民办新复兴中学7AU1', '3', '7', '1', 'paper/05021228449975815.docx', 'neck1908', '2020-05-02 12:28:44');
INSERT INTO `paper` VALUES ('667', '民办新竹园2018学年第一学期英语学科七年级周拓', '3', '7', '1', 'paper/05021229114922778.docx', 'neck1908', '2020-05-02 12:29:11');
INSERT INTO `paper` VALUES ('668', '明珠中学2015学年第二学期期中考试试卷七年级英语T版（手敲精析版）.docx', '3', '7', '2', 'paper/05021229327412177.docx', 'neck1908', '2020-05-02 12:29:32');
INSERT INTO `paper` VALUES ('669', '明珠中学2016学年第二学期期中考试七年级英语试卷', '3', '7', '2', 'paper/05021229506067898.docx', 'neck1908', '2020-05-02 12:29:50');
INSERT INTO `paper` VALUES ('670', '明珠中学第二学期期中考试七年级英语试卷', '3', '7', '2', 'paper/05021230073158419.docx', 'neck1908', '2020-05-02 12:30:07');
INSERT INTO `paper` VALUES ('671', '南翔七年级2018-2019学年第一次月考试卷', '3', '7', '1', 'paper/05021230278797199.docx', 'neck1908', '2020-05-02 12:30:27');
INSERT INTO `paper` VALUES ('672', '培佳双语学校第二学期第一次质量监控', '3', '7', '2', 'paper/05021230472948353.docx', 'neck1908', '2020-05-02 12:30:47');
INSERT INTO `paper` VALUES ('673', '浦东外国语学校7B月考卷', '3', '7', '2', 'paper/05021231087036051.doc', 'neck1908', '2020-05-02 12:31:08');
INSERT INTO `paper` VALUES ('674', '普陀区重点中学进华中学初一10月月考试卷', '3', '7', '1', 'paper/05021231304302369.docx', 'neck1908', '2020-05-02 12:31:30');
INSERT INTO `paper` VALUES ('675', '七一中学初一五月考卷试题', '3', '7', '1', 'paper/05021232012210800.doc', 'neck1908', '2020-05-02 12:32:01');
INSERT INTO `paper` VALUES ('676', '上宝中学 七年级（上） 开学摸底考试', '3', '7', '1', 'paper/05021232206863158.docx', 'neck1908', '2020-05-02 12:32:20');
INSERT INTO `paper` VALUES ('677', '上宝中学2016学年第一学期初三英语摸底考试卷', '3', '9', '1', 'paper/05021232472752385.docx', 'neck1908', '2020-05-02 12:32:47');
INSERT INTO `paper` VALUES ('678', '上宝中学2017年第一学期初一英语测试卷U2', '3', '7', '1', 'paper/05021233084554451.doc', 'neck1908', '2020-05-02 12:33:08');
INSERT INTO `paper` VALUES ('679', '上宝中学初一（上）U1语法测试卷', '3', '7', '1', 'paper/05021233288261172.docx', 'neck1908', '2020-05-02 12:33:28');
INSERT INTO `paper` VALUES ('680', '上宝中学第一学期初一英语测试卷（U7）', '3', '7', '1', 'paper/05021235435620155.doc', 'neck1908', '2020-05-02 12:35:43');
INSERT INTO `paper` VALUES ('681', '上宝中学七年级第一学期期末考试初一英语试卷', '3', '7', '1', 'paper/05021236094126080.docx', 'neck1908', '2020-05-02 12:36:09');
INSERT INTO `paper` VALUES ('682', '上海大学附属学校2018学年第一学期阶段性测试卷', '3', '7', '1', 'paper/05021236481864920.docx', 'neck1908', '2020-05-02 12:36:48');
INSERT INTO `paper` VALUES ('683', '上海民办新竹园中学2017学年第一学期英语学科七年级阶段性诊断二试卷.docx', '3', '7', '1', 'paper/05021237092751226.docx', 'neck1908', '2020-05-02 12:37:09');
INSERT INTO `paper` VALUES ('684', '上海民办新竹园中学2017学年第一学期英语学科七年级期末考试卷', '3', '7', '1', 'paper/05021237327481955.docx', 'neck1908', '2020-05-02 12:37:32');
INSERT INTO `paper` VALUES ('685', '上海牛津版英语新教材全练七年级下 第八单元综合测评', '3', '7', '2', 'paper/05021237547970481.docx', 'neck1908', '2020-05-02 12:37:54');
INSERT INTO `paper` VALUES ('686', '上海牛津版英语新教材全练七年级下 第九单元', '3', '7', '2', 'paper/05021238136257057.docx', 'neck1908', '2020-05-02 12:38:13');
INSERT INTO `paper` VALUES ('687', '上海牛津版英语新教材全练七年级下 第六单元', '3', '7', '2', 'paper/05021238297810363.docx', 'neck1908', '2020-05-02 12:38:29');
INSERT INTO `paper` VALUES ('688', '上海牛津版英语新教材全练七年级下 第六单元综合测评', '3', '7', '2', 'paper/05021238478032072.docx', 'neck1908', '2020-05-02 12:38:47');
INSERT INTO `paper` VALUES ('689', '上海牛津版英语新教材全练七年级下 第七单元', '3', '7', '2', 'paper/05021239098548139.docx', 'neck1908', '2020-05-02 12:39:09');
INSERT INTO `paper` VALUES ('690', '上海牛津版英语新教材全练七年级下 模块二测评', '3', '7', '2', 'paper/05021239298880422.docx', 'neck1908', '2020-05-02 12:39:29');
INSERT INTO `paper` VALUES ('691', '上海牛津版英语新教材全练七年级下 期中综合测评', '3', '7', '2', 'paper/05021239474169338.docx', 'neck1908', '2020-05-02 12:39:47');
INSERT INTO `paper` VALUES ('692', '上海市奉贤区阳光外国语学校2011学年第二学期七年级英语3月阶段测试卷', '3', '7', '2', 'paper/05021240081112537.docx', 'neck1908', '2020-05-02 12:40:08');
INSERT INTO `paper` VALUES ('693', '上海市华师大附中七年级9月开学摸底考', '3', '7', '1', 'paper/05021240293892197.docx', 'neck1908', '2020-05-02 12:40:29');
INSERT INTO `paper` VALUES ('694', '上海市建平西校初一第二学期3月月考卷', '3', '7', '2', 'paper/05021240491207286.docx', 'neck1908', '2020-05-02 12:40:49');
INSERT INTO `paper` VALUES ('695', '上海市民办华育中学2017学年第一学期初一英语摸底考试', '3', '7', '1', 'paper/05021241137611503.doc', 'neck1908', '2020-05-02 12:41:13');
INSERT INTO `paper` VALUES ('696', '上海市民办华育中学七年级上英语试卷', '3', '7', '1', 'paper/05021241323835014.doc', 'neck1908', '2020-05-02 12:41:32');
INSERT INTO `paper` VALUES ('697', '上海市民办新华初级七年级上第一单元测试', '3', '7', '1', 'paper/05021241506756047.doc', 'neck1908', '2020-05-02 12:41:50');
INSERT INTO `paper` VALUES ('698', '上海市民办张江集团学校七年级第二学期初一英语月考试卷', '3', '7', '2', 'paper/05021242113493947.docx', 'neck1908', '2020-05-02 12:42:11');
INSERT INTO `paper` VALUES ('699', '上海市牛津版英语七年级上入学测试卷', '3', '7', '1', 'paper/05021242331262701.doc', 'neck1908', '2020-05-02 12:42:33');
INSERT INTO `paper` VALUES ('700', '上海市延安初级中学2017学年第一学期初一年级英语学科期末试卷-教师版.do', '3', '7', '1', 'paper/05021243005783389.doc', 'neck1908', '2020-05-02 12:43:00');
INSERT INTO `paper` VALUES ('701', '上海市延安初级中学2017学年第一学期初一年级英语学科期末试卷-学生版.do', '3', '7', '1', 'paper/05021243229568462.doc', 'neck1908', '2020-05-02 12:43:22');
INSERT INTO `paper` VALUES ('702', '上外初一2016下期末复习卷', '3', '7', '2', 'paper/05021243418654193.docx', 'neck1908', '2020-05-02 12:43:41');
INSERT INTO `paper` VALUES ('703', '上外附中2016年第一学期初一年级英语期中考试', '3', '7', '1', 'paper/05021244044291817.doc', 'neck1908', '2020-05-02 12:44:04');
INSERT INTO `paper` VALUES ('704', '尚德2017-2018学年初一年级第二学期3月试卷', '3', '7', '2', 'paper/05021244284260966.docx', 'neck1908', '2020-05-02 12:44:28');
INSERT INTO `paper` VALUES ('705', '世外七年级第一学期期中英语测试卷', '3', '7', '1', 'paper/05021244514162375.docx', 'neck1908', '2020-05-02 12:44:51');
INSERT INTO `paper` VALUES ('706', '市北初级中学2017年第一学期七年级期中练习卷', '3', '7', '1', 'paper/05021245137599038.docx', 'neck1908', '2020-05-02 12:45:13');
INSERT INTO `paper` VALUES ('707', '同济大学附属七一中学七年级英语学科试卷', '3', '7', '1', 'paper/05021245325405304.doc', 'neck1908', '2020-05-02 12:45:32');
INSERT INTO `paper` VALUES ('708', '位育七年级（上）英语期末复习卷', '3', '7', '1', 'paper/05021245528195187.docx', 'neck1908', '2020-05-02 12:45:52');
INSERT INTO `paper` VALUES ('709', '位育七年级（上）英语期末复习卷-教师版', '3', '7', '1', 'paper/05021246127933729.docx', 'neck1908', '2020-05-02 12:46:12');
INSERT INTO `paper` VALUES ('710', '位育中学2016学年第二学期初一年级英语期中考试试卷(含答案)', '3', '7', '2', 'paper/05021246345139730.docx', 'neck1908', '2020-05-02 12:46:34');
INSERT INTO `paper` VALUES ('711', '位育中学初一下英语第二学期周测卷', '3', '7', '2', 'paper/05021246523829694.docx', 'neck1908', '2020-05-02 12:46:52');
INSERT INTO `paper` VALUES ('712', '文来中学2017学年第一学期七年级英语学科阶段测试试卷', '3', '7', '1', 'paper/05021247141443782.docx', 'neck1908', '2020-05-02 12:47:14');
INSERT INTO `paper` VALUES ('713', '文来中学七年级unit1-5复习题', '3', '7', '1', 'paper/05021247363482842.docx', 'neck1908', '2020-05-02 12:47:36');
INSERT INTO `paper` VALUES ('714', '文来中学七年级期中考前摸底考', '3', '7', '2', 'paper/05021247579017367.docx', 'neck1908', '2020-05-02 12:47:57');
INSERT INTO `paper` VALUES ('715', '文绮中学2018学年七年级第一学期英语期中考试', '3', '7', '1', 'paper/05021248196472760.docx', 'neck1908', '2020-05-02 12:48:19');
INSERT INTO `paper` VALUES ('716', '西南模7A期末复习二', '3', '7', '1', 'paper/05021248357163516.doc', 'neck1908', '2020-05-02 12:48:35');
INSERT INTO `paper` VALUES ('717', '西南模7A期末复习三', '3', '7', '1', 'paper/05021248536262748.doc', 'neck1908', '2020-05-02 12:48:53');
INSERT INTO `paper` VALUES ('718', '西南模7A期末复习一', '3', '7', '1', 'paper/05021249128022275.doc', 'neck1908', '2020-05-02 12:49:12');
INSERT INTO `paper` VALUES ('719', '西南模范7A期末试卷', '3', '7', '1', 'paper/05021442221998671.docx', 'neck1908', '2020-05-02 14:42:22');
INSERT INTO `paper` VALUES ('720', '西南模范2017学年第二学期初一期中考试试卷', '3', '7', '1', 'paper/05021442524984849.docx', 'neck1908', '2020-05-02 14:42:52');
INSERT INTO `paper` VALUES ('721', '西南模范中学第二学期英语单元测试卷Unit2', '3', '7', '2', 'paper/05021443119147639.doc', 'neck1908', '2020-05-02 14:43:11');
INSERT INTO `paper` VALUES ('722', '西南模范中学七年级第二学期阶段测试卷', '3', '7', '2', 'paper/05021443338647195.doc', 'neck1908', '2020-05-02 14:43:33');
INSERT INTO `paper` VALUES ('723', '西南位育7B 第一单元测试卷', '3', '7', '2', 'paper/05021444327787818.docx', 'neck1908', '2020-05-02 14:44:32');
INSERT INTO `paper` VALUES ('724', '西南位育初一下学期综合练习6', '3', '7', '2', 'paper/05021444546859908.docx', 'neck1908', '2020-05-02 14:44:54');
INSERT INTO `paper` VALUES ('725', '新华初 初一英语第一学期 开学摸底考试', '3', '7', '1', 'paper/05021451074493808.doc', 'neck1908', '2020-05-02 14:51:07');
INSERT INTO `paper` VALUES ('726', '新华初7AU5单元测试卷及解析', '3', '7', '1', 'paper/05021451262364411.doc', 'neck1908', '2020-05-02 14:51:26');
INSERT INTO `paper` VALUES ('727', '新华初级初一第二学期期终复习卷word版', '3', '7', '2', 'paper/05021451443067182.doc', 'neck1908', '2020-05-02 14:51:44');
INSERT INTO `paper` VALUES ('728', '新竹园中学2017年第一学期七年级期中考试-T', '3', '7', '1', 'paper/05021452067176975.doc', 'neck1908', '2020-05-02 14:52:06');
INSERT INTO `paper` VALUES ('729', '张江集团学校2016学年第二学期初一英语期末复习卷二', '3', '7', '2', 'paper/05021452266755993.docx', 'neck1908', '2020-05-02 14:52:26');
INSERT INTO `paper` VALUES ('730', '张江集团学校2016学年第二学期初一英语期末复习卷一', '3', '7', '2', 'paper/05021452452251371.docx', 'neck1908', '2020-05-02 14:52:45');
INSERT INTO `paper` VALUES ('731', '张江集团学校2016学年第一学期初一英语摸底试卷', '3', '7', '2', 'paper/05021453031222600.docx', 'neck1908', '2020-05-02 14:53:03');
INSERT INTO `paper` VALUES ('732', '张江集团学校第一学期初一英语单测四（U6-U8', '3', '7', '2', 'paper/05021453221914630.doc', 'neck1908', '2020-05-02 14:53:22');
INSERT INTO `paper` VALUES ('733', '2016-2017学年文绮中学八年级第二学期期中考试（含答案）', '3', '8', '2', 'paper/05021456257667102.docx', 'neck1908', '2020-05-02 14:56:25');
INSERT INTO `paper` VALUES ('734', '2016年文来中学第二学期八年级英语学科期中考试试卷', '3', '8', '2', 'paper/05021456477824110.docx', 'neck1908', '2020-05-02 14:56:47');
INSERT INTO `paper` VALUES ('735', '2016上海市上宝中学初二英语第一学期期中复习', '3', '8', '1', 'paper/05021457073122820.doc', 'neck1908', '2020-05-02 14:57:07');
INSERT INTO `paper` VALUES ('736', '2016学年西南模范八年级下学期期中调研试卷', '3', '8', '2', 'paper/05021457298613827.docx', 'neck1908', '2020-05-02 14:57:29');
INSERT INTO `paper` VALUES ('737', '2016学年延安初二期中测试卷', '3', '8', '2', 'paper/05021457492198651.doc', 'neck1908', '2020-05-02 14:57:49');
INSERT INTO `paper` VALUES ('738', '2017-18 学年第二学期 进华 八年级 期末考试 英语', '3', '8', '2', 'paper/05021458094228819.docx', 'neck1908', '2020-05-02 14:58:09');
INSERT INTO `paper` VALUES ('739', '2017-2018华二附中英语八上期末冲刺卷', '3', '8', '1', 'paper/05021458361429588.doc', 'neck1908', '2020-05-02 14:58:36');
INSERT INTO `paper` VALUES ('740', '2017-2018名校8年级上学期期末试复习卷1', '3', '8', '1', 'paper/05021458551482121.doc', 'neck1908', '2020-05-02 14:58:55');
INSERT INTO `paper` VALUES ('741', '2017-2018名校8年级上学期期末试复习卷2', '3', '8', '1', 'paper/05021459141927796.docx', 'neck1908', '2020-05-02 14:59:14');
INSERT INTO `paper` VALUES ('742', '2017-2018名校8年级上学期期末试复习卷3', '3', '8', '1', 'paper/05021459291479334.docx', 'neck1908', '2020-05-02 14:59:29');
INSERT INTO `paper` VALUES ('743', '2017-2018上海市西南模范八年级第一学期期中考试卷', '3', '8', '1', 'paper/05021459439069115.docx', 'neck1908', '2020-05-02 14:59:43');
INSERT INTO `paper` VALUES ('744', '2017-2018学年初二第二学期期中考试卷', '3', '8', '2', 'paper/05021459573793134.docx', 'neck1908', '2020-05-02 14:59:57');
INSERT INTO `paper` VALUES ('745', '2017-2018学年南洋模范八下英语三月月考', '3', '8', '2', 'paper/05021500158549796.docx', 'neck1908', '2020-05-02 15:00:15');
INSERT INTO `paper` VALUES ('746', '2017-2018学年浦东新区初二第二学期期中英语试卷', '3', '8', '2', 'paper/05021500319468124.docx', 'neck1908', '2020-05-02 15:00:31');
INSERT INTO `paper` VALUES ('747', '2017-2018学年上外初二下3月月考试卷', '3', '8', '2', 'paper/05021500463822109.docx', 'neck1908', '2020-05-02 15:00:46');
INSERT INTO `paper` VALUES ('748', '2017-2018延安八年级第一学期期末试复习卷', '3', '8', '1', 'paper/05021501022510653.doc', 'neck1908', '2020-05-02 15:01:02');
INSERT INTO `paper` VALUES ('749', '2017进才实验初二期中综合模拟测试卷B卷', '3', '8', '2', 'paper/05021501173225020.docx', 'neck1908', '2020-05-02 15:01:17');
INSERT INTO `paper` VALUES ('750', '2017年 上外初二下期中试卷', '3', '8', '2', 'paper/05021501349578042.docx', 'neck1908', '2020-05-02 15:01:34');
INSERT INTO `paper` VALUES ('751', '2017年八年级上学期第一次英语月考卷', '3', '8', '1', 'paper/05021501488572498.docx', 'neck1908', '2020-05-02 15:01:48');
INSERT INTO `paper` VALUES ('752', '2017年八年级英语第二次月考卷', '3', '8', '2', 'paper/05021502039440756.doc', 'neck1908', '2020-05-02 15:02:03');
INSERT INTO `paper` VALUES ('753', '2017年第二学期初二年级英语期中考试试卷（位育初二）', '3', '8', '2', 'paper/05021502215664156.docx', 'neck1908', '2020-05-02 15:02:21');
INSERT INTO `paper` VALUES ('754', '2017年上宝8A期末试卷', '3', '8', '1', 'paper/05021502346610639.docx', 'neck1908', '2020-05-02 15:02:34');
INSERT INTO `paper` VALUES ('755', '2017年松江区八年级9月考卷', '3', '8', '1', 'paper/05021502521182254.docx', 'neck1908', '2020-05-02 15:02:52');
INSERT INTO `paper` VALUES ('756', '2017年致远中学八年级英语第二阶段测试卷', '3', '8', '2', 'paper/05021503086123384.docx', 'neck1908', '2020-05-02 15:03:08');
INSERT INTO `paper` VALUES ('757', '2017上海民办新竹园初二周末拓展卷三', '3', '8', '1', 'paper/05021503442107065.doc', 'neck1908', '2020-05-02 15:03:44');
INSERT INTO `paper` VALUES ('758', '2017上海市格致中学八年级上学期期末考试英语试题', '3', '8', '1', 'paper/05021504098477873.doc', 'neck1908', '2020-05-02 15:04:09');
INSERT INTO `paper` VALUES ('759', '2017西南位育初二10月考易错题试卷', '3', '8', '1', 'paper/05021504269198180.docx', 'neck1908', '2020-05-02 15:04:26');
INSERT INTO `paper` VALUES ('760', '2017学年 世外英语8A期末考试卷', '3', '8', '1', 'paper/05021504431493073.docx', 'neck1908', '2020-05-02 15:04:43');
INSERT INTO `paper` VALUES ('761', '2017学年第二学期八年级期中考试听力原文答案', '3', '8', '2', 'paper/05021505019063419.doc', 'neck1908', '2020-05-02 15:05:01');
INSERT INTO `paper` VALUES ('762', '2017学年第二学期八年级期中考试英语答题纸', '3', '8', '2', 'paper/05021505179200900.doc', 'neck1908', '2020-05-02 15:05:17');
INSERT INTO `paper` VALUES ('763', '2017学年第二学期八年级期中考试英语试卷', '3', '8', '2', 'paper/05021505327096932.doc', 'neck1908', '2020-05-02 15:05:32');
INSERT INTO `paper` VALUES ('764', '2017学年第一学期长宁区初二英语期终质量检测试卷-详解答案版', '3', '8', '1', 'paper/05021505483224133.docx', 'neck1908', '2020-05-02 15:05:48');
INSERT INTO `paper` VALUES ('765', '2017学年东延安8AU3.U4.U5词汇卷', '3', '8', '1', 'paper/05021506063014728.doc', 'neck1908', '2020-05-02 15:06:06');
INSERT INTO `paper` VALUES ('766', '2017学年傅雷中学第二学期期中初二年级英语学科调研试卷', '3', '8', '2', 'paper/05021506225442277.docx', 'neck1908', '2020-05-02 15:06:22');
INSERT INTO `paper` VALUES ('767', '2017学年上海市位育八年级上学期英语期末试复习卷S', '3', '8', '1', 'paper/05021506399952071.doc', 'neck1908', '2020-05-02 15:06:39');
INSERT INTO `paper` VALUES ('768', '2017学年上海市位育八年级上学期英语期末试复习卷T', '3', '8', '1', 'paper/05021506561230927.doc', 'neck1908', '2020-05-02 15:06:56');
INSERT INTO `paper` VALUES ('769', '2017学年上海市位育八年级上学期英语期末试复习卷T', '3', '8', '1', 'paper/05021507237056626.doc', 'neck1908', '2020-05-02 15:07:23');
INSERT INTO `paper` VALUES ('770', '2019-2020学年西南模初二下数学纠错1', '2', '8', '2', 'paper/05021547417488733.doc', 'vkjt1908', '2020-05-02 15:47:41');
INSERT INTO `paper` VALUES ('771', '2019-2020学年西南模初二下数学纠错2', '2', '8', '2', 'paper/05021548258744697.doc', 'vkjt1908', '2020-05-02 15:48:25');
INSERT INTO `paper` VALUES ('772', '2019-2020学年西南模初二下数学纠错3', '2', '8', '2', 'paper/05021549384436563.docx', 'vkjt1908', '2020-05-02 15:49:38');
INSERT INTO `paper` VALUES ('773', '华育中学2019-2020学年第一学期预初周测卷（含答案）', '2', '6', '1', 'paper/05021550363386637.docx', 'vkjt1908', '2020-05-02 15:50:36');
INSERT INTO `paper` VALUES ('774', '上海市第十中学2019-2020学年（沪教版(上海）七年级第二学期数学月考试卷（', '2', '7', '2', 'paper/05021551503821415.docx', 'vkjt1908', '2020-05-02 15:51:50');
INSERT INTO `paper` VALUES ('775', '上海市第十中学2019—2020学年七年级下学期期中数学试题（教师版）', '2', '7', '2', 'paper/05021553051821835.doc', 'vkjt1908', '2020-05-02 15:53:05');
INSERT INTO `paper` VALUES ('776', '上海市第十中学2019—2020学年七年级下学期期中数学试题（学生版）', '2', '7', '2', 'paper/05021554017527737.doc', 'vkjt1908', '2020-05-02 15:54:01');
INSERT INTO `paper` VALUES ('777', '上海市第十中学2019-2020学年七年级下学期月考数学试题（教师版）', '2', '7', '2', 'paper/05021554544310091.doc', 'vkjt1908', '2020-05-02 15:54:54');
INSERT INTO `paper` VALUES ('778', '上海市第十中学2019-2020学年七年级下学期月考数学试题（学生版）', '2', '7', '2', 'paper/05021555362701521.doc', 'vkjt1908', '2020-05-02 15:55:36');
INSERT INTO `paper` VALUES ('779', '上海市奉贤区2019-2020学年六年级数学第二学期周周练7（Word版无答案）', '2', '6', '2', 'paper/05021556245586288.doc', 'vkjt1908', '2020-05-02 15:56:24');
INSERT INTO `paper` VALUES ('780', '2017学年上建平西校期末质量检测初二年级英语试卷', '3', '8', '1', 'paper/05021556589987091.docx', 'neck1908', '2020-05-02 15:56:58');
INSERT INTO `paper` VALUES ('781', '2017学年上外初二第二学期3月月考试卷', '3', '8', '1', 'paper/05021557194656510.docx', 'neck1908', '2020-05-02 15:57:19');
INSERT INTO `paper` VALUES ('782', '上海市静安区实验中学2019-2020学年八年级下学期期中测试数学试题（教师版）', '2', '8', '2', 'paper/05021557385942213.doc', 'vkjt1908', '2020-05-02 15:57:38');
INSERT INTO `paper` VALUES ('783', '2017学年位育初级八年级英语周测卷', '3', '8', '1', 'paper/05021557419313971.docx', 'neck1908', '2020-05-02 15:57:41');
INSERT INTO `paper` VALUES ('784', '2017学年文琦中学八年级第二学期期中考试', '3', '8', '2', 'paper/05021557578659001.docx', 'neck1908', '2020-05-02 15:57:57');
INSERT INTO `paper` VALUES ('785', '上海市静安区实验中学2019-2020学年八年级下学期期中测试数学试题（学生版）', '2', '8', '2', 'paper/05021558221342289.doc', 'vkjt1908', '2020-05-02 15:58:22');
INSERT INTO `paper` VALUES ('786', '2017学年西南位育八年级上册期末测试卷', '3', '8', '1', 'paper/05021558297445105.docx', 'neck1908', '2020-05-02 15:58:29');
INSERT INTO `paper` VALUES ('787', '2017学年西南位育第一学期八年级小卷子(Word版含答案)', '3', '8', '1', 'paper/05021558471327780.docx', 'neck1908', '2020-05-02 15:58:47');
INSERT INTO `paper` VALUES ('788', '2017学年毓秀中学第二学期期中考试八年级英语试卷', '3', '8', '2', 'paper/05021559088600837.docx', 'neck1908', '2020-05-02 15:59:08');
INSERT INTO `paper` VALUES ('789', '2017育秀实验8B期中试卷', '3', '8', '2', 'paper/05021559243470282.docx', 'neck1908', '2020-05-02 15:59:24');
INSERT INTO `paper` VALUES ('790', '上海市静安区实验中学九年级下学期沪教版五四制第一轮复习三角形的基本概念与等腰三角', '2', '9', '2', 'paper/05021559343290827.doc', 'vkjt1908', '2020-05-02 15:59:34');
INSERT INTO `paper` VALUES ('791', '2018-2019 普陀区上学期八年级英语统考  T版', '3', '8', '1', 'paper/05021559403169231.docx', 'neck1908', '2020-05-02 15:59:40');
INSERT INTO `paper` VALUES ('792', '2018-2019华政附中八下英语单元测试U2', '3', '8', '2', 'paper/05021559571181535.docx', 'neck1908', '2020-05-02 15:59:57');
INSERT INTO `paper` VALUES ('793', '2018-2019年上海市徐汇区华育中学8AUnit 5单元测试卷', '3', '8', '1', 'paper/05021600132849756.docx', 'neck1908', '2020-05-02 16:00:13');
INSERT INTO `paper` VALUES ('794', '上海市静安区实验中学九年级下学期沪教版五四制第一轮复习三角形的基本概念与等腰三角', '2', '9', '2', 'paper/05021600171766764.doc', 'vkjt1908', '2020-05-02 16:00:17');
INSERT INTO `paper` VALUES ('795', '2018-2019学年宝山区统考初二（上）期中考试卷', '3', '8', '1', 'paper/05021600338448427.docx', 'neck1908', '2020-05-02 16:00:33');
INSERT INTO `paper` VALUES ('796', '2018-2019学年复旦附中八下英语3月考试', '3', '8', '2', 'paper/05021600558185287.docx', 'neck1908', '2020-05-02 16:00:55');
INSERT INTO `paper` VALUES ('797', '2018-2019学年上宝中学8A检测卷(三)', '3', '8', '1', 'paper/05021601186011122.doc', 'neck1908', '2020-05-02 16:01:18');
INSERT INTO `paper` VALUES ('798', '2018-2019学年上海省上海市徐汇区世界外国语中学八年级上学期英语期末试卷.', '3', '8', '1', 'paper/05021601366282061.docx', 'neck1908', '2020-05-02 16:01:36');
INSERT INTO `paper` VALUES ('799', '2018-2019学年上海市嘉定区同济大学附属实验中学八年级下学期英语阶段测试-', '3', '8', '2', 'paper/05021601553571347.docx', 'neck1908', '2020-05-02 16:01:55');
INSERT INTO `paper` VALUES ('800', '2018-2019学年上海市嘉定区同济大学附属实验中学八年级下学期英语阶段测试-', '3', '8', '2', 'paper/05021602117913242.docx', 'neck1908', '2020-05-02 16:02:11');
INSERT INTO `paper` VALUES ('801', '2018-2019学年上海市闵行文来中学初二上学期期中强化训练', '3', '8', '1', 'paper/05021602295363808.doc', 'neck1908', '2020-05-02 16:02:29');
INSERT INTO `paper` VALUES ('802', '2018-2019学年上海市浦东新区澧溪中学初二上学期期中考试试卷', '3', '8', '1', 'paper/05021602482695343.docx', 'neck1908', '2020-05-02 16:02:48');
INSERT INTO `paper` VALUES ('803', '上海市静安区实验中学九年级下学期沪教版五四制第一轮复习相似三角形（1）（教师版）', '2', '9', '2', 'paper/05021702428795522.doc', 'vkjt1908', '2020-05-02 17:02:42');
INSERT INTO `paper` VALUES ('804', '上海市静安区实验中学九年级下学期沪教版五四制第一轮复习相似三角形（学生版）', '2', '9', '2', 'paper/05021703423806712.doc', 'vkjt1908', '2020-05-02 17:03:42');
INSERT INTO `paper` VALUES ('805', '上海市静安区实验中学九年级下学期沪教版五四制第一轮复习直角三角形（教师版）', '2', '9', '2', 'paper/05021705079633226.doc', 'vkjt1908', '2020-05-02 17:05:07');
INSERT INTO `paper` VALUES ('806', '上海市静安区实验中学九年级下学期沪教版五四制第一轮复习直角三角形（学生版）', '2', '9', '2', 'paper/05021705401133012.doc', 'vkjt1908', '2020-05-02 17:05:40');
INSERT INTO `paper` VALUES ('807', '上海市静安区实验中学九年级下学期期中测试数学试题（教师版）', '2', '9', '2', 'paper/05021706307930400.doc', 'vkjt1908', '2020-05-02 17:06:30');
INSERT INTO `paper` VALUES ('808', '上海市静安区实验中学九年级下学期期中测试数学试题（学生版）', '2', '9', '2', 'paper/05021707128877599.doc', 'vkjt1908', '2020-05-02 17:07:12');
INSERT INTO `paper` VALUES ('809', '上海市民办张江集团学校第二学期预初五一作业（二）', '2', '6', '2', 'paper/05021708166090155.doc', 'vkjt1908', '2020-05-02 17:08:16');
INSERT INTO `paper` VALUES ('810', '上海市民办张江集团学校第二学期预初五一作业', '2', '6', '2', 'paper/05021708508221937.docx', 'vkjt1908', '2020-05-02 17:08:50');
INSERT INTO `paper` VALUES ('811', '上海市浦东新区部分校2019学年七年级下学期期中数学试题（教师版）', '2', '7', '2', 'paper/05021710118701002.doc', 'vkjt1908', '2020-05-02 17:10:11');
INSERT INTO `paper` VALUES ('812', '上海市延安实验中学2019-2020学年六年级第二学期期中考试模拟试卷', '2', '6', '2', 'paper/05021712084426618.docx', 'vkjt1908', '2020-05-02 17:12:08');
INSERT INTO `paper` VALUES ('813', '园南中学2019-2020学年第二学期八年级月考测试卷（学生）', '2', '8', '2', 'paper/05021713223571883.doc', 'vkjt1908', '2020-05-02 17:13:22');
INSERT INTO `paper` VALUES ('814', '园南中学2019-2020学年第二学期八年级月考测试卷', '2', '8', '2', 'paper/05021714014191791.doc', 'vkjt1908', '2020-05-02 17:14:01');
INSERT INTO `paper` VALUES ('815', '2018-2019学年上海市浦东新区尚德实验初二上英语摸底考试卷', '3', '8', '1', 'paper/05021740501405061.docx', 'neck1908', '2020-05-02 17:40:50');
INSERT INTO `paper` VALUES ('816', '2018-2019学年上海市普陀区曹二附八年级第一学期英语学科第一次阶段性检测试', '3', '8', '1', 'paper/05021741093173917.docx', 'neck1908', '2020-05-02 17:41:09');
INSERT INTO `paper` VALUES ('817', '2018-2019学年上海市普陀区普教院八年级第一学期英语学科期中试卷', '3', '8', '1', 'paper/05021741264033125.docx', 'neck1908', '2020-05-02 17:41:26');
INSERT INTO `paper` VALUES ('818', '2018年八年级英语第一学期第一次月考卷', '3', '8', '1', 'paper/05021741434050570.docx', 'neck1908', '2020-05-02 17:41:43');
INSERT INTO `paper` VALUES ('819', '2018学年八年级英语上学期期中模拟卷', '3', '8', '1', 'paper/05021743193627587.doc', 'neck1908', '2020-05-02 17:43:19');
INSERT INTO `paper` VALUES ('820', '2018学年初二第一学期风范中学单元2测试卷', '3', '8', '1', 'paper/05021744076373544.docx', 'neck1908', '2020-05-02 17:44:07');
INSERT INTO `paper` VALUES ('821', '2018学年存志中学八年级下英语测试卷', '3', '8', '1', 'paper/05021921399744522.docx', 'neck1908', '2020-05-02 19:21:39');
INSERT INTO `paper` VALUES ('822', '2018学年金山区初二下期中试卷', '3', '8', '2', 'paper/05021921583006540.docx', 'neck1908', '2020-05-02 19:21:58');
INSERT INTO `paper` VALUES ('823', '2018学年立达中学第一学期初二年级英语9月练习', '3', '8', '1', 'paper/05021924094649790.docx', 'neck1908', '2020-05-02 19:24:09');
INSERT INTO `paper` VALUES ('824', '2018学年刘行8B英语第一次月考试卷', '3', '8', '2', 'paper/05021924378119181.docx', 'neck1908', '2020-05-02 19:24:37');
INSERT INTO `paper` VALUES ('825', '2018学年上宝中学8A期中测试', '3', '8', '1', 'paper/05021924538013199.docx', 'neck1908', '2020-05-02 19:24:53');
INSERT INTO `paper` VALUES ('826', '2018学年上海市黄浦区民办立达中学初二年级9月月考卷', '3', '8', '1', 'paper/05021926293547809.doc', 'neck1908', '2020-05-02 19:26:29');
INSERT INTO `paper` VALUES ('827', '2018学年上海市闵行区文来实验中学八年级上学期10月考卷', '3', '8', '1', 'paper/05021927214129561.doc', 'neck1908', '2020-05-02 19:27:21');
INSERT INTO `paper` VALUES ('828', '2018学年上海市闵行区文琦中学初二上英语周练卷', '3', '8', '1', 'paper/05021927405728498.docx', 'neck1908', '2020-05-02 19:27:40');
INSERT INTO `paper` VALUES ('829', '2018学年上海市长宁区新世纪初二上学期10月份阶段测试', '3', '8', '1', 'paper/05021927598899378.doc', 'neck1908', '2020-05-02 19:27:59');
INSERT INTO `paper` VALUES ('830', '2018学年上外附中初二上英语期中考试', '3', '8', '1', 'paper/05021928236668078.doc', 'neck1908', '2020-05-02 19:28:23');
INSERT INTO `paper` VALUES ('831', '大同初中八年级2017年第二学期期中考试试卷', '3', '8', '2', 'paper/05021941254772836.docx', 'neck1908', '2020-05-02 19:41:25');
INSERT INTO `paper` VALUES ('832', '格致中学2017学年第一学期期中考试', '3', '8', '1', 'paper/05021941473386820.docx', 'neck1908', '2020-05-02 19:41:47');
INSERT INTO `paper` VALUES ('833', '黄浦区2017学年初二期中考试卷', '3', '8', '2', 'paper/05021942041300972.docx', 'neck1908', '2020-05-02 19:42:04');
INSERT INTO `paper` VALUES ('834', '建平西校2017年第二学期期中素养分析初二年级英语学科--S.doc', '3', '8', '2', 'paper/05021942201154989.doc', 'neck1908', '2020-05-02 19:42:20');
INSERT INTO `paper` VALUES ('835', '建平西校2017年第二学期期中素养分析初二年级英语学科--T.doc', '3', '8', '2', 'paper/05021942366174788.doc', 'neck1908', '2020-05-02 19:42:36');
INSERT INTO `paper` VALUES ('836', '进才实验 8AU1期末基础题复习', '3', '8', '1', 'paper/05021942566793396.docx', 'neck1908', '2020-05-02 19:42:56');
INSERT INTO `paper` VALUES ('837', '进才实验 8AU2期末基础题复习', '3', '8', '1', 'paper/05021943148684928.docx', 'neck1908', '2020-05-02 19:43:14');
INSERT INTO `paper` VALUES ('838', '进才实验 8AU3期末基础题复习', '3', '8', '1', 'paper/05021943281284860.docx', 'neck1908', '2020-05-02 19:43:28');
INSERT INTO `paper` VALUES ('839', '进才实验 8AU4期末基础题复习', '3', '8', '1', 'paper/05021943441609003.docx', 'neck1908', '2020-05-02 19:43:44');
INSERT INTO `paper` VALUES ('840', '进才实验 8AU5期末基础题复习', '3', '8', '1', 'paper/05021943584418025.docx', 'neck1908', '2020-05-02 19:43:58');
INSERT INTO `paper` VALUES ('841', '进才实验 8AU6期末基础题复习', '3', '8', '1', 'paper/05021944141147216.docx', 'neck1908', '2020-05-02 19:44:14');
INSERT INTO `paper` VALUES ('842', '进才实验 8AU7期末基础题复习', '3', '8', '1', 'paper/05021944287409228.docx', 'neck1908', '2020-05-02 19:44:28');
INSERT INTO `paper` VALUES ('843', '进才实验8A九月考测试卷', '3', '8', '1', 'paper/05021944447911015.doc', 'neck1908', '2020-05-02 19:44:44');
INSERT INTO `paper` VALUES ('844', '兰生复旦2018初二第一学期期中考试试卷', '3', '8', '1', 'paper/05021945011433816.docx', 'neck1908', '2020-05-02 19:45:01');
INSERT INTO `paper` VALUES ('845', '立达八年级2017年第二学期期中考试试卷', '3', '8', '2', 'paper/05021945199806955.docx', 'neck1908', '2020-05-02 19:45:19');
INSERT INTO `paper` VALUES ('846', '梅陇八年级2018一月份第一阶段测试卷', '3', '8', '1', 'paper/05021945476268977.docx', 'neck1908', '2020-05-02 19:45:47');
INSERT INTO `paper` VALUES ('847', '民办建平远翔学校2017学年初二第二学期英语期中考试试卷', '3', '8', '2', 'paper/05021948534797919.docx', 'neck1908', '2020-05-02 19:48:53');
INSERT INTO `paper` VALUES ('848', '民办新竹园初二2018第二学期开学摸底考试卷', '3', '8', '2', 'paper/05021949165877000.docx', 'neck1908', '2020-05-02 19:49:16');
INSERT INTO `paper` VALUES ('849', '民办张江2016学年第二学期初二第一次月考', '3', '8', '2', 'paper/05021949325178982.docx', 'neck1908', '2020-05-02 19:49:32');
INSERT INTO `paper` VALUES ('850', '民办张江八年级2017第二学期初二第一次月考', '3', '8', '2', 'paper/05021949477720329.docx', 'neck1908', '2020-05-02 19:49:47');
INSERT INTO `paper` VALUES ('851', '浦东模范中学2017初二年级第二学期期末教学质量检测卷（答案详解版）', '3', '8', '2', 'paper/05021950057923862.doc', 'neck1908', '2020-05-02 19:50:05');
INSERT INTO `paper` VALUES ('852', '浦东新区2016学年第二学期初二年级期中素养分析', '3', '8', '2', 'paper/05021950181992080.docx', 'neck1908', '2020-05-02 19:50:18');
INSERT INTO `paper` VALUES ('853', '浦东新区2017学年初二期中试卷', '3', '8', '2', 'paper/05021950355043625.doc', 'neck1908', '2020-05-02 19:50:35');
INSERT INTO `paper` VALUES ('854', '上宝中学8AU1同步笔记', '3', '8', '1', 'paper/05021950516903467.docx', 'neck1908', '2020-05-02 19:50:51');
INSERT INTO `paper` VALUES ('855', '上宝中学2017年8A期末卷分析版本', '3', '8', '1', 'paper/05021951117510401.docx', 'neck1908', '2020-05-02 19:51:11');
INSERT INTO `paper` VALUES ('856', '上宝中学初二英语第二学期8B Unit 1', '3', '8', '2', 'paper/05021951267134607.doc', 'neck1908', '2020-05-02 19:51:26');
INSERT INTO `paper` VALUES ('857', '上宝中学初二英语第二学期8B Unit 2', '3', '8', '2', 'paper/05021951415824894.docx', 'neck1908', '2020-05-02 19:51:41');
INSERT INTO `paper` VALUES ('858', '上宝中学初二英语第二学期8B Unit 3', '3', '8', '2', 'paper/05021951561234863.doc', 'neck1908', '2020-05-02 19:51:56');
INSERT INTO `paper` VALUES ('859', '上宝中学初二英语第二学期8B Unit 4', '3', '8', '2', 'paper/05021952119684768.docx', 'neck1908', '2020-05-02 19:52:11');
INSERT INTO `paper` VALUES ('860', '上宝中学初二英语第二学期8B Unit 5', '3', '8', '2', 'paper/05021952279177394.doc', 'neck1908', '2020-05-02 19:52:27');
INSERT INTO `paper` VALUES ('861', '上宝中学初二英语第一学期期中复习', '3', '8', '1', 'paper/05021952445168015.doc', 'neck1908', '2020-05-02 19:52:44');
INSERT INTO `paper` VALUES ('862', '上海民办新竹园2018学年第一学期英语学科八年级阶段性诊断一', '3', '8', '1', 'paper/05021953014520253.doc', 'neck1908', '2020-05-02 19:53:01');
INSERT INTO `paper` VALUES ('863', '上海民办新竹园中学8A Unit1单元测试', '3', '8', '1', 'paper/05021953167355798.docx', 'neck1908', '2020-05-02 19:53:16');
INSERT INTO `paper` VALUES ('864', '上海民办新竹园中学8A Unit2单元测试', '3', '8', '1', 'paper/05021953333388544.docx', 'neck1908', '2020-05-02 19:53:33');
INSERT INTO `paper` VALUES ('865', '上海民办新竹园中学8A Unit3单元测试', '3', '8', '1', 'paper/05021953465120064.docx', 'neck1908', '2020-05-02 19:53:46');
INSERT INTO `paper` VALUES ('866', '上海民办新竹园中学2017学年第二学期英语学科八年级期中考试卷', '3', '8', '2', 'paper/05021954051998986.docx', 'neck1908', '2020-05-02 19:54:05');
INSERT INTO `paper` VALUES ('867', '上海闵行文绮中学2017初二下学期月考英语试卷', '3', '8', '2', 'paper/05021954202698945.doc', 'neck1908', '2020-05-02 19:54:20');
INSERT INTO `paper` VALUES ('868', '上海市浦东新区2017八年级下学期期中考试英语试卷', '3', '8', '2', 'paper/05021954428007564.docx', 'neck1908', '2020-05-02 19:54:42');
INSERT INTO `paper` VALUES ('869', '上海市位育中学2017初二周末测试卷', '3', '8', '2', 'paper/05021954599754472.docx', 'neck1908', '2020-05-02 19:54:59');
INSERT INTO `paper` VALUES ('870', '上海市西初级中学2017八年级（上）英语期末试卷', '3', '8', '1', 'paper/05021955165348439.docx', 'neck1908', '2020-05-02 19:55:16');
INSERT INTO `paper` VALUES ('871', '上外附中2017八年级月考试卷', '3', '8', '2', 'paper/05021955327230301.docx', 'neck1908', '2020-05-02 19:55:32');
INSERT INTO `paper` VALUES ('872', '上外附中2018初二下开学摸底卷教师版', '3', '8', '2', 'paper/05021955479507303.doc', 'neck1908', '2020-05-02 19:55:47');
INSERT INTO `paper` VALUES ('873', '上外双语2018学年第一学期初二年级英语学科阶段测试', '3', '8', '1', 'paper/05021956029332197.docx', 'neck1908', '2020-05-02 19:56:02');
INSERT INTO `paper` VALUES ('874', '上中东2018学年度第一学期初二10月素质评估', '3', '8', '1', 'paper/05021956175720113.docx', 'neck1908', '2020-05-02 19:56:17');
INSERT INTO `paper` VALUES ('875', '世外2017初二12月月考试卷', '3', '8', '1', 'paper/05021956361832413.docx', 'neck1908', '2020-05-02 19:56:36');
INSERT INTO `paper` VALUES ('876', '世外2017学年第一学期初二期末考试卷', '3', '8', '1', 'paper/05021956522300622.docx', 'neck1908', '2020-05-02 19:56:52');
INSERT INTO `paper` VALUES ('877', '市三2016学年M3U9测试卷', '3', '8', '1', 'paper/05021957118835805.doc', 'neck1908', '2020-05-02 19:57:11');
INSERT INTO `paper` VALUES ('878', '市三女中2016学年8A期末考试卷', '3', '8', '1', 'paper/05021957255264363.docx', 'neck1908', '2020-05-02 19:57:25');
INSERT INTO `paper` VALUES ('879', '市西中学2016年 8B期中英语试卷', '3', '8', '2', 'paper/05021957425044317.docx', 'neck1908', '2020-05-02 19:57:42');
INSERT INTO `paper` VALUES ('880', '松江区2016-2017学年度第二学期初二英语期中考试试题附答案', '3', '8', '2', 'paper/05021958021530614.doc', 'neck1908', '2020-05-02 19:58:02');
INSERT INTO `paper` VALUES ('881', '松江区2016-2017学年度第二学期初二英语期中考试试题附答案', '3', '8', '2', 'paper/05021958063436005.doc', 'neck1908', '2020-05-02 19:58:06');
INSERT INTO `paper` VALUES ('882', '位育中学2017学年第二学期初二年级英语期中考试试卷', '3', '8', '2', 'paper/05021958194694754.docx', 'neck1908', '2020-05-02 19:58:19');
INSERT INTO `paper` VALUES ('883', '文来中学2017初二期中摸底卷3', '3', '8', '2', 'paper/05021958359087500.doc', 'neck1908', '2020-05-02 19:58:35');
INSERT INTO `paper` VALUES ('884', '文来中学2017初二期中摸底卷4', '3', '8', '2', 'paper/05021958472782830.docx', 'neck1908', '2020-05-02 19:58:47');
INSERT INTO `paper` VALUES ('885', '文来中学2017年八年级10月第3周强化训练', '3', '8', '1', 'paper/05021959051796129.docx', 'neck1908', '2020-05-02 19:59:05');
INSERT INTO `paper` VALUES ('886', '文来中学2017期中后第一次周测卷', '3', '8', '2', 'paper/05021959349393936.docx', 'neck1908', '2020-05-02 19:59:34');
INSERT INTO `paper` VALUES ('887', '文绮中学2017八年级第一学期月考', '3', '8', '1', 'paper/05021959513989701.docx', 'neck1908', '2020-05-02 19:59:51');
INSERT INTO `paper` VALUES ('888', '西南模2017初二U4月考卷', '3', '8', '2', 'paper/05022000107332877.docx', 'neck1908', '2020-05-02 20:00:10');
INSERT INTO `paper` VALUES ('889', '西南位育2018年8A 期中语法复习卷', '3', '8', '1', 'paper/05022000394164475.docx', 'neck1908', '2020-05-02 20:00:39');
INSERT INTO `paper` VALUES ('890', '新北郊2018年8AU2单元测试', '3', '8', '1', 'paper/05022000568045490.docx', 'neck1908', '2020-05-02 20:00:56');
INSERT INTO `paper` VALUES ('891', '徐汇区2017学年初二期中考试卷', '3', '8', '1', 'paper/05022001134242008.doc', 'neck1908', '2020-05-02 20:01:13');
INSERT INTO `paper` VALUES ('892', '2016-2017年上海市虹口上外八上期末', '2', '8', '1', 'paper/05022001185999582.docx', '', '2020-05-02 20:01:18');
INSERT INTO `paper` VALUES ('893', '育才初级中学2017学年第二学期八年级英语跟踪练习', '3', '8', '2', 'paper/05022001367655900.docx', 'neck1908', '2020-05-02 20:01:36');
INSERT INTO `paper` VALUES ('894', '育人中学2018-2019学年初二年级英语学科10月份调研检测', '3', '8', '1', 'paper/05022002016762423.docx', 'neck1908', '2020-05-02 20:02:01');
INSERT INTO `paper` VALUES ('895', '张江集团学校2017学年第二学期初二英语单元测试三', '3', '8', '2', 'paper/05022002181030239.docx', 'neck1908', '2020-05-02 20:02:18');
INSERT INTO `paper` VALUES ('896', '张江集团学校2017学年第二学期初二英语阶段评估', '3', '8', '2', 'paper/05022002353873165.docx', 'neck1908', '2020-05-02 20:02:35');
INSERT INTO `paper` VALUES ('897', '张江集团学校2017学年第二学期初二英语期中试卷', '3', '8', '2', 'paper/05022002513140093.docx', 'neck1908', '2020-05-02 20:02:51');
INSERT INTO `paper` VALUES ('898', '2016年上海市尚德实验中学初三年级上学期期中试卷整理', '3', '9', '1', 'paper/05022003546292579.docx', 'neck1908', '2020-05-02 20:03:54');
INSERT INTO `paper` VALUES ('899', '2017-2018上海市华二附中九上期中考试', '3', '9', '1', 'paper/05022004123605368.docx', 'neck1908', '2020-05-02 20:04:12');
INSERT INTO `paper` VALUES ('900', '2017-2018上海市上宝中学九上英语期中考试', '3', '9', '1', 'paper/05022004297935945.docx', 'neck1908', '2020-05-02 20:04:29');
INSERT INTO `paper` VALUES ('901', '2017-2018上海市新华初级中学九上英语期中考（含答案）', '3', '9', '1', 'paper/05022004445112656.docx', 'neck1908', '2020-05-02 20:04:44');
INSERT INTO `paper` VALUES ('902', '2017-2018学年上海市浦东新区川沙中学南校初三上学期英语期中试卷', '3', '9', '1', 'paper/05022004585547626.docx', 'neck1908', '2020-05-02 20:04:58');
INSERT INTO `paper` VALUES ('903', '2017-2018学年上海市文绮中学中考英语三模卷', '3', '9', '2', 'paper/05022005147801459.docx', 'neck1908', '2020-05-02 20:05:14');
INSERT INTO `paper` VALUES ('904', '2017年上海市9A浦东模范期中测试英语试卷', '3', '9', '1', 'paper/05022005314555538.doc', 'neck1908', '2020-05-02 20:05:31');
INSERT INTO `paper` VALUES ('905', '2017年上海市光明中学九年级期中测试卷', '3', '9', '2', 'paper/05022005494532113.docx', 'neck1908', '2020-05-02 20:05:49');
INSERT INTO `paper` VALUES ('906', '2017年上海市虹口区新华初初三年级下学期期中试卷', '3', '9', '2', 'paper/05022006072441265.docx', 'neck1908', '2020-05-02 20:06:07');
INSERT INTO `paper` VALUES ('907', '2017年上海市西南位育9A11月月考试卷', '3', '9', '1', 'paper/05022006255575591.docx', 'neck1908', '2020-05-02 20:06:25');
INSERT INTO `paper` VALUES ('908', '2016-2017年上海市虹口上外八上期末', '2', '8', '1', 'paper/05022006263688274.docx', 'vkjt1908', '2020-05-02 20:06:26');
INSERT INTO `paper` VALUES ('909', '2017年上海市新竹园初三上期中考试卷', '3', '9', '1', 'paper/05022006443394687.doc', 'neck1908', '2020-05-02 20:06:44');
INSERT INTO `paper` VALUES ('910', '2016-2017年上海市延安中学八上期末', '2', '8', '1', 'paper/05022007187479876.docx', 'vkjt1908', '2020-05-02 20:07:18');
INSERT INTO `paper` VALUES ('911', '2017上海市华育中学九年级期中考试', '3', '9', '1', 'paper/05022007394878096.docx', 'neck1908', '2020-05-02 20:07:39');
INSERT INTO `paper` VALUES ('912', '2017上海市文来中学初三上英语期中试卷（含答案）', '3', '9', '1', 'paper/05022007548610459.docx', 'neck1908', '2020-05-02 20:07:54');
INSERT INTO `paper` VALUES ('913', '2017上海市新华初9A月考卷', '3', '9', '1', 'paper/05022008099529906.docx', 'neck1908', '2020-05-02 20:08:09');
INSERT INTO `paper` VALUES ('914', '2017学年上海市华二附中九年级上学期期中考', '3', '9', '1', 'paper/05022008238780379.docx', 'neck1908', '2020-05-02 20:08:23');
INSERT INTO `paper` VALUES ('915', '2017学年上海市浦东新区三林北校初三年级第一学期学期期中考试卷', '3', '9', '1', 'paper/05022008362375641.docx', 'neck1908', '2020-05-02 20:08:36');
INSERT INTO `paper` VALUES ('916', '2017学年上海市青浦一中初三月考卷', '3', '9', '1', 'paper/05022008534503638.docx', 'neck1908', '2020-05-02 20:08:53');
INSERT INTO `paper` VALUES ('917', '2017学年上海市西南位育周测卷三', '3', '9', '1', 'paper/05022009102737031.docx', 'neck1908', '2020-05-02 20:09:10');
INSERT INTO `paper` VALUES ('918', '2017学年上海市徐汇区西南模范九年级上学期周测试卷', '3', '9', '1', 'paper/05022009252467487.docx', 'neck1908', '2020-05-02 20:09:25');
INSERT INTO `paper` VALUES ('919', '2018-2019年华育中学初三周测卷', '3', '9', '1', 'paper/05022009409246225.docx', 'neck1908', '2020-05-02 20:09:40');
INSERT INTO `paper` VALUES ('920', '2017-2018年上海市建平实验八上期中', '2', '8', '1', 'paper/05022009423870121.docx', 'vkjt1908', '2020-05-02 20:09:42');
INSERT INTO `paper` VALUES ('921', '2018-2019年上外浦东分校初三9A 单元测试', '3', '9', '1', 'paper/05022009547821335.doc', 'neck1908', '2020-05-02 20:09:54');
INSERT INTO `paper` VALUES ('922', '2018-2019学年七宝实验初三第一学期英语复习卷', '3', '9', '1', 'paper/05022010123585192.docx', 'neck1908', '2020-05-02 20:10:12');
INSERT INTO `paper` VALUES ('923', '2018-2019学年上海名校初三上学期英语学科期中阶段练习', '3', '9', '1', 'paper/05022010288822533.docx', 'neck1908', '2020-05-02 20:10:28');
INSERT INTO `paper` VALUES ('924', '2018-2019学年上海市 第一教育署九上英语期中试卷', '3', '9', '1', 'paper/05022010458026596.doc', 'neck1908', '2020-05-02 20:10:45');
INSERT INTO `paper` VALUES ('925', '2018-2019学年上海市安亭震川 初三上学期 英语期中考试卷', '3', '9', '1', 'paper/05022011048910006.docx', 'neck1908', '2020-05-02 20:11:04');
INSERT INTO `paper` VALUES ('926', '2018-2019学年上海市宝山区九年级第一学期英语期中考试', '3', '9', '1', 'paper/05022011204065944.docx', 'neck1908', '2020-05-02 20:11:20');
INSERT INTO `paper` VALUES ('927', '2018-2019学年上海市宝山区刘行新华实验学校初三上学期9月周考试卷', '3', '9', '1', 'paper/05022011415344377.docx', 'neck1908', '2020-05-02 20:11:41');
INSERT INTO `paper` VALUES ('928', '2018-2019学年上海市宝山区刘行新华实验中学初三上学期10月月考试卷', '3', '9', '1', 'paper/05022011572490596.docx', 'neck1908', '2020-05-02 20:11:57');
INSERT INTO `paper` VALUES ('929', '2018-2019学年上海市宝山实验中学九年级第一学期10月摸底考试', '3', '9', '1', 'paper/05022012132594512.docx', 'neck1908', '2020-05-02 20:12:13');
INSERT INTO `paper` VALUES ('930', '2018-2019学年上海市虹口区新复兴9AU1周周练', '3', '9', '1', 'paper/05022012292955680.docx', 'neck1908', '2020-05-02 20:12:29');
INSERT INTO `paper` VALUES ('931', '2017-2018年上海市建平西校八上第一次月考', '2', '8', '1', 'paper/05022012309545241.docx', 'vkjt1908', '2020-05-02 20:12:30');
INSERT INTO `paper` VALUES ('932', '2018-2019学年上海市虹口区新华初级中学初三上学期英语期中考试卷', '3', '9', '1', 'paper/05022012448184606.docx', 'neck1908', '2020-05-02 20:12:44');
INSERT INTO `paper` VALUES ('933', '2018-2019学年上海市华育中学初三试卷教师版', '3', '9', '1', 'paper/05022012592586253.docx', 'neck1908', '2020-05-02 20:12:59');
INSERT INTO `paper` VALUES ('934', '2018-2019学年上海市嘉定区怀少中学九年级10月月考卷及解析', '3', '9', '1', 'paper/05022013173721206.docx', 'neck1908', '2020-05-02 20:13:17');
INSERT INTO `paper` VALUES ('935', '2017-2018年上海市兰生复旦八上第一次月考', '2', '8', '1', 'paper/05022013277114856.docx', 'vkjt1908', '2020-05-02 20:13:27');
INSERT INTO `paper` VALUES ('936', '2018-2019学年上海市嘉定区上外嘉定外国语学校初三上学期第一次月考英语试卷', '3', '9', '1', 'paper/05022013311999898.docx', 'neck1908', '2020-05-02 20:13:31');
INSERT INTO `paper` VALUES ('937', '2018-2019学年上海市金山区金盟中学初三英语期中考前复习试卷', '3', '9', '2', 'paper/05022013504316882.doc', 'neck1908', '2020-05-02 20:13:50');
INSERT INTO `paper` VALUES ('938', '2017-2018年上海市立达中学数学八上周测-反比例函数', '2', '8', '1', 'paper/05022014076215296.docx', 'vkjt1908', '2020-05-02 20:14:07');
INSERT INTO `paper` VALUES ('939', '2018-2019学年上海市闵行区华师大二附中九年级上学期期中考试卷', '3', '9', '1', 'paper/05022014087722650.docx', 'neck1908', '2020-05-02 20:14:08');
INSERT INTO `paper` VALUES ('940', '2018-2019学年上海市闵行区九年级第一学期期中联考试卷', '3', '9', '1', 'paper/05022014239859673.doc', 'neck1908', '2020-05-02 20:14:23');
INSERT INTO `paper` VALUES ('941', '2018-2019学年上海市闵行区文琦中学九年级上学期英语12月第一次阶段测试', '3', '9', '1', 'paper/05022014371598672.docx', 'neck1908', '2020-05-02 20:14:37');
INSERT INTO `paper` VALUES ('942', '2017-2018年上海市普陀区八上期末', '2', '8', '1', 'paper/05022014439510004.docx', 'vkjt1908', '2020-05-02 20:14:43');
INSERT INTO `paper` VALUES ('943', '2018-2019学年上海市闵行区文琦中学英语12月月考卷', '3', '9', '1', 'paper/05022014503673593.docx', 'neck1908', '2020-05-02 20:14:50');
INSERT INTO `paper` VALUES ('944', '2018-2019学年上海市闵行文来中学初三上英语9月月考', '3', '9', '1', 'paper/05022015059692465.docx', 'neck1908', '2020-05-02 20:15:05');
INSERT INTO `paper` VALUES ('945', '2017-2018年上海市上宝中学八上周末10', '2', '8', '1', 'paper/05022015216301618.docx', 'vkjt1908', '2020-05-02 20:15:21');
INSERT INTO `paper` VALUES ('946', '2018-2019学年上海市南翔中学初三10月月考试卷', '3', '9', '1', 'paper/05022015215186272.docx', 'neck1908', '2020-05-02 20:15:21');
INSERT INTO `paper` VALUES ('947', '2018-2019学年上海市浦东新区建平西校初三第三单元考试试卷', '3', '9', '1', 'paper/05022015375563752.docx', 'neck1908', '2020-05-02 20:15:37');
INSERT INTO `paper` VALUES ('948', '2018-2019学年上海市浦东新区九年级上学期英语期中卷（无听力）', '3', '9', '1', 'paper/05022015573102430.docx', 'neck1908', '2020-05-02 20:15:57');
INSERT INTO `paper` VALUES ('949', '2017-2018年上海市上外附中八上第一次月考', '2', '8', '1', 'paper/05022016009022095.docx', 'vkjt1908', '2020-05-02 20:16:00');
INSERT INTO `paper` VALUES ('950', '2018-2019学年上海市浦东新区尚德中学九年级上学期11月测试卷', '3', '9', '1', 'paper/05022016137704461.docx', 'neck1908', '2020-05-02 20:16:13');
INSERT INTO `paper` VALUES ('951', '2018-2019学年上海市浦外初三上学期英语质量检测（二）', '3', '9', '1', 'paper/05022016302350746.doc', 'neck1908', '2020-05-02 20:16:30');
INSERT INTO `paper` VALUES ('952', '2017-2018年上海市文来中学八上期中', '2', '8', '1', 'paper/05022016394974748.docx', 'vkjt1908', '2020-05-02 20:16:39');
INSERT INTO `paper` VALUES ('953', '2018-2019学年上海市普陀区华师大四附中九年级上学期十月月考卷', '3', '9', '1', 'paper/05022016444565146.docx', 'neck1908', '2020-05-02 20:16:44');
INSERT INTO `paper` VALUES ('954', '2018-2019学年上海市普陀区九年级上学期英语期中考试', '3', '9', '1', 'paper/05022017064641624.docx', 'neck1908', '2020-05-02 20:17:06');
INSERT INTO `paper` VALUES ('955', '2017-2018年上海市文绮中学八上期中', '2', '8', '1', 'paper/05022017182170287.docx', 'vkjt1908', '2020-05-02 20:17:18');
INSERT INTO `paper` VALUES ('956', '2018-2019学年上海市青浦区复旦附中初三上英语第一次阶段考试试卷', '3', '9', '1', 'paper/05022017214466355.docx', 'neck1908', '2020-05-02 20:17:21');
INSERT INTO `paper` VALUES ('957', '2018-2019学年上海市青浦区崧淀中学初三上英语十月阶段考试试卷', '3', '9', '1', 'paper/05022017347367387.docx', 'neck1908', '2020-05-02 20:17:34');
INSERT INTO `paper` VALUES ('958', '2018-2019学年上海市上宝中学九年级上学期英语期中考试', '3', '9', '1', 'paper/05022017516413879.docx', 'neck1908', '2020-05-02 20:17:51');
INSERT INTO `paper` VALUES ('959', '2017-2018年上海市西南位育八上期中', '2', '8', '1', 'paper/05022017568774994.docx', 'vkjt1908', '2020-05-02 20:17:56');
INSERT INTO `paper` VALUES ('960', '2018-2019学年上海市莘城中学九年级上学期英语期中考试', '3', '9', '1', 'paper/05022018049412123.docx', 'neck1908', '2020-05-02 20:18:04');
INSERT INTO `paper` VALUES ('961', '2018-2019学年上海市文来中学九上英语周末练习（六）', '3', '9', '1', 'paper/05022018222735399.doc', 'neck1908', '2020-05-02 20:18:22');
INSERT INTO `paper` VALUES ('962', '2018-2019学年上海市西南模九年级上学期英语周测_9AM1U1', '3', '9', '1', 'paper/05022018381717452.docx', 'neck1908', '2020-05-02 20:18:38');
INSERT INTO `paper` VALUES ('963', '2017-2018年上海市新华初八上期末专题复习-平行四边形', '2', '8', '1', 'paper/05022018449475233.docx', 'vkjt1908', '2020-05-02 20:18:44');
INSERT INTO `paper` VALUES ('964', '2018—2019学年上海市新华初级中学初三上学期初三10月月考试卷', '3', '9', '1', 'paper/05022018546087529.docx', 'neck1908', '2020-05-02 20:18:54');
INSERT INTO `paper` VALUES ('965', '2018-2019学年上海市徐汇区西南模范中学九年级上学期期中考试试卷', '3', '9', '1', 'paper/05022019122045058.docx', 'neck1908', '2020-05-02 20:19:12');
INSERT INTO `paper` VALUES ('966', '2017-2018年上海市延安中学八上期中模拟1', '2', '8', '1', 'paper/05022019205238519.docx', 'vkjt1908', '2020-05-02 20:19:20');
INSERT INTO `paper` VALUES ('967', '2018-2019学年上海市徐汇区西南位育中学初三年级第一学期第三周随堂训练试卷', '3', '9', '1', 'paper/05022019278681493.docx', 'neck1908', '2020-05-02 20:19:27');
INSERT INTO `paper` VALUES ('968', '2018-2019学年上海市徐汇区西南位育中学初三年级上学期9月份周测卷', '3', '9', '1', 'paper/05022019404584738.docx', 'neck1908', '2020-05-02 20:19:40');
INSERT INTO `paper` VALUES ('969', '2018-2019学年上海市长宁区娄山中学九年级上学期9月考试卷', '3', '9', '1', 'paper/05022019553631163.docx', 'neck1908', '2020-05-02 20:19:55');
INSERT INTO `paper` VALUES ('970', '2017-2018年上海市延安中学八上期中模拟2', '2', '8', '1', 'paper/05022020012883848.docx', 'vkjt1908', '2020-05-02 20:20:01');
INSERT INTO `paper` VALUES ('971', '2018-2019学年上海市长宁区民办新世纪初三第一学期10月份练习卷', '3', '9', '1', 'paper/05022020104756766.docx', 'neck1908', '2020-05-02 20:20:10');
INSERT INTO `paper` VALUES ('972', '2018年3月上海市华二九年级周考试卷', '3', '9', '2', 'paper/05022020256676334.docx', 'neck1908', '2020-05-02 20:20:25');
INSERT INTO `paper` VALUES ('973', '2018年10月上海市SR7梅川中心梅陇中学初三 10月考试卷', '3', '9', '1', 'paper/05022020399738598.docx', 'neck1908', '2020-05-02 20:20:39');
INSERT INTO `paper` VALUES ('974', '2018-2019年上海市宝教院附中八上期中', '2', '8', '1', 'paper/05022020395858983.docx', 'vkjt1908', '2020-05-02 20:20:39');
INSERT INTO `paper` VALUES ('975', '2018年上海市存志中学新初三暑期测试', '3', '9', '2', 'paper/05022020577351162.docx', 'neck1908', '2020-05-02 20:20:57');
INSERT INTO `paper` VALUES ('976', '2018年上海市华育中学英语part 2试卷', '3', '9', '1', 'paper/05022021124832656.docx', 'neck1908', '2020-05-02 20:21:12');
INSERT INTO `paper` VALUES ('977', '2018-2019年上海市宝山实验学校八上第一次月考', '2', '8', '1', 'paper/05022021181983430.docx', 'vkjt1908', '2020-05-02 20:21:18');
INSERT INTO `paper` VALUES ('978', '2018年上海市黄浦区民办立达中学初三年级第一学期10月单元练习', '3', '9', '1', 'paper/05022021304105289.doc', 'neck1908', '2020-05-02 20:21:30');
INSERT INTO `paper` VALUES ('979', '2018年上海市七宝二中初三上学期10月月考卷', '3', '9', '1', 'paper/05022021441423775.docx', 'neck1908', '2020-05-02 20:21:44');
INSERT INTO `paper` VALUES ('980', '2018-2019年上海市大同初级八上期中', '2', '8', '1', 'paper/05022021538407022.docx', 'vkjt1908', '2020-05-02 20:21:53');
INSERT INTO `paper` VALUES ('981', '2018年上海市七一中学九年级上期中考试', '3', '9', '1', 'paper/05022022018735185.docx', 'neck1908', '2020-05-02 20:22:01');
INSERT INTO `paper` VALUES ('982', '2018年上海市上外双语初三11月考试卷', '3', '9', '1', 'paper/05022022178681519.docx', 'neck1908', '2020-05-02 20:22:17');
INSERT INTO `paper` VALUES ('983', '2018年上海市市十中学初三年级10月月考卷', '3', '9', '1', 'paper/05022022327407274.doc', 'neck1908', '2020-05-02 20:22:32');
INSERT INTO `paper` VALUES ('984', '2018-2019年上海市第四教育署八上10月月考', '2', '8', '1', 'paper/05022022337291986.docx', 'vkjt1908', '2020-05-02 20:22:33');
INSERT INTO `paper` VALUES ('985', '2018年上海市文来中学第一学期初三英语测验(无听力)', '3', '9', '1', 'paper/05022022455837637.docx', 'neck1908', '2020-05-02 20:22:45');
INSERT INTO `paper` VALUES ('986', '2018年上海市西南模范9A初三周测卷', '3', '9', '1', 'paper/05022023022661984.docx', 'neck1908', '2020-05-02 20:23:02');
INSERT INTO `paper` VALUES ('987', '2018-2019年上海市华育中学八上周末卷6', '2', '8', '1', 'paper/05022023153186331.docx', 'vkjt1908', '2020-05-02 20:23:15');
INSERT INTO `paper` VALUES ('988', '2018年上海市新华初中学九年级上学期10月月考试卷分析', '3', '9', '1', 'paper/05022023398109484.docx', 'neck1908', '2020-05-02 20:23:39');
INSERT INTO `paper` VALUES ('989', '2018年上海市新竹园中学上学期双周测试卷6', '3', '9', '1', 'paper/05022023504101640.doc', 'neck1908', '2020-05-02 20:23:50');
INSERT INTO `paper` VALUES ('990', '2018年上海市杨浦区初三上期中区统考试卷', '3', '9', '1', 'paper/05022024136712184.docx', 'neck1908', '2020-05-02 20:24:13');
INSERT INTO `paper` VALUES ('991', '2018-2019年上海市浦东交中初级中学八上12月月考', '2', '8', '1', 'paper/05022024173291022.docx', 'vkjt1908', '2020-05-02 20:24:17');
INSERT INTO `paper` VALUES ('992', '2018年上海市震旦外国语中学初三第一次阶段性练习', '3', '9', '1', 'paper/05022024314313876.docx', 'neck1908', '2020-05-02 20:24:31');
INSERT INTO `paper` VALUES ('993', '2018学年第一学期上海市华育初三月考卷（精析版）', '3', '9', '1', 'paper/05022024479971917.doc', 'neck1908', '2020-05-02 20:24:47');
INSERT INTO `paper` VALUES ('994', '2018-2019年上海市浦东第四教育署八上期中', '2', '8', '1', 'paper/05022024571865006.docx', 'vkjt1908', '2020-05-02 20:24:57');
INSERT INTO `paper` VALUES ('995', '2018学年第一学期上海市普陀区统考初三英语学科期中质量调研卷', '3', '9', '1', 'paper/05022024591653429.docx', 'neck1908', '2020-05-02 20:24:59');
INSERT INTO `paper` VALUES ('996', '2018学年第一学期上海市田林中学九年级阶段英语学科质量调研卷', '3', '9', '1', 'paper/05022025221693212.docx', 'neck1908', '2020-05-02 20:25:22');
INSERT INTO `paper` VALUES ('997', '2018-2019年上海市浦东第一教育署八上期中', '2', '8', '1', 'paper/05022025408449200.docx', 'vkjt1908', '2020-05-02 20:25:40');
INSERT INTO `paper` VALUES ('998', '2018学年上海名校九年级英语上学期期中模拟卷', '3', '9', '1', 'paper/05022025581059243.doc', 'neck1908', '2020-05-02 20:25:58');
INSERT INTO `paper` VALUES ('999', '2018学年上海市宝山区九年级上学期英语期中试卷', '3', '9', '1', 'paper/05022026127803228.docx', 'neck1908', '2020-05-02 20:26:12');
INSERT INTO `paper` VALUES ('1000', '2018-2019年上海市七宝二中八上期中', '2', '8', '1', 'paper/05022026161552925.docx', 'vkjt1908', '2020-05-02 20:26:16');
INSERT INTO `paper` VALUES ('1001', '2018学年上海市初三英语质量检测试卷', '3', '9', '1', 'paper/05022026292251024.docx', 'neck1908', '2020-05-02 20:26:29');
INSERT INTO `paper` VALUES ('1002', '2018学年上海市华育中学初三上第一次周测试卷', '3', '9', '1', 'paper/05022026448338917.docx', 'neck1908', '2020-05-02 20:26:44');
INSERT INTO `paper` VALUES ('1003', '2018学年上海市交华中学初三期中考试', '3', '9', '1', 'paper/05022026587024944.docx', 'neck1908', '2020-05-02 20:26:58');
INSERT INTO `paper` VALUES ('1004', '2018-2019年上海市上南南校八上10月月考', '2', '8', '1', 'paper/05022026594875521.docx', 'vkjt1908', '2020-05-02 20:26:59');
INSERT INTO `paper` VALUES ('1005', '2018学年上海市闵行区七宝二中九年级上学期期中考试试卷', '3', '9', '1', 'paper/05022027151149175.docx', 'neck1908', '2020-05-02 20:27:15');
INSERT INTO `paper` VALUES ('1006', '2018学年上海市南汇四中周练卷（二）', '3', '9', '1', 'paper/05022027349854923.doc', 'neck1908', '2020-05-02 20:27:34');
INSERT INTO `paper` VALUES ('1007', '2018学年上海市南汇四中周练卷（三）', '3', '9', '1', 'paper/05022027502607006.docx', 'neck1908', '2020-05-02 20:27:50');
INSERT INTO `paper` VALUES ('1008', '2018-2019年上海市上外附外八上期中', '2', '8', '1', 'paper/05022027534514463.docx', 'vkjt1908', '2020-05-02 20:27:53');
INSERT INTO `paper` VALUES ('1009', '2018学年上海市南汇四中周练卷（一）', '3', '9', '1', 'paper/05022028116613843.doc', 'neck1908', '2020-05-02 20:28:11');
INSERT INTO `paper` VALUES ('1010', '2018-2019年上海市位育初级八上期中', '2', '8', '1', 'paper/05022028364109602.docx', 'vkjt1908', '2020-05-02 20:28:36');
INSERT INTO `paper` VALUES ('1011', '2018-2019年上海市位育初级中学八上第二次月考', '2', '8', '1', 'paper/05022029304563474.docx', 'vkjt1908', '2020-05-02 20:29:30');
INSERT INTO `paper` VALUES ('1012', '2018学年上海市浦江一中第一学期期中考试九年级英语试卷', '3', '9', '1', 'paper/05022029485011093.doc', 'neck1908', '2020-05-02 20:29:48');
INSERT INTO `paper` VALUES ('1013', '2018学年上海市上外初三Weekly Exercise', '3', '9', '1', 'paper/05022030072156327.docx', 'neck1908', '2020-05-02 20:30:07');
INSERT INTO `paper` VALUES ('1014', '2018-2019年上海市杨浦区八上期中', '2', '8', '1', 'paper/05022030188479272.docx', 'vkjt1908', '2020-05-02 20:30:18');
INSERT INTO `paper` VALUES ('1015', '2018学年上海市上外初三第一学期开学试卷', '3', '9', '1', 'paper/05022030225380452.docx', 'neck1908', '2020-05-02 20:30:22');
INSERT INTO `paper` VALUES ('1016', '2018学年上海市世界外国语初三语法练习题', '3', '9', '1', 'paper/05022030381490657.docx', 'neck1908', '2020-05-02 20:30:38');
INSERT INTO `paper` VALUES ('1017', '2018-2019年上海市玉华中学八上第一次月考', '2', '8', '1', 'paper/05022030526376342.docx', 'vkjt1908', '2020-05-02 20:30:52');
INSERT INTO `paper` VALUES ('1018', '2018学年上海市位育初中初三月考', '3', '9', '1', 'paper/05022030531176453.docx', 'neck1908', '2020-05-02 20:30:53');
INSERT INTO `paper` VALUES ('1019', '2018学年上海市西南模范9A初三9月28周测卷', '3', '9', '1', 'paper/05022031078606213.docx', 'neck1908', '2020-05-02 20:31:07');
INSERT INTO `paper` VALUES ('1020', '2018学年长宁区建青实验中学九年级上学期第二单元检测', '3', '9', '1', 'paper/05022031279995536.doc', 'neck1908', '2020-05-02 20:31:27');
INSERT INTO `paper` VALUES ('1021', '2018学年长宁区民办新世纪初三英语10月月考试卷', '3', '9', '1', 'paper/05022031416928842.docx', 'neck1908', '2020-05-02 20:31:41');
INSERT INTO `paper` VALUES ('1022', '2019年上海市西南模范初三英语十二月阶段测试', '3', '9', '1', 'paper/05022031551278946.docx', 'neck1908', '2020-05-02 20:31:55');
INSERT INTO `paper` VALUES ('1023', '上海市2018-2019学年第一学期文来中学初三10月月份卷', '3', '9', '1', 'paper/05022032097691264.docx', 'neck1908', '2020-05-02 20:32:09');
INSERT INTO `paper` VALUES ('1024', '上海市2018--2019学年中国中学初三10月份月考卷', '3', '9', '1', 'paper/05022032278162624.doc', 'neck1908', '2020-05-02 20:32:27');
INSERT INTO `paper` VALUES ('1025', '2015-2016年上海市宝山区八上期末', '2', '8', '1', 'paper/05022032287393804.doc', 'vkjt1908', '2020-05-02 20:32:28');
INSERT INTO `paper` VALUES ('1026', '上海市2018华育中学初三周测试卷', '3', '9', '1', 'paper/05022032408863690.docx', 'neck1908', '2020-05-02 20:32:40');
INSERT INTO `paper` VALUES ('1027', '上海市2018学年宝山区初三期中统考试卷', '3', '9', '1', 'paper/05022032562020218.docx', 'neck1908', '2020-05-02 20:32:56');
INSERT INTO `paper` VALUES ('1028', '2015-2016年上海市浦东新区八上期末', '2', '8', '1', 'paper/05022033048529949.doc', 'vkjt1908', '2020-05-02 20:33:04');
INSERT INTO `paper` VALUES ('1029', '上海市2018学年华育中学初三第一次周测卷', '3', '9', '1', 'paper/05022033104286429.docx', 'neck1908', '2020-05-02 20:33:10');
INSERT INTO `paper` VALUES ('1030', '上海市2018学年西南位育初三周练1试卷分析', '3', '9', '1', 'paper/05022033254083596.docx', 'neck1908', '2020-05-02 20:33:25');
INSERT INTO `paper` VALUES ('1031', '上海市宝山区2017学年初三上学期期中考试统考卷', '3', '9', '1', 'paper/05022033437744700.docx', 'neck1908', '2020-05-02 20:33:43');
INSERT INTO `paper` VALUES ('1032', '2015-2016年上海市松江区八上期末', '2', '8', '1', 'paper/05022033473626750.doc', 'vkjt1908', '2020-05-02 20:33:47');
INSERT INTO `paper` VALUES ('1033', '上海市静教附院2017年九年级第一学期11月月考试卷', '3', '9', '1', 'paper/05022033587718162.docx', 'neck1908', '2020-05-02 20:33:58');
INSERT INTO `paper` VALUES ('1034', '上海市九峰实验学校2017学年第一学期期中考试 初三英语试卷', '3', '9', '1', 'paper/05022034111280645.docx', 'neck1908', '2020-05-02 20:34:11');
INSERT INTO `paper` VALUES ('1036', '上海市立达中学2016学年第一学期期中考试初三年级英语试卷', '3', '9', '1', 'paper/05022034278189976.doc', 'neck1908', '2020-05-02 20:34:27');
INSERT INTO `paper` VALUES ('1037', '上海市民办立达中学2018学年第一学期理科班能力考教师版', '3', '9', '1', 'paper/05022034402345902.doc', 'neck1908', '2020-05-02 20:34:40');
INSERT INTO `paper` VALUES ('1038', '2016-2017年上海市松江区八上期末', '2', '8', '1', 'paper/05022034562616921.docx', 'vkjt1908', '2020-05-02 20:34:56');
INSERT INTO `paper` VALUES ('1039', '上海市民办立达中学2018学年第一学期理科班能力考学生版', '3', '9', '1', 'paper/05022034572069635.docx', 'neck1908', '2020-05-02 20:34:57');
INSERT INTO `paper` VALUES ('1040', '上海市明珠中学2018学年第一学期九年级英语学科十月测试试卷', '3', '9', '1', 'paper/05022035133398636.doc', 'neck1908', '2020-05-02 20:35:13');
INSERT INTO `paper` VALUES ('1041', '上海市上宝中学2017学年第二学期初三英语月考测试卷', '3', '9', '2', 'paper/05022035298078379.doc', 'neck1908', '2020-05-02 20:35:29');
INSERT INTO `paper` VALUES ('1042', '上海市上宝中学2018学年九年级第一学期期中考试卷', '3', '9', '1', 'paper/05022035458548777.doc', 'neck1908', '2020-05-02 20:35:45');
INSERT INTO `paper` VALUES ('1043', '上海市上海中学东校2017学年第二学期期中试卷', '3', '9', '2', 'paper/05022036015153786.docx', 'neck1908', '2020-05-02 20:36:01');
INSERT INTO `paper` VALUES ('1044', '上海市上师初中2018-2019年初三英语第一学期期中考试', '3', '9', '1', 'paper/05022036237206711.docx', 'neck1908', '2020-05-02 20:36:23');
INSERT INTO `paper` VALUES ('1045', '上海市尚德实验中学2016学年初三第一学期期中素养试卷', '3', '9', '1', 'paper/05022036406083275.docx', 'neck1908', '2020-05-02 20:36:40');
INSERT INTO `paper` VALUES ('1047', '上海市尚德实验中学2017学年初三上学期英语试卷', '3', '9', '1', 'paper/05022036547378394.doc', 'neck1908', '2020-05-02 20:36:54');
INSERT INTO `paper` VALUES ('1048', '上海市尚德中学2018学年初三英语模拟试卷', '3', '9', '1', 'paper/05022037086756078.docx', 'neck1908', '2020-05-02 20:37:08');
INSERT INTO `paper` VALUES ('1049', '2016-2017年上海市廊下中学六上期末', '2', '6', '1', 'paper/05022037214294499.doc', 'vkjt1908', '2020-05-02 20:37:21');
INSERT INTO `paper` VALUES ('1050', '上海市世外初三上weekly2周测试卷', '3', '9', '1', 'paper/05022037285172993.docx', 'neck1908', '2020-05-02 20:37:28');
INSERT INTO `paper` VALUES ('1051', '上海市市西中学初三第一学期周测试卷', '3', '9', '1', 'paper/05022037447227536.docx', 'neck1908', '2020-05-02 20:37:44');
INSERT INTO `paper` VALUES ('1052', '2016-2017年上海市桃李园实验学校八上期末模拟', '2', '8', '1', 'paper/05022037598099417.doc', 'vkjt1908', '2020-05-02 20:37:59');
INSERT INTO `paper` VALUES ('1053', '上海市市西中学初三英语周末练习卷二', '3', '9', '1', 'paper/05022038013781053.docx', 'neck1908', '2020-05-02 20:38:01');
INSERT INTO `paper` VALUES ('1054', '上海市天山中学2017学年第一学期九年级上学期期中试卷', '3', '9', '1', 'paper/05022038155735361.docx', 'neck1908', '2020-05-02 20:38:15');
INSERT INTO `paper` VALUES ('1055', '上海市位育初级中学校本教材练习（周末卷1）', '3', '9', '1', 'paper/05022038332285754.docx', 'neck1908', '2020-05-02 20:38:33');
INSERT INTO `paper` VALUES ('1056', '上海市位育中学2018学年第一学期初三年级英语阶段1练习（part2）', '3', '9', '1', 'paper/05022038493962845.docx', 'neck1908', '2020-05-02 20:38:49');
INSERT INTO `paper` VALUES ('1057', '上海市西南模范中学2017年第一学期初三期中考试', '3', '9', '1', 'paper/05022039037053159.docx', 'neck1908', '2020-05-02 20:39:03');
INSERT INTO `paper` VALUES ('1058', '上海市向明中学2018学年初三导学手册9AU1 Exercise A', '3', '9', '1', 'paper/05022039172253239.doc', 'neck1908', '2020-05-02 20:39:17');
INSERT INTO `paper` VALUES ('1059', '上海市新复兴 2017年第二学期初三月考试卷', '3', '9', '2', 'paper/05022039337412986.docx', 'neck1908', '2020-05-02 20:39:33');
INSERT INTO `paper` VALUES ('1060', '上海市徐汇区2016学年位育中学初三年级英语试卷', '3', '9', '1', 'paper/05022039472309752.docx', 'neck1908', '2020-05-02 20:39:47');
INSERT INTO `paper` VALUES ('1061', '上海市徐汇中学2017学年初三第一学期期中考试试卷', '3', '9', '2', 'paper/05022040001779495.docx', 'neck1908', '2020-05-02 20:40:00');
INSERT INTO `paper` VALUES ('1062', '上海市徐汇中学2017学年初三第一学期期中试卷', '3', '9', '1', 'paper/05022040134714787.docx', 'neck1908', '2020-05-02 20:40:13');
INSERT INTO `paper` VALUES ('1063', '上海市洋泾南校2018学年初三第一学期学科10月份阶段测试', '3', '9', '1', 'paper/05022040315628888.docx', 'neck1908', '2020-05-02 20:40:31');
INSERT INTO `paper` VALUES ('1064', '上海市育秀学校九年级2017学年第一学期期中测试卷', '3', '9', '1', 'paper/05022040549195014.docx', 'neck1908', '2020-05-02 20:40:54');
INSERT INTO `paper` VALUES ('1065', '2017-2018年上海市玉华中学八上期末复习（三）', '2', '8', '1', 'paper/05022041028145969.doc', 'vkjt1908', '2020-05-02 20:41:02');
INSERT INTO `paper` VALUES ('1066', '上海外国语大学附属外国语学校2017届九年级上学期综合练习', '3', '9', '1', 'paper/05022041175994771.docx', 'neck1908', '2020-05-02 20:41:17');
INSERT INTO `paper` VALUES ('1067', '2017-2018年上海市玉华中学八上期末复习（四）', '2', '8', '1', 'paper/05022043246450586.doc', 'vkjt1908', '2020-05-02 20:43:24');
INSERT INTO `paper` VALUES ('1068', '上海市六上期末数学考试卷', '2', '6', '1', 'paper/05022045236483440.doc', 'vkjt1908', '2020-05-02 20:45:23');
INSERT INTO `paper` VALUES ('1069', '上海市松江区六上期末试卷', '2', '6', '1', 'paper/05022046049740056.doc', 'vkjt1908', '2020-05-02 20:46:04');
INSERT INTO `paper` VALUES ('1070', '预初期末考试卷', '2', '6', '1', 'paper/05022047104614780.docx', 'vkjt1908', '2020-05-02 20:47:10');
INSERT INTO `paper` VALUES ('1071', '2014-2015年上海市黄浦区六上期末', '2', '6', '1', 'paper/05022048185632223.doc', 'vkjt1908', '2020-05-02 20:48:18');
INSERT INTO `paper` VALUES ('1072', '2014-2015年上海市闵行区六上期末', '2', '6', '1', 'paper/05022048525010528.doc', 'vkjt1908', '2020-05-02 20:48:52');
INSERT INTO `paper` VALUES ('1073', '2015-2016年上海市浦东新区九上12月月考', '2', '9', '1', 'paper/05022049431898076.doc', 'vkjt1908', '2020-05-02 20:49:43');
INSERT INTO `paper` VALUES ('1074', '2015-2016年上海市松江区六上期末', '2', '6', '1', 'paper/05022050275273938.doc', 'vkjt1908', '2020-05-02 20:50:27');
INSERT INTO `paper` VALUES ('1076', '2017-2018学年松江二中高二上英语期末考试', '3', '11', '1', 'paper/05022050585924991.docx', 'oqrj1908', '2020-05-02 20:50:58');
INSERT INTO `paper` VALUES ('1077', '2017-2018学年向明中学高一上英语期末', '3', '10', '1', 'paper/05022051269489359.docx', 'oqrj1908', '2020-05-02 20:51:26');
INSERT INTO `paper` VALUES ('1078', '2018-2019学年宝山中学高三上英语期中', '3', '12', '1', 'paper/05022051476529194.docx', 'oqrj1908', '2020-05-02 20:51:47');
INSERT INTO `paper` VALUES ('1079', '2016-2017年上海市闵行区九校联考七上期末', '2', '7', '1', 'paper/05022051566019015.doc', 'vkjt1908', '2020-05-02 20:51:56');
INSERT INTO `paper` VALUES ('1080', '2018-2019学年曹杨二中高一上英语12月月考', '3', '10', '1', 'paper/05022052087069630.docx', 'oqrj1908', '2020-05-02 20:52:08');
INSERT INTO `paper` VALUES ('1081', '2018-2019学年崇明中学高二上12月月考', '3', '11', '1', 'paper/05022053101368075.docx', 'oqrj1908', '2020-05-02 20:53:10');
INSERT INTO `paper` VALUES ('1082', '2016-2017年上海市华育中学八上期末', '2', '8', '1', 'paper/05022053361897133.doc', 'vkjt1908', '2020-05-02 20:53:36');
INSERT INTO `paper` VALUES ('1083', '2018-2019学年大同中学高二上英语二次月考', '3', '11', '1', 'paper/05022054099927799.docx', 'oqrj1908', '2020-05-02 20:54:09');
INSERT INTO `paper` VALUES ('1084', '2016-2017年上海市浦东新区第三教育署九上12月月考', '2', '8', '1', 'paper/05022054104627401.docx', 'vkjt1908', '2020-05-02 20:54:10');
INSERT INTO `paper` VALUES ('1085', '2018-2019学年高三iread_试卷3', '3', '12', '1', 'paper/05022054314141821.docx', 'oqrj1908', '2020-05-02 20:54:31');
INSERT INTO `paper` VALUES ('1086', '2018-2019学年高三iread_试卷4', '3', '12', '1', 'paper/05022054493608558.docx', 'oqrj1908', '2020-05-02 20:54:49');
INSERT INTO `paper` VALUES ('1087', '2018-2019学年高三iread_试卷5', '3', '12', '1', 'paper/05022055125597782.docx', 'oqrj1908', '2020-05-02 20:55:12');
INSERT INTO `paper` VALUES ('1088', '2016-2017年上海市玉华中学六上期末', '2', '6', '1', 'paper/05022055156928910.doc', 'vkjt1908', '2020-05-02 20:55:15');
INSERT INTO `paper` VALUES ('1089', '2018-2019学年高三iread试卷1', '3', '12', '1', 'paper/05022055437300330.docx', 'oqrj1908', '2020-05-02 20:55:43');
INSERT INTO `paper` VALUES ('1090', '2016-2017年上海市玉华中学七上期末', '2', '7', '1', 'paper/05022055513394643.doc', 'vkjt1908', '2020-05-02 20:55:51');
INSERT INTO `paper` VALUES ('1091', '2018-2019学年高三iread试卷2', '3', '12', '1', 'paper/05022056105083227.docx', 'oqrj1908', '2020-05-02 20:56:10');
INSERT INTO `paper` VALUES ('1092', '2018-2019学年高三iread试卷6', '3', '12', '1', 'paper/05022056392048287.docx', 'oqrj1908', '2020-05-02 20:56:39');
INSERT INTO `paper` VALUES ('1093', '2017-2018年上海市华二初级六上第十四周随堂检测（11.29）', '2', '6', '1', 'paper/05022056463725968.docx', 'vkjt1908', '2020-05-02 20:56:46');
INSERT INTO `paper` VALUES ('1094', '2018-2019学年黄浦区高三七校联考', '3', '12', '1', 'paper/05022057105718420.docx', 'oqrj1908', '2020-05-02 20:57:10');
INSERT INTO `paper` VALUES ('1095', '2018-2019学年嘉定二中高一上12月月考', '3', '10', '1', 'paper/05022057322231140.docx', 'oqrj1908', '2020-05-02 20:57:32');
INSERT INTO `paper` VALUES ('1096', '2018-2019学年交大附中高一上英语期中', '3', '10', '1', 'paper/05022058008460490.docx', 'oqrj1908', '2020-05-02 20:58:00');
INSERT INTO `paper` VALUES ('1097', '2018-2019学年七宝中学高三上英语11月周练卷', '3', '12', '1', 'paper/05022058249234149.docx', 'oqrj1908', '2020-05-02 20:58:24');
INSERT INTO `paper` VALUES ('1098', '2018-2019学年市北中学高三上英语二次月考', '3', '12', '1', 'paper/05022058595766951.docx', 'oqrj1908', '2020-05-02 20:58:59');
INSERT INTO `paper` VALUES ('1099', '2018-2019学年市西中学高三上英语期中', '3', '12', '1', 'paper/05022059249144396.docx', 'oqrj1908', '2020-05-02 20:59:24');
INSERT INTO `paper` VALUES ('1100', '2018-2019学年同济附一中高一上英语期中', '3', '10', '1', 'paper/05022100025928883.docx', 'oqrj1908', '2020-05-02 21:00:02');
INSERT INTO `paper` VALUES ('1101', '2018-2019学年位育中学高三上英语周测', '3', '12', '1', 'paper/05022100322308866.docx', 'oqrj1908', '2020-05-02 21:00:32');
INSERT INTO `paper` VALUES ('1102', '2018-2019学年向明中学高一上英语期中', '3', '10', '1', 'paper/05022101034172558.docx', 'oqrj1908', '2020-05-02 21:01:03');
INSERT INTO `paper` VALUES ('1103', '2018-2019学年延安中学高三上英语期中', '3', '12', '1', 'paper/05022101304855861.docx', 'oqrj1908', '2020-05-02 21:01:30');
INSERT INTO `paper` VALUES ('1104', '2018-2019学年延安中学高一上英语期中', '3', '10', '1', 'paper/05022102002462369.docx', 'oqrj1908', '2020-05-02 21:02:00');
INSERT INTO `paper` VALUES ('1105', '2017-2018年上海市华二初级六上第十三周周末作业（11.24）', '2', '6', '1', 'paper/05022102126578137.docx', 'vkjt1908', '2020-05-02 21:02:12');
INSERT INTO `paper` VALUES ('1106', '2018-2019学年宜川中学高三上英语12月月考', '3', '12', '1', 'paper/05022102407417103.docx', 'oqrj1908', '2020-05-02 21:02:40');
INSERT INTO `paper` VALUES ('1108', '2018-2019学年宜川中学高三上英语期中', '3', '12', '1', 'paper/05022103102253541.docx', 'oqrj1908', '2020-05-02 21:03:10');
INSERT INTO `paper` VALUES ('1110', '2019届宝山区高三英语一模', '3', '12', '1', 'paper/05022103372614594.docx', 'oqrj1908', '2020-05-02 21:03:37');
INSERT INTO `paper` VALUES ('1111', '2019届崇明区高三英语一模', '3', '12', '1', 'paper/05022104053684025.docx', 'oqrj1908', '2020-05-02 21:04:05');
INSERT INTO `paper` VALUES ('1112', '2019届奉贤区高三英语一模', '3', '12', '1', 'paper/05022104311945707.doc', 'oqrj1908', '2020-05-02 21:04:31');
INSERT INTO `paper` VALUES ('1113', '2017-2018年上海市浦东新区第四教育署六上12月月考', '2', '6', '1', 'paper/05022104321851375.doc', 'vkjt1908', '2020-05-02 21:04:32');
INSERT INTO `paper` VALUES ('1114', '2019届虹口区高三英语一模', '3', '12', '1', 'paper/05022105184012362.docx', 'oqrj1908', '2020-05-02 21:05:18');
INSERT INTO `paper` VALUES ('1115', '2019届黄浦区高三英语一模', '3', '12', '1', 'paper/05022105589457444.docx', 'oqrj1908', '2020-05-02 21:05:58');
INSERT INTO `paper` VALUES ('1116', '2017-2018年上海市浦东新区第四教育署九上12月月考', '2', '9', '1', 'paper/05022106142701038.doc', 'vkjt1908', '2020-05-02 21:06:14');
INSERT INTO `paper` VALUES ('1117', '2017-2018年上海市浦东新区第四教育署八上12月月考', '2', '8', '1', 'paper/05022106596248975.doc', 'vkjt1908', '2020-05-02 21:06:59');
INSERT INTO `paper` VALUES ('1118', '2019届嘉定区高三英语一模', '3', '12', '1', 'paper/05022107035647981.docx', 'oqrj1908', '2020-05-02 21:07:03');
INSERT INTO `paper` VALUES ('1119', '2019届金山区高三英语一模', '3', '12', '1', 'paper/05022107354536813.docx', 'oqrj1908', '2020-05-02 21:07:35');
INSERT INTO `paper` VALUES ('1120', '2017-2018年上海市新华初九上12月月考', '2', '9', '1', 'paper/05022107366763036.docx', 'vkjt1908', '2020-05-02 21:07:36');
INSERT INTO `paper` VALUES ('1121', '2019届静安区高三英语一模', '3', '12', '1', 'paper/05022108175393997.docx', 'oqrj1908', '2020-05-02 21:08:17');
INSERT INTO `paper` VALUES ('1122', '2019届闵行区高三英语一模', '3', '12', '1', 'paper/05022108502477783.doc', 'oqrj1908', '2020-05-02 21:08:50');
INSERT INTO `paper` VALUES ('1123', '2019届浦东新区高三英语一模', '3', '12', '1', 'paper/05022109191201946.docx', 'oqrj1908', '2020-05-02 21:09:19');
INSERT INTO `paper` VALUES ('1124', '2019届普陀区高三英语一模', '3', '12', '1', 'paper/05022109561587303.docx', 'oqrj1908', '2020-05-02 21:09:56');
INSERT INTO `paper` VALUES ('1125', '2019届青浦区高三英语一模', '3', '12', '1', 'paper/05022110272178860.docx', 'oqrj1908', '2020-05-02 21:10:27');
INSERT INTO `paper` VALUES ('1126', '2019届徐汇区高三英语一模', '3', '12', '1', 'paper/05022110491618400.docx', 'oqrj1908', '2020-05-02 21:10:49');
INSERT INTO `paper` VALUES ('1127', '2019届徐汇区高三英语一模', '3', '12', '1', 'paper/05022111143926627.docx', 'oqrj1908', '2020-05-02 21:11:14');
INSERT INTO `paper` VALUES ('1128', '2019届杨浦区高三英语一模', '3', '12', '1', 'paper/05022111497165401.docx', 'oqrj1908', '2020-05-02 21:11:49');
INSERT INTO `paper` VALUES ('1129', '2019届长宁区高三英语一模', '3', '12', '1', 'paper/05022112269805542.docx', 'oqrj1908', '2020-05-02 21:12:26');
INSERT INTO `paper` VALUES ('1130', '2019年新增词汇', '3', '12', '1', 'paper/05022112508445837.docx', 'oqrj1908', '2020-05-02 21:12:50');
INSERT INTO `paper` VALUES ('1131', '概要写作-逻辑关系词', '3', '12', '1', 'paper/05022113199582318.docx', 'oqrj1908', '2020-05-02 21:13:19');
INSERT INTO `paper` VALUES ('1132', '概要写作-同义替换词', '3', '12', '1', 'paper/05022113448029818.docx', 'oqrj1908', '2020-05-02 21:13:44');
INSERT INTO `paper` VALUES ('1133', '重点词汇--2019届黄浦区高三英语一模', '3', '12', '1', 'paper/05022114076919619.docx', 'oqrj1908', '2020-05-02 21:14:07');
INSERT INTO `paper` VALUES ('1134', '重点词汇--2019届普陀区高三英语一模', '3', '12', '1', 'paper/05022114289627489.docx', 'oqrj1908', '2020-05-02 21:14:28');
INSERT INTO `paper` VALUES ('1135', '2017-2018年宝山中学高一上英语期中考试', '3', '10', '1', 'paper/05022117277209266.doc', 'oqrj1908', '2020-05-02 21:17:27');
INSERT INTO `paper` VALUES ('1136', '2017-2018上海市延安中学高二上英语期中考试', '3', '11', '1', 'paper/05022118015839630.docx', 'oqrj1908', '2020-05-02 21:18:01');
INSERT INTO `paper` VALUES ('1137', '2017-2018学年虹口高级中学高一上期中考试', '3', '10', '1', 'paper/05022118329382031.docx', 'oqrj1908', '2020-05-02 21:18:32');
INSERT INTO `paper` VALUES ('1138', '2017-2018学年晋元高级中学高二上期中考试', '3', '11', '1', 'paper/05022118574736865.docx', 'oqrj1908', '2020-05-02 21:18:57');
INSERT INTO `paper` VALUES ('1139', '2017-2018学年向明中学高一上英语期中考试', '3', '10', '1', 'paper/05022119373047406.docx', 'oqrj1908', '2020-05-02 21:19:37');
INSERT INTO `paper` VALUES ('1140', '2018-2019吴淞中学高二上英语期中', '3', '11', '1', 'paper/05022120053711365.docx', 'oqrj1908', '2020-05-02 21:20:05');
INSERT INTO `paper` VALUES ('1141', '2018-2019学年北虹高级中学高一上英语单元测试', '3', '10', '1', 'paper/05022120477459288.docx', 'oqrj1908', '2020-05-02 21:20:47');
INSERT INTO `paper` VALUES ('1142', '2018-2019学年曹杨二中高二上英语期中', '3', '11', '1', 'paper/05022121151572036.docx', 'oqrj1908', '2020-05-02 21:21:15');
INSERT INTO `paper` VALUES ('1143', '2018-2019学年曹杨二中高三上英语期中', '3', '12', '1', 'paper/05022121424943001.docx', 'oqrj1908', '2020-05-02 21:21:42');
INSERT INTO `paper` VALUES ('1144', '2018-2019学年曹杨二中高一上英语期中', '3', '10', '1', 'paper/05022122036602638.docx', 'oqrj1908', '2020-05-02 21:22:03');
INSERT INTO `paper` VALUES ('1145', '2018-2019学年崇明中学高二上英语期中', '3', '11', '1', 'paper/05022122279706428.docx', 'oqrj1908', '2020-05-02 21:22:27');
INSERT INTO `paper` VALUES ('1146', '2018-2019学年大同高一上英语第一次月考', '3', '10', '1', 'paper/05022122484988114.docx', 'oqrj1908', '2020-05-02 21:22:48');
INSERT INTO `paper` VALUES ('1147', '2018-2019学年复旦附中高二上英语期中', '3', '11', '1', 'paper/05022123169903070.docx', 'oqrj1908', '2020-05-02 21:23:16');
INSERT INTO `paper` VALUES ('1148', '2018-2019学年复旦附中高三上英语10月周练', '3', '12', '1', 'paper/05022124018842463.docx', 'oqrj1908', '2020-05-02 21:24:01');
INSERT INTO `paper` VALUES ('1150', '2018-2019学年复旦附中高三上英语期中', '3', '12', '1', 'paper/05022126265298960.doc', 'oqrj1908', '2020-05-02 21:26:26');
INSERT INTO `paper` VALUES ('1151', '2018-2019学年复兴高一上期中英语考试', '3', '10', '1', 'paper/05022127173313619.docx', 'oqrj1908', '2020-05-02 21:27:17');
INSERT INTO `paper` VALUES ('1152', '2018-2019学年复兴中学高三上英语期中', '3', '12', '1', 'paper/05022127385864569.docx', 'oqrj1908', '2020-05-02 21:27:38');
INSERT INTO `paper` VALUES ('1153', '2018-2019学年高桥中学高二上英语10月考试', '3', '11', '1', 'paper/05022127566304114.docx', 'oqrj1908', '2020-05-02 21:27:56');
INSERT INTO `paper` VALUES ('1154', '2018-2019学年光明中学高三上周练', '3', '12', '1', 'paper/05022128168445496.docx', 'oqrj1908', '2020-05-02 21:28:16');
INSERT INTO `paper` VALUES ('1155', '2018-2019学年行知中学高三上英语期中', '3', '12', '1', 'paper/05022128373146179.docx', 'oqrj1908', '2020-05-02 21:28:37');
INSERT INTO `paper` VALUES ('1156', '2018-2019学年行知中学高一上10月考试', '3', '10', '1', 'paper/05022128561658522.docx', 'oqrj1908', '2020-05-02 21:28:56');
INSERT INTO `paper` VALUES ('1157', '2018-2019学年虹口高级中学高一上英语期中', '3', '10', '1', 'paper/05022129157892122.docx', 'oqrj1908', '2020-05-02 21:29:15');
INSERT INTO `paper` VALUES ('1158', '2018-2019学年嘉定二中高一上英语期中', '3', '10', '1', 'paper/05022129508449207.docx', 'oqrj1908', '2020-05-02 21:29:50');
INSERT INTO `paper` VALUES ('1159', '2018-2019学年嘉定一中高三上英语期中', '3', '12', '1', 'paper/05022130115062595.docx', 'oqrj1908', '2020-05-02 21:30:11');
INSERT INTO `paper` VALUES ('1160', '2018-2019学年嘉定一中和青浦高级中学高三上英语10月联考', '3', '12', '1', 'paper/05022130322756760.docx', 'oqrj1908', '2020-05-02 21:30:32');
INSERT INTO `paper` VALUES ('1161', '2018-2019学年建平中学高二上英语期中', '3', '11', '1', 'paper/05022131001743009.docx', 'oqrj1908', '2020-05-02 21:31:00');
INSERT INTO `paper` VALUES ('1162', '2018-2019学年建平中学高三上10月月考', '3', '12', '1', 'paper/05022131321405928.docx', 'oqrj1908', '2020-05-02 21:31:32');
INSERT INTO `paper` VALUES ('1163', '2018-2019学年建平中学高三上英语期中考试', '3', '12', '1', 'paper/05022131571055331.docx', 'oqrj1908', '2020-05-02 21:31:57');
INSERT INTO `paper` VALUES ('1164', '上海市西延安中学2020届九年级阶段测试数学试题', '2', '9', '2', 'paper/05022132137497276.doc', 'vkjt1908', '2020-05-02 21:32:13');
INSERT INTO `paper` VALUES ('1165', '2018-2019学年建平中学高三上英语周考', '3', '12', '1', 'paper/05022132265795022.docx', 'oqrj1908', '2020-05-02 21:32:26');
INSERT INTO `paper` VALUES ('1166', '上海市西延安中学2020届九年级阶段测试数学试题自测答题纸', '2', '9', '2', 'paper/05022132525163933.doc', 'vkjt1908', '2020-05-02 21:32:52');
INSERT INTO `paper` VALUES ('1167', '2018-2019学年进才中学高三上英语期中1', '3', '12', '1', 'paper/05022133021386673.docx', 'oqrj1908', '2020-05-02 21:33:02');
INSERT INTO `paper` VALUES ('1168', '2018-2019学年浦东新区高二上英语期中', '3', '11', '1', 'paper/05022133237927499.docx', 'oqrj1908', '2020-05-02 21:33:23');
INSERT INTO `paper` VALUES ('1169', '2018-2019学年浦东新区高三上英语期中考试', '3', '12', '1', 'paper/05022133443207645.docx', 'oqrj1908', '2020-05-02 21:33:44');
INSERT INTO `paper` VALUES ('1170', '2018-2019学年浦东新区高一上英语期中', '3', '10', '1', 'paper/05022134042677114.docx', 'oqrj1908', '2020-05-02 21:34:04');
INSERT INTO `paper` VALUES ('1171', '2018-2019学年浦外高三上英语周练', '3', '12', '1', 'paper/05022134275965851.docx', 'oqrj1908', '2020-05-02 21:34:27');
INSERT INTO `paper` VALUES ('1172', '2019-2020学年上海初三数学竞赛 几何变换（含答案）', '2', '9', '2', 'paper/05022134346796157.doc', 'vkjt1908', '2020-05-02 21:34:34');
INSERT INTO `paper` VALUES ('1173', '2018-2019学年七宝中学高三上英语期中考试', '3', '12', '1', 'paper/05022134482135620.docx', 'oqrj1908', '2020-05-02 21:34:48');
INSERT INTO `paper` VALUES ('1174', '2018-2019学年七宝中学高一上英语10月考试', '3', '10', '1', 'paper/05022135082956055.docx', 'oqrj1908', '2020-05-02 21:35:08');
INSERT INTO `paper` VALUES ('1175', '2018-2019学年上海中学高三上英语期中', '3', '12', '1', 'paper/05022135453130211.docx', 'oqrj1908', '2020-05-02 21:35:45');
INSERT INTO `paper` VALUES ('1176', '2018-2019学年上师大附中高二上英语期中', '3', '11', '1', 'paper/05022136102635417.docx', 'oqrj1908', '2020-05-02 21:36:10');
INSERT INTO `paper` VALUES ('1177', '2018-2019学年上师大附中高三上英语期中', '3', '12', '1', 'paper/05022136332498920.docx', 'oqrj1908', '2020-05-02 21:36:33');
INSERT INTO `paper` VALUES ('1178', '2018-2019学年上外附中（闵行分校）高三上英语期中', '3', '12', '1', 'paper/05022136529796881.docx', 'oqrj1908', '2020-05-02 21:36:52');
INSERT INTO `paper` VALUES ('1179', '2018-2019学年十四校高三英语联考', '3', '12', '1', 'paper/05022137226753097.docx', 'oqrj1908', '2020-05-02 21:37:22');
INSERT INTO `paper` VALUES ('1180', '2018-2019学年市西中学高一上英语期中', '3', '10', '1', 'paper/05022137477302872.docx', 'oqrj1908', '2020-05-02 21:37:47');
INSERT INTO `paper` VALUES ('1181', '2018-2019学年松江二中高三上英语期中', '3', '12', '1', 'paper/05022138207065982.docx', 'oqrj1908', '2020-05-02 21:38:20');
INSERT INTO `paper` VALUES ('1182', '2018-2019学年西南模范高三上英语期中', '3', '12', '1', 'paper/05022138487867913.docx', 'oqrj1908', '2020-05-02 21:38:48');
INSERT INTO `paper` VALUES ('1183', '2018-2019学年西南位育高一上英语期中', '3', '10', '1', 'paper/05022139192617212.docx', 'oqrj1908', '2020-05-02 21:39:19');
INSERT INTO `paper` VALUES ('1184', '2018-2019学年西南位育高一上英语周练', '3', '10', '1', 'paper/05022139396082121.docx', 'oqrj1908', '2020-05-02 21:39:39');
INSERT INTO `paper` VALUES ('1185', '2018-2019学年向明中学高三上英语期中', '3', '12', '1', 'paper/05022140041112421.docx', 'oqrj1908', '2020-05-02 21:40:04');
INSERT INTO `paper` VALUES ('1186', '2018-2019学年新北郊高一上英语期中考试', '3', '10', '1', 'paper/05022140263956186.docx', 'oqrj1908', '2020-05-02 21:40:26');
INSERT INTO `paper` VALUES ('1187', '2018-2019学年杨浦区高三上英语期中考试', '3', '12', '1', 'paper/05022140516952632.docx', 'oqrj1908', '2020-05-02 21:40:51');
INSERT INTO `paper` VALUES ('1188', '2018-2019学年宜川中学高三上英语第一次月考', '3', '12', '1', 'paper/05022141129320977.docx', 'oqrj1908', '2020-05-02 21:41:12');
INSERT INTO `paper` VALUES ('1189', '2015-2016年上海市静安区七上期末复习', '2', '7', '1', 'paper/05022142145360601.doc', 'vkjt1908', '2020-05-02 21:42:14');
INSERT INTO `paper` VALUES ('1190', '2015-2016年上海市闵行区九校联考七上期末', '2', '7', '1', 'paper/05022142383566642.doc', 'vkjt1908', '2020-05-02 21:42:38');
INSERT INTO `paper` VALUES ('1191', '2015-2016年上海市徐汇区八上期末', '2', '8', '1', 'paper/05022143186085797.doc', 'vkjt1908', '2020-05-02 21:43:18');
INSERT INTO `paper` VALUES ('1192', '2016-2017年上海市桃李园实验学校七上第二次月考模拟', '2', '7', '1', 'paper/05022143527320186.doc', 'vkjt1908', '2020-05-02 21:43:52');
INSERT INTO `paper` VALUES ('1193', '2017-2018年上海市华二初级六上第十六周随堂检测（12.13）', '2', '6', '1', 'paper/05022144173242977.docx', 'vkjt1908', '2020-05-02 21:44:17');
INSERT INTO `paper` VALUES ('1194', '2017-2018年上海市浦东新区第四教育署七上12月月考', '2', '7', '1', 'paper/05022144563675358.doc', 'vkjt1908', '2020-05-02 21:44:56');
INSERT INTO `paper` VALUES ('1195', '2017-2018年上海市松江区九上12月月考', '2', '9', '1', 'paper/05022145405270563.doc', 'vkjt1908', '2020-05-02 21:45:40');
INSERT INTO `paper` VALUES ('1196', '2016-2017年上海市华育中学八上期末', '2', '8', '1', 'paper/05022146382531754.doc', 'vkjt1908', '2020-05-02 21:46:38');
INSERT INTO `paper` VALUES ('1197', '2017-2018年上海市浦东新区第四教育署八上12月月考', '2', '8', '1', 'paper/05022147043145758.doc', 'vkjt1908', '2020-05-02 21:47:04');
INSERT INTO `paper` VALUES ('1198', '宝山区2013学年第一学期期末八年级数学参考答案', '2', '8', '1', 'paper/05022147338060456.doc', 'vkjt1908', '2020-05-02 21:47:33');
INSERT INTO `paper` VALUES ('1199', '宝山区2013学年第一学期期末考试八年级数学试卷', '2', '8', '1', 'paper/05022148144500247.doc', 'vkjt1908', '2020-05-02 21:48:14');
INSERT INTO `paper` VALUES ('1200', '2016-2017学年南洋模范高三上英语期中考试', '3', '12', '1', 'paper/05022148285015422.docx', 'oqrj1908', '2020-05-02 21:48:28');
INSERT INTO `paper` VALUES ('1201', '2017-2018青浦高级中学高一上英语期中考试', '3', '10', '1', 'paper/05022148461917219.docx', 'oqrj1908', '2020-05-02 21:48:46');
INSERT INTO `paper` VALUES ('1202', '浦东区初二数学期末', '2', '8', '1', 'paper/05022148471295161.doc', 'vkjt1908', '2020-05-02 21:48:47');
INSERT INTO `paper` VALUES ('1203', '2017-2018上海市莘庄中学高一10月英语考试', '3', '10', '1', 'paper/05022149061481608.docx', 'oqrj1908', '2020-05-02 21:49:06');
INSERT INTO `paper` VALUES ('1204', '浦东区初二数学期末答案', '2', '8', '1', 'paper/05022149075977967.doc', 'vkjt1908', '2020-05-02 21:49:07');
INSERT INTO `paper` VALUES ('1205', '2017-2018学年青浦高级中学高三上英语10月考试', '3', '12', '1', 'paper/05022149302114816.docx', 'oqrj1908', '2020-05-02 21:49:30');
INSERT INTO `paper` VALUES ('1206', '普陀区2013学年度第一学期初中八年级期末质量调研数学试卷（定稿）2013.1', '2', '8', '1', 'paper/05022149399371242.doc', 'vkjt1908', '2020-05-02 21:49:39');
INSERT INTO `paper` VALUES ('1207', '2017-2018学年上海市浦东高一上英语10月考试', '3', '10', '1', 'paper/05022149502715634.docx', 'oqrj1908', '2020-05-02 21:49:50');
INSERT INTO `paper` VALUES ('1208', '普陀区2013学年度第一学期初中八年级期末质量调研数学试卷参考答案(定稿）', '2', '8', '1', 'paper/05022150062562113.doc', 'vkjt1908', '2020-05-02 21:50:06');
INSERT INTO `paper` VALUES ('1209', '2017-2018学年新北郊高级中学高一语法练习--定语从句', '3', '10', '1', 'paper/05022150097620154.docx', 'oqrj1908', '2020-05-02 21:50:09');
INSERT INTO `paper` VALUES ('1210', '2018-2019学年安亭中学高一上英语第一次月考', '3', '10', '1', 'paper/05022150287310822.docx', 'oqrj1908', '2020-05-02 21:50:28');
INSERT INTO `paper` VALUES ('1211', '杨浦区八年级期末考试2014.1', '2', '8', '1', 'paper/05022150334884223.doc', 'vkjt1908', '2020-05-02 21:50:33');
INSERT INTO `paper` VALUES ('1212', '2018-2019学年复旦附中高三上英语9月考试', '3', '12', '1', 'paper/05022150478709738.docx', 'oqrj1908', '2020-05-02 21:50:47');
INSERT INTO `paper` VALUES ('1213', '长宁区初二数学2014年1月期末考试试卷', '2', '8', '1', 'paper/05022150589695660.doc', 'vkjt1908', '2020-05-02 21:50:58');
INSERT INTO `paper` VALUES ('1214', '2018-2019学年复旦附中高一上英语单元测试', '3', '10', '1', 'paper/05022151061791562.docx', 'oqrj1908', '2020-05-02 21:51:06');
INSERT INTO `paper` VALUES ('1215', '长宁区初二数学2014年1月期末考试试卷答案', '2', '8', '1', 'paper/05022151242837550.doc', 'vkjt1908', '2020-05-02 21:51:24');
INSERT INTO `paper` VALUES ('1216', '2018-2019学年复附浦东分校高二上（大学英语）周考', '3', '11', '1', 'paper/05022151267758930.docx', 'oqrj1908', '2020-05-02 21:51:26');
INSERT INTO `paper` VALUES ('1217', '2018-2019学年行知中学高三上英语第一次月考', '3', '12', '1', 'paper/05022151477762931.docx', 'oqrj1908', '2020-05-02 21:51:47');
INSERT INTO `paper` VALUES ('1218', '2018-2019学年虹口高级中学高一上语法（定语从句100题）_', '3', '10', '1', 'paper/05022152074889032.docx', 'oqrj1908', '2020-05-02 21:52:07');
INSERT INTO `paper` VALUES ('1219', '2016-2017年上海市玉华中学七上期末', '2', '7', '1', 'paper/05022152218511222.doc', 'vkjt1908', '2020-05-02 21:52:21');
INSERT INTO `paper` VALUES ('1220', '2018-2019学年华师大三附中高三上英语10月月考', '3', '12', '1', 'paper/05022152275697265.docx', 'oqrj1908', '2020-05-02 21:52:27');
INSERT INTO `paper` VALUES ('1221', '2017学年第一学期七年级数学期末复习卷（十六）', '2', '7', '1', 'paper/05022152599348259.doc', 'vkjt1908', '2020-05-02 21:52:59');
INSERT INTO `paper` VALUES ('1222', '闸北区七年级数学期末试卷（答案）2014.1', '2', '7', '1', 'paper/05022153197839562.doc', 'vkjt1908', '2020-05-02 21:53:19');
INSERT INTO `paper` VALUES ('1223', '闸北区七年级数学期末试卷（正卷）2014.1', '2', '7', '1', 'paper/05022153442491739.doc', 'vkjt1908', '2020-05-02 21:53:44');
INSERT INTO `paper` VALUES ('1224', '2018-2019学年嘉定二中一上英语第一次月考', '3', '10', '1', 'paper/05022153446085728.docx', 'oqrj1908', '2020-05-02 21:53:44');
INSERT INTO `paper` VALUES ('1225', '2018-2019学年嘉定一中高三上英语第一次月考', '3', '12', '1', 'paper/05022154165328550.docx', 'oqrj1908', '2020-05-02 21:54:16');
INSERT INTO `paper` VALUES ('1226', '2014学年第一学期七年级数学期末试卷', '2', '7', '1', 'paper/05022154331080717.doc', 'vkjt1908', '2020-05-02 21:54:33');
INSERT INTO `paper` VALUES ('1227', '2014学年普陀区第一学期七年级数学期末考试试卷和答案（定稿）', '2', '7', '1', 'paper/05022155007440851.doc', 'vkjt1908', '2020-05-02 21:55:00');
INSERT INTO `paper` VALUES ('1228', '2018-2019学年建平英语高三上英语周练', '3', '12', '1', 'paper/05022155085520876.docx', 'oqrj1908', '2020-05-02 21:55:08');
INSERT INTO `paper` VALUES ('1229', '2016学年第一学期七年级数学期中复习卷三', '2', '7', '1', 'paper/05022155262712410.doc', 'vkjt1908', '2020-05-02 21:55:26');
INSERT INTO `paper` VALUES ('1230', '2016学年第一学期七年级数学期终复习综合卷（二）及答案', '2', '7', '1', 'paper/05022155474856675.doc', 'vkjt1908', '2020-05-02 21:55:47');
INSERT INTO `paper` VALUES ('1231', '2016学年七年级第一学期数学期末复习卷一及答案', '2', '7', '1', 'paper/05022156169853481.doc', 'vkjt1908', '2020-05-02 21:56:16');
INSERT INTO `paper` VALUES ('1232', '2017学年第一学期七年级数学期末复习卷（七）', '2', '7', '1', 'paper/05022156411678917.doc', 'vkjt1908', '2020-05-02 21:56:41');
INSERT INTO `paper` VALUES ('1233', '2018-2019学年交大附中高二上英语第一次月考_', '3', '11', '1', 'paper/05022156565243798.docx', 'oqrj1908', '2020-05-02 21:56:56');
INSERT INTO `paper` VALUES ('1234', '普陀区2016学年第一学期七年级数学期末复习卷四及答案', '2', '7', '1', 'paper/05022157171547219.docx', 'vkjt1908', '2020-05-02 21:57:17');
INSERT INTO `paper` VALUES ('1235', '2018-2019学年交大附中高三英语摸底考', '3', '12', '1', 'paper/05022157208507899.docx', 'oqrj1908', '2020-05-02 21:57:20');
INSERT INTO `paper` VALUES ('1236', '2018-2019学年交大附中高一上英语10月考试', '3', '10', '1', 'paper/05022157437190897.docx', 'oqrj1908', '2020-05-02 21:57:43');
INSERT INTO `paper` VALUES ('1237', '2018-2019学年进才中学高三上英语第一次月考', '3', '12', '1', 'paper/05022158023437538.docx', 'oqrj1908', '2020-05-02 21:58:02');
INSERT INTO `paper` VALUES ('1238', '精锐教育2015初二第一学期期末模拟试卷 参考答案1', '2', '8', '1', 'paper/05022158215125597.doc', 'vkjt1908', '2020-05-02 21:58:21');
INSERT INTO `paper` VALUES ('1239', '2018-2019学年控江中学高二上英语10月阶段测试', '3', '11', '1', 'paper/05022158256352861.docx', 'oqrj1908', '2020-05-02 21:58:25');
INSERT INTO `paper` VALUES ('1240', '精锐教育2015初二第一学期期末模拟试卷 答题卡1', '2', '8', '1', 'paper/05022158464619385.doc', 'vkjt1908', '2020-05-02 21:58:46');
INSERT INTO `paper` VALUES ('1241', '2018-2019学年浦东上外附中高三上英语第三周周练', '3', '12', '1', 'paper/05022158519358000.docx', 'oqrj1908', '2020-05-02 21:58:51');
INSERT INTO `paper` VALUES ('1242', '2018-2019学年浦东外国语高三上英语10月月考', '3', '12', '1', 'paper/05022159107004400.docx', 'oqrj1908', '2020-05-02 21:59:10');
INSERT INTO `paper` VALUES ('1243', '精锐教育2015初二第一学期期末模拟试卷1', '2', '8', '1', 'paper/05022159138520904.docx', 'vkjt1908', '2020-05-02 21:59:13');
INSERT INTO `paper` VALUES ('1244', '2018-2019学年浦东外国语高三上英语周练二', '3', '12', '1', 'paper/05022159292445059.docx', 'oqrj1908', '2020-05-02 21:59:29');
INSERT INTO `paper` VALUES ('1245', '2018-2019学年上海交大附中高一语法（时态和语态）（嘉定分校)', '3', '10', '1', 'paper/05022159495246159.docx', 'oqrj1908', '2020-05-02 21:59:49');
INSERT INTO `paper` VALUES ('1246', '精锐教育2015初二第一学期期末模拟试卷 参考答案2', '2', '8', '1', 'paper/05022159515820765.doc', 'vkjt1908', '2020-05-02 21:59:51');
INSERT INTO `paper` VALUES ('1247', '精锐教育2015初二第一学期期末模拟试卷 答题卡2', '2', '8', '1', 'paper/05022200146266189.doc', 'vkjt1908', '2020-05-02 22:00:14');
INSERT INTO `paper` VALUES ('1248', '（1999年—2017年）上海市天原杯初中化学竞赛预赛试卷大全', '5', '9', '2', 'paper/05022200168865853.docx', 'fetj1908', '2020-05-02 22:00:16');
INSERT INTO `paper` VALUES ('1249', '2018-2019学年上南高三上英语10月测试', '3', '12', '1', 'paper/05022200179030096.docx', 'oqrj1908', '2020-05-02 22:00:17');
INSERT INTO `paper` VALUES ('1250', '精锐教育2015初二第一学期期末模拟试卷2', '2', '8', '1', 'paper/05022200343817990.doc', 'vkjt1908', '2020-05-02 22:00:34');
INSERT INTO `paper` VALUES ('1251', '2018-2019学年同济一附中高三上英语第一次月考', '3', '12', '1', 'paper/05022200401300007.docx', 'oqrj1908', '2020-05-02 22:00:40');
INSERT INTO `paper` VALUES ('1252', '2018-2019学年同济一附中高一上英语第一次月考', '3', '10', '1', 'paper/05022201031131231.docx', 'oqrj1908', '2020-05-02 22:01:03');
INSERT INTO `paper` VALUES ('1253', '2016学年川沙中学自招试卷及参考答案（word版）-川沙', '5', '9', '2', 'paper/05022201105890024.docx', 'fetj1908', '2020-05-02 22:01:10');
INSERT INTO `paper` VALUES ('1254', '精锐教育2015初三 二次函数单元测试卷    答题纸1', '2', '9', '1', 'paper/05022201175279701.doc', 'vkjt1908', '2020-05-02 22:01:17');
INSERT INTO `paper` VALUES ('1255', '2018-2019学年延安中学高三上第一次月考', '3', '12', '1', 'paper/05022201226670322.docx', 'oqrj1908', '2020-05-02 22:01:22');
INSERT INTO `paper` VALUES ('1256', '2018-2019学年洋泾中学高二上英语第一次月考', '3', '11', '1', 'paper/05022201413756866.docx', 'oqrj1908', '2020-05-02 22:01:41');
INSERT INTO `paper` VALUES ('1257', '精锐教育2015初三 二次函数单元测试卷  参考答案1', '2', '9', '1', 'paper/05022201415910819.doc', 'vkjt1908', '2020-05-02 22:01:41');
INSERT INTO `paper` VALUES ('1258', '2017年华育中学模拟自招考试卷（一）及答案-初三（word版）-上体馆校区.d', '5', '9', '2', 'paper/05022201482997172.docx', 'fetj1908', '2020-05-02 22:01:48');
INSERT INTO `paper` VALUES ('1259', '2017学年川沙中学自招试卷及参考答案（word版）-川沙', '5', '9', '2', 'paper/05022202197762003.docx', 'fetj1908', '2020-05-02 22:02:19');
INSERT INTO `paper` VALUES ('1260', '精锐教育2015初三 二次函数单元试卷1', '2', '9', '1', 'paper/05022202252080094.doc', 'vkjt1908', '2020-05-02 22:02:25');
INSERT INTO `paper` VALUES ('1261', '2017学年第二学期初三化学浦东四校自招考试卷(word版)', '5', '9', '2', 'paper/05022202479387643.docx', 'fetj1908', '2020-05-02 22:02:47');
INSERT INTO `paper` VALUES ('1262', '初三自招部分化学试题', '5', '9', '2', 'paper/05022203125312022.docx', 'fetj1908', '2020-05-02 22:03:12');
INSERT INTO `paper` VALUES ('1263', '上海重点高中自主招生化学试题', '5', '9', '2', 'paper/05022203362456207.docx', 'fetj1908', '2020-05-02 22:03:36');
INSERT INTO `paper` VALUES ('1264', '2016-2017学年金山中学高二下英语期中考试', '3', '11', '2', 'paper/05022203567250794.doc', 'oqrj1908', '2020-05-02 22:03:56');
INSERT INTO `paper` VALUES ('1265', '四校自招—化学计算卷(解析版）--宝山大华', '5', '9', '2', 'paper/05022204014757254.doc', 'fetj1908', '2020-05-02 22:04:01');
INSERT INTO `paper` VALUES ('1266', '精锐教育2015初三 二次函数单元试卷   参考答案2', '2', '9', '1', 'paper/05022204123754617.doc', 'vkjt1908', '2020-05-02 22:04:12');
INSERT INTO `paper` VALUES ('1267', '2017-2018学年曹杨二中高一下英语期中', '3', '10', '2', 'paper/05022204222591069.docx', 'oqrj1908', '2020-05-02 22:04:22');
INSERT INTO `paper` VALUES ('1268', '精锐教育2015初三 二次函数单元试卷   答题纸2', '2', '9', '1', 'paper/05022204346287546.doc', 'vkjt1908', '2020-05-02 22:04:34');
INSERT INTO `paper` VALUES ('1269', '四校自招模拟题（解析版）--宝山大华', '5', '9', '2', 'paper/05022204345738162.doc', 'fetj1908', '2020-05-02 22:04:34');
INSERT INTO `paper` VALUES ('1270', '2017-2018学年曹杨二中高一下英语期中考试（易错题检测）', '3', '10', '2', 'paper/05022204479439228.docx', 'oqrj1908', '2020-05-02 22:04:47');
INSERT INTO `paper` VALUES ('1271', '精锐教育2015初三 二次函数单元试卷2', '2', '9', '1', 'paper/05022204569971958.doc', 'vkjt1908', '2020-05-02 22:04:56');
INSERT INTO `paper` VALUES ('1272', '2017-2018学年封浜高中高一下英语期中考试', '3', '10', '2', 'paper/05022205066124736.doc', 'oqrj1908', '2020-05-02 22:05:06');
INSERT INTO `paper` VALUES ('1273', '预初、初一、初二白猫杯《化学与生活》竞赛资料', '5', '9', '2', 'paper/05022205183780940.docx', 'fetj1908', '2020-05-02 22:05:18');
INSERT INTO `paper` VALUES ('1274', '精锐教育2015初三期中模拟卷1   参考答案', '2', '9', '1', 'paper/05022205452338076.doc', 'vkjt1908', '2020-05-02 22:05:45');
INSERT INTO `paper` VALUES ('1275', '2017-2018学年交大附中高二下英语五月考试', '3', '11', '2', 'paper/05022206055130447.docx', 'oqrj1908', '2020-05-02 22:06:05');
INSERT INTO `paper` VALUES ('1276', '自招（化学试题）', '5', '9', '2', 'paper/05022206055401625.doc', 'fetj1908', '2020-05-02 22:06:05');
INSERT INTO `paper` VALUES ('1277', '精锐教育2015初三期中模拟卷1   答题卡', '2', '9', '1', 'paper/05022206062759267.doc', 'vkjt1908', '2020-05-02 22:06:06');
INSERT INTO `paper` VALUES ('1278', '精锐教育2015初三期中模拟卷1', '2', '9', '1', 'paper/05022206248817441.doc', 'vkjt1908', '2020-05-02 22:06:24');
INSERT INTO `paper` VALUES ('1279', '2017-2018学年复旦附中高一下英语期中考试', '3', '10', '2', 'paper/05022206266452600.docx', 'oqrj1908', '2020-05-02 22:06:26');
INSERT INTO `paper` VALUES ('1280', '2017-2018学年复旦中学高二下英语期中考试', '3', '11', '2', 'paper/05022206507147593.docx', 'oqrj1908', '2020-05-02 22:06:50');
INSERT INTO `paper` VALUES ('1281', '精锐教育2015初三期中模拟卷2   参考答案', '2', '9', '1', 'paper/05022206538608837.doc', 'vkjt1908', '2020-05-02 22:06:53');
INSERT INTO `paper` VALUES ('1282', '自招化学真题整理', '5', '9', '2', 'paper/05022206579848612.docx', 'fetj1908', '2020-05-02 22:06:57');
INSERT INTO `paper` VALUES ('1283', '精锐教育2015初三期中模拟卷2   答题卡', '2', '9', '1', 'paper/05022207107970330.doc', 'vkjt1908', '2020-05-02 22:07:10');
INSERT INTO `paper` VALUES ('1284', '2017-2018学年虹口区华一高一下英语期中', '3', '10', '2', 'paper/05022207117698603.docx', 'oqrj1908', '2020-05-02 22:07:11');
INSERT INTO `paper` VALUES ('1285', '自招模拟试题及参考答案（二）', '5', '9', '2', 'paper/05022207211065160.docx', 'fetj1908', '2020-05-02 22:07:21');
INSERT INTO `paper` VALUES ('1286', '2017-2018学年进才中学高二下英语期中考试', '3', '11', '2', 'paper/05022207311324505.docx', 'oqrj1908', '2020-05-02 22:07:31');
INSERT INTO `paper` VALUES ('1287', '精锐教育2015初三期中模拟卷2', '2', '9', '1', 'paper/05022207315166659.doc', 'vkjt1908', '2020-05-02 22:07:31');
INSERT INTO `paper` VALUES ('1288', '2017-2018学年控江中学高一下英语期中', '3', '10', '2', 'paper/05022207533030658.docx', 'oqrj1908', '2020-05-02 22:07:53');
INSERT INTO `paper` VALUES ('1289', '自招模拟试题及参考答案（一）', '5', '9', '2', 'paper/05022208082974256.docx', 'fetj1908', '2020-05-02 22:08:08');
INSERT INTO `paper` VALUES ('1290', '精锐教育2015初三圆单元测试卷   答题卡1', '2', '9', '1', 'paper/05022208097180593.doc', 'vkjt1908', '2020-05-02 22:08:09');
INSERT INTO `paper` VALUES ('1291', '2017-2018学年浦东新区高一下英语期中', '3', '10', '2', 'paper/05022208116496882.docx', 'oqrj1908', '2020-05-02 22:08:11');
INSERT INTO `paper` VALUES ('1292', '精锐教育2015初三圆单元测试卷  参考答案1', '2', '9', '1', 'paper/05022208287732858.doc', 'vkjt1908', '2020-05-02 22:08:28');
INSERT INTO `paper` VALUES ('1293', '2017-2018学年七宝中学高二下英语4月考试', '3', '11', '2', 'paper/05022208333756559.docx', 'oqrj1908', '2020-05-02 22:08:33');
INSERT INTO `paper` VALUES ('1294', '2017-2018学年七宝中学高三下英语五月第二次模拟考', '3', '12', '2', 'paper/05022208522458093.docx', 'oqrj1908', '2020-05-02 22:08:52');
INSERT INTO `paper` VALUES ('1295', '精锐教育2015初三圆单元测试卷1', '2', '9', '1', 'paper/05022209015784780.doc', 'vkjt1908', '2020-05-02 22:09:01');
INSERT INTO `paper` VALUES ('1296', '2017-2018学年七宝中学高三下英语五月第一次模拟考', '3', '12', '2', 'paper/05022209324908543.docx', 'oqrj1908', '2020-05-02 22:09:32');
INSERT INTO `paper` VALUES ('1297', '2017-2018学年青浦区高二下英语期中考试', '3', '11', '2', 'paper/05022209554763738.doc', 'oqrj1908', '2020-05-02 22:09:55');
INSERT INTO `paper` VALUES ('1298', '精锐教育2015初三圆单元测试卷  参考答案2', '2', '9', '1', 'paper/05022210082045556.doc', 'vkjt1908', '2020-05-02 22:10:08');
INSERT INTO `paper` VALUES ('1299', '精锐教育2015初三圆单元测试卷2', '2', '9', '1', 'paper/05022210329905566.doc', 'vkjt1908', '2020-05-02 22:10:32');
INSERT INTO `paper` VALUES ('1300', '精锐教育2015初三圆的单元测试卷   答题卡2', '2', '9', '1', 'paper/05022210512987044.doc', 'vkjt1908', '2020-05-02 22:10:51');
INSERT INTO `paper` VALUES ('1301', '2017-2018学年上外附中高二下英语五月考试', '3', '11', '2', 'paper/05022210532958967.docx', 'oqrj1908', '2020-05-02 22:10:53');
INSERT INTO `paper` VALUES ('1302', '2014-2015学年宝山区九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022210541074661.docx', 'fetj1908', '2020-05-02 22:10:54');
INSERT INTO `paper` VALUES ('1303', '2014-2015学年宝山区九上期中考化学试卷', '5', '9', '1', 'paper/05022211214817175.docx', 'fetj1908', '2020-05-02 22:11:21');
INSERT INTO `paper` VALUES ('1304', '2017-2018学年位育中学高二下英语期中', '3', '11', '2', 'paper/05022211288697575.docx', 'oqrj1908', '2020-05-02 22:11:28');
INSERT INTO `paper` VALUES ('1305', '精锐教育2015初一第一学期期末模拟试卷 参考答案', '2', '7', '1', 'paper/05022211456287278.doc', 'vkjt1908', '2020-05-02 22:11:45');
INSERT INTO `paper` VALUES ('1306', '2018-2019年晋元高中高二下英语期中', '3', '11', '2', 'paper/05022211473409068.doc', 'oqrj1908', '2020-05-02 22:11:47');
INSERT INTO `paper` VALUES ('1307', '精锐教育2015初一第一学期期末模拟试卷 答题卡', '2', '7', '1', 'paper/05022212093706752.doc', 'vkjt1908', '2020-05-02 22:12:09');
INSERT INTO `paper` VALUES ('1308', '2018-2019学年北虹高级中学高一下英语期中', '3', '10', '2', 'paper/05022212312378313.docx', 'oqrj1908', '2020-05-02 22:12:31');
INSERT INTO `paper` VALUES ('1309', '2015-2016学年宝山区九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022212355720741.docx', 'fetj1908', '2020-05-02 22:12:35');
INSERT INTO `paper` VALUES ('1310', '精锐教育2015初一第一学期期末模拟试卷', '2', '7', '1', 'paper/05022212397809850.doc', 'vkjt1908', '2020-05-02 22:12:39');
INSERT INTO `paper` VALUES ('1311', '2018-2019学年曹杨二中高二下英语期中', '3', '11', '2', 'paper/05022212538487423.doc', 'oqrj1908', '2020-05-02 22:12:53');
INSERT INTO `paper` VALUES ('1312', '精锐教育2015初一第一学期期末模拟试卷 答题卡', '2', '7', '1', 'paper/05022213054566885.doc', 'vkjt1908', '2020-05-02 22:13:05');
INSERT INTO `paper` VALUES ('1313', '2015-2016学年宝山区九上期中考化学试卷', '5', '9', '1', 'paper/05022213095197848.docx', 'fetj1908', '2020-05-02 22:13:09');
INSERT INTO `paper` VALUES ('1314', '2018-2019学年复旦附中高二下英语期中考试', '3', '11', '2', 'paper/05022213112661719.docx', 'oqrj1908', '2020-05-02 22:13:11');
INSERT INTO `paper` VALUES ('1315', '精锐教育七年级第一学期期末模拟试卷 答题卡', '2', '7', '1', 'paper/05022213297876229.doc', 'vkjt1908', '2020-05-02 22:13:29');
INSERT INTO `paper` VALUES ('1316', '2018-2019学年格致中学高二下英语期中', '3', '11', '2', 'paper/05022213305895494.docx', 'oqrj1908', '2020-05-02 22:13:30');
INSERT INTO `paper` VALUES ('1317', '2018-2019学年光明中学高一下英语期中', '3', '10', '2', 'paper/05022213567532133.docx', 'oqrj1908', '2020-05-02 22:13:56');
INSERT INTO `paper` VALUES ('1318', '2015-2016学年兰生复旦九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022213599380791.docx', 'fetj1908', '2020-05-02 22:13:59');
INSERT INTO `paper` VALUES ('1320', '2018-2019学年行知中学高一下英语期中考试(1)', '3', '10', '2', 'paper/05022214168477590.docx', 'oqrj1908', '2020-05-02 22:14:16');
INSERT INTO `paper` VALUES ('1321', '2015-2016学年兰生复旦九上期中考化学试卷', '5', '9', '1', 'paper/05022214286594725.docx', 'fetj1908', '2020-05-02 22:14:28');
INSERT INTO `paper` VALUES ('1322', '2018-2019学年建平中学高三下英语第一次月考', '3', '12', '2', 'paper/05022214365299392.docx', 'oqrj1908', '2020-05-02 22:14:36');
INSERT INTO `paper` VALUES ('1323', '2015-2016学年兰生复旦九上期中考化学试卷', '5', '9', '1', 'paper/05022215242163433.docx', 'fetj1908', '2020-05-02 22:15:24');
INSERT INTO `paper` VALUES ('1324', '2015-2016学年上宝中学九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022215587215291.docx', 'fetj1908', '2020-05-02 22:15:58');
INSERT INTO `paper` VALUES ('1325', '2015-2016学年上宝中学九上期中考化学试卷', '5', '9', '1', 'paper/05022216243486128.docx', 'fetj1908', '2020-05-02 22:16:24');
INSERT INTO `paper` VALUES ('1326', '2016-2017学年上宝中学九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022217091868615.docx', 'fetj1908', '2020-05-02 22:17:09');
INSERT INTO `paper` VALUES ('1327', '精锐教育2015预初第一学期期末模拟试卷 参考答案1', '2', '6', '1', 'paper/05022217231996607.doc', 'vkjt1908', '2020-05-02 22:17:23');
INSERT INTO `paper` VALUES ('1328', '2016-2017学年上宝中学九上期中考化学试卷', '5', '9', '1', 'paper/05022217376970939.docx', 'fetj1908', '2020-05-02 22:17:37');
INSERT INTO `paper` VALUES ('1329', '精锐教育2015预初第一学期期末模拟试卷 答题卡1', '2', '6', '1', 'paper/05022217447336453.doc', 'vkjt1908', '2020-05-02 22:17:44');
INSERT INTO `paper` VALUES ('1330', '精锐教育2015预初第一学期期末模拟试卷1', '2', '6', '1', 'paper/05022218051910294.doc', 'vkjt1908', '2020-05-02 22:18:05');
INSERT INTO `paper` VALUES ('1331', '2016-2017学年桃李园实验学校九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022218136073880.docx', 'fetj1908', '2020-05-02 22:18:13');
INSERT INTO `paper` VALUES ('1332', '精锐教育2015预初第一学期期末模拟试卷 参考答案2', '2', '6', '1', 'paper/05022218329697685.doc', 'vkjt1908', '2020-05-02 22:18:32');
INSERT INTO `paper` VALUES ('1333', '2016-2017学年桃李园实验学校九上第一次月考化学试卷', '5', '9', '1', 'paper/05022218403285445.docx', 'fetj1908', '2020-05-02 22:18:40');
INSERT INTO `paper` VALUES ('1334', '精锐教育2015预初第一学期期末模拟试卷 答题卡2(1)', '2', '6', '1', 'paper/05022218508255234.doc', 'vkjt1908', '2020-05-02 22:18:50');
INSERT INTO `paper` VALUES ('1335', '精锐教育2015预初第一学期期末模拟试卷2', '2', '6', '1', 'paper/05022219139686789.doc', 'vkjt1908', '2020-05-02 22:19:13');
INSERT INTO `paper` VALUES ('1336', '2017-2018学年宝山区九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022219144587577.docx', 'fetj1908', '2020-05-02 22:19:14');
INSERT INTO `paper` VALUES ('1337', '2017-2018学年宝山区九上期中考化学试卷', '5', '9', '1', 'paper/05022219444520607.docx', 'fetj1908', '2020-05-02 22:19:44');
INSERT INTO `paper` VALUES ('1338', '2017-2018学年格致中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022220273623016.docx', 'fetj1908', '2020-05-02 22:20:27');
INSERT INTO `paper` VALUES ('1339', '2017-2018学年格致中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022220591792184.docx', 'fetj1908', '2020-05-02 22:20:59');
INSERT INTO `paper` VALUES ('1340', '2017-2018学年光明中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022221394950601.docx', 'fetj1908', '2020-05-02 22:21:39');
INSERT INTO `paper` VALUES ('1341', '2017-2018学年光明中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022222053273412.docx', 'fetj1908', '2020-05-02 22:22:05');
INSERT INTO `paper` VALUES ('1342', '2017-2018学年和衷中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022222431914213.docx', 'fetj1908', '2020-05-02 22:22:43');
INSERT INTO `paper` VALUES ('1343', '2017-2018学年和衷中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022223143213483.docx', 'fetj1908', '2020-05-02 22:23:14');
INSERT INTO `paper` VALUES ('1344', '2017-2018学年华育中学九上阶段练习卷一(1)', '5', '9', '1', 'paper/05022223567325818.docx', 'fetj1908', '2020-05-02 22:23:56');
INSERT INTO `paper` VALUES ('1345', '2017-2018学年华育中学九上阶段练习卷一', '5', '9', '1', 'paper/05022224216904201.docx', 'fetj1908', '2020-05-02 22:24:21');
INSERT INTO `paper` VALUES ('1346', '2017-2018学年进才外国语中学九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022225335054419.docx', 'fetj1908', '2020-05-02 22:25:33');
INSERT INTO `paper` VALUES ('1347', '2017-2018学年进才外国语中学九上期中考化学试卷', '5', '9', '1', 'paper/05022225597051911.docx', 'fetj1908', '2020-05-02 22:25:59');
INSERT INTO `paper` VALUES ('1348', '2017-2018学年上宝中学九上9月补充卷(1)', '5', '9', '1', 'paper/05022226467752070.docx', 'fetj1908', '2020-05-02 22:26:46');
INSERT INTO `paper` VALUES ('1349', '2017-2018学年上宝中学九上9月补充卷', '5', '9', '1', 'paper/05022227126196660.docx', 'fetj1908', '2020-05-02 22:27:12');
INSERT INTO `paper` VALUES ('1350', '2017-2018学年上宝中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022228106083746.docx', 'fetj1908', '2020-05-02 22:28:10');
INSERT INTO `paper` VALUES ('1351', '2017-2018学年上宝中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022228349775450.docx', 'fetj1908', '2020-05-02 22:28:34');
INSERT INTO `paper` VALUES ('1352', '2017-2018年上海市华育中学九上周测1', '2', '9', '1', 'paper/05022228574897325.docx', 'vkjt1908', '2020-05-02 22:28:57');
INSERT INTO `paper` VALUES ('1353', '2017-2018学年上宝中学九上摸底考化学试卷(1)', '5', '9', '1', 'paper/05022229115840321.docx', 'fetj1908', '2020-05-02 22:29:11');
INSERT INTO `paper` VALUES ('1354', '2017-2018学年上宝中学九上摸底考化学试卷', '5', '9', '1', 'paper/05022229334060015.docx', 'fetj1908', '2020-05-02 22:29:33');
INSERT INTO `paper` VALUES ('1355', '2017-2018学年上宝中学九上期中考前复习卷(1)', '5', '9', '1', 'paper/05022230427335959.docx', 'fetj1908', '2020-05-02 22:30:42');
INSERT INTO `paper` VALUES ('1356', '2017-2018学年上宝中学九上期中考前复习卷', '5', '9', '1', 'paper/05022231139576429.docx', 'fetj1908', '2020-05-02 22:31:13');
INSERT INTO `paper` VALUES ('1357', '2017-2018学年五三中学九上12月月考化学试卷(1)', '5', '9', '1', 'paper/05022231514325293.docx', 'fetj1908', '2020-05-02 22:31:51');
INSERT INTO `paper` VALUES ('1358', '2017-2018学年五三中学九上12月月考化学试卷', '5', '9', '1', 'paper/05022232162047894.docx', 'fetj1908', '2020-05-02 22:32:16');
INSERT INTO `paper` VALUES ('1359', '2018-2019学年交大附中高一下英语期中', '3', '10', '2', 'paper/05022232477604801.docx', 'oqrj1908', '2020-05-02 22:32:47');
INSERT INTO `paper` VALUES ('1360', '2018-2019学年宝山区九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022232527146658.docx', 'fetj1908', '2020-05-02 22:32:52');
INSERT INTO `paper` VALUES ('1361', '2018-2019学年控江中学高二下英语期中', '3', '11', '2', 'paper/05022233078446556.docx', 'oqrj1908', '2020-05-02 22:33:07');
INSERT INTO `paper` VALUES ('1362', '2018-2019学年宝山区九上期中考化学试卷', '5', '9', '1', 'paper/05022233182589592.docx', 'fetj1908', '2020-05-02 22:33:18');
INSERT INTO `paper` VALUES ('1363', '2018-2019学年南洋模范高一下英语第一次月考', '3', '10', '2', 'paper/05022233271848165.docx', 'oqrj1908', '2020-05-02 22:33:27');
INSERT INTO `paper` VALUES ('1364', '2018-2019学年南洋模范高一下英语期中考试', '3', '10', '2', 'paper/05022233436264857.docx', 'oqrj1908', '2020-05-02 22:33:43');
INSERT INTO `paper` VALUES ('1365', '2018-2019学年浦东新区高一下英语期中考试', '3', '10', '2', 'paper/05022234065071256.doc', 'oqrj1908', '2020-05-02 22:34:06');
INSERT INTO `paper` VALUES ('1366', '2018-2019学年宝山实验九上12月月考化学试卷(1)', '5', '9', '1', 'paper/05022234071801150.docx', 'fetj1908', '2020-05-02 22:34:07');
INSERT INTO `paper` VALUES ('1367', '2018-2019学年宝山实验九上12月月考化学试卷', '5', '9', '1', 'paper/05022234347032456.docx', 'fetj1908', '2020-05-02 22:34:34');
INSERT INTO `paper` VALUES ('1368', '2018-2019学年上海高三下英语学校联考', '3', '12', '2', 'paper/05022234396371967.docx', 'oqrj1908', '2020-05-02 22:34:39');
INSERT INTO `paper` VALUES ('1369', '2018-2019学年松江二中、奉贤、金山三校高三下英语3月联考', '3', '12', '2', 'paper/05022235021753653.docx', 'oqrj1908', '2020-05-02 22:35:02');
INSERT INTO `paper` VALUES ('1370', '2018-2019学年川沙南校九上12月月考化学试卷(1)', '5', '9', '1', 'paper/05022235137381310.docx', 'fetj1908', '2020-05-02 22:35:13');
INSERT INTO `paper` VALUES ('1371', '2018-2019学年位育中学高一下英语期中复习卷', '3', '10', '2', 'paper/05022235236016638.docx', 'oqrj1908', '2020-05-02 22:35:23');
INSERT INTO `paper` VALUES ('1372', '2018-2019学年中国中学高一下英语期中', '3', '10', '2', 'paper/05022235411042736.docx', 'oqrj1908', '2020-05-02 22:35:41');
INSERT INTO `paper` VALUES ('1373', '2018-2019学年川沙南校九上12月月考化学试卷', '5', '9', '1', 'paper/05022235452501522.docx', 'fetj1908', '2020-05-02 22:35:45');
INSERT INTO `paper` VALUES ('1374', '2019届崇明区高考英语二模_20190722_173001', '3', '12', '2', 'paper/05022236034245252.doc', 'oqrj1908', '2020-05-02 22:36:03');
INSERT INTO `paper` VALUES ('1375', '2019届奉贤区高考英语二模', '3', '12', '2', 'paper/05022236234689167.docx', 'oqrj1908', '2020-05-02 22:36:23');
INSERT INTO `paper` VALUES ('1376', '2018-2019学年川沙南校九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022236461202945.docx', 'fetj1908', '2020-05-02 22:36:46');
INSERT INTO `paper` VALUES ('1377', '2019届虹口区高考英语二模', '3', '12', '2', 'paper/05022236472049540.docx', 'oqrj1908', '2020-05-02 22:36:47');
INSERT INTO `paper` VALUES ('1378', '2018-2019学年川沙南校九上第一次月考化学试卷', '5', '9', '1', 'paper/05022237149257877.docx', 'fetj1908', '2020-05-02 22:37:14');
INSERT INTO `paper` VALUES ('1379', '2019届黄浦区高考英语二模', '3', '12', '2', 'paper/05022237174189204.docx', 'oqrj1908', '2020-05-02 22:37:17');
INSERT INTO `paper` VALUES ('1380', '2019届嘉定区高考英语二模', '3', '12', '2', 'paper/05022237421726500.docx', 'oqrj1908', '2020-05-02 22:37:42');
INSERT INTO `paper` VALUES ('1381', '2019届金山区高考英语二模', '3', '12', '2', 'paper/05022238023885670.docx', 'oqrj1908', '2020-05-02 22:38:02');
INSERT INTO `paper` VALUES ('1382', '2018-2019学年川沙南校九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022238141853629.docx', 'fetj1908', '2020-05-02 22:38:14');
INSERT INTO `paper` VALUES ('1383', '2019届浦东新区高考英语二模(完整版)', '3', '12', '2', 'paper/05022238196499822.docx', 'oqrj1908', '2020-05-02 22:38:19');
INSERT INTO `paper` VALUES ('1384', '2018-2019学年川沙南校九上期中考化学试卷', '5', '9', '1', 'paper/05022238543105855.docx', 'fetj1908', '2020-05-02 22:38:54');
INSERT INTO `paper` VALUES ('1385', '2019届普陀区高考英语二模', '3', '12', '2', 'paper/05022239024866663.doc', 'oqrj1908', '2020-05-02 22:39:02');
INSERT INTO `paper` VALUES ('1386', '2019届青浦区高考英语二模', '3', '12', '2', 'paper/05022239345556827.docx', 'oqrj1908', '2020-05-02 22:39:34');
INSERT INTO `paper` VALUES ('1387', '2019届松江、闵行区高考英语二模', '3', '12', '2', 'paper/05022239545124392.docx', 'oqrj1908', '2020-05-02 22:39:54');
INSERT INTO `paper` VALUES ('1388', '2019届徐汇区高考英语二模', '3', '12', '2', 'paper/05022240164440203.doc', 'oqrj1908', '2020-05-02 22:40:16');
INSERT INTO `paper` VALUES ('1389', '2019届杨浦区高考英语二模', '3', '12', '2', 'paper/05022240362757020.docx', 'oqrj1908', '2020-05-02 22:40:36');
INSERT INTO `paper` VALUES ('1390', '2018-2019学年龚路中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022244396989711.docx', 'fetj1908', '2020-05-02 22:44:39');
INSERT INTO `paper` VALUES ('1391', '2018-2019学年龚路中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022245026086440.docx', 'fetj1908', '2020-05-02 22:45:02');
INSERT INTO `paper` VALUES ('1392', '2018-2019学年和衷中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022245504720920.docx', 'fetj1908', '2020-05-02 22:45:50');
INSERT INTO `paper` VALUES ('1393', '2018-2019学年和衷中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022246256960703.docx', 'fetj1908', '2020-05-02 22:46:25');
INSERT INTO `paper` VALUES ('1394', '2018-2019学年黄浦区九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022246598703923.docx', 'fetj1908', '2020-05-02 22:46:59');
INSERT INTO `paper` VALUES ('1395', '2018-2019学年黄浦区九上期中考化学试卷', '5', '9', '1', 'paper/05022247213948478.docx', 'fetj1908', '2020-05-02 22:47:21');
INSERT INTO `paper` VALUES ('1396', '2018-2019学年建平实验九上12月月考化学试卷(1)', '5', '9', '1', 'paper/05022247543639979.docx', 'fetj1908', '2020-05-02 22:47:54');
INSERT INTO `paper` VALUES ('1397', '2019届长宁区高考英语二模', '3', '12', '2', 'paper/05022247576935692.docx', 'oqrj1908', '2020-05-02 22:47:57');
INSERT INTO `paper` VALUES ('1398', '2018-2019学年建平实验九上12月月考化学试卷', '5', '9', '1', 'paper/05022248171134908.docx', 'fetj1908', '2020-05-02 22:48:17');
INSERT INTO `paper` VALUES ('1399', '2018-2019学年建平西校九上12月月考化学试卷(1)', '5', '9', '1', 'paper/05022249228926753.docx', 'fetj1908', '2020-05-02 22:49:22');
INSERT INTO `paper` VALUES ('1400', '2018-2019学年建平西校九上12月月考化学试卷', '5', '9', '1', 'paper/05022249433781707.docx', 'fetj1908', '2020-05-02 22:49:43');
INSERT INTO `paper` VALUES ('1401', '2018-2019学年建平西校九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022250236702887.docx', 'fetj1908', '2020-05-02 22:50:23');
INSERT INTO `paper` VALUES ('1402', '2018-2019学年建平西校九上期中考化学试卷', '5', '9', '1', 'paper/05022250475972936.docx', 'fetj1908', '2020-05-02 22:50:47');
INSERT INTO `paper` VALUES ('1403', '2018-2019学年凯慧初级九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022251247209740.docx', 'fetj1908', '2020-05-02 22:51:24');
INSERT INTO `paper` VALUES ('1404', '2018-2019学年凯慧初级九上期中考化学试卷', '5', '9', '1', 'paper/05022251497956475.docx', 'fetj1908', '2020-05-02 22:51:49');
INSERT INTO `paper` VALUES ('1405', '2018-2019学年上海市零陵中学初三上学期化学期中考试(1)', '5', '9', '1', 'paper/05022252212523672.docx', 'fetj1908', '2020-05-02 22:52:21');
INSERT INTO `paper` VALUES ('1406', '2018-2019学年上海市零陵中学初三上学期化学期中考试', '5', '9', '1', 'paper/05022252439232303.docx', 'fetj1908', '2020-05-02 22:52:43');
INSERT INTO `paper` VALUES ('1407', '2018-2019学年浦东第四教育署12月月考化学试卷(1)', '5', '9', '1', 'paper/05022253215574374.docx', 'fetj1908', '2020-05-02 22:53:21');
INSERT INTO `paper` VALUES ('1408', '2018-2019学年浦东第四教育署12月月考化学试卷', '5', '9', '1', 'paper/05022253437321101.docx', 'fetj1908', '2020-05-02 22:53:43');
INSERT INTO `paper` VALUES ('1409', '2018-2019学年浦东第四教育署12月月考化学试卷', '5', '9', '1', 'paper/05022254284805635.docx', 'fetj1908', '2020-05-02 22:54:28');
INSERT INTO `paper` VALUES ('1410', '2018-2019学年浦东第四教育署九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022255563116171.docx', 'fetj1908', '2020-05-02 22:55:56');
INSERT INTO `paper` VALUES ('1411', '2018-2019学年浦东第四教育署九上期中考化学试卷', '5', '9', '1', 'paper/05022256312663940.docx', 'fetj1908', '2020-05-02 22:56:31');
INSERT INTO `paper` VALUES ('1412', '2018-2019学年浦东第一教育署九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022257133394334.docx', 'fetj1908', '2020-05-02 22:57:13');
INSERT INTO `paper` VALUES ('1413', '2018-2019学年浦东第一教育署九上期中考化学试卷', '5', '9', '1', 'paper/05022257433770640.docx', 'fetj1908', '2020-05-02 22:57:43');
INSERT INTO `paper` VALUES ('1414', '2018-2019学年普陀区12月月考化学试卷(1)', '5', '9', '1', 'paper/05022258166206515.docx', 'fetj1908', '2020-05-02 22:58:16');
INSERT INTO `paper` VALUES ('1415', '2018-2019学年普陀区12月月考化学试卷', '5', '9', '1', 'paper/05022258383638997.docx', 'fetj1908', '2020-05-02 22:58:38');
INSERT INTO `paper` VALUES ('1416', '2018-2019学年三林北校九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022259093138943.docx', 'fetj1908', '2020-05-02 22:59:09');
INSERT INTO `paper` VALUES ('1417', '2018-2019学年三林北校九上期中考化学试卷', '5', '9', '1', 'paper/05022259339369522.docx', 'fetj1908', '2020-05-02 22:59:33');
INSERT INTO `paper` VALUES ('1418', '高三（新题型+六选四+概要写作）专练Test_1', '3', '12', '2', 'paper/05022259344170220.docx', 'oqrj1908', '2020-05-02 22:59:34');
INSERT INTO `paper` VALUES ('1419', '高三（新题型+六选四+概要写作）专练Test_2', '3', '12', '2', 'paper/05022259579487864.docx', 'oqrj1908', '2020-05-02 22:59:57');
INSERT INTO `paper` VALUES ('1420', '2018-2019学年上实西校九上12月月考化学试卷(1)', '5', '9', '1', 'paper/05022300062458549.docx', 'fetj1908', '2020-05-02 23:00:06');
INSERT INTO `paper` VALUES ('1421', '高考作文学生易犯错误和指导策略', '3', '12', '2', 'paper/05022300182274132.docx', 'oqrj1908', '2020-05-02 23:00:18');
INSERT INTO `paper` VALUES ('1422', '2018-2019学年上实西校九上12月月考化学试卷', '5', '9', '1', 'paper/05022300305425998.docx', 'fetj1908', '2020-05-02 23:00:30');
INSERT INTO `paper` VALUES ('1423', '2018-2019学年位育九上化学阶段测试卷二(1)', '5', '9', '1', 'paper/05022301047259716.docx', 'fetj1908', '2020-05-02 23:01:04');
INSERT INTO `paper` VALUES ('1424', '2018-2019学年位育九上化学阶段测试卷二', '5', '9', '1', 'paper/05022301254040659.docx', 'fetj1908', '2020-05-02 23:01:25');
INSERT INTO `paper` VALUES ('1425', '2018-2019学年西延安中学九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022302114169934.docx', 'fetj1908', '2020-05-02 23:02:11');
INSERT INTO `paper` VALUES ('1426', '2018-2019学年西延安中学九上期中考化学试卷', '5', '9', '1', 'paper/05022302361336047.docx', 'fetj1908', '2020-05-02 23:02:36');
INSERT INTO `paper` VALUES ('1427', '2018-2019学年仙霞高级九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022303119045309.docx', 'fetj1908', '2020-05-02 23:03:11');
INSERT INTO `paper` VALUES ('1428', '2018-2019学年仙霞高级九上期中考化学试卷', '5', '9', '1', 'paper/05022303353551348.docx', 'fetj1908', '2020-05-02 23:03:35');
INSERT INTO `paper` VALUES ('1429', '2017-2018学年宝山区高二下英语期末考试', '3', '11', '2', 'paper/05022303526157248.docx', 'oqrj1908', '2020-05-02 23:03:52');
INSERT INTO `paper` VALUES ('1430', '2018-2019学年新北郊初级九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022304066933016.docx', 'fetj1908', '2020-05-02 23:04:06');
INSERT INTO `paper` VALUES ('1431', '2018-2019学年新北郊初级九上第一次月考化学试卷', '5', '9', '1', 'paper/05022304275477418.docx', 'fetj1908', '2020-05-02 23:04:27');
INSERT INTO `paper` VALUES ('1432', '2017-2018学年宝山区高一下英语期末考试', '3', '10', '2', 'paper/05022304564038006.docx', 'oqrj1908', '2020-05-02 23:04:56');
INSERT INTO `paper` VALUES ('1433', '2018-2019学年徐汇中学九上第一次月考化学试卷(1)', '5', '9', '1', 'paper/05022305028085812.docx', 'fetj1908', '2020-05-02 23:05:02');
INSERT INTO `paper` VALUES ('1434', '2017-2018学年曹杨二中高一5月月考试卷', '3', '10', '2', 'paper/05022305223529270.docx', 'oqrj1908', '2020-05-02 23:05:22');
INSERT INTO `paper` VALUES ('1435', '2018-2019学年徐汇中学九上第一次月考化学试卷', '5', '9', '1', 'paper/05022305288189112.docx', 'fetj1908', '2020-05-02 23:05:28');
INSERT INTO `paper` VALUES ('1436', '2017-2018学年交大附中高二下英语五月考试', '3', '11', '2', 'paper/05022305444957660.docx', 'oqrj1908', '2020-05-02 23:05:44');
INSERT INTO `paper` VALUES ('1437', '2018-2019学年杨浦区九上期中考化学试卷(1)', '5', '9', '1', 'paper/05022306048324959.docx', 'fetj1908', '2020-05-02 23:06:04');
INSERT INTO `paper` VALUES ('1438', '2018-2019学年杨浦区九上期中考化学试卷', '5', '9', '1', 'paper/05022306306038846.docx', 'fetj1908', '2020-05-02 23:06:30');
INSERT INTO `paper` VALUES ('1439', '2017-2018学年行知高三高考三模', '3', '12', '2', 'paper/05022307027403206.docx', 'oqrj1908', '2020-05-02 23:07:02');
INSERT INTO `paper` VALUES ('1440', '2017-2018学年嘉定一中高三下三模考试', '3', '12', '2', 'paper/05022307255590363.docx', 'oqrj1908', '2020-05-02 23:07:25');
INSERT INTO `paper` VALUES ('1441', '2017-2018学年交大附中高二下英语五月考试', '3', '11', '2', 'paper/05022308099349935.docx', 'oqrj1908', '2020-05-02 23:08:09');
INSERT INTO `paper` VALUES ('1442', '2017-2018学年金山中学高二下英语期末', '3', '11', '2', 'paper/05022308425459562.docx', 'oqrj1908', '2020-05-02 23:08:42');
INSERT INTO `paper` VALUES ('1443', '2017-2018学年七宝中学高二下五月考试', '3', '11', '2', 'paper/05022309507398911.docx', 'oqrj1908', '2020-05-02 23:09:50');
INSERT INTO `paper` VALUES ('1444', '2017-2018学年七宝中学高三下英语五月第二次模拟考', '3', '12', '2', 'paper/05022310158234032.docx', 'oqrj1908', '2020-05-02 23:10:15');
INSERT INTO `paper` VALUES ('1445', '2017-2018学年七宝中学高三下英语五月第一次模拟考', '3', '12', '2', 'paper/05022310536255027.docx', 'oqrj1908', '2020-05-02 23:10:53');
INSERT INTO `paper` VALUES ('1446', '2017-2018学年青浦高级中学高二下五月考试', '3', '11', '2', 'paper/05022311191192825.doc', 'oqrj1908', '2020-05-02 23:11:19');
INSERT INTO `paper` VALUES ('1447', '2017-2018学年上外附中高二下英语期中考试', '3', '11', '2', 'paper/05022311425467757.docx', 'oqrj1908', '2020-05-02 23:11:42');
INSERT INTO `paper` VALUES ('1448', '2017-2018学年上外附中高二下英语五月考试', '3', '11', '2', 'paper/05022312066638771.docx', 'oqrj1908', '2020-05-02 23:12:06');
INSERT INTO `paper` VALUES ('1449', '2017-2019年上海高考真题翻译题汇总（语法点）', '3', '12', '2', 'paper/05022312327657726.docx', 'oqrj1908', '2020-05-02 23:12:32');
INSERT INTO `paper` VALUES ('1450', '2017-2019年上海高考真题优秀作文汇总', '3', '12', '2', 'paper/05022312542544378.docx', 'oqrj1908', '2020-05-02 23:12:54');
INSERT INTO `paper` VALUES ('1451', '2018-2019年晋元高中高二下英语期中', '3', '11', '2', 'paper/05022313179217529.doc', 'oqrj1908', '2020-05-02 23:13:17');
INSERT INTO `paper` VALUES ('1452', '2018-2019年七宝中学高三下英语三模', '3', '12', '2', 'paper/05022313447968269.docx', 'oqrj1908', '2020-05-02 23:13:44');
INSERT INTO `paper` VALUES ('1453', '2018-2019学年同济一附中高一下语法练习（动名词2）', '3', '10', '2', 'paper/05022314132667595.docx', 'oqrj1908', '2020-05-02 23:14:13');
INSERT INTO `paper` VALUES ('1454', '2018-2019学年北虹高级中学高一下英语期中', '3', '10', '2', 'paper/05022314412713014.docx', 'oqrj1908', '2020-05-02 23:14:41');
INSERT INTO `paper` VALUES ('1455', '2018-2019学年曹杨二中高二下五月月考卷', '3', '11', '2', 'paper/05022317567851926.docx', 'oqrj1908', '2020-05-02 23:17:56');
INSERT INTO `paper` VALUES ('1456', '2018-2019学年曹杨二中高二下英语期中', '3', '11', '2', 'paper/05022318191657972.doc', 'oqrj1908', '2020-05-02 23:18:19');
INSERT INTO `paper` VALUES ('1457', '2018-2019学年复旦附中高二下英语期中考试', '3', '11', '2', 'paper/05022318496544405.docx', 'oqrj1908', '2020-05-02 23:18:49');
INSERT INTO `paper` VALUES ('1458', '2018-2019学年格致中学高二下英语期中', '3', '11', '2', 'paper/05022319099654304.docx', 'oqrj1908', '2020-05-02 23:19:09');
INSERT INTO `paper` VALUES ('1459', '2018-2019学年格致中学高三下英语三模', '3', '12', '2', 'paper/05022319353282395.docx', 'oqrj1908', '2020-05-02 23:19:35');
INSERT INTO `paper` VALUES ('1460', '2018-2019学年光明中学高一下英语期中', '3', '10', '2', 'paper/05022320001671366.docx', 'oqrj1908', '2020-05-02 23:20:00');
INSERT INTO `paper` VALUES ('1461', '2018-2019学年行知中学高一下英语期中考试(1)', '3', '10', '2', 'paper/05022321289382742.docx', 'oqrj1908', '2020-05-02 23:21:28');
INSERT INTO `paper` VALUES ('1462', '2018-2019学年建平世纪高一下英语周周练5', '3', '10', '2', 'paper/05022321485676434.docx', 'oqrj1908', '2020-05-02 23:21:48');
INSERT INTO `paper` VALUES ('1463', '2018-2019学年建平中学高三下英语三模', '3', '12', '2', 'paper/05022322092491117.docx', 'oqrj1908', '2020-05-02 23:22:09');
INSERT INTO `paper` VALUES ('1464', '2018-2019学年交大附中高一下英语期中', '3', '10', '2', 'paper/05022322543832226.docx', 'oqrj1908', '2020-05-02 23:22:54');
INSERT INTO `paper` VALUES ('1465', '2018-2019学年控江中学高二下英语期中', '3', '11', '2', 'paper/05022323152813054.docx', 'oqrj1908', '2020-05-02 23:23:15');
INSERT INTO `paper` VALUES ('1466', '2018-2019学年闵行外国语高一下期中考试试卷', '3', '10', '2', 'paper/05022323369599285.docx', 'oqrj1908', '2020-05-02 23:23:36');
INSERT INTO `paper` VALUES ('1467', '2018-2019学年南洋模范高一下英语期中考试', '3', '10', '2', 'paper/05022324027753007.docx', 'oqrj1908', '2020-05-02 23:24:02');
INSERT INTO `paper` VALUES ('1468', '2018-2019学年南洋模范高中高一下英语5月考试', '3', '10', '2', 'paper/05022324272935215.docx', 'oqrj1908', '2020-05-02 23:24:27');
INSERT INTO `paper` VALUES ('1469', '2018-2019学年浦东新区高一下英语期中考试', '3', '10', '2', 'paper/05022324522618315.doc', 'oqrj1908', '2020-05-02 23:24:52');
INSERT INTO `paper` VALUES ('1470', '2018-2019学年浦东新区高三下英语三模', '3', '12', '2', 'paper/05022325179675875.docx', 'oqrj1908', '2020-05-02 23:25:17');
INSERT INTO `paper` VALUES ('1471', '2018-2019学年上师大附中高三下英语三模', '3', '12', '2', 'paper/05022325403567206.docx', 'oqrj1908', '2020-05-02 23:25:40');
INSERT INTO `paper` VALUES ('1472', '2018-2019学年市北中学高三上英语二次月考', '3', '12', '1', 'paper/05022326092359067.docx', 'oqrj1908', '2020-05-02 23:26:09');
INSERT INTO `paper` VALUES ('1473', '2018-2019学年市西中学高一下英语期中考试', '3', '10', '2', 'paper/05022326398130752.docx', 'oqrj1908', '2020-05-02 23:26:39');
INSERT INTO `paper` VALUES ('1474', '2018-2019学年位育中学高一下英语期中复习卷', '3', '10', '2', 'paper/05022327105514422.docx', 'oqrj1908', '2020-05-02 23:27:10');
INSERT INTO `paper` VALUES ('1475', '2018-2019学年西南位育中学高二下期中考试卷', '3', '11', '2', 'paper/05022327367326083.doc', 'oqrj1908', '2020-05-02 23:27:36');
INSERT INTO `paper` VALUES ('1476', '2018-2019学年向明中学高一下英语5月考试', '3', '10', '2', 'paper/05022328039707678.docx', 'oqrj1908', '2020-05-02 23:28:03');
INSERT INTO `paper` VALUES ('1477', '2018-2019学年宜川中学高一下英语二次月考', '3', '10', '2', 'paper/05022328288248682.docx', 'oqrj1908', '2020-05-02 23:28:28');
INSERT INTO `paper` VALUES ('1478', '2018-2019学年育才中学高二下英语学程考', '3', '11', '2', 'paper/05022328531277462.docx', 'oqrj1908', '2020-05-02 23:28:53');
INSERT INTO `paper` VALUES ('1479', '2018-2019学年中国中学高一下英语期中', '3', '10', '2', 'paper/05022329596019773.docx', 'oqrj1908', '2020-05-02 23:29:59');
INSERT INTO `paper` VALUES ('1480', '2019届高考英语模拟试卷', '3', '12', '2', 'paper/05022330354083543.docx', 'oqrj1908', '2020-05-02 23:30:35');
INSERT INTO `paper` VALUES ('1481', '2019届高考英语听力音频16区完整版', '3', '12', '2', 'paper/05022330581045466.docx', 'oqrj1908', '2020-05-02 23:30:58');
INSERT INTO `paper` VALUES ('1482', '2019届金山区高考英语二模', '3', '12', '2', 'paper/05022331235355843.docx', 'oqrj1908', '2020-05-02 23:31:23');
INSERT INTO `paper` VALUES ('1483', '2019届静安区高考英语二模', '3', '12', '2', 'paper/05022331478431313.docx', 'oqrj1908', '2020-05-02 23:31:47');
INSERT INTO `paper` VALUES ('1484', '2019届松江、闵行区高考英语二模', '3', '12', '2', 'paper/05022332101074935.docx', 'oqrj1908', '2020-05-02 23:32:10');
INSERT INTO `paper` VALUES ('1485', '2016-2017学年金山中学高二下英语期中考试', '3', '11', '2', 'paper/05022334123628525.doc', 'oqrj1908', '2020-05-02 23:34:12');
INSERT INTO `paper` VALUES ('1486', '2017-2018学年曹杨二中高一下英语期中', '3', '10', '2', 'paper/05022334535826333.docx', 'oqrj1908', '2020-05-02 23:34:53');
INSERT INTO `paper` VALUES ('1487', '2017-2018学年曹杨二中高一下英语期中考试（易错题分析）', '3', '10', '2', 'paper/05022335188630886.docx', 'oqrj1908', '2020-05-02 23:35:18');
INSERT INTO `paper` VALUES ('1488', '2017-2018学年封浜高中高一下英语期中考试', '3', '10', '2', 'paper/05022335427170132.doc', 'oqrj1908', '2020-05-02 23:35:42');
INSERT INTO `paper` VALUES ('1489', '2017-2018学年复旦附中高一下英语期中考试', '3', '10', '2', 'paper/05022336068055995.docx', 'oqrj1908', '2020-05-02 23:36:06');
INSERT INTO `paper` VALUES ('1490', '2017-2018学年复旦中学高二下英语期中考试', '3', '11', '2', 'paper/05022336304226858.docx', 'oqrj1908', '2020-05-02 23:36:30');
INSERT INTO `paper` VALUES ('1491', '2017-2018学年虹口区华一高一下英语期中', '3', '10', '2', 'paper/05022336559418406.docx', 'oqrj1908', '2020-05-02 23:36:55');
INSERT INTO `paper` VALUES ('1492', '2017-2018学年进才中学高二下英语期中考试', '3', '11', '2', 'paper/05022346204184730.docx', 'oqrj1908', '2020-05-02 23:46:20');
INSERT INTO `paper` VALUES ('1493', '2018初三一模汇编①-基本概念和理论（1）(1)', '5', '9', '2', 'paper/05030928074021572.docx', 'fetj1908', '2020-05-03 09:28:07');
INSERT INTO `paper` VALUES ('1494', '2018初三一模汇编①-基本概念和理论（1）', '5', '9', '2', 'paper/05030928291134195.docx', 'fetj1908', '2020-05-03 09:28:29');
INSERT INTO `paper` VALUES ('1495', '2018初三一模汇编①-基本概念和理论（2）(1)', '5', '9', '2', 'paper/05030929051463633.docx', 'fetj1908', '2020-05-03 09:29:05');
INSERT INTO `paper` VALUES ('1496', '2018初三一模汇编①-基本概念和理论（2）', '5', '9', '2', 'paper/05030929298151053.docx', 'fetj1908', '2020-05-03 09:29:29');
INSERT INTO `paper` VALUES ('1497', '2018初三一模汇编①-基本概念和理论（3）(1)', '5', '9', '2', 'paper/05030930064634662.docx', 'fetj1908', '2020-05-03 09:30:06');
INSERT INTO `paper` VALUES ('1498', '2018初三一模汇编①-基本概念和理论（3）', '5', '9', '2', 'paper/05030930299935025.docx', 'fetj1908', '2020-05-03 09:30:29');
INSERT INTO `paper` VALUES ('1499', '2018初三一模汇编①-基本概念和理论（4）(1)', '5', '9', '2', 'paper/05030932003987626.docx', 'fetj1908', '2020-05-03 09:32:00');
INSERT INTO `paper` VALUES ('1500', '2018初三一模汇编①-基本概念和理论（4）', '5', '9', '2', 'paper/05030932198482037.docx', 'fetj1908', '2020-05-03 09:32:19');
INSERT INTO `paper` VALUES ('1501', '2018初三一模汇编①-基本概念和理论（5）(1)', '5', '9', '2', 'paper/05030934562656164.docx', 'fetj1908', '2020-05-03 09:34:56');
INSERT INTO `paper` VALUES ('1502', '2018初三一模汇编①-基本概念和理论（5）', '5', '9', '2', 'paper/05030935175467101.docx', 'fetj1908', '2020-05-03 09:35:17');
INSERT INTO `paper` VALUES ('1503', '2018初三一模汇编②-身边的化学物质（1）(1)', '5', '9', '2', 'paper/05030935505246600.docx', 'fetj1908', '2020-05-03 09:35:50');
INSERT INTO `paper` VALUES ('1504', '2018初三一模汇编②-身边的化学物质（1）', '5', '9', '2', 'paper/05030936107666806.docx', 'fetj1908', '2020-05-03 09:36:10');
INSERT INTO `paper` VALUES ('1505', '2018初三一模汇编②-身边的化学物质（2）(1)', '5', '9', '2', 'paper/05030936404977436.docx', 'fetj1908', '2020-05-03 09:36:40');
INSERT INTO `paper` VALUES ('1506', '2018初三一模汇编②-身边的化学物质（2）', '5', '9', '2', 'paper/05030936598484677.docx', 'fetj1908', '2020-05-03 09:36:59');
INSERT INTO `paper` VALUES ('1507', '2018初三一模汇编③-溶液（1）(1)', '5', '9', '2', 'paper/05030937359211848.docx', 'fetj1908', '2020-05-03 09:37:35');
INSERT INTO `paper` VALUES ('1508', '2018初三一模汇编③-溶液（1）', '5', '9', '2', 'paper/05030937574702659.docx', 'fetj1908', '2020-05-03 09:37:57');
INSERT INTO `paper` VALUES ('1509', '2018初三一模汇编③-溶液（2）(1)', '5', '9', '2', 'paper/05030938308446705.docx', 'fetj1908', '2020-05-03 09:38:30');
INSERT INTO `paper` VALUES ('1510', '2018初三一模汇编③-溶液（2）', '5', '9', '2', 'paper/05030938523723328.docx', 'fetj1908', '2020-05-03 09:38:52');
INSERT INTO `paper` VALUES ('1511', '2018初三一模汇编④-实验（1）(1)', '5', '9', '2', 'paper/05030939261234794.docx', 'fetj1908', '2020-05-03 09:39:26');
INSERT INTO `paper` VALUES ('1512', '2018初三一模汇编④-实验（1）', '5', '9', '2', 'paper/05030940124372141.docx', 'fetj1908', '2020-05-03 09:40:12');
INSERT INTO `paper` VALUES ('1513', '2018初三一模汇编④-实验（2）(1)', '5', '9', '2', 'paper/05030941532161217.docx', 'fetj1908', '2020-05-03 09:41:53');
INSERT INTO `paper` VALUES ('1514', '2018初三一模汇编④-实验（2）', '5', '9', '2', 'paper/05030942478940170.docx', 'fetj1908', '2020-05-03 09:42:47');
INSERT INTO `paper` VALUES ('1515', '2018初三一模汇编④-实验（3）(1)', '5', '9', '2', 'paper/05030944432872460.docx', 'fetj1908', '2020-05-03 09:44:43');
INSERT INTO `paper` VALUES ('1516', '2018初三一模汇编④-实验（3）', '5', '9', '2', 'paper/05030945145648439.docx', 'fetj1908', '2020-05-03 09:45:14');
INSERT INTO `paper` VALUES ('1517', '2018初三一模汇编④-实验（4）(1)', '5', '9', '2', 'paper/05030945567514871.docx', 'fetj1908', '2020-05-03 09:45:56');
INSERT INTO `paper` VALUES ('1518', '2018初三一模汇编④-实验（4）', '5', '9', '2', 'paper/05030946246681787.docx', 'fetj1908', '2020-05-03 09:46:24');
INSERT INTO `paper` VALUES ('1519', '2019届宝山区中考化学一模(1)', '5', '9', '1', 'paper/05031035279878990.docx', 'fetj1908', '2020-05-03 10:35:27');
INSERT INTO `paper` VALUES ('1520', '2019届宝山区中考化学一模', '5', '9', '1', 'paper/05031035507201733.docx', 'fetj1908', '2020-05-03 10:35:50');
INSERT INTO `paper` VALUES ('1521', '2019届崇明区中考化学一模(1)', '5', '9', '1', 'paper/05031036332166855.docx', 'fetj1908', '2020-05-03 10:36:33');
INSERT INTO `paper` VALUES ('1522', '2019届崇明区中考化学一模', '5', '9', '1', 'paper/05031036579481241.docx', 'fetj1908', '2020-05-03 10:36:57');
INSERT INTO `paper` VALUES ('1523', '2019届奉贤区中考化学一模(1)', '5', '9', '1', 'paper/05031037277818061.docx', 'fetj1908', '2020-05-03 10:37:27');
INSERT INTO `paper` VALUES ('1524', '2019届奉贤区中考化学一模', '5', '9', '1', 'paper/05031038183186295.docx', 'fetj1908', '2020-05-03 10:38:18');
INSERT INTO `paper` VALUES ('1525', '2019届虹口区中考化学一模(1)', '5', '9', '1', 'paper/05031039082017587.docx', 'fetj1908', '2020-05-03 10:39:08');
INSERT INTO `paper` VALUES ('1526', '2019届虹口区中考化学一模', '5', '9', '1', 'paper/05031040095132209.docx', 'fetj1908', '2020-05-03 10:40:09');
INSERT INTO `paper` VALUES ('1527', '2019届黄浦区中考化学一模(1)', '5', '9', '1', 'paper/05031040525226034.docx', 'fetj1908', '2020-05-03 10:40:52');
INSERT INTO `paper` VALUES ('1528', '2019届黄浦区中考化学一模', '5', '9', '1', 'paper/05031041193986989.docx', 'fetj1908', '2020-05-03 10:41:19');
INSERT INTO `paper` VALUES ('1529', '2019届嘉定区中考化学一模(1)', '5', '9', '1', 'paper/05031041513795112.docx', 'fetj1908', '2020-05-03 10:41:51');
INSERT INTO `paper` VALUES ('1530', '2019届嘉定区中考化学一模', '5', '9', '1', 'paper/05031042182247476.docx', 'fetj1908', '2020-05-03 10:42:18');
INSERT INTO `paper` VALUES ('1531', '2019届金山区中考化学一模(1)', '5', '9', '1', 'paper/05031043117722107.docx', 'fetj1908', '2020-05-03 10:43:11');
INSERT INTO `paper` VALUES ('1532', '2019届金山区中考化学一模', '5', '9', '1', 'paper/05031043444230419.docx', 'fetj1908', '2020-05-03 10:43:44');
INSERT INTO `paper` VALUES ('1533', '2017-2018学年控江中学高一下英语期中', '3', '10', '2', 'paper/05031043552537624.docx', 'oqrj1908', '2020-05-03 10:43:55');
INSERT INTO `paper` VALUES ('1534', '2019届静安区中考化学一模(1)', '5', '9', '1', 'paper/05031044123640837.docx', 'fetj1908', '2020-05-03 10:44:12');
INSERT INTO `paper` VALUES ('1535', '2017-2018学年闵行中学高一下英语三月考试', '3', '10', '2', 'paper/05031044199440355.docx', 'oqrj1908', '2020-05-03 10:44:19');
INSERT INTO `paper` VALUES ('1536', '2019届静安区中考化学一模', '5', '9', '1', 'paper/05031044442119515.docx', 'fetj1908', '2020-05-03 10:44:44');
INSERT INTO `paper` VALUES ('1537', '2017-2018学年浦东外国语高二下英语3月月考', '3', '11', '2', 'paper/05031045018147067.docx', 'oqrj1908', '2020-05-03 10:45:01');
INSERT INTO `paper` VALUES ('1538', '2019届闵行区中考化学一模(1)', '5', '9', '1', 'paper/05031045129859571.docx', 'fetj1908', '2020-05-03 10:45:12');
INSERT INTO `paper` VALUES ('1539', '2019届闵行区中考化学一模', '5', '9', '1', 'paper/05031045336031879.docx', 'fetj1908', '2020-05-03 10:45:33');
INSERT INTO `paper` VALUES ('1540', '2017-2018学年浦东新区高一下英语期中', '3', '10', '2', 'paper/05031046032281714.docx', 'oqrj1908', '2020-05-03 10:46:03');
INSERT INTO `paper` VALUES ('1541', '2019届浦东新区中考化学一模(1)', '5', '9', '1', 'paper/05031046058012493.docx', 'fetj1908', '2020-05-03 10:46:05');
INSERT INTO `paper` VALUES ('1542', '2019届浦东新区中考化学一模', '5', '9', '1', 'paper/05031046263045636.docx', 'fetj1908', '2020-05-03 10:46:26');
INSERT INTO `paper` VALUES ('1543', '2019届普陀区中考化学一模(1)', '5', '9', '1', 'paper/05031046533040795.docx', 'fetj1908', '2020-05-03 10:46:53');
INSERT INTO `paper` VALUES ('1544', '2019届普陀区中考化学一模', '5', '9', '1', 'paper/05031047121238434.docx', 'fetj1908', '2020-05-03 10:47:12');
INSERT INTO `paper` VALUES ('1545', '2017-2018学年七宝中学高二下英语4月考试', '3', '11', '2', 'paper/05031047283268151.docx', 'oqrj1908', '2020-05-03 10:47:28');
INSERT INTO `paper` VALUES ('1546', '2019届青浦区中考化学一模(1)', '5', '9', '1', 'paper/05031047391936638.docx', 'fetj1908', '2020-05-03 10:47:39');
INSERT INTO `paper` VALUES ('1547', '2019届青浦区中考化学一模', '5', '9', '1', 'paper/05031048026397840.docx', 'fetj1908', '2020-05-03 10:48:02');
INSERT INTO `paper` VALUES ('1548', '2019届松江区中考化学一模(1)', '5', '9', '1', 'paper/05031048287903924.docx', 'fetj1908', '2020-05-03 10:48:28');
INSERT INTO `paper` VALUES ('1549', '2017-2018学年青浦区高二下英语期中考试', '3', '11', '2', 'paper/05031048484967824.doc', 'oqrj1908', '2020-05-03 10:48:48');
INSERT INTO `paper` VALUES ('1550', '2019届松江区中考化学一模', '5', '9', '1', 'paper/05031048491504467.docx', 'fetj1908', '2020-05-03 10:48:49');
INSERT INTO `paper` VALUES ('1551', '2017-2018学年上海中学高三下英语3月周练', '3', '12', '2', 'paper/05031049151871530.docx', 'oqrj1908', '2020-05-03 10:49:15');
INSERT INTO `paper` VALUES ('1552', '2019届徐汇区中考化学一模(1)', '5', '9', '1', 'paper/05031049176949314.docx', 'fetj1908', '2020-05-03 10:49:17');
INSERT INTO `paper` VALUES ('1553', '2019届徐汇区中考化学一模', '5', '9', '1', 'paper/05031049392877088.docx', 'fetj1908', '2020-05-03 10:49:39');
INSERT INTO `paper` VALUES ('1554', '2017-2018学年位育中学高二下英语期中', '3', '11', '2', 'paper/05031049536984366.docx', 'oqrj1908', '2020-05-03 10:49:53');
INSERT INTO `paper` VALUES ('1555', '2019届杨浦区中考化学一模', '5', '9', '1', 'paper/05031051064934511.docx', 'fetj1908', '2020-05-03 10:51:06');
INSERT INTO `paper` VALUES ('1556', '2019届长宁区中考化学一模(1)', '5', '9', '1', 'paper/05031051352189687.docx', 'fetj1908', '2020-05-03 10:51:35');
INSERT INTO `paper` VALUES ('1557', '2019届长宁区中考化学一模', '5', '9', '1', 'paper/05031051576972306.docx', 'fetj1908', '2020-05-03 10:51:57');
INSERT INTO `paper` VALUES ('1558', '九上-12月月考化学试卷(1)', '5', '9', '1', 'paper/05031053587123900.docx', 'fetj1908', '2020-05-03 10:53:58');
INSERT INTO `paper` VALUES ('1559', '九上-12月月考化学试卷', '5', '9', '1', 'paper/05031054226286222.docx', 'fetj1908', '2020-05-03 10:54:22');
INSERT INTO `paper` VALUES ('1560', '九上-饱和溶液练习(1)', '5', '9', '1', 'paper/05031055502858161.docx', 'fetj1908', '2020-05-03 10:55:50');
INSERT INTO `paper` VALUES ('1561', '九上-饱和溶液练习', '5', '9', '1', 'paper/05031056133199906.docx', 'fetj1908', '2020-05-03 10:56:13');
INSERT INTO `paper` VALUES ('1562', '九上-第二章单元测验卷(1)', '5', '9', '1', 'paper/05031057274527007.docx', 'fetj1908', '2020-05-03 10:57:27');
INSERT INTO `paper` VALUES ('1563', '九上-第二章单元测验卷', '5', '9', '1', 'paper/05031058071114307.docx', 'fetj1908', '2020-05-03 10:58:07');
INSERT INTO `paper` VALUES ('1564', '九上-第三章单元测验卷(1)', '5', '9', '1', 'paper/05031102087152189.docx', 'fetj1908', '2020-05-03 11:02:08');
INSERT INTO `paper` VALUES ('1565', '九上-第三章单元测验卷', '5', '9', '1', 'paper/05031102283487770.docx', 'fetj1908', '2020-05-03 11:02:28');
INSERT INTO `paper` VALUES ('1566', '九上-过关练习1-碳(1)', '5', '9', '1', 'paper/05031102593363846.docx', 'fetj1908', '2020-05-03 11:02:59');
INSERT INTO `paper` VALUES ('1567', '九上-过关练习1-碳', '5', '9', '1', 'paper/05031103173930226.docx', 'fetj1908', '2020-05-03 11:03:17');
INSERT INTO `paper` VALUES ('1568', '九上-过关练习2-一氧化碳(1)', '5', '9', '1', 'paper/05031103466841670.docx', 'fetj1908', '2020-05-03 11:03:46');
INSERT INTO `paper` VALUES ('1569', '九上-过关练习2-一氧化碳', '5', '9', '1', 'paper/05031104174828754.docx', 'fetj1908', '2020-05-03 11:04:17');
INSERT INTO `paper` VALUES ('1570', '九上-过关练习2-一氧化碳', '5', '9', '1', 'paper/05031104387626503.docx', 'fetj1908', '2020-05-03 11:04:38');
INSERT INTO `paper` VALUES ('1571', '九上-过关练习3-二氧化碳(1)', '5', '9', '1', 'paper/05031105112329470.docx', 'fetj1908', '2020-05-03 11:05:11');
INSERT INTO `paper` VALUES ('1572', '九上-过关练习3-二氧化碳', '5', '9', '1', 'paper/05031105317334010.docx', 'fetj1908', '2020-05-03 11:05:31');
INSERT INTO `paper` VALUES ('1573', '九上-过关练习4-碳及其氧化物(1)', '5', '9', '1', 'paper/05031106011683193.docx', 'fetj1908', '2020-05-03 11:06:01');
INSERT INTO `paper` VALUES ('1574', '九上-过关练习4-碳及其氧化物', '5', '9', '1', 'paper/05031106223796222.docx', 'fetj1908', '2020-05-03 11:06:22');
INSERT INTO `paper` VALUES ('1575', '过关练习5-溶液的组成与特征(1)', '5', '9', '1', 'paper/05031106521335092.docx', 'fetj1908', '2020-05-03 11:06:52');
INSERT INTO `paper` VALUES ('1576', '过关练习5-溶液的组成与特征', '5', '9', '1', 'paper/05031107142174109.docx', 'fetj1908', '2020-05-03 11:07:14');
INSERT INTO `paper` VALUES ('1577', '过关练习6-物质的溶解与结晶(1)', '5', '9', '1', 'paper/05031107466919426.docx', 'fetj1908', '2020-05-03 11:07:46');
INSERT INTO `paper` VALUES ('1578', '过关练习6-物质的溶解与结晶', '5', '9', '1', 'paper/05031108038589032.docx', 'fetj1908', '2020-05-03 11:08:03');
INSERT INTO `paper` VALUES ('1579', '过关练习7-溶解度(1)', '5', '9', '1', 'paper/05031108366095511.docx', 'fetj1908', '2020-05-03 11:08:36');
INSERT INTO `paper` VALUES ('1580', '过关练习7-溶解度', '5', '9', '1', 'paper/05031108543083718.docx', 'fetj1908', '2020-05-03 11:08:54');
INSERT INTO `paper` VALUES ('1581', '九上-过关练习8-氧气的性质和制取(1)', '5', '9', '1', 'paper/05031109217494046.docx', 'fetj1908', '2020-05-03 11:09:21');
INSERT INTO `paper` VALUES ('1582', '九上-过关练习8-氧气的性质和制取', '5', '9', '1', 'paper/05031109433909533.docx', 'fetj1908', '2020-05-03 11:09:43');
INSERT INTO `paper` VALUES ('1583', '九上-过关练习9-水的组成与性质(1)', '5', '9', '1', 'paper/05031110146475429.docx', 'fetj1908', '2020-05-03 11:10:14');
INSERT INTO `paper` VALUES ('1584', '九上-过关练习9-水的组成与性质', '5', '9', '1', 'paper/05031110334363626.docx', 'fetj1908', '2020-05-03 11:10:33');
INSERT INTO `paper` VALUES ('1585', '九上-过关练习10-氧气+水+溶液(1)', '5', '9', '1', 'paper/05031111174609164.docx', 'fetj1908', '2020-05-03 11:11:17');
INSERT INTO `paper` VALUES ('1586', '九上-过关练习10-氧气+水+溶液', '5', '9', '1', 'paper/05031111369202196.docx', 'fetj1908', '2020-05-03 11:11:36');
INSERT INTO `paper` VALUES ('1587', '九上-过关练习11-气体收集+探究水的组成(1)', '5', '9', '1', 'paper/05031112061175599.docx', 'fetj1908', '2020-05-03 11:12:06');
INSERT INTO `paper` VALUES ('1588', '九上-过关练习11-气体收集+探究水的组成', '5', '9', '1', 'paper/05031112249255341.docx', 'fetj1908', '2020-05-03 11:12:24');
INSERT INTO `paper` VALUES ('1589', '九上-过关练习12-质量守恒定律(1)', '5', '9', '1', 'paper/05031114266831440.docx', 'fetj1908', '2020-05-03 11:14:26');
INSERT INTO `paper` VALUES ('1590', '九上-过关练习12-质量守恒定律', '5', '9', '1', 'paper/05031114446545188.docx', 'fetj1908', '2020-05-03 11:14:44');
INSERT INTO `paper` VALUES ('1591', '九上-过关练习13-物质的量+溶液(1)', '5', '9', '1', 'paper/05031115132195586.docx', 'fetj1908', '2020-05-03 11:15:13');
INSERT INTO `paper` VALUES ('1592', '九上-过关练习13-物质的量+溶液', '5', '9', '1', 'paper/05031115321439748.docx', 'fetj1908', '2020-05-03 11:15:32');
INSERT INTO `paper` VALUES ('1593', '九上-过关练习14-物质的量', '5', '9', '1', 'paper/05031116212125792.docx', 'fetj1908', '2020-05-03 11:16:21');
INSERT INTO `paper` VALUES ('1594', '九上-过关练习14-物质的量(1)', '5', '9', '1', 'paper/05031117584263589.docx', 'fetj1908', '2020-05-03 11:17:58');
INSERT INTO `paper` VALUES ('1595', '九上-过关练习15-物质的组成与构成(1)', '5', '9', '1', 'paper/05031118243065715.docx', 'fetj1908', '2020-05-03 11:18:24');
INSERT INTO `paper` VALUES ('1596', '九上-过关练习15-物质的组成与构成', '5', '9', '1', 'paper/05031118435684325.docx', 'fetj1908', '2020-05-03 11:18:43');
INSERT INTO `paper` VALUES ('1597', '九上-过关练习16-物质的组成与分类(1)', '5', '9', '1', 'paper/05031119342934257.docx', 'fetj1908', '2020-05-03 11:19:34');
INSERT INTO `paper` VALUES ('1598', '九上-过关练习16-物质的组成与分类(1)', '5', '9', '1', 'paper/05031119526305788.docx', 'fetj1908', '2020-05-03 11:19:52');
INSERT INTO `paper` VALUES ('1599', '九上-过关练习17-化学用语(1)', '5', '9', '1', 'paper/05031120251723282.docx', 'fetj1908', '2020-05-03 11:20:25');
INSERT INTO `paper` VALUES ('1600', '九上-过关练习17-化学用语', '5', '9', '1', 'paper/05031120448197796.docx', 'fetj1908', '2020-05-03 11:20:44');
INSERT INTO `paper` VALUES ('1601', '九上-寒假练习（1）(1)', '5', '9', '1', 'paper/05031121134833897.docx', 'fetj1908', '2020-05-03 11:21:13');
INSERT INTO `paper` VALUES ('1602', '九上-寒假练习（1）', '5', '9', '1', 'paper/05031121309516618.docx', 'fetj1908', '2020-05-03 11:21:30');
INSERT INTO `paper` VALUES ('1603', '九上-寒假练习（2）(1)', '5', '9', '1', 'paper/05031122103329899.docx', 'fetj1908', '2020-05-03 11:22:10');
INSERT INTO `paper` VALUES ('1604', '九上-寒假练习（2）', '5', '9', '1', 'paper/05031123139088885.docx', 'fetj1908', '2020-05-03 11:23:13');
INSERT INTO `paper` VALUES ('1605', '九上-寒假练习（3）(1)', '5', '9', '1', 'paper/05031123434058001.docx', 'fetj1908', '2020-05-03 11:23:43');
INSERT INTO `paper` VALUES ('1606', '九上-寒假练习（3）', '5', '9', '1', 'paper/05031124019760195.docx', 'fetj1908', '2020-05-03 11:24:01');
INSERT INTO `paper` VALUES ('1607', '九上-寒假练习（4）(1)', '5', '9', '1', 'paper/05031124327841582.docx', 'fetj1908', '2020-05-03 11:24:32');
INSERT INTO `paper` VALUES ('1608', '九上-寒假练习（4）', '5', '9', '1', 'paper/05031124501795634.docx', 'fetj1908', '2020-05-03 11:24:50');
INSERT INTO `paper` VALUES ('1609', '九上-寒假练习（5）(1)', '5', '9', '1', 'paper/05031125186560252.docx', 'fetj1908', '2020-05-03 11:25:18');
INSERT INTO `paper` VALUES ('1610', '九上-寒假练习（5）', '5', '9', '1', 'paper/05031125526532852.docx', 'fetj1908', '2020-05-03 11:25:52');
INSERT INTO `paper` VALUES ('1611', '九上-寒假练习（6）(1)', '5', '9', '1', 'paper/05031126212239284.docx', 'fetj1908', '2020-05-03 11:26:21');
INSERT INTO `paper` VALUES ('1612', '九上-寒假练习（6）', '5', '9', '1', 'paper/05031126417663107.docx', 'fetj1908', '2020-05-03 11:26:41');
INSERT INTO `paper` VALUES ('1613', '九上-寒假练习（7）(1)', '5', '9', '1', 'paper/05031127117628738.docx', 'fetj1908', '2020-05-03 11:27:11');
INSERT INTO `paper` VALUES ('1614', '九上-寒假练习（7）', '5', '9', '1', 'paper/05031127316630160.docx', 'fetj1908', '2020-05-03 11:27:31');
INSERT INTO `paper` VALUES ('1615', '九上-化学式的书写和计算练习1(1)', '5', '9', '1', 'paper/05031128086074330.docx', 'fetj1908', '2020-05-03 11:28:08');
INSERT INTO `paper` VALUES ('1616', '九上-化学式的书写和计算练习1', '5', '9', '1', 'paper/05031128287389124.docx', 'fetj1908', '2020-05-03 11:28:28');
INSERT INTO `paper` VALUES ('1617', '九上-化学式的书写和计算练习1', '5', '9', '1', 'paper/05031129116171130.docx', 'fetj1908', '2020-05-03 11:29:11');
INSERT INTO `paper` VALUES ('1618', '九上-化学式的书写及计算练习2(1)', '5', '9', '1', 'paper/05031131327097930.docx', 'fetj1908', '2020-05-03 11:31:32');
INSERT INTO `paper` VALUES ('1619', '九上-化学式的书写及计算练习2', '5', '9', '1', 'paper/05031131503598422.docx', 'fetj1908', '2020-05-03 11:31:50');
INSERT INTO `paper` VALUES ('1620', '九上-期中综合练习卷(1)', '5', '9', '1', 'paper/05031132206324575.docx', 'fetj1908', '2020-05-03 11:32:20');
INSERT INTO `paper` VALUES ('1621', '九上-期中综合练习卷', '5', '9', '1', 'paper/05031132503588980.docx', 'fetj1908', '2020-05-03 11:32:50');
INSERT INTO `paper` VALUES ('1622', '九上-燃烧和灭火_练习(1)', '5', '9', '1', 'paper/05031133208704632.docx', 'fetj1908', '2020-05-03 11:33:20');
INSERT INTO `paper` VALUES ('1623', '九上-燃烧和灭火_练习', '5', '9', '1', 'paper/05031133398432364.docx', 'fetj1908', '2020-05-03 11:33:39');
INSERT INTO `paper` VALUES ('1624', '九上-溶解度计算练习(1)', '5', '9', '1', 'paper/05031134448824976.docx', 'fetj1908', '2020-05-03 11:34:44');
INSERT INTO `paper` VALUES ('1625', '九上-溶解度计算练习', '5', '9', '1', 'paper/05031135066373323.docx', 'fetj1908', '2020-05-03 11:35:06');
INSERT INTO `paper` VALUES ('1626', '九上-溶液补充练习1(1)', '5', '9', '1', 'paper/05031135411650412.docx', 'fetj1908', '2020-05-03 11:35:41');
INSERT INTO `paper` VALUES ('1627', '九上-溶液补充练习1', '5', '9', '1', 'paper/05031136012623928.docx', 'fetj1908', '2020-05-03 11:36:01');
INSERT INTO `paper` VALUES ('1628', '九上-溶液补充练习2(1)', '5', '9', '1', 'paper/05031136313473553.docx', 'fetj1908', '2020-05-03 11:36:31');
INSERT INTO `paper` VALUES ('1629', '九上-溶液补充练习2', '5', '9', '1', 'paper/05031136492487967.docx', 'fetj1908', '2020-05-03 11:36:49');
INSERT INTO `paper` VALUES ('1630', '九上-溶液补充练习3(1)', '5', '9', '1', 'paper/05031137228313799.docx', 'fetj1908', '2020-05-03 11:37:22');
INSERT INTO `paper` VALUES ('1631', '九上-溶液补充练习3', '5', '9', '1', 'paper/05031137418957675.docx', 'fetj1908', '2020-05-03 11:37:41');
INSERT INTO `paper` VALUES ('1632', '九上-溶液补充练习4(1)', '5', '9', '1', 'paper/05031138119002338.docx', 'fetj1908', '2020-05-03 11:38:11');
INSERT INTO `paper` VALUES ('1633', '九上-溶液补充练习4', '5', '9', '1', 'paper/05031138304133161.docx', 'fetj1908', '2020-05-03 11:38:30');
INSERT INTO `paper` VALUES ('1634', '九上-水电解问题探究练习(1)', '5', '9', '1', 'paper/05031139004843011.docx', 'fetj1908', '2020-05-03 11:39:00');
INSERT INTO `paper` VALUES ('1635', '九上-水电解问题探究练习', '5', '9', '1', 'paper/05031139185556951.docx', 'fetj1908', '2020-05-03 11:39:18');
INSERT INTO `paper` VALUES ('1636', '九上-碳补充练习(1)', '5', '9', '1', 'paper/05031139476633590.docx', 'fetj1908', '2020-05-03 11:39:47');
INSERT INTO `paper` VALUES ('1637', '九上-碳补充练习', '5', '9', '1', 'paper/05031140062478377.docx', 'fetj1908', '2020-05-03 11:40:06');
INSERT INTO `paper` VALUES ('1638', '九上-碳的燃烧补充练习(1)', '5', '9', '1', 'paper/05031140376499300.docx', 'fetj1908', '2020-05-03 11:40:37');
INSERT INTO `paper` VALUES ('1639', '九上-碳的燃烧补充练习', '5', '9', '1', 'paper/05031141392877499.docx', 'fetj1908', '2020-05-03 11:41:39');
INSERT INTO `paper` VALUES ('1640', '九上-物质的量应用练习(1)', '5', '9', '1', 'paper/05031142174156012.docx', 'fetj1908', '2020-05-03 11:42:17');
INSERT INTO `paper` VALUES ('1641', '九上-物质的量应用练习', '5', '9', '1', 'paper/05031142354968686.docx', 'fetj1908', '2020-05-03 11:42:35');
INSERT INTO `paper` VALUES ('1642', '九上-物质的溶解度练习(1)', '5', '9', '1', 'paper/05031143216141422.docx', 'fetj1908', '2020-05-03 11:43:21');
INSERT INTO `paper` VALUES ('1643', '九上-物质的溶解度练习', '5', '9', '1', 'paper/05031143398318942.docx', 'fetj1908', '2020-05-03 11:43:39');
INSERT INTO `paper` VALUES ('1644', '九上-物质的溶解性练习(1)', '5', '9', '1', 'paper/05031144071345937.docx', 'fetj1908', '2020-05-03 11:44:07');
INSERT INTO `paper` VALUES ('1645', '九上-物质的溶解性练习', '5', '9', '1', 'paper/05031144258388910.docx', 'fetj1908', '2020-05-03 11:44:25');
INSERT INTO `paper` VALUES ('1646', '九上学案-1.1化学使世界更美好（1）(1)', '5', '9', '1', 'paper/05031144572520499.docx', 'fetj1908', '2020-05-03 11:44:57');
INSERT INTO `paper` VALUES ('1647', '九上学案-1.1化学使世界更美好（1）', '5', '9', '1', 'paper/05031145214533087.docx', 'fetj1908', '2020-05-03 11:45:21');
INSERT INTO `paper` VALUES ('1648', '九上学案-1.1化学使世界更美好（２）(1)', '5', '9', '1', 'paper/05031145573985368.docx', 'fetj1908', '2020-05-03 11:45:57');
INSERT INTO `paper` VALUES ('1649', '九上学案-1.1化学使世界更美好（２）', '5', '9', '1', 'paper/05031156229321555.docx', 'fetj1908', '2020-05-03 11:56:22');
INSERT INTO `paper` VALUES ('1650', '九上学案-1.2走进化学实验室（1）(1)', '5', '9', '1', 'paper/05031156531528981.docx', 'fetj1908', '2020-05-03 11:56:53');
INSERT INTO `paper` VALUES ('1651', '九上学案-1.2走进化学实验室（1）', '5', '9', '1', 'paper/05031157119990288.docx', 'fetj1908', '2020-05-03 11:57:11');
INSERT INTO `paper` VALUES ('1652', '九上学案-1.2走进化学实验室（2）(1)', '5', '9', '1', 'paper/05031157376489198.docx', 'fetj1908', '2020-05-03 11:57:37');
INSERT INTO `paper` VALUES ('1653', '九上学案-1.2走进化学实验室（2）', '5', '9', '1', 'paper/05031158001274676.docx', 'fetj1908', '2020-05-03 11:58:00');
INSERT INTO `paper` VALUES ('1654', '九上学案-1.3物质的提纯(1)', '5', '9', '1', 'paper/05031158473539714.docx', 'fetj1908', '2020-05-03 11:58:47');
INSERT INTO `paper` VALUES ('1655', '九上学案-1.3物质的提纯', '5', '9', '1', 'paper/05031159086745909.docx', 'fetj1908', '2020-05-03 11:59:08');
INSERT INTO `paper` VALUES ('1656', '九上学案-1.2走进化学实验室（2）(1)', '5', '9', '1', 'paper/05031159406284939.docx', 'fetj1908', '2020-05-03 11:59:40');
INSERT INTO `paper` VALUES ('1657', '九上学案-1.2走进化学实验室（2）', '5', '9', '1', 'paper/05031200009878039.docx', 'fetj1908', '2020-05-03 12:00:00');
INSERT INTO `paper` VALUES ('1658', '九上学案-1.4世界通用的化学语言(1)', '5', '9', '1', 'paper/05031200324498561.docx', 'fetj1908', '2020-05-03 12:00:32');
INSERT INTO `paper` VALUES ('1659', '九上学案-1.4世界通用的化学语言', '5', '9', '1', 'paper/05031200502172971.docx', 'fetj1908', '2020-05-03 12:00:50');
INSERT INTO `paper` VALUES ('1660', '九上学案-2.1人类赖以生存的空气（1）(1)', '5', '9', '1', 'paper/05031201271961462.docx', 'fetj1908', '2020-05-03 12:01:27');
INSERT INTO `paper` VALUES ('1661', '九上学案-2.1人类赖以生存的空气（1）', '5', '9', '1', 'paper/05031201458901184.docx', 'fetj1908', '2020-05-03 12:01:45');
INSERT INTO `paper` VALUES ('1662', '九上学案-2.2神奇的氧气（1）(1)', '5', '9', '1', 'paper/05031202167427320.docx', 'fetj1908', '2020-05-03 12:02:16');
INSERT INTO `paper` VALUES ('1663', '九上学案-2.2神奇的氧气（1）', '5', '9', '1', 'paper/05031202426148669.docx', 'fetj1908', '2020-05-03 12:02:42');
INSERT INTO `paper` VALUES ('1664', '九上学案-2.2神奇的氧气（2）(1)', '5', '9', '1', 'paper/05031203186080692.docx', 'fetj1908', '2020-05-03 12:03:18');
INSERT INTO `paper` VALUES ('1665', '九上学案-2.2神奇的氧气（2）', '5', '9', '1', 'paper/05031203387204197.docx', 'fetj1908', '2020-05-03 12:03:38');
INSERT INTO `paper` VALUES ('1666', '九上学案-2.3化学变化中的质量守恒（1）(1)', '5', '9', '1', 'paper/05031204112664431.docx', 'fetj1908', '2020-05-03 12:04:11');
INSERT INTO `paper` VALUES ('1667', '九上学案-2.3化学变化中的质量守恒（1）', '5', '9', '1', 'paper/05031204294164566.docx', 'fetj1908', '2020-05-03 12:04:29');
INSERT INTO `paper` VALUES ('1668', '九上学案-2.3化学变化中的质量守恒（2）(1)', '5', '9', '1', 'paper/05031205007139560.docx', 'fetj1908', '2020-05-03 12:05:00');
INSERT INTO `paper` VALUES ('1669', '九上学案-2.3化学变化中的质量守恒（2）', '5', '9', '1', 'paper/05031205185357931.docx', 'fetj1908', '2020-05-03 12:05:18');
INSERT INTO `paper` VALUES ('1670', '九上学案-2.3化学变化中的质量守恒（3）(1)', '5', '9', '1', 'paper/05031205507583049.docx', 'fetj1908', '2020-05-03 12:05:50');
INSERT INTO `paper` VALUES ('1671', '九上学案-2.3化学变化中的质量守恒（3）(1)', '5', '9', '1', 'paper/05031206393994938.docx', 'fetj1908', '2020-05-03 12:06:39');
INSERT INTO `paper` VALUES ('1672', '九上学案-2.3化学变化中的质量守恒（3）', '5', '9', '1', 'paper/05031207016937086.docx', 'fetj1908', '2020-05-03 12:07:01');
INSERT INTO `paper` VALUES ('1673', '九上学案-2.3化学变化中的质量守恒（4）(1)', '5', '9', '1', 'paper/05031207403137182.docx', 'fetj1908', '2020-05-03 12:07:40');
INSERT INTO `paper` VALUES ('1674', '九上学案-2.3化学变化中的质量守恒（4）', '5', '9', '1', 'paper/05031208069580010.docx', 'fetj1908', '2020-05-03 12:08:06');
INSERT INTO `paper` VALUES ('1675', '2017届七宝中学高三下高考冲刺周练卷', '3', '12', '2', 'paper/05031208154732078.doc', 'oqrj1908', '2020-05-03 12:08:15');
INSERT INTO `paper` VALUES ('1676', '九上学案-3.1水（1）(1)', '5', '9', '1', 'paper/05031208388029937.docx', 'fetj1908', '2020-05-03 12:08:38');
INSERT INTO `paper` VALUES ('1677', '2018-2019曹杨二中高一下英语3月月考', '3', '10', '2', 'paper/05031208445007654.docx', 'oqrj1908', '2020-05-03 12:08:44');
INSERT INTO `paper` VALUES ('1678', '九上学案-3.1水（1）', '5', '9', '1', 'paper/05031208572866302.docx', 'fetj1908', '2020-05-03 12:08:57');
INSERT INTO `paper` VALUES ('1679', '2018-2019学年复附高二下英语3月周练1', '3', '11', '2', 'paper/05031209088952778.docx', 'oqrj1908', '2020-05-03 12:09:08');
INSERT INTO `paper` VALUES ('1680', '九上学案-3.1水（2）(1)', '5', '9', '1', 'paper/05031209287506133.docx', 'fetj1908', '2020-05-03 12:09:28');
INSERT INTO `paper` VALUES ('1681', '2018-2019学年格致中学高二下三月月考', '3', '11', '2', 'paper/05031209338396861.docx', 'oqrj1908', '2020-05-03 12:09:33');
INSERT INTO `paper` VALUES ('1682', '九上学案-3.1水（2）', '5', '9', '1', 'paper/05031209468277732.docx', 'fetj1908', '2020-05-03 12:09:46');
INSERT INTO `paper` VALUES ('1683', '2018-2019学年建平、控江中学高三下英语3月周考', '3', '12', '2', 'paper/05031210034935493.docx', 'oqrj1908', '2020-05-03 12:10:03');
INSERT INTO `paper` VALUES ('1684', '九上学案-3.2溶液（1）(1)', '5', '9', '1', 'paper/05031210248572324.docx', 'fetj1908', '2020-05-03 12:10:24');
INSERT INTO `paper` VALUES ('1685', '2018-2019学年建平中学高三下英语第一次月考', '3', '12', '2', 'paper/05031210326801207.docx', 'oqrj1908', '2020-05-03 12:10:32');
INSERT INTO `paper` VALUES ('1686', '九上学案-3.2溶液（1）', '5', '9', '1', 'paper/05031210465282602.docx', 'fetj1908', '2020-05-03 12:10:46');
INSERT INTO `paper` VALUES ('1687', '2018-2019学年建平中学高三下英语周练', '3', '12', '2', 'paper/05031210562043501.docx', 'oqrj1908', '2020-05-03 12:10:56');
INSERT INTO `paper` VALUES ('1688', '九上学案-3.2溶液（2）(1)', '5', '9', '1', 'paper/05031211247498587.docx', 'fetj1908', '2020-05-03 12:11:24');
INSERT INTO `paper` VALUES ('1689', '2018-2019学年交大附中高二下英语摸底考', '3', '11', '2', 'paper/05031211272098031.docx', 'oqrj1908', '2020-05-03 12:11:27');
INSERT INTO `paper` VALUES ('1690', '九上学案-3.2溶液（2）', '5', '9', '1', 'paper/05031211435066622.docx', 'fetj1908', '2020-05-03 12:11:43');
INSERT INTO `paper` VALUES ('1691', '2018-2019学年进才中学高三下英语3月月考', '3', '12', '2', 'paper/05031212061991934.docx', 'oqrj1908', '2020-05-03 12:12:06');
INSERT INTO `paper` VALUES ('1692', '九上学案-3.2溶液（3）(1)', '5', '9', '1', 'paper/05031212147036220.docx', 'fetj1908', '2020-05-03 12:12:14');
INSERT INTO `paper` VALUES ('1693', '九上学案-3.2溶液（3）', '5', '9', '1', 'paper/05031212322480767.docx', 'fetj1908', '2020-05-03 12:12:32');
INSERT INTO `paper` VALUES ('1694', '2018-2019学年晋元高级中学英语高二下3月月考', '3', '11', '2', 'paper/05031212351081957.docx', 'oqrj1908', '2020-05-03 12:12:35');
INSERT INTO `paper` VALUES ('1695', '2018-2019学年卢湾高级中学高三下三月月考', '3', '12', '2', 'paper/05031212581282546.docx', 'oqrj1908', '2020-05-03 12:12:58');
INSERT INTO `paper` VALUES ('1696', '九上学案-3.2溶液（4）(1)', '5', '9', '1', 'paper/05031213118493707.docx', 'fetj1908', '2020-05-03 12:13:11');
INSERT INTO `paper` VALUES ('1697', '2018-2019学年南洋模范高一下英语第一次月考', '3', '10', '2', 'paper/05031213249236450.docx', 'oqrj1908', '2020-05-03 12:13:24');
INSERT INTO `paper` VALUES ('1698', '九上学案-3.2溶液（4）', '5', '9', '1', 'paper/05031213292177720.docx', 'fetj1908', '2020-05-03 12:13:29');
INSERT INTO `paper` VALUES ('1699', '2018-2019学年上海高三下英语学校联考', '3', '12', '2', 'paper/05031213501065581.docx', 'oqrj1908', '2020-05-03 12:13:50');
INSERT INTO `paper` VALUES ('1700', '九上学案-3.2溶液（5）(1)', '5', '9', '1', 'paper/05031213595018055.docx', 'fetj1908', '2020-05-03 12:13:59');
INSERT INTO `paper` VALUES ('1701', '2018-2019学年上外附中（闵行分校）高三下英语第一次月考', '3', '12', '2', 'paper/05031214172456978.docx', 'oqrj1908', '2020-05-03 12:14:17');
INSERT INTO `paper` VALUES ('1702', '九上学案-3.2溶液（5）', '5', '9', '1', 'paper/05031214183963600.docx', 'fetj1908', '2020-05-03 12:14:18');
INSERT INTO `paper` VALUES ('1703', '2018-2019学年上外附中高二下英语周练', '3', '11', '2', 'paper/05031214505932537.docx', 'oqrj1908', '2020-05-03 12:14:50');
INSERT INTO `paper` VALUES ('1704', '九上学案-3.3溶液的酸碱性(1)', '5', '9', '1', 'paper/05031214529822153.docx', 'fetj1908', '2020-05-03 12:14:52');
INSERT INTO `paper` VALUES ('1705', '九上学案-3.3溶液的酸碱性', '5', '9', '1', 'paper/05031215144358982.docx', 'fetj1908', '2020-05-03 12:15:14');
INSERT INTO `paper` VALUES ('1706', '2018-2019学年松江二中、奉贤、金山三校高三下英语3月联考', '3', '12', '2', 'paper/05031215202983325.docx', 'oqrj1908', '2020-05-03 12:15:20');
INSERT INTO `paper` VALUES ('1707', '九上学案-4.1燃烧与灭火(1)', '5', '9', '1', 'paper/05031215553579321.docx', 'fetj1908', '2020-05-03 12:15:55');
INSERT INTO `paper` VALUES ('1708', '2018-2019学年洋泾中学高二下英语3月月考', '3', '11', '2', 'paper/05031216134869479.docx', 'oqrj1908', '2020-05-03 12:16:13');
INSERT INTO `paper` VALUES ('1709', '九上学案-4.1燃烧与灭火', '5', '9', '1', 'paper/05031216132767565.docx', 'fetj1908', '2020-05-03 12:16:13');
INSERT INTO `paper` VALUES ('1710', '2019届宝山区高考英语二模', '3', '12', '2', 'paper/05031216485560514.docx', 'oqrj1908', '2020-05-03 12:16:48');
INSERT INTO `paper` VALUES ('1711', '九上学案-4.2碳（1）(1)', '5', '9', '1', 'paper/05031216507804265.docx', 'fetj1908', '2020-05-03 12:16:50');
INSERT INTO `paper` VALUES ('1712', '九上学案-4.2碳（1）', '5', '9', '1', 'paper/05031217125853449.docx', 'fetj1908', '2020-05-03 12:17:12');
INSERT INTO `paper` VALUES ('1713', '2019届崇明区高考英语二模', '3', '12', '2', 'paper/05031217279855093.doc', 'oqrj1908', '2020-05-03 12:17:27');
INSERT INTO `paper` VALUES ('1714', '2019届奉贤区高考英语二模', '3', '12', '2', 'paper/05031217563852837.docx', 'oqrj1908', '2020-05-03 12:17:56');
INSERT INTO `paper` VALUES ('1715', '九上学案-4.2碳（2）(1)', '5', '9', '1', 'paper/05031218016515501.docx', 'fetj1908', '2020-05-03 12:18:01');
INSERT INTO `paper` VALUES ('1716', '九上学案-4.2碳（2）', '5', '9', '1', 'paper/05031218226707838.docx', 'fetj1908', '2020-05-03 12:18:22');
INSERT INTO `paper` VALUES ('1717', '2019届虹口区高考英语二模', '3', '12', '2', 'paper/05031218536428819.docx', 'oqrj1908', '2020-05-03 12:18:53');
INSERT INTO `paper` VALUES ('1718', '九上学案-4.2碳（3）(1)', '5', '9', '1', 'paper/05031218533857801.docx', 'fetj1908', '2020-05-03 12:18:53');
INSERT INTO `paper` VALUES ('1719', '九上学案-4.2碳（3）', '5', '9', '1', 'paper/05031219239390979.docx', 'fetj1908', '2020-05-03 12:19:23');
INSERT INTO `paper` VALUES ('1720', '2019届黄浦区高考英语二模', '3', '12', '2', 'paper/05031219237501027.docx', 'oqrj1908', '2020-05-03 12:19:23');
INSERT INTO `paper` VALUES ('1721', '2019届嘉定区高考英语二模', '3', '12', '2', 'paper/05031219515321924.docx', 'oqrj1908', '2020-05-03 12:19:51');
INSERT INTO `paper` VALUES ('1722', '九上学案-4.3二氧化碳的实验室制法(1)', '5', '9', '1', 'paper/05031219551037742.docx', 'fetj1908', '2020-05-03 12:19:55');
INSERT INTO `paper` VALUES ('1723', '2019届浦东新区高考英语二模(完整版)', '3', '12', '2', 'paper/05031220156110288.docx', 'oqrj1908', '2020-05-03 12:20:15');
INSERT INTO `paper` VALUES ('1724', '九上学案-4.3二氧化碳的实验室制法', '5', '9', '1', 'paper/05031220188241738.docx', 'fetj1908', '2020-05-03 12:20:18');
INSERT INTO `paper` VALUES ('1725', '2019届普陀区高考英语二模', '3', '12', '2', 'paper/05031220448357921.doc', 'oqrj1908', '2020-05-03 12:20:44');
INSERT INTO `paper` VALUES ('1726', '九上学案-4.4化学燃料(1)', '5', '9', '1', 'paper/05031220539240812.docx', 'fetj1908', '2020-05-03 12:20:53');
INSERT INTO `paper` VALUES ('1727', '九上学案-4.4化学燃料', '5', '9', '1', 'paper/05031221126047324.docx', 'fetj1908', '2020-05-03 12:21:12');
INSERT INTO `paper` VALUES ('1728', '2019届青浦区高考英语二模', '3', '12', '2', 'paper/05031221144030803.docx', 'oqrj1908', '2020-05-03 12:21:14');
INSERT INTO `paper` VALUES ('1729', '2019届徐汇区高考英语二模', '3', '12', '2', 'paper/05031221408889907.doc', 'oqrj1908', '2020-05-03 12:21:40');
INSERT INTO `paper` VALUES ('1730', '九上-有关溶质质量分数的计算练习(1)', '5', '9', '1', 'paper/05031221472196060.docx', 'fetj1908', '2020-05-03 12:21:47');
INSERT INTO `paper` VALUES ('1731', '九上-有关溶质质量分数的计算练习', '5', '9', '1', 'paper/05031222061868361.docx', 'fetj1908', '2020-05-03 12:22:06');
INSERT INTO `paper` VALUES ('1732', '2019届杨浦区高考英语二模', '3', '12', '2', 'paper/05031222114391375.docx', 'oqrj1908', '2020-05-03 12:22:11');
INSERT INTO `paper` VALUES ('1733', '九上-质量守恒定律应用练习(1)', '5', '9', '1', 'paper/05031222435397011.docx', 'fetj1908', '2020-05-03 12:22:43');
INSERT INTO `paper` VALUES ('1734', '2019届长宁区高考英语二模', '3', '12', '2', 'paper/05031222468234912.docx', 'oqrj1908', '2020-05-03 12:22:46');
INSERT INTO `paper` VALUES ('1735', '复旦附中高中汉译英练习100句', '3', '12', '2', 'paper/05031223161831145.docx', 'oqrj1908', '2020-05-03 12:23:16');
INSERT INTO `paper` VALUES ('1736', '高三（新题型+六选四+概要写作）专练Test_1', '3', '12', '2', 'paper/05031223437852902.docx', 'oqrj1908', '2020-05-03 12:23:43');
INSERT INTO `paper` VALUES ('1737', '高三（新题型+六选四+概要写作）专练Test_2', '3', '12', '2', 'paper/05031224043067983.docx', 'oqrj1908', '2020-05-03 12:24:04');
INSERT INTO `paper` VALUES ('1738', '高中英语试题短语练习集', '3', '12', '2', 'paper/05031224302899150.doc', 'oqrj1908', '2020-05-03 12:24:30');
INSERT INTO `paper` VALUES ('1739', '高考作文学生易犯错误和指导策略', '3', '12', '2', 'paper/05031224586464679.docx', 'oqrj1908', '2020-05-03 12:24:58');
INSERT INTO `paper` VALUES ('1740', '2017-2018届建平中学高三下英语3月周练', '3', '12', '2', 'paper/05031226209247203.docx', 'oqrj1908', '2020-05-03 12:26:20');
INSERT INTO `paper` VALUES ('1741', '2017-2018学年建平中学高三英语开学考', '3', '12', '2', 'paper/05031226396133454.docx', 'oqrj1908', '2020-05-03 12:26:39');
INSERT INTO `paper` VALUES ('1742', '2017-2018学年南洋模范高三下三月考试', '3', '12', '2', 'paper/05031227057290575.docx', 'oqrj1908', '2020-05-03 12:27:05');
INSERT INTO `paper` VALUES ('1743', '2017-2018学年七宝中学高三下英语三月考试', '3', '12', '2', 'paper/05031227325073906.docx', 'oqrj1908', '2020-05-03 12:27:32');
INSERT INTO `paper` VALUES ('1744', '2017-2018学年上师大附中高三下英语三月月考', '3', '12', '2', 'paper/05031229329938803.docx', 'oqrj1908', '2020-05-03 12:29:32');
INSERT INTO `paper` VALUES ('1745', '2018-2019学年高三iread试卷11', '3', '12', '2', 'paper/05031229555254001.docx', 'oqrj1908', '2020-05-03 12:29:55');
INSERT INTO `paper` VALUES ('1746', '2018-2019学年高三iread试卷12', '3', '12', '2', 'paper/05031230147676733.docx', 'oqrj1908', '2020-05-03 12:30:14');
INSERT INTO `paper` VALUES ('1747', '2018-2019学年建平中学高三下英语开学考', '3', '12', '2', 'paper/05031230386035709.docx', 'oqrj1908', '2020-05-03 12:30:38');
INSERT INTO `paper` VALUES ('1748', '2018-2019学年进才中学高三下英语开学考', '3', '12', '2', 'paper/05031231013172286.docx', 'oqrj1908', '2020-05-03 12:31:01');
INSERT INTO `paper` VALUES ('1749', '九上-质量守恒定律应用练习', '5', '9', '1', 'paper/05031231171715072.docx', 'fetj1908', '2020-05-03 12:31:17');
INSERT INTO `paper` VALUES ('1750', '2018-2019学年进才中学高三英语三月周考', '3', '12', '2', 'paper/05031231273517357.docx', 'oqrj1908', '2020-05-03 12:31:27');
INSERT INTO `paper` VALUES ('1751', '2018-2019学年上师大附中高三下英语三月月考', '3', '12', '2', 'paper/05031231523834325.docx', 'oqrj1908', '2020-05-03 12:31:52');
INSERT INTO `paper` VALUES ('1752', '2018年IRead试卷作文范文12篇', '3', '12', '2', 'paper/05031232208522838.doc', 'oqrj1908', '2020-05-03 12:32:20');
INSERT INTO `paper` VALUES ('1753', '2019届高考一模作文汇编', '3', '12', '2', 'paper/05031232458145223.docx', 'oqrj1908', '2020-05-03 12:32:45');
INSERT INTO `paper` VALUES ('1754', '高考词汇3500词练习题A--C', '3', '12', '2', 'paper/05031233098556154.docx', 'oqrj1908', '2020-05-03 12:33:09');
INSERT INTO `paper` VALUES ('1755', '高考词汇3500词练习题D--H', '3', '12', '2', 'paper/05031233349588463.docx', 'oqrj1908', '2020-05-03 12:33:34');
INSERT INTO `paper` VALUES ('1756', '高考词汇3500词练习题I--O', '3', '12', '2', 'paper/05031233597713675.docx', 'oqrj1908', '2020-05-03 12:33:59');
INSERT INTO `paper` VALUES ('1757', '高考词汇3500词练习题P-S', '3', '12', '2', 'paper/05031234251682691.docx', 'oqrj1908', '2020-05-03 12:34:25');
INSERT INTO `paper` VALUES ('1758', '高考词汇3500词练习题T-Z', '3', '12', '2', 'paper/05031234536214037.docx', 'oqrj1908', '2020-05-03 12:34:53');
INSERT INTO `paper` VALUES ('1759', '高考作文学生易犯错误和指导策略', '3', '12', '2', 'paper/05031235203955633.docx', 'oqrj1908', '2020-05-03 12:35:20');
INSERT INTO `paper` VALUES ('1760', '高中英语话题写作必备词汇分类总结（体育、购物、饮食、假日等）', '3', '12', '2', 'paper/05031235449901915.docx', 'oqrj1908', '2020-05-03 12:35:44');
INSERT INTO `paper` VALUES ('1761', '高中英语话题写作必备词汇分类总结（网络、科技、语言、自然等）', '3', '12', '2', 'paper/05031236139563169.docx', 'oqrj1908', '2020-05-03 12:36:13');
INSERT INTO `paper` VALUES ('1762', '高中英语长难句分析--技巧篇（附练习题）', '3', '12', '2', 'paper/05031236392072158.doc', 'oqrj1908', '2020-05-03 12:36:39');
INSERT INTO `paper` VALUES ('1763', '高中英语长难句分析--模拟卷汇编1（多个从句综合）', '3', '12', '2', 'paper/05031237059667044.docx', 'oqrj1908', '2020-05-03 12:37:05');
INSERT INTO `paper` VALUES ('1764', '高中英语长难句分析--长句分析1（附语法分析）', '3', '12', '2', 'paper/05031237404014479.docx', 'oqrj1908', '2020-05-03 12:37:40');
INSERT INTO `paper` VALUES ('1765', '高中英语长难句分析--长句分析2（附语法分析）', '3', '12', '2', 'paper/05031238048800914.docx', 'oqrj1908', '2020-05-03 12:38:04');
INSERT INTO `paper` VALUES ('1766', '上海高考翻译常见动词搭配', '3', '12', '2', 'paper/05031238304901415.docx', 'oqrj1908', '2020-05-03 12:38:30');
INSERT INTO `paper` VALUES ('1767', '上海高考翻译常见名词搭配', '3', '12', '2', 'paper/05031239011871722.docx', 'oqrj1908', '2020-05-03 12:39:01');
INSERT INTO `paper` VALUES ('1768', '上海高考翻译常见形容词搭配', '3', '12', '2', 'paper/05031239202041947.docx', 'oqrj1908', '2020-05-03 12:39:20');
INSERT INTO `paper` VALUES ('1769', '上海高考作文指导写作练习12篇', '3', '12', '2', 'paper/05031239454286194.docx', 'oqrj1908', '2020-05-03 12:39:45');
INSERT INTO `paper` VALUES ('1770', '2017-2018学年控江中学高一下开学考', '3', '10', '2', 'paper/05031240569437115.docx', 'oqrj1908', '2020-05-03 12:40:56');
INSERT INTO `paper` VALUES ('1771', '2017-2018学年南汇中学高二下英语月考', '3', '11', '2', 'paper/05031241211424807.docx', 'oqrj1908', '2020-05-03 12:41:21');
INSERT INTO `paper` VALUES ('1772', '2018-2019学年复旦附中高二下英语开学考', '3', '11', '2', 'paper/05031241449207967.docx', 'oqrj1908', '2020-05-03 12:41:44');
INSERT INTO `paper` VALUES ('1773', '2019届宝山区高考英语二模', '3', '12', '2', 'paper/05031242292045913.docx', 'oqrj1908', '2020-05-03 12:42:29');
INSERT INTO `paper` VALUES ('1774', '2019届崇明区高考英语二模', '3', '12', '2', 'paper/05031242559197839.doc', 'oqrj1908', '2020-05-03 12:42:55');
INSERT INTO `paper` VALUES ('1775', '2019届奉贤区高考英语二模', '3', '12', '2', 'paper/05031243235369534.docx', 'oqrj1908', '2020-05-03 12:43:23');
INSERT INTO `paper` VALUES ('1776', '2019届虹口区高考英语二模', '3', '12', '2', 'paper/05031243445990418.docx', 'oqrj1908', '2020-05-03 12:43:44');
INSERT INTO `paper` VALUES ('1777', '2019届黄浦区高考英语二模', '3', '12', '2', 'paper/05031244071640971.docx', 'oqrj1908', '2020-05-03 12:44:07');
INSERT INTO `paper` VALUES ('1778', '2019届嘉定区高考英语二模_20190722_172836', '3', '12', '2', 'paper/05031244367656704.docx', 'oqrj1908', '2020-05-03 12:44:36');
INSERT INTO `paper` VALUES ('1779', '2019届金山区高考英语二模', '3', '12', '2', 'paper/05031244578545435.docx', 'oqrj1908', '2020-05-03 12:44:57');
INSERT INTO `paper` VALUES ('1780', '2014年四校自招物理牛顿定律卷', '4', '9', '2', 'paper/05031411407780672.doc', 'fetj1908', '2020-05-03 14:11:40');
INSERT INTO `paper` VALUES ('1781', '2014年四校自招物理受力分析卷', '4', '9', '2', 'paper/05031426202010821.doc', 'fetj1908', '2020-05-03 14:26:20');
INSERT INTO `paper` VALUES ('1782', '2014年四校自招物理运动分析卷', '4', '9', '2', 'paper/05031426431200373.doc', 'fetj1908', '2020-05-03 14:26:43');
INSERT INTO `paper` VALUES ('1783', '2014四校自招真题（进华中学用）', '4', '9', '2', 'paper/05031427116527378.doc', 'fetj1908', '2020-05-03 14:27:11');
INSERT INTO `paper` VALUES ('1784', '2017自招物理试题汇编-教师版', '4', '9', '2', 'paper/05031427364346518.doc', 'fetj1908', '2020-05-03 14:27:36');
INSERT INTO `paper` VALUES ('1785', '2020上海市七宝第二中学九年级物理第二学期3月月考试卷(pdf无答案)', '4', '9', '2', 'paper/05031428031201433.doc', 'fetj1908', '2020-05-03 14:28:03');
INSERT INTO `paper` VALUES ('1786', '答案-四校自招模拟题-物理卷', '4', '9', '2', 'paper/05031428376667258.doc', 'fetj1908', '2020-05-03 14:28:37');
INSERT INTO `paper` VALUES ('1787', '复兴物理自招题', '4', '9', '2', 'paper/05031429053896281.doc', 'fetj1908', '2020-05-03 14:29:05');
INSERT INTO `paper` VALUES ('1788', '华二初中物理自招练习1', '4', '9', '2', 'paper/05031429284257111.doc', 'fetj1908', '2020-05-03 14:29:28');
INSERT INTO `paper` VALUES ('1789', '华二自招压强浮力1', '4', '9', '2', 'paper/05031430012755174.doc', 'fetj1908', '2020-05-03 14:30:01');
INSERT INTO `paper` VALUES ('1790', '华二自招压强浮力2', '4', '9', '2', 'paper/05031430285480574.doc', 'fetj1908', '2020-05-03 14:30:28');
INSERT INTO `paper` VALUES ('1791', '华师大二附中中考自主招生内部资料_部分1', '4', '9', '2', 'paper/05031431014368456.doc', 'fetj1908', '2020-05-03 14:31:01');
INSERT INTO `paper` VALUES ('1792', '华师大二附中中考自主招生内部资料_部分2', '4', '9', '2', 'paper/05031431366595831.doc', 'fetj1908', '2020-05-03 14:31:36');
INSERT INTO `paper` VALUES ('1793', '上海外国语大学附属双语学校初二物理第二学期第一次阶段测试（无答案PDF）', '4', '9', '2', 'paper/05031432029101365.doc', 'fetj1908', '2020-05-03 14:32:02');
INSERT INTO `paper` VALUES ('1794', '上外直升考综合卷1', '4', '9', '2', 'paper/05031432297991168.doc', 'fetj1908', '2020-05-03 14:32:29');
INSERT INTO `paper` VALUES ('1795', '上外直升考综合卷2', '4', '9', '2', 'paper/05031432569194361.doc', 'fetj1908', '2020-05-03 14:32:56');
INSERT INTO `paper` VALUES ('1796', '上外直升考综合卷答案', '4', '9', '2', 'paper/05031433239919427.doc', 'fetj1908', '2020-05-03 14:33:23');
INSERT INTO `paper` VALUES ('1797', '四校自招模拟题-物理卷', '4', '9', '2', 'paper/05031433454898008.doc', 'fetj1908', '2020-05-03 14:33:45');
INSERT INTO `paper` VALUES ('1798', '四校自招-物理卷解析', '4', '9', '2', 'paper/05031434137128520.doc', 'fetj1908', '2020-05-03 14:34:13');
INSERT INTO `paper` VALUES ('1799', '四校自招-物理牛顿定律卷', '4', '9', '2', 'paper/05031434361626179.doc', 'fetj1908', '2020-05-03 14:34:36');
INSERT INTO `paper` VALUES ('1800', '四校自招-物理受力分析卷', '4', '9', '2', 'paper/05031435002687940.doc', 'fetj1908', '2020-05-03 14:35:00');
INSERT INTO `paper` VALUES ('1801', '四校自招-物理运动分析卷', '4', '9', '2', 'paper/05031435327650888.doc', 'fetj1908', '2020-05-03 14:35:32');
INSERT INTO `paper` VALUES ('1802', '2019届浦东新区高考英语二模(完整版)', '3', '12', '2', 'paper/05031620526401464.docx', 'oqrj1908', '2020-05-03 16:20:52');
INSERT INTO `paper` VALUES ('1803', '2019届普陀区高考英语二模', '3', '12', '2', 'paper/05031621205903589.doc', 'oqrj1908', '2020-05-03 16:21:20');
INSERT INTO `paper` VALUES ('1804', '2019届青浦区高考英语二模', '3', '12', '2', 'paper/05031621423590274.docx', 'oqrj1908', '2020-05-03 16:21:42');
INSERT INTO `paper` VALUES ('1805', '2019届松江、闵行区高考英语二模', '3', '12', '2', 'paper/05031622028540825.docx', 'oqrj1908', '2020-05-03 16:22:02');
INSERT INTO `paper` VALUES ('1806', '2019届徐汇区高考英语二模', '3', '12', '2', 'paper/05031622243814900.doc', 'oqrj1908', '2020-05-03 16:22:24');
INSERT INTO `paper` VALUES ('1807', '2019届杨浦区高考英语二模', '3', '12', '2', 'paper/05031622518401308.docx', 'oqrj1908', '2020-05-03 16:22:51');
INSERT INTO `paper` VALUES ('1808', '2019届长宁区高考英语二模', '3', '12', '2', 'paper/05031623227717658.docx', 'oqrj1908', '2020-05-03 16:23:22');
INSERT INTO `paper` VALUES ('1809', '2017-2018年上海市嘉定区九上期中', '2', '9', '1', 'paper/05041119586203019.docx', 'vkjt1908', '2020-05-04 11:19:58');
INSERT INTO `paper` VALUES ('1810', '2017-2018年上海市建平西校九上第二次月考', '2', '9', '1', 'paper/05041120392276555.docx', 'vkjt1908', '2020-05-04 11:20:39');
INSERT INTO `paper` VALUES ('1811', '2017-2018年上海市立达中学九上月考', '2', '9', '1', 'paper/05041121328414663.docx', 'vkjt1908', '2020-05-04 11:21:32');
INSERT INTO `paper` VALUES ('1812', '2017-2018年上海市青浦区九上期中', '2', '9', '1', 'paper/05041122596284446.docx', 'vkjt1908', '2020-05-04 11:22:59');
INSERT INTO `paper` VALUES ('1813', '2017-2018年上海市上宝中学九上第二次月考', '2', '9', '1', 'paper/05041123403973256.docx', 'vkjt1908', '2020-05-04 11:23:40');
INSERT INTO `paper` VALUES ('1814', '2017-2018年上海市上宝中学九上周末压轴练习十', '2', '9', '1', 'paper/05041124182207236.docx', 'vkjt1908', '2020-05-04 11:24:18');
INSERT INTO `paper` VALUES ('1815', '2017-2018年上海市上宝中学九上压轴题天天练1-4', '2', '9', '1', 'paper/05041124546471391.docx', 'vkjt1908', '2020-05-04 11:24:54');
INSERT INTO `paper` VALUES ('1816', '2017-2018年上海市上宝中学一模模拟', '2', '9', '1', 'paper/05041125367434282.docx', 'vkjt1908', '2020-05-04 11:25:36');
INSERT INTO `paper` VALUES ('1817', '2017-2018年上海市上宝中学九上周练12.04', '2', '9', '1', 'paper/05041127213333713.docx', 'vkjt1908', '2020-05-04 11:27:21');
INSERT INTO `paper` VALUES ('1818', '2017-2018年上海市上外附中九上期中', '2', '9', '1', 'paper/05041132346685792.docx', 'vkjt1908', '2020-05-04 11:32:34');
INSERT INTO `paper` VALUES ('1819', '2017-2018年上海市市北初级九上月考练习_(2)', '2', '9', '1', 'paper/05041133111918345.docx', 'vkjt1908', '2020-05-04 11:33:11');
INSERT INTO `paper` VALUES ('1820', '2017-2018年上海市西南位育中学九上周练三', '2', '9', '1', 'paper/05041133464523851.docx', 'vkjt1908', '2020-05-04 11:33:46');
INSERT INTO `paper` VALUES ('1821', '2018-2019年上海市川沙中学南校九上10月月考（和去年的考卷一样）', '2', '9', '1', 'paper/05041134249837576.docx', 'vkjt1908', '2020-05-04 11:34:24');
INSERT INTO `paper` VALUES ('1822', '2018-2019年上海市第四教育署九上10月月考', '2', '9', '1', 'paper/05041135124678654.docx', 'vkjt1908', '2020-05-04 11:35:12');
INSERT INTO `paper` VALUES ('1823', '2018-2019年上海市格致初级九上10月月考', '2', '9', '1', 'paper/05041237583588297.docx', 'vkjt1908', '2020-05-04 12:37:58');
INSERT INTO `paper` VALUES ('1824', '2018-2019年上海市龚路中学九上10月月考', '2', '9', '1', 'paper/05041349365203501.docx', 'vkjt1908', '2020-05-04 13:49:36');
INSERT INTO `paper` VALUES ('1825', '2018-2019年上海市虹口区九上期中', '2', '9', '1', 'paper/05041352216604550.docx', 'vkjt1908', '2020-05-04 13:52:21');
INSERT INTO `paper` VALUES ('1826', '2018-2019年上海市建平西校九上期中', '2', '9', '1', 'paper/05041353189523947.docx', 'vkjt1908', '2020-05-04 13:53:18');
INSERT INTO `paper` VALUES ('1827', '2018-2019年上海市建平西校九上单元练习', '2', '9', '1', 'paper/05041354047682965.docx', 'vkjt1908', '2020-05-04 13:54:04');
INSERT INTO `paper` VALUES ('1828', '2018-2019年上海市控江附属民办学校九上12月月考', '2', '9', '1', 'paper/05041354588605612.docx', 'vkjt1908', '2020-05-04 13:54:58');
INSERT INTO `paper` VALUES ('1829', '2018-2019年上海市浦东第四教育署九上期中', '2', '9', '1', 'paper/05041357185165332.docx', 'vkjt1908', '2020-05-04 13:57:18');
INSERT INTO `paper` VALUES ('1830', '2018-2019年上海市浦东第一教育署九上期中', '2', '9', '1', 'paper/05041357585138106.docx', 'vkjt1908', '2020-05-04 13:57:58');
INSERT INTO `paper` VALUES ('1831', '2018-2019年上海市普陀区九上期中', '2', '9', '1', 'paper/05041358329429974.docx', 'vkjt1908', '2020-05-04 13:58:32');
INSERT INTO `paper` VALUES ('1832', '2018-2019年上海市七宝二中九上期中', '2', '9', '1', 'paper/05041359514895399.docx', 'vkjt1908', '2020-05-04 13:59:51');
INSERT INTO `paper` VALUES ('1833', '2018-2019年上海市上南南校九上10月月考', '2', '9', '1', 'paper/05041400276955274.docx', 'vkjt1908', '2020-05-04 14:00:27');
INSERT INTO `paper` VALUES ('1834', '2018-2019年上海市松江区九上期中', '2', '9', '1', 'paper/05041401148954097.docx', 'vkjt1908', '2020-05-04 14:01:14');
INSERT INTO `paper` VALUES ('1835', '2018-2019年上海市西南模范九上10月月考', '2', '9', '1', 'paper/05041402269562848.docx', 'vkjt1908', '2020-05-04 14:02:26');
INSERT INTO `paper` VALUES ('1836', '2018-2019年上海市新竹园九上周测', '2', '9', '1', 'paper/05041403427961836.docx', 'vkjt1908', '2020-05-04 14:03:42');
INSERT INTO `paper` VALUES ('1837', '2018-2019年上海市杨浦区九上期中', '2', '9', '1', 'paper/05041404464443426.docx', 'vkjt1908', '2020-05-04 14:04:46');
INSERT INTO `paper` VALUES ('1838', '2018-2019年上海市玉华中学九上第一次月考', '2', '9', '1', 'paper/05041405353264027.docx', 'vkjt1908', '2020-05-04 14:05:35');
INSERT INTO `paper` VALUES ('1839', '2018年上海市宝山区九年级第一学期期末考试数学试题', '2', '9', '1', 'paper/05041413559560537.docx', 'vkjt1908', '2020-05-04 14:13:55');
INSERT INTO `paper` VALUES ('1840', '2018年上海市崇明区九年级第一学期期末考试数学试题', '2', '9', '1', 'paper/05041415097881462.docx', 'vkjt1908', '2020-05-04 14:15:09');
INSERT INTO `paper` VALUES ('1841', '2018年上海市黄浦区九年级第一学期期末考试数学试题(1)', '2', '9', '1', 'paper/05041415573763613.docx', 'vkjt1908', '2020-05-04 14:15:57');
INSERT INTO `paper` VALUES ('1842', '2018年上海市金山区九年级第一学期期末考试数学试题(1)', '2', '9', '1', 'paper/05041416319290053.docx', 'vkjt1908', '2020-05-04 14:16:31');
INSERT INTO `paper` VALUES ('1843', '2018年上海市青浦区九年级第一学期期末考试数学试题', '2', '9', '1', 'paper/05041417164294395.docx', 'vkjt1908', '2020-05-04 14:17:16');
INSERT INTO `paper` VALUES ('1844', '2018年上海市松江区九年级第一学期期末考试数学试题(1)', '2', '9', '1', 'paper/05041418139485657.docx', 'vkjt1908', '2020-05-04 14:18:13');
INSERT INTO `paper` VALUES ('1845', '2018年上海市长宁区九年级第一学期期末考试数学试题(1)', '2', '9', '1', 'paper/05041418443278164.docx', 'vkjt1908', '2020-05-04 14:18:44');
INSERT INTO `paper` VALUES ('1846', '2016-2017年上海市宝山区六上期末', '2', '6', '1', 'paper/05041421311963282.docx', 'vkjt1908', '2020-05-04 14:21:31');
INSERT INTO `paper` VALUES ('1847', '2017-2018年上海市金山初级中学六上10月月考', '2', '6', '1', 'paper/05041422208528833.docx', 'vkjt1908', '2020-05-04 14:22:20');
INSERT INTO `paper` VALUES ('1848', '2017-2018年上海市浦东新区第三教育署六上12月月考', '2', '6', '1', 'paper/05041422594757125.docx', 'vkjt1908', '2020-05-04 14:22:59');
INSERT INTO `paper` VALUES ('1849', '2017-2018年上海市浦东新区六上期末', '2', '6', '1', 'paper/05041423574975224.docx', 'vkjt1908', '2020-05-04 14:23:57');
INSERT INTO `paper` VALUES ('1850', '2017-2018年上海市七宝二中六上期中', '2', '6', '1', 'paper/05041424262563170.docx', 'vkjt1908', '2020-05-04 14:24:26');
INSERT INTO `paper` VALUES ('1851', '2017-2018年上海市莘松中学六上第一次月考', '2', '6', '1', 'paper/05041425455689019.docx', 'vkjt1908', '2020-05-04 14:25:45');
INSERT INTO `paper` VALUES ('1852', '2017-2018年上海市市北初级六上圆和扇形（C卷）', '2', '6', '1', 'paper/05041426212565187.docx', 'vkjt1908', '2020-05-04 14:26:21');
INSERT INTO `paper` VALUES ('1853', '2017-2018年上海市西南模范六上开学考', '2', '6', '1', 'paper/05041426547618557.docx', 'vkjt1908', '2020-05-04 14:26:54');
INSERT INTO `paper` VALUES ('1854', '2017-2018年上海市西南模六上期末加试卷', '2', '6', '1', 'paper/05041427522350777.docx', 'vkjt1908', '2020-05-04 14:27:52');
INSERT INTO `paper` VALUES ('1855', '2017-2018年上海市新北郊六上期中附加卷', '2', '6', '1', 'paper/05041428256963756.docx', 'vkjt1908', '2020-05-04 14:28:25');
INSERT INTO `paper` VALUES ('1856', '2018-2019年上海市宝山实验学校六上第一次月考', '2', '6', '1', 'paper/05041429178435643.docx', 'vkjt1908', '2020-05-04 14:29:17');
INSERT INTO `paper` VALUES ('1857', '2018-2019年上海市第四教育署六上10月月考', '2', '6', '1', 'paper/05041430284902581.docx', 'vkjt1908', '2020-05-04 14:30:28');
INSERT INTO `paper` VALUES ('1858', '2018-2019年上海市风华初级中学六上期中', '2', '6', '1', 'paper/05041431019733022.docx', 'vkjt1908', '2020-05-04 14:31:01');
INSERT INTO `paper` VALUES ('1859', '2018-2019年上海市明珠中学六上第一次月考', '2', '6', '1', 'paper/05041431501141058.docx', 'vkjt1908', '2020-05-04 14:31:50');
INSERT INTO `paper` VALUES ('1860', '2018-2019年上海市浦东第四教育署六上期中', '2', '6', '1', 'paper/05041433533576848.docx', 'vkjt1908', '2020-05-04 14:33:53');
INSERT INTO `paper` VALUES ('1861', '2018-2019年上海市浦东第一教育署六上期中', '2', '6', '1', 'paper/05041434305291865.docx', 'vkjt1908', '2020-05-04 14:34:30');
INSERT INTO `paper` VALUES ('1862', '2018-2019年上海市浦东新区第四教育署六上12月月考', '2', '6', '1', 'paper/05041435291067357.docx', 'vkjt1908', '2020-05-04 14:35:29');
INSERT INTO `paper` VALUES ('1863', '2018-2019年上海市七宝二中六上期中', '2', '6', '1', 'paper/05041436092749157.docx', 'vkjt1908', '2020-05-04 14:36:09');
INSERT INTO `paper` VALUES ('1864', '2018-2019年上海市上南南校六上10月月考', '2', '6', '1', 'paper/05041436427957927.docx', 'vkjt1908', '2020-05-04 14:36:42');
INSERT INTO `paper` VALUES ('1865', '2018-2019年上海市松江区六上期中', '2', '6', '1', 'paper/05041437203418229.docx', 'vkjt1908', '2020-05-04 14:37:20');
INSERT INTO `paper` VALUES ('1866', '2018-2019年上海市杨浦区六上期中', '2', '6', '1', 'paper/05041438022049850.docx', 'vkjt1908', '2020-05-04 14:38:02');
INSERT INTO `paper` VALUES ('1867', '六上专题-圆的组合图形的面积计算(1)', '2', '6', '1', 'paper/05041438406331863.docx', 'vkjt1908', '2020-05-04 14:38:40');
INSERT INTO `paper` VALUES ('1868', '六上专题-圆的组合图形的面积计算', '2', '6', '1', 'paper/05041439287203230.docx', 'vkjt1908', '2020-05-04 14:39:28');
INSERT INTO `paper` VALUES ('1869', '六上专题-组合图形的面积与周长', '2', '6', '1', 'paper/05041440238922201.docx', 'vkjt1908', '2020-05-04 14:40:23');
INSERT INTO `paper` VALUES ('1870', '2016-2017年上海市虹口区七上期末', '2', '7', '1', 'paper/05041442029293150.docx', 'vkjt1908', '2020-05-04 14:42:02');
INSERT INTO `paper` VALUES ('1871', '2016-2017年上海市浦东新区七上期中', '2', '7', '1', 'paper/05041443128968960.docx', 'vkjt1908', '2020-05-04 14:43:12');
INSERT INTO `paper` VALUES ('1872', '2016-2017年上海市玉华中学七上开学考', '2', '7', '1', 'paper/05041443458159999.docx', 'vkjt1908', '2020-05-04 14:43:45');
INSERT INTO `paper` VALUES ('1873', '2017-2018年上海市复旦万科七上期中加试卷', '2', '7', '1', 'paper/05041444206631224.docx', 'vkjt1908', '2020-05-04 14:44:20');
INSERT INTO `paper` VALUES ('1874', '2017-2018年上海市复旦万科七上期中', '2', '7', '1', 'paper/05041445324097343.docx', 'vkjt1908', '2020-05-04 14:45:32');
INSERT INTO `paper` VALUES ('1875', '2017-2018年上海市浦东新区第四教育署七上第一次月考', '2', '7', '1', 'paper/05041446057581877.docx', 'vkjt1908', '2020-05-04 14:46:05');
INSERT INTO `paper` VALUES ('1876', '2017-2018年上海市浦东新区第三教育署七上12月月考', '2', '7', '1', 'paper/05041446421525926.docx', 'vkjt1908', '2020-05-04 14:46:42');
INSERT INTO `paper` VALUES ('1877', '2017-2018年上海市七宝三中七上期中', '2', '7', '1', 'paper/05041447304206803.docx', 'vkjt1908', '2020-05-04 14:47:30');
INSERT INTO `paper` VALUES ('1878', '2017-2018年上海市上外附中七上期末复习（2）', '2', '7', '1', 'paper/05041448469341028.docx', 'vkjt1908', '2020-05-04 14:48:46');
INSERT INTO `paper` VALUES ('1880', '2017-2018年上海市尚德实验学校七上10月月考', '2', '7', '1', 'paper/05041453004687249.docx', 'vkjt1908', '2020-05-04 14:53:00');
INSERT INTO `paper` VALUES ('1881', '2017-2018年上海市莘松中学七上第一次月考', '2', '7', '1', 'paper/05041453427570987.docx', 'vkjt1908', '2020-05-04 14:53:42');
INSERT INTO `paper` VALUES ('1882', '2017-2018年上海市松江区七上期末', '2', '7', '1', 'paper/05041454342820814.docx', 'vkjt1908', '2020-05-04 14:54:34');
INSERT INTO `paper` VALUES ('1883', '2017-2018年上海市文来中学七上周末卷09', '2', '7', '1', 'paper/05041455233010085.docx', 'vkjt1908', '2020-05-04 14:55:23');
INSERT INTO `paper` VALUES ('1884', '2017-2018年上海市西南模范七上周末练习二', '2', '7', '1', 'paper/05041456031615807.docx', 'vkjt1908', '2020-05-04 14:56:03');
INSERT INTO `paper` VALUES ('1885', '2017-2018年上海市西南模范七上周末练习一', '2', '7', '1', 'paper/05041456357270106.docx', 'vkjt1908', '2020-05-04 14:56:35');
INSERT INTO `paper` VALUES ('1886', '2017-2018年上海市西南位育七上周测(11.16)', '2', '7', '1', 'paper/05041457035204717.docx', 'vkjt1908', '2020-05-04 14:57:03');
INSERT INTO `paper` VALUES ('1887', '2017-2018年上海市新北郊七上期中', '2', '7', '1', 'paper/05041457328348446.docx', 'vkjt1908', '2020-05-04 14:57:32');
INSERT INTO `paper` VALUES ('1888', '2017-2018年上海市新华初七上竞赛辅导（14）：因式分解（C）', '2', '7', '1', 'paper/05041458077994277.docx', 'vkjt1908', '2020-05-04 14:58:07');
INSERT INTO `paper` VALUES ('1889', '2017-2018年上海市新华初七上期末复习2', '2', '7', '1', 'paper/05041458457998659.docx', 'vkjt1908', '2020-05-04 14:58:45');
INSERT INTO `paper` VALUES ('1890', '2017-2018年上海市徐教院附中七上期末', '2', '7', '1', 'paper/05041459159848084.docx', 'vkjt1908', '2020-05-04 14:59:15');
INSERT INTO `paper` VALUES ('1891', '2018-2019年上海市宝教院附中七上期中', '2', '7', '1', 'paper/05041459538685013.docx', 'vkjt1908', '2020-05-04 14:59:53');
INSERT INTO `paper` VALUES ('1892', '2018-2019年上海市宝山实验学校七上第一次月考', '2', '7', '1', 'paper/05041500555998669.docx', 'vkjt1908', '2020-05-04 15:00:55');
INSERT INTO `paper` VALUES ('1893', '2018-2019年上海市第四教育署七上10月月考', '2', '7', '1', 'paper/05041501482646821.docx', 'vkjt1908', '2020-05-04 15:01:48');
INSERT INTO `paper` VALUES ('1894', '2018-2019年上海市复旦二附中七上期中', '2', '7', '1', 'paper/05041502231043092.docx', 'vkjt1908', '2020-05-04 15:02:23');
INSERT INTO `paper` VALUES ('1895', '2018-2019年上海市龚路中学七上第一次月考', '2', '7', '1', 'paper/05041504033268734.docx', 'vkjt1908', '2020-05-04 15:04:03');
INSERT INTO `paper` VALUES ('1896', '2018-2019年上海市九峰实验学校七上9月月考_', '2', '7', '1', 'paper/05041504481573736.docx', 'vkjt1908', '2020-05-04 15:04:48');
INSERT INTO `paper` VALUES ('1897', '2018-2019年上海市明珠中学七上整式的乘除', '2', '7', '1', 'paper/05041505423866773.docx', 'vkjt1908', '2020-05-04 15:05:42');
INSERT INTO `paper` VALUES ('1898', '2018-2019年上海市浦东第四教育署七上期中', '2', '7', '1', 'paper/05041506301335069.docx', 'vkjt1908', '2020-05-04 15:06:30');
INSERT INTO `paper` VALUES ('1899', '2018-2019年上海市浦东第一教育署七上期中', '2', '7', '1', 'paper/05041507057551393.docx', 'vkjt1908', '2020-05-04 15:07:05');
INSERT INTO `paper` VALUES ('1900', '2018-2019年上海市浦东新区七上期中', '2', '7', '1', 'paper/05041507435664585.docx', 'vkjt1908', '2020-05-04 15:07:43');
INSERT INTO `paper` VALUES ('1901', '2018-2019年上海市上宝中学七上周练-分式', '2', '7', '1', 'paper/05041508488622650.docx', 'vkjt1908', '2020-05-04 15:08:48');
INSERT INTO `paper` VALUES ('1902', '2018-2019年上海市上南南校七上10月月考', '2', '7', '1', 'paper/05041510339185981.docx', 'vkjt1908', '2020-05-04 15:10:33');
INSERT INTO `paper` VALUES ('1903', '2018-2019年上海市文来中学七上周练4', '2', '7', '1', 'paper/05041511179473037.docx', 'vkjt1908', '2020-05-04 15:11:17');
INSERT INTO `paper` VALUES ('1904', '2018-2019年上海市西南模范七上周测6', '2', '7', '1', 'paper/05041512193456679.docx', 'vkjt1908', '2020-05-04 15:12:19');
INSERT INTO `paper` VALUES ('1905', '22018-2019年上海市西南模范七上周练7', '2', '7', '1', 'paper/05041513285855255.docx', 'vkjt1908', '2020-05-04 15:13:28');
INSERT INTO `paper` VALUES ('1906', '2018-2019年上海市西南模七上10月月考', '2', '7', '1', 'paper/05041514246768390.docx', 'vkjt1908', '2020-05-04 15:14:24');
INSERT INTO `paper` VALUES ('1907', '2018-2019年上海市西南模七上周测3', '2', '7', '1', 'paper/05041516459238416.docx', 'vkjt1908', '2020-05-04 15:16:45');
INSERT INTO `paper` VALUES ('1908', '2018-2019年上海市西延安中学七上期中', '2', '7', '1', 'paper/05041517239014651.docx', 'vkjt1908', '2020-05-04 15:17:23');
INSERT INTO `paper` VALUES ('1909', '2018-2019年上海市徐教院附中七上第一次月考', '2', '7', '1', 'paper/05041518517298353.docx', 'vkjt1908', '2020-05-04 15:18:51');
INSERT INTO `paper` VALUES ('1910', '2018-2019年上海市杨波中学七上期中', '2', '7', '1', 'paper/05041519288316946.docx', 'vkjt1908', '2020-05-04 15:19:28');
INSERT INTO `paper` VALUES ('1911', '2018-2019年上海市杨浦区七上期中', '2', '7', '1', 'paper/05041523022429430.docx', 'vkjt1908', '2020-05-04 15:23:02');
INSERT INTO `paper` VALUES ('1912', '2018届上海市上宝中学七上期中专题复习-整式', '2', '7', '1', 'paper/05041523456369586.docx', 'vkjt1908', '2020-05-04 15:23:45');
INSERT INTO `paper` VALUES ('1913', '上海市松江区2017学年第一学期初一数学期末试题', '2', '7', '1', 'paper/05041529577219892.docx', 'vkjt1908', '2020-05-04 15:29:57');
INSERT INTO `paper` VALUES ('1914', '2015-2016年上海市浦东新区第四教育署八下期中', '2', '8', '2', 'paper/05041536426322020.docx', 'vkjt1908', '2020-05-04 15:36:42');
INSERT INTO `paper` VALUES ('1915', '2016-2017年上海市川沙中学南校八下第二次月考', '2', '8', '2', 'paper/05041537525914350.docx', 'vkjt1908', '2020-05-04 15:37:52');
INSERT INTO `paper` VALUES ('1916', '2016-2017年上海市奉贤区八下期末', '2', '8', '2', 'paper/05041540015554587.docx', 'vkjt1908', '2020-05-04 15:40:01');
INSERT INTO `paper` VALUES ('1917', '2016-2017年上海市复旦二附中八下第一次月考-四校联考', '2', '8', '2', 'paper/05041541502796668.docx', 'vkjt1908', '2020-05-04 15:41:50');
INSERT INTO `paper` VALUES ('1918', '2016-2017年上海市黄浦区八下期中', '2', '8', '2', 'paper/05041542358325157.docx', 'vkjt1908', '2020-05-04 15:42:35');
INSERT INTO `paper` VALUES ('1919', '2016-2017年上海市进才中学八下3月月考', '2', '8', '2', 'paper/05041543441505877.docx', 'vkjt1908', '2020-05-04 15:43:44');
INSERT INTO `paper` VALUES ('1920', '2016-2017年上海市进才中学八下5月月考', '2', '8', '2', 'paper/05041544188533772.docx', 'vkjt1908', '2020-05-04 15:44:18');
INSERT INTO `paper` VALUES ('1921', '2016-2017年上海市闵行区八下期中', '2', '8', '2', 'paper/05041545037968020.docx', 'vkjt1908', '2020-05-04 15:45:03');
INSERT INTO `paper` VALUES ('1922', '2016-2017年上海市培佳双语学校八下第一次月考', '2', '8', '2', 'paper/05041545475084844.docx', 'vkjt1908', '2020-05-04 15:45:47');
INSERT INTO `paper` VALUES ('1923', '2016-2017年上海市浦东新区第四教育署八下期中', '2', '8', '2', 'paper/05041546292146838.docx', 'vkjt1908', '2020-05-04 15:46:29');
INSERT INTO `paper` VALUES ('1924', '2016-2017年上海市上海中学东校八下期中', '2', '8', '2', 'paper/05041547448764458.docx', 'vkjt1908', '2020-05-04 15:47:44');
INSERT INTO `paper` VALUES ('1925', '2016-2017年上海市上海中学东校八下周练卷3', '2', '8', '2', 'paper/05041550098613122.docx', 'vkjt1908', '2020-05-04 15:50:09');
INSERT INTO `paper` VALUES ('1926', '2016-2017年上海市松江区八下期中', '2', '8', '2', 'paper/05041551079971084.docx', 'vkjt1908', '2020-05-04 15:51:07');
INSERT INTO `paper` VALUES ('1927', '2016-2017年上海市宋庆龄学校八下周练卷-第七周', '2', '8', '2', 'paper/05041611581876561.docx', 'vkjt1908', '2020-05-04 16:11:58');
INSERT INTO `paper` VALUES ('1929', '2016-2017年上海市西南位育中学八下期中', '2', '8', '2', 'paper/05041620131301557.docx', 'vkjt1908', '2020-05-04 16:20:13');
INSERT INTO `paper` VALUES ('1930', '2016-2017年上海市新华初八下周练（3）', '2', '8', '2', 'paper/05041620489394917.docx', 'vkjt1908', '2020-05-04 16:20:48');
INSERT INTO `paper` VALUES ('1931', '2016-2017年上海市新华初八下周练（1）', '2', '8', '2', 'paper/05041621217770366.docx', 'vkjt1908', '2020-05-04 16:21:21');
INSERT INTO `paper` VALUES ('1932', '2016-2017年上海市新华初八下周练二', '2', '8', '2', 'paper/05041622029237881.docx', 'vkjt1908', '2020-05-04 16:22:02');
INSERT INTO `paper` VALUES ('1933', '2016-2017年上海市新华初八下周末综合题练习（2）', '2', '8', '2', 'paper/05041622356459726.docx', 'vkjt1908', '2020-05-04 16:22:35');
INSERT INTO `paper` VALUES ('1934', '2016-2017年上海市新华初八下周末综合题练习（3）', '2', '8', '2', 'paper/05041623152422807.docx', 'vkjt1908', '2020-05-04 16:23:15');
INSERT INTO `paper` VALUES ('1935', '2016-2017年上海市新华初八下周末综合题练习（1）', '2', '8', '2', 'paper/05041624027670625.docx', 'vkjt1908', '2020-05-04 16:24:03');
INSERT INTO `paper` VALUES ('1936', '2016-2017年上海市杨浦区八下开学考', '2', '8', '2', 'paper/05041624397657216.docx', 'vkjt1908', '2020-05-04 16:24:39');
INSERT INTO `paper` VALUES ('1937', '2017-2018年八下20,21，22章综合训练（1）', '2', '8', '2', 'paper/05041625265523792.docx', 'vkjt1908', '2020-05-04 16:25:26');
INSERT INTO `paper` VALUES ('1938', '2017-2018年上海市宝山实验学校八下期中', '2', '8', '2', 'paper/05041626009910862.docx', 'vkjt1908', '2020-05-04 16:26:00');
INSERT INTO `paper` VALUES ('1939', '2017-2018年上海市宝山实验中学八下期中', '2', '8', '2', 'paper/05041629592660642.docx', 'vkjt1908', '2020-05-04 16:29:59');
INSERT INTO `paper` VALUES ('1940', '2017-2018年上海市存志中学八下周练1', '2', '8', '2', 'paper/05041630442981698.docx', 'vkjt1908', '2020-05-04 16:30:44');
INSERT INTO `paper` VALUES ('1941', '2017-2018年上海市存志中学八下周练2', '2', '8', '2', 'paper/05041631369790821.docx', 'vkjt1908', '2020-05-04 16:31:36');
INSERT INTO `paper` VALUES ('1942', '2017-2018年上海市交中初级八下单元测试', '2', '8', '2', 'paper/05041632375200757.docx', 'vkjt1908', '2020-05-04 16:32:37');
INSERT INTO `paper` VALUES ('1943', '2017-2018年上海市浦东新区第四教育署八下期中', '2', '8', '2', 'paper/05041634006795792.docx', 'vkjt1908', '2020-05-04 16:34:00');
INSERT INTO `paper` VALUES ('1944', '2017-2018年上海市上宝中学八下压轴练习1', '2', '8', '2', 'paper/05041635406825636.docx', 'vkjt1908', '2020-05-04 16:35:40');
INSERT INTO `paper` VALUES ('1945', '2017-2018年上海市上海中学东校八下四边形复习专题', '2', '8', '2', 'paper/05041636414084645.docx', 'vkjt1908', '2020-05-04 16:36:41');
INSERT INTO `paper` VALUES ('1946', '2017-2018年上海市上外附中八下第一次月考', '2', '8', '2', 'paper/05041638486723559.docx', 'vkjt1908', '2020-05-04 16:38:48');
INSERT INTO `paper` VALUES ('1947', '2017-2018年上海市上外附中八下期末', '2', '8', '2', 'paper/05041640145225854.docx', 'vkjt1908', '2020-05-04 16:40:14');
INSERT INTO `paper` VALUES ('1948', '2017-2018年上海市文来中学八下3月月考', '2', '8', '2', 'paper/05041641136776049.docx', 'vkjt1908', '2020-05-04 16:41:13');
INSERT INTO `paper` VALUES ('1949', '2016-2017年上海市松江区八下期中', '2', '8', '2', 'paper/05041643329231388.docx', 'vkjt1908', '2020-05-04 16:43:32');
INSERT INTO `paper` VALUES ('1950', '2016-2017年上海市西南位育中学八下期中', '2', '8', '2', 'paper/05041644371700401.docx', 'vkjt1908', '2020-05-04 16:44:37');
INSERT INTO `paper` VALUES ('1951', '2017-2018年上海市宝山实验学校八下期中', '2', '8', '2', 'paper/05041645471065406.docx', 'vkjt1908', '2020-05-04 16:45:47');
INSERT INTO `paper` VALUES ('1952', '2017-2018年上海市宝山实验中学八下期中', '2', '8', '2', 'paper/05041646379719392.docx', 'vkjt1908', '2020-05-04 16:46:37');
INSERT INTO `paper` VALUES ('1953', '2017-2018年上海市宝山实验中学八下期中', '2', '8', '2', 'paper/05041646401291880.docx', 'vkjt1908', '2020-05-04 16:46:40');
INSERT INTO `paper` VALUES ('1956', '2017-2018年上海市浦东新区第四教育署八下期中', '2', '8', '2', 'paper/05041649174333892.docx', 'vkjt1908', '2020-05-04 16:49:17');
INSERT INTO `paper` VALUES ('1957', '2017-2018年上海市浦东新区第四教育署七下5月月考', '2', '8', '2', 'paper/05041650097086954.docx', 'vkjt1908', '2020-05-04 16:50:09');
INSERT INTO `paper` VALUES ('1958', '2017-2018年上海市浦东新区第四教育署七下期中', '2', '8', '2', 'paper/05041650525580133.docx', 'vkjt1908', '2020-05-04 16:50:52');
INSERT INTO `paper` VALUES ('1964', '2017-2018年上海市新华初八下专题二-特殊的平行四边形', '2', '8', '2', 'paper/05041655364712685.docx', 'vkjt1908', '2020-05-04 16:55:36');
INSERT INTO `paper` VALUES ('1968', '2018-2019年上海市八下期中模拟试卷1', '2', '8', '2', 'paper/05041659142338995.docx', 'vkjt1908', '2020-05-04 16:59:14');
INSERT INTO `paper` VALUES ('1970', '2018-2019年上海市浦东新区八下期中', '2', '8', '2', 'paper/05041701398944232.docx', 'vkjt1908', '2020-05-04 17:01:39');
INSERT INTO `paper` VALUES ('1971', '2018-2019年上海市浦东新区第四教育署八下期中', '2', '8', '2', 'paper/05041702207588265.docx', 'vkjt1908', '2020-05-04 17:02:20');
INSERT INTO `paper` VALUES ('1973', '2018-2019年上海市浦东新区六下3月月考', '2', '8', '2', 'paper/05041704374759536.docx', 'vkjt1908', '2020-05-04 17:04:37');
INSERT INTO `paper` VALUES ('1974', '2018-2019年上海市上外西外八下3月月考', '2', '8', '2', 'paper/05041705534264853.docx', 'vkjt1908', '2020-05-04 17:05:53');
INSERT INTO `paper` VALUES ('1975', '2018-2019年上海市松江区八下期中', '2', '8', '2', 'paper/05041706394173614.docx', 'vkjt1908', '2020-05-04 17:06:39');
INSERT INTO `paper` VALUES ('1976', '2018-2019年上海市松江区六下期中', '2', '8', '2', 'paper/05041707278259546.docx', 'vkjt1908', '2020-05-04 17:07:27');
INSERT INTO `paper` VALUES ('1979', '2018-2019年上海市西南模范六下期中', '2', '8', '2', 'paper/05041711127898706.docx', 'vkjt1908', '2020-05-04 17:11:12');
INSERT INTO `paper` VALUES ('1980', '2018-2019年上海市杨浦区八下期中', '2', '8', '2', 'paper/05041712041143205.docx', 'vkjt1908', '2020-05-04 17:12:04');
INSERT INTO `paper` VALUES ('1982', '2018-2019年上海市杨浦区七下期中', '2', '8', '2', 'paper/05041714059735849.docx', 'vkjt1908', '2020-05-04 17:14:05');
INSERT INTO `paper` VALUES ('1983', '2018-2019年新竹园专题-比例线段', '2', '8', '2', 'paper/05041742207212996.docx', 'vkjt1908', '2020-05-04 17:42:20');
INSERT INTO `paper` VALUES ('1984', '2019届宝山区中考数学二模', '2', '8', '2', 'paper/05041744113539615.docx', 'vkjt1908', '2020-05-04 17:44:11');
INSERT INTO `paper` VALUES ('1985', '2019届崇明区中考数学二模', '2', '8', '2', 'paper/05041745088347803.docx', 'vkjt1908', '2020-05-04 17:45:08');
INSERT INTO `paper` VALUES ('1986', '2019届奉贤区中考数学二模', '2', '8', '2', 'paper/05041745585067154.docx', 'vkjt1908', '2020-05-04 17:45:58');
INSERT INTO `paper` VALUES ('1987', '2019届虹口区中考数学二模', '2', '8', '2', 'paper/05041747104455269.docx', 'vkjt1908', '2020-05-04 17:47:10');
INSERT INTO `paper` VALUES ('1988', '2019届黄浦区中考数学二模', '2', '8', '2', 'paper/05041748242121237.docx', 'vkjt1908', '2020-05-04 17:48:24');
INSERT INTO `paper` VALUES ('1989', '2019届嘉定区中考数学二模', '2', '8', '2', 'paper/05041749286506741.docx', 'vkjt1908', '2020-05-04 17:49:28');
INSERT INTO `paper` VALUES ('1990', '2019届金山区中考数学二模', '2', '8', '2', 'paper/05041750299298687.docx', 'vkjt1908', '2020-05-04 17:50:29');
INSERT INTO `paper` VALUES ('1991', '2019届静安区中考数学二模', '2', '8', '2', 'paper/05041751335994086.docx', 'vkjt1908', '2020-05-04 17:51:33');
INSERT INTO `paper` VALUES ('1992', '2019届闵行区中考数学二模', '2', '8', '2', 'paper/05041752439397141.docx', 'vkjt1908', '2020-05-04 17:52:43');
INSERT INTO `paper` VALUES ('1993', '2019届普陀区中考数学二模', '2', '8', '2', 'paper/05041753548597682.docx', 'vkjt1908', '2020-05-04 17:53:54');
INSERT INTO `paper` VALUES ('1994', '2019届青浦区中考数学二模', '2', '8', '2', 'paper/05041755116621892.docx', 'vkjt1908', '2020-05-04 17:55:11');
INSERT INTO `paper` VALUES ('1995', '2019届松江区中考数学二模', '2', '8', '2', 'paper/05041756098343526.docx', 'vkjt1908', '2020-05-04 17:56:09');
INSERT INTO `paper` VALUES ('1996', '2019届徐汇区中考数学二模', '2', '8', '2', 'paper/05041757061022542.docx', 'vkjt1908', '2020-05-04 17:57:06');
INSERT INTO `paper` VALUES ('1997', '2019届杨浦区中考数学二模(1)', '2', '8', '2', 'paper/05041758011906177.docx', 'vkjt1908', '2020-05-04 17:58:01');
INSERT INTO `paper` VALUES ('1998', '2019届长宁区中考数学二模', '2', '8', '2', 'paper/05041759017518979.docx', 'vkjt1908', '2020-05-04 17:59:01');
INSERT INTO `paper` VALUES ('1999', '2017-2018年上海市西南模范八下第一次月考', '2', '8', '2', 'paper/05041800139946792.docx', 'vkjt1908', '2020-05-04 18:00:13');
INSERT INTO `paper` VALUES ('2000', '2017-2018年上海市格致中学六下期中', '2', '6', '2', 'paper/05041802058672108.docx', 'vkjt1908', '2020-05-04 18:02:05');
INSERT INTO `paper` VALUES ('2001', '2017-2018年上海市存志中学六下期中', '2', '6', '2', 'paper/05041807174625868.docx', 'vkjt1908', '2020-05-04 18:07:17');
INSERT INTO `paper` VALUES ('2003', '2017-2018年上海市进才北校六下期中', '2', '6', '2', 'paper/05041809462343477.docx', 'vkjt1908', '2020-05-04 18:09:46');
INSERT INTO `paper` VALUES ('2004', '2017-2018年上海市进才北校六下期中', '2', '6', '2', 'paper/05041810344012608.docx', 'vkjt1908', '2020-05-04 18:10:34');
INSERT INTO `paper` VALUES ('2005', '2017--2018年上海市世外六下期中复习二', '2', '6', '2', 'paper/05041811302394742.docx', 'vkjt1908', '2020-05-04 18:11:30');
INSERT INTO `paper` VALUES ('2006', '2017-2018学年华政附中六下期中复习卷6', '2', '6', '2', 'paper/05041813054793133.docx', 'vkjt1908', '2020-05-04 18:13:05');
INSERT INTO `paper` VALUES ('2007', '2017-2018学年华政附中六下期中复习卷7', '2', '6', '2', 'paper/05041815017378650.docx', 'vkjt1908', '2020-05-04 18:15:01');
INSERT INTO `paper` VALUES ('2008', '2018-2019年上海市杨浦区六下期中', '2', '6', '2', 'paper/05041816314036651.docx', 'vkjt1908', '2020-05-04 18:16:31');
INSERT INTO `paper` VALUES ('2009', '2017-2018年上海市普陀区七下期中', '2', '7', '2', 'paper/05041818087906566.docx', 'vkjt1908', '2020-05-04 18:18:08');
INSERT INTO `paper` VALUES ('2010', '2017-2018年上海市上外附中七下期中复习', '2', '7', '2', 'paper/05041819431678946.docx', 'vkjt1908', '2020-05-04 18:19:43');
INSERT INTO `paper` VALUES ('2011', '2017-2018年上海市松江区七下5月月考', '2', '7', '2', 'paper/05041821102178084.docx', 'vkjt1908', '2020-05-04 18:21:10');
INSERT INTO `paper` VALUES ('2012', '2017-2018年上海市同济实验学校七下期中', '2', '7', '2', 'paper/05041822235745255.docx', 'vkjt1908', '2020-05-04 18:22:23');
INSERT INTO `paper` VALUES ('2013', '2017-2018年上海市新华初七下周练5', '2', '7', '2', 'paper/05041823374294013.docx', 'vkjt1908', '2020-05-04 18:23:37');
INSERT INTO `paper` VALUES ('2014', '2018-2019年上海市闵行区七下期中', '2', '7', '2', 'paper/05041825007051061.docx', 'vkjt1908', '2020-05-04 18:25:00');
INSERT INTO `paper` VALUES ('2016', '2018-2019年上海市浦东新区第四教育署七下期中', '2', '7', '2', 'paper/05041828312551254.docx', 'vkjt1908', '2020-05-04 18:28:31');
INSERT INTO `paper` VALUES ('2017', '2018-2019年上海市松江区七下期中', '2', '7', '2', 'paper/05041830132343754.docx', 'vkjt1908', '2020-05-04 18:30:13');
INSERT INTO `paper` VALUES ('2018', '2018-2019年上海市位育中学七下期中复习1', '2', '7', '2', 'paper/05041831334472609.docx', 'vkjt1908', '2020-05-04 18:31:33');
INSERT INTO `paper` VALUES ('2022', '2017-2018年上海市西南位育八下-函数综合', '2', '8', '2', 'paper/05041838475719617.docx', 'vkjt1908', '2020-05-04 18:38:47');
INSERT INTO `paper` VALUES ('2023', '2017-2018年上海市新华初八下专题二-特殊的平行四边形', '2', '8', '2', 'paper/05041840483187603.docx', 'vkjt1908', '2020-05-04 18:40:48');
INSERT INTO `paper` VALUES ('2024', '2017-2018年上海市新竹园八下周测4', '2', '8', '2', 'paper/05041841399455761.docx', 'vkjt1908', '2020-05-04 18:41:39');
INSERT INTO `paper` VALUES ('2025', '2017-2018年新竹园专题-相似三角形1', '2', '8', '2', 'paper/05041842367819979.docx', 'vkjt1908', '2020-05-04 18:42:36');
INSERT INTO `paper` VALUES ('2026', '2018-2019年上海市八下期中模拟试卷1', '2', '8', '2', 'paper/05041843461294698.docx', 'vkjt1908', '2020-05-04 18:43:46');
INSERT INTO `paper` VALUES ('2027', '2018-2019年上海市嘉一联中八下第一次月考', '2', '8', '2', 'paper/05041844522152352.docx', 'vkjt1908', '2020-05-04 18:44:52');
INSERT INTO `paper` VALUES ('2028', '2018-2019年上海市浦东新区八下期中', '2', '8', '2', 'paper/05041845545267245.docx', 'vkjt1908', '2020-05-04 18:45:54');
INSERT INTO `paper` VALUES ('2029', '2018-2019年上海市浦东新区第四教育署八下期中', '2', '8', '2', 'paper/05041846466073054.docx', 'vkjt1908', '2020-05-04 18:46:46');
INSERT INTO `paper` VALUES ('2030', '2018-2019年上海市上外西外八下3月月考', '2', '8', '2', 'paper/05041848345217742.docx', 'vkjt1908', '2020-05-04 18:48:34');
INSERT INTO `paper` VALUES ('2031', '2018-2019年上海市市西中学八下周测1一次函数', '2', '8', '2', 'paper/05041849385869486.docx', 'vkjt1908', '2020-05-04 18:49:38');
INSERT INTO `paper` VALUES ('2032', '2018-2019年上海市松江区八下期中', '2', '8', '2', 'paper/05041850514542036.docx', 'vkjt1908', '2020-05-04 18:50:51');
INSERT INTO `paper` VALUES ('2033', '2018-2019年上海市西南模范八下第一次月考', '2', '8', '2', 'paper/05041851588586004.docx', 'vkjt1908', '2020-05-04 18:51:58');
INSERT INTO `paper` VALUES ('2034', '2018-2019年上海市西延安八下单元测试，一次函数', '2', '8', '2', 'paper/05041853414386885.docx', 'vkjt1908', '2020-05-04 18:53:41');
INSERT INTO `paper` VALUES ('2035', '2018-2019年上海市新竹园八下校本-22.2平行四边形的性质（一）', '2', '8', '2', 'paper/05041855079297285.docx', 'vkjt1908', '2020-05-04 18:55:07');
INSERT INTO `paper` VALUES ('2036', '2018-2019年上海市杨浦区八下期中', '2', '8', '2', 'paper/05041856143399580.docx', 'vkjt1908', '2020-05-04 18:56:14');
INSERT INTO `paper` VALUES ('2037', '八下同步练习-22.2平行四边形（1）', '2', '8', '2', 'paper/05041857217813799.docx', 'vkjt1908', '2020-05-04 18:57:21');
INSERT INTO `paper` VALUES ('2038', '八下同步练习-22.2平行四边形（2）', '2', '8', '2', 'paper/05041858103531531.docx', 'vkjt1908', '2020-05-04 18:58:10');
INSERT INTO `paper` VALUES ('2039', '八下同步练习-22.3_特殊的平行四边形（1）', '2', '8', '2', 'paper/05041859061978356.docx', 'vkjt1908', '2020-05-04 18:59:06');
INSERT INTO `paper` VALUES ('2040', '八下同步练习-22.3_特殊的平行四边形（2）', '2', '8', '2', 'paper/05041900067390245.docx', 'vkjt1908', '2020-05-04 19:00:06');
INSERT INTO `paper` VALUES ('2041', '八下同步练习-22.3_特殊的平行四边形（3）', '2', '8', '2', 'paper/05041901508890982.docx', 'vkjt1908', '2020-05-04 19:01:50');
INSERT INTO `paper` VALUES ('2042', '八下同步练习-22.4_梯形', '2', '8', '2', 'paper/05041903067940705.docx', 'vkjt1908', '2020-05-04 19:03:06');
INSERT INTO `paper` VALUES ('2043', '八下同步练习-22.5_等腰梯形', '2', '8', '2', 'paper/05041904003465194.docx', 'vkjt1908', '2020-05-04 19:04:00');
INSERT INTO `paper` VALUES ('2044', '八下同步练习-22.6_三角形、梯形的中位线', '2', '8', '2', 'paper/05041904578889955.docx', 'vkjt1908', '2020-05-04 19:04:57');
INSERT INTO `paper` VALUES ('2045', '2016-2017年上海市建平实验中学九下周练三-3月', '2', '9', '2', 'paper/05042213397927533.docx', 'vkjt1908', '2020-05-04 22:13:39');
INSERT INTO `paper` VALUES ('2046', '2017-2018年上海市交大附中九下自招试卷', '2', '9', '2', 'paper/05042214308349749.docx', 'vkjt1908', '2020-05-04 22:14:30');
INSERT INTO `paper` VALUES ('2047', '2017-2018年上海市浦东五校联考九下3月月考（建平、浦东模范等）', '2', '9', '2', 'paper/05042215076186145.docx', 'vkjt1908', '2020-05-04 22:15:07');
INSERT INTO `paper` VALUES ('2048', '2017-2018年上海市浦东新区第四教育署九下3月月考', '2', '9', '2', 'paper/05042215449981479.docx', 'vkjt1908', '2020-05-04 22:15:44');
INSERT INTO `paper` VALUES ('2049', '2017-2018年上海市上海中学九下自招试卷', '2', '9', '2', 'paper/05042216416723962.docx', 'vkjt1908', '2020-05-04 22:16:41');
INSERT INTO `paper` VALUES ('2050', '2017-2018年上海市上外附中九下3月月考', '2', '9', '2', 'paper/05042217312142865.docx', 'vkjt1908', '2020-05-04 22:17:31');
INSERT INTO `paper` VALUES ('2051', '2017-2018年上海市松江区九下3月月考', '2', '9', '2', 'paper/05042218271172268.docx', 'vkjt1908', '2020-05-04 22:18:27');
INSERT INTO `paper` VALUES ('2052', '2017-2018年上海市新华初九下周练三', '2', '9', '2', 'paper/05042219416646333.docx', 'vkjt1908', '2020-05-04 22:19:41');
INSERT INTO `paper` VALUES ('2053', '2017-2018年上海市新华初九下周练四', '2', '9', '2', 'paper/05042220298161259.docx', 'vkjt1908', '2020-05-04 22:20:29');
INSERT INTO `paper` VALUES ('2054', '2017-2018年上海市新华初九下周练一', '2', '9', '2', 'paper/05042221172979306.docx', 'vkjt1908', '2020-05-04 22:21:17');
INSERT INTO `paper` VALUES ('2055', '2017-2018年上海市园南中学九下3月月考', '2', '9', '2', 'paper/05042222076378536.docx', 'vkjt1908', '2020-05-04 22:22:07');
INSERT INTO `paper` VALUES ('2056', '2018-2019年上海市华二九下自招卷', '2', '9', '2', 'paper/05042222489969688.docx', 'vkjt1908', '2020-05-04 22:22:48');
INSERT INTO `paper` VALUES ('2057', '2018-2019年上海市交大附中九下自招卷', '2', '9', '2', 'paper/05042223308790482.docx', 'vkjt1908', '2020-05-04 22:23:30');
INSERT INTO `paper` VALUES ('2058', '2018-2019年上海市民办明珠中学九下3月周测', '2', '9', '2', 'paper/05042224192790936.docx', 'vkjt1908', '2020-05-04 22:24:19');
INSERT INTO `paper` VALUES ('2059', '初升高-自主招生模拟卷1', '2', '9', '2', 'paper/05042225102375659.docx', 'vkjt1908', '2020-05-04 22:25:10');
INSERT INTO `paper` VALUES ('2060', '初升高-自主招生模拟卷2', '2', '9', '2', 'paper/05042225506455258.docx', 'vkjt1908', '2020-05-04 22:25:50');
INSERT INTO `paper` VALUES ('2061', '初升高-自主招生模拟卷3', '2', '9', '2', 'paper/05042226371848408.docx', 'vkjt1908', '2020-05-04 22:26:37');
INSERT INTO `paper` VALUES ('2062', '中考压轴专题1-动点产生的等腰、直角三角形-', '2', '9', '2', 'paper/05042227298308630.doc', 'vkjt1908', '2020-05-04 22:27:29');
INSERT INTO `paper` VALUES ('2063', '中考压轴专题2-动点产生的特殊四边形', '2', '9', '2', 'paper/05042228239996170.doc', 'vkjt1908', '2020-05-04 22:28:23');
INSERT INTO `paper` VALUES ('2064', '中考压轴专题3-动点产生的相切问题', '2', '9', '2', 'paper/05042229044972430.doc', 'vkjt1908', '2020-05-04 22:29:04');
INSERT INTO `paper` VALUES ('2065', '中考压轴专题-函数图像中的等腰三角形和直角三角形', '2', '9', '2', 'paper/05042229439531688.docx', 'vkjt1908', '2020-05-04 22:29:43');
INSERT INTO `paper` VALUES ('2066', '2015-2016年上海市川沙中学南校六下3月月考', '2', '6', '2', 'paper/05042234035511098.docx', 'vkjt1908', '2020-05-04 22:34:03');
INSERT INTO `paper` VALUES ('2067', '2015-2016年上海市上南中学南校六下3月月考', '2', '6', '2', 'paper/05042234392065214.docx', 'vkjt1908', '2020-05-04 22:34:39');
INSERT INTO `paper` VALUES ('2068', '2016-2017年上海市崇明区六下期末', '2', '6', '2', 'paper/05042236338184057.docx', 'vkjt1908', '2020-05-04 22:36:33');
INSERT INTO `paper` VALUES ('2069', '2016-2017年上海市黄浦区六下期末', '2', '6', '2', 'paper/05042237174788595.docx', 'vkjt1908', '2020-05-04 22:37:17');
INSERT INTO `paper` VALUES ('2070', '2016-2017年上海市青浦一中六下期中', '2', '6', '2', 'paper/05042238298498767.docx', 'vkjt1908', '2020-05-04 22:38:29');
INSERT INTO `paper` VALUES ('2071', '2016-2017年上海市上师大附中六下期中', '2', '6', '2', 'paper/05042239192087691.docx', 'vkjt1908', '2020-05-04 22:39:19');
INSERT INTO `paper` VALUES ('2072', '2016-2017年上海市上外闵外六下期中', '2', '6', '2', 'paper/05042240017720703.docx', 'vkjt1908', '2020-05-04 22:40:01');
INSERT INTO `paper` VALUES ('2073', '2016-2017年上海市文来中学六下期中拓展卷', '2', '6', '2', 'paper/05042240422262429.docx', 'vkjt1908', '2020-05-04 22:40:42');
INSERT INTO `paper` VALUES ('2074', '2016-2017年上海市育才初中六下期中', '2', '6', '2', 'paper/05042241197573442.docx', 'vkjt1908', '2020-05-04 22:41:19');
INSERT INTO `paper` VALUES ('2075', '2017-2018年上海市存志中学六下期末卷1', '2', '6', '2', 'paper/05042242317270825.docx', 'vkjt1908', '2020-05-04 22:42:31');
INSERT INTO `paper` VALUES ('2076', '2017-2018年上海市存志中学六下期末卷2', '2', '6', '2', 'paper/05042243134417111.docx', 'vkjt1908', '2020-05-04 22:43:13');
INSERT INTO `paper` VALUES ('2077', '2017-2018年上海市存志中学六下期中', '2', '6', '2', 'paper/05042244213133099.docx', 'vkjt1908', '2020-05-04 22:44:21');
INSERT INTO `paper` VALUES ('2078', '2017-2018年上海市格致中学六下期中', '2', '6', '2', 'paper/05042245087890310.docx', 'vkjt1908', '2020-05-04 22:45:08');
INSERT INTO `paper` VALUES ('2079', '2017-2018年上海市建平实验六下3月月考', '2', '6', '2', 'paper/05042246165636624.docx', 'vkjt1908', '2020-05-04 22:46:16');
INSERT INTO `paper` VALUES ('2080', '2017-2018年上海市进才北校六下期中', '2', '6', '2', 'paper/05042247153271364.docx', 'vkjt1908', '2020-05-04 22:47:15');
INSERT INTO `paper` VALUES ('2081', '2017-2018年上海市浦东新区第四教育署六下3月月考', '2', '6', '2', 'paper/05042248081914556.docx', 'vkjt1908', '2020-05-04 22:48:08');
INSERT INTO `paper` VALUES ('2082', '2017-2018年上海市浦东新区第四教育署六下期中', '2', '6', '2', 'paper/05042249295375317.docx', 'vkjt1908', '2020-05-04 22:49:29');
INSERT INTO `paper` VALUES ('2083', '2017-2018年上海市普陀区六下期中', '2', '6', '2', 'paper/05042250308640651.docx', 'vkjt1908', '2020-05-04 22:50:30');
INSERT INTO `paper` VALUES ('2084', '2017-2018年上海市上外六下同步练习-5.9-6.4', '2', '6', '2', 'paper/05042251212437216.docx', 'vkjt1908', '2020-05-04 22:51:21');
INSERT INTO `paper` VALUES ('2085', '2017--2018年上海市世外六下期中复习二', '2', '6', '2', 'paper/05042252284085568.docx', 'vkjt1908', '2020-05-04 22:52:28');
INSERT INTO `paper` VALUES ('2086', '2017--2018年上海市世外六下期中复习一', '2', '6', '2', 'paper/05042253227079566.docx', 'vkjt1908', '2020-05-04 22:53:22');
INSERT INTO `paper` VALUES ('2087', '2017-2018年上海市西南模范六下周练1', '2', '6', '2', 'paper/05042254065438367.docx', 'vkjt1908', '2020-05-04 22:54:06');
INSERT INTO `paper` VALUES ('2088', '2017-2018年上海市西南位育六下第二次月考', '2', '6', '2', 'paper/05042254514259319.docx', 'vkjt1908', '2020-05-04 22:54:51');
INSERT INTO `paper` VALUES ('2089', '2017-2018年上海市西延安六下单元检测卷-有理数', '2', '6', '2', 'paper/05042255427968199.docx', 'vkjt1908', '2020-05-04 22:55:42');
INSERT INTO `paper` VALUES ('2090', '2017-2018学年华政附中六下期中复习卷5', '2', '6', '2', 'paper/05042256249554896.docx', 'vkjt1908', '2020-05-04 22:56:24');
INSERT INTO `paper` VALUES ('2091', '2017-2018学年华政附中六下期中复习卷6', '2', '6', '2', 'paper/05042257079559003.docx', 'vkjt1908', '2020-05-04 22:57:07');
INSERT INTO `paper` VALUES ('2092', '2017-2018学年华政附中六下期中复习卷7', '2', '6', '2', 'paper/05042258112921380.docx', 'vkjt1908', '2020-05-04 22:58:11');
INSERT INTO `paper` VALUES ('2093', '2018-2019年上海市浦东新区六下3月月考', '2', '6', '2', 'paper/05042259291602901.docx', 'vkjt1908', '2020-05-04 22:59:29');
INSERT INTO `paper` VALUES ('2094', '2018-2019年上海市松江区六下期中', '2', '6', '2', 'paper/05042300214675437.docx', 'vkjt1908', '2020-05-04 23:00:21');
INSERT INTO `paper` VALUES ('2095', '2018-2019年上海市西南模范六下期中', '2', '6', '2', 'paper/05042301057224165.docx', 'vkjt1908', '2020-05-04 23:01:05');
INSERT INTO `paper` VALUES ('2096', '2018-2019年上海市杨浦区六下期中', '2', '6', '2', 'paper/05042301468658579.docx', 'vkjt1908', '2020-05-04 23:01:46');
INSERT INTO `paper` VALUES ('2097', '2018-2019年新竹园专题-比例线段', '2', '6', '2', 'paper/05042302262465542.docx', 'vkjt1908', '2020-05-04 23:02:26');
INSERT INTO `paper` VALUES ('2098', '往年上海市上宝中学六下周测精选(3)', '2', '6', '2', 'paper/05042303177818648.docx', 'vkjt1908', '2020-05-04 23:03:17');
INSERT INTO `paper` VALUES ('2099', '往年上海市上宝中学六下周测精选(4)', '2', '6', '2', 'paper/05042304562484035.docx', 'vkjt1908', '2020-05-04 23:04:56');
INSERT INTO `paper` VALUES ('2100', '往年上海市上宝中学六下周测精选(1)', '2', '6', '2', 'paper/05042305513884221.docx', 'vkjt1908', '2020-05-04 23:05:51');
INSERT INTO `paper` VALUES ('2101', '往年上海市上宝中学六下周测精选(2)', '2', '6', '2', 'paper/05042306273283776.docx', 'vkjt1908', '2020-05-04 23:06:27');
INSERT INTO `paper` VALUES ('2102', '往年上海市杨浦上外双语六下周练精选1', '2', '6', '2', 'paper/05042307215528876.docx', 'vkjt1908', '2020-05-04 23:07:21');
INSERT INTO `paper` VALUES ('2103', '往年上海市杨浦上外双语六下周练精选1', '2', '6', '2', 'paper/05042308105847068.docx', 'vkjt1908', '2020-05-04 23:08:10');
INSERT INTO `paper` VALUES ('2104', '往年上海市杨浦上外双语六下周练精选2', '2', '6', '2', 'paper/05042308484756871.docx', 'vkjt1908', '2020-05-04 23:08:48');
INSERT INTO `paper` VALUES ('2105', '往年上海市杨浦上外双语六下周练精选3', '2', '6', '2', 'paper/05042309283510553.docx', 'vkjt1908', '2020-05-04 23:09:28');
INSERT INTO `paper` VALUES ('2106', '往年上海市杨浦上外双语六下周练精选4', '2', '6', '2', 'paper/05042310184809937.docx', 'vkjt1908', '2020-05-04 23:10:18');
INSERT INTO `paper` VALUES ('2107', '2015-2016年上海市浦东新区七下期中', '2', '7', '2', 'paper/05042311357122211.docx', 'vkjt1908', '2020-05-04 23:11:35');
INSERT INTO `paper` VALUES ('2108', '2015-2016年上海市上南中学南校七下3月月考', '2', '7', '2', 'paper/05042312151313828.docx', 'vkjt1908', '2020-05-04 23:12:15');
INSERT INTO `paper` VALUES ('2109', '2015-2016年上海市松江区七下期末', '2', '7', '2', 'paper/05042314247397700.docx', 'vkjt1908', '2020-05-04 23:14:24');
INSERT INTO `paper` VALUES ('2110', '2015-2016年上海市徐汇区七下期末', '2', '7', '2', 'paper/05042315038414000.docx', 'vkjt1908', '2020-05-04 23:15:03');
INSERT INTO `paper` VALUES ('2111', '2016-2017年上海市崇明区七下期末', '2', '7', '2', 'paper/05042315425392652.docx', 'vkjt1908', '2020-05-04 23:15:42');
INSERT INTO `paper` VALUES ('2112', '2016-2017年上海市复旦二附中八下第一次月考-四校联考', '2', '8', '2', 'paper/05042316322419356.docx', 'vkjt1908', '2020-05-04 23:16:32');
INSERT INTO `paper` VALUES ('2113', '2016-2017年上海市杨浦区八下开学考', '2', '8', '2', 'paper/05042317095468866.docx', 'vkjt1908', '2020-05-04 23:17:09');
INSERT INTO `paper` VALUES ('2114', '2017-2018年上海市建平香梅七下第一次月考', '2', '7', '2', 'paper/05042317523961900.docx', 'vkjt1908', '2020-05-04 23:17:52');
INSERT INTO `paper` VALUES ('2115', '2017-2018年上海市浦东五校联考九下3月月考（建平、浦东模范等）', '2', '9', '2', 'paper/05042318564251072.docx', 'vkjt1908', '2020-05-04 23:18:56');
INSERT INTO `paper` VALUES ('2116', '2017-2018年上海市浦东新区第四教育署八下3月月考', '2', '8', '2', 'paper/05042320046740181.docx', 'vkjt1908', '2020-05-04 23:20:04');
INSERT INTO `paper` VALUES ('2117', '2017-2018年上海市浦东新区第四教育署九下3月月考', '2', '9', '2', 'paper/05042320522153020.docx', 'vkjt1908', '2020-05-04 23:20:52');
INSERT INTO `paper` VALUES ('2118', '2017-2018年上海市上宝中学八下压轴练习1', '2', '8', '2', 'paper/05042321382894021.docx', 'vkjt1908', '2020-05-04 23:21:38');
INSERT INTO `paper` VALUES ('2119', '2017-2018年上海市上宝中学七下双休2', '2', '7', '2', 'paper/05042322181529237.docx', 'vkjt1908', '2020-05-04 23:22:18');
INSERT INTO `paper` VALUES ('2120', '2017-2018年上海市上海中学东校八下四边形复习专题', '2', '8', '2', 'paper/05042323031651775.docx', 'vkjt1908', '2020-05-04 23:23:03');
INSERT INTO `paper` VALUES ('2121', '2017-2018年上海市上外附中八下第一次月考', '2', '8', '2', 'paper/05042323423918759.docx', 'vkjt1908', '2020-05-04 23:23:42');
INSERT INTO `paper` VALUES ('2122', '2017-2018年上海市上外附中九下3月月考', '2', '9', '2', 'paper/05042324262782982.docx', 'vkjt1908', '2020-05-04 23:24:26');
INSERT INTO `paper` VALUES ('2124', '2017--2018年上海市世外六下期中复习一', '2', '6', '2', 'paper/05042325534342088.docx', 'vkjt1908', '2020-05-04 23:25:53');
INSERT INTO `paper` VALUES ('2125', '2017-2018年上海市上外六下同步练习-5.9-6.4', '2', '6', '2', 'paper/05042326363523171.docx', 'vkjt1908', '2020-05-04 23:26:36');
INSERT INTO `paper` VALUES ('2126', '2017-2018年上海市文来中学八下3月月考', '2', '8', '2', 'paper/05042328002008491.docx', 'vkjt1908', '2020-05-04 23:28:00');
INSERT INTO `paper` VALUES ('2127', '2017-2018年上海市西南位育八下-函数综合', '2', '8', '2', 'paper/05042328384943117.docx', 'vkjt1908', '2020-05-04 23:28:38');
INSERT INTO `paper` VALUES ('2128', '2017-2018年上海市新华初七下周练1', '2', '7', '2', 'paper/05042329247139715.docx', 'vkjt1908', '2020-05-04 23:29:24');
INSERT INTO `paper` VALUES ('2129', '2017-2018年上海市新华初七下周练2', '2', '7', '2', 'paper/05042330049165950.docx', 'vkjt1908', '2020-05-04 23:30:04');
INSERT INTO `paper` VALUES ('2130', '2017-2018年上海市新华初七下周练3', '2', '7', '2', 'paper/05042330428344677.docx', 'vkjt1908', '2020-05-04 23:30:42');
INSERT INTO `paper` VALUES ('2131', '2017-2018年上海市新华初七下周练4', '2', '7', '2', 'paper/05042331288649439.docx', 'vkjt1908', '2020-05-04 23:31:28');
INSERT INTO `paper` VALUES ('2132', '2017-2018年上海市新华初专题一-平行四边形', '2', '7', '2', 'paper/05042332296144259.doc', 'vkjt1908', '2020-05-04 23:32:29');
INSERT INTO `paper` VALUES ('2133', '2017-2018年上海市新竹园八下周测4', '2', '8', '2', 'paper/05042333212582311.docx', 'vkjt1908', '2020-05-04 23:33:21');
INSERT INTO `paper` VALUES ('2134', '2017-2018年上海市园南中学九下3月月考', '2', '9', '2', 'paper/05042334069803782.docx', 'vkjt1908', '2020-05-04 23:34:06');
INSERT INTO `paper` VALUES ('2135', '2017-2018年新竹园专题-相似三角形1', '2', '7', '2', 'paper/05042335548422575.docx', 'vkjt1908', '2020-05-04 23:35:54');
INSERT INTO `paper` VALUES ('2136', '2018-2019年上海市华二九下自招卷', '2', '9', '2', 'paper/05042336397255359.docx', 'vkjt1908', '2020-05-04 23:36:39');
INSERT INTO `paper` VALUES ('2137', '2018-2019年上海市嘉一联中八下第一次月考', '2', '8', '2', 'paper/05042337293361611.docx', 'vkjt1908', '2020-05-04 23:37:29');
INSERT INTO `paper` VALUES ('2138', '2018-2019年上海市建平西校七下单元测试', '2', '7', '2', 'paper/05042338197536006.docx', 'vkjt1908', '2020-05-04 23:38:19');
INSERT INTO `paper` VALUES ('2139', '2018-2019年上海市建平香梅七下第一次月考', '2', '7', '2', 'paper/05042339022149473.docx', 'vkjt1908', '2020-05-04 23:39:02');
INSERT INTO `paper` VALUES ('2140', '2018-2019年上海市交大附中九下自招卷', '2', '9', '2', 'paper/05042339544617550.docx', 'vkjt1908', '2020-05-04 23:39:54');
INSERT INTO `paper` VALUES ('2141', '2018-2019年上海市控江中学附属民办学校七下实数单元测试_', '2', '7', '2', 'paper/05042340533969234.docx', 'vkjt1908', '2020-05-04 23:40:53');
INSERT INTO `paper` VALUES ('2142', '2018-2019年上海市民办明珠中学九下3月周测', '2', '9', '2', 'paper/05042341501774665.docx', 'vkjt1908', '2020-05-04 23:41:50');
INSERT INTO `paper` VALUES ('2143', '2018-2019年上海市民办位育中学七下3月月考', '2', '7', '2', 'paper/05042342506349560.docx', 'vkjt1908', '2020-05-04 23:42:50');
INSERT INTO `paper` VALUES ('2144', '2018-2019年上海市民办位育中学七下周测2', '2', '7', '2', 'paper/05042343347541486.docx', 'vkjt1908', '2020-05-04 23:43:34');
INSERT INTO `paper` VALUES ('2145', '2018-2019年上海市民办位育中学七下周末作业3', '2', '7', '2', 'paper/05042344182694856.docx', 'vkjt1908', '2020-05-04 23:44:18');
INSERT INTO `paper` VALUES ('2146', '2018-2019年上海市市西中学八下周测1一次函数', '2', '8', '2', 'paper/05042345119143702.docx', 'vkjt1908', '2020-05-04 23:45:11');
INSERT INTO `paper` VALUES ('2147', '2018-2019年上海市西南模范八下第一次月考', '2', '8', '2', 'paper/05042346028709828.docx', 'vkjt1908', '2020-05-04 23:46:02');
INSERT INTO `paper` VALUES ('2148', '2018-2019年上海市西南模范七下周测2', '2', '7', '2', 'paper/05042348419243254.docx', 'vkjt1908', '2020-05-04 23:48:41');
INSERT INTO `paper` VALUES ('2149', '2018-2019年上海市西南模七下第一次月考', '2', '7', '2', 'paper/05042349448582883.docx', 'vkjt1908', '2020-05-04 23:49:44');
INSERT INTO `paper` VALUES ('2150', '2018-2019年上海市西延安八下单元测试，一次函数', '2', '8', '2', 'paper/05042350377329321.docx', 'vkjt1908', '2020-05-04 23:50:37');
INSERT INTO `paper` VALUES ('2151', '2018-2019年上海市新竹园八下校本-22.2平行四边形的性质（一）', '2', '8', '2', 'paper/05042351294773633.docx', 'vkjt1908', '2020-05-04 23:51:29');
INSERT INTO `paper` VALUES ('2152', '2018届中考二模汇编-二次函数专题', '2', '9', '2', 'paper/05042352372426402.docx', 'vkjt1908', '2020-05-04 23:52:37');
INSERT INTO `paper` VALUES ('2153', '2018届中考二模汇编-函数综合专题', '2', '9', '2', 'paper/05042353287682423.docx', 'vkjt1908', '2020-05-04 23:53:28');
INSERT INTO `paper` VALUES ('2154', '2018届中考二模汇编-几何计算综合专题', '2', '9', '2', 'paper/05042354143324800.docx', 'vkjt1908', '2020-05-04 23:54:14');
INSERT INTO `paper` VALUES ('2155', '2018届中考二模汇编-几何证明专题', '2', '9', '2', 'paper/05042354565822650.docx', 'vkjt1908', '2020-05-04 23:54:56');
INSERT INTO `paper` VALUES ('2156', '2018届中考二模汇编-计算专题', '2', '9', '2', 'paper/05042355402049927.docx', 'vkjt1908', '2020-05-04 23:55:40');
INSERT INTO `paper` VALUES ('2157', '2018届中考二模汇编-解方程和不等式组专题', '2', '9', '2', 'paper/05042356351843366.docx', 'vkjt1908', '2020-05-04 23:56:35');
INSERT INTO `paper` VALUES ('2158', '2018届中考二模汇编-压轴题专题', '2', '9', '2', 'paper/05042357199050006.docx', 'vkjt1908', '2020-05-04 23:57:19');
INSERT INTO `paper` VALUES ('2159', '初升高-自主招生模拟卷1', '2', '9', '2', 'paper/05042358051707172.docx', 'vkjt1908', '2020-05-04 23:58:05');
INSERT INTO `paper` VALUES ('2160', '初升高-自主招生模拟卷2', '2', '9', '2', 'paper/05042358438158362.docx', 'vkjt1908', '2020-05-04 23:58:43');
INSERT INTO `paper` VALUES ('2161', '初升高-自主招生模拟卷3', '2', '9', '2', 'paper/05042359324273183.docx', 'vkjt1908', '2020-05-04 23:59:32');
INSERT INTO `paper` VALUES ('2162', '中考压轴专题-函数图像中的等腰三角形和直角三角形', '2', '9', '2', 'paper/05050000323527366.docx', 'vkjt1908', '2020-05-05 00:00:32');
INSERT INTO `paper` VALUES ('2163', '2016-2017年上海市第二初级中学七下期中', '2', '7', '2', 'paper/05050001189345555.docx', 'vkjt1908', '2020-05-05 00:01:18');
INSERT INTO `paper` VALUES ('2164', '2016-2017年上海市华育中学七下周末卷17A', '2', '7', '2', 'paper/05050002021393260.docx', 'vkjt1908', '2020-05-05 00:02:02');
INSERT INTO `paper` VALUES ('2165', '2016-2017年上海市进华中学七下期中', '2', '7', '2', 'paper/05050002362121624.docx', 'vkjt1908', '2020-05-05 00:02:36');
INSERT INTO `paper` VALUES ('2166', '2016-2017年上海市文来中学七下期中拓展卷', '2', '7', '2', 'paper/05050003223151663.docx', 'vkjt1908', '2020-05-05 00:03:22');
INSERT INTO `paper` VALUES ('2167', '2017-2018年上海市建平香梅七下第一次月考', '2', '7', '2', 'paper/05050004039176497.docx', 'vkjt1908', '2020-05-05 00:04:03');
INSERT INTO `paper` VALUES ('2168', '2017-2018年上海市浦东新区第四教育署七下3月月考', '2', '7', '2', 'paper/05050004412579973.docx', 'vkjt1908', '2020-05-05 00:04:41');
INSERT INTO `paper` VALUES ('2169', '2017-2018年上海市浦东新区第四教育署七下5月月考', '2', '7', '2', 'paper/05050005149442042.docx', 'vkjt1908', '2020-05-05 00:05:14');
INSERT INTO `paper` VALUES ('2170', '2017-2018年上海市浦东新区第四教育署七下期中', '2', '7', '2', 'paper/05050005546345156.docx', 'vkjt1908', '2020-05-05 00:05:54');
INSERT INTO `paper` VALUES ('2171', '2017-2018年上海市普陀区七下期中', '2', '7', '2', 'paper/05050006484700276.docx', 'vkjt1908', '2020-05-05 00:06:48');
INSERT INTO `paper` VALUES ('2172', '2017-2018年上海市七下《相交线__平行线》单元练习', '2', '7', '2', 'paper/05050008098843411.docx', 'vkjt1908', '2020-05-05 00:08:09');
INSERT INTO `paper` VALUES ('2173', '2017-2018年上海市上宝中学七下双休1', '2', '7', '2', 'paper/05050008499501616.docx', 'vkjt1908', '2020-05-05 00:08:49');
INSERT INTO `paper` VALUES ('2174', '2017-2018年上海市上宝中学七下双休2', '2', '7', '2', 'paper/05050009443393749.docx', 'vkjt1908', '2020-05-05 00:09:44');
INSERT INTO `paper` VALUES ('2175', '2017-2018年上海市上外附中七下期中复习', '2', '7', '2', 'paper/05050010267959030.docx', 'vkjt1908', '2020-05-05 00:10:26');
INSERT INTO `paper` VALUES ('2176', '2017-2018年上海市松江区七下5月月考', '2', '7', '2', 'paper/05050011151865419.docx', 'vkjt1908', '2020-05-05 00:11:15');
INSERT INTO `paper` VALUES ('2177', '2017-2018年上海市同济大学附属中学七下期中', '2', '7', '2', 'paper/05050012034513483.docx', 'vkjt1908', '2020-05-05 00:12:03');
INSERT INTO `paper` VALUES ('2178', '2017-2018年上海市同济实验学校七下期中', '2', '7', '2', 'paper/05050012453031934.docx', 'vkjt1908', '2020-05-05 00:12:45');
INSERT INTO `paper` VALUES ('2179', '2017-2018年上海市西南模范七下周测02', '2', '7', '2', 'paper/05050013269595328.docx', 'vkjt1908', '2020-05-05 00:13:26');
INSERT INTO `paper` VALUES ('2180', '2017-2018年上海市西延安七下周测', '2', '7', '2', 'paper/05050014095922759.docx', 'vkjt1908', '2020-05-05 00:14:09');
INSERT INTO `paper` VALUES ('2181', '2017-2018年上海市新华初七下周练1', '2', '7', '2', 'paper/05050014447072069.docx', 'vkjt1908', '2020-05-05 00:14:44');
INSERT INTO `paper` VALUES ('2182', '2017-2018年上海市新华初七下周练2', '2', '7', '2', 'paper/05050015468854357.docx', 'vkjt1908', '2020-05-05 00:15:46');
INSERT INTO `paper` VALUES ('2183', '2017-2018年上海市新华初七下周练3', '2', '7', '2', 'paper/05050016263288959.docx', 'vkjt1908', '2020-05-05 00:16:26');
INSERT INTO `paper` VALUES ('2184', '2017-2018年上海市新华初七下周练4', '2', '7', '2', 'paper/05050017107048826.docx', 'vkjt1908', '2020-05-05 00:17:10');
INSERT INTO `paper` VALUES ('2185', '2017-2018年上海市新华初七下周练5', '2', '7', '2', 'paper/05050017507491340.docx', 'vkjt1908', '2020-05-05 00:17:50');
INSERT INTO `paper` VALUES ('2186', '2017-2018年上海市新华初专题一-平行四边形', '2', '7', '2', 'paper/05050019055070956.doc', 'vkjt1908', '2020-05-05 00:19:05');
INSERT INTO `paper` VALUES ('2187', '2017-2018年上海市徐教院附中七下第二次月考', '2', '7', '2', 'paper/05050019517625807.docx', 'vkjt1908', '2020-05-05 00:19:51');
INSERT INTO `paper` VALUES ('2188', '2018-2019年上海市建平西校七下单元测试', '2', '7', '2', 'paper/05050020305914126.docx', 'vkjt1908', '2020-05-05 00:20:30');
INSERT INTO `paper` VALUES ('2189', '2018-2019年上海市建平香梅七下第一次月考', '2', '7', '2', 'paper/05050021211756058.docx', 'vkjt1908', '2020-05-05 00:21:21');
INSERT INTO `paper` VALUES ('2190', '2018-2019年上海市控江中学附属民办学校七下实数单元测试_', '2', '7', '2', 'paper/05050022098840479.docx', 'vkjt1908', '2020-05-05 00:22:09');
INSERT INTO `paper` VALUES ('2191', '2018-2019年上海市民办位育中学七下3月月考', '2', '7', '2', 'paper/05050022519886399.docx', 'vkjt1908', '2020-05-05 00:22:51');
INSERT INTO `paper` VALUES ('2192', '2018-2019年上海市民办位育中学七下周测2', '2', '7', '2', 'paper/05050023588526184.docx', 'vkjt1908', '2020-05-05 00:23:58');
INSERT INTO `paper` VALUES ('2193', '2018-2019年上海市民办位育中学七下周末作业3', '2', '7', '2', 'paper/05050025082984200.docx', 'vkjt1908', '2020-05-05 00:25:08');
INSERT INTO `paper` VALUES ('2194', '2018-2019年上海市闵行区七下期中', '2', '7', '2', 'paper/05050026034412105.docx', 'vkjt1908', '2020-05-05 00:26:03');
INSERT INTO `paper` VALUES ('2195', '2018-2019年上海市浦东新区第四教育署七下期中', '2', '7', '2', 'paper/05050026542414229.docx', 'vkjt1908', '2020-05-05 00:26:54');
INSERT INTO `paper` VALUES ('2196', '2018-2019年上海市松江区七下期中', '2', '7', '2', 'paper/05050027499241485.docx', 'vkjt1908', '2020-05-05 00:27:49');
INSERT INTO `paper` VALUES ('2197', '2018-2019年上海市位育中学七下期中复习1', '2', '7', '2', 'paper/05050028353122370.docx', 'vkjt1908', '2020-05-05 00:28:35');
INSERT INTO `paper` VALUES ('2198', '2018-2019年上海市西南模范七下周测2', '2', '7', '2', 'paper/05050029206946419.docx', 'vkjt1908', '2020-05-05 00:29:20');
INSERT INTO `paper` VALUES ('2199', '2018-2019年上海市西南模七下第一次月考', '2', '7', '2', 'paper/05050030067806705.docx', 'vkjt1908', '2020-05-05 00:30:06');
INSERT INTO `paper` VALUES ('2200', '2018-2019年上海市杨浦区七下期中', '2', '7', '2', 'paper/05050031075112315.docx', 'vkjt1908', '2020-05-05 00:31:07');
INSERT INTO `paper` VALUES ('2201', '往年上海市西南模范中学七下期中', '2', '7', '2', 'paper/05050032075466043.docx', 'vkjt1908', '2020-05-05 00:32:07');
INSERT INTO `paper` VALUES ('2202', '2014-2015年上海市松江区七下期中', '2', '7', '2', 'paper/05050033086626418.docx', 'vkjt1908', '2020-05-05 00:33:08');
INSERT INTO `paper` VALUES ('2203', '2015-2016年上海市川沙中学南校七下3月月考', '2', '7', '2', 'paper/05050033537130382.docx', 'vkjt1908', '2020-05-05 00:33:53');
INSERT INTO `paper` VALUES ('2204', '2015-2016年上海市奉贤区七下期中', '2', '7', '2', 'paper/05050034535908110.docx', 'vkjt1908', '2020-05-05 00:34:53');
INSERT INTO `paper` VALUES ('2205', '宝山区2016学年第一学期八年级数学期末卷', '2', '8', '1', 'paper/05051825362053512.doc', 'fetj1908', '2020-05-05 18:25:36');
INSERT INTO `paper` VALUES ('2206', '宝山区2016学年第一学期八年级数学期末卷参考答案', '2', '8', '1', 'paper/05051826029295921.doc', 'fetj1908', '2020-05-05 18:26:02');
INSERT INTO `paper` VALUES ('2207', '崇明2016学年第一学期八年级数学期末卷', '2', '8', '1', 'paper/05051826254635399.doc', 'fetj1908', '2020-05-05 18:26:25');
INSERT INTO `paper` VALUES ('2208', '崇明2016学年第一学期八年级数学期末卷参考答案', '2', '8', '1', 'paper/05051826505530687.doc', 'fetj1908', '2020-05-05 18:26:50');
INSERT INTO `paper` VALUES ('2209', '奉贤区2016学年第一学期初二数学期末卷', '2', '8', '1', 'paper/05051827177443842.doc', 'fetj1908', '2020-05-05 18:27:17');
INSERT INTO `paper` VALUES ('2210', '黄浦区2016学年第一学期八年级数学期末卷', '2', '8', '1', 'paper/05051827461369020.doc', 'fetj1908', '2020-05-05 18:27:46');
INSERT INTO `paper` VALUES ('2211', '黄浦区2016学年第一学期八年级数学期末卷参考答案', '2', '8', '1', 'paper/05051828118253708.doc', 'fetj1908', '2020-05-05 18:28:11');
INSERT INTO `paper` VALUES ('2212', '金山区2016学年度第一学期期末考试初二数学参考答案', '2', '8', '1', 'paper/05051828334981954.doc', 'fetj1908', '2020-05-05 18:28:33');
INSERT INTO `paper` VALUES ('2213', '金山区2016学年度第一学期期末考试初二数学试卷2017.1', '2', '8', '1', 'paper/05051829001972647.doc', 'fetj1908', '2020-05-05 18:29:00');
INSERT INTO `paper` VALUES ('2214', '浦东新区2016学年第一学期八年级数学期末卷评分标准', '2', '8', '1', 'paper/05051829242400441.doc', 'fetj1908', '2020-05-05 18:29:24');
INSERT INTO `paper` VALUES ('2215', '浦东新区2016学年度第一学期八年级数学期末教学质量检测试卷', '2', '8', '1', 'paper/05051829563931529.doc', 'fetj1908', '2020-05-05 18:29:56');
INSERT INTO `paper` VALUES ('2216', '普陀区2016年度第一学期八年级期末数学质量调研评分标准(定稿）', '2', '8', '1', 'paper/05051844129711358.doc', 'fetj1908', '2020-05-05 18:44:12');
INSERT INTO `paper` VALUES ('2217', '普陀区2016学年第一学期初二数学期末卷', '2', '8', '1', 'paper/05051844495059188.doc', 'fetj1908', '2020-05-05 18:44:49');
INSERT INTO `paper` VALUES ('2218', '松江区2016学年第一学期初二数学期末卷', '2', '8', '1', 'paper/05051845128333665.doc', 'fetj1908', '2020-05-05 18:45:12');
INSERT INTO `paper` VALUES ('2219', '松江区2016学年第一学期初二数学期末卷参考答案', '2', '8', '1', 'paper/05051845538769653.doc', 'fetj1908', '2020-05-05 18:45:53');
INSERT INTO `paper` VALUES ('2220', '徐汇区十三校2016学年第一学期八年级数学期末卷', '2', '8', '1', 'paper/05051846218634756.doc', 'fetj1908', '2020-05-05 18:46:21');
INSERT INTO `paper` VALUES ('2221', '徐汇区十三校2016学年第一学期初二数学期末卷', '2', '8', '1', 'paper/05051846483008669.doc', 'fetj1908', '2020-05-05 18:46:48');
INSERT INTO `paper` VALUES ('2222', '杨浦区八年级期末考试2017.1', '2', '8', '1', 'paper/05051847143062553.doc', 'fetj1908', '2020-05-05 18:47:14');
INSERT INTO `paper` VALUES ('2223', '杨浦区八年级期末考试答案2017.1', '2', '8', '1', 'paper/05051847366346339.doc', 'fetj1908', '2020-05-05 18:47:36');
INSERT INTO `paper` VALUES ('2224', '长宁区2016学年第一学期初二数学期末卷', '2', '8', '1', 'paper/05051848008699295.doc', 'fetj1908', '2020-05-05 18:48:00');
INSERT INTO `paper` VALUES ('2225', '长宁区2016学年第一学期初二数学期末卷答案', '2', '8', '1', 'paper/05051848235710432.doc', 'fetj1908', '2020-05-05 18:48:23');
INSERT INTO `paper` VALUES ('2226', '2015学年第一学期宝山期中八年级数学试卷参考答案', '2', '8', '1', 'paper/05051850556921396.doc', 'fetj1908', '2020-05-05 18:50:55');
INSERT INTO `paper` VALUES ('2227', '2015学年第一学期宝山期中考试八年级数学试卷', '2', '8', '1', 'paper/05051851278816177.doc', 'fetj1908', '2020-05-05 18:51:27');
INSERT INTO `paper` VALUES ('2228', '静教院附校八上期中卷答案', '2', '8', '1', 'paper/05051851461388158.doc', 'fetj1908', '2020-05-05 18:51:46');
INSERT INTO `paper` VALUES ('2229', '静教院附校八上期中试卷', '2', '8', '1', 'paper/05051852126461807.doc', 'fetj1908', '2020-05-05 18:52:12');
INSERT INTO `paper` VALUES ('2230', '南桥部分校八年级数学期中试卷', '2', '8', '1', 'paper/05051852395937393.doc', 'fetj1908', '2020-05-05 18:52:39');
INSERT INTO `paper` VALUES ('2231', '南桥部分校八年级数学期中试卷答案', '2', '8', '1', 'paper/05051853043934949.doc', 'fetj1908', '2020-05-05 18:53:04');
INSERT INTO `paper` VALUES ('2232', '南桥部分校八数答题纸', '2', '8', '1', 'paper/05051853271901702.doc', 'fetj1908', '2020-05-05 18:53:27');
INSERT INTO `paper` VALUES ('2233', '松江区2016学年第一学期八年级数学期中试卷', '2', '8', '1', 'paper/05051853507571424.doc', 'fetj1908', '2020-05-05 18:53:50');
INSERT INTO `paper` VALUES ('2234', '松江区2016学年第一学期八年级数学期中试卷参考答案', '2', '8', '1', 'paper/05051854113233828.doc', 'fetj1908', '2020-05-05 18:54:11');
INSERT INTO `paper` VALUES ('2235', '14学年第一学期南桥镇八年级数学期中卷', '2', '8', '1', 'paper/05051855038017887.doc', 'fetj1908', '2020-05-05 18:55:03');
INSERT INTO `paper` VALUES ('2236', '14学年第一学期闸北区八年级期中卷', '2', '8', '1', 'paper/05051855278783683.doc', 'fetj1908', '2020-05-05 18:55:27');
INSERT INTO `paper` VALUES ('2237', '浦东新区部分校联考八年级（上）数学期中试卷', '2', '8', '1', 'paper/05051855525663367.doc', 'fetj1908', '2020-05-05 18:55:52');
INSERT INTO `paper` VALUES ('2238', '普陀区八年级（上）数学期中试卷', '2', '8', '1', 'paper/05051856158957295.doc', 'fetj1908', '2020-05-05 18:56:15');
INSERT INTO `paper` VALUES ('2239', '长宁区八年级（上）数学期中考试卷', '2', '8', '1', 'paper/05051856403277575.doc', 'fetj1908', '2020-05-05 18:56:40');
INSERT INTO `paper` VALUES ('2240', '八年级数学10月月考卷（二）', '2', '8', '1', 'paper/05051858096883563.doc', 'fetj1908', '2020-05-05 18:58:09');
INSERT INTO `paper` VALUES ('2241', '八年级数学10月月考卷（二）答案', '2', '8', '1', 'paper/05051858319776807.doc', 'fetj1908', '2020-05-05 18:58:31');
INSERT INTO `paper` VALUES ('2242', '八年级数学10月月考卷（一）', '2', '8', '1', 'paper/05051858544674445.doc', 'fetj1908', '2020-05-05 18:58:54');
INSERT INTO `paper` VALUES ('2243', '八年级数学10月月考卷（一）答案', '2', '8', '1', 'paper/05051859237854068.doc', 'fetj1908', '2020-05-05 18:59:23');
INSERT INTO `paper` VALUES ('2244', '八年级数学12月月考卷（二）', '2', '8', '1', 'paper/05051859452087746.doc', 'fetj1908', '2020-05-05 18:59:45');
INSERT INTO `paper` VALUES ('2245', '八年级数学12月月考卷（二）答案', '2', '8', '1', 'paper/05051900092723545.doc', 'fetj1908', '2020-05-05 19:00:09');
INSERT INTO `paper` VALUES ('2246', '八年级数学12月月考卷（一）', '2', '8', '1', 'paper/05051900334015503.doc', 'fetj1908', '2020-05-05 19:00:33');
INSERT INTO `paper` VALUES ('2247', '八年级数学12月月考卷（一）答案', '2', '8', '1', 'paper/05051900533280085.doc', 'fetj1908', '2020-05-05 19:00:53');
INSERT INTO `paper` VALUES ('2248', '2017学年第一学期七年级数学期末复习卷（八）', '2', '7', '1', 'paper/05051910427832732.doc', 'fetj1908', '2020-05-05 19:10:42');
INSERT INTO `paper` VALUES ('2249', '2017学年第一学期七年级数学期末复习卷（二）及答案', '2', '7', '1', 'paper/05051911096317662.doc', 'fetj1908', '2020-05-05 19:11:09');
INSERT INTO `paper` VALUES ('2250', '2017学年第一学期七年级数学期末复习卷（九）', '2', '7', '1', 'paper/05051911363851946.doc', 'fetj1908', '2020-05-05 19:11:36');
INSERT INTO `paper` VALUES ('2251', '2017学年第一学期七年级数学期末复习卷（六）', '2', '7', '1', 'paper/05051912023468009.doc', 'fetj1908', '2020-05-05 19:12:02');
INSERT INTO `paper` VALUES ('2252', '2017学年第一学期七年级数学期末复习卷（七）', '2', '7', '1', 'paper/05051912396181727.doc', 'fetj1908', '2020-05-05 19:12:39');
INSERT INTO `paper` VALUES ('2253', '2017学年第一学期七年级数学期末复习卷（三）', '2', '7', '1', 'paper/05051913438363778.doc', 'fetj1908', '2020-05-05 19:13:43');
INSERT INTO `paper` VALUES ('2254', '2017学年第一学期七年级数学期末复习卷（十）', '2', '7', '1', 'paper/05051914156310500.doc', 'fetj1908', '2020-05-05 19:14:15');
INSERT INTO `paper` VALUES ('2255', '2017学年第一学期七年级数学期末复习卷（十一）', '2', '7', '1', 'paper/05051914463695196.doc', 'fetj1908', '2020-05-05 19:14:46');
INSERT INTO `paper` VALUES ('2256', '2017学年第一学期七年级数学期末复习卷（五）', '2', '7', '1', 'paper/05051915104848381.doc', 'fetj1908', '2020-05-05 19:15:10');
INSERT INTO `paper` VALUES ('2257', '2017学年第一学期七年级数学期末复习卷（一）及答案', '2', '7', '1', 'paper/05051915352220137.doc', 'fetj1908', '2020-05-05 19:15:35');
INSERT INTO `paper` VALUES ('2258', '2017学年第一学期七年级数学期末复习卷（一）及答案', '2', '7', '1', 'paper/05051915361459217.doc', 'fetj1908', '2020-05-05 19:15:36');
INSERT INTO `paper` VALUES ('2259', '普陀区2016学年第一学期七年级数学期末复习卷四及答案', '2', '7', '1', 'paper/05051916086027788.doc', 'fetj1908', '2020-05-05 19:16:08');
INSERT INTO `paper` VALUES ('2260', '2017学年第一学期七年级数学期末复习卷（八）', '2', '7', '1', 'paper/05051947144966481.doc', 'fetj1908', '2020-05-05 19:47:14');
INSERT INTO `paper` VALUES ('2261', '2017学年第一学期七年级数学期末复习卷（二）及答案', '2', '7', '1', 'paper/05051947425534468.doc', 'fetj1908', '2020-05-05 19:47:42');
INSERT INTO `paper` VALUES ('2262', '2017学年第一学期七年级数学期末复习卷（九）', '2', '7', '1', 'paper/05051948075521964.docx', 'fetj1908', '2020-05-05 19:48:07');
INSERT INTO `paper` VALUES ('2263', '2017学年第一学期七年级数学期末复习卷（六）', '2', '7', '1', 'paper/05051948321505691.doc', 'fetj1908', '2020-05-05 19:48:32');
INSERT INTO `paper` VALUES ('2264', '2017学年第一学期七年级数学期末复习卷（七）', '2', '7', '1', 'paper/05051948585565668.doc', 'fetj1908', '2020-05-05 19:48:58');
INSERT INTO `paper` VALUES ('2265', '2017学年第一学期七年级数学期末复习卷（三）', '2', '7', '1', 'paper/05051949232626359.doc', 'fetj1908', '2020-05-05 19:49:23');
INSERT INTO `paper` VALUES ('2266', '2017学年第一学期七年级数学期末复习卷（十）', '2', '7', '1', 'paper/05051949494444414.doc', 'fetj1908', '2020-05-05 19:49:49');
INSERT INTO `paper` VALUES ('2267', '2017学年第一学期七年级数学期末复习卷（十一）', '2', '7', '1', 'paper/05051950148959708.doc', 'fetj1908', '2020-05-05 19:50:14');
INSERT INTO `paper` VALUES ('2268', '2017学年第一学期七年级数学期末复习卷（五）', '2', '7', '1', 'paper/05051950373985788.doc', 'fetj1908', '2020-05-05 19:50:37');
INSERT INTO `paper` VALUES ('2269', '2017学年第一学期七年级数学期末复习卷（一）及答案', '2', '7', '1', 'paper/05051951013920146.doc', 'fetj1908', '2020-05-05 19:51:01');
INSERT INTO `paper` VALUES ('2270', '静安区七年级（上）数学期末卷（一）', '2', '7', '1', 'paper/05051951506084843.doc', 'fetj1908', '2020-05-05 19:51:50');
INSERT INTO `paper` VALUES ('2271', '静安区七年级（上）数学期末卷（三）', '2', '7', '1', 'paper/05051952147082731.doc', 'fetj1908', '2020-05-05 19:52:14');
INSERT INTO `paper` VALUES ('2272', '普陀区2016学年第一学期七年级数学期末复习卷四及答案', '2', '7', '1', 'paper/05051952373539566.doc', 'fetj1908', '2020-05-05 19:52:37');
INSERT INTO `paper` VALUES ('2273', '2017学年第一学期七年级数学期末复习卷（十二）', '2', '7', '1', 'paper/05052002092014875.doc', 'fetj1908', '2020-05-05 20:02:09');
INSERT INTO `paper` VALUES ('2274', '2017学年第一学期七年级数学期末复习卷（十六）', '2', '7', '1', 'paper/05052002341579980.doc', 'fetj1908', '2020-05-05 20:02:34');
INSERT INTO `paper` VALUES ('2275', '2017学年第一学期七年级数学期末复习卷（十三）', '2', '7', '1', 'paper/05052003024080577.doc', 'fetj1908', '2020-05-05 20:03:02');
INSERT INTO `paper` VALUES ('2276', '2017学年第一学期七年级数学期末复习卷（十四）', '2', '7', '1', 'paper/05052003366067726.doc', 'fetj1908', '2020-05-05 20:03:36');
INSERT INTO `paper` VALUES ('2277', '2017学年第一学期七年级数学期末复习卷（十五）', '2', '7', '1', 'paper/05052003597857920.doc', 'fetj1908', '2020-05-05 20:03:59');
INSERT INTO `paper` VALUES ('2278', '期末练习卷（二）', '2', '7', '1', 'paper/05052004217516853.doc', 'fetj1908', '2020-05-05 20:04:21');
INSERT INTO `paper` VALUES ('2279', '期末练习卷（三）', '2', '7', '1', 'paper/05052004437760885.doc', 'fetj1908', '2020-05-05 20:04:43');
INSERT INTO `paper` VALUES ('2280', '期末练习卷（四）', '2', '7', '1', 'paper/05052005062287159.doc', 'fetj1908', '2020-05-05 20:05:06');
INSERT INTO `paper` VALUES ('2281', '期末练习卷（一）', '2', '7', '1', 'paper/05052005284754038.doc', 'fetj1908', '2020-05-05 20:05:28');
INSERT INTO `paper` VALUES ('2283', '上海黄浦区2017学年第一学期初一数学期末卷（Word版含答案）', '2', '7', '1', 'paper/05052013186957630.doc', 'fetj1908', '2020-05-05 20:13:18');
INSERT INTO `paper` VALUES ('2284', '上海市闵行区上宝中学2019-2020学年第二学期初三4月月考物理试卷（PDF版', '4', '9', '2', 'paper/05052017174647662.doc', 'fetj1908', '2020-05-05 20:17:17');
INSERT INTO `paper` VALUES ('2285', '2020年浦东新区初三数学二模试卷', '2', '9', '2', 'paper/05151342339279291.doc', 'tmil1908', '2020-05-15 13:42:33');

-- ----------------------------
-- Table structure for `participant`
-- ----------------------------
DROP TABLE IF EXISTS `participant`;
CREATE TABLE `participant` (
  `participant_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上课成员记录id',
  `participant_lesson` int(10) unsigned NOT NULL COMMENT '课程安排id',
  `participant_student` char(10) NOT NULL COMMENT '学生成员id',
  `participant_attend_status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '学生考勤状态(1：正常，2：请假，3：旷课)',
  `participant_course` int(10) unsigned NOT NULL COMMENT '扣除课程id',
  `participant_amount` int(10) unsigned NOT NULL COMMENT '扣除课程课时数量',
  `participant_create_user` char(8) NOT NULL COMMENT '添加用户',
  `participant_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participant
-- ----------------------------

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购课id',
  `payment_student` char(10) NOT NULL COMMENT '购课学生',
  `payment_course` int(10) unsigned NOT NULL COMMENT '购买课程',
  `payment_course_unit_price` decimal(10,2) unsigned NOT NULL COMMENT '课程单价',
  `payment_hour` int(10) unsigned NOT NULL COMMENT '购买课时',
  `payment_original_price` decimal(10,2) unsigned NOT NULL COMMENT '折前费用',
  `payment_discount_percentage` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣优惠',
  `payment_discount_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `payment_discount_total` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '共计优惠金额',
  `payment_extra` decimal(10,2) unsigned NOT NULL COMMENT '资料费',
  `payment_total_price` decimal(10,2) unsigned NOT NULL COMMENT '实际付款',
  `payment_method` char(5) NOT NULL DEFAULT '现金' COMMENT '付款方式',
  `payment_remark` varchar(50) DEFAULT '' COMMENT '购课备注',
  `payment_date` date NOT NULL COMMENT '购课日期',
  `payment_create_user` char(8) NOT NULL COMMENT '添加用户',
  `payment_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `payment_review_user` char(8) DEFAULT NULL COMMENT '复核用户',
  `payment_review_time` timestamp NULL DEFAULT NULL COMMENT '复核时间',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '级别d',
  `position_name` varchar(255) NOT NULL COMMENT '级别名称',
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `position_name` (`position_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('3', '分校长');
INSERT INTO `position` VALUES ('2', '助理');
INSERT INTO `position` VALUES ('1', '总校长');
INSERT INTO `position` VALUES ('4', '教务');
INSERT INTO `position` VALUES ('5', '教师');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `salary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '工资单id',
  `salary_user` char(8) NOT NULL COMMENT '工资单用户',
  `salary_month` varchar(10) NOT NULL COMMENT '工资单月份',
  `salary_basic` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '基本工资',
  `salary_housing` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '住房补贴',
  `salary_lesson` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课时费',
  `salary_performance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '绩效金额',
  `salary_commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课消提成',
  `salary_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应发工资',
  `salary_pension` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '养老保险',
  `salary_medical` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '医疗保险',
  `salary_unemployment` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '失业保险',
  `salary_provident` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '公积金',
  `salary_children` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '子女教育',
  `salary_elderly` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '赡养老人',
  `salary_penalty` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '处罚扣款',
  `salary_tax` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '所得税',
  `salary_actual_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实发工资',
  `salary_method` varchar(5) NOT NULL DEFAULT '现金' COMMENT '支付方式',
  `salary_create_user` char(8) NOT NULL COMMENT '创建用户',
  `salary_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------

-- ----------------------------
-- Table structure for `standard_document`
-- ----------------------------
DROP TABLE IF EXISTS `standard_document`;
CREATE TABLE `standard_document` (
  `standard_document_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标准教案id',
  `standard_document_name` varchar(50) NOT NULL COMMENT '标准教案名称',
  `standard_document_subject` int(10) unsigned NOT NULL COMMENT '标准教案科目',
  `standard_document_grade` int(10) unsigned NOT NULL COMMENT '标准教案年级',
  `standard_document_semester` int(10) unsigned NOT NULL COMMENT '标准教案学期',
  `standard_document_document` varchar(50) NOT NULL COMMENT '教案路径',
  `standard_document_answer` varchar(50) NOT NULL COMMENT '答案路径',
  `standard_document_create_user` char(8) NOT NULL COMMENT '标准教案上传用户',
  `standard_document_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '标准教案上传时间',
  PRIMARY KEY (`standard_document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of standard_document
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` char(10) NOT NULL COMMENT '学生id',
  `student_name` varchar(5) NOT NULL COMMENT '学生姓名',
  `student_department` int(10) unsigned NOT NULL COMMENT '学生校区',
  `student_grade` int(10) unsigned NOT NULL COMMENT '学生年级',
  `student_gender` char(1) NOT NULL DEFAULT '男' COMMENT '学生性别',
  `student_birthday` date NOT NULL COMMENT '学生生日',
  `student_school` varchar(10) NOT NULL COMMENT '学生学校',
  `student_phone` char(11) NOT NULL COMMENT '学生电话',
  `student_is_available` tinyint(4) NOT NULL DEFAULT '1' COMMENT '学生可用状态(0：删除，1：可用)',
  `student_create_user` char(8) NOT NULL COMMENT '学生创建用户',
  `student_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '学生创建时间',
  `student_modified_user` char(8) NOT NULL COMMENT '学生修改用户',
  `student_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '学生修改时间',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_name` (`student_name`,`student_department`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '科目id',
  `subject_name` varchar(255) NOT NULL COMMENT '科目名称',
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `subject_name` (`subject_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('5', '化学');
INSERT INTO `subject` VALUES ('9', '历史');
INSERT INTO `subject` VALUES ('8', '地理');
INSERT INTO `subject` VALUES ('7', '政治');
INSERT INTO `subject` VALUES ('2', '数学');
INSERT INTO `subject` VALUES ('4', '物理');
INSERT INTO `subject` VALUES ('6', '生物');
INSERT INTO `subject` VALUES ('3', '英语');
INSERT INTO `subject` VALUES ('1', '语文');

-- ----------------------------
-- Table structure for `teacher_type`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_type`;
CREATE TABLE `teacher_type` (
  `teacher_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '教师评级',
  `teacher_type_name` varchar(10) NOT NULL COMMENT '教师评级名称',
  `teacher_type_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '教师评级创建时间',
  PRIMARY KEY (`teacher_type_id`),
  UNIQUE KEY `teacher_type_name` (`teacher_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_type
-- ----------------------------
INSERT INTO `teacher_type` VALUES ('1', '优秀教师', '2019-08-09 20:49:11');
INSERT INTO `teacher_type` VALUES ('2', '实习期教师', '2019-08-10 12:44:56');
INSERT INTO `teacher_type` VALUES ('3', '骨干教师', '2019-08-10 12:45:12');
INSERT INTO `teacher_type` VALUES ('4', '特聘教师', '2019-08-10 12:45:29');
INSERT INTO `teacher_type` VALUES ('5', '兼职教师', '2019-08-10 12:45:41');
INSERT INTO `teacher_type` VALUES ('6', '行政人员', '2019-08-10 13:00:56');
INSERT INTO `teacher_type` VALUES ('7', '骨干教师二星', '2019-10-11 09:37:57');
INSERT INTO `teacher_type` VALUES ('8', '骨干教师一星', '2019-10-11 09:38:17');
INSERT INTO `teacher_type` VALUES ('9', '优秀教师一星', '2019-10-11 13:39:20');
INSERT INTO `teacher_type` VALUES ('10', '优秀教师二星', '2019-10-14 17:40:00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` char(8) NOT NULL COMMENT 'id',
  `user_password` varchar(15) NOT NULL DEFAULT '000000' COMMENT '密码',
  `user_name` varchar(5) NOT NULL COMMENT '姓名',
  `user_gender` char(1) NOT NULL DEFAULT '男' COMMENT '性别',
  `user_department` int(10) unsigned NOT NULL COMMENT '校区',
  `user_birthday` date NOT NULL COMMENT '生日',
  `user_teacher_type` int(10) unsigned NOT NULL COMMENT '教师评级',
  `user_position` int(10) unsigned NOT NULL COMMENT '岗位',
  `user_salary_basic` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-基本工资',
  `user_salary_housing` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-住房补贴',
  `user_salary_pension` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-养老保险',
  `user_salary_medical` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-医疗保险',
  `user_salary_unemployment` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-失业保险',
  `user_salary_provident` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-公积金',
  `user_salary_children` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-子女教育',
  `user_salary_elderly` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-赡养老人',
  `user_salary_performance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '工资-绩效金额',
  `user_salary_commission` decimal(10,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '工资-课消提成（百分比）',
  `user_salary_method` varchar(5) NOT NULL DEFAULT '现金' COMMENT '工资-工资支付方式',
  `user_is_available` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户可用状态(0：删除，1：可用)',
  `user_create_user` char(8) NOT NULL COMMENT '创建用户',
  `user_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_modified_user` char(8) NOT NULL COMMENT '修改用户',
  `user_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admi0001', '000000', '管理员', '男', '1', '2000-01-01', '1', '1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.0', '现金', '1', 'admi0001', '2020-01-01 00:00:00', 'admi0001', '2020-01-01 00:00:00');

-- ----------------------------
-- Table structure for `user_access`
-- ----------------------------
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE `user_access` (
  `user_access_user` char(8) NOT NULL COMMENT '用户id',
  `user_access_access` int(10) unsigned NOT NULL COMMENT '用户功能权限',
  PRIMARY KEY (`user_access_user`,`user_access_access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_access
-- ----------------------------
INSERT INTO `user_access` VALUES ('admi0001', '15');
INSERT INTO `user_access` VALUES ('admi0001', '19');

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
-- Records of user_department
-- ----------------------------

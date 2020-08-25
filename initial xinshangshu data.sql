/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : shangshu

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-08-25 17:57:50
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
INSERT INTO `access` VALUES ('33', '教务运营', '学生晚托', '退费', 'EducationDaycareController', 'daycareRefundCreate', '/education/refund/create');
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
INSERT INTO `access` VALUES ('49', '财务中心', '课时退费记录', '删除', 'FinanceRefundPaymentController', 'refundPaymentDelete', '/finance/refund/payment/delete');
INSERT INTO `access` VALUES ('50', '财务中心', '晚托退费记录', '查看', 'FinanceRefundDaycareController', 'refundDaycare', '/finance/refund/daycare');
INSERT INTO `access` VALUES ('51', '财务中心', '晚托退费记录', '复核', 'FinanceRefundDaycareController', 'refundDaycareReview', '/finance/refund/daycare/review');
INSERT INTO `access` VALUES ('52', '财务中心', '晚托退费记录', '删除', 'FinanceRefundDaycareController', 'refundDaycareDelete', '/finance/refund/daycare/delete');
INSERT INTO `access` VALUES ('53', '详情资料', '学生详情', '查看', 'StudentController', 'student', '/student');
INSERT INTO `access` VALUES ('54', '详情资料', '班级详情', '查看', 'ClassController', 'class', '/class');
INSERT INTO `access` VALUES ('55', '详情资料', '用户详情', '查看', 'UserController', 'user', '/user');

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
INSERT INTO `department` VALUES ('1', '新场校区', '1', 'admi0001', '2020-01-01 00:00:00', 'admi0001', '2020-01-01 00:00:00');

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
INSERT INTO `standard_document` VALUES ('4', '01 初三化学上学期 化学使世界更美好', '5', '9', '1', 'standard_document/11061849142011075.doc', 'standard_document/11061849142055305.doc', 'mkck1909', '2019-11-06 18:49:14');
INSERT INTO `standard_document` VALUES ('6', '02 初三化学上学期 世界通用的化学语言', '5', '9', '1', 'standard_document/11061853536626187.doc', 'standard_document/11061853534279913.doc', 'mkck1909', '2019-11-06 18:53:53');
INSERT INTO `standard_document` VALUES ('7', '03 初三化学上学期 走进化学实验室', '5', '9', '1', 'standard_document/11061857488481968.doc', 'standard_document/11061857487646735.doc', 'mkck1909', '2019-11-06 18:57:48');
INSERT INTO `standard_document` VALUES ('8', '04 初三化学上学期 物质的分离和提纯', '5', '9', '1', 'standard_document/11061859322415002.doc', 'standard_document/11061859325884533.doc', 'mkck1909', '2019-11-06 18:59:32');
INSERT INTO `standard_document` VALUES ('9', '05 初三化学上学期 人类赖以生存的空气', '5', '9', '1', 'standard_document/11061901006824964.doc', 'standard_document/11061901006185852.doc', 'mkck1909', '2019-11-06 19:01:00');
INSERT INTO `standard_document` VALUES ('10', '06 初三化学上学期 构成物质的微粒', '5', '9', '1', 'standard_document/11061902435133323.doc', 'standard_document/11061902434597190.doc', 'mkck1909', '2019-11-06 19:02:43');
INSERT INTO `standard_document` VALUES ('11', '07 初三化学上学期 神奇的氧气', '5', '9', '1', 'standard_document/11061904041175004.doc', 'standard_document/11061904044428687.doc', 'mkck1909', '2019-11-06 19:04:04');
INSERT INTO `standard_document` VALUES ('12', '08 初三化学上学期 氧气的制备', '5', '9', '1', 'standard_document/11061905456586500.doc', 'standard_document/11061905457833128.doc', 'mkck1909', '2019-11-06 19:05:45');
INSERT INTO `standard_document` VALUES ('13', '09 初三化学上学期 物质的量', '5', '9', '1', 'standard_document/11061939546662030.doc', 'standard_document/11061939543199375.doc', 'mkck1909', '2019-11-06 19:39:54');
INSERT INTO `standard_document` VALUES ('14', '10 初三化学上学期 质量守恒定律', '5', '9', '1', 'standard_document/11061940461266354.doc', 'standard_document/11061940468799316.doc', 'mkck1909', '2019-11-06 19:40:46');
INSERT INTO `standard_document` VALUES ('16', '11 初三化学上学期 有关化学方程式的计算', '5', '9', '1', 'standard_document/11061942299566630.doc', 'standard_document/11061942293791992.doc', 'mkck1909', '2019-11-06 19:42:29');
INSERT INTO `standard_document` VALUES ('17', '12 初三化学上学期  水', '5', '9', '1', 'standard_document/11071029229180755.doc', 'standard_document/11071029228771744.doc', 'mkck1909', '2019-11-07 10:29:22');
INSERT INTO `standard_document` VALUES ('18', '13 初三化学上学期 溶液的基本概念', '5', '9', '1', 'standard_document/11071030387730974.doc', 'standard_document/11071030385863549.doc', 'mkck1909', '2019-11-07 10:30:38');
INSERT INTO `standard_document` VALUES ('19', '14 初三化学上学期 溶解度和溶质质量分数', '5', '9', '1', 'standard_document/11071031441752157.doc', 'standard_document/11071031449575063.doc', 'mkck1909', '2019-11-07 10:31:44');
INSERT INTO `standard_document` VALUES ('20', '15 初三化学上学期 溶解度的曲线', '5', '9', '1', 'standard_document/11071033178239757.doc', 'standard_document/11071033179200529.doc', 'mkck1909', '2019-11-07 10:33:17');
INSERT INTO `standard_document` VALUES ('21', '16 初三化学上学期 溶液的酸碱性', '5', '9', '1', 'standard_document/11071034129523166.doc', 'standard_document/11071034123984891.doc', 'mkck1909', '2019-11-07 10:34:12');
INSERT INTO `standard_document` VALUES ('22', '17 初三化学上学期 碳', '5', '9', '1', 'standard_document/11071035003953575.doc', 'standard_document/11071035006314293.doc', 'mkck1909', '2019-11-07 10:35:00');
INSERT INTO `standard_document` VALUES ('23', '18 初三化学上学期 碳的化合物', '5', '9', '1', 'standard_document/11071036318995572.doc', 'standard_document/11071036317094807.doc', 'mkck1909', '2019-11-07 10:36:31');
INSERT INTO `standard_document` VALUES ('24', '19 初三化学上学期 二氧化碳的制备', '5', '9', '1', 'standard_document/11071037402716605.doc', 'standard_document/11071037405435843.doc', 'mkck1909', '2019-11-07 10:37:40');
INSERT INTO `standard_document` VALUES ('25', '20 初三化学上学期 燃料和燃烧', '5', '9', '1', 'standard_document/11071038497334876.doc', 'standard_document/11071038491176168.doc', 'mkck1909', '2019-11-07 10:38:49');
INSERT INTO `standard_document` VALUES ('26', '秋季班六年级数学第1讲：整数与整除 ', '2', '6', '1', 'standard_document/11271045445462585.doc', 'standard_document/11271045447658767.doc', 'jkgn1910', '2019-11-27 10:45:44');
INSERT INTO `standard_document` VALUES ('27', '秋季班六年级数学 第2讲：分解素因数（一）', '2', '6', '1', 'standard_document/11271046378486034.doc', 'standard_document/11271046374231335.doc', 'jkgn1910', '2019-11-27 10:46:37');
INSERT INTO `standard_document` VALUES ('28', '秋季班六年级数学 第3讲：分解素因数（二）', '2', '6', '1', 'standard_document/11271047192786180.doc', 'standard_document/11271047191460190.doc', 'jkgn1910', '2019-11-27 10:47:19');
INSERT INTO `standard_document` VALUES ('29', '秋季班六年级数学 第4讲：分数的意义与性质', '2', '6', '1', 'standard_document/11271047549642267.doc', 'standard_document/11271047549202383.doc', 'jkgn1910', '2019-11-27 10:47:54');
INSERT INTO `standard_document` VALUES ('30', '秋季班六年级数学第5讲：加减运算', '2', '6', '1', 'standard_document/11271048265184800.doc', 'standard_document/11271048268189817.doc', 'jkgn1910', '2019-11-27 10:48:26');
INSERT INTO `standard_document` VALUES ('31', '秋季班六年级数学第6讲：乘除运算', '2', '6', '1', 'standard_document/11271048568537586.doc', 'standard_document/11271048569976690.doc', 'jkgn1910', '2019-11-27 10:48:56');
INSERT INTO `standard_document` VALUES ('32', '秋季班六年级数学第7讲：分数与小数的互化', '2', '6', '1', 'standard_document/11271049383647744.doc', 'standard_document/11271049388653770.doc', 'jkgn1910', '2019-11-27 10:49:38');
INSERT INTO `standard_document` VALUES ('33', '秋季班六年级数学第8讲：分数小数的四则混合运算', '2', '6', '1', 'standard_document/11271050165133140.doc', 'standard_document/11271050165250509.doc', 'jkgn1910', '2019-11-27 10:50:16');
INSERT INTO `standard_document` VALUES ('34', '秋季班六年级数学第9讲：分数运算的应用', '2', '6', '1', 'standard_document/11271050463358277.doc', 'standard_document/11271050463343226.doc', 'jkgn1910', '2019-11-27 10:50:46');
INSERT INTO `standard_document` VALUES ('35', '秋季班六年级数学第10讲：期中复习', '2', '6', '1', 'standard_document/11271051466805070.doc', 'standard_document/11271051469774073.doc', 'jkgn1910', '2019-11-27 10:51:46');
INSERT INTO `standard_document` VALUES ('37', '秋季班六年级数学第11讲：比和比例', '2', '6', '1', 'standard_document/11271052364551182.doc', 'standard_document/11271052369202108.doc', 'jkgn1910', '2019-11-27 10:52:36');
INSERT INTO `standard_document` VALUES ('38', '秋季班六年级数学第12讲：比例应用题', '2', '6', '1', 'standard_document/11271052591408806.doc', 'standard_document/11271052592360609.doc', 'jkgn1910', '2019-11-27 10:52:59');
INSERT INTO `standard_document` VALUES ('39', '秋季班六年级数学第13讲：百分比及其应用（一）', '2', '6', '1', 'standard_document/11271053291715586.doc', 'standard_document/11271053296773090.doc', 'jkgn1910', '2019-11-27 10:53:29');
INSERT INTO `standard_document` VALUES ('40', '秋季班六年级数学第14讲：百分比的应用（二）及等可能事件', '2', '6', '1', 'standard_document/11271054096284360.doc', 'standard_document/11271054099357446.doc', 'jkgn1910', '2019-11-27 10:54:09');
INSERT INTO `standard_document` VALUES ('41', '秋季班六年级数学第15讲：比和比例章节复习', '2', '6', '1', 'standard_document/11271054368953128.doc', 'standard_document/11271054369317681.doc', 'jkgn1910', '2019-11-27 10:54:36');
INSERT INTO `standard_document` VALUES ('42', '秋季班六年级数学第16讲：圆的周长与弧长', '2', '6', '1', 'standard_document/11271055034371335.doc', 'standard_document/11271055037219526.doc', 'jkgn1910', '2019-11-27 10:55:03');
INSERT INTO `standard_document` VALUES ('43', '秋季班六年级数学第17讲：圆和扇形的面积', '2', '6', '1', 'standard_document/11271055314447388.doc', 'standard_document/11271055318526137.doc', 'jkgn1910', '2019-11-27 10:55:31');
INSERT INTO `standard_document` VALUES ('44', '秋季班六年级数学第18讲：圆的组合图形的相关练习', '2', '6', '1', 'standard_document/11271056059613005.doc', 'standard_document/11271056056139488.doc', 'jkgn1910', '2019-11-27 10:56:05');
INSERT INTO `standard_document` VALUES ('45', '秋季班六年级数学第19讲：圆和扇形章节复习', '2', '6', '1', 'standard_document/11271056299084306.doc', 'standard_document/11271056298858238.doc', 'jkgn1910', '2019-11-27 10:56:29');
INSERT INTO `standard_document` VALUES ('46', '秋季班六年级数学第20讲：期末复习', '2', '6', '1', 'standard_document/11271057015203909.doc', 'standard_document/11271057012881494.doc', 'jkgn1910', '2019-11-27 10:57:01');
INSERT INTO `standard_document` VALUES ('53', '秋季班七年级数学第1讲：代数式及代数式的值', '2', '7', '1', 'standard_document/12110956203640821.doc', 'standard_document/12110956201068258.doc', 'dsix1908', '2019-12-11 09:56:20');
INSERT INTO `standard_document` VALUES ('54', '秋季班七年级数学第2讲：整式的概念', '2', '7', '1', 'standard_document/12110958323563340.doc', 'standard_document/12110958329492801.doc', 'dsix1908', '2019-12-11 09:58:32');
INSERT INTO `standard_document` VALUES ('55', '秋季班七年级数学第3讲：整式的加减', '2', '7', '1', 'standard_document/12111000431143391.doc', 'standard_document/12111000432103973.doc', 'dsix1908', '2019-12-11 10:00:43');
INSERT INTO `standard_document` VALUES ('56', '秋季班七年级数学第4讲：幂的运算', '2', '7', '1', 'standard_document/12111002006997091.doc', 'standard_document/12111002003217776.doc', 'dsix1908', '2019-12-11 10:02:00');
INSERT INTO `standard_document` VALUES ('57', '秋季班七年级数学第5讲：整式的乘法', '2', '7', '1', 'standard_document/12111003383234395.doc', 'standard_document/12111003385407149.doc', 'dsix1908', '2019-12-11 10:03:38');
INSERT INTO `standard_document` VALUES ('58', '秋季班七年级数学第6讲：乘法公式', '2', '7', '1', 'standard_document/12111004336454501.doc', 'standard_document/12111004335567714.doc', 'dsix1908', '2019-12-11 10:04:33');
INSERT INTO `standard_document` VALUES ('59', '秋季班七年级数学第7讲:因式分解（一）', '2', '7', '1', 'standard_document/12111009297663298.doc', 'standard_document/12111009297465442.doc', 'dsix1908', '2019-12-11 10:09:29');
INSERT INTO `standard_document` VALUES ('60', '秋季班七年级数学第8讲：因式分解（二）', '2', '7', '1', 'standard_document/12111010215630312.doc', 'standard_document/12111010219314484.doc', 'dsix1908', '2019-12-11 10:10:21');
INSERT INTO `standard_document` VALUES ('61', '秋季班七年级数学第9讲：因式分解综合', '2', '7', '1', 'standard_document/12111011217784704.doc', 'standard_document/12111011213596129.doc', 'dsix1908', '2019-12-11 10:11:21');
INSERT INTO `standard_document` VALUES ('62', '秋季班七年级数学第10讲：期中复习', '2', '7', '1', 'standard_document/12111012144283829.doc', 'standard_document/12111012141353103.doc', 'dsix1908', '2019-12-11 10:12:14');
INSERT INTO `standard_document` VALUES ('63', '秋季班七年级数学第11讲：整式的除法', '2', '7', '1', 'standard_document/12111013093364607.doc', 'standard_document/12111013098165588.doc', 'dsix1908', '2019-12-11 10:13:09');
INSERT INTO `standard_document` VALUES ('64', '秋季班七年级数学第12讲：整式单元复习', '2', '7', '1', 'standard_document/12111014095509668.doc', 'standard_document/12111014097167679.doc', 'dsix1908', '2019-12-11 10:14:09');
INSERT INTO `standard_document` VALUES ('65', '秋季班七年级数学第13讲：分式的概念和性质', '2', '7', '1', 'standard_document/12111028338681695.doc', 'standard_document/12111028334862396.doc', 'dsix1908', '2019-12-11 10:28:33');
INSERT INTO `standard_document` VALUES ('66', '秋季班七年级数学第14讲：分式的乘除', '2', '7', '1', 'standard_document/12111031094405246.doc', 'standard_document/12111031097546283.doc', 'dsix1908', '2019-12-11 10:31:09');
INSERT INTO `standard_document` VALUES ('67', '秋季班七年级数学第15讲：分式的加减及综合计算', '2', '7', '1', 'standard_document/12111032218866498.doc', 'standard_document/12111032214841256.doc', 'dsix1908', '2019-12-11 10:32:21');
INSERT INTO `standard_document` VALUES ('68', '秋季班七年级数学第16讲：分式方程', '2', '7', '1', 'standard_document/12111033407675751.doc', 'standard_document/12111033409908387.doc', 'dsix1908', '2019-12-11 10:33:40');
INSERT INTO `standard_document` VALUES ('69', '秋季班七年级数学第17讲：分式单元复习', '2', '7', '1', 'standard_document/12111034468237158.doc', 'standard_document/12111034465705163.doc', 'dsix1908', '2019-12-11 10:34:46');
INSERT INTO `standard_document` VALUES ('70', '秋季班七年级数学第18讲：图形的运动', '2', '7', '1', 'standard_document/12111035506495159.doc', 'standard_document/12111035509343160.doc', 'dsix1908', '2019-12-11 10:35:50');
INSERT INTO `standard_document` VALUES ('71', '秋季班七年级数学第19讲：中心对称和轴对称图形', '2', '7', '1', 'standard_document/12111036556510408.doc', 'standard_document/12111036558212596.doc', 'dsix1908', '2019-12-11 10:36:55');
INSERT INTO `standard_document` VALUES ('72', '秋季班七年级数学第20讲：期末复习', '2', '7', '1', 'standard_document/12111102123621434.doc', 'standard_document/12111102121177691.doc', 'dsix1908', '2019-12-11 11:02:12');
INSERT INTO `standard_document` VALUES ('74', '秋季班高一化学上学期第1讲原子结构', '5', '10', '1', 'standard_document/12191915022664455.doc', 'standard_document/12191915022550713.doc', 'mkck1909', '2019-12-19 19:15:02');
INSERT INTO `standard_document` VALUES ('75', '秋季班高一化学上学期第2讲核外电子', '5', '10', '1', 'standard_document/12191916084284251.doc', 'standard_document/12191916088053701.doc', 'mkck1909', '2019-12-19 19:16:08');
INSERT INTO `standard_document` VALUES ('76', '秋季班高一化学上学期第3讲相对原子质量', '5', '10', '1', 'standard_document/12191917406525206.doc', 'standard_document/12191917405294888.doc', 'mkck1909', '2019-12-19 19:17:40');
INSERT INTO `standard_document` VALUES ('77', '秋季班高一化学上学期第4讲阿伏加德罗定律与摩尔体积', '5', '10', '1', 'standard_document/12191919515864843.doc', 'standard_document/12191919516117936.doc', 'mkck1909', '2019-12-19 19:19:51');
INSERT INTO `standard_document` VALUES ('78', '秋季班高一化学上学期第5讲第一单元测试', '5', '10', '1', 'standard_document/12191920588834171.doc', 'standard_document/12191920588500907.doc', 'mkck1909', '2019-12-19 19:20:58');
INSERT INTO `standard_document` VALUES ('79', '秋季班高一化学上学期第6讲物质的量浓度', '5', '10', '1', 'standard_document/12191922453486017.doc', 'standard_document/12191922455463285.doc', 'mkck1909', '2019-12-19 19:22:45');
INSERT INTO `standard_document` VALUES ('80', '秋季班高一化学上学期第7讲以食盐为原料的化工产品1', '5', '10', '1', 'standard_document/12191925151584191.doc', 'standard_document/12191925153163397.doc', 'mkck1909', '2019-12-19 19:25:15');
INSERT INTO `standard_document` VALUES ('84', '秋季班高一化学上学期第8讲以食盐为原料的化工产品2', '5', '10', '1', 'standard_document/12191929242219009.doc', 'standard_document/12191929241435306.doc', 'mkck1909', '2019-12-19 19:29:24');
INSERT INTO `standard_document` VALUES ('85', '秋季班高一化学上学期第9讲海水中的氯', '5', '10', '1', 'standard_document/12191930354645404.doc', 'standard_document/12191930351768023.doc', 'mkck1909', '2019-12-19 19:30:35');
INSERT INTO `standard_document` VALUES ('86', '秋季班高一化学上学期第10讲期中复习（实验部分）', '5', '10', '1', 'standard_document/12191931512944855.doc', 'standard_document/12191931519537199.doc', 'mkck1909', '2019-12-19 19:31:51');
INSERT INTO `standard_document` VALUES ('87', '秋季班高一化学上学期第11讲期中复习（基础概念和计算部分）', '5', '10', '1', 'standard_document/12191932508939598.doc', 'standard_document/12191932503367946.doc', 'mkck1909', '2019-12-19 19:32:50');
INSERT INTO `standard_document` VALUES ('88', '秋季班高一化学上学期第12讲氧化还原1', '5', '10', '1', 'standard_document/12191935223866468.doc', 'standard_document/12191935222948090.doc', 'mkck1909', '2019-12-19 19:35:22');
INSERT INTO `standard_document` VALUES ('90', '秋季班高一化学上学期第13讲氧化还原2', '5', '10', '1', 'standard_document/12191936178385539.doc', 'standard_document/12191936176595840.doc', 'mkck1909', '2019-12-19 19:36:17');
INSERT INTO `standard_document` VALUES ('91', '秋季班高一化学上学期第14讲海水中提取溴和碘', '5', '10', '1', 'standard_document/12191937574169132.doc', 'standard_document/12191937579896794.doc', 'mkck1909', '2019-12-19 19:37:57');
INSERT INTO `standard_document` VALUES ('92', '秋季班高一化学上学期第15讲化学键', '5', '10', '1', 'standard_document/12191938416073998.doc', 'standard_document/12191938415555000.doc', 'mkck1909', '2019-12-19 19:38:41');
INSERT INTO `standard_document` VALUES ('93', '秋季班高一化学上学期第16讲晶体结构', '5', '10', '1', 'standard_document/12191939595528652.doc', 'standard_document/12191939592367785.doc', 'mkck1909', '2019-12-19 19:39:59');
INSERT INTO `standard_document` VALUES ('94', '秋季班高一化学上学期第17讲化学反应中的能量变化', '5', '10', '1', 'standard_document/12191941001144600.doc', 'standard_document/12191941005057120.doc', 'mkck1909', '2019-12-19 19:41:00');
INSERT INTO `standard_document` VALUES ('95', '秋季班高一化学上学期第18讲原电池', '5', '10', '1', 'standard_document/12191944513330386.doc', 'standard_document/12191944513521245.doc', 'mkck1909', '2019-12-19 19:44:51');
INSERT INTO `standard_document` VALUES ('96', '秋季班高一化学上学期第19讲期末复习1', '5', '10', '1', 'standard_document/12191947354645458.doc', 'standard_document/12191947356253249.doc', 'mkck1909', '2019-12-19 19:47:35');
INSERT INTO `standard_document` VALUES ('97', '秋季班高一化学上学期第20讲期末复习2', '5', '10', '1', 'standard_document/12191948218341603.doc', 'standard_document/12191948216041982.doc', 'mkck1909', '2019-12-19 19:48:21');
INSERT INTO `standard_document` VALUES ('98', '春季班七年级数学第1讲：实数的概念及数的开方', '2', '7', '2', 'standard_document/12192250598167234.doc', 'standard_document/12192250596384525.doc', 'favs1911', '2019-12-19 22:50:59');
INSERT INTO `standard_document` VALUES ('99', '春季班七年级数学第2讲：用数轴表示实数及计算', '2', '7', '2', 'standard_document/12192253029905212.doc', 'standard_document/12192253029373848.doc', 'favs1911', '2019-12-19 22:53:02');
INSERT INTO `standard_document` VALUES ('100', '春季班七年级数学第3讲：实数的计算及分数指数幂', '2', '7', '2', 'standard_document/12192255042795598.doc', 'standard_document/12192255049281038.doc', 'favs1911', '2019-12-19 22:55:04');
INSERT INTO `standard_document` VALUES ('101', '春季班七年级数学第4讲：实数的复习', '2', '7', '2', 'standard_document/12192256223394235.doc', 'standard_document/12192256224989234.doc', 'favs1911', '2019-12-19 22:56:22');
INSERT INTO `standard_document` VALUES ('102', '春季班七年级数学第5讲：对顶角、邻补角和垂直', '2', '7', '2', 'standard_document/12192259021966423.doc', 'standard_document/12192259024774308.doc', 'favs1911', '2019-12-19 22:59:02');
INSERT INTO `standard_document` VALUES ('103', '春季班七年级数学第6讲：三线八角及平行线的判定', '2', '7', '2', 'standard_document/12192300334140032.doc', 'standard_document/12192300334862398.doc', 'favs1911', '2019-12-19 23:00:33');
INSERT INTO `standard_document` VALUES ('104', '春季班七年级数学第7讲：平行线的判定及性质', '2', '7', '2', 'standard_document/12192302189241203.doc', 'standard_document/12192302186369785.doc', 'favs1911', '2019-12-19 23:02:18');
INSERT INTO `standard_document` VALUES ('105', '春季班七年级数学第8讲：平行线章节复习', '2', '7', '2', 'standard_document/12192303399608257.doc', 'standard_document/12192303399056697.doc', 'favs1911', '2019-12-19 23:03:39');
INSERT INTO `standard_document` VALUES ('106', '春季班七年级数学第9讲：三角形的概念及性质', '2', '7', '2', 'standard_document/12192304569294345.doc', 'standard_document/12192304567728491.doc', 'favs1911', '2019-12-19 23:04:56');
INSERT INTO `standard_document` VALUES ('107', '春季班七年级数学第10讲：期中复习', '2', '7', '2', 'standard_document/12192306161940468.doc', 'standard_document/12192306163975622.doc', 'favs1911', '2019-12-19 23:06:16');
INSERT INTO `standard_document` VALUES ('109', '春季班六年级数学第1讲：有理数', '2', '6', '2', 'standard_document/12291623074498139.doc', 'standard_document/12291623078361868.doc', 'jkgn1910', '2019-12-29 16:23:07');
INSERT INTO `standard_document` VALUES ('111', '春季班六年级数学第2讲：绝对值提高', '2', '6', '2', 'standard_document/12291647087818384.doc', 'standard_document/12291647087634395.doc', 'jkgn1910', '2019-12-29 16:47:08');
INSERT INTO `standard_document` VALUES ('112', '春季班六年级数学第3讲：有理数的加减', '2', '6', '2', 'standard_document/12291648436064502.doc', 'standard_document/12291648438732171.doc', 'jkgn1910', '2019-12-29 16:48:43');
INSERT INTO `standard_document` VALUES ('113', '春季班六年级数学第4讲：有理数的乘除', '2', '6', '2', 'standard_document/12291649404461133.doc', 'standard_document/12291649405373478.doc', 'jkgn1910', '2019-12-29 16:49:40');
INSERT INTO `standard_document` VALUES ('114', '春季班六年级数学第5讲：有理数的乘方及科学计数法', '2', '6', '2', 'standard_document/12291650347096665.doc', 'standard_document/12291650343525614.doc', 'jkgn1910', '2019-12-29 16:50:34');
INSERT INTO `standard_document` VALUES ('115', '春季班六年级数学第6讲：有理数的混合运算', '2', '6', '2', 'standard_document/12291651196246529.doc', 'standard_document/12291651198689195.doc', 'jkgn1910', '2019-12-29 16:51:19');
INSERT INTO `standard_document` VALUES ('116', '春季班六年级数学第7讲：有理数章节复习', '2', '6', '2', 'standard_document/12291652263989912.doc', 'standard_document/12291652269060468.doc', 'jkgn1910', '2019-12-29 16:52:26');
INSERT INTO `standard_document` VALUES ('117', '春季班六年级数学第8讲：方程与一元一次方程', '2', '6', '2', 'standard_document/12291653445725294.doc', 'standard_document/12291653444424323.doc', 'jkgn1910', '2019-12-29 16:53:44');
INSERT INTO `standard_document` VALUES ('118', '春季班六年级数学第9讲：一元一次方程的应用', '2', '6', '2', 'standard_document/12291654331910582.doc', 'standard_document/12291654334725855.doc', 'jkgn1910', '2019-12-29 16:54:33');
INSERT INTO `standard_document` VALUES ('119', '春季班六年级数学第10讲：期中复习', '2', '6', '2', 'standard_document/12291655438790647.doc', 'standard_document/12291655438603931.doc', 'jkgn1910', '2019-12-29 16:55:43');
INSERT INTO `standard_document` VALUES ('120', '春季班六年级数学第11讲：一元一次方程（组）及其解法', '2', '6', '2', 'standard_document/12291656587569687.doc', 'standard_document/12291656587381633.doc', 'jkgn1910', '2019-12-29 16:56:58');
INSERT INTO `standard_document` VALUES ('121', '春季班六年级数学第12讲：一元一次不等式（组）的应用与提高', '2', '6', '2', 'standard_document/12291658495742704.doc', 'standard_document/12291658494197928.doc', 'jkgn1910', '2019-12-29 16:58:49');
INSERT INTO `standard_document` VALUES ('122', '春季班六年级数学第13讲：一次方程组及其解法', '2', '6', '2', 'standard_document/12291659456803477.doc', 'standard_document/12291659456018944.doc', 'jkgn1910', '2019-12-29 16:59:45');
INSERT INTO `standard_document` VALUES ('123', '春季班六年级数学第14讲：一次方程组的应用', '2', '6', '2', 'standard_document/12291700407198592.doc', 'standard_document/12291700401300658.doc', 'jkgn1910', '2019-12-29 17:00:40');
INSERT INTO `standard_document` VALUES ('124', '春季班六年级数学第15讲：一次方程（组）和一次不等式（组）章节复习', '2', '6', '2', 'standard_document/12291701473293686.doc', 'standard_document/12291701472434315.doc', 'jkgn1910', '2019-12-29 17:01:47');
INSERT INTO `standard_document` VALUES ('125', '春季班六年级数学第16讲：线段的相等与和、差、倍', '2', '6', '2', 'standard_document/12291702399233283.doc', 'standard_document/12291702399490412.doc', 'jkgn1910', '2019-12-29 17:02:39');
INSERT INTO `standard_document` VALUES ('126', '春季班六年级数学第17讲：角', '2', '6', '2', 'standard_document/12291704048332714.doc', 'standard_document/12291704049920112.doc', 'jkgn1910', '2019-12-29 17:04:04');
INSERT INTO `standard_document` VALUES ('127', '春季班六年级数学第18讲：线段与角章节复习', '2', '6', '2', 'standard_document/12291705536461204.doc', 'standard_document/12291705537780552.doc', 'jkgn1910', '2019-12-29 17:05:53');
INSERT INTO `standard_document` VALUES ('128', '春季班六年级数学第19讲：长方体的再认识', '2', '6', '2', 'standard_document/12291706481186069.doc', 'standard_document/12291706487860439.doc', 'jkgn1910', '2019-12-29 17:06:48');
INSERT INTO `standard_document` VALUES ('129', '春季班六年级数学第20讲：期末复习', '2', '6', '2', 'standard_document/12291708059768621.doc', 'standard_document/12291708059234074.doc', 'jkgn1910', '2019-12-29 17:08:05');
INSERT INTO `standard_document` VALUES ('141', '秋季班八年级数学第1讲：二次根式的概念及性质', '2', '8', '1', 'standard_document/02211542343862972.doc', 'standard_document/02211542348528340.doc', 'dsix1908', '2020-02-21 15:42:34');
INSERT INTO `standard_document` VALUES ('142', '秋季班八年级数学第2讲：最简二次根式与同类二次根式', '2', '8', '1', 'standard_document/02211543375665391.doc', 'standard_document/02211543375186296.doc', 'dsix1908', '2020-02-21 15:43:37');
INSERT INTO `standard_document` VALUES ('143', '秋季班八年级数学第3讲：二次根式的运算', '2', '8', '1', 'standard_document/02211545038288077.doc', 'standard_document/02211545039396786.doc', 'dsix1908', '2020-02-21 15:45:03');
INSERT INTO `standard_document` VALUES ('144', '秋季班八年级数学第4讲：二次根式的综合运算', '2', '8', '1', 'standard_document/02211545565881400.doc', 'standard_document/02211545562084264.doc', 'dsix1908', '2020-02-21 15:45:56');
INSERT INTO `standard_document` VALUES ('145', '秋季班八年级数学第5讲：一元二次方程的概念及其解法', '2', '8', '1', 'standard_document/02212102283568680.doc', 'standard_document/02212102285894153.doc', 'favs1911', '2020-02-21 21:02:28');
INSERT INTO `standard_document` VALUES ('146', '秋季班八年级数学第6讲：因式分解及配方法求解一元二次方程', '2', '8', '1', 'standard_document/02212105022822426.doc', 'standard_document/02212105028680476.doc', 'favs1911', '2020-02-21 21:05:02');
INSERT INTO `standard_document` VALUES ('147', '秋季班八年级数学第7讲：一元二次方程求根公式及综合', '2', '8', '1', 'standard_document/02212106433183398.doc', 'standard_document/02212106433871257.doc', 'favs1911', '2020-02-21 21:06:43');
INSERT INTO `standard_document` VALUES ('148', '秋季班八年级数学第8讲：根的判别式及其应用', '2', '8', '1', 'standard_document/02212108096476480.doc', 'standard_document/02212108096568506.doc', 'favs1911', '2020-02-21 21:08:09');
INSERT INTO `standard_document` VALUES ('149', '秋季班八年级数学第9讲：二次三项式的因式分解及一元二次方程的应用（一）', '2', '8', '1', 'standard_document/02212109585285284.doc', 'standard_document/02212109585392609.doc', 'favs1911', '2020-02-21 21:09:58');
INSERT INTO `standard_document` VALUES ('150', '秋季班八年级数学第10讲：一元二次方程的应用（二）', '2', '8', '1', 'standard_document/02212111134004000.doc', 'standard_document/02212111133071743.doc', 'favs1911', '2020-02-21 21:11:13');
INSERT INTO `standard_document` VALUES ('151', '秋季班八年级数学第11讲 ：函数的概念及正比例函数的概念', '2', '8', '1', 'standard_document/02231704281609043.doc', 'standard_document/02231704282661284.doc', 'favs1911', '2020-02-23 17:04:28');
INSERT INTO `standard_document` VALUES ('152', '秋季班八年级数学第12讲 ：反比例函数的图像及性质', '2', '8', '1', 'standard_document/02231705134321799.doc', 'standard_document/02231705139262221.doc', 'favs1911', '2020-02-23 17:05:13');
INSERT INTO `standard_document` VALUES ('153', '秋季班八年级数学第13讲 ：正反比例函数综合', '2', '8', '1', 'standard_document/02231706004538385.doc', 'standard_document/02231706007948870.doc', 'favs1911', '2020-02-23 17:06:00');
INSERT INTO `standard_document` VALUES ('154', '秋季班八年级数学第14讲 ：函数的表示法', '2', '8', '1', 'standard_document/02231706575901217.doc', 'standard_document/02231706575633119.doc', 'favs1911', '2020-02-23 17:06:57');
INSERT INTO `standard_document` VALUES ('156', '秋季班八年级数学第15讲 ：命题与举例证明', '2', '8', '1', 'standard_document/02241848001210495.doc', 'standard_document/02241848001604821.doc', 'favs1911', '2020-02-24 18:48:00');
INSERT INTO `standard_document` VALUES ('162', '秋季班八年级数学第16讲 ：添加辅助线', '2', '8', '1', 'standard_document/02251102555317731.doc', 'standard_document/02251102552806930.doc', 'favs1911', '2020-02-25 11:02:55');
INSERT INTO `standard_document` VALUES ('163', '秋季班八年级数学第17讲 ：垂直平分线、角平分线及轨迹', '2', '8', '1', 'standard_document/02251103447842220.doc', 'standard_document/02251103442280979.doc', 'favs1911', '2020-02-25 11:03:44');
INSERT INTO `standard_document` VALUES ('165', '秋季班八年级数学第18讲 ：直角三角形的判定、性质和推论', '2', '8', '1', 'standard_document/02251105031538440.doc', 'standard_document/02251105037672488.doc', 'favs1911', '2020-02-25 11:05:03');
INSERT INTO `standard_document` VALUES ('166', '秋季班八年级数学第19讲 ：勾股定理及两点间的距离公式', '2', '8', '1', 'standard_document/02251106031559998.doc', 'standard_document/02251106033092235.doc', 'favs1911', '2020-02-25 11:06:03');
INSERT INTO `standard_document` VALUES ('167', '秋季班八年级数学第20讲 ：期末复习', '2', '8', '1', 'standard_document/02251106568822294.doc', 'standard_document/02251106569566790.doc', 'favs1911', '2020-02-25 11:06:56');
INSERT INTO `standard_document` VALUES ('168', '春季班八年级数学第1讲 ：一次函数的概念和图像', '2', '8', '2', 'standard_document/02252003367913046.doc', 'standard_document/02252003361668299.doc', 'favs1911', '2020-02-25 20:03:36');
INSERT INTO `standard_document` VALUES ('169', '春季班八年级数学第2讲 ：一次函数的应用', '2', '8', '2', 'standard_document/02252004347458126.doc', 'standard_document/02252004346122790.doc', 'favs1911', '2020-02-25 20:04:34');
INSERT INTO `standard_document` VALUES ('170', '春季班八年级数学第3讲 ：一次函数的复习', '2', '8', '2', 'standard_document/02252005334651363.doc', 'standard_document/02252005335665651.doc', 'favs1911', '2020-02-25 20:05:33');
INSERT INTO `standard_document` VALUES ('171', '春季班八年级数学第4讲 ：整式方程和分式方程', '2', '8', '2', 'standard_document/02252006167828625.doc', 'standard_document/02252006165670917.doc', 'favs1911', '2020-02-25 20:06:16');
INSERT INTO `standard_document` VALUES ('172', '春季班八年级数学第5讲 ：无理方程和二元二次方程', '2', '8', '2', 'standard_document/02252007046733952.doc', 'standard_document/02252007045043958.doc', 'favs1911', '2020-02-25 20:07:04');
INSERT INTO `standard_document` VALUES ('173', '春季班八年级数学第6讲 ：列方程解应用题', '2', '8', '2', 'standard_document/02261408441318689.doc', 'standard_document/02261408448912636.doc', 'favs1911', '2020-02-26 14:08:44');
INSERT INTO `standard_document` VALUES ('174', '春季班八年级数学第7讲 ：代数方程的复习', '2', '8', '2', 'standard_document/02261409214999839.doc', 'standard_document/02261409216441828.doc', 'favs1911', '2020-02-26 14:09:21');
INSERT INTO `standard_document` VALUES ('175', '春季班八年级数学第8讲 ：多边形和平行四边形', '2', '8', '2', 'standard_document/02261409532402621.doc', 'standard_document/02261409538804561.doc', 'favs1911', '2020-02-26 14:09:53');
INSERT INTO `standard_document` VALUES ('176', '春季班八年级数学第9讲 ：平行四边形及综合', '2', '8', '2', 'standard_document/02261410466778491.doc', 'standard_document/02261410466904427.doc', 'favs1911', '2020-02-26 14:10:46');
INSERT INTO `standard_document` VALUES ('177', '春季班八年级数学第10讲 ：期中复习', '2', '8', '2', 'standard_document/02261411346099077.doc', 'standard_document/02261411345115519.doc', 'favs1911', '2020-02-26 14:11:34');
INSERT INTO `standard_document` VALUES ('178', '春季班八年级数学第11讲 ：特殊的平行四边形', '2', '8', '2', 'standard_document/02271613117659863.doc', 'standard_document/02271613118380267.doc', 'favs1911', '2020-02-27 16:13:11');
INSERT INTO `standard_document` VALUES ('179', '春季班八年级数学第12讲 ：梯形及中位线', '2', '8', '2', 'standard_document/02271613564494830.doc', 'standard_document/02271613562771164.doc', 'favs1911', '2020-02-27 16:13:56');
INSERT INTO `standard_document` VALUES ('180', '春季班八年级数学第13讲 ：平面向量的加减法', '2', '8', '2', 'standard_document/02271614496912785.doc', 'standard_document/02271614497634752.doc', 'favs1911', '2020-02-27 16:14:49');
INSERT INTO `standard_document` VALUES ('181', '春季班八年级数学第14讲 ：四边形的复习', '2', '8', '2', 'standard_document/02271615398162828.doc', 'standard_document/02271615394592279.doc', 'favs1911', '2020-02-27 16:15:39');
INSERT INTO `standard_document` VALUES ('182', '春季班八年级数学第15讲 ：概率初步', '2', '8', '2', 'standard_document/02271616164488437.doc', 'standard_document/02271616167314302.doc', 'favs1911', '2020-02-27 16:16:16');
INSERT INTO `standard_document` VALUES ('183', '春季班八年级数学第16讲 ：动点产生的面积问题', '2', '8', '2', 'standard_document/02281256092220180.doc', 'standard_document/02281256098436086.doc', 'favs1911', '2020-02-28 12:56:09');
INSERT INTO `standard_document` VALUES ('184', '春季班八年级数学第17讲 ：图形运动中函数关系的确定', '2', '8', '2', 'standard_document/02281256454025674.doc', 'standard_document/02281256454042766.doc', 'favs1911', '2020-02-28 12:56:45');
INSERT INTO `standard_document` VALUES ('185', '春季班八年级数学第18讲 ：特殊三角形的存在性', '2', '8', '2', 'standard_document/02281257306439813.doc', 'standard_document/02281257305928616.docx', 'favs1911', '2020-02-28 12:57:30');
INSERT INTO `standard_document` VALUES ('186', '春季班八年级数学第19讲 ：四边形的存在性', '2', '8', '2', 'standard_document/02281258087597108.doc', 'standard_document/02281258081133820.doc', 'favs1911', '2020-02-28 12:58:08');
INSERT INTO `standard_document` VALUES ('187', '春季班八年级数学第20讲 ：期末复习', '2', '8', '2', 'standard_document/02281259003363025.doc', 'standard_document/02281259003880281.doc', 'favs1911', '2020-02-28 12:59:00');
INSERT INTO `standard_document` VALUES ('188', '春季班九年级数学第1讲;数与式', '2', '9', '2', 'standard_document/03021641142261648.doc', 'standard_document/03021641149772820.doc', 'dsix1908', '2020-03-02 16:41:14');
INSERT INTO `standard_document` VALUES ('189', '春季班九年级数学第2讲：方程（组）与不等式组', '2', '9', '2', 'standard_document/03021642307332723.doc', 'standard_document/03021642301729995.doc', 'dsix1908', '2020-03-02 16:42:30');
INSERT INTO `standard_document` VALUES ('190', '秋季班九年级数学第1讲 ：相似形和比例线段', '2', '9', '1', 'standard_document/03022013498811929.doc', 'standard_document/03022013494568635.doc', 'favs1911', '2020-03-02 20:13:49');
INSERT INTO `standard_document` VALUES ('191', '秋季班九年级数学第2讲 ：三角形一边的平行线(一)', '2', '9', '1', 'standard_document/03022014399393905.doc', 'standard_document/03022014399314522.doc', 'favs1911', '2020-03-02 20:14:39');
INSERT INTO `standard_document` VALUES ('192', '秋季班九年级数学第3讲 ：三角形一边的平行线（二）', '2', '9', '1', 'standard_document/03022015408798000.doc', 'standard_document/03022015403903326.doc', 'favs1911', '2020-03-02 20:15:40');
INSERT INTO `standard_document` VALUES ('193', '春季班三年级英语下册第1讲：M1U1 Seeing and hearing ', '3', '3', '2', 'standard_document/03022016249827792.doc', 'standard_document/03022016246721657.doc', 'oqrj1908', '2020-03-02 20:16:24');
INSERT INTO `standard_document` VALUES ('194', '秋季班九年级数学第4讲 ：相似三角形的判定（一）', '2', '9', '1', 'standard_document/03022016267462468.doc', 'standard_document/03022016261644716.doc', 'favs1911', '2020-03-02 20:16:26');
INSERT INTO `standard_document` VALUES ('196', '春季班三年级英语下册第2讲：M1U2 Touching and feeling', '3', '3', '2', 'standard_document/03022019177932453.doc', 'standard_document/03022019174742423.doc', 'oqrj1908', '2020-03-02 20:19:17');
INSERT INTO `standard_document` VALUES ('201', '秋季班八年级英语第1讲：牛津8A U1词汇+特殊疑问句&不定冠词+', '3', '8', '1', 'standard_document/03022139536679640.doc', 'standard_document/03022139532017618.doc', 'bpsn2001', '2020-03-02 21:39:53');
INSERT INTO `standard_document` VALUES ('202', '秋季班八年级英语第2讲：8A U2强化+定冠词、零冠词+句子的朗读+阅读（社会交', '3', '8', '1', 'standard_document/03022143153734352.doc', 'standard_document/03022143157775093.doc', 'bpsn2001', '2020-03-02 21:43:15');
INSERT INTO `standard_document` VALUES ('203', '春季班九年级数学第3讲：函数与分析', '2', '9', '2', 'standard_document/03031114288491908.doc', 'standard_document/03031114283451385.doc', '', '2020-03-03 11:14:28');
INSERT INTO `standard_document` VALUES ('204', '春季班九年级数学第3讲：函数与分析', '2', '9', '2', 'standard_document/03031116242385310.doc', 'standard_document/03031116243644619.doc', 'dsix1908', '2020-03-03 11:16:24');
INSERT INTO `standard_document` VALUES ('205', '春季班九年级数学第4讲：长方形与三角形', '2', '9', '2', 'standard_document/03031117422016073.doc', 'standard_document/03031117422622162.doc', 'dsix1908', '2020-03-03 11:17:42');
INSERT INTO `standard_document` VALUES ('206', '春季班三年级英语下册第3讲：M1U3 Tasting and smelling', '3', '3', '2', 'standard_document/03031131011956653.doc', 'standard_document/03031131014942807.doc', 'oqrj1908', '2020-03-03 11:31:01');
INSERT INTO `standard_document` VALUES ('207', '春季班三年级英语下册第4讲：M2U1 Animals', '3', '3', '2', 'standard_document/03031132199299447.doc', 'standard_document/03031132194220949.doc', 'oqrj1908', '2020-03-03 11:32:19');
INSERT INTO `standard_document` VALUES ('208', '秋季班五年级数学第1讲： 复习与提高', '2', '5', '1', 'standard_document/03031534206411828.doc', 'standard_document/03031534209320798.doc', 'jkgn1910', '2020-03-03 15:34:20');
INSERT INTO `standard_document` VALUES ('209', '秋季班五年级数学第2讲： 小数乘法（一）', '2', '5', '1', 'standard_document/03031534587526036.doc', 'standard_document/03031534587223101.doc', 'jkgn1910', '2020-03-03 15:34:58');
INSERT INTO `standard_document` VALUES ('210', '秋季班五年级数学第3讲：小数乘法（二）', '2', '5', '1', 'standard_document/03031641171325192.doc', 'standard_document/03031641176794851.doc', 'jkgn1910', '2020-03-03 16:41:17');
INSERT INTO `standard_document` VALUES ('211', '秋季班五年级数学第4讲： 小数除法（一）', '2', '5', '1', 'standard_document/03031641524037137.doc', 'standard_document/03031641525295340.doc', 'jkgn1910', '2020-03-03 16:41:52');
INSERT INTO `standard_document` VALUES ('212', '秋季班九年级数学第5讲 ：相似三角形的判定（二）', '2', '9', '1', 'standard_document/03031734203907914.doc', 'standard_document/03031734209581038.doc', 'favs1911', '2020-03-03 17:34:20');
INSERT INTO `standard_document` VALUES ('213', '秋季班九年级数学第6讲 ：相似三角形的性质', '2', '9', '1', 'standard_document/03031735425747351.doc', 'standard_document/03031735427517404.doc', 'favs1911', '2020-03-03 17:35:42');
INSERT INTO `standard_document` VALUES ('214', '秋季班九年级数学第7讲 ：相似三角形综合', '2', '9', '1', 'standard_document/03031736289331064.doc', 'standard_document/03031736285210095.doc', 'favs1911', '2020-03-03 17:36:28');
INSERT INTO `standard_document` VALUES ('215', '秋季班九年级数学第8讲 ：平面向量的线性运算', '2', '9', '1', 'standard_document/03031737338847499.doc', 'standard_document/03031737333690452.doc', 'favs1911', '2020-03-03 17:37:33');
INSERT INTO `standard_document` VALUES ('216', '秋季班八年级英语第3讲：牛津版8AU2词汇语法+一般现在时+阅读（学科&兴趣爱好', '3', '8', '1', 'standard_document/03031853162401212.doc', 'standard_document/03031853162575655.doc', 'bpsn2001', '2020-03-03 18:53:16');
INSERT INTO `standard_document` VALUES ('244', '秋季班八年级英语第4讲：8AU2强化+一般疑问句声调+阅读（娱乐&运动）+作文：', '3', '8', '1', 'standard_document/03031904049646619.doc', 'standard_document/03031904047678356.doc', 'bpsn2001', '2020-03-03 19:04:04');
INSERT INTO `standard_document` VALUES ('247', '秋季班五年级数学第5讲：小数除法（二）', '2', '5', '1', 'standard_document/03040932257394232.doc', 'standard_document/03040932259268451.doc', 'jkgn1910', '2020-03-04 09:32:25');
INSERT INTO `standard_document` VALUES ('248', '秋季班五年级数学第6讲： 计算综合', '2', '5', '1', 'standard_document/03040932567111105.doc', 'standard_document/03040932569904439.doc', 'jkgn1910', '2020-03-04 09:32:56');
INSERT INTO `standard_document` VALUES ('249', '春季班三年级英语下册第5讲：M2U2 Toys ', '3', '3', '2', 'standard_document/03041155051955439.doc', 'standard_document/03041155057910423.doc', 'oqrj1908', '2020-03-04 11:55:05');
INSERT INTO `standard_document` VALUES ('250', '春季班三年级英语下册第6讲：M2U3 Clothes', '3', '3', '2', 'standard_document/03041156024369710.doc', 'standard_document/03041156028664992.doc', 'oqrj1908', '2020-03-04 11:56:02');
INSERT INTO `standard_document` VALUES ('251', '春季班九年级数学第5讲;四边形', '2', '9', '2', 'standard_document/03041308079138635.doc', 'standard_document/03041308074002500.doc', 'dsix1908', '2020-03-04 13:08:07');
INSERT INTO `standard_document` VALUES ('252', '春季班九年级数学第6讲：平面向量', '2', '9', '2', 'standard_document/03041311332338088.doc', 'standard_document/03041311334613654.doc', 'dsix1908', '2020-03-04 13:11:33');
INSERT INTO `standard_document` VALUES ('253', '春季班七年级数学第11讲：全等三角形的概念及判定', '2', '7', '2', 'standard_document/03041354335044698.doc', 'standard_document/03041354336057749.doc', 'favs1911', '2020-03-04 13:54:33');
INSERT INTO `standard_document` VALUES ('254', '春季班七年级数学第12讲：全等三角形的综合', '2', '7', '2', 'standard_document/03041355156121861.doc', 'standard_document/03041355151218127.doc', 'favs1911', '2020-03-04 13:55:15');
INSERT INTO `standard_document` VALUES ('255', '春季班七年级数学第13讲：等腰三角形一', '2', '7', '2', 'standard_document/03041355572983927.doc', 'standard_document/03041355574777702.doc', 'favs1911', '2020-03-04 13:55:57');
INSERT INTO `standard_document` VALUES ('256', '春季班七年级数学第14讲：等腰三角形二', '2', '7', '2', 'standard_document/03041356431454028.doc', 'standard_document/03041356434240092.doc', 'favs1911', '2020-03-04 13:56:43');
INSERT INTO `standard_document` VALUES ('257', '春季班七年级数学第15讲：等边三角形', '2', '7', '2', 'standard_document/03041357175761660.doc', 'standard_document/03041357172516389.doc', 'favs1911', '2020-03-04 13:57:17');
INSERT INTO `standard_document` VALUES ('258', '春季班七年级数学第16讲：三角形的复习', '2', '7', '2', 'standard_document/03041358039706624.doc', 'standard_document/03041358032120161.doc', 'favs1911', '2020-03-04 13:58:03');
INSERT INTO `standard_document` VALUES ('259', '春季班七年级数学第17讲：平面直角坐标系一', '2', '7', '2', 'standard_document/03041359029721125.doc', 'standard_document/03041359026774944.doc', 'favs1911', '2020-03-04 13:59:02');
INSERT INTO `standard_document` VALUES ('260', '春季班七年级数学第18讲：平面直角坐标系二', '2', '7', '2', 'standard_document/03041359587475411.doc', 'standard_document/03041359586555489.doc', 'favs1911', '2020-03-04 13:59:58');
INSERT INTO `standard_document` VALUES ('261', '春季班七年级数学第19讲：压轴综合题', '2', '7', '2', 'standard_document/03041400472558051.doc', 'standard_document/03041400477131640.doc', 'favs1911', '2020-03-04 14:00:47');
INSERT INTO `standard_document` VALUES ('262', '春季班七年级数学第20讲：期末复习', '2', '7', '2', 'standard_document/03041401334338573.doc', 'standard_document/03041401336041426.doc', 'favs1911', '2020-03-04 14:01:33');
INSERT INTO `standard_document` VALUES ('263', '秋季班八年级英语第5讲：8AU3同步+一般过去时+阅读（哲理&内心成长）', '3', '8', '1', 'standard_document/03041437467361014.doc', 'standard_document/03041437466815757.doc', 'bpsn2001', '2020-03-04 14:37:46');
INSERT INTO `standard_document` VALUES ('267', '秋季班八年级英语第6讲：8AU3强化+一般现在时&一般过去时+阅读（解决问题）', '3', '8', '1', 'standard_document/03041439512300677.doc', 'standard_document/03041439518744616.doc', 'bpsn2001', '2020-03-04 14:39:51');
INSERT INTO `standard_document` VALUES ('280', '秋季班高一年级数学第一讲：集合及其表示方法', '2', '10', '1', 'standard_document/03041849364492056.doc', 'standard_document/03041849361912636.doc', 'rbyj1908', '2020-03-04 18:49:36');
INSERT INTO `standard_document` VALUES ('281', '秋季班高一年级数学第二讲：集合与集合之间的关系', '2', '10', '1', 'standard_document/03041852065142656.doc', 'standard_document/03041852064363540.doc', 'rbyj1908', '2020-03-04 18:52:06');
INSERT INTO `standard_document` VALUES ('282', '秋季班高一年级数学第三讲：集合运算1', '2', '10', '1', 'standard_document/03041853544675713.doc', 'standard_document/03041853542411944.doc', 'rbyj1908', '2020-03-04 18:53:54');
INSERT INTO `standard_document` VALUES ('283', '秋季班九年级数学第9讲 ：锐角三角比的意义', '2', '9', '1', 'standard_document/03041901401030982.doc', 'standard_document/03041901406972956.doc', 'favs1911', '2020-03-04 19:01:40');
INSERT INTO `standard_document` VALUES ('284', '秋季班九年级数学第10讲 ：期中复习', '2', '9', '1', 'standard_document/03041902195388229.doc', 'standard_document/03041902194186763.doc', 'favs1911', '2020-03-04 19:02:19');
INSERT INTO `standard_document` VALUES ('285', '秋季班九年级数学第11讲 ：特殊锐角的三角比', '2', '9', '1', 'standard_document/03041903159356861.doc', 'standard_document/03041903156453372.doc', 'favs1911', '2020-03-04 19:03:15');
INSERT INTO `standard_document` VALUES ('286', '秋季班九年级数学第12讲 ：解直角三角形', '2', '9', '1', 'standard_document/03041904189634722.doc', 'standard_document/03041904184671093.doc', 'favs1911', '2020-03-04 19:04:18');
INSERT INTO `standard_document` VALUES ('287', '秋季班高一年级数学第四讲：集合的运算2', '2', '10', '1', 'standard_document/03041904541546315.doc', 'standard_document/03041904548644079.doc', 'rbyj1908', '2020-03-04 19:04:54');
INSERT INTO `standard_document` VALUES ('288', '秋季班高一年级数学第五讲：充分必要条件及命题', '2', '10', '1', 'standard_document/03041907187109328.doc', 'standard_document/03041907186215741.doc', 'rbyj1908', '2020-03-04 19:07:18');
INSERT INTO `standard_document` VALUES ('289', '秋季班高一年级数学第六讲：不等式的基本性质', '2', '10', '1', 'standard_document/03041908306864385.doc', 'standard_document/03041908302604148.doc', 'rbyj1908', '2020-03-04 19:08:30');
INSERT INTO `standard_document` VALUES ('290', '秋季班五年级数学第7讲： 平均数及计算', '2', '5', '1', 'standard_document/03050944349252144.doc', 'standard_document/03050944347683108.doc', 'jkgn1910', '2020-03-05 09:44:34');
INSERT INTO `standard_document` VALUES ('291', '秋季班五年级数学第8讲：平均数应用', '2', '5', '1', 'standard_document/03050945064560460.doc', 'standard_document/03050945068876606.doc', 'jkgn1910', '2020-03-05 09:45:06');
INSERT INTO `standard_document` VALUES ('292', '秋季班高一年级第七讲：一元二次不等式', '2', '10', '1', 'standard_document/03051244155198812.doc', 'standard_document/03051244158629562.doc', 'rbyj1908', '2020-03-05 12:44:15');
INSERT INTO `standard_document` VALUES ('293', '秋季班高一年级第八讲：分式不等式', '2', '10', '1', 'standard_document/03051245442435344.doc', 'standard_document/03051245446464773.doc', 'rbyj1908', '2020-03-05 12:45:44');
INSERT INTO `standard_document` VALUES ('294', '春季班九年级数学第7讲：概率与统计（1）', '2', '9', '2', 'standard_document/03051422234799923.doc', 'standard_document/03051422231762927.doc', 'dsix1908', '2020-03-05 14:22:23');
INSERT INTO `standard_document` VALUES ('295', '春季班九年级数学第8讲：概率与统计（2）', '2', '9', '2', 'standard_document/03051424005867474.doc', 'standard_document/03051424001541480.doc', 'dsix1908', '2020-03-05 14:24:00');
INSERT INTO `standard_document` VALUES ('296', '春季班三年级英语下册第7讲：M3U1 Shapes', '3', '3', '2', 'standard_document/03051502449518542.doc', 'standard_document/03051502443624362.doc', 'oqrj1908', '2020-03-05 15:02:44');
INSERT INTO `standard_document` VALUES ('298', '春季班三年级英语下册第8讲：M3U2 Colors', '3', '3', '2', 'standard_document/03051503571719751.doc', 'standard_document/03051503572420611.doc', 'oqrj1908', '2020-03-05 15:03:57');
INSERT INTO `standard_document` VALUES ('299', '秋季班九年级数学第13讲 ：解直角三角形的应用', '2', '9', '1', 'standard_document/03051558034783875.doc', 'standard_document/03051558032261140.doc', 'favs1911', '2020-03-05 15:58:03');
INSERT INTO `standard_document` VALUES ('300', '秋季班九年级数学第14讲 ：锐角三角比章节复习', '2', '9', '1', 'standard_document/03051559112501304.doc', 'standard_document/03051559113323150.doc', 'favs1911', '2020-03-05 15:59:11');
INSERT INTO `standard_document` VALUES ('301', '秋季班九年级数学第15讲 ：二次函数的概念及特殊二次函数的图像', '2', '9', '1', 'standard_document/03051559591089768.doc', 'standard_document/03051559595834237.doc', 'favs1911', '2020-03-05 15:59:59');
INSERT INTO `standard_document` VALUES ('302', '秋季班九年级数学第16讲 ：特殊二次函数的图像', '2', '9', '1', 'standard_document/03051600536963683.doc', 'standard_document/03051600531649249.doc', 'favs1911', '2020-03-05 16:00:53');
INSERT INTO `standard_document` VALUES ('303', '秋季班八年级英语第7讲：8AU4同步+数词+语法综合+阅读（科技）', '3', '8', '1', 'standard_document/03051706087744274.doc', 'standard_document/03051706088409709.doc', 'bpsn2001', '2020-03-05 17:06:08');
INSERT INTO `standard_document` VALUES ('309', '秋季班一年级英语第一讲：M1U1 Greetings', '3', '1', '1', 'standard_document/03051714179263550.doc', 'standard_document/03051714174066255.doc', 'neck1908', '2020-03-05 17:14:17');
INSERT INTO `standard_document` VALUES ('311', '秋季班一年级英语第二讲：M1U2 My  classmates', '3', '1', '1', 'standard_document/03051715061244093.doc', 'standard_document/03051715065731059.doc', 'neck1908', '2020-03-05 17:15:06');
INSERT INTO `standard_document` VALUES ('313', '秋季班八年级英语第8讲：8AU4巩固+祈使句+语法综合+阅读', '3', '8', '1', 'standard_document/03051755236612582.doc', 'standard_document/03051755232291696.doc', 'bpsn2001', '2020-03-05 17:55:23');
INSERT INTO `standard_document` VALUES ('320', '秋季班五年级数学第9讲：期中复习（一）', '2', '5', '1', 'standard_document/03060959087171630.doc', 'standard_document/03060959088279976.doc', 'jkgn1910', '2020-03-06 09:59:08');
INSERT INTO `standard_document` VALUES ('321', '秋季班五年级数学第10讲：期中复习（二）', '2', '5', '1', 'standard_document/03060959404761932.doc', 'standard_document/03060959407543629.doc', 'jkgn1910', '2020-03-06 09:59:40');
INSERT INTO `standard_document` VALUES ('322', '秋季班一年级英语第三讲：M1U3 My face', '3', '1', '1', 'standard_document/03061109467723769.doc', 'standard_document/03061109469136381.doc', 'neck1908', '2020-03-06 11:09:46');
INSERT INTO `standard_document` VALUES ('323', '秋季班一年级英语第四讲：（Test for Module 1）', '3', '1', '1', 'standard_document/03061110218361567.doc', 'standard_document/03061110218740532.doc', 'neck1908', '2020-03-06 11:10:21');
INSERT INTO `standard_document` VALUES ('324', '秋季班九年级数学第17讲 ：二次函数y=ax2+bx+c的图像', '2', '9', '1', 'standard_document/03061359232234668.doc', 'standard_document/03061359237236899.doc', 'favs1911', '2020-03-06 13:59:23');
INSERT INTO `standard_document` VALUES ('325', '春季班三年级英语下册第9讲：M3U3 Seasons', '3', '3', '2', 'standard_document/03061400158426461.doc', 'standard_document/03061400156103715.doc', 'oqrj1908', '2020-03-06 14:00:15');
INSERT INTO `standard_document` VALUES ('326', '秋季班九年级数学第18讲 ：二次函数解析式的确定', '2', '9', '1', 'standard_document/03061400177786809.doc', 'standard_document/03061400178749712.doc', 'favs1911', '2020-03-06 14:00:17');
INSERT INTO `standard_document` VALUES ('327', '秋季班九年级数学第19讲 ：二次函数图像性质的应用', '2', '9', '1', 'standard_document/03061401009184026.doc', 'standard_document/03061401003493519.doc', 'favs1911', '2020-03-06 14:01:00');
INSERT INTO `standard_document` VALUES ('328', '春季班三年级英语下册第10讲：期中综合测试', '3', '3', '2', 'standard_document/03061401145082966.doc', 'standard_document/03061401142800260.doc', 'oqrj1908', '2020-03-06 14:01:14');
INSERT INTO `standard_document` VALUES ('329', '秋季班九年级数学第20讲 ：期末复习', '2', '9', '1', 'standard_document/03061401515840118.doc', 'standard_document/03061401517676543.doc', 'favs1911', '2020-03-06 14:01:51');
INSERT INTO `standard_document` VALUES ('330', '春季班九年级数学第9讲：正多边形与圆', '2', '9', '2', 'standard_document/03061807568387000.doc', 'standard_document/03061807566385779.doc', 'dsix1908', '2020-03-06 18:07:56');
INSERT INTO `standard_document` VALUES ('331', '春季班九年级数学第10讲：期中复习', '2', '9', '2', 'standard_document/03061809188942870.doc', 'standard_document/03061809186106790.doc', 'dsix1908', '2020-03-06 18:09:18');
INSERT INTO `standard_document` VALUES ('335', '秋季班高一年级数学第九讲：绝对值不等式', '2', '10', '1', 'standard_document/03062014233814161.doc', 'standard_document/03062014237807585.doc', 'rbyj1908', '2020-03-06 20:14:23');
INSERT INTO `standard_document` VALUES ('336', '秋季班八年级英语第9讲：8AU1-U4词性转换+句型转换+语法易错题+阅读', '3', '8', '1', 'standard_document/03062015182261721.doc', 'standard_document/03062015184087330.doc', 'bpsn2001', '2020-03-06 20:15:18');
INSERT INTO `standard_document` VALUES ('346', '秋季班高一年级数学第十讲：期中复习', '2', '10', '1', 'standard_document/03062020368193653.doc', 'standard_document/03062020361620740.doc', 'rbyj1908', '2020-03-06 20:20:36');
INSERT INTO `standard_document` VALUES ('347', '春季班三年级英语下册第12讲：M4U2 Childrens Day', '3', '3', '2', 'standard_document/03071051019317262.doc', 'standard_document/03071051018081453.doc', 'oqrj1908', '2020-03-07 10:51:01');
INSERT INTO `standard_document` VALUES ('348', '春季班三年级英语下册第11讲：M4U1 My body', '3', '3', '2', 'standard_document/03071052043341154.doc', 'standard_document/03071052046520501.doc', 'oqrj1908', '2020-03-07 10:52:04');
INSERT INTO `standard_document` VALUES ('349', '春季班三年级英语下册第13讲：M4U3 Story time', '3', '3', '2', 'standard_document/03071054333812402.doc', 'standard_document/03071054336180196.doc', 'oqrj1908', '2020-03-07 10:54:33');
INSERT INTO `standard_document` VALUES ('350', '春季班三年级英语下册第14讲：题型专项测试1', '3', '3', '2', 'standard_document/03071055479393836.doc', 'standard_document/03071055471499413.doc', 'oqrj1908', '2020-03-07 10:55:47');
INSERT INTO `standard_document` VALUES ('351', '秋季班一年级英语第五讲：my  abilities', '3', '1', '1', 'standard_document/03071106514916746.doc', 'standard_document/03071106512466079.doc', 'neck1908', '2020-03-07 11:06:51');
INSERT INTO `standard_document` VALUES ('352', '秋季班一年级英语第六讲：My family', '3', '1', '1', 'standard_document/03071107267980063.doc', 'standard_document/03071107262834542.doc', 'neck1908', '2020-03-07 11:07:26');
INSERT INTO `standard_document` VALUES ('353', '秋季班一年级英语第七讲：My friends', '3', '1', '1', 'standard_document/03081628456995047.doc', 'standard_document/03081628456912614.doc', 'neck1908', '2020-03-08 16:28:45');
INSERT INTO `standard_document` VALUES ('354', '秋季班一年级英语第八讲：（Test for Module 2）', '3', '1', '1', 'standard_document/03081629449013853.doc', 'standard_document/03081629447572180.doc', 'neck1908', '2020-03-08 16:29:44');
INSERT INTO `standard_document` VALUES ('355', '春季班九年级数学第10讲：期中复习', '2', '9', '2', 'standard_document/03091217437020232.doc', 'standard_document/03091217433817051.doc', 'dsix1908', '2020-03-09 12:17:43');
INSERT INTO `standard_document` VALUES ('356', '春季班九年级数学第11讲：多解问题', '2', '9', '2', 'standard_document/03091218384152099.doc', 'standard_document/03091218384482599.doc', 'dsix1908', '2020-03-09 12:18:38');
INSERT INTO `standard_document` VALUES ('357', '秋季班五年级数学第11讲：简易方程', '2', '5', '1', 'standard_document/03091337072857179.doc', 'standard_document/03091337077249525.doc', 'jkgn1910', '2020-03-09 13:37:07');
INSERT INTO `standard_document` VALUES ('358', '秋季班五年级数学第12讲：解方程', '2', '5', '1', 'standard_document/03091337508847003.doc', 'standard_document/03091337507268864.doc', 'jkgn1910', '2020-03-09 13:37:50');
INSERT INTO `standard_document` VALUES ('359', '秋季班一年级英语第九讲：in the classroom', '3', '1', '1', 'standard_document/03091612018772600.doc', 'standard_document/03091612011303678.doc', 'neck1908', '2020-03-09 16:12:01');
INSERT INTO `standard_document` VALUES ('360', '秋季班一年级英语第十讲：期中测试', '3', '1', '1', 'standard_document/03091612304805479.doc', 'standard_document/03091612305589004.doc', 'neck1908', '2020-03-09 16:12:30');
INSERT INTO `standard_document` VALUES ('361', '秋季班高一年级数学第十一讲：基本不等式', '2', '10', '1', 'standard_document/03091921586449376.doc', 'standard_document/03091921586452307.doc', 'rbyj1908', '2020-03-09 19:21:58');
INSERT INTO `standard_document` VALUES ('362', '秋季班高一年级数学第十二讲：不等式的证明', '2', '10', '1', 'standard_document/03091924294873020.doc', 'standard_document/03091924295631529.doc', 'rbyj1908', '2020-03-09 19:24:29');
INSERT INTO `standard_document` VALUES ('363', '秋季班高一年级数学第十二讲：不等式的证明', '2', '10', '1', 'standard_document/03091924308612824.doc', 'standard_document/03091924302882755.doc', 'rbyj1908', '2020-03-09 19:24:30');
INSERT INTO `standard_document` VALUES ('364', '春季班三年级英语下册第15讲：题型专项测试2', '3', '3', '2', 'standard_document/03091947303689496.doc', 'standard_document/03091947307205613.doc', 'oqrj1908', '2020-03-09 19:47:30');
INSERT INTO `standard_document` VALUES ('365', '春季班三年级英语下册第16讲：题型专项测试3', '3', '3', '2', 'standard_document/03091948324757535.doc', 'standard_document/03091948321251939.doc', 'oqrj1908', '2020-03-09 19:48:32');
INSERT INTO `standard_document` VALUES ('366', '春季班三年级英语下册第17讲：题型专项测试4', '3', '3', '2', 'standard_document/03091949274325781.doc', 'standard_document/03091949275895348.doc', 'oqrj1908', '2020-03-09 19:49:27');
INSERT INTO `standard_document` VALUES ('367', '春季班三年级英语下册第18讲：题型专项测试5', '3', '3', '2', 'standard_document/03091950211709116.doc', 'standard_document/03091950212723525.doc', 'oqrj1908', '2020-03-09 19:50:21');
INSERT INTO `standard_document` VALUES ('368', '春季班三年级英语下册第19讲：题型专项测试6', '3', '3', '2', 'standard_document/03091951334875180.doc', 'standard_document/03091951337159424.doc', 'oqrj1908', '2020-03-09 19:51:33');
INSERT INTO `standard_document` VALUES ('369', '春季班三年级英语下册第20讲：期末综合测试', '3', '3', '2', 'standard_document/03091952389450725.doc', 'standard_document/03091952389639711.doc', 'oqrj1908', '2020-03-09 19:52:38');
INSERT INTO `standard_document` VALUES ('370', '秋季班八年级英语第10讲:期中复习+期中模拟', '3', '8', '1', 'standard_document/03092134344788034.doc', 'standard_document/03092134342502252.doc', 'bpsn2001', '2020-03-09 21:34:34');
INSERT INTO `standard_document` VALUES ('371', '秋季班八年级英语第11讲：8AU5词汇+可数名词与不可数名词/代词another', '3', '8', '1', 'standard_document/03092137459590510.doc', 'standard_document/03092137452243536.doc', 'bpsn2001', '2020-03-09 21:37:45');
INSERT INTO `standard_document` VALUES ('372', '秋季班八年级英语第12讲：8AU5同步+语法综合+话题阅读（文学与艺术liter', '3', '8', '1', 'standard_document/03101349093246688.doc', 'standard_document/03101349097671666.doc', 'bpsn2001', '2020-03-10 13:49:09');
INSERT INTO `standard_document` VALUES ('373', '秋季班八年级英语第13讲：8A U6同步+一般将来时+语法综合+阅读（大众传媒）', '3', '8', '1', 'standard_document/03101350234286569.doc', 'standard_document/03101350232927651.doc', 'bpsn2001', '2020-03-10 13:50:23');
INSERT INTO `standard_document` VALUES ('374', '春季班九年级数学第13讲：创新题型', '2', '9', '2', 'standard_document/03101412348408962.doc', 'standard_document/03101412345430312.doc', 'dsix1908', '2020-03-10 14:12:34');
INSERT INTO `standard_document` VALUES ('375', '春季班九年级数学第14讲：锐角三角比及解直角三角形', '2', '9', '2', 'standard_document/03101414191676340.doc', 'standard_document/03101414197565772.doc', 'dsix1908', '2020-03-10 14:14:19');
INSERT INTO `standard_document` VALUES ('378', '秋季班一年级英语第十一讲：M3U2 in the fruit shop', '3', '1', '1', 'standard_document/03102142312382063.doc', 'standard_document/03102142317145544.doc', 'neck1908', '2020-03-10 21:42:31');
INSERT INTO `standard_document` VALUES ('379', '秋季班一年级英语第十二讲：M3U3 in the restaurant', '3', '1', '1', 'standard_document/03102142597634089.doc', 'standard_document/03102142599340015.doc', 'neck1908', '2020-03-10 21:42:59');
INSERT INTO `standard_document` VALUES ('380', '秋季班高一年级数学第十三讲：函数的概念', '2', '10', '1', 'standard_document/03102231212807084.doc', 'standard_document/03102231218181671.doc', 'rbyj1908', '2020-03-10 22:31:21');
INSERT INTO `standard_document` VALUES ('381', '秋季班高一年级数学第十四讲：函数的定义域及值域', '2', '10', '1', 'standard_document/03102242222254040.doc', 'standard_document/03102242222616573.doc', 'rbyj1908', '2020-03-10 22:42:22');
INSERT INTO `standard_document` VALUES ('382', '秋季班五年级数学第15讲：三角形和梯形的面积', '2', '5', '1', 'standard_document/03110936167857649.doc', 'standard_document/03110936163063851.doc', 'jkgn1910', '2020-03-11 09:36:16');
INSERT INTO `standard_document` VALUES ('383', '秋季班五年级数学第16讲：组合图形的面积', '2', '5', '1', 'standard_document/03110938137212272.doc', 'standard_document/03110938131906834.doc', 'jkgn1910', '2020-03-11 09:38:13');
INSERT INTO `standard_document` VALUES ('384', '秋季班五年级数学第13讲：列方程解应用题（一）', '2', '5', '1', 'standard_document/03110939152575493.doc', 'standard_document/03110939156742067.doc', 'jkgn1910', '2020-03-11 09:39:15');
INSERT INTO `standard_document` VALUES ('385', '春季班九年级数学第15讲代数计算及通过代数计算的说理问题', '2', '9', '2', 'standard_document/03111614549555048.doc', 'standard_document/03111614544902082.doc', 'dsix1908', '2020-03-11 16:14:54');
INSERT INTO `standard_document` VALUES ('386', '春季班九年级数学第16讲：几何证明及通过几何证明的说理问题', '2', '9', '2', 'standard_document/03111616459124700.doc', 'standard_document/03111616453812622.doc', 'dsix1908', '2020-03-11 16:16:45');
INSERT INTO `standard_document` VALUES ('387', '春季班三年级数学第1讲 ：带小括号的四则运算&面积的估测', '2', '3', '2', 'standard_document/03111707327722837.doc', 'standard_document/03111707326659688.doc', 'favs1911', '2020-03-11 17:07:32');
INSERT INTO `standard_document` VALUES ('388', '春季班三年级数学第2讲 ：组合图形的面积(1)', '2', '3', '2', 'standard_document/03111708239410685.doc', 'standard_document/03111708234155318.doc', 'favs1911', '2020-03-11 17:08:23');
INSERT INTO `standard_document` VALUES ('389', '秋季班一年级英语第十三讲：（Test for Module 3）', '3', '1', '1', 'standard_document/03111925006377811.doc', 'standard_document/03111925001972308.doc', 'neck1908', '2020-03-11 19:25:00');
INSERT INTO `standard_document` VALUES ('390', '秋季班一年级英语第十四讲：M4U1 on the farm', '3', '1', '1', 'standard_document/03111925453046087.doc', 'standard_document/03111925454881067.doc', 'neck1908', '2020-03-11 19:25:45');
INSERT INTO `standard_document` VALUES ('391', '秋季班高一年级数学第十伍讲：函数的奇偶性', '2', '10', '1', 'standard_document/03112229264304746.doc', 'standard_document/03112229269275366.doc', 'rbyj1908', '2020-03-11 22:29:26');
INSERT INTO `standard_document` VALUES ('392', '秋季班八年级英语第14讲：8AU6强化+反意疑问句+阅读(旅行）+作文：旅行计划', '3', '8', '1', 'standard_document/03112240247237327.doc', 'standard_document/03112240248855482.doc', 'bpsn2001', '2020-03-11 22:40:24');
INSERT INTO `standard_document` VALUES ('393', '秋季班八年级英语第15讲:8AU7同步+方位介词+时间介词+语法综合+阅读（趣味', '3', '8', '1', 'standard_document/03112243096605012.doc', 'standard_document/03112243094084440.doc', 'bpsn2001', '2020-03-11 22:43:09');
INSERT INTO `standard_document` VALUES ('394', '秋季班八年级英语第16讲：8A U7强化+感叹句+综合练习+阅读（国家与城市）+', '3', '8', '1', 'standard_document/03112324542455332.doc', 'standard_document/03112324541737616.doc', 'bpsn2001', '2020-03-11 23:24:54');
INSERT INTO `standard_document` VALUES ('395', '秋季班八年级英语第17讲：U5-U7综合+词转&句转+语法综合练习+阅读（人与自', '3', '8', '1', 'standard_document/03112326361911163.doc', 'standard_document/03112326367035696.doc', 'bpsn2001', '2020-03-11 23:26:36');
INSERT INTO `standard_document` VALUES ('396', '秋季班一年级英语第十五讲：M4U2 in the zoo', '3', '1', '1', 'standard_document/03121430559115236.doc', 'standard_document/03121430557278069.doc', 'neck1908', '2020-03-12 14:30:55');
INSERT INTO `standard_document` VALUES ('397', '秋季班一年级英语第十六讲：M4U3in the park', '3', '1', '1', 'standard_document/03121431499802777.doc', 'standard_document/03121431493469056.doc', 'neck1908', '2020-03-12 14:31:49');
INSERT INTO `standard_document` VALUES ('399', '春季班九年级数学第18讲：平行四边形存在性问题', '2', '9', '2', 'standard_document/03121447489414662.doc', 'standard_document/03121447486154061.doc', 'dsix1908', '2020-03-12 14:47:48');
INSERT INTO `standard_document` VALUES ('400', '春季班九年级数学第19讲：与圆有关的存在性问题', '2', '9', '2', 'standard_document/03121449558857442.doc', 'standard_document/03121449552242606.doc', 'dsix1908', '2020-03-12 14:49:55');
INSERT INTO `standard_document` VALUES ('401', '春季班九年级数学第20讲：期末复习', '2', '9', '2', 'standard_document/03121450564449795.doc', 'standard_document/03121450568515252.doc', 'dsix1908', '2020-03-12 14:50:56');
INSERT INTO `standard_document` VALUES ('402', '春季班九年级数学第17讲：相似三角形的存在性问题', '2', '9', '2', 'standard_document/03121453491731962.doc', 'standard_document/03121453491339877.doc', 'dsix1908', '2020-03-12 14:53:49');
INSERT INTO `standard_document` VALUES ('403', '秋季班五年级数学第17讲：小数的四则混合运算', '2', '5', '1', 'standard_document/03121522554637315.doc', 'standard_document/03121522555314722.doc', 'jkgn1910', '2020-03-12 15:22:55');
INSERT INTO `standard_document` VALUES ('404', '秋季班五年级数学第18讲：列方程解应用题（二）', '2', '5', '1', 'standard_document/03121523252606904.doc', 'standard_document/03121523252645332.doc', 'jkgn1910', '2020-03-12 15:23:25');
INSERT INTO `standard_document` VALUES ('405', '春季班三年级数学第3讲 ：速度、时间、路程', '2', '3', '2', 'standard_document/03121533249719617.doc', 'standard_document/03121533244885077.doc', 'favs1911', '2020-03-12 15:33:24');
INSERT INTO `standard_document` VALUES ('406', '春季班三年级数学第4讲 ：整十数与两位数相乘', '2', '3', '2', 'standard_document/03121535544773028.doc', 'standard_document/03121535548725985.doc', 'favs1911', '2020-03-12 15:35:54');
INSERT INTO `standard_document` VALUES ('407', '春季班高一年级数学第一讲：弧度制及角的定义', '2', '10', '2', 'standard_document/03122306133710701.doc', 'standard_document/03122306132925454.doc', 'rbyj1908', '2020-03-12 23:06:13');
INSERT INTO `standard_document` VALUES ('408', '春季班高一年级数学第二讲：三角比的定义', '2', '10', '2', 'standard_document/03122307305104641.doc', 'standard_document/03122307308815662.doc', 'rbyj1908', '2020-03-12 23:07:30');
INSERT INTO `standard_document` VALUES ('409', '秋季班五年级数学第19讲：期末复习（一）', '2', '5', '1', 'standard_document/03130833399919708.doc', 'standard_document/03130833395535289.doc', 'jkgn1910', '2020-03-13 08:33:39');
INSERT INTO `standard_document` VALUES ('410', '秋季班五年级数学第20讲：期末复习（二）', '2', '5', '1', 'standard_document/03130845061185020.doc', 'standard_document/03130845061229100.doc', 'jkgn1910', '2020-03-13 08:45:06');
INSERT INTO `standard_document` VALUES ('411', '秋季班一年级英语第十七讲：（Test for Module 4）', '3', '1', '1', 'standard_document/03131432218035886.doc', 'standard_document/03131432215489826.doc', 'neck1908', '2020-03-13 14:32:21');
INSERT INTO `standard_document` VALUES ('412', '秋季班一年级英语第十八讲：（专项测试—情景交际）', '3', '1', '1', 'standard_document/03131433146428865.doc', 'standard_document/03131433148845812.doc', 'neck1908', '2020-03-13 14:33:14');
INSERT INTO `standard_document` VALUES ('413', '秋季班一年级英语第十九讲：（专项测试—句型练习）', '3', '1', '1', 'standard_document/03141139456843824.doc', 'standard_document/03141139459750023.doc', 'neck1908', '2020-03-14 11:39:45');
INSERT INTO `standard_document` VALUES ('414', '秋季班一年级英语第二十讲：（期末测试）', '3', '1', '1', 'standard_document/03141140386200974.doc', 'standard_document/03141140389869618.doc', 'neck1908', '2020-03-14 11:40:38');
INSERT INTO `standard_document` VALUES ('415', '春季班三年级数学第5讲 ：两位数与两位数相乘', '2', '3', '2', 'standard_document/03161929191570915.doc', 'standard_document/03161929193139310.doc', 'favs1911', '2020-03-16 19:29:19');
INSERT INTO `standard_document` VALUES ('416', '春季班三年级数学第6讲 ：两位数与三位数相乘', '2', '3', '2', 'standard_document/03161929551674685.doc', 'standard_document/03161929553578604.doc', 'favs1911', '2020-03-16 19:29:55');
INSERT INTO `standard_document` VALUES ('421', '春季班三年级数学第7讲 ：两位数除两、三位数', '2', '3', '2', 'standard_document/03171032313865220.doc', 'standard_document/03171032311885135.doc', 'favs1911', '2020-03-17 10:32:31');
INSERT INTO `standard_document` VALUES ('422', '春季班三年级数学第8讲 ：两位数除多位数', '2', '3', '2', 'standard_document/03171033077773724.doc', 'standard_document/03171033079892666.doc', 'favs1911', '2020-03-17 10:33:07');
INSERT INTO `standard_document` VALUES ('423', '秋季班三年级英语上册第1讲：M1U1 How are you', '3', '3', '1', 'standard_document/03171458487259997.doc', 'standard_document/03171458485928803.doc', '', '2020-03-17 14:58:48');
INSERT INTO `standard_document` VALUES ('424', '秋季班三年级英语上册第1讲：M1U1 How are you', '3', '3', '1', 'standard_document/03171526402035221.doc', 'standard_document/03171526404581418.doc', 'oqrj1908', '2020-03-17 15:26:40');
INSERT INTO `standard_document` VALUES ('425', '秋季班三年级英语上册第3讲：M1U3 How old are you', '3', '3', '1', 'standard_document/03171528475523880.doc', 'standard_document/03171528473141697.doc', 'oqrj1908', '2020-03-17 15:28:47');
INSERT INTO `standard_document` VALUES ('426', '秋季班三年级英语上册第4讲：M2U1 My friends', '3', '3', '1', 'standard_document/03171532433601738.doc', 'standard_document/03171532438106208.doc', 'oqrj1908', '2020-03-17 15:32:43');
INSERT INTO `standard_document` VALUES ('427', '秋季班三年级数学第1讲：回顾与提升', '2', '3', '1', 'standard_document/03171644205186027.doc', 'standard_document/03171644202927301.doc', 'dsix1908', '2020-03-17 16:44:20');
INSERT INTO `standard_document` VALUES ('428', '秋季班数三年级数学第2讲：乘除与巧算', '2', '3', '1', 'standard_document/03171645447128422.doc', 'standard_document/03171645442800042.doc', 'dsix1908', '2020-03-17 16:45:44');
INSERT INTO `standard_document` VALUES ('429', '春季班一年级英语第一讲：M 1U1 look and see', '3', '1', '2', 'standard_document/03171724576399019.doc', 'standard_document/03171724577386966.doc', 'neck1908', '2020-03-17 17:24:57');
INSERT INTO `standard_document` VALUES ('430', '春季班一年级英语第二讲：M1U2Listen and hear', '3', '1', '2', 'standard_document/03171725484982388.doc', 'standard_document/03171725489791603.doc', 'neck1908', '2020-03-17 17:25:48');
INSERT INTO `standard_document` VALUES ('433', '秋季班八年级英语第18讲：期末复习一：首字母填空+作文', '3', '8', '1', 'standard_document/03172033182036394.doc', 'standard_document/03172033189006246.doc', 'bpsn2001', '2020-03-17 20:33:18');
INSERT INTO `standard_document` VALUES ('434', '秋季班八年级英语第19讲：期末复习二：语法易错题+语法词汇句型综合+阅读综合2', '3', '8', '1', 'standard_document/03172034317663490.doc', 'standard_document/03172034311580414.doc', 'bpsn2001', '2020-03-17 20:34:31');
INSERT INTO `standard_document` VALUES ('435', '秋季班八年级英语第20讲：期末复习三：查漏补缺（词汇）+期末模拟试卷+作文讲评3', '3', '8', '1', 'standard_document/03172037032481478.doc', 'standard_document/03172037031332163.doc', 'bpsn2001', '2020-03-17 20:37:03');
INSERT INTO `standard_document` VALUES ('436', '春季班八年级英语第1讲：8BU1同步 +时态（现在&过去进行） +阅读A', '3', '8', '2', 'standard_document/03172047042019750.doc', 'standard_document/03172047044746755.doc', 'bpsn2001', '2020-03-17 20:47:04');
INSERT INTO `standard_document` VALUES ('437', '春季班九年级英语第2讲：代词专项+综合练习', '3', '9', '2', 'standard_document/03172049336592764.doc', 'standard_document/03172049337135828.doc', 'bpsn2001', '2020-03-17 20:49:33');
INSERT INTO `standard_document` VALUES ('438', '春季班八年级英语第2讲：U1强化+阅读A+写作', '3', '8', '2', 'standard_document/03172115043817027.doc', 'standard_document/03172115046798016.doc', 'bpsn2001', '2020-03-17 21:15:04');
INSERT INTO `standard_document` VALUES ('439', '春季班九年级英语第1讲：名词专项+词性转换+完型填空专练', '3', '9', '2', 'standard_document/03172119496105044.doc', 'standard_document/03172119492730776.doc', 'bpsn2001', '2020-03-17 21:19:49');
INSERT INTO `standard_document` VALUES ('440', '春季班高一年级数学第三讲：诱导公式', '2', '10', '2', 'standard_document/03180001064236813.doc', 'standard_document/03180001067979961.doc', 'rbyj1908', '2020-03-18 00:01:06');
INSERT INTO `standard_document` VALUES ('441', '春季班高一年级数学第四讲：两角和差公式', '2', '10', '2', 'standard_document/03180004106043508.doc', 'standard_document/03180004103078525.doc', 'rbyj1908', '2020-03-18 00:04:10');
INSERT INTO `standard_document` VALUES ('447', '春季班高一年级数学第伍讲：二倍角公式', '2', '10', '2', 'standard_document/03180006388884501.doc', 'standard_document/03180006381647755.doc', 'rbyj1908', '2020-03-18 00:06:38');
INSERT INTO `standard_document` VALUES ('454', '春季班高一年级数学第六讲：正弦定理余弦定理', '2', '10', '2', 'standard_document/03180007465852356.doc', 'standard_document/03180007467234042.doc', 'rbyj1908', '2020-03-18 00:07:46');
INSERT INTO `standard_document` VALUES ('455', '春季班三年级数学第9讲 ：条形统计图', '2', '3', '2', 'standard_document/03180856273486560.doc', 'standard_document/03180856273800704.doc', 'favs1911', '2020-03-18 08:56:27');
INSERT INTO `standard_document` VALUES ('456', '春季班三年级数学第10讲 ：期中复习', '2', '3', '2', 'standard_document/03180857084521800.doc', 'standard_document/03180857084945361.doc', 'favs1911', '2020-03-18 08:57:08');
INSERT INTO `standard_document` VALUES ('457', '秋季班三年级数学第3讲：一位数与整十数，整百数相乘', '2', '3', '1', 'standard_document/03181213551213149.doc', 'standard_document/03181213557102936.doc', 'dsix1908', '2020-03-18 12:13:55');
INSERT INTO `standard_document` VALUES ('458', '秋季班三年级数学第4讲：用一位数除', '2', '3', '1', 'standard_document/03181215146281440.doc', 'standard_document/03181215148406850.doc', 'dsix1908', '2020-03-18 12:15:14');
INSERT INTO `standard_document` VALUES ('459', '春季班一年级英语第三讲：M1U3 Taste and smell', '3', '1', '2', 'standard_document/03181957399297697.doc', 'standard_document/03181957394935559.doc', 'neck1908', '2020-03-18 19:57:39');
INSERT INTO `standard_document` VALUES ('463', '春季班八年级英语第3讲：8BU2同步+阅读A+拓展阅读U1', '3', '8', '2', 'standard_document/03190418291613821.doc', 'standard_document/03190418295683958.doc', 'bpsn2001', '2020-03-19 04:18:29');
INSERT INTO `standard_document` VALUES ('464', '春季班八年级英语第4讲：8BU2同步+阅读B+综合阅读+作文', '3', '8', '2', 'standard_document/03190420269370408.doc', 'standard_document/03190420262210016.doc', 'bpsn2001', '2020-03-19 04:20:26');
INSERT INTO `standard_document` VALUES ('468', '春季班一年级英语第四讲：（Test for Module 1）', '3', '1', '2', 'standard_document/03191206565049031.doc', 'standard_document/03191206562789124.doc', 'neck1908', '2020-03-19 12:06:56');
INSERT INTO `standard_document` VALUES ('469', '春季班一年级英语第五讲：M2U1 toys i like', '3', '1', '2', 'standard_document/03191216478247446.doc', 'standard_document/03191216477656085.doc', 'neck1908', '2020-03-19 12:16:47');
INSERT INTO `standard_document` VALUES ('470', '春季班一年级英语第六讲：M2U2 Food I like', '3', '1', '2', 'standard_document/03191217163458412.doc', 'standard_document/03191217166766298.doc', 'neck1908', '2020-03-19 12:17:16');
INSERT INTO `standard_document` VALUES ('471', '春季班三年级数学第11讲 ：几分之一', '2', '3', '2', 'standard_document/03191230295062559.doc', 'standard_document/03191230298997288.doc', 'favs1911', '2020-03-19 12:30:29');
INSERT INTO `standard_document` VALUES ('472', '春季班三年级数学第12讲 ：几分之几', '2', '3', '2', 'standard_document/03191231541658537.doc', 'standard_document/03191231546406702.doc', 'favs1911', '2020-03-19 12:31:54');
INSERT INTO `standard_document` VALUES ('473', '秋季班三年级数学第5讲：乘法的综合应用', '2', '3', '1', 'standard_document/03191623066278119.doc', 'standard_document/03191623066069843.doc', 'dsix1908', '2020-03-19 16:23:06');
INSERT INTO `standard_document` VALUES ('474', '秋季班三年级数学第6讲：时间的认识', '2', '3', '1', 'standard_document/03191628339051268.doc', 'standard_document/03191628339939477.doc', 'dsix1908', '2020-03-19 16:28:33');
INSERT INTO `standard_document` VALUES ('475', '春季班五年级数学第1讲：小数运算与方程', '2', '5', '2', 'standard_document/03191904564102833.doc', 'standard_document/03191904565832412.doc', 'jkgn1910', '2020-03-19 19:04:56');
INSERT INTO `standard_document` VALUES ('476', '春季班五年级数学第2讲：简便计算 ', '2', '5', '2', 'standard_document/03191905343048660.doc', 'standard_document/03191905347119413.doc', 'jkgn1910', '2020-03-19 19:05:34');
INSERT INTO `standard_document` VALUES ('477', '春季班五年级数学第3讲：正数和负数的认识 ', '2', '5', '2', 'standard_document/03191906045320036.doc', 'standard_document/03191906048565382.doc', 'jkgn1910', '2020-03-19 19:06:04');
INSERT INTO `standard_document` VALUES ('478', '春季班五年级数学第4讲：应用题中的数量关系', '2', '5', '2', 'standard_document/03191906319859263.doc', 'standard_document/03191906318415963.doc', 'jkgn1910', '2020-03-19 19:06:31');
INSERT INTO `standard_document` VALUES ('479', '春季班五年级数学第5讲：列方程解应用题（一）', '2', '5', '2', 'standard_document/03191907047730814.doc', 'standard_document/03191907041596507.doc', 'jkgn1910', '2020-03-19 19:07:04');
INSERT INTO `standard_document` VALUES ('480', '春季班五年级数学第6讲：列方程解应用题（二）', '2', '5', '2', 'standard_document/03191907519294948.doc', 'standard_document/03191907518244439.doc', 'jkgn1910', '2020-03-19 19:07:51');
INSERT INTO `standard_document` VALUES ('481', '春季班五年级数学第7讲：列方程解应用题（三）', '2', '5', '2', 'standard_document/03191908256772242.doc', 'standard_document/03191908259863773.doc', 'jkgn1910', '2020-03-19 19:08:25');
INSERT INTO `standard_document` VALUES ('482', '春季班五年级数学第8讲：长方体与正方体的体积', '2', '5', '2', 'standard_document/03191909136861169.doc', 'standard_document/03191909131011343.doc', 'jkgn1910', '2020-03-19 19:09:13');
INSERT INTO `standard_document` VALUES ('483', '春季班九年级英语第3讲：数词与冠词专项+综合', '3', '9', '2', 'standard_document/03192052011356831.doc', 'standard_document/03192052012753361.doc', 'bpsn2001', '2020-03-19 20:52:01');
INSERT INTO `standard_document` VALUES ('484', '春季班八年级英语第5讲：8BU3课本知识点讲解 + 阅读B篇 ', '3', '8', '2', 'standard_document/03192121201845023.doc', 'standard_document/03192121204120607.doc', 'bpsn2001', '2020-03-19 21:21:20');
INSERT INTO `standard_document` VALUES ('485', '春季班五年级数学第9讲：期中备考复习（一）', '2', '5', '2', 'standard_document/03200751209062543.doc', 'standard_document/03200751209868980.doc', 'jkgn1910', '2020-03-20 07:51:20');
INSERT INTO `standard_document` VALUES ('486', '春季班五年级数学第10讲：期中备考复习（二）', '2', '5', '2', 'standard_document/03200751496486038.doc', 'standard_document/03200751491330023.doc', 'jkgn1910', '2020-03-20 07:51:49');
INSERT INTO `standard_document` VALUES ('487', '春季班三年级数学第13讲 ：长方形、正方形周长', '2', '3', '2', 'standard_document/03201026056220291.doc', 'standard_document/03201026051700713.doc', 'favs1911', '2020-03-20 10:26:05');
INSERT INTO `standard_document` VALUES ('488', '春季班三年级数学第14讲 ：乘与除（计算器）', '2', '3', '2', 'standard_document/03201027143713058.doc', 'standard_document/03201027146617877.doc', 'favs1911', '2020-03-20 10:27:14');
INSERT INTO `standard_document` VALUES ('489', '秋季班三年级数学第7讲：用一位数除', '2', '3', '1', 'standard_document/03201227077966234.doc', 'standard_document/03201227077586097.doc', 'dsix1908', '2020-03-20 12:27:07');
INSERT INTO `standard_document` VALUES ('490', '秋季班三年级数学第8讲：用一位数除的应用', '2', '3', '1', 'standard_document/03201228312141401.doc', 'standard_document/03201228311632858.doc', 'dsix1908', '2020-03-20 12:28:31');
INSERT INTO `standard_document` VALUES ('491', '春季班一年级英语第七讲：M2U3 Drinks I like', '3', '1', '2', 'standard_document/03201327191059155.doc', 'standard_document/03201327193255806.doc', 'neck1908', '2020-03-20 13:27:19');
INSERT INTO `standard_document` VALUES ('492', '春季班一年级英语第八讲：（Test for Module 2） ', '3', '1', '2', 'standard_document/03201328114189511.doc', 'standard_document/03201328117738752.doc', 'neck1908', '2020-03-20 13:28:11');
INSERT INTO `standard_document` VALUES ('493', '秋季班三年级英语上册第2讲：M1U2 What is your name', '3', '3', '1', 'standard_document/03201622598120679.doc', 'standard_document/03201622594643996.doc', 'oqrj1908', '2020-03-20 16:22:59');
INSERT INTO `standard_document` VALUES ('494', '秋季班三年级英语上册第5讲：M2U2 My family', '3', '3', '1', 'standard_document/03201640036380249.doc', 'standard_document/03201640034663222.doc', 'oqrj1908', '2020-03-20 16:40:03');
INSERT INTO `standard_document` VALUES ('495', '春季班一年级英语第九讲：M3U1 Seasons', '3', '1', '2', 'standard_document/03201711359095798.doc', 'standard_document/03201711353038384.doc', 'neck1908', '2020-03-20 17:11:35');
INSERT INTO `standard_document` VALUES ('496', '春季班一年级英语第十讲：期中测试', '3', '1', '2', 'standard_document/03201713124334441.doc', 'standard_document/03201713125945667.doc', 'neck1908', '2020-03-20 17:13:12');
INSERT INTO `standard_document` VALUES ('497', '春季班一年级英语第十一讲：M3U2 Weather', '3', '1', '2', 'standard_document/03201715246805220.doc', 'standard_document/03201715247287501.doc', 'neck1908', '2020-03-20 17:15:24');
INSERT INTO `standard_document` VALUES ('498', '春季班一年级英语第十二讲：M3U3 Clothes', '3', '1', '2', 'standard_document/03201715599629328.doc', 'standard_document/03201715592851740.doc', 'neck1908', '2020-03-20 17:15:59');
INSERT INTO `standard_document` VALUES ('499', '春季班一年级英语第十三讲：M4U1 Activities ', '3', '1', '2', 'standard_document/03201716322685238.doc', 'standard_document/03201716324009508.doc', 'neck1908', '2020-03-20 17:16:32');
INSERT INTO `standard_document` VALUES ('500', '春季班一年级英语第十四讲：M4U2 New Year s Day', '3', '1', '2', 'standard_document/03201718269813898.doc', 'standard_document/03201718265190208.doc', 'neck1908', '2020-03-20 17:18:26');
INSERT INTO `standard_document` VALUES ('501', '春季班一年级英语第十五讲：M4U3 Story time', '3', '1', '2', 'standard_document/03201719147384931.doc', 'standard_document/03201719144263586.doc', 'neck1908', '2020-03-20 17:19:14');
INSERT INTO `standard_document` VALUES ('502', '春季班一年级英语第十六讲：专项复习-单词、词组', '3', '1', '2', 'standard_document/03201719443274083.doc', 'standard_document/03201719441203882.doc', 'neck1908', '2020-03-20 17:19:44');
INSERT INTO `standard_document` VALUES ('503', '春季班一年级英语第十七讲：期末复习', '3', '1', '2', 'standard_document/03201720277958781.doc', 'standard_document/03201720277144039.doc', 'neck1908', '2020-03-20 17:20:27');
INSERT INTO `standard_document` VALUES ('504', '春季班一年级英语第十八讲：期末复习 一', '3', '1', '2', 'standard_document/03201721187746247.doc', 'standard_document/03201721181559372.doc', 'neck1908', '2020-03-20 17:21:18');
INSERT INTO `standard_document` VALUES ('505', '春季班一年级英语第十九讲：期末复习 二 ', '3', '1', '2', 'standard_document/03201722109784614.doc', 'standard_document/03201722103709633.doc', 'neck1908', '2020-03-20 17:22:10');
INSERT INTO `standard_document` VALUES ('506', '春季班一年级英语第二十讲：期末测试', '3', '1', '2', 'standard_document/03201722557039971.doc', 'standard_document/03201722559908506.doc', 'neck1908', '2020-03-20 17:22:55');
INSERT INTO `standard_document` VALUES ('507', '秋季班三年级英语上册第6讲：M2U3 About me', '3', '3', '1', 'standard_document/03201923458223205.doc', 'standard_document/03201923451311038.doc', 'oqrj1908', '2020-03-20 19:23:45');
INSERT INTO `standard_document` VALUES ('508', '秋季班三年级英语上册第7讲：M3U1 My school', '3', '3', '1', 'standard_document/03201925036575542.doc', 'standard_document/03201925037855387.doc', 'oqrj1908', '2020-03-20 19:25:03');
INSERT INTO `standard_document` VALUES ('509', '秋季班三年级英语上册第8讲：M3U2 Shopping', '3', '3', '1', 'standard_document/03201929156085401.doc', 'standard_document/03201929156416305.doc', 'oqrj1908', '2020-03-20 19:29:15');
INSERT INTO `standard_document` VALUES ('510', '秋季班三年级英语上册第9讲：M3U3 In the park', '3', '3', '1', 'standard_document/03201950253218980.doc', 'standard_document/03201950257292745.doc', 'oqrj1908', '2020-03-20 19:50:25');
INSERT INTO `standard_document` VALUES ('511', '春季班八年级英语第6讲：8BU3基础强化 + 阅读C篇 + 作文', '3', '8', '2', 'standard_document/03212302338547420.doc', 'standard_document/03212302336172857.doc', 'bpsn2001', '2020-03-21 23:02:33');
INSERT INTO `standard_document` VALUES ('512', '春季班八年级英语第7讲：8BU4同步+阅读C', '3', '8', '2', 'standard_document/03212306379280535.doc', 'standard_document/03212306372049921.doc', 'bpsn2001', '2020-03-21 23:06:37');
INSERT INTO `standard_document` VALUES ('519', '秋季班三年级数学第9讲：除法的综合应用', '2', '3', '1', 'standard_document/03231221574771897.doc', 'standard_document/03231221578811049.doc', 'dsix1908', '2020-03-23 12:21:57');
INSERT INTO `standard_document` VALUES ('520', '秋季班三年级数学第10讲：期中复习（一）', '2', '3', '1', 'standard_document/03231222592447927.doc', 'standard_document/03231222598738306.doc', 'dsix1908', '2020-03-23 12:22:59');
INSERT INTO `standard_document` VALUES ('521', '春季班五年级数学第11讲：组合体的体积及表面积', '2', '5', '2', 'standard_document/03231955046189823.doc', 'standard_document/03231955047613198.doc', 'jkgn1910', '2020-03-23 19:55:04');
INSERT INTO `standard_document` VALUES ('522', '春季班五年级数学第12讲：表面积的变化.', '2', '5', '2', 'standard_document/03231955372776165.doc', 'standard_document/03231955378066582.doc', 'jkgn1910', '2020-03-23 19:55:37');
INSERT INTO `standard_document` VALUES ('523', '春季班五年级数学第13讲：体积与容积', '2', '5', '2', 'standard_document/03241307342289441.doc', 'standard_document/03241307345219301.doc', 'jkgn1910', '2020-03-24 13:07:34');
INSERT INTO `standard_document` VALUES ('524', '春季班五年级数学第14讲：单元复习', '2', '5', '2', 'standard_document/03241307543512327.doc', 'standard_document/03241307541609367.doc', 'jkgn1910', '2020-03-24 13:07:54');
INSERT INTO `standard_document` VALUES ('526', '秋季班三年级数学第12讲：长度单位的认识', '2', '3', '1', 'standard_document/03241347028680095.doc', 'standard_document/03241347025675206.doc', 'dsix1908', '2020-03-24 13:47:02');
INSERT INTO `standard_document` VALUES ('527', '秋季班三年级数学第11讲：期中复习（二）', '2', '3', '1', 'standard_document/03241421261501498.doc', 'standard_document/03241421269737961.doc', 'dsix1908', '2020-03-24 14:21:26');
INSERT INTO `standard_document` VALUES ('528', '春季班八年级英语：第8讲8BU4 同步+阅读 D+综合阅读', '3', '8', '2', 'standard_document/03241508033688478.doc', 'standard_document/03241508035562961.doc', 'bpsn2001', '2020-03-24 15:08:03');
INSERT INTO `standard_document` VALUES ('529', '春季班高一年级数学第七讲：正弦定理余弦定理', '2', '10', '2', 'standard_document/03241523268453249.doc', 'standard_document/03241523263631392.doc', 'rbyj1908', '2020-03-24 15:23:26');
INSERT INTO `standard_document` VALUES ('530', '春季班高一年级数学第八讲：正弦函数余弦函数', '2', '10', '2', 'standard_document/03241525114576459.doc', 'standard_document/03241525111076859.doc', 'rbyj1908', '2020-03-24 15:25:11');
INSERT INTO `standard_document` VALUES ('531', '秋季班二年级英语第一讲：M1U1 Hello', '3', '2', '1', 'standard_document/03241554089124393.doc', 'standard_document/03241554088642922.doc', '', '2020-03-24 15:54:08');
INSERT INTO `standard_document` VALUES ('532', '秋季班二年级英语第一讲：M1U1 Hello', '3', '2', '1', 'standard_document/03241555103777664.doc', 'standard_document/03241555109735839.doc', 'neck1908', '2020-03-24 15:55:10');
INSERT INTO `standard_document` VALUES ('533', '秋季班二年级英语第二讲：M1U2  I am Danny', '3', '2', '1', 'standard_document/03241555425045175.doc', 'standard_document/03241555424043683.doc', 'neck1908', '2020-03-24 15:55:42');
INSERT INTO `standard_document` VALUES ('534', '秋季班三年级英语上册第10讲：M4U1 Insects', '3', '3', '1', 'standard_document/03241556054409544.doc', 'standard_document/03241556056461898.doc', 'oqrj1908', '2020-03-24 15:56:05');
INSERT INTO `standard_document` VALUES ('535', '秋季班二年级英语第三讲：M1U3 A new classmates', '3', '2', '1', 'standard_document/03241557069622257.doc', 'standard_document/03241557064886349.doc', 'neck1908', '2020-03-24 15:57:06');
INSERT INTO `standard_document` VALUES ('536', '秋季班三年级英语上册期中测试', '3', '3', '1', 'standard_document/03241557183166483.docx', 'standard_document/03241557181076778.docx', 'oqrj1908', '2020-03-24 15:57:18');
INSERT INTO `standard_document` VALUES ('537', '秋季班二年级英语第四讲：Module 1复习', '3', '2', '1', 'standard_document/03241557302184716.doc', 'standard_document/03241557302660644.doc', 'neck1908', '2020-03-24 15:57:30');
INSERT INTO `standard_document` VALUES ('538', '秋季班二年级英语第五讲：M2U1 I can swim', '3', '2', '1', 'standard_document/03241558104765759.doc', 'standard_document/03241558108303529.doc', 'neck1908', '2020-03-24 15:58:10');
INSERT INTO `standard_document` VALUES ('539', '秋季班三年级英语上册第11讲：M4U2 On the farm', '3', '3', '1', 'standard_document/03241558276371496.doc', 'standard_document/03241558272513545.doc', 'oqrj1908', '2020-03-24 15:58:27');
INSERT INTO `standard_document` VALUES ('540', '秋季班二年级英语第六讲：M2U2 That is my family ', '3', '2', '1', 'standard_document/03241558568409728.doc', 'standard_document/03241558561497055.doc', 'neck1908', '2020-03-24 15:58:56');
INSERT INTO `standard_document` VALUES ('541', '秋季班三年级英语上册第12讲：M4U3 Plants（答案）', '3', '3', '1', 'standard_document/03241559339955938.doc', 'standard_document/03241559338138954.doc', 'oqrj1908', '2020-03-24 15:59:33');
INSERT INTO `standard_document` VALUES ('542', '秋季班三年级英语上册第13讲：题型专项练习-词汇', '3', '3', '1', 'standard_document/03241600549504337.doc', 'standard_document/03241600541365843.doc', 'oqrj1908', '2020-03-24 16:00:54');
INSERT INTO `standard_document` VALUES ('543', '秋季班三年级英语上册第14讲：题型专项练习-词组', '3', '3', '1', 'standard_document/03241602307724976.doc', 'standard_document/03241602302501003.doc', 'oqrj1908', '2020-03-24 16:02:30');
INSERT INTO `standard_document` VALUES ('544', '秋季班三年级英语上册第15讲：复习U2-U3', '3', '3', '1', 'standard_document/03241603302066748.doc', 'standard_document/03241603307694686.doc', 'oqrj1908', '2020-03-24 16:03:30');
INSERT INTO `standard_document` VALUES ('545', '秋季班高二年级数学第一讲：向量的概念及运算', '2', '11', '1', 'standard_document/03241611285621734.doc', 'standard_document/03241611287946759.doc', 'rbyj1908', '2020-03-24 16:11:28');
INSERT INTO `standard_document` VALUES ('549', '秋季班高二年级数学第二讲：向量的坐标运算及定比分点', '2', '11', '1', 'standard_document/03241632447591492.doc', 'standard_document/03241632444300924.doc', 'rbyj1908', '2020-03-24 16:32:44');
INSERT INTO `standard_document` VALUES ('550', '秋季班高二年级数学第三讲：向量的数量积', '2', '11', '1', 'standard_document/03241636088518020.doc', 'standard_document/03241636087731591.doc', 'rbyj1908', '2020-03-24 16:36:08');
INSERT INTO `standard_document` VALUES ('552', '秋季班高二年级数学第四讲：向量的应用', '2', '11', '1', 'standard_document/03241639216595373.doc', 'standard_document/03241639218317622.doc', 'rbyj1908', '2020-03-24 16:39:21');
INSERT INTO `standard_document` VALUES ('553', '秋季班高二年级数学第五讲：矩阵', '2', '11', '1', 'standard_document/03241640341917189.doc', 'standard_document/03241640343052115.doc', 'rbyj1908', '2020-03-24 16:40:34');
INSERT INTO `standard_document` VALUES ('554', '秋季班三年级英语上册第16讲：题型专项练习-语法', '3', '3', '1', 'standard_document/03241650098502715.doc', 'standard_document/03241650096980811.doc', 'oqrj1908', '2020-03-24 16:50:09');
INSERT INTO `standard_document` VALUES ('555', '秋季班三年级英语上册第17讲：题型专项练习-情景交际', '3', '3', '1', 'standard_document/03241651104106057.doc', 'standard_document/03241651105275348.doc', 'oqrj1908', '2020-03-24 16:51:10');
INSERT INTO `standard_document` VALUES ('556', '秋季班三年级英语上册第18讲：题型专项练习-阅读理解', '3', '3', '1', 'standard_document/03241651425557545.doc', 'standard_document/03241651424228831.doc', 'oqrj1908', '2020-03-24 16:51:42');
INSERT INTO `standard_document` VALUES ('557', '秋季班三年级英语上册第19讲：期末测试', '3', '3', '1', 'standard_document/03241652181547799.doc', 'standard_document/03241652187929478.doc', 'oqrj1908', '2020-03-24 16:52:18');
INSERT INTO `standard_document` VALUES ('558', '秋季班三年级英语上册第20讲：期末测试', '3', '3', '1', 'standard_document/03241653133574011.doc', 'standard_document/03241653134133024.doc', 'oqrj1908', '2020-03-24 16:53:13');
INSERT INTO `standard_document` VALUES ('560', '秋季班高二年级数学第六讲：直线方程', '2', '11', '1', 'standard_document/03241702324457481.doc', 'standard_document/03241702329108110.doc', 'rbyj1908', '2020-03-24 17:02:32');
INSERT INTO `standard_document` VALUES ('561', '秋季班高二年级数学第七讲：直线的斜率及倾斜角', '2', '11', '1', 'standard_document/03241704333719398.doc', 'standard_document/03241704338925999.doc', 'rbyj1908', '2020-03-24 17:04:33');
INSERT INTO `standard_document` VALUES ('562', '秋季班高二年级数学第八讲：两直线 之间的夹角公式', '2', '11', '1', 'standard_document/03241706108901365.doc', 'standard_document/03241706103492003.doc', 'rbyj1908', '2020-03-24 17:06:10');
INSERT INTO `standard_document` VALUES ('564', '秋季班高二年级数学第九讲：点到直线的距离公式', '2', '11', '1', 'standard_document/03241729553863872.doc', 'standard_document/03241729556735594.doc', 'rbyj1908', '2020-03-24 17:29:55');
INSERT INTO `standard_document` VALUES ('566', '秋季班高二年级数学第十讲：直线复习', '2', '11', '1', 'standard_document/03241736242661769.doc', 'standard_document/03241736247691748.doc', 'rbyj1908', '2020-03-24 17:36:24');
INSERT INTO `standard_document` VALUES ('567', '春季班八年级英语第9讲：8B期中复习+基础&语法综合+阅读', '3', '8', '2', 'standard_document/03241902082608277.doc', 'standard_document/03241902085066810.doc', 'bpsn2001', '2020-03-24 19:02:08');
INSERT INTO `standard_document` VALUES ('568', '秋季班三年级数学第13讲：轴对称图形，三角形的分类', '2', '3', '1', 'standard_document/03251339472897615.doc', 'standard_document/03251339475089897.doc', 'dsix1908', '2020-03-25 13:39:47');
INSERT INTO `standard_document` VALUES ('569', '秋季班三年级数学第14讲：面积计算', '2', '3', '1', 'standard_document/03251340596736175.doc', 'standard_document/03251340594642645.doc', 'dsix1908', '2020-03-25 13:40:59');
INSERT INTO `standard_document` VALUES ('570', '秋季班二年级英语第七讲：M2U3 My hair is short', '3', '2', '1', 'standard_document/03251414325261695.doc', 'standard_document/03251414327389530.doc', 'neck1908', '2020-03-25 14:14:32');
INSERT INTO `standard_document` VALUES ('571', '秋季班二年级英语第八讲：Module2 复习', '3', '2', '1', 'standard_document/03251415002081001.doc', 'standard_document/03251415006042937.doc', 'neck1908', '2020-03-25 14:15:00');
INSERT INTO `standard_document` VALUES ('572', '春季班五年级数学第15讲：可能性 ', '2', '5', '2', 'standard_document/03251521111945583.doc', 'standard_document/03251521113564415.doc', 'jkgn1910', '2020-03-25 15:21:11');
INSERT INTO `standard_document` VALUES ('573', '春季班五年级数学第16讲：综合复习', '2', '5', '2', 'standard_document/03251521381293127.doc', 'standard_document/03251521386485917.doc', 'jkgn1910', '2020-03-25 15:21:38');
INSERT INTO `standard_document` VALUES ('574', '春季班五年级数学第17讲：数与运算', '2', '5', '2', 'standard_document/03261313198737333.doc', 'standard_document/03261313192629386.doc', 'jkgn1910', '2020-03-26 13:13:19');
INSERT INTO `standard_document` VALUES ('575', '春季班五年级数学第18讲：方程与代数', '2', '5', '2', 'standard_document/03261313493948847.doc', 'standard_document/03261313492774971.doc', 'jkgn1910', '2020-03-26 13:13:49');
INSERT INTO `standard_document` VALUES ('576', '秋季班二年级英语第九讲：M3U1  In the children s gard', '3', '2', '1', 'standard_document/03261354084049178.doc', 'standard_document/03261354085160003.doc', 'neck1908', '2020-03-26 13:54:08');
INSERT INTO `standard_document` VALUES ('577', '秋季班二年级英语第十讲：期中测试', '3', '2', '1', 'standard_document/03261356524230206.doc', 'standard_document/03261356521293223.doc', 'neck1908', '2020-03-26 13:56:52');
INSERT INTO `standard_document` VALUES ('578', '秋季班二年级英语第十一讲：M3U2  In my room', '3', '2', '1', 'standard_document/03261501234511071.doc', 'standard_document/03261501232264846.doc', 'neck1908', '2020-03-26 15:01:23');
INSERT INTO `standard_document` VALUES ('579', '秋季班二年级英语第十二讲：M3U3  In the kitchen', '3', '2', '1', 'standard_document/03261501501522884.doc', 'standard_document/03261501509271577.doc', 'neck1908', '2020-03-26 15:01:50');
INSERT INTO `standard_document` VALUES ('580', '秋季班二年级英语第十三讲：Module3 复习', '3', '2', '1', 'standard_document/03261502162551833.doc', 'standard_document/03261502163165822.doc', 'neck1908', '2020-03-26 15:02:16');
INSERT INTO `standard_document` VALUES ('581', '秋季班二年级英语第十四讲：M4U1 In the sky', '3', '2', '1', 'standard_document/03261503119804210.doc', 'standard_document/03261503117540343.doc', 'neck1908', '2020-03-26 15:03:11');
INSERT INTO `standard_document` VALUES ('582', '秋季班三年级数学第15讲：计算综合复习', '2', '3', '1', 'standard_document/03261554464251243.doc', 'standard_document/03261554465968950.doc', 'dsix1908', '2020-03-26 15:54:46');
INSERT INTO `standard_document` VALUES ('583', '秋季班三年级数学第16讲：减法塔', '2', '3', '1', 'standard_document/03261556193534158.doc', 'standard_document/03261556193485209.doc', 'dsix1908', '2020-03-26 15:56:19');
INSERT INTO `standard_document` VALUES ('584', '秋季班三年级数学第17讲：平，闰年的认识', '2', '3', '1', 'standard_document/03261557389879130.doc', 'standard_document/03261557384469088.doc', 'dsix1908', '2020-03-26 15:57:38');
INSERT INTO `standard_document` VALUES ('585', '秋季班三年级数学第18讲：植树问题与周期问题', '2', '3', '1', 'standard_document/03261558312724209.doc', 'standard_document/03261558312637778.doc', 'dsix1908', '2020-03-26 15:58:31');
INSERT INTO `standard_document` VALUES ('586', '春季班五年级数学第19讲：图形与几何', '2', '5', '2', 'standard_document/03271852558733549.doc', 'standard_document/03271852554738649.doc', 'jkgn1910', '2020-03-27 18:52:55');
INSERT INTO `standard_document` VALUES ('587', '春季班五年级数学第20讲：统计初步及总复习', '2', '5', '2', 'standard_document/03271853339086254.doc', 'standard_document/03271853336175855.doc', 'jkgn1910', '2020-03-27 18:53:33');
INSERT INTO `standard_document` VALUES ('588', '春季班九年级英语第4讲：形容词与副词专项+综合', '3', '9', '2', 'standard_document/03272218473262595.doc', 'standard_document/03272218473759643.doc', 'bpsn2001', '2020-03-27 22:18:47');
INSERT INTO `standard_document` VALUES ('589', '春季班八年级英语第10讲：8B期中复习+强化复习+阅读', '3', '8', '2', 'standard_document/03272220434383328.doc', 'standard_document/03272220439633031.doc', 'bpsn2001', '2020-03-27 22:20:43');
INSERT INTO `standard_document` VALUES ('590', '春季班九年级英语第5讲：语法——介词专项+综合练习', '3', '9', '2', 'standard_document/03272246563738562.doc', 'standard_document/03272246564195897.doc', 'bpsn2001', '2020-03-27 22:46:56');
INSERT INTO `standard_document` VALUES ('591', '春季班九年级英语第6讲：语法——动词专项（1）+综合练习', '3', '9', '2', 'standard_document/03272321035550095.doc', 'standard_document/03272321032156317.doc', 'bpsn2001', '2020-03-27 23:21:03');
INSERT INTO `standard_document` VALUES ('592', '春季班九年级英语第7讲：语法——非谓语动词+语法阅读综合', '3', '9', '2', 'standard_document/03290154314403762.doc', 'standard_document/03290154313971193.doc', 'bpsn2001', '2020-03-29 01:54:31');
INSERT INTO `standard_document` VALUES ('597', '春季班九年级英语第8讲：语法——连词与从句+语法阅读综合', '3', '9', '2', 'standard_document/03290157017226562.doc', 'standard_document/03290157014802037.doc', 'bpsn2001', '2020-03-29 01:57:01');
INSERT INTO `standard_document` VALUES ('603', '春季班九年级英语第9讲：语法——句子种类+语法阅读综合', '3', '9', '2', 'standard_document/03292307388055937.doc', 'standard_document/03292307381068401.doc', 'bpsn2001', '2020-03-29 23:07:38');
INSERT INTO `standard_document` VALUES ('604', '秋季班三年级数学第19讲：整理与提高', '2', '3', '1', 'standard_document/03301254153085754.doc', 'standard_document/03301254152666518.doc', 'dsix1908', '2020-03-30 12:54:15');
INSERT INTO `standard_document` VALUES ('605', '秋季班三年级数学第20讲：期末复习', '2', '3', '1', 'standard_document/03301255229930350.doc', 'standard_document/03301255222819908.doc', 'dsix1908', '2020-03-30 12:55:22');
INSERT INTO `standard_document` VALUES ('606', '秋季班二年级英语第十五讲：M4U2 In the forest', '3', '2', '1', 'standard_document/03311836534398785.doc', 'standard_document/03311836539714580.doc', 'neck1908', '2020-03-31 18:36:53');
INSERT INTO `standard_document` VALUES ('607', '秋季班二年级英语第十六讲：M4U3 In the street', '3', '2', '1', 'standard_document/03311837445122934.doc', 'standard_document/03311837445770713.doc', 'neck1908', '2020-03-31 18:37:44');
INSERT INTO `standard_document` VALUES ('608', '秋季班一年级数学第1讲：数一数，比多少', '2', '1', '1', 'standard_document/03311914225214017.doc', 'standard_document/03311914228031878.doc', 'dsix1908', '2020-03-31 19:14:22');
INSERT INTO `standard_document` VALUES ('609', '秋季班一年级数学第2讲：1-5的认识及比较大小', '2', '1', '1', 'standard_document/03311915135177772.doc', 'standard_document/03311915138621590.doc', 'dsix1908', '2020-03-31 19:15:13');
INSERT INTO `standard_document` VALUES ('610', '春季班九年级英语第10讲：名词&数词&冠词+期中模拟测试', '3', '9', '2', 'standard_document/03311950367296530.doc', 'standard_document/03311950367030130.doc', 'bpsn2001', '2020-03-31 19:50:36');
INSERT INTO `standard_document` VALUES ('613', '春季班九年级英语第11讲：语法——功能意念+语法阅读综合', '3', '9', '2', 'standard_document/03311952574783279.doc', 'standard_document/03311952572418299.doc', 'bpsn2001', '2020-03-31 19:52:57');
INSERT INTO `standard_document` VALUES ('619', '秋季班二年级英语第十七讲：Module4 复习', '3', '2', '1', 'standard_document/04011436254746543.doc', 'standard_document/04011436252162711.doc', 'neck1908', '2020-04-01 14:36:25');
INSERT INTO `standard_document` VALUES ('620', '秋季班二年级英语第十八讲：专项练习—听力+字母与词汇', '3', '2', '1', 'standard_document/04011438082109714.doc', 'standard_document/04011438084951327.doc', 'neck1908', '2020-04-01 14:38:08');
INSERT INTO `standard_document` VALUES ('621', '秋季班二年级英语第十九讲：专项练习—句型+情景交际', '3', '2', '1', 'standard_document/04011438387177322.doc', 'standard_document/04011438384347942.doc', 'neck1908', '2020-04-01 14:38:38');
INSERT INTO `standard_document` VALUES ('622', '秋季班二年级英语第二十讲：期末测试', '3', '2', '1', 'standard_document/04011439186382865.doc', 'standard_document/04011439186069820.doc', 'neck1908', '2020-04-01 14:39:18');
INSERT INTO `standard_document` VALUES ('623', '秋季班四年级数学第1讲-逆运算及应用', '2', '4', '1', 'standard_document/04011535524950637.doc', 'standard_document/04011535521726744.doc', 'tmil1908', '2020-04-01 15:35:52');
INSERT INTO `standard_document` VALUES ('624', '秋季班四年级数学第2讲-计算复习', '2', '4', '1', 'standard_document/04011558382463394.doc', 'standard_document/04011558386642322.doc', 'tmil1908', '2020-04-01 15:58:38');
INSERT INTO `standard_document` VALUES ('625', '春季班高一年级数学第十二讲：数列和等差数列', '2', '10', '2', 'standard_document/04011602469424358.doc', 'standard_document/04011602465550723.doc', 'rbyj1908', '2020-04-01 16:02:46');
INSERT INTO `standard_document` VALUES ('626', '秋季班一年级数学第3讲：分与合', '2', '1', '1', 'standard_document/04011811393772906.doc', 'standard_document/04011811399402018.doc', 'dsix1908', '2020-04-01 18:11:39');
INSERT INTO `standard_document` VALUES ('627', '秋季班一年级数学第4讲：加与减', '2', '1', '1', 'standard_document/04011814023424747.doc', 'standard_document/04011814025139695.doc', 'dsix1908', '2020-04-01 18:14:02');
INSERT INTO `standard_document` VALUES ('628', '春季班九年级化学第1讲：物质的检验与鉴别、分离与提纯', '5', '9', '2', 'standard_document/04021540263113098.doc', 'standard_document/04021540267792644.doc', 'jkgn1910', '2020-04-02 15:40:26');
INSERT INTO `standard_document` VALUES ('629', '春季班高一年级数学第十三讲：等比数列', '2', '10', '2', 'standard_document/04021541525513661.doc', 'standard_document/04021541525362620.doc', 'rbyj1908', '2020-04-02 15:41:52');
INSERT INTO `standard_document` VALUES ('630', '春季班九年级化学第2讲：探究和推断', '5', '9', '2', 'standard_document/04021541544715807.doc', 'standard_document/04021541541117833.doc', 'jkgn1910', '2020-04-02 15:41:54');
INSERT INTO `standard_document` VALUES ('631', '春季班高一年级数学第十四讲：等差等比数列综合', '2', '10', '2', 'standard_document/04021544087958251.doc', 'standard_document/04021544086019954.doc', 'rbyj1908', '2020-04-02 15:44:08');
INSERT INTO `standard_document` VALUES ('632', '春季班九年级化学第3讲：仪器的使用和基本操作', '5', '9', '2', 'standard_document/04021545173255328.doc', 'standard_document/04021545172691171.doc', 'jkgn1910', '2020-04-02 15:45:17');
INSERT INTO `standard_document` VALUES ('633', '春季班高一年级数学第十五讲：数列通项', '2', '10', '2', 'standard_document/04021546087554477.doc', 'standard_document/04021546081694402.doc', 'rbyj1908', '2020-04-02 15:46:08');
INSERT INTO `standard_document` VALUES ('634', '春季班九年级化学第4讲：课本基础实验', '5', '9', '2', 'standard_document/04021547362112434.doc', 'standard_document/04021547362686137.doc', 'jkgn1910', '2020-04-02 15:47:36');
INSERT INTO `standard_document` VALUES ('635', '春季班高一年级数学第十六讲：数列求和', '2', '10', '2', 'standard_document/04021548255743611.doc', 'standard_document/04021548252484934.doc', 'rbyj1908', '2020-04-02 15:48:25');
INSERT INTO `standard_document` VALUES ('636', '春季班九年级化学第5讲：气体的制取和性质', '5', '9', '2', 'standard_document/04021549025967035.doc', 'standard_document/04021549029127144.doc', 'jkgn1910', '2020-04-02 15:49:02');
INSERT INTO `standard_document` VALUES ('637', '春季班九年级化学第6讲：还原氧化铜及混合气体检验', '5', '9', '2', 'standard_document/04021551492167794.doc', 'standard_document/04021551499734412.doc', 'jkgn1910', '2020-04-02 15:51:49');
INSERT INTO `standard_document` VALUES ('638', '春季班九年级化学第7讲：实验探究一（控制变量） ', '5', '9', '2', 'standard_document/04021553271565106.doc', 'standard_document/04021553271838659.doc', 'jkgn1910', '2020-04-02 15:53:27');
INSERT INTO `standard_document` VALUES ('639', '春季班九年级化学第8讲：探究实验二（中和、金属活动性）', '5', '9', '2', 'standard_document/04021554043494800.doc', 'standard_document/04021554044973248.doc', 'jkgn1910', '2020-04-02 15:54:04');
INSERT INTO `standard_document` VALUES ('640', '春季班九年级化学第9讲：探究实验三（碱的变质、混合物成分） ', '5', '9', '2', 'standard_document/04021554599365935.doc', 'standard_document/04021554599401080.doc', 'jkgn1910', '2020-04-02 15:54:59');
INSERT INTO `standard_document` VALUES ('641', '春季班九年级化学第10讲：基本概念与基本理论', '5', '9', '2', 'standard_document/04021556268905824.doc', 'standard_document/04021556261848357.doc', 'jkgn1910', '2020-04-02 15:56:26');
INSERT INTO `standard_document` VALUES ('642', '春季班高一年级数学第十7讲：数学归纳法', '2', '10', '2', 'standard_document/04021559129751786.doc', 'standard_document/04021559128594580.doc', 'rbyj1908', '2020-04-02 15:59:12');
INSERT INTO `standard_document` VALUES ('643', '秋季班四年级数学-第3讲-大数的认识', '2', '4', '1', 'standard_document/04021602158832773.doc', 'standard_document/04021602158235952.doc', 'tmil1908', '2020-04-02 16:02:15');
INSERT INTO `standard_document` VALUES ('645', '春季班高一年级数学第十八讲：数列极限', '2', '10', '2', 'standard_document/04021604334012868.doc', 'standard_document/04021604338672674.doc', 'rbyj1908', '2020-04-02 16:04:33');
INSERT INTO `standard_document` VALUES ('646', '秋季班一年级数学第5讲：6-9的认识', '2', '1', '1', 'standard_document/04021840363836703.doc', 'standard_document/04021840361564377.doc', 'dsix1908', '2020-04-02 18:40:36');
INSERT INTO `standard_document` VALUES ('647', '秋季班一年级数学第6讲：10的认识', '2', '1', '1', 'standard_document/04021841444255841.doc', 'standard_document/04021841449683717.doc', 'dsix1908', '2020-04-02 18:41:44');
INSERT INTO `standard_document` VALUES ('648', '秋季班一年级数学第7讲：连加，连减及加减混合', '2', '1', '1', 'standard_document/04021844339526646.doc', 'standard_document/04021844337568208.doc', 'dsix1908', '2020-04-02 18:44:33');
INSERT INTO `standard_document` VALUES ('649', '秋季班一年级数学第8讲：11-20的认识', '2', '1', '1', 'standard_document/04021846292890205.doc', 'standard_document/04021846296935622.doc', 'dsix1908', '2020-04-02 18:46:29');
INSERT INTO `standard_document` VALUES ('650', '秋季班四年级数学第4讲-四舍五入法、平方千米', '2', '4', '1', 'standard_document/04021855467814243.doc', 'standard_document/04021855468389780.doc', 'tmil1908', '2020-04-02 18:55:46');
INSERT INTO `standard_document` VALUES ('651', '春季班二年级英语第一讲：M1U1 What can you see', '3', '2', '2', 'standard_document/04031420431200113.doc', 'standard_document/04031420437004587.doc', 'neck1908', '2020-04-03 14:20:43');
INSERT INTO `standard_document` VALUES ('653', '春季班四年级英语下册第1讲：M1U1 What can you smell an', '3', '4', '2', 'standard_document/04031502084155640.doc', 'standard_document/04031502084396523.doc', 'oqrj1908', '2020-04-03 15:02:08');
INSERT INTO `standard_document` VALUES ('654', '春季班四年级英语下册第2讲：M1U2 How does it feel', '3', '4', '2', 'standard_document/04031502511546249.doc', 'standard_document/04031502518317686.doc', 'oqrj1908', '2020-04-03 15:02:51');
INSERT INTO `standard_document` VALUES ('655', '春季班四年级英语下册第3讲：M1U3 Look at the shadow', '3', '4', '2', 'standard_document/04031503278554023.doc', 'standard_document/04031503279321720.doc', 'oqrj1908', '2020-04-03 15:03:27');
INSERT INTO `standard_document` VALUES ('656', '春季班四年级英语下册第4讲：M2U1 Sport', '3', '4', '2', 'standard_document/04031504059187614.doc', 'standard_document/04031504056360068.doc', 'oqrj1908', '2020-04-03 15:04:05');
INSERT INTO `standard_document` VALUES ('657', '春季班四年级英语下册第5讲：M2U2 Cute animals', '3', '4', '2', 'standard_document/04031507498300894.doc', 'standard_document/04031507491891027.doc', 'oqrj1908', '2020-04-03 15:07:49');
INSERT INTO `standard_document` VALUES ('658', '春季班四年级英语下册第6讲：M2U3 Home life', '3', '4', '2', 'standard_document/04031510322821574.doc', 'standard_document/04031510321504022.doc', 'oqrj1908', '2020-04-03 15:10:32');
INSERT INTO `standard_document` VALUES ('659', '春季班四年级英语下册第7讲：M3U1 Sounds', '3', '4', '2', 'standard_document/04031717105207813.doc', 'standard_document/04031717101512162.doc', 'oqrj1908', '2020-04-03 17:17:10');
INSERT INTO `standard_document` VALUES ('660', '春季班四年级英语下册第8讲：M3U2 Time', '3', '4', '2', 'standard_document/04031719395813960.doc', 'standard_document/04031719398656117.doc', 'oqrj1908', '2020-04-03 17:19:39');
INSERT INTO `standard_document` VALUES ('661', '春季班四年级英语下册第9讲：M3U3 Days of the week ', '3', '4', '2', 'standard_document/04031721388155532.doc', 'standard_document/04031721386505180.doc', 'oqrj1908', '2020-04-03 17:21:38');
INSERT INTO `standard_document` VALUES ('662', '春季班四年级英语下册第10讲：Module One 知识点梳理以及综合测试', '3', '4', '2', 'standard_document/04031920479610383.doc', 'standard_document/04031920475462316.doc', 'oqrj1908', '2020-04-03 19:20:47');
INSERT INTO `standard_document` VALUES ('663', '春季班四年级英语下册第11讲：期中综合测试', '3', '4', '2', 'standard_document/04031921267357153.doc', 'standard_document/04031921266622452.doc', 'oqrj1908', '2020-04-03 19:21:26');
INSERT INTO `standard_document` VALUES ('664', '春季班四年级英语下册第12讲：M4U1 A Music class', '3', '4', '2', 'standard_document/04031923188011109.doc', 'standard_document/04031923182930191.doc', 'oqrj1908', '2020-04-03 19:23:18');
INSERT INTO `standard_document` VALUES ('665', '春季班八年级英语第11讲：8BU5词汇复习+代词专题+阅读综合', '3', '8', '2', 'standard_document/04070939477359890.doc', 'standard_document/04070939476097922.doc', 'bpsn2001', '2020-04-07 09:39:47');
INSERT INTO `standard_document` VALUES ('666', '春季班八年级英语第12讲：8BU5基础强化+语法专项：状语从句+阅读综合', '3', '8', '2', 'standard_document/04071004143572715.doc', 'standard_document/04071004143774891.doc', 'bpsn2001', '2020-04-07 10:04:14');
INSERT INTO `standard_document` VALUES ('667', '春季班八年级英语第13讲：8BU4U5综合复习+综合阅读', '3', '8', '2', 'standard_document/04071023089033294.doc', 'standard_document/04071023088579654.doc', 'bpsn2001', '2020-04-07 10:23:08');
INSERT INTO `standard_document` VALUES ('668', '春季班八年级英语第14讲：8BU6基础复习+连词专题+阅读综合', '3', '8', '2', 'standard_document/04071059583794886.doc', 'standard_document/04071059589124090.doc', 'bpsn2001', '2020-04-07 10:59:58');
INSERT INTO `standard_document` VALUES ('669', '春季班八年级英语第15讲：8BU6能力提升+阅读综合+写作', '3', '8', '2', 'standard_document/04071213325117350.doc', 'standard_document/04071213324845594.doc', 'bpsn2001', '2020-04-07 12:13:32');
INSERT INTO `standard_document` VALUES ('671', '春季班八年级英语第16讲：8BU7同步+代词+阅读综合', '3', '8', '2', 'standard_document/04071359233310363.doc', 'standard_document/04071359236504333.doc', 'bpsn2001', '2020-04-07 13:59:23');
INSERT INTO `standard_document` VALUES ('672', '春季班八年级英语第17讲：8BU7基础强化+阅读综合', '3', '8', '2', 'standard_document/04071432013093068.doc', 'standard_document/04071432012899064.doc', 'bpsn2001', '2020-04-07 14:32:01');
INSERT INTO `standard_document` VALUES ('673', '春季班八年级英语第18讲：倒装句+综合练习', '3', '8', '2', 'standard_document/04071451196778861.doc', 'standard_document/04071451198907949.doc', 'bpsn2001', '2020-04-07 14:51:19');
INSERT INTO `standard_document` VALUES ('674', '春季班高一年级数学第十九讲：数列综合', '2', '10', '2', 'standard_document/04071520191664158.doc', 'standard_document/04071520192606428.doc', 'rbyj1908', '2020-04-07 15:20:19');
INSERT INTO `standard_document` VALUES ('675', '春季班九年级化学第11讲：溶液及溶解度', '5', '9', '2', 'standard_document/04071705155121693.doc', 'standard_document/04071705154174980.doc', 'jkgn1910', '2020-04-07 17:05:15');
INSERT INTO `standard_document` VALUES ('676', '春季班九年级化学第12讲：常见的化学物质（空气和氢气）', '5', '9', '2', 'standard_document/04071707305175305.doc', 'standard_document/04071707302251691.doc', 'jkgn1910', '2020-04-07 17:07:30');
INSERT INTO `standard_document` VALUES ('677', '春季班八年级英语第19讲：查漏补缺（词汇）+词汇语法阅读综合测试+作文讲评', '3', '8', '2', 'standard_document/04071708285229296.doc', 'standard_document/04071708282828712.doc', 'bpsn2001', '2020-04-07 17:08:28');
INSERT INTO `standard_document` VALUES ('678', '春季班九年级化学第13讲：常见的化学物质（碳及其化合物）', '5', '9', '2', 'standard_document/04071709249764915.doc', 'standard_document/04071709244166515.doc', 'jkgn1910', '2020-04-07 17:09:24');
INSERT INTO `standard_document` VALUES ('679', '春季班八年级英语第20讲：期末语法复习+阅读综合测试+作文讲评', '3', '8', '2', 'standard_document/04071711088480324.doc', 'standard_document/04071711086114121.doc', 'bpsn2001', '2020-04-07 17:11:08');
INSERT INTO `standard_document` VALUES ('680', '春季班九年级化学第14讲：推断题', '5', '9', '2', 'standard_document/04071711156313601.doc', 'standard_document/04071711153497413.doc', 'jkgn1910', '2020-04-07 17:11:15');
INSERT INTO `standard_document` VALUES ('681', '春季班九年级化学第15讲：工业实验流程', '5', '9', '2', 'standard_document/04071713554393988.doc', 'standard_document/04071713559050650.doc', 'jkgn1910', '2020-04-07 17:13:55');
INSERT INTO `standard_document` VALUES ('682', '春季班四年级英语下册第13讲：M4U2 Festivals in China', '3', '4', '2', 'standard_document/04071716277313052.doc', 'standard_document/04071716278778721.doc', 'oqrj1908', '2020-04-07 17:16:27');
INSERT INTO `standard_document` VALUES ('683', '春季班九年级化学第16讲：二模实验探究汇编', '5', '9', '2', 'standard_document/04071717187136969.doc', 'standard_document/04071717184259449.doc', 'jkgn1910', '2020-04-07 17:17:18');
INSERT INTO `standard_document` VALUES ('684', '春季班四年级英语下册第14讲：M4U3 Story time', '3', '4', '2', 'standard_document/04071717509631745.doc', 'standard_document/04071717506115148.doc', 'oqrj1908', '2020-04-07 17:17:50');
INSERT INTO `standard_document` VALUES ('686', '春季班九年级化学第17讲：化学计算', '5', '9', '2', 'standard_document/04071719178661373.doc', 'standard_document/04071719176304743.doc', 'jkgn1910', '2020-04-07 17:19:17');
INSERT INTO `standard_document` VALUES ('687', '春季班四年级英语下册第15讲：Module Three 知识点梳理以及综合测试', '3', '4', '2', 'standard_document/04071720176554675.doc', 'standard_document/04071720173394834.doc', 'oqrj1908', '2020-04-07 17:20:17');
INSERT INTO `standard_document` VALUES ('688', '秋季班高一年级数学第一讲：集合', '2', '12', '1', 'standard_document/04071728509792428.doc', 'standard_document/04071728506078017.doc', 'rbyj1908', '2020-04-07 17:28:50');
INSERT INTO `standard_document` VALUES ('689', '秋季班一年级数学第9讲：凑十与破十法', '2', '1', '1', 'standard_document/04071729512538819.doc', 'standard_document/04071729518902957.doc', 'dsix1908', '2020-04-07 17:29:51');
INSERT INTO `standard_document` VALUES ('690', '秋季班高一年级数学第2讲：不等式', '2', '12', '1', 'standard_document/04071730013932600.doc', 'standard_document/04071730018359850.doc', 'rbyj1908', '2020-04-07 17:30:01');
INSERT INTO `standard_document` VALUES ('691', '秋季班高一年级数学第3讲：函数1', '2', '12', '1', 'standard_document/04071731052702537.doc', 'standard_document/04071731055404451.doc', 'rbyj1908', '2020-04-07 17:31:05');
INSERT INTO `standard_document` VALUES ('692', '秋季班一年级数学第10讲：20以内看图列式与应用', '2', '1', '1', 'standard_document/04071731121542435.doc', 'standard_document/04071731124905364.doc', 'dsix1908', '2020-04-07 17:31:12');
INSERT INTO `standard_document` VALUES ('693', '秋季班高一年级数学第4讲：函数2', '2', '12', '1', 'standard_document/04071733083636669.doc', 'standard_document/04071733085460252.doc', 'rbyj1908', '2020-04-07 17:33:08');
INSERT INTO `standard_document` VALUES ('694', '秋季班高一年级数学第5讲：指数函数', '2', '12', '1', 'standard_document/04071735238254321.doc', 'standard_document/04071735235813155.doc', 'rbyj1908', '2020-04-07 17:35:23');
INSERT INTO `standard_document` VALUES ('695', '秋季班高一年级数学第6讲：幂函数及函数综合', '2', '12', '1', 'standard_document/04071736311045107.doc', 'standard_document/04071736316604430.doc', 'rbyj1908', '2020-04-07 17:36:31');
INSERT INTO `standard_document` VALUES ('696', '秋季班高一年级数学第7讲：三角函数1', '2', '12', '1', 'standard_document/04071738144128807.doc', 'standard_document/04071738149236297.doc', 'rbyj1908', '2020-04-07 17:38:14');
INSERT INTO `standard_document` VALUES ('697', '秋季班高一年级数学第8讲：三角函数2', '2', '12', '1', 'standard_document/04071739316800049.doc', 'standard_document/04071739319982950.doc', 'rbyj1908', '2020-04-07 17:39:31');
INSERT INTO `standard_document` VALUES ('698', '秋季班高一年级数学第9讲：数列1', '2', '12', '1', 'standard_document/04071740553625583.doc', 'standard_document/04071740559926791.doc', 'rbyj1908', '2020-04-07 17:40:55');
INSERT INTO `standard_document` VALUES ('699', '秋季班高一年级数学第10讲：数列2', '2', '12', '1', 'standard_document/04071742024873949.doc', 'standard_document/04071742027346502.doc', 'rbyj1908', '2020-04-07 17:42:02');
INSERT INTO `standard_document` VALUES ('700', '秋季班高一年级数学第11讲：矩阵行列式', '2', '12', '1', 'standard_document/04071743202970615.doc', 'standard_document/04071743202661731.doc', 'rbyj1908', '2020-04-07 17:43:20');
INSERT INTO `standard_document` VALUES ('701', '秋季班高一年级数学第12讲：向量', '2', '12', '1', 'standard_document/04071745133534168.doc', 'standard_document/04071745134309930.doc', 'rbyj1908', '2020-04-07 17:45:13');
INSERT INTO `standard_document` VALUES ('702', '秋季班高一年级数学第13讲：直线', '2', '12', '1', 'standard_document/04071746444443060.doc', 'standard_document/04071746444581819.doc', 'rbyj1908', '2020-04-07 17:46:44');
INSERT INTO `standard_document` VALUES ('703', '秋季班高一年级数学第14讲：圆', '2', '12', '1', 'standard_document/04071747519226481.doc', 'standard_document/04071747512187698.doc', 'rbyj1908', '2020-04-07 17:47:51');
INSERT INTO `standard_document` VALUES ('704', '春季班四年级英语下册第16讲：课本重点词汇梳理', '3', '4', '2', 'standard_document/04071750034870070.doc', 'standard_document/04071750039876815.doc', 'oqrj1908', '2020-04-07 17:50:03');
INSERT INTO `standard_document` VALUES ('705', '秋季班高一年级数学第15讲：圆锥曲线', '2', '12', '1', 'standard_document/04071751054835374.doc', 'standard_document/04071751059333193.doc', 'rbyj1908', '2020-04-07 17:51:05');
INSERT INTO `standard_document` VALUES ('707', '秋季班四年级数学-第5讲-重量及容积单位', '2', '4', '1', 'standard_document/04071804512326290.doc', 'standard_document/04071804519598117.doc', 'tmil1908', '2020-04-07 18:04:51');
INSERT INTO `standard_document` VALUES ('708', '春季班九年级英语第12讲：名词&数词&冠词-阅读A-中考模拟卷1', '3', '9', '2', 'standard_document/04071808459645341.doc', 'standard_document/04071808459455384.doc', 'bpsn2001', '2020-04-07 18:08:45');
INSERT INTO `standard_document` VALUES ('711', '春季班九年级英语第13讲：代词&形容词副词&系动词-阅读B-中考模拟卷2', '3', '9', '2', 'standard_document/04071811576546151.doc', 'standard_document/04071811576442013.doc', 'bpsn2001', '2020-04-07 18:11:57');
INSERT INTO `standard_document` VALUES ('712', '秋季班四年级数学第6讲-分数大小比较', '2', '4', '1', 'standard_document/04071817407733918.doc', 'standard_document/04071817403220460.doc', 'tmil1908', '2020-04-07 18:17:40');
INSERT INTO `standard_document` VALUES ('713', '春季班二年级英语第二讲：M1U2 Touch and feel', '3', '2', '2', 'standard_document/04071820272656659.doc', 'standard_document/04071820271020552.doc', 'neck1908', '2020-04-07 18:20:27');
INSERT INTO `standard_document` VALUES ('714', '春季班九年级英语第14讲：介词&动名词&动词不定式-阅读C-中考模拟卷3', '3', '9', '2', 'standard_document/04071835405137537.doc', 'standard_document/04071835405496087.doc', 'bpsn2001', '2020-04-07 18:35:40');
INSERT INTO `standard_document` VALUES ('716', '春季班四年级英语下册第17讲：语法介词', '3', '4', '2', 'standard_document/04081331545765661.doc', 'standard_document/04081331544109605.doc', 'oqrj1908', '2020-04-08 13:31:54');
INSERT INTO `standard_document` VALUES ('717', '春季班四年级英语下册第18讲：语法现在进行时', '3', '4', '2', 'standard_document/04081335414327280.doc', 'standard_document/04081335411204269.doc', 'oqrj1908', '2020-04-08 13:35:41');
INSERT INTO `standard_document` VALUES ('718', '春季班四年级英语下册第19讲：语法选择疑问句、时间表达', '3', '4', '2', 'standard_document/04081336225213550.doc', 'standard_document/04081336226445437.doc', 'oqrj1908', '2020-04-08 13:36:22');
INSERT INTO `standard_document` VALUES ('719', '春季班四年级英语下册第20讲：期末综合测试', '3', '4', '2', 'standard_document/04081336581007937.doc', 'standard_document/04081336589157544.doc', 'oqrj1908', '2020-04-08 13:36:58');
INSERT INTO `standard_document` VALUES ('720', '秋季班一年级数学第11讲：期中复习', '2', '1', '1', 'standard_document/04081424097908220.doc', 'standard_document/04081424095903093.doc', 'dsix1908', '2020-04-08 14:24:09');
INSERT INTO `standard_document` VALUES ('721', '秋季班一年级数学第12讲：数射线上的运算', '2', '1', '1', 'standard_document/04081425136393790.doc', 'standard_document/04081425137287623.doc', 'dsix1908', '2020-04-08 14:25:13');
INSERT INTO `standard_document` VALUES ('722', '秋季班四年级数学第7讲-分数的加减', '2', '4', '1', 'standard_document/04081430492222101.doc', 'standard_document/04081430499117256.doc', 'tmil1908', '2020-04-08 14:30:49');
INSERT INTO `standard_document` VALUES ('724', '秋季班四年级数学四年级-第8讲-工作效率问题', '2', '4', '1', 'standard_document/04081728378597609.doc', 'standard_document/04081728377808466.doc', 'tmil1908', '2020-04-08 17:28:37');
INSERT INTO `standard_document` VALUES ('728', '春季班三年级数学第15讲：分数的初步认识', '2', '3', '2', 'standard_document/04091429222935929.doc', 'standard_document/04091429222801804.doc', 'dsix1908', '2020-04-09 14:29:22');
INSERT INTO `standard_document` VALUES ('729', '春季班三年级数学第16讲：解决问题', '2', '3', '2', 'standard_document/04091430234750152.doc', 'standard_document/04091430232816931.doc', 'dsix1908', '2020-04-09 14:30:23');
INSERT INTO `standard_document` VALUES ('730', '春季班三年级数学第17讲：周长与面积', '2', '3', '2', 'standard_document/04091431165081554.doc', 'standard_document/04091431162612093.doc', 'dsix1908', '2020-04-09 14:31:16');
INSERT INTO `standard_document` VALUES ('731', '春季班三年级数学第18讲：数学广场', '2', '3', '2', 'standard_document/04091431587274675.doc', 'standard_document/04091431581429888.doc', 'dsix1908', '2020-04-09 14:31:58');
INSERT INTO `standard_document` VALUES ('732', '春季班二年级英语第三讲：M1U3 What can you hear', '3', '2', '2', 'standard_document/04091519267023199.doc', 'standard_document/04091519265715771.doc', 'neck1908', '2020-04-09 15:19:26');
INSERT INTO `standard_document` VALUES ('733', '春季班二年级英语第四讲：Module 1复习', '3', '2', '2', 'standard_document/04091523278506713.doc', 'standard_document/04091523271181030.doc', 'neck1908', '2020-04-09 15:23:27');
INSERT INTO `standard_document` VALUES ('734', '春季班二年级英语第五讲：M2U1  Things I like doing', '3', '2', '2', 'standard_document/04091528472776370.doc', 'standard_document/04091528472122573.doc', 'neck1908', '2020-04-09 15:28:47');
INSERT INTO `standard_document` VALUES ('735', '春季班二年级英语第六讲：M2U2 My favourite food', '3', '2', '2', 'standard_document/04091531497378113.doc', 'standard_document/04091531494955427.doc', 'neck1908', '2020-04-09 15:31:49');
INSERT INTO `standard_document` VALUES ('736', '秋季班八年级物理第一讲：让我们起航（一）', '4', '8', '1', 'standard_document/04091559308224395.doc', 'standard_document/04091559305071383.doc', 'qlyk2004', '2020-04-09 15:59:30');
INSERT INTO `standard_document` VALUES ('737', '秋季班八年级物理第二讲：让我们起航（二）', '4', '8', '1', 'standard_document/04091613499424204.doc', 'standard_document/04091613499139121.doc', 'qlyk2004', '2020-04-09 16:13:49');
INSERT INTO `standard_document` VALUES ('738', '秋季班八年级物理第三讲：声波的产生和传播', '4', '8', '1', 'standard_document/04091627091193216.doc', 'standard_document/04091627093570476.doc', 'qlyk2004', '2020-04-09 16:27:09');
INSERT INTO `standard_document` VALUES ('739', '秋季班八年级物理第四讲：声音的特性', '4', '8', '1', 'standard_document/04091708001910519.doc', 'standard_document/04091708007463465.doc', 'qlyk2004', '2020-04-09 17:08:00');
INSERT INTO `standard_document` VALUES ('744', '春季班二年级英语第七讲：M2U3  Animals I like', '3', '2', '2', 'standard_document/04101620241817522.doc', 'standard_document/04101620248760835.doc', 'neck1908', '2020-04-10 16:20:24');
INSERT INTO `standard_document` VALUES ('745', '春季班二年级英语第八讲：Module 2 复习', '3', '2', '2', 'standard_document/04101621163162894.doc', 'standard_document/04101621164136911.doc', 'neck1908', '2020-04-10 16:21:16');
INSERT INTO `standard_document` VALUES ('746', '春季班二年级英语第九讲：M3U1  The four seasons ', '3', '2', '2', 'standard_document/04101622324733079.doc', 'standard_document/04101622321190158.doc', 'neck1908', '2020-04-10 16:22:32');
INSERT INTO `standard_document` VALUES ('750', '春季班高一化学第1讲：硫元素复习（一）性质 ', '5', '10', '2', 'standard_document/04102049553217987.doc', 'standard_document/04102049558379447.doc', 'jkgn1910', '2020-04-10 20:49:55');
INSERT INTO `standard_document` VALUES ('751', '春季班高一化学第2讲：硫元素复习（二）实验计算', '5', '10', '2', 'standard_document/04102050276217677.doc', 'standard_document/04102050272315617.doc', 'jkgn1910', '2020-04-10 20:50:27');
INSERT INTO `standard_document` VALUES ('752', '春季班三年级数学第19讲：复习与提高', '2', '3', '2', 'standard_document/04130942534714796.doc', 'standard_document/04130942531766243.doc', 'dsix1908', '2020-04-13 09:42:53');
INSERT INTO `standard_document` VALUES ('753', '春季班三年级数学第20讲：期末复习', '2', '3', '2', 'standard_document/04130943381461925.doc', 'standard_document/04130943389140087.doc', 'dsix1908', '2020-04-13 09:43:38');
INSERT INTO `standard_document` VALUES ('765', '春季班一年级数学第1讲：复习与提高', '2', '1', '2', 'standard_document/04161349592096943.doc', 'standard_document/04161349599483328.doc', 'dsix1908', '2020-04-16 13:49:59');
INSERT INTO `standard_document` VALUES ('766', '春季班一年级数学第2讲;100以内数的认识', '2', '1', '2', 'standard_document/04161351489769624.doc', 'standard_document/04161351482793824.doc', 'dsix1908', '2020-04-16 13:51:48');
INSERT INTO `standard_document` VALUES ('769', '春季班高一化学第3讲：氮元素复习（一）性质 ', '5', '10', '2', 'standard_document/04161517085364245.doc', 'standard_document/04161517082561639.doc', 'jkgn1910', '2020-04-16 15:17:08');
INSERT INTO `standard_document` VALUES ('770', '春季班高一化学第4讲：氮元素复习（二）实验计算', '5', '10', '2', 'standard_document/04161518183792203.doc', 'standard_document/04161518183371743.doc', 'jkgn1910', '2020-04-16 15:18:18');
INSERT INTO `standard_document` VALUES ('771', '春季班高一化学第5讲：化学反应速率', '5', '10', '2', 'standard_document/04161519388853609.doc', 'standard_document/04161519384943514.doc', 'jkgn1910', '2020-04-16 15:19:38');
INSERT INTO `standard_document` VALUES ('775', '春季班高一化学第6讲：化学平衡', '5', '10', '2', 'standard_document/04161525291088424.doc', 'standard_document/04161525294394006.doc', 'jkgn1910', '2020-04-16 15:25:29');
INSERT INTO `standard_document` VALUES ('777', '春季班高一化学第7讲：平衡移动原理及应用', '5', '10', '2', 'standard_document/04161526524173971.doc', 'standard_document/04161526527533359.doc', 'jkgn1910', '2020-04-16 15:26:52');
INSERT INTO `standard_document` VALUES ('778', '春季班高一化学第8讲：期中复习：硫氮小结', '5', '10', '2', 'standard_document/04161528127685367.doc', 'standard_document/04161528125242577.doc', 'jkgn1910', '2020-04-16 15:28:12');
INSERT INTO `standard_document` VALUES ('780', '春季班高一化学第9讲：期中模拟试卷AB（基础+提高） ', '5', '10', '2', 'standard_document/04161529179275923.doc', 'standard_document/04161529172112458.doc', 'jkgn1910', '2020-04-16 15:29:17');
INSERT INTO `standard_document` VALUES ('781', '春季班高一化学第10讲：平衡图像', '5', '10', '2', 'standard_document/04161530544786789.doc', 'standard_document/04161530543747791.doc', 'jkgn1910', '2020-04-16 15:30:54');
INSERT INTO `standard_document` VALUES ('787', '春季班高一化学第11讲：化工生产又快又多', '5', '10', '2', 'standard_document/04161751376566346.doc', 'standard_document/04161751373354634.doc', 'jkgn1910', '2020-04-16 17:51:37');
INSERT INTO `standard_document` VALUES ('788', '春季班高一化学第12讲：化学平衡章节复习', '5', '10', '2', 'standard_document/04161752523517805.doc', 'standard_document/04161752529904555.doc', 'jkgn1910', '2020-04-16 17:52:52');
INSERT INTO `standard_document` VALUES ('795', '秋季班四年级英语上册第1讲：M1U1 Meeting new people', '3', '4', '1', 'standard_document/04171415436482094.doc', 'standard_document/04171415432507232.doc', 'oqrj1908', '2020-04-17 14:15:43');
INSERT INTO `standard_document` VALUES ('796', '秋季班四年级英语上册第2讲：M1U2 Abilities', '3', '4', '1', 'standard_document/04171416225181420.doc', 'standard_document/04171416223157611.doc', 'oqrj1908', '2020-04-17 14:16:22');
INSERT INTO `standard_document` VALUES ('797', '秋季班四年级英语上册第3讲：M1U3 How do you feel', '3', '4', '1', 'standard_document/04171416558200847.doc', 'standard_document/04171416553309172.doc', 'oqrj1908', '2020-04-17 14:16:55');
INSERT INTO `standard_document` VALUES ('798', '秋季班四年级英语上册第4讲：M2U1 Jills family', '3', '4', '1', 'standard_document/04171417286858449.doc', 'standard_document/04171417282029348.doc', 'oqrj1908', '2020-04-17 14:17:28');
INSERT INTO `standard_document` VALUES ('799', '秋季班四年级英语上册第5讲：M2U2 Jobs', '3', '4', '1', 'standard_document/04171417567109055.doc', 'standard_document/04171417567454974.doc', 'oqrj1908', '2020-04-17 14:17:56');
INSERT INTO `standard_document` VALUES ('800', '秋季班高二英语第四讲——U3重点单词词组复习&阅读理解训练1', '3', '11', '1', 'standard_document/04171525103473298.doc', 'standard_document/04171525104424685.doc', '', '2020-04-17 15:25:10');
INSERT INTO `standard_document` VALUES ('816', '春季班一年级数学第3讲：百以内数的比较大小及人名币的认识', '2', '1', '2', 'standard_document/04201307562539662.doc', 'standard_document/04201307563417500.doc', 'dsix1908', '2020-04-20 13:07:56');
INSERT INTO `standard_document` VALUES ('817', '春季班一年级数学第4讲：时间的初步认识', '2', '1', '2', 'standard_document/04201309338200015.doc', 'standard_document/04201309332516951.doc', 'dsix1908', '2020-04-20 13:09:33');
INSERT INTO `standard_document` VALUES ('818', '春季班高一化学第13讲：电解质及弱电解质的电离平衡', '5', '10', '2', 'standard_document/04211311017502777.doc', 'standard_document/04211311015272045.doc', 'jkgn1910', '2020-04-21 13:11:01');
INSERT INTO `standard_document` VALUES ('819', '春季班高一化学第14讲：水的电离平衡和pH计算', '5', '10', '2', 'standard_document/04211311455269548.doc', 'standard_document/04211311457379951.doc', 'jkgn1910', '2020-04-21 13:11:45');
INSERT INTO `standard_document` VALUES ('820', '春季班高一化学第15讲：电解质的化学反应', '5', '10', '2', 'standard_document/04211312366236503.doc', 'standard_document/04211312368682402.doc', 'jkgn1910', '2020-04-21 13:12:36');
INSERT INTO `standard_document` VALUES ('821', '春季班高一化学第16讲：盐类水解', '5', '10', '2', 'standard_document/04211313413302605.doc', 'standard_document/04211313415570032.doc', 'jkgn1910', '2020-04-21 13:13:41');
INSERT INTO `standard_document` VALUES ('822', '春季班高一化学第17讲：溶液中的三大守恒（选讲）', '5', '10', '2', 'standard_document/04211314334711323.doc', 'standard_document/04211314337492829.doc', 'jkgn1910', '2020-04-21 13:14:33');
INSERT INTO `standard_document` VALUES ('823', '春季班高一化学第18讲：电解池', '5', '10', '2', 'standard_document/04211316295341640.doc', 'standard_document/04211316292640104.doc', 'jkgn1910', '2020-04-21 13:16:29');
INSERT INTO `standard_document` VALUES ('824', '春季班高一化学第19讲：电解质溶液章节复习', '5', '10', '2', 'standard_document/04211317324305286.doc', 'standard_document/04211317323162854.doc', 'jkgn1910', '2020-04-21 13:17:32');
INSERT INTO `standard_document` VALUES ('825', '春季班高一化学第20讲：期末复习', '5', '10', '2', 'standard_document/04211318588859649.doc', 'standard_document/04211318586228320.doc', 'jkgn1910', '2020-04-21 13:18:58');
INSERT INTO `standard_document` VALUES ('826', '春季班一年级数学第5讲：两位数加减整十数', '2', '1', '2', 'standard_document/04211536461740784.doc', 'standard_document/04211536466002950.doc', 'dsix1908', '2020-04-21 15:36:46');
INSERT INTO `standard_document` VALUES ('827', '春季班一年级数学第6讲：两位数加减一位数', '2', '1', '2', 'standard_document/04211537512481974.doc', 'standard_document/04211537515660915.doc', 'dsix1908', '2020-04-21 15:37:51');
INSERT INTO `standard_document` VALUES ('828', '秋季班八年级物理第五讲：光的直线传播与反射', '4', '8', '1', 'standard_document/04211612588757870.doc', 'standard_document/04211612588049669.doc', 'qlyk2004', '2020-04-21 16:12:58');
INSERT INTO `standard_document` VALUES ('829', '秋季班八年级物理第六讲：平面镜成像', '4', '8', '1', 'standard_document/04211615474562492.doc', 'standard_document/04211615477355597.doc', 'qlyk2004', '2020-04-21 16:15:47');
INSERT INTO `standard_document` VALUES ('830', '秋季班八年级物理第七讲：光的折射', '4', '8', '1', 'standard_document/04211621518616571.doc', 'standard_document/04211621519879361.doc', 'qlyk2004', '2020-04-21 16:21:51');
INSERT INTO `standard_document` VALUES ('831', '秋季班八年级物理第八讲：透镜', '4', '8', '1', 'standard_document/04211624098160414.doc', 'standard_document/04211624092850500.doc', 'qlyk2004', '2020-04-21 16:24:09');
INSERT INTO `standard_document` VALUES ('832', '秋季班八年级物理第九讲：凸透镜成像规律', '4', '8', '1', 'standard_document/04211626242258790.doc', 'standard_document/04211626244228940.doc', 'qlyk2004', '2020-04-21 16:26:24');
INSERT INTO `standard_document` VALUES ('833', '秋季班八年级物理第十讲：期中复习', '4', '8', '1', 'standard_document/04211628435786733.doc', 'standard_document/04211628436409969.doc', 'qlyk2004', '2020-04-21 16:28:43');
INSERT INTO `standard_document` VALUES ('834', '秋季班八年级物理第十一讲：光的色散', '4', '8', '1', 'standard_document/04211634188029373.doc', 'standard_document/04211634183132396.doc', 'qlyk2004', '2020-04-21 16:34:18');
INSERT INTO `standard_document` VALUES ('835', '秋季班八年级物理第十二讲：凸透镜成像实验', '4', '8', '1', 'standard_document/04211639599137289.doc', 'standard_document/04211639594253259.doc', 'qlyk2004', '2020-04-21 16:39:59');
INSERT INTO `standard_document` VALUES ('836', '秋季班八年级物理第十三讲：机械运动', '4', '8', '1', 'standard_document/04211641569129028.doc', 'standard_document/04211641561087515.doc', 'qlyk2004', '2020-04-21 16:41:56');
INSERT INTO `standard_document` VALUES ('837', '秋季班八年级物理第十四讲：匀速直线运动', '4', '8', '1', 'standard_document/04211646244054867.doc', 'standard_document/04211646248605330.doc', 'qlyk2004', '2020-04-21 16:46:24');
INSERT INTO `standard_document` VALUES ('838', '秋季班八年级物理第十五讲:力', '4', '8', '1', 'standard_document/04211648558700349.doc', 'standard_document/04211648551293909.doc', 'qlyk2004', '2020-04-21 16:48:55');
INSERT INTO `standard_document` VALUES ('839', '秋季班八年级物理第十六讲:重力', '4', '8', '1', 'standard_document/04211651053244210.doc', 'standard_document/04211651055756705.doc', 'qlyk2004', '2020-04-21 16:51:05');
INSERT INTO `standard_document` VALUES ('840', '秋季班八年级物理第十七讲：二力平衡', '4', '8', '1', 'standard_document/04211652529329320.doc', 'standard_document/04211652522561439.doc', 'qlyk2004', '2020-04-21 16:52:52');
INSERT INTO `standard_document` VALUES ('841', '秋季班八年级物理第十八讲：摩擦力', '4', '8', '1', 'standard_document/04211655121736811.doc', 'standard_document/04211655128754152.doc', 'qlyk2004', '2020-04-21 16:55:12');
INSERT INTO `standard_document` VALUES ('843', '秋季班四年级英语上册第6讲：M2U3 I have a friend', '3', '4', '1', 'standard_document/04211923289697896.doc', 'standard_document/04211923285830337.doc', 'oqrj1908', '2020-04-21 19:23:28');
INSERT INTO `standard_document` VALUES ('844', '秋季班四年级英语上册第7讲：M3U1 In our school', '3', '4', '1', 'standard_document/04211925123522047.doc', 'standard_document/04211925129473783.doc', 'oqrj1908', '2020-04-21 19:25:12');
INSERT INTO `standard_document` VALUES ('845', '秋季班四年级英语上册第8讲：M3U2 Around my home', '3', '4', '1', 'standard_document/04211925475682994.doc', 'standard_document/04211925475315308.doc', 'oqrj1908', '2020-04-21 19:25:47');
INSERT INTO `standard_document` VALUES ('846', '秋季班四年级英语上册第9讲：M3U3 In the shop', '3', '4', '1', 'standard_document/04211926184769802.doc', 'standard_document/04211926186289655.doc', 'oqrj1908', '2020-04-21 19:26:18');
INSERT INTO `standard_document` VALUES ('847', '春季班高二化学第1讲：醛', '5', '11', '2', 'standard_document/04212001261214916.doc', 'standard_document/04212001263422238.doc', 'jkgn1910', '2020-04-21 20:01:26');
INSERT INTO `standard_document` VALUES ('848', '春季班高二化学第2讲：酸', '5', '11', '2', 'standard_document/04212002591621905.doc', 'standard_document/04212002596354811.doc', 'jkgn1910', '2020-04-21 20:02:59');
INSERT INTO `standard_document` VALUES ('849', '春季班一年级数学第7讲：两位数加两位数', '2', '1', '2', 'standard_document/04221647533859004.doc', 'standard_document/04221647539226372.doc', 'dsix1908', '2020-04-22 16:47:53');
INSERT INTO `standard_document` VALUES ('850', '春季班一年级数学第8讲：两位数减两位数', '2', '1', '2', 'standard_document/04221700143599560.doc', 'standard_document/04221700149101374.doc', 'dsix1908', '2020-04-22 17:00:14');
INSERT INTO `standard_document` VALUES ('852', '秋季班四年级英语上册第11讲：M4U1 A visit to a farm', '3', '4', '1', 'standard_document/04221857414516640.doc', 'standard_document/04221857419952654.doc', 'oqrj1908', '2020-04-22 18:57:41');
INSERT INTO `standard_document` VALUES ('853', '秋季班四年级英语上册第10讲：期中综合测试', '3', '4', '1', 'standard_document/04221858421344928.doc', 'standard_document/04221858422146568.doc', 'oqrj1908', '2020-04-22 18:58:42');
INSERT INTO `standard_document` VALUES ('854', '秋季班四年级英语上册第12讲：M4U2 At Century Park', '3', '4', '1', 'standard_document/04221859184207315.doc', 'standard_document/04221859181010221.doc', 'oqrj1908', '2020-04-22 18:59:18');
INSERT INTO `standard_document` VALUES ('855', '秋季班四年级英语上册第13讲：M4U3 Weather', '3', '4', '1', 'standard_document/04221900038745168.doc', 'standard_document/04221900035060350.doc', 'oqrj1908', '2020-04-22 19:00:03');
INSERT INTO `standard_document` VALUES ('857', '秋季班八年级物理第十九讲：期末复习（一）', '4', '8', '1', 'standard_document/04231148579174893.doc', 'standard_document/04231148577771233.doc', 'qlyk2004', '2020-04-23 11:48:57');
INSERT INTO `standard_document` VALUES ('858', '秋季班八年级物理第二十讲：期末复习（二）', '4', '8', '1', 'standard_document/04231150401904767.doc', 'standard_document/04231150408281021.doc', 'qlyk2004', '2020-04-23 11:50:40');
INSERT INTO `standard_document` VALUES ('859', '秋季班四年级英语上册第14讲：Module 1综合复习及测试', '3', '4', '1', 'standard_document/04231439155443302.doc', 'standard_document/04231439159025896.doc', 'oqrj1908', '2020-04-23 14:39:15');
INSERT INTO `standard_document` VALUES ('860', '秋季班四年级英语上册第15讲：Module 2综合复习及测试', '3', '4', '1', 'standard_document/04231439599548766.doc', 'standard_document/04231439594910731.doc', 'oqrj1908', '2020-04-23 14:39:59');
INSERT INTO `standard_document` VALUES ('861', '秋季班四年级英语上册第16讲：Module 3综合复习及测试', '3', '4', '1', 'standard_document/04231440261098220.doc', 'standard_document/04231440261775005.doc', 'oqrj1908', '2020-04-23 14:40:26');
INSERT INTO `standard_document` VALUES ('862', '秋季班四年级英语上册第17讲：Module 4综合复习及测试', '3', '4', '1', 'standard_document/04231440538730596.doc', 'standard_document/04231440535629343.doc', 'oqrj1908', '2020-04-23 14:40:53');
INSERT INTO `standard_document` VALUES ('863', '秋季班四年级英语上册第18讲：词汇专题', '3', '4', '1', 'standard_document/04231441176529696.doc', 'standard_document/04231441174132747.doc', 'oqrj1908', '2020-04-23 14:41:17');
INSERT INTO `standard_document` VALUES ('864', '秋季班四年级英语上册第19讲：词组专题', '3', '4', '1', 'standard_document/04231441442939183.doc', 'standard_document/04231441443196957.doc', 'oqrj1908', '2020-04-23 14:41:44');
INSERT INTO `standard_document` VALUES ('865', '秋季班四年级英语上册第20讲：期末综合测试', '3', '4', '1', 'standard_document/04231442061526673.doc', 'standard_document/04231442061635459.doc', 'oqrj1908', '2020-04-23 14:42:06');
INSERT INTO `standard_document` VALUES ('866', '春季班八年级物理第一讲;  杠杆、杠杆平衡条件', '4', '8', '2', 'standard_document/04231526376132261.doc', 'standard_document/04231526376646338.doc', 'qlyk2004', '2020-04-23 15:26:37');
INSERT INTO `standard_document` VALUES ('867', '春季班一年级数学第9讲：连加、连减及加减混合运算', '2', '1', '2', 'standard_document/04231553215803076.doc', 'standard_document/04231553214457201.doc', 'dsix1908', '2020-04-23 15:53:21');
INSERT INTO `standard_document` VALUES ('868', '春季班一年级数学第10讲：期中复习', '2', '1', '2', 'standard_document/04231554402326556.doc', 'standard_document/04231554408700081.doc', 'dsix1908', '2020-04-23 15:54:40');
INSERT INTO `standard_document` VALUES ('869', '春季班八年级物理第二讲：杠杆的分类及应用', '4', '8', '2', 'standard_document/04231558007468451.doc', 'standard_document/04231558008533422.doc', 'qlyk2004', '2020-04-23 15:58:00');
INSERT INTO `standard_document` VALUES ('870', '春季班八年级物理第三讲：滑轮', '4', '8', '2', 'standard_document/04231623484410548.doc', 'standard_document/04231623485324449.doc', 'qlyk2004', '2020-04-23 16:23:48');
INSERT INTO `standard_document` VALUES ('886', '春季班七年级英语第1讲：7BU1同步+阅读A+写作', '3', '7', '2', 'standard_document/04291652016345912.doc', 'standard_document/04291652015005556.doc', 'bpsn2001', '2020-04-29 16:52:01');
INSERT INTO `standard_document` VALUES ('887', '春季班七年级英语第2讲：7BU2同步+阅读A+写作', '3', '7', '2', 'standard_document/04291653521919878.doc', 'standard_document/04291653528414774.doc', 'bpsn2001', '2020-04-29 16:53:52');
INSERT INTO `standard_document` VALUES ('888', '春季班七年级英语第3讲：7BU1-U2基础强化+阅读A篇+写作 ', '3', '7', '2', 'standard_document/04291655268270284.doc', 'standard_document/04291655263248567.doc', 'bpsn2001', '2020-04-29 16:55:26');
INSERT INTO `standard_document` VALUES ('889', '春季班七年级英语第4讲：7BU3同步+阅读B+作文', '3', '7', '2', 'standard_document/04291657101353456.doc', 'standard_document/04291657102106000.doc', 'bpsn2001', '2020-04-29 16:57:10');
INSERT INTO `standard_document` VALUES ('890', '春季班七年级英语第5讲：7BU4同步+阅读B+作文', '3', '7', '2', 'standard_document/04291659212519651.doc', 'standard_document/04291659214038158.doc', 'bpsn2001', '2020-04-29 16:59:21');
INSERT INTO `standard_document` VALUES ('891', '春季班七年级英语第6讲：7BU3-U4基础强化+阅读C+语音总结+作文', '3', '7', '2', 'standard_document/04291700414032386.doc', 'standard_document/04291700416865128.doc', 'bpsn2001', '2020-04-29 17:00:41');
INSERT INTO `standard_document` VALUES ('892', '春季班七年级英语第7讲：7BU5同步+阅读C+写作', '3', '7', '2', 'standard_document/04291702046973844.doc', 'standard_document/04291702049589410.doc', 'bpsn2001', '2020-04-29 17:02:04');
INSERT INTO `standard_document` VALUES ('893', '春季班七年级英语第8讲：7BU6同步+阅读D+写作 ', '3', '7', '2', 'standard_document/04291703182596145.doc', 'standard_document/04291703186949577.doc', 'bpsn2001', '2020-04-29 17:03:18');
INSERT INTO `standard_document` VALUES ('894', '春季班七年级英语第9讲：期中复习1+阅读', '3', '7', '2', 'standard_document/04291704462620061.doc', 'standard_document/04291704467381245.doc', 'bpsn2001', '2020-04-29 17:04:46');
INSERT INTO `standard_document` VALUES ('895', '春季班七年级英语第10讲：期中复习2', '3', '7', '2', 'standard_document/04291709245443645.doc', 'standard_document/04291709242076996.doc', 'bpsn2001', '2020-04-29 17:09:24');
INSERT INTO `standard_document` VALUES ('896', '春季班七年级英语第11讲：7BU7同步+阅读综合', '3', '7', '2', 'standard_document/04291712405819318.doc', 'standard_document/04291712401473539.doc', 'bpsn2001', '2020-04-29 17:12:40');
INSERT INTO `standard_document` VALUES ('905', '春季班高二化学第3讲：酯', '5', '11', '2', 'standard_document/04292249161283573.doc', 'standard_document/04292249162141123.doc', 'jkgn1910', '2020-04-29 22:49:16');
INSERT INTO `standard_document` VALUES ('906', '春季班高二化学第4讲：烃的衍生物小结', '5', '11', '2', 'standard_document/04292249559664947.doc', 'standard_document/04292249558509544.doc', 'jkgn1910', '2020-04-29 22:49:55');
INSERT INTO `standard_document` VALUES ('907', '春季班高二化学第5讲：有机实验', '5', '11', '2', 'standard_document/04292251016540394.doc', 'standard_document/04292251014279967.doc', 'jkgn1910', '2020-04-29 22:51:01');
INSERT INTO `standard_document` VALUES ('908', '春季班高二化学第6讲：有机推断1 ', '5', '11', '2', 'standard_document/04292251429745447.doc', 'standard_document/04292251429851778.doc', 'jkgn1910', '2020-04-29 22:51:42');
INSERT INTO `standard_document` VALUES ('909', '春季班高二化学第7讲：有机推断2', '5', '11', '2', 'standard_document/04292252195469170.doc', 'standard_document/04292252196960086.doc', 'jkgn1910', '2020-04-29 22:52:19');
INSERT INTO `standard_document` VALUES ('910', '春季班高二化学第8讲：有机总结', '5', '11', '2', 'standard_document/04292252538056674.doc', 'standard_document/04292252532105563.doc', 'jkgn1910', '2020-04-29 22:52:53');
INSERT INTO `standard_document` VALUES ('911', '春季班高二化学第9讲：会考复习-原子结构和元素周期', '5', '11', '2', 'standard_document/04292253449995711.doc', 'standard_document/04292253442319833.doc', 'jkgn1910', '2020-04-29 22:53:44');
INSERT INTO `standard_document` VALUES ('913', '春季班高二化学第10讲：会考复习-氧化还原和电化学', '5', '11', '2', 'standard_document/04300950542146456.doc', 'standard_document/04300950546223943.doc', 'jkgn1910', '2020-04-30 09:50:54');
INSERT INTO `standard_document` VALUES ('914', '春季班高二化学第11讲：会考复习（卤素）', '5', '11', '2', 'standard_document/04300951282280914.doc', 'standard_document/04300951282872829.doc', 'jkgn1910', '2020-04-30 09:51:28');
INSERT INTO `standard_document` VALUES ('915', '春季班高二化学第12讲：会考复习（硫氮）', '5', '11', '2', 'standard_document/04300951484577490.doc', 'standard_document/04300951484958293.doc', 'jkgn1910', '2020-04-30 09:51:48');
INSERT INTO `standard_document` VALUES ('916', '春季班八年级物理第四讲：机械功  功率', '4', '8', '2', 'standard_document/04301344451787587.doc', 'standard_document/04301344451869331.doc', 'qlyk2004', '2020-04-30 13:44:45');
INSERT INTO `standard_document` VALUES ('917', '春季班八年级物理第五讲：机械能', '4', '8', '2', 'standard_document/04301346171382178.doc', 'standard_document/04301346174713704.doc', 'qlyk2004', '2020-04-30 13:46:17');
INSERT INTO `standard_document` VALUES ('918', '春季班八年级物理第六讲：简单机械复习', '4', '8', '2', 'standard_document/04301348317935605.doc', 'standard_document/04301348312975447.doc', 'qlyk2004', '2020-04-30 13:48:31');
INSERT INTO `standard_document` VALUES ('919', '春季班八年级物理第七讲：温度温标', '4', '8', '2', 'standard_document/04301349575413940.doc', 'standard_document/04301349575808335.doc', 'qlyk2004', '2020-04-30 13:49:57');
INSERT INTO `standard_document` VALUES ('920', '春季班八年级物理第八讲：分子动理论', '4', '8', '2', 'standard_document/04301351386103621.doc', 'standard_document/04301351381512858.doc', 'qlyk2004', '2020-04-30 13:51:38');
INSERT INTO `standard_document` VALUES ('921', '春季班八年级物理第九讲：功和能复习', '4', '8', '2', 'standard_document/04301353029734430.doc', 'standard_document/04301353029854036.doc', 'qlyk2004', '2020-04-30 13:53:02');
INSERT INTO `standard_document` VALUES ('922', '春季班八年级物理第十讲：期中复习', '4', '8', '2', 'standard_document/04301354588407932.doc', 'standard_document/04301354581018219.doc', 'qlyk2004', '2020-04-30 13:54:58');
INSERT INTO `standard_document` VALUES ('923', '春季班八年级物理第十一讲：热量 比热容（一）', '4', '8', '2', 'standard_document/04301356526717262.doc', 'standard_document/04301356525308761.doc', 'qlyk2004', '2020-04-30 13:56:52');
INSERT INTO `standard_document` VALUES ('924', '春季班八年级物理第十二讲：热量 比热容（二）', '4', '8', '2', 'standard_document/04301358302812647.doc', 'standard_document/04301358301858662.doc', 'qlyk2004', '2020-04-30 13:58:30');
INSERT INTO `standard_document` VALUES ('925', '春季班八年级物理第十三讲：内能', '4', '8', '2', 'standard_document/04301400121109317.doc', 'standard_document/04301400128292850.doc', 'qlyk2004', '2020-04-30 14:00:12');
INSERT INTO `standard_document` VALUES ('926', '春季班八年级物理第十四讲：热机', '4', '8', '2', 'standard_document/04301402202310939.doc', 'standard_document/04301402208249900.doc', 'qlyk2004', '2020-04-30 14:02:20');
INSERT INTO `standard_document` VALUES ('927', '春季班八年级物理第十五讲：密度（一）', '4', '8', '2', 'standard_document/04301404364697403.doc', 'standard_document/04301404364550357.doc', 'qlyk2004', '2020-04-30 14:04:36');
INSERT INTO `standard_document` VALUES ('928', '春季班八年级物理第十六讲：密度（二）', '4', '8', '2', 'standard_document/04301406181064383.doc', 'standard_document/04301406188900712.doc', 'qlyk2004', '2020-04-30 14:06:18');
INSERT INTO `standard_document` VALUES ('929', '春季班八年级物理第十七讲：情景实验专题', '4', '8', '2', 'standard_document/04301408382732339.doc', 'standard_document/04301408385555569.doc', 'qlyk2004', '2020-04-30 14:08:38');
INSERT INTO `standard_document` VALUES ('930', '春季班八年级物理第十八讲：期末复习（一）', '4', '8', '2', 'standard_document/04301410558409583.doc', 'standard_document/04301410554363184.doc', 'qlyk2004', '2020-04-30 14:10:55');
INSERT INTO `standard_document` VALUES ('931', '春季班八年级物理第十九讲：期末复习（二）', '4', '8', '2', 'standard_document/04301413147551921.doc', 'standard_document/04301413142025519.doc', 'qlyk2004', '2020-04-30 14:13:14');
INSERT INTO `standard_document` VALUES ('932', '春季班八年级物理第二十讲：期末复习（三）', '4', '8', '2', 'standard_document/04301415355534725.doc', 'standard_document/04301415353608955.doc', 'qlyk2004', '2020-04-30 14:15:35');
INSERT INTO `standard_document` VALUES ('946', '汉语拼音 1. 学习单韵母a o e ', '1', '1', '2', 'standard_document/05020001447114293.doc', 'standard_document/05020001447902775.doc', 'vkjt1908', '2020-05-02 00:01:44');
INSERT INTO `standard_document` VALUES ('947', '汉语拼音 2.学习a o e的四声调', '1', '1', '2', 'standard_document/05020004196122685.doc', 'standard_document/05020004194099781.doc', 'vkjt1908', '2020-05-02 00:04:19');
INSERT INTO `standard_document` VALUES ('949', '汉语拼音3. 学习单韵母i u v及其四声调 ', '1', '1', '2', 'standard_document/05020010138460672.doc', 'standard_document/05020010136916281.doc', 'vkjt1908', '2020-05-02 00:10:13');
INSERT INTO `standard_document` VALUES ('950', '汉语拼音4单韵母复习', '1', '1', '2', 'standard_document/05020012204783953.doc', 'standard_document/05020012203386623.doc', 'vkjt1908', '2020-05-02 00:12:20');
INSERT INTO `standard_document` VALUES ('951', '春季班高二化学第13讲：会考复习（铁铝） ', '5', '11', '2', 'standard_document/05042319524531991.doc', 'standard_document/05042319524132987.doc', 'jkgn1910', '2020-05-04 23:19:52');
INSERT INTO `standard_document` VALUES ('952', '春季班高二化学第14讲：会考复习（化学平衡）', '5', '11', '2', 'standard_document/05042320162891451.doc', 'standard_document/05042320167000959.doc', 'jkgn1910', '2020-05-04 23:20:16');
INSERT INTO `standard_document` VALUES ('953', '春季班高二化学第15讲：会考复习（电解质）', '5', '11', '2', 'standard_document/05042320364949883.doc', 'standard_document/05042320365903198.doc', 'jkgn1910', '2020-05-04 23:20:36');
INSERT INTO `standard_document` VALUES ('954', '春季班高二化学第16讲：会考复习（盐类水解）', '5', '11', '2', 'standard_document/05042321053115130.doc', 'standard_document/05042321056259977.doc', 'jkgn1910', '2020-05-04 23:21:05');
INSERT INTO `standard_document` VALUES ('955', '春季班高二化学第17讲：会考复习（定量实验）', '5', '11', '2', 'standard_document/05042321347360583.doc', 'standard_document/05042321342569520.doc', 'jkgn1910', '2020-05-04 23:21:34');
INSERT INTO `standard_document` VALUES ('956', '春季班高二化学第18讲：会考复习（能量和简单计算） ', '5', '11', '2', 'standard_document/05042321585064891.doc', 'standard_document/05042321583335896.doc', 'jkgn1910', '2020-05-04 23:21:58');
INSERT INTO `standard_document` VALUES ('957', '春季班高二化学第19讲：合格考模拟试卷01', '5', '11', '2', 'standard_document/05042322269140406.doc', 'standard_document/05042322267564797.doc', 'jkgn1910', '2020-05-04 23:22:26');
INSERT INTO `standard_document` VALUES ('958', '春季班高二化学第20讲：合格考模拟试卷03 ', '5', '11', '2', 'standard_document/05042323198851968.doc', 'standard_document/05042323196962097.doc', 'jkgn1910', '2020-05-04 23:23:19');
INSERT INTO `standard_document` VALUES ('966', '春季班二年级英语第十讲：期中测试', '3', '2', '2', 'standard_document/05051312501946142.doc', 'standard_document/05051312508876939.doc', 'neck1908', '2020-05-05 13:12:50');
INSERT INTO `standard_document` VALUES ('967', '春季班二年级英语第十一讲：M3U2 Rules', '3', '2', '2', 'standard_document/05051313281817626.doc', 'standard_document/05051313282187986.doc', 'neck1908', '2020-05-05 13:13:28');
INSERT INTO `standard_document` VALUES ('968', '春季班二年级英语第十二讲：M3U3 My clothes', '3', '2', '2', 'standard_document/05051313589089162.doc', 'standard_document/05051313583608800.doc', 'neck1908', '2020-05-05 13:13:58');
INSERT INTO `standard_document` VALUES ('969', '春季班二年级英语第十三讲：Module3复习', '3', '2', '2', 'standard_document/05051314261401889.doc', 'standard_document/05051314267190844.doc', 'neck1908', '2020-05-05 13:14:26');
INSERT INTO `standard_document` VALUES ('970', '春季班二年级英语第十四讲：M4U1  Activities', '3', '2', '2', 'standard_document/05051315045436854.doc', 'standard_document/05051315045042036.doc', 'neck1908', '2020-05-05 13:15:04');
INSERT INTO `standard_document` VALUES ('971', '春季班二年级英语第十五讲：M4U2 Mother s Day', '3', '2', '2', 'standard_document/05051315396371381.doc', 'standard_document/05051315397476876.doc', 'neck1908', '2020-05-05 13:15:39');
INSERT INTO `standard_document` VALUES ('972', '春季班二年级英语第十六讲：M4U3  Story time', '3', '2', '2', 'standard_document/05051316138759037.doc', 'standard_document/05051316134861049.doc', 'neck1908', '2020-05-05 13:16:13');
INSERT INTO `standard_document` VALUES ('973', '春季班二年级英语第十七讲：Module4复习', '3', '2', '2', 'standard_document/05051317166886141.doc', 'standard_document/05051317166931612.doc', 'neck1908', '2020-05-05 13:17:16');
INSERT INTO `standard_document` VALUES ('974', '春季班二年级英语第十八讲：复习一', '3', '2', '2', 'standard_document/05051318117031278.doc', 'standard_document/05051318111506918.doc', 'neck1908', '2020-05-05 13:18:11');
INSERT INTO `standard_document` VALUES ('975', '春季班二年级英语第十九讲：人称代词考点总结', '3', '2', '2', 'standard_document/05051318553137484.doc', 'standard_document/05051318553665115.doc', 'neck1908', '2020-05-05 13:18:55');
INSERT INTO `standard_document` VALUES ('976', '春季班二年级英语第二十讲：期末测试', '3', '2', '2', 'standard_document/05051319206763699.doc', 'standard_document/05051319206398567.doc', 'neck1908', '2020-05-05 13:19:20');
INSERT INTO `standard_document` VALUES ('977', '高一秋季班第1讲：时态复习（一）', '3', '10', '1', 'standard_document/05052231243954460.doc', 'standard_document/05052231241695377.docx', 'bpsn2001', '2020-05-05 22:31:24');
INSERT INTO `standard_document` VALUES ('978', '高一秋季班第2讲： 时态复习（二）', '3', '10', '1', 'standard_document/05052232382071483.doc', 'standard_document/05052232388974833.docx', 'bpsn2001', '2020-05-05 22:32:38');
INSERT INTO `standard_document` VALUES ('979', '秋季班高一英语第3讲：时态复习（三）', '3', '10', '1', 'standard_document/05052242105160434.doc', 'standard_document/05052242107022819.docx', 'bpsn2001', '2020-05-05 22:42:10');
INSERT INTO `standard_document` VALUES ('982', '秋季班高一英语第5讲：句子成分（二）', '3', '10', '1', 'standard_document/05052247323666478.doc', 'standard_document/05052247322193497.docx', 'bpsn2001', '2020-05-05 22:47:32');
INSERT INTO `standard_document` VALUES ('983', '秋季班高一英语第6讲：句子成分（三）', '3', '10', '1', 'standard_document/05052249065981681.doc', 'standard_document/05052249061908332.docx', 'bpsn2001', '2020-05-05 22:49:06');
INSERT INTO `standard_document` VALUES ('984', '秋季班高一英语第7讲:被动语态（一）', '3', '10', '1', 'standard_document/05052250551043684.doc', 'standard_document/05052250553994131.docx', 'bpsn2001', '2020-05-05 22:50:55');
INSERT INTO `standard_document` VALUES ('985', '秋季班高一英语第8讲： 被动语态（二）', '3', '10', '1', 'standard_document/05052255151995947.doc', 'standard_document/05052255159748547.docx', 'bpsn2001', '2020-05-05 22:55:15');
INSERT INTO `standard_document` VALUES ('986', '秋季班高一英语第9讲：被动语态（三）', '3', '10', '1', 'standard_document/05052256156109117.doc', 'standard_document/05052256153063864.docx', 'bpsn2001', '2020-05-05 22:56:15');
INSERT INTO `standard_document` VALUES ('987', '秋季班高一英语第10讲：期中测评试卷', '3', '10', '1', 'standard_document/05052258346829370.doc', 'standard_document/05052258343357014.docx', 'bpsn2001', '2020-05-05 22:58:34');
INSERT INTO `standard_document` VALUES ('988', '秋季班高一英语第4讲：句子成分（一）', '3', '10', '1', 'standard_document/05052306395071977.doc', 'standard_document/05052306393933627.docx', 'bpsn2001', '2020-05-05 23:06:39');
INSERT INTO `standard_document` VALUES ('989', '秋季班高一英语第11讲：状语从句（一）', '3', '10', '1', 'standard_document/05052314206888276.doc', 'standard_document/05052314205844405.docx', 'bpsn2001', '2020-05-05 23:14:20');
INSERT INTO `standard_document` VALUES ('990', '秋季班高一英语第12讲： 状语从句（二）', '3', '10', '1', 'standard_document/05052316029265992.doc', 'standard_document/05052316021054551.docx', 'bpsn2001', '2020-05-05 23:16:02');
INSERT INTO `standard_document` VALUES ('991', '秋季班高一英语第13讲：状语从句（三）', '3', '10', '1', 'standard_document/05052318118690544.doc', 'standard_document/05052318119379077.docx', 'bpsn2001', '2020-05-05 23:18:11');
INSERT INTO `standard_document` VALUES ('992', '秋季班高一英语第14讲：情态动词（一）', '3', '10', '1', 'standard_document/05052319251970877.doc', 'standard_document/05052319254176078.docx', 'bpsn2001', '2020-05-05 23:19:25');
INSERT INTO `standard_document` VALUES ('994', '秋季班高一英语第15讲：情态动词（二）', '3', '10', '1', 'standard_document/05052324056212761.doc', 'standard_document/05052324054222323.docx', 'bpsn2001', '2020-05-05 23:24:05');
INSERT INTO `standard_document` VALUES ('995', '秋季班高一英语第16讲：情态动词（二）', '3', '10', '1', 'standard_document/05052326406521968.doc', 'standard_document/05052326407994982.docx', 'bpsn2001', '2020-05-05 23:26:40');
INSERT INTO `standard_document` VALUES ('996', '秋季班高一英语第17讲：定语从句（一）', '3', '10', '1', 'standard_document/05052330173532449.doc', 'standard_document/05052330173304690.docx', 'bpsn2001', '2020-05-05 23:30:17');
INSERT INTO `standard_document` VALUES ('997', '秋季班高一英语第18讲:定语从句（二）', '3', '10', '1', 'standard_document/05052332036915781.doc', 'standard_document/05052332037362854.docx', 'bpsn2001', '2020-05-05 23:32:03');
INSERT INTO `standard_document` VALUES ('998', '秋季班高一英语第19讲：定语从句（三）', '3', '10', '1', 'standard_document/05052337071846581.doc', 'standard_document/05052337071154337.docx', 'bpsn2001', '2020-05-05 23:37:07');
INSERT INTO `standard_document` VALUES ('1000', '秋季班高一英语第20讲 期末测评试卷', '3', '10', '1', 'standard_document/05052338271591714.doc', 'standard_document/05052338277224152.docx', 'bpsn2001', '2020-05-05 23:38:27');
INSERT INTO `standard_document` VALUES ('1001', '汉语拼音 5学习声母b p.', '1', '1', '2', 'standard_document/05061452402506861.doc', 'standard_document/05061452407882007.doc', 'vkjt1908', '2020-05-06 14:52:40');
INSERT INTO `standard_document` VALUES ('1002', '汉语拼音 6.学习声母m f ', '1', '1', '2', 'standard_document/05061454154996114.doc', 'standard_document/05061454152350758.doc', 'vkjt1908', '2020-05-06 14:54:15');
INSERT INTO `standard_document` VALUES ('1003', '汉语拼音7.学习声母d t ', '1', '1', '2', 'standard_document/05061457246317156.doc', 'standard_document/05061457241958080.doc', 'vkjt1908', '2020-05-06 14:57:24');
INSERT INTO `standard_document` VALUES ('1004', '汉语拼音 8.学习声母n l ', '1', '1', '2', 'standard_document/05061514122395950.doc', 'standard_document/05061514125268365.doc', 'vkjt1908', '2020-05-06 15:14:12');
INSERT INTO `standard_document` VALUES ('1005', '汉语拼音 9.复习声母b p m f d t n l及三拼音 ', '1', '1', '2', 'standard_document/05061517264241394.doc', 'standard_document/05061517267895719.doc', 'vkjt1908', '2020-05-06 15:17:26');
INSERT INTO `standard_document` VALUES ('1006', '汉语拼音10.学习声母g k h4', '1', '1', '2', 'standard_document/05061520564136020.doc', 'standard_document/05061520561345243.doc', 'vkjt1908', '2020-05-06 15:20:56');
INSERT INTO `standard_document` VALUES ('1007', '汉语拼音11.学习声母jqxdoc', '1', '1', '2', 'standard_document/05061523002705040.doc', 'standard_document/05061523003124063.doc', 'vkjt1908', '2020-05-06 15:23:00');
INSERT INTO `standard_document` VALUES ('1008', '汉语拼音 12.学习声母z c s', '1', '1', '2', 'standard_document/05061526486572746.doc', 'standard_document/05061526482295124.doc', 'vkjt1908', '2020-05-06 15:26:48');
INSERT INTO `standard_document` VALUES ('1009', '汉语拼音13.学习声母zh ch sh r ', '1', '1', '2', 'standard_document/05061528248172921.doc', 'standard_document/05061528249602561.doc', 'vkjt1908', '2020-05-06 15:28:24');
INSERT INTO `standard_document` VALUES ('1010', '汉语拼音14学习声母y、w ', '1', '1', '2', 'standard_document/05061530374555326.doc', 'standard_document/05061530371820900.doc', 'vkjt1908', '2020-05-06 15:30:37');
INSERT INTO `standard_document` VALUES ('1011', '汉语拼音15.声母复习', '1', '1', '2', 'standard_document/05061532264589386.doc', 'standard_document/05061532263480509.doc', 'vkjt1908', '2020-05-06 15:32:26');
INSERT INTO `standard_document` VALUES ('1012', '汉语拼音 16.学习整体认读音节zhi chi shi ri', '1', '1', '2', 'standard_document/05061534044103470.doc', 'standard_document/05061534045017125.doc', 'vkjt1908', '2020-05-06 15:34:04');
INSERT INTO `standard_document` VALUES ('1013', '汉语拼音 17.学习整体认读音节zi ci si ', '1', '1', '2', 'standard_document/05061536054786630.doc', 'standard_document/05061536052273981.doc', 'vkjt1908', '2020-05-06 15:36:05');
INSERT INTO `standard_document` VALUES ('1014', '汉语拼音18学习整体认读yi、wi ', '1', '1', '2', 'standard_document/05061537431004671.doc', 'standard_document/05061537431489498.doc', 'vkjt1908', '2020-05-06 15:37:43');
INSERT INTO `standard_document` VALUES ('1015', '汉语拼音19学习复韵母ai ei ui ', '1', '1', '2', 'standard_document/05061541026151780.doc', 'standard_document/05061541023293729.doc', 'vkjt1908', '2020-05-06 15:41:02');
INSERT INTO `standard_document` VALUES ('1016', '汉语拼音20学习复韵母ao ou iu', '1', '1', '2', 'standard_document/05061543243693226.doc', 'standard_document/05061543244211728.doc', 'vkjt1908', '2020-05-06 15:43:24');
INSERT INTO `standard_document` VALUES ('1017', '汉语拼21学习复韵母ie üe er', '1', '1', '2', 'standard_document/05061544527387682.doc', 'standard_document/05061544521373692.doc', 'vkjt1908', '2020-05-06 15:44:52');
INSERT INTO `standard_document` VALUES ('1018', '汉语拼22复习复韵母ai ei ui ao ou ui ie ue er', '1', '1', '2', 'standard_document/05061546085016705.doc', 'standard_document/05061546086309809.doc', 'vkjt1908', '2020-05-06 15:46:08');
INSERT INTO `standard_document` VALUES ('1019', '汉语拼音23学习韵母an en in un vn', '1', '1', '2', 'standard_document/05061547574625039.doc', 'standard_document/05061547578090196.doc', 'vkjt1908', '2020-05-06 15:47:57');
INSERT INTO `standard_document` VALUES ('1020', '汉语拼音24学习后鼻韵母ang eng ing ong', '1', '1', '2', 'standard_document/05061549332925699.doc', 'standard_document/05061549332004355.doc', 'vkjt1908', '2020-05-06 15:49:33');
INSERT INTO `standard_document` VALUES ('1021', '汉语拼音25学习鼻韵母复习', '1', '1', '2', 'standard_document/05061551416539802.doc', 'standard_document/05061551419055585.doc', 'vkjt1908', '2020-05-06 15:51:41');
INSERT INTO `standard_document` VALUES ('1022', '汉语拼音26整体认读ye-ying ', '1', '1', '2', 'standard_document/05061553105152451.doc', 'standard_document/05061553106666954.doc', 'vkjt1908', '2020-05-06 15:53:10');
INSERT INTO `standard_document` VALUES ('1023', '汉语拼音27整理复习（一）', '1', '1', '2', 'standard_document/05061555009002929.doc', 'standard_document/05061555005875912.doc', 'vkjt1908', '2020-05-06 15:55:00');
INSERT INTO `standard_document` VALUES ('1024', '汉语拼音28整理复习（二）', '1', '1', '2', 'standard_document/05061556473523298.doc', 'standard_document/05061556471149134.doc', 'vkjt1908', '2020-05-06 15:56:47');
INSERT INTO `standard_document` VALUES ('1025', '汉语拼音29整理复习（三）', '1', '1', '2', 'standard_document/05061558039346049.doc', 'standard_document/05061558032562246.doc', 'vkjt1908', '2020-05-06 15:58:03');
INSERT INTO `standard_document` VALUES ('1026', '汉语拼音30整理复习（四）和试题', '1', '1', '2', 'standard_document/05061559167314022.doc', 'standard_document/05061559165976805.doc', 'vkjt1908', '2020-05-06 15:59:16');
INSERT INTO `standard_document` VALUES ('1028', '秋季班高二年级数学第十一讲：曲线方程', '2', '11', '1', 'standard_document/05091406506716881.doc', 'standard_document/05091406504089064.doc', 'rbyj1908', '2020-05-09 14:06:50');
INSERT INTO `standard_document` VALUES ('1029', '秋季班高二年级数学第十二讲：椭圆方程', '2', '11', '1', 'standard_document/05091410407191768.doc', 'standard_document/05091410407854871.doc', 'rbyj1908', '2020-05-09 14:10:40');
INSERT INTO `standard_document` VALUES ('1030', '春季班一年级数学第11讲：上、中、下、左、右', '2', '1', '2', 'standard_document/05121345415907803.doc', 'standard_document/05121345416158566.doc', 'dsix1908', '2020-05-12 13:45:41');
INSERT INTO `standard_document` VALUES ('1031', '春季班一年级数学第12讲：长度比较与度量', '2', '1', '2', 'standard_document/05121346459038724.doc', 'standard_document/05121346452551378.doc', 'dsix1908', '2020-05-12 13:46:45');
INSERT INTO `standard_document` VALUES ('1032', '秋季班九年级物理第一讲：压力与压强', '4', '9', '1', 'standard_document/05121626303288712.doc', 'standard_document/05121626301516639.doc', 'qlyk2004', '2020-05-12 16:26:30');
INSERT INTO `standard_document` VALUES ('1033', '秋季班九年级物理第二讲：固体压强变化', '4', '9', '1', 'standard_document/05121630383524708.doc', 'standard_document/05121630381117726.doc', 'qlyk2004', '2020-05-12 16:30:38');
INSERT INTO `standard_document` VALUES ('1034', '秋季班九年级物理第三讲：液体压强（一）', '4', '9', '1', 'standard_document/05121633011296185.doc', 'standard_document/05121633018171661.doc', 'qlyk2004', '2020-05-12 16:33:01');
INSERT INTO `standard_document` VALUES ('1035', '秋季班九年级物理第四讲：液体压强（二）', '4', '9', '1', 'standard_document/05121635302172043.doc', 'standard_document/05121635309029211.doc', 'qlyk2004', '2020-05-12 16:35:30');
INSERT INTO `standard_document` VALUES ('1036', '秋季班九年级物理第五讲：固体、液体压强选择', '4', '9', '1', 'standard_document/05121638108810043.doc', 'standard_document/05121638105949179.doc', 'qlyk2004', '2020-05-12 16:38:10');
INSERT INTO `standard_document` VALUES ('1037', '秋季班九年级物理第六讲：固液压强综合计算', '4', '9', '1', 'standard_document/05121641103870064.doc', 'standard_document/05121641105445909.doc', 'qlyk2004', '2020-05-12 16:41:10');
INSERT INTO `standard_document` VALUES ('1038', '秋季班九年级物理第七讲：浮力', '4', '9', '1', 'standard_document/05121643063652501.doc', 'standard_document/05121643069885587.doc', 'qlyk2004', '2020-05-12 16:43:06');
INSERT INTO `standard_document` VALUES ('1039', '秋季班九年级物理第八讲：浮力的应用', '4', '9', '1', 'standard_document/05121646105953782.doc', 'standard_document/05121646106290540.doc', 'qlyk2004', '2020-05-12 16:46:10');
INSERT INTO `standard_document` VALUES ('1040', '秋季班九年级物理第九讲：大气压强', '4', '9', '1', 'standard_document/05121648223108220.doc', 'standard_document/05121648221673018.doc', 'qlyk2004', '2020-05-12 16:48:22');
INSERT INTO `standard_document` VALUES ('1041', '秋季班九年级物理第十讲：期中复习', '4', '9', '1', 'standard_document/05121651143896786.doc', 'standard_document/05121651144808235.doc', 'qlyk2004', '2020-05-12 16:51:14');
INSERT INTO `standard_document` VALUES ('1042', '春季班一年级数学第13讲：线段', '2', '1', '2', 'standard_document/05131343025118300.doc', 'standard_document/05131343022014752.doc', 'dsix1908', '2020-05-13 13:43:02');
INSERT INTO `standard_document` VALUES ('1043', '春季班一年级数学第14讲：百数表', '2', '1', '2', 'standard_document/05131344211374999.doc', 'standard_document/05131344212632936.doc', 'dsix1908', '2020-05-13 13:44:21');
INSERT INTO `standard_document` VALUES ('1044', '春季班高二（下）英语第一讲： 倒装句（一）', '3', '11', '2', 'standard_document/05131438023549581.doc', 'standard_document/05131438028229818.doc', 'qgaz2004', '2020-05-13 14:38:02');
INSERT INTO `standard_document` VALUES ('1045', '秋季班九年级物理第十一讲：简单电路', '4', '9', '1', 'standard_document/05131517247204911.doc', 'standard_document/05131517245667775.doc', 'qlyk2004', '2020-05-13 15:17:24');
INSERT INTO `standard_document` VALUES ('1046', '秋季班九年级物理第十二讲：电流', '4', '9', '1', 'standard_document/05131519349573538.doc', 'standard_document/05131519346556455.doc', 'qlyk2004', '2020-05-13 15:19:34');
INSERT INTO `standard_document` VALUES ('1047', '秋季班九年级物理第十三讲：电压', '4', '9', '1', 'standard_document/05131521516375162.doc', 'standard_document/05131521511567350.doc', 'qlyk2004', '2020-05-13 15:21:51');
INSERT INTO `standard_document` VALUES ('1048', '秋季班九年级物理第十四讲：电阻', '4', '9', '1', 'standard_document/05131524101525923.doc', 'standard_document/05131524107333107.doc', 'qlyk2004', '2020-05-13 15:24:10');
INSERT INTO `standard_document` VALUES ('1049', '秋季班九年级物理第十五讲：欧姆定律', '4', '9', '1', 'standard_document/05131526199986339.doc', 'standard_document/05131526192318701.doc', 'qlyk2004', '2020-05-13 15:26:19');
INSERT INTO `standard_document` VALUES ('1050', '秋季班九年级物理第十六讲：串联电路', '4', '9', '1', 'standard_document/05131528399090038.doc', 'standard_document/05131528399662759.doc', 'qlyk2004', '2020-05-13 15:28:39');
INSERT INTO `standard_document` VALUES ('1051', '秋季班九年级物理第十七讲：并联电路', '4', '9', '1', 'standard_document/05131530473351101.doc', 'standard_document/05131530471972937.doc', 'qlyk2004', '2020-05-13 15:30:47');
INSERT INTO `standard_document` VALUES ('1052', '秋季班九年级物理第十八讲：电学复习', '4', '9', '1', 'standard_document/05131533119294748.doc', 'standard_document/05131533111948473.doc', 'qlyk2004', '2020-05-13 15:33:11');
INSERT INTO `standard_document` VALUES ('1053', '秋季班高二化学第1讲：金属键、铁及其化合物的性质 ', '5', '11', '1', 'standard_document/05131824337155847.doc', 'standard_document/05131824336904168.doc', 'jkgn1910', '2020-05-13 18:24:33');
INSERT INTO `standard_document` VALUES ('1054', '秋季班高二化学第2讲：铝和铝的化合物', '5', '11', '1', 'standard_document/05131825177837172.doc', 'standard_document/05131825178635053.doc', 'jkgn1910', '2020-05-13 18:25:17');
INSERT INTO `standard_document` VALUES ('1055', '秋季班高二化学第3讲：铝的图像', '5', '11', '1', 'standard_document/05131826216213748.doc', 'standard_document/05131826218305984.doc', 'jkgn1910', '2020-05-13 18:26:21');
INSERT INTO `standard_document` VALUES ('1056', '秋季班高二化学第4讲：金属的实验 ', '5', '11', '1', 'standard_document/05131828007128417.doc', 'standard_document/05131828002437860.doc', 'jkgn1910', '2020-05-13 18:28:00');
INSERT INTO `standard_document` VALUES ('1057', '秋季班高二化学第5讲：金属铁铝的计算', '5', '11', '1', 'standard_document/05131828484853002.doc', 'standard_document/05131828481362776.doc', 'jkgn1910', '2020-05-13 18:28:48');
INSERT INTO `standard_document` VALUES ('1058', '秋季班高二化学第6讲：金属钠', '5', '11', '1', 'standard_document/05131829367165536.doc', 'standard_document/05131829361225333.doc', 'jkgn1910', '2020-05-13 18:29:36');
INSERT INTO `standard_document` VALUES ('1059', '秋季班高二化学第7讲：钠的化合物', '5', '11', '1', 'standard_document/05131830302343575.doc', 'standard_document/05131830306416628.doc', 'jkgn1910', '2020-05-13 18:30:30');
INSERT INTO `standard_document` VALUES ('1060', '秋季班高二化学第8讲：元素周期表', '5', '11', '1', 'standard_document/05131831322370160.doc', 'standard_document/05131831326365410.doc', 'jkgn1910', '2020-05-13 18:31:32');
INSERT INTO `standard_document` VALUES ('1061', '秋季班高二化学第9讲：元素周期律的应用', '5', '11', '1', 'standard_document/05131832562215529.doc', 'standard_document/05131832563561437.doc', 'jkgn1910', '2020-05-13 18:32:56');
INSERT INTO `standard_document` VALUES ('1062', '秋季班高二化学第10讲：期中复习', '5', '11', '1', 'standard_document/05131834099078524.doc', 'standard_document/05131834091580154.doc', 'jkgn1910', '2020-05-13 18:34:09');
INSERT INTO `standard_document` VALUES ('1063', '秋季班高二化学第11讲：1mol气体体积的测定', '5', '11', '1', 'standard_document/05131834449264598.doc', 'standard_document/05131834445870431.doc', 'jkgn1910', '2020-05-13 18:34:44');
INSERT INTO `standard_document` VALUES ('1064', '秋季班高二化学第12讲：结晶水含量的测定', '5', '11', '1', 'standard_document/05131835211453210.doc', 'standard_document/05131835213498575.doc', 'jkgn1910', '2020-05-13 18:35:21');
INSERT INTO `standard_document` VALUES ('1065', '秋季班高二化学第13讲：酸碱滴定', '5', '11', '1', 'standard_document/05131836029100283.doc', 'standard_document/05131836022629115.doc', 'jkgn1910', '2020-05-13 18:36:02');
INSERT INTO `standard_document` VALUES ('1066', '秋季班高二化学第14讲：离子检验', '5', '11', '1', 'standard_document/05131836442572436.doc', 'standard_document/05131836446755461.doc', 'jkgn1910', '2020-05-13 18:36:44');
INSERT INTO `standard_document` VALUES ('1067', '秋季班高二化学第15讲：甲烷和烷烃', '5', '11', '1', 'standard_document/05131837404541788.doc', 'standard_document/05131837406637385.doc', 'jkgn1910', '2020-05-13 18:37:40');
INSERT INTO `standard_document` VALUES ('1068', '秋季班高二化学第16讲：同分异构和有机物命名', '5', '11', '1', 'standard_document/05131838277840822.doc', 'standard_document/05131838277027907.doc', 'jkgn1910', '2020-05-13 18:38:27');
INSERT INTO `standard_document` VALUES ('1069', '秋季班高二化学第17讲：乙烯和烯烃', '5', '11', '1', 'standard_document/05131839475661764.doc', 'standard_document/05131839473584792.doc', 'jkgn1910', '2020-05-13 18:39:47');
INSERT INTO `standard_document` VALUES ('1070', '秋季班高二化学第18讲：乙炔和炔烃', '5', '11', '1', 'standard_document/05131840563957540.doc', 'standard_document/05131840568069019.doc', 'jkgn1910', '2020-05-13 18:40:56');
INSERT INTO `standard_document` VALUES ('1071', '秋季班高二化学第19讲：期末复习（一）', '5', '11', '1', 'standard_document/05131842031336211.doc', 'standard_document/05131842031744870.doc', 'jkgn1910', '2020-05-13 18:42:03');
INSERT INTO `standard_document` VALUES ('1072', '秋季班高二化学第20讲：期末复习（二）', '5', '11', '1', 'standard_document/05131842497915242.doc', 'standard_document/05131842493305414.doc', 'jkgn1910', '2020-05-13 18:42:49');
INSERT INTO `standard_document` VALUES ('1073', '春季班一年级数学第15讲：两位数的加减法复习', '2', '1', '2', 'standard_document/05141555099743215.doc', 'standard_document/05141555094656543.doc', 'dsix1908', '2020-05-14 15:55:09');
INSERT INTO `standard_document` VALUES ('1074', '春季班一年级数学第16讲：交换&各人眼中的20', '2', '1', '2', 'standard_document/05141556275878393.doc', 'standard_document/05141556276372065.doc', 'dsix1908', '2020-05-14 15:56:27');
INSERT INTO `standard_document` VALUES ('1075', '春季班高二（下）英语第二讲： 倒装句（二）', '3', '11', '2', 'standard_document/05151400576959397.doc', 'standard_document/05151400573585995.doc', 'qgaz2004', '2020-05-15 14:00:57');
INSERT INTO `standard_document` VALUES ('1076', '春季班高二（下）英语第三讲： 倒装句（三）', '3', '11', '2', 'standard_document/05151401576843502.doc', 'standard_document/05151401573643946.doc', 'qgaz2004', '2020-05-15 14:01:57');
INSERT INTO `standard_document` VALUES ('1077', '春季班高二（下）英语第四讲： 同位语从句（一）', '3', '11', '2', 'standard_document/05151403034219261.doc', 'standard_document/05151403038903614.doc', 'qgaz2004', '2020-05-15 14:03:03');
INSERT INTO `standard_document` VALUES ('1078', '春季班高二（下）英语第五讲： 同位语从句（二）', '3', '11', '2', 'standard_document/05151404351866788.doc', 'standard_document/05151404357216582.doc', 'qgaz2004', '2020-05-15 14:04:35');
INSERT INTO `standard_document` VALUES ('1079', '春季班高二（下）英语第六讲： 同位语从句（三）', '3', '11', '2', 'standard_document/05151406034506789.doc', 'standard_document/05151406034103534.doc', 'qgaz2004', '2020-05-15 14:06:03');
INSERT INTO `standard_document` VALUES ('1080', '春季班高二（下）英语第七讲： 主语从句 （一）', '3', '11', '2', 'standard_document/05151407155558242.doc', 'standard_document/05151407159703661.doc', 'qgaz2004', '2020-05-15 14:07:15');
INSERT INTO `standard_document` VALUES ('1081', '春季班高二（下）英语第八讲： 主语从句 （二）', '3', '11', '2', 'standard_document/05151408521356602.doc', 'standard_document/05151408527393868.doc', 'qgaz2004', '2020-05-15 14:08:52');
INSERT INTO `standard_document` VALUES ('1082', '春季班高二（下）英语第九讲： 主语从句 （三）', '3', '11', '2', 'standard_document/05151411582722197.doc', 'standard_document/05151411589172914.doc', 'qgaz2004', '2020-05-15 14:11:58');
INSERT INTO `standard_document` VALUES ('1083', '春季班高二（下）英语第十讲： 高二（下）期中测评试卷', '3', '11', '2', 'standard_document/05151413491901555.doc', 'standard_document/05151413491344060.doc', 'qgaz2004', '2020-05-15 14:13:49');
INSERT INTO `standard_document` VALUES ('1084', '秋季班九年级物理第十九讲：期末复习（一）', '4', '9', '1', 'standard_document/05151417219690910.doc', 'standard_document/05151417211021222.doc', 'qlyk2004', '2020-05-15 14:17:21');
INSERT INTO `standard_document` VALUES ('1085', '春季班高二（下）英语第十一讲： 情态动词（一）', '3', '11', '2', 'standard_document/05151417271046630.doc', 'standard_document/05151417276646586.doc', 'qgaz2004', '2020-05-15 14:17:27');
INSERT INTO `standard_document` VALUES ('1086', '春季班高二（下）英语第十二讲： 情态动词（二）', '3', '11', '2', 'standard_document/05151418192841292.doc', 'standard_document/05151418194813538.doc', 'qgaz2004', '2020-05-15 14:18:19');
INSERT INTO `standard_document` VALUES ('1087', '春季班高二（下）英语第十三讲： 情态动词 （三）', '3', '11', '2', 'standard_document/05151421155624449.doc', 'standard_document/05151421153503505.doc', 'qgaz2004', '2020-05-15 14:21:15');
INSERT INTO `standard_document` VALUES ('1088', '春季班高二（下）英语第十四讲： Living in Harmony  (一）', '3', '11', '2', 'standard_document/05151422106276889.doc', 'standard_document/05151422107696062.doc', 'qgaz2004', '2020-05-15 14:22:10');
INSERT INTO `standard_document` VALUES ('1089', '春季班高二（下）英语第十五讲： Living in Harmony (二）', '3', '11', '2', 'standard_document/05151423197693664.doc', 'standard_document/05151423193714835.doc', 'qgaz2004', '2020-05-15 14:23:19');
INSERT INTO `standard_document` VALUES ('1090', '春季班高二（下）英语第十六讲：  Living in Harmony  (三）', '3', '11', '2', 'standard_document/05151424109223398.doc', 'standard_document/05151424109576405.doc', 'qgaz2004', '2020-05-15 14:24:10');
INSERT INTO `standard_document` VALUES ('1091', '春季班高二（下）英语第十七讲： Problems and Solutions （', '3', '11', '2', 'standard_document/05151425203559021.doc', 'standard_document/05151425206595803.doc', 'qgaz2004', '2020-05-15 14:25:20');
INSERT INTO `standard_document` VALUES ('1092', '春季班高二（下）英语第十八讲：  Problems and Solutions ', '3', '11', '2', 'standard_document/05151426152080713.doc', 'standard_document/05151426158294460.doc', 'qgaz2004', '2020-05-15 14:26:15');
INSERT INTO `standard_document` VALUES ('1093', '春季班高二（下）英语第十九讲： Problems and Solutions （', '3', '11', '2', 'standard_document/05151428049474074.doc', 'standard_document/05151428049408146.doc', 'qgaz2004', '2020-05-15 14:28:04');
INSERT INTO `standard_document` VALUES ('1094', '春季班高二（下）英语第二十讲： 期末测评试卷', '3', '11', '2', 'standard_document/05151428538427686.doc', 'standard_document/05151428531913316.doc', 'qgaz2004', '2020-05-15 14:28:53');
INSERT INTO `standard_document` VALUES ('1095', '秋季班高二（上）英语第一讲： 目的状语（一）', '3', '11', '1', 'standard_document/05151432353803679.doc', 'standard_document/05151432357686228.doc', 'qgaz2004', '2020-05-15 14:32:35');
INSERT INTO `standard_document` VALUES ('1096', '秋季班高二（上）英语第二讲： 目的状语（二）', '3', '11', '1', 'standard_document/05151433257744953.doc', 'standard_document/05151433259192828.doc', 'qgaz2004', '2020-05-15 14:33:25');
INSERT INTO `standard_document` VALUES ('1097', '秋季班高二（上）英语第三讲： 目的状语 （三）', '3', '11', '1', 'standard_document/05151435058731725.doc', 'standard_document/05151435059354181.doc', 'qgaz2004', '2020-05-15 14:35:05');
INSERT INTO `standard_document` VALUES ('1098', '秋季班高二（上）英语第四讲： 现在完成进行时 （一）', '3', '11', '1', 'standard_document/05151435542892741.doc', 'standard_document/05151435546509399.doc', 'qgaz2004', '2020-05-15 14:35:54');
INSERT INTO `standard_document` VALUES ('1099', '秋季班高二（上）英语第五讲： 现在完成进行时 （二）', '3', '11', '1', 'standard_document/05151436511155251.doc', 'standard_document/05151436519744062.doc', 'qgaz2004', '2020-05-15 14:36:51');
INSERT INTO `standard_document` VALUES ('1100', '秋季班高二（上）英语第六讲：  现在完成进行时 （三）', '3', '11', '1', 'standard_document/05151438118741470.doc', 'standard_document/05151438118512951.doc', 'qgaz2004', '2020-05-15 14:38:11');
INSERT INTO `standard_document` VALUES ('1101', '秋季班高二（上）英语第七讲： 定语从句（一）', '3', '11', '1', 'standard_document/05151440591502119.doc', 'standard_document/05151440591916253.doc', 'qgaz2004', '2020-05-15 14:40:59');
INSERT INTO `standard_document` VALUES ('1102', '秋季班高二（上）英语第八讲： 定语从句 （二）', '3', '11', '1', 'standard_document/05151441457454708.doc', 'standard_document/05151441451435801.doc', 'qgaz2004', '2020-05-15 14:41:45');
INSERT INTO `standard_document` VALUES ('1103', '秋季班高二（上）英语第九讲：  定语从句 （三）', '3', '11', '1', 'standard_document/05151442317063285.doc', 'standard_document/05151442318490164.doc', 'qgaz2004', '2020-05-15 14:42:31');
INSERT INTO `standard_document` VALUES ('1104', '秋季班高二（上）英语第十讲：  高二（上）期中测评试卷', '3', '11', '1', 'standard_document/05151443149849248.doc', 'standard_document/05151443145870470.doc', 'qgaz2004', '2020-05-15 14:43:14');
INSERT INTO `standard_document` VALUES ('1107', '秋季班高二（上）英语第十二讲： 过去分词 （二）', '3', '11', '1', 'standard_document/05151448176535541.doc', 'standard_document/05151448175750228.doc', 'qgaz2004', '2020-05-15 14:48:17');
INSERT INTO `standard_document` VALUES ('1108', '秋季班九年级物理第二十讲：期末复习（二）', '4', '9', '1', 'standard_document/05151448187649824.doc', 'standard_document/05151448185869144.doc', 'qlyk2004', '2020-05-15 14:48:18');
INSERT INTO `standard_document` VALUES ('1109', '秋季班高二（上）英语第十一讲： 过去分词 （一）', '3', '11', '1', 'standard_document/05151449188807029.doc', 'standard_document/05151449181467210.doc', 'qgaz2004', '2020-05-15 14:49:18');
INSERT INTO `standard_document` VALUES ('1110', '秋季班高二（上）英语第十三讲： 过去分词 （三）', '3', '11', '1', 'standard_document/05151450049002598.doc', 'standard_document/05151450046373501.doc', 'qgaz2004', '2020-05-15 14:50:04');
INSERT INTO `standard_document` VALUES ('1111', '秋季班高二（上）英语第十四讲： 非谓语复习 （一）', '3', '11', '1', 'standard_document/05151450509177186.doc', 'standard_document/05151450503317627.doc', 'qgaz2004', '2020-05-15 14:50:50');
INSERT INTO `standard_document` VALUES ('1112', '秋季班高二（上）英语第十五讲： 非谓语复习 （二）', '3', '11', '1', 'standard_document/05151451439870441.doc', 'standard_document/05151451434141128.doc', 'qgaz2004', '2020-05-15 14:51:43');
INSERT INTO `standard_document` VALUES ('1113', '秋季班高二（上）英语第十六讲：  非谓语复习 （三）', '3', '11', '1', 'standard_document/05151452379180694.doc', 'standard_document/05151452378635858.doc', 'qgaz2004', '2020-05-15 14:52:37');
INSERT INTO `standard_document` VALUES ('1114', '秋季班高二（上）英语第十七讲： 状语从句 （一）', '3', '11', '1', 'standard_document/05151453334769707.doc', 'standard_document/05151453332544174.doc', 'qgaz2004', '2020-05-15 14:53:33');
INSERT INTO `standard_document` VALUES ('1115', '秋季班高二（上）英语第十八讲： 状语从句 （二）', '3', '11', '1', 'standard_document/05151454284983865.doc', 'standard_document/05151454284692354.doc', 'qgaz2004', '2020-05-15 14:54:28');
INSERT INTO `standard_document` VALUES ('1116', '秋季班高二（上）英语第十九讲： 状语从句 （三）', '3', '11', '1', 'standard_document/05151455115996464.doc', 'standard_document/05151455119073655.doc', 'qgaz2004', '2020-05-15 14:55:11');
INSERT INTO `standard_document` VALUES ('1117', '秋季班高二（上）英语第二十讲： 高二 （上） 期末测评试卷', '3', '11', '1', 'standard_document/05151455514178532.doc', 'standard_document/05151455514998943.doc', 'qgaz2004', '2020-05-15 14:55:51');
INSERT INTO `standard_document` VALUES ('1118', '暑假班高二（上）英语第一讲：目的状语和让步状语从句', '3', '11', '3', 'standard_document/05151459576781376.doc', 'standard_document/05151459575748575.doc', 'qgaz2004', '2020-05-15 14:59:57');
INSERT INTO `standard_document` VALUES ('1119', '暑假班高二（上）英语第二讲：现在完成时、现在完成进行时', '3', '11', '3', 'standard_document/05151501172288479.doc', 'standard_document/05151501179279862.doc', 'qgaz2004', '2020-05-15 15:01:17');
INSERT INTO `standard_document` VALUES ('1120', '暑假班高二（上）英语第三讲： 定语从句复习', '3', '11', '3', 'standard_document/05151502294752037.doc', 'standard_document/05151502291727574.doc', 'qgaz2004', '2020-05-15 15:02:29');
INSERT INTO `standard_document` VALUES ('1121', '暑假班高二（上）英语第四讲：U3重点单词词组复习&阅读理解训练（一）', '3', '11', '3', 'standard_document/05151503264016604.doc', 'standard_document/05151503264202053.doc', 'qgaz2004', '2020-05-15 15:03:26');
INSERT INTO `standard_document` VALUES ('1122', '暑假班高二（上）英语第五讲：U4重点单词词组复习&阅读理解训练（二）', '3', '11', '3', 'standard_document/05151505362550034.doc', 'standard_document/05151505361706600.doc', 'qgaz2004', '2020-05-15 15:05:36');
INSERT INTO `standard_document` VALUES ('1123', '暑假班高二（上）英语第六讲：词汇复习、阅读理解训练（三）', '3', '11', '3', 'standard_document/05151506352721028.doc', 'standard_document/05151506359998916.doc', 'qgaz2004', '2020-05-15 15:06:35');
INSERT INTO `standard_document` VALUES ('1124', '暑假班高二（上）英语第七讲：首字母词汇复习、Summary writing训练（', '3', '11', '3', 'standard_document/05151507572997145.doc', 'standard_document/05151507578603623.doc', 'qgaz2004', '2020-05-15 15:07:57');
INSERT INTO `standard_document` VALUES ('1125', '暑假班高二（上）英语第八讲：首字母词汇复习、Summary writing训练（', '3', '11', '3', 'standard_document/05151509253603077.doc', 'standard_document/05151509251734324.doc', 'qgaz2004', '2020-05-15 15:09:25');
INSERT INTO `standard_document` VALUES ('1126', '暑假班高二（上）英语第九讲：期中复习', '3', '11', '3', 'standard_document/05151510277451807.doc', 'standard_document/05151510271134680.doc', 'qgaz2004', '2020-05-15 15:10:27');
INSERT INTO `standard_document` VALUES ('1127', '暑假班高二（上）英语第十讲：U5重点单词词组&分词复习（一）', '3', '11', '3', 'standard_document/05151511416618536.doc', 'standard_document/05151511418035070.doc', 'qgaz2004', '2020-05-15 15:11:41');
INSERT INTO `standard_document` VALUES ('1128', '暑假班高二（上）英语第十一讲：U5重点单词词组&分词复习（二）', '3', '11', '3', 'standard_document/05151514508805412.doc', 'standard_document/05151514508537798.doc', 'qgaz2004', '2020-05-15 15:14:50');
INSERT INTO `standard_document` VALUES ('1129', '暑假班高二（上）英语第十二讲：U6重点单词词组& If 引导的条件状语从句复习（', '3', '11', '3', 'standard_document/05151515495800417.doc', 'standard_document/05151515491344629.doc', 'qgaz2004', '2020-05-15 15:15:49');
INSERT INTO `standard_document` VALUES ('1130', '暑假班高二（上）英语第十三讲：U6重点单词词组& If 引导的条件状语从句复习（', '3', '11', '3', 'standard_document/05151517088213010.doc', 'standard_document/05151517084762337.doc', 'qgaz2004', '2020-05-15 15:17:08');
INSERT INTO `standard_document` VALUES ('1131', '暑假班高二（上）英语第十四讲：非谓语动词复习', '3', '11', '3', 'standard_document/05151517526817092.doc', 'standard_document/05151517524631978.doc', 'qgaz2004', '2020-05-15 15:17:52');
INSERT INTO `standard_document` VALUES ('1132', '暑假班高二（上）英语第十五讲：完型填空复习', '3', '11', '3', 'standard_document/05151519004286304.doc', 'standard_document/05151519008973337.doc', 'qgaz2004', '2020-05-15 15:19:00');
INSERT INTO `standard_document` VALUES ('1133', '暑假班高二（上）英语第十六讲：阅读训练(一)', '3', '11', '3', 'standard_document/05151519432432112.doc', 'standard_document/05151519437755950.doc', 'qgaz2004', '2020-05-15 15:19:43');
INSERT INTO `standard_document` VALUES ('1134', '暑假班高二（上）英语第十七讲：阅读训练 (二)', '3', '11', '3', 'standard_document/05151520379024582.doc', 'standard_document/05151520379383756.doc', 'qgaz2004', '2020-05-15 15:20:37');
INSERT INTO `standard_document` VALUES ('1135', '暑假班高二（上）英语第十八讲：阅读六选四（一）', '3', '11', '3', 'standard_document/05151521228921410.doc', 'standard_document/05151521222167316.doc', 'qgaz2004', '2020-05-15 15:21:22');
INSERT INTO `standard_document` VALUES ('1136', '暑假班高二（上）英语第十九讲：阅读六选四（二）', '3', '11', '3', 'standard_document/05151522055182592.doc', 'standard_document/05151522059241687.doc', 'qgaz2004', '2020-05-15 15:22:05');
INSERT INTO `standard_document` VALUES ('1137', '暑假班高二（上）英语第二十讲：期末总复习', '3', '11', '3', 'standard_document/05151523502821407.doc', 'standard_document/05151523506714519.doc', 'qgaz2004', '2020-05-15 15:23:50');
INSERT INTO `standard_document` VALUES ('1138', '春季班高三化学第1讲：有机物的制备', '5', '12', '2', 'standard_document/05181434445831217.doc', 'standard_document/05181434448703050.doc', 'jkgn1910', '2020-05-18 14:34:44');
INSERT INTO `standard_document` VALUES ('1139', '春季班高三化学第2讲：性质探究实验', '5', '12', '2', 'standard_document/05181435364933365.doc', 'standard_document/05181435364388262.doc', 'jkgn1910', '2020-05-18 14:35:36');
INSERT INTO `standard_document` VALUES ('1140', '春季班高三化学第3讲：常见物质的工业制备', '5', '12', '2', 'standard_document/05181436357687547.doc', 'standard_document/05181436359220447.doc', 'jkgn1910', '2020-05-18 14:36:35');
INSERT INTO `standard_document` VALUES ('1141', '春季班高三化学第4讲：阿伏伽德罗常数', '5', '12', '2', 'standard_document/05181436598563361.doc', 'standard_document/05181436598127680.doc', 'jkgn1910', '2020-05-18 14:36:59');
INSERT INTO `standard_document` VALUES ('1142', '春季班高三化学第5讲：原子结构、化学键、元素周期表和周期律', '5', '12', '2', 'standard_document/05181437281746643.doc', 'standard_document/05181437285911394.doc', 'jkgn1910', '2020-05-18 14:37:28');
INSERT INTO `standard_document` VALUES ('1143', '春季班高三化学第6讲：氧化还原反应', '5', '12', '2', 'standard_document/05181438011780444.doc', 'standard_document/05181438017606846.doc', 'jkgn1910', '2020-05-18 14:38:01');
INSERT INTO `standard_document` VALUES ('1144', '春季班高三化学第7讲：电化学', '5', '12', '2', 'standard_document/05181438313816637.doc', 'standard_document/05181438316643016.doc', 'jkgn1910', '2020-05-18 14:38:31');
INSERT INTO `standard_document` VALUES ('1145', '春季班高三化学第8讲：化学反应速率与化学平衡', '5', '12', '2', 'standard_document/05181438542730931.doc', 'standard_document/05181438549925914.doc', 'jkgn1910', '2020-05-18 14:38:54');
INSERT INTO `standard_document` VALUES ('1146', '春季班高三化学第9讲：电解质溶液', '5', '12', '2', 'standard_document/05181439182123040.doc', 'standard_document/05181439182046198.doc', 'jkgn1910', '2020-05-18 14:39:18');
INSERT INTO `standard_document` VALUES ('1147', '春季班高三化学第10讲：离子反应', '5', '12', '2', 'standard_document/05181439523956181.doc', 'standard_document/05181439521861326.doc', 'jkgn1910', '2020-05-18 14:39:52');
INSERT INTO `standard_document` VALUES ('1148', '春季班高三化学第11讲：选择中的化学实验', '5', '12', '2', 'standard_document/05181441378829160.doc', 'standard_document/05181441374658953.doc', 'jkgn1910', '2020-05-18 14:41:37');
INSERT INTO `standard_document` VALUES ('1149', '春季班高三化学第12讲：选择中的有机', '5', '12', '2', 'standard_document/05181442077417572.doc', 'standard_document/05181442079006986.doc', 'jkgn1910', '2020-05-18 14:42:07');
INSERT INTO `standard_document` VALUES ('1150', '春季班高三化学第13讲：选择中的计算', '5', '12', '2', 'standard_document/05181442329855213.doc', 'standard_document/05181442323274534.doc', 'jkgn1910', '2020-05-18 14:42:32');
INSERT INTO `standard_document` VALUES ('1151', '春季班高三化学第14讲：选择题答题技巧', '5', '12', '2', 'standard_document/05181443009531834.doc', 'standard_document/05181443001345988.doc', 'jkgn1910', '2020-05-18 14:43:00');
INSERT INTO `standard_document` VALUES ('1152', '春季班高三化学第15讲：非金属元素的单质与化合物', '5', '12', '2', 'standard_document/05181443414419983.doc', 'standard_document/05181443418511964.doc', 'jkgn1910', '2020-05-18 14:43:41');
INSERT INTO `standard_document` VALUES ('1153', '春季班高三化学第16讲：金属元素的单质与化合物', '5', '12', '2', 'standard_document/05181444163431736.doc', 'standard_document/05181444165901083.doc', 'jkgn1910', '2020-05-18 14:44:16');
INSERT INTO `standard_document` VALUES ('1154', '春季班高三化学第17讲：基础综合题', '5', '12', '2', 'standard_document/05181444424700911.doc', 'standard_document/05181444425505997.doc', 'jkgn1910', '2020-05-18 14:44:42');
INSERT INTO `standard_document` VALUES ('1155', '春季班高三化学第18讲：简答题中的语言规范问题', '5', '12', '2', 'standard_document/05181445105661438.doc', 'standard_document/05181445105124128.doc', 'jkgn1910', '2020-05-18 14:45:10');
INSERT INTO `standard_document` VALUES ('1156', '春季班高三化学第19讲：实验中的数据处理', '5', '12', '2', 'standard_document/05181446267374149.doc', 'standard_document/05181446269625609.doc', 'jkgn1910', '2020-05-18 14:46:26');
INSERT INTO `standard_document` VALUES ('1157', '春季班高三化学第20讲：有机推断', '5', '12', '2', 'standard_document/05181447126546051.doc', 'standard_document/05181447124258151.doc', 'jkgn1910', '2020-05-18 14:47:12');
INSERT INTO `standard_document` VALUES ('1158', '春季班一年级数学第17讲：百数表', '2', '1', '2', 'standard_document/05191722031823798.doc', 'standard_document/05191722032616546.doc', 'dsix1908', '2020-05-19 17:22:03');
INSERT INTO `standard_document` VALUES ('1159', '春季班一年级数学第18讲：单双数及付钱方式', '2', '1', '2', 'standard_document/05191723271927276.doc', 'standard_document/05191723271170616.doc', 'dsix1908', '2020-05-19 17:23:27');
INSERT INTO `standard_document` VALUES ('1160', '秋季班高三（上）英语第一讲： 语法填空（一）', '3', '12', '1', 'standard_document/05191815452950611.doc', 'standard_document/05191815454725534.doc', 'qgaz2004', '2020-05-19 18:15:45');
INSERT INTO `standard_document` VALUES ('1161', '秋季班高三（上）英语第二讲： 语法填空（二）', '3', '12', '1', 'standard_document/05191817226302539.doc', 'standard_document/05191817228336804.doc', 'qgaz2004', '2020-05-19 18:17:22');
INSERT INTO `standard_document` VALUES ('1162', '秋季班高三（上）英语第三讲： 语法填空（三）', '3', '12', '1', 'standard_document/05191820223328865.doc', 'standard_document/05191820221461950.doc', 'qgaz2004', '2020-05-19 18:20:22');
INSERT INTO `standard_document` VALUES ('1163', '秋季班高三（上）英语第四讲： 十一选十 （一）', '3', '12', '1', 'standard_document/05191821488931436.doc', 'standard_document/05191821485964575.doc', 'qgaz2004', '2020-05-19 18:21:48');
INSERT INTO `standard_document` VALUES ('1164', '秋季班高三（上）英语第五讲： 十一选十 （二）', '3', '12', '1', 'standard_document/05191824599041023.doc', 'standard_document/05191824597659348.doc', 'qgaz2004', '2020-05-19 18:24:59');
INSERT INTO `standard_document` VALUES ('1165', '秋季班高三（上）英语第六讲： 十一选十 （三）', '3', '12', '1', 'standard_document/05191826078300827.doc', 'standard_document/05191826077232116.doc', 'qgaz2004', '2020-05-19 18:26:07');
INSERT INTO `standard_document` VALUES ('1166', '秋季班高三（上）英语第七讲： 完形填空 （一）', '3', '12', '1', 'standard_document/05191829522004148.doc', 'standard_document/05191829525702867.doc', 'qgaz2004', '2020-05-19 18:29:52');
INSERT INTO `standard_document` VALUES ('1167', '秋季班高三（上）英语第八讲： 完形填空 （二）', '3', '12', '1', 'standard_document/05191831235920442.doc', 'standard_document/05191831235173874.doc', 'qgaz2004', '2020-05-19 18:31:23');
INSERT INTO `standard_document` VALUES ('1168', '秋季班高三（上）英语第九讲： 完形填空 （三）', '3', '12', '1', 'standard_document/05191900575358063.doc', 'standard_document/05191900576771658.doc', 'qgaz2004', '2020-05-19 19:00:57');
INSERT INTO `standard_document` VALUES ('1169', '秋季班高三（上）英语第十讲： 期中测评试卷', '3', '12', '1', 'standard_document/05191902145873076.doc', 'standard_document/05191902143712204.doc', 'qgaz2004', '2020-05-19 19:02:14');
INSERT INTO `standard_document` VALUES ('1170', '秋季班高三（上）英语第十一讲： 六选四 （一）', '3', '12', '1', 'standard_document/05191903289013328.doc', 'standard_document/05191903281315142.doc', 'qgaz2004', '2020-05-19 19:03:28');
INSERT INTO `standard_document` VALUES ('1171', '秋季班高三（上）英语第十二讲： 六选四 （二）', '3', '12', '1', 'standard_document/05191904358697436.doc', 'standard_document/05191904356081792.doc', 'qgaz2004', '2020-05-19 19:04:35');
INSERT INTO `standard_document` VALUES ('1172', '秋季班高三（上）英语第十三讲： 六选四 （三）', '3', '12', '1', 'standard_document/05191905431970013.doc', 'standard_document/05191905436670270.doc', 'qgaz2004', '2020-05-19 19:05:43');
INSERT INTO `standard_document` VALUES ('1173', '秋季班高三（上）英语第十四讲：  Summary (一）', '3', '12', '1', 'standard_document/05191906429097115.doc', 'standard_document/05191906422839305.doc', 'qgaz2004', '2020-05-19 19:06:42');
INSERT INTO `standard_document` VALUES ('1174', '秋季班高三（上）英语第十五讲：  Summary (二）', '3', '12', '1', 'standard_document/05191907455553445.doc', 'standard_document/05191907456191176.doc', 'qgaz2004', '2020-05-19 19:07:45');
INSERT INTO `standard_document` VALUES ('1175', '秋季班高三（上）英语第十六讲：  Summary (三）', '3', '12', '1', 'standard_document/05191908544181209.doc', 'standard_document/05191908546102296.doc', 'qgaz2004', '2020-05-19 19:08:54');
INSERT INTO `standard_document` VALUES ('1176', '秋季班高三（上）英语第十七讲： 翻译 （一）', '3', '12', '1', 'standard_document/05191909389913285.doc', 'standard_document/05191909381320017.doc', 'qgaz2004', '2020-05-19 19:09:38');
INSERT INTO `standard_document` VALUES ('1177', '秋季班高三（上）英语第十八讲： 翻译 （二）', '3', '12', '1', 'standard_document/05191910482410982.doc', 'standard_document/05191910484572510.doc', 'qgaz2004', '2020-05-19 19:10:48');
INSERT INTO `standard_document` VALUES ('1178', '秋季班高三（上）英语第十九讲： 翻译 （三）', '3', '12', '1', 'standard_document/05191911445303074.doc', 'standard_document/05191911448152967.doc', 'qgaz2004', '2020-05-19 19:11:44');
INSERT INTO `standard_document` VALUES ('1179', '秋季班高三（上）英语第二十讲： 期末测评试卷', '3', '12', '1', 'standard_document/05191912328779210.doc', 'standard_document/05191912329620351.doc', 'qgaz2004', '2020-05-19 19:12:32');
INSERT INTO `standard_document` VALUES ('1180', '春季班九年级物理第一讲：运动与力', '4', '9', '2', 'standard_document/05211325385925144.doc', 'standard_document/05211325389731694.doc', 'qlyk2004', '2020-05-21 13:25:38');
INSERT INTO `standard_document` VALUES ('1181', '春季班九年级物理第二讲：简单机械', '4', '9', '2', 'standard_document/05211328412919494.doc', 'standard_document/05211328419242763.doc', 'qlyk2004', '2020-05-21 13:28:41');
INSERT INTO `standard_document` VALUES ('1182', '春季班九年级物理第三讲：热', '4', '9', '2', 'standard_document/05211336567561209.doc', 'standard_document/05211336565796405.doc', 'qlyk2004', '2020-05-21 13:36:56');
INSERT INTO `standard_document` VALUES ('1183', '春季班九年级物理第四讲：压强', '4', '9', '2', 'standard_document/05211339219295689.doc', 'standard_document/05211339211879138.doc', 'qlyk2004', '2020-05-21 13:39:21');
INSERT INTO `standard_document` VALUES ('1184', '春季班九年级物理第五讲：电学', '4', '9', '2', 'standard_document/05211341159420100.doc', 'standard_document/05211341155531413.doc', 'qlyk2004', '2020-05-21 13:41:15');
INSERT INTO `standard_document` VALUES ('1185', '春季班九年级物理第六讲：凸透镜成像', '4', '9', '2', 'standard_document/05211344518107684.doc', 'standard_document/05211344516399191.doc', 'qlyk2004', '2020-05-21 13:44:51');
INSERT INTO `standard_document` VALUES ('1186', '春季班九年级物理第七讲：路程-时间图像', '4', '9', '2', 'standard_document/05211347256410495.doc', 'standard_document/05211347254124178.doc', 'qlyk2004', '2020-05-21 13:47:25');
INSERT INTO `standard_document` VALUES ('1187', '春季班九年级物理第八讲：压强选择', '4', '9', '2', 'standard_document/05211352205951638.doc', 'standard_document/05211352202815754.doc', 'qlyk2004', '2020-05-21 13:52:20');
INSERT INTO `standard_document` VALUES ('1188', '春季班九年级物理第九讲：液体压强计算', '4', '9', '2', 'standard_document/05211357151966874.doc', 'standard_document/05211357157277529.doc', 'qlyk2004', '2020-05-21 13:57:15');
INSERT INTO `standard_document` VALUES ('1189', '春季班一年级数学第19讲：统计初步', '2', '1', '2', 'standard_document/05211613204491752.doc', 'standard_document/05211613204240709.doc', 'dsix1908', '2020-05-21 16:13:20');
INSERT INTO `standard_document` VALUES ('1190', '春季班一年级数学第20讲：提高与复习', '2', '1', '2', 'standard_document/05211614291940317.doc', 'standard_document/05211614295747525.doc', 'dsix1908', '2020-05-21 16:14:29');
INSERT INTO `standard_document` VALUES ('1191', '春季班九年级物理第十讲：液体压强计算（二）', '4', '9', '2', 'standard_document/05211616202022793.doc', 'standard_document/05211616204866293.doc', 'qlyk2004', '2020-05-21 16:16:20');
INSERT INTO `standard_document` VALUES ('1192', '春季班九年级物理第十一讲：动态电路', '4', '9', '2', 'standard_document/05211618519264672.doc', 'standard_document/05211618518067374.doc', 'qlyk2004', '2020-05-21 16:18:51');
INSERT INTO `standard_document` VALUES ('1193', '春季班九年级物理第十二讲：电路故障', '4', '9', '2', 'standard_document/05211622094439177.doc', 'standard_document/05211622093396148.doc', 'qlyk2004', '2020-05-21 16:22:09');
INSERT INTO `standard_document` VALUES ('1194', '春季班九年级物理第十三讲：电学计算（一）', '4', '9', '2', 'standard_document/05211625359781868.doc', 'standard_document/05211625352526374.doc', 'qlyk2004', '2020-05-21 16:25:35');
INSERT INTO `standard_document` VALUES ('1195', '春季班九年级物理第十四讲：电学计算（二）', '4', '9', '2', 'standard_document/05211627587765389.doc', 'standard_document/05211627585487645.doc', 'qlyk2004', '2020-05-21 16:27:58');
INSERT INTO `standard_document` VALUES ('1196', '春季班九年级物理第十五讲：伏安法测电阻', '4', '9', '2', 'standard_document/05211631148431469.doc', 'standard_document/05211631149519690.doc', 'qlyk2004', '2020-05-21 16:31:14');
INSERT INTO `standard_document` VALUES ('1197', '春季班九年级物理第十六讲：测小灯泡电功率', '4', '9', '2', 'standard_document/05211635337331667.doc', 'standard_document/05211635336392525.doc', 'qlyk2004', '2020-05-21 16:35:33');
INSERT INTO `standard_document` VALUES ('1198', '春季班九年级物理第十七讲：情景归纳', '4', '9', '2', 'standard_document/05211640325844562.doc', 'standard_document/05211640327191227.doc', 'qlyk2004', '2020-05-21 16:40:32');
INSERT INTO `standard_document` VALUES ('1199', '春季班九年级物理第十八讲：表格归纳', '4', '9', '2', 'standard_document/05211642489915194.doc', 'standard_document/05211642481420856.doc', 'qlyk2004', '2020-05-21 16:42:48');
INSERT INTO `standard_document` VALUES ('1200', '春季班九年级物理第十九讲：中考常考点分析', '4', '9', '2', 'standard_document/05211644507112771.doc', 'standard_document/05211644505934608.doc', 'qlyk2004', '2020-05-21 16:44:50');
INSERT INTO `standard_document` VALUES ('1201', '春季班九年级物理第二十讲：易错基础题', '4', '9', '2', 'standard_document/05211647523792759.doc', 'standard_document/05211647525482285.doc', 'qlyk2004', '2020-05-21 16:47:52');
INSERT INTO `standard_document` VALUES ('1205', '暑假班高一物理第一讲：运动的描述', '4', '10', '3', 'standard_document/06021457293750183.doc', 'standard_document/06021457292109607.doc', 'qlyk2004', '2020-06-02 14:57:29');
INSERT INTO `standard_document` VALUES ('1206', '暑假班高一物理第二讲：平均速度、瞬时速度', '4', '10', '3', 'standard_document/06021501017585652.doc', 'standard_document/06021501014232972.doc', 'qlyk2004', '2020-06-02 15:01:01');
INSERT INTO `standard_document` VALUES ('1207', '暑假班高一物理第三讲：DIS实验系统', '4', '10', '3', 'standard_document/06021504387948714.doc', 'standard_document/06021504387491082.doc', 'qlyk2004', '2020-06-02 15:04:38');
INSERT INTO `standard_document` VALUES ('1208', '暑假班高一物理第四讲：匀速直线运动的图像', '4', '10', '3', 'standard_document/06021506536476143.doc', 'standard_document/06021506534630582.doc', 'qlyk2004', '2020-06-02 15:06:53');
INSERT INTO `standard_document` VALUES ('1209', '暑假班高一物理第五讲：加速度', '4', '10', '3', 'standard_document/06021508568218960.doc', 'standard_document/06021508565574087.doc', 'qlyk2004', '2020-06-02 15:08:56');
INSERT INTO `standard_document` VALUES ('1210', '暑假班高一物理第六讲：匀变速直线运动规律（一）', '4', '10', '3', 'standard_document/06021511075805575.doc', 'standard_document/06021511074541691.doc', 'qlyk2004', '2020-06-02 15:11:07');
INSERT INTO `standard_document` VALUES ('1211', '暑假班高一物理第七讲：匀变速直线运动的图像', '4', '10', '3', 'standard_document/06021513416634998.doc', 'standard_document/06021513416135991.doc', 'qlyk2004', '2020-06-02 15:13:41');
INSERT INTO `standard_document` VALUES ('1212', '暑假班高一物理第八讲：匀变速直线运动规律（二）', '4', '10', '3', 'standard_document/06021516259102237.doc', 'standard_document/06021516251563077.doc', 'qlyk2004', '2020-06-02 15:16:25');
INSERT INTO `standard_document` VALUES ('1213', '暑假班高一物理第九讲：匀变速直线运动规律（三）', '4', '10', '3', 'standard_document/06021518267476045.doc', 'standard_document/06021518266684326.doc', 'qlyk2004', '2020-06-02 15:18:26');
INSERT INTO `standard_document` VALUES ('1214', '暑假班高一物理第十讲：期中考试', '4', '10', '3', 'standard_document/06021520416509506.doc', 'standard_document/06021520412658390.doc', 'qlyk2004', '2020-06-02 15:20:41');
INSERT INTO `standard_document` VALUES ('1215', '暑假班高一物理第十一讲：生活中常见的力（一）', '4', '10', '3', 'standard_document/06021533253337872.doc', 'standard_document/06021533251154690.doc', 'qlyk2004', '2020-06-02 15:33:25');
INSERT INTO `standard_document` VALUES ('1216', '暑假班高一物理第十二讲：生活中常见的力（二）', '4', '10', '3', 'standard_document/06021535087495663.doc', 'standard_document/06021535087236457.doc', 'qlyk2004', '2020-06-02 15:35:08');
INSERT INTO `standard_document` VALUES ('1217', '暑假班高一物理第十三讲：受力分析', '4', '10', '3', 'standard_document/06021537065746367.doc', 'standard_document/06021537066691578.doc', 'qlyk2004', '2020-06-02 15:37:06');
INSERT INTO `standard_document` VALUES ('1218', '暑假班高一物理第十四讲：力的合成', '4', '10', '3', 'standard_document/06021539473120378.doc', 'standard_document/06021539475815958.doc', 'qlyk2004', '2020-06-02 15:39:47');
INSERT INTO `standard_document` VALUES ('1219', '暑假班高一物理第十五讲：力的分解', '4', '10', '3', 'standard_document/06021542406796440.doc', 'standard_document/06021542404019898.doc', 'qlyk2004', '2020-06-02 15:42:40');
INSERT INTO `standard_document` VALUES ('1220', '暑假班高一物理第十六讲：牛顿第一定律和第三定律', '4', '10', '3', 'standard_document/06021544522644128.doc', 'standard_document/06021544529365383.doc', 'qlyk2004', '2020-06-02 15:44:52');
INSERT INTO `standard_document` VALUES ('1221', '暑假班高一物理第十七讲：牛顿第二定律', '4', '10', '3', 'standard_document/06021547172689381.doc', 'standard_document/06021547175427560.doc', 'qlyk2004', '2020-06-02 15:47:17');
INSERT INTO `standard_document` VALUES ('1222', '暑假班高一物理第十八讲：期末考试', '4', '10', '3', 'standard_document/06021549327192020.doc', 'standard_document/06021549322339889.doc', 'qlyk2004', '2020-06-02 15:49:32');
INSERT INTO `standard_document` VALUES ('1223', '暑假班高一物理第十九讲：分班考测试（一）', '4', '10', '3', 'standard_document/06021551343917025.doc', 'standard_document/06021551342011997.doc', 'qlyk2004', '2020-06-02 15:51:34');
INSERT INTO `standard_document` VALUES ('1224', '暑假班高一物理第二十讲：分班考测试（二）', '4', '10', '3', 'standard_document/06021553204155372.doc', 'standard_document/06021553201053943.doc', 'qlyk2004', '2020-06-02 15:53:20');
INSERT INTO `standard_document` VALUES ('1225', '秋季班高三化学第1讲：第一、二章复习', '5', '12', '1', 'standard_document/06021557231796424.doc', 'standard_document/06021557236198857.doc', 'jkgn1910', '2020-06-02 15:57:23');
INSERT INTO `standard_document` VALUES ('1226', '秋季班高三化学第2讲：速率与平衡章节复习', '5', '12', '1', 'standard_document/06021559533542792.doc', 'standard_document/06021559536629421.doc', 'jkgn1910', '2020-06-02 15:59:53');
INSERT INTO `standard_document` VALUES ('1227', '秋季班高三化学第3讲：弱电解质的电离', '5', '12', '1', 'standard_document/06021601532736083.doc', 'standard_document/06021601536449023.doc', 'jkgn1910', '2020-06-02 16:01:53');
INSERT INTO `standard_document` VALUES ('1228', '秋季班高三化学第4讲：盐类水解和离子浓度大小的比较', '5', '12', '1', 'standard_document/06021603117464004.doc', 'standard_document/06021603112677887.doc', 'jkgn1910', '2020-06-02 16:03:11');
INSERT INTO `standard_document` VALUES ('1229', '秋季班高三化学第5讲：离子反应', '5', '12', '1', 'standard_document/06021604236125650.doc', 'standard_document/06021604238212285.doc', 'jkgn1910', '2020-06-02 16:04:23');
INSERT INTO `standard_document` VALUES ('1230', '秋季班高三化学第6讲：氧化还原反应', '5', '12', '1', 'standard_document/06021605466065730.doc', 'standard_document/06021605461653740.doc', 'jkgn1910', '2020-06-02 16:05:46');
INSERT INTO `standard_document` VALUES ('1231', '秋季班高三化学第7讲：钠及其钠的化合物', '5', '12', '1', 'standard_document/06021606355523442.doc', 'standard_document/06021606354100601.doc', 'jkgn1910', '2020-06-02 16:06:35');
INSERT INTO `standard_document` VALUES ('1232', '秋季班高三化学第8讲：铁和铜', '5', '12', '1', 'standard_document/06021607329962901.doc', 'standard_document/06021607325719526.doc', 'jkgn1910', '2020-06-02 16:07:32');
INSERT INTO `standard_document` VALUES ('1233', '秋季班高三化学第9讲：金属铝和镁', '5', '12', '1', 'standard_document/06021609451106580.doc', 'standard_document/06021609456296734.doc', 'jkgn1910', '2020-06-02 16:09:45');
INSERT INTO `standard_document` VALUES ('1234', '秋季班高三化学第10讲：金属计算和实验应用', '5', '12', '1', 'standard_document/06021611154871976.doc', 'standard_document/06021611159699839.doc', 'jkgn1910', '2020-06-02 16:11:15');
INSERT INTO `standard_document` VALUES ('1235', '秋季班高三化学第11讲：非金属卤素', '5', '12', '1', 'standard_document/06031502495660695.doc', 'standard_document/06031502492825324.doc', 'jkgn1910', '2020-06-03 15:02:49');
INSERT INTO `standard_document` VALUES ('1236', '秋季班高三化学第12讲：硫及其化合物', '5', '12', '1', 'standard_document/06031623152222997.doc', 'standard_document/06031623158887216.doc', 'jkgn1910', '2020-06-03 16:23:15');
INSERT INTO `standard_document` VALUES ('1237', '秋季班高三化学第13讲：氮及其化合物', '5', '12', '1', 'standard_document/06031624324201781.doc', 'standard_document/06031624325832688.doc', 'jkgn1910', '2020-06-03 16:24:32');
INSERT INTO `standard_document` VALUES ('1238', '秋季班高三化学第14讲：非金属综合', '5', '12', '1', 'standard_document/06031626433526397.doc', 'standard_document/06031626438619470.doc', 'jkgn1910', '2020-06-03 16:26:43');
INSERT INTO `standard_document` VALUES ('1239', '秋季班高三化学第15讲：烃的复习', '5', '12', '1', 'standard_document/06031628384495255.doc', 'standard_document/06031628387105622.doc', 'jkgn1910', '2020-06-03 16:28:38');
INSERT INTO `standard_document` VALUES ('1240', '秋季班高三化学第16讲：烃的衍生物', '5', '12', '1', 'standard_document/06031629567012008.doc', 'standard_document/06031629565765568.doc', 'jkgn1910', '2020-06-03 16:29:56');
INSERT INTO `standard_document` VALUES ('1241', '秋季班高三化学第17讲：有机合成和推断', '5', '12', '1', 'standard_document/06041350249590370.doc', 'standard_document/06041350246753799.doc', 'jkgn1910', '2020-06-04 13:50:24');
INSERT INTO `standard_document` VALUES ('1242', '秋季班高三化学第18讲：实验基本操作及物质检验和提纯', '5', '12', '1', 'standard_document/06041352287939503.doc', 'standard_document/06041352286709263.doc', 'jkgn1910', '2020-06-04 13:52:28');
INSERT INTO `standard_document` VALUES ('1244', '秋季班高三化学第19讲：气体的制备', '5', '12', '1', 'standard_document/06041445297493337.doc', 'standard_document/06041445295000483.doc', 'jkgn1910', '2020-06-04 14:45:29');
INSERT INTO `standard_document` VALUES ('1245', '秋季班高三化学第20讲：定量实验专题', '5', '12', '1', 'standard_document/06041515573420396.doc', 'standard_document/06041515572403897.doc', 'jkgn1910', '2020-06-04 15:15:57');
INSERT INTO `standard_document` VALUES ('1246', '秋季班四年级数学四年级-第9讲-三步计算 ', '2', '4', '1', 'standard_document/07051516566033664.doc', 'standard_document/07051516569223685.doc', 'tmil1908', '2020-07-05 15:16:56');
INSERT INTO `standard_document` VALUES ('1247', '秋季班四年级数学四年级-第10讲-期中复习（一）', '2', '4', '1', 'standard_document/07051518398216292.doc', 'standard_document/07051518392585920.doc', 'tmil1908', '2020-07-05 15:18:39');
INSERT INTO `standard_document` VALUES ('1248', '秋季班四年级数学四年级-第11讲-期中复习（二）', '2', '4', '1', 'standard_document/07051519477975704.doc', 'standard_document/07051519472429021.doc', 'tmil1908', '2020-07-05 15:19:47');
INSERT INTO `standard_document` VALUES ('1249', '秋季班四年级数学四年级-第12讲-正推与逆推', '2', '4', '1', 'standard_document/07051522466228810.doc', 'standard_document/07051522463301820.doc', 'tmil1908', '2020-07-05 15:22:46');
INSERT INTO `standard_document` VALUES ('1250', '秋季班四年级数学四年级-第13讲-文字计算题 ', '2', '4', '1', 'standard_document/07051559039221548.doc', 'standard_document/07051559033613635.doc', 'tmil1908', '2020-07-05 15:59:03');
INSERT INTO `standard_document` VALUES ('1251', '秋季班四年级数学四年级-第14讲-运算定律', '2', '4', '1', 'standard_document/07051601361495050.doc', 'standard_document/07051601369099756.doc', 'tmil1908', '2020-07-05 16:01:36');
INSERT INTO `standard_document` VALUES ('1252', '秋季班四年级数学四年级-第15讲-解决问题', '2', '4', '1', 'standard_document/07051603134630760.doc', 'standard_document/07051603131193897.doc', 'tmil1908', '2020-07-05 16:03:13');
INSERT INTO `standard_document` VALUES ('1253', '秋季班四年级数学四年级-第16讲-基本图形认知 教师版', '2', '4', '1', 'standard_document/07052326213510749.doc', 'standard_document/07052326212491299.doc', 'tmil1908', '2020-07-05 23:26:21');
INSERT INTO `standard_document` VALUES ('1254', '秋季班四年级数学四年级-第17讲-长度与角度的计算', '2', '4', '1', 'standard_document/07052327419914579.doc', 'standard_document/07052327419910189.doc', 'tmil1908', '2020-07-05 23:27:41');
INSERT INTO `standard_document` VALUES ('1255', '秋季班四年级数学四年级-第18讲-整理与提高 ', '2', '4', '1', 'standard_document/07052328436271592.doc', 'standard_document/07052328438919353.doc', 'tmil1908', '2020-07-05 23:28:43');
INSERT INTO `standard_document` VALUES ('1256', '秋季班四年级数学四年级-第19讲-期末复习（一）', '2', '4', '1', 'standard_document/07052330022036356.doc', 'standard_document/07052330028181277.doc', 'tmil1908', '2020-07-05 23:30:02');
INSERT INTO `standard_document` VALUES ('1257', '秋季班四年级数学四年级-第20讲-期末复习（二）', '2', '4', '1', 'standard_document/07052331591416258.doc', 'standard_document/07052331596643031.doc', 'tmil1908', '2020-07-05 23:31:59');

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
INSERT INTO `user_access` VALUES ('admi0001', '1');
INSERT INTO `user_access` VALUES ('admi0001', '2');
INSERT INTO `user_access` VALUES ('admi0001', '3');
INSERT INTO `user_access` VALUES ('admi0001', '4');
INSERT INTO `user_access` VALUES ('admi0001', '5');
INSERT INTO `user_access` VALUES ('admi0001', '6');
INSERT INTO `user_access` VALUES ('admi0001', '7');
INSERT INTO `user_access` VALUES ('admi0001', '8');
INSERT INTO `user_access` VALUES ('admi0001', '9');
INSERT INTO `user_access` VALUES ('admi0001', '10');
INSERT INTO `user_access` VALUES ('admi0001', '11');
INSERT INTO `user_access` VALUES ('admi0001', '12');
INSERT INTO `user_access` VALUES ('admi0001', '13');
INSERT INTO `user_access` VALUES ('admi0001', '14');
INSERT INTO `user_access` VALUES ('admi0001', '15');
INSERT INTO `user_access` VALUES ('admi0001', '16');
INSERT INTO `user_access` VALUES ('admi0001', '17');
INSERT INTO `user_access` VALUES ('admi0001', '18');
INSERT INTO `user_access` VALUES ('admi0001', '19');
INSERT INTO `user_access` VALUES ('admi0001', '20');
INSERT INTO `user_access` VALUES ('admi0001', '21');
INSERT INTO `user_access` VALUES ('admi0001', '22');
INSERT INTO `user_access` VALUES ('admi0001', '23');
INSERT INTO `user_access` VALUES ('admi0001', '24');
INSERT INTO `user_access` VALUES ('admi0001', '25');
INSERT INTO `user_access` VALUES ('admi0001', '26');
INSERT INTO `user_access` VALUES ('admi0001', '27');
INSERT INTO `user_access` VALUES ('admi0001', '28');
INSERT INTO `user_access` VALUES ('admi0001', '29');
INSERT INTO `user_access` VALUES ('admi0001', '30');
INSERT INTO `user_access` VALUES ('admi0001', '31');
INSERT INTO `user_access` VALUES ('admi0001', '32');
INSERT INTO `user_access` VALUES ('admi0001', '33');
INSERT INTO `user_access` VALUES ('admi0001', '34');
INSERT INTO `user_access` VALUES ('admi0001', '35');
INSERT INTO `user_access` VALUES ('admi0001', '36');
INSERT INTO `user_access` VALUES ('admi0001', '37');
INSERT INTO `user_access` VALUES ('admi0001', '38');
INSERT INTO `user_access` VALUES ('admi0001', '39');
INSERT INTO `user_access` VALUES ('admi0001', '40');
INSERT INTO `user_access` VALUES ('admi0001', '41');
INSERT INTO `user_access` VALUES ('admi0001', '42');
INSERT INTO `user_access` VALUES ('admi0001', '43');
INSERT INTO `user_access` VALUES ('admi0001', '44');
INSERT INTO `user_access` VALUES ('admi0001', '45');
INSERT INTO `user_access` VALUES ('admi0001', '46');
INSERT INTO `user_access` VALUES ('admi0001', '47');
INSERT INTO `user_access` VALUES ('admi0001', '48');
INSERT INTO `user_access` VALUES ('admi0001', '49');
INSERT INTO `user_access` VALUES ('admi0001', '50');
INSERT INTO `user_access` VALUES ('admi0001', '51');
INSERT INTO `user_access` VALUES ('admi0001', '52');
INSERT INTO `user_access` VALUES ('admi0001', '53');
INSERT INTO `user_access` VALUES ('admi0001', '54');
INSERT INTO `user_access` VALUES ('admi0001', '55');

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
INSERT INTO `user_department` VALUES ('admi0001', '1');

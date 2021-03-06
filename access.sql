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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of access
-- ----------------------------
-- 公司管理 --
	-- 单位设置 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '单位设置', '查看', 'Company\CorporationController', 'corporation', '/company/corporation');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '单位设置', '添加', 'Company\CorporationController', 'corporationCreate', '/company/corporation/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '单位设置', '修改', 'Company\CorporationController', 'corporationEdit', '/company/corporation/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '单位设置', '删除', 'Company\CorporationController', 'corporationDelete', '/company/corporation/delete');
	-- 校区设置 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '校区设置', '查看', 'Company\DepartmentController', 'department', '/company/department');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '校区设置', '添加', 'Company\DepartmentController', 'departmentCreate', '/company/department/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '校区设置', '修改', 'Company\DepartmentController', 'departmentEdit', '/company/department/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '校区设置', '删除', 'Company\DepartmentController', 'departmentDelete', '/company/department/delete');
	-- 课程设置 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '课程设置', '查看', 'Company\CourseController', 'course', '/company/course');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '课程设置', '添加', 'Company\CourseController', 'courseCreate', '/company/course/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '课程设置', '修改', 'Company\CourseController', 'courseEdit', '/company/course/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '课程设置', '停课', 'Company\CourseController', 'courseDelete', '/company/course/delete');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '课程设置', '恢复', 'Company\CourseController', 'courseRestore', '/company/course/restore');
	-- 晚托设置 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '晚托设置', '查看', 'Company\DaycareController', 'daycare', '/company/daycare');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '晚托设置', '添加', 'Company\DaycareController', 'daycareCreate', '/company/daycare/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '晚托设置', '修改', 'Company\DaycareController', 'daycareEdit', '/company/daycare/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '晚托设置', '停课', 'Company\DaycareController', 'daycareDelete', '/company/daycare/delete');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '晚托设置', '恢复', 'Company\DaycareController', 'daycareRestore', '/company/daycare/restore');
	-- 用户管理 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '用户管理', '查看', 'Company\UserController', 'user', '/company/user');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '用户管理', '添加', 'Company\UserController', 'userCreate', '/company/user/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '用户管理', '修改', 'Company\UserController', 'userEdit', '/company/user/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '用户管理', '删除', 'Company\UserController', 'userDelete', '/company/user/delete');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '用户管理', '权限', 'Company\UserController', 'userAccess', '/company/user/access');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '用户管理', '密码', 'Company\UserController', 'userPassword', '/company/user/password');
	-- 教师评级 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '教师评级', '查看', 'Company\TeacherTypeController', 'teacherType', '/company/teacherType');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '教师评级', '添加', 'Company\TeacherTypeController', 'teacherTypeCreate', '/company/teacherType/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '教师评级', '修改', 'Company\TeacherTypeController', 'teacherTypeEdit', '/company/teacherType/edit');
	-- 员工工资 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '员工工资', '查看', 'Company\SalaryController', 'salary', '/company/salary');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '员工工资', '结算', 'Company\SalaryController', 'salaryCreate', '/company/salary/create');
	-- 发票管理 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '发票管理', '查看', 'Company\ReceiptController', 'receipt', '/company/receipt');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '发票管理', '添加', 'Company\ReceiptController', 'receiptCreate', '/company/receipt/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('公司管理', '发票管理', '删除', 'Company\ReceiptController', 'receiptDelete', '/company/receipt/delete');
	

-- 教务运营 --
	-- 学生管理 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生管理', '查看', 'Education\StudentController', 'student', '/education/student');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生管理', '导出', 'Education\StudentController', 'studentExport', '/education/student/export');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生管理', '添加', 'Education\StudentController', 'studentCreate', '/education/student/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生管理', '删除', 'Education\StudentController', 'studentDelete', '/education/student/delete');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生管理', '购课时', 'Education\StudentController', 'studentPaymentCreate', '/education/student/payment/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生管理', '购晚托', 'Education\StudentController', 'studentDaycareCreate', '/education/student/daycare/create');
	-- 离校学生 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '离校学生', '查看', 'Education\DeletedStudentController', 'deletedStudent', '/education/deletedStudent');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '离校学生', '导出', 'Education\DeletedStudentController', 'deletedStudentExport', '/education/deletedStudent/export');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '离校学生', '恢复', 'Education\DeletedStudentController', 'deletedStudentRestore', '/education/deletedStudent/restore');
	-- 学生课时 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生课时', '查看', 'Education\HourController', 'hour', '/education/hour');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生课时', '退费', 'Education\HourController', 'hourRefundCreate', '/education/hour/refund/create');
	-- 学生晚托 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生晚托', '查看', 'Education\DaycareController', 'daycare', '/education/daycare');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '学生晚托', '退费', 'Education\DaycareController', 'daycareRefundCreate', '/education/daycare/refund/create');
	-- 班级管理 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '班级管理', '查看', 'Education\ClassController', 'class', '/education/class');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '班级管理', '添加', 'Education\ClassController', 'classCreate', '/education/class/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '班级管理', '删除', 'Education\ClassController', 'classDelete', '/education/class/delete');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '班级管理', '点名', 'Education\ClassController', 'classLessonCreate', '/education/class/lesson/create');
	-- 上课记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '上课记录', '查看', 'Education\LessonController', 'lesson', '/education/lesson');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '上课记录', '复核', 'Education\LessonController', 'lessonReview', '/education/lesson/review');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '上课记录', '删除', 'Education\LessonController', 'lessonDelete', '/education/lesson/delete');
	-- 家长会记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '家长会记录', '查看', 'Education\MeetingController', 'meeting', '/education/meeting');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '家长会记录', '添加', 'Education\MeetingController', 'meetingCreate', '/education/meeting/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '家长会记录', '删除', 'Education\MeetingController', 'meetingDelete', '/education/meeting/delete');
	-- 成绩档案 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '成绩档案', '查看', 'Education\ScoreController', 'score', '/education/score');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '成绩档案', '添加', 'Education\ScoreController', 'scoreCreate', '/education/score/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教务运营', '成绩档案', '删除', 'Education\ScoreController', 'scoreDelete', '/education/score/delete');
	
	
-- 财务中心 --
	-- 购课记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '购课记录', '查看', 'Finance\PaymentController', 'payment', '/finance/payment');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '购课记录', '复核', 'Finance\PaymentController', 'paymentReview', '/finance/payment/review');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '购课记录', '删除', 'Finance\PaymentController', 'paymentDelete', '/finance/payment/delete');
	-- 购晚托记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '购晚托记录', '查看', 'Finance\DaycareRecordController', 'daycareRecord', '/finance/daycareRecord');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '购晚托记录', '复核', 'Finance\DaycareRecordController', 'daycareRecordReview', '/finance/daycareRecord/review');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '购晚托记录', '删除', 'Finance\DaycareRecordController', 'daycareRecordDelete', '/finance/daycareRecord/delete');
	-- 课时退费记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '课时退费记录', '查看', 'Finance\RefundPaymentController', 'refundPayment', '/finance/refund/payment');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '课时退费记录', '复核', 'Finance\RefundPaymentController', 'refundPaymentReview', '/finance/refund/payment/review');
	-- 晚托退费记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '晚托退费记录', '查看', 'Finance\RefundDaycareController', 'refundDaycare', '/finance/refund/daycare');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '晚托退费记录', '复核', 'Finance\RefundDaycareController', 'refundDaycareReview', '/finance/refund/daycare/review');
	-- 费用支出记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '费用支出记录', '查看', 'Finance\ExpenditureController', 'expenditure', '/finance/expenditure');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '费用支出记录', '添加', 'Finance\ExpenditureController', 'expenditureCreate', '/finance/expenditure/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '费用支出记录', '复核', 'Finance\ExpenditureController', 'expenditureReview', '/finance/expenditure/review');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '费用支出记录', '删除', 'Finance\ExpenditureController', 'expenditureDelete', '/finance/expenditure/delete');
	-- 发票申请记录 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '发票申请记录', '查看', 'Finance\ReceiptController', 'receipt', '/finance/receipt');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('财务中心', '发票申请记录', '审核', 'Finance\ReceiptController', 'receipt', '/finance/receipt/review');
	

-- 教师中心 --
	-- 通知文件 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教师中心', '通知文件', '添加', 'Teacher\AnnouncementController', 'announcementCreate', '/teacher/announcement/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('教师中心', '通知文件', '删除', 'Teacher\AnnouncementController', 'announcementDelete', '/teacher/announcement/delete');
	
	
-- 文档资料 --
	-- 上课教案 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '上课教案', '查看', 'File\DocumentController', 'document', '/file/document');
	-- 标准教案 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '标准教案', '查看', 'File\StandardDocumentController', 'standardDocument', '/file/standardDocument');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '标准教案', '添加', 'File\StandardDocumentController', 'standardDocumentCreate', '/file/standardDocument/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '标准教案', '修改', 'File\StandardDocumentController', 'standardDocumentEdit', '/file/standardDocument/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '标准教案', '删除', 'File\StandardDocumentController', 'standardDocumentDelete', '/file/standardDocument/delete');
	-- 教学计划 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '教学计划', '查看', 'File\ProjectController', 'project', '/file/project');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '教学计划', '添加', 'File\ProjectController', 'projectCreate', '/file/project/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '教学计划', '修改', 'File\ProjectController', 'projectEdit', '/file/project/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '教学计划', '删除', 'File\ProjectController', 'projectDelete', '/file/project/delete');
	-- 试卷资料 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '试卷资料', '查看', 'File\PaperController', 'paper', '/file/paper');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '试卷资料', '添加', 'File\PaperController', 'paperCreate', '/file/paper/create');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '试卷资料', '修改', 'File\PaperController', 'paperEdit', '/file/paper/edit');
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('文档资料', '试卷资料', '删除', 'File\PaperController', 'paperDelete', '/file/paper/delete');
	
	
-- 统计中心 --
	-- 综合统计 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('统计中心', '综合统计', '查看', 'Statistic\StatisticController', 'statistic', '/statistic/statistic');
	-- 收入支出 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('统计中心', '收入统计', '查看', 'Statistic\IncomeController', 'income', '/statistic/income');
	-- 课消统计 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('统计中心', '课消统计', '查看', 'Statistic\ConsumptionController', 'income', '/statistic/consumption');
	-- 晚托消耗 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('统计中心', '晚托消耗', '查看', 'Statistic\DaycareController', 'daycare', '/statistic/daycare');
	-- 剩余课时 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('统计中心', '剩余课时', '查看', 'Statistic\HourController', 'income', '/statistic/hour');
	-- 工资统计 --
	INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
	VALUES ('统计中心', '工资统计', '查看', 'Statistic\SalaryController', 'income', '/statistic/salary');
	
	
	
-- 学生详情 --
INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
VALUES ('详情资料', '学生详情', '查看', 'StudentController', 'student', '/student');
-- 班级详情 --
INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
VALUES ('详情资料', '班级详情', '查看', 'ClassController', 'class', '/class');
-- 用户详情 --
INSERT INTO `access`(access_category, access_page, access_feature, access_controller, access_function, access_url) 
VALUES ('详情资料', '用户详情', '查看', 'UserController', 'user', '/user');



-- ----------------------------
-- Table structure for `dashboard_access`
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_access`;
CREATE TABLE `dashboard_access` (
  `dashboard_access_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主页功能模块id',
  `dashboard_access_name` varchar(40) UNIQUE NOT NULL COMMENT '主页功能权限名',
  PRIMARY KEY (`dashboard_access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dashboard_access
-- ----------------------------
-- 统计模块 --
INSERT INTO `dashboard_access`(dashboard_access_name) VALUES ('收入/课消数据统计');
-- 退费模块 --
INSERT INTO `dashboard_access`(dashboard_access_name) VALUES ('课时/晚托退款申请');
-- 提示模块 --
INSERT INTO `dashboard_access`(dashboard_access_name) VALUES ('课时/晚托剩余提醒');
-- 发票申请 --
INSERT INTO `dashboard_access`(dashboard_access_name) VALUES ('发票申请审批');
-- 学生生日 --
INSERT INTO `dashboard_access`(dashboard_access_name) VALUES ('学生生日');
-- 用户生日 --
INSERT INTO `dashboard_access`(dashboard_access_name) VALUES ('用户生日');
	
	
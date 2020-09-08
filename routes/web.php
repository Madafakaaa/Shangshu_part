<?php
// 登陆控制器
Route::get('/', 'LoginController@index');
Route::post('/login', 'LoginController@login');
Route::get('/exit', 'LoginController@exit');
// 主页
Route::get('/home', 'HomeController@home');

// 公司管理 ********************************************************************************
    // 校区设置
        // 查看校区 √
        Route::get('/company/department', 'Company\DepartmentController@department');
        // 添加校区 √
        Route::get('/company/department/create', 'Company\DepartmentController@departmentCreate');
        // 保存校区
        Route::post('/company/department/store', 'Company\DepartmentController@departmentStore');
        // 修改校区 √
        Route::get('/company/department/edit', 'Company\DepartmentController@departmentEdit');
        // 更新校区
        Route::post('/company/department/update', 'Company\DepartmentController@departmentUpdate');
        // 删除校区 √
        Route::get('/company/department/delete', 'Company\DepartmentController@departmentDelete');
    // 课程设置
        // 查看课程 √
        Route::get('/company/course', 'Company\CourseController@course');
        // 添加课程 √
        Route::get('/company/course/create', 'Company\CourseController@courseCreate');
        // 保存课程
        Route::post('/company/course/store', 'Company\CourseController@courseStore');
        // 修改课程 √
        Route::get('/company/course/edit', 'Company\CourseController@courseEdit');
        // 更新课程
        Route::post('/company/course/update', 'Company\CourseController@courseUpdate');
        // 删除课程 √
        Route::get('/company/course/delete', 'Company\CourseController@courseDelete');
        // 恢复课程 √
        Route::get('/company/course/restore', 'Company\CourseController@courseRestore');
    // 晚托设置
        // 查看晚托 √
        Route::get('/company/daycare', 'Company\DaycareController@daycare');
        // 添加晚托 √
        Route::get('/company/daycare/create', 'Company\DaycareController@daycareCreate');
        // 保存晚托
        Route::post('/company/daycare/store', 'Company\DaycareController@daycareStore');
        // 修改晚托 √
        Route::get('/company/daycare/edit', 'Company\DaycareController@daycareEdit');
        // 更新晚托
        Route::post('/company/daycare/update', 'Company\DaycareController@daycareUpdate');
        // 删除晚托 √
        Route::get('/company/daycare/delete', 'Company\DaycareController@daycareDelete');
        // 恢复晚托 √
        Route::get('/company/daycare/restore', 'Company\DaycareController@daycareRestore');
    // 用户管理
        // 查看用户 √
        Route::get('/company/user', 'Company\UserController@user');
        // 添加用户 √
        Route::get('/company/user/create', 'Company\UserController@userCreate');
        // 保存用户
        Route::post('/company/user/store', 'Company\UserController@userStore');
        // 修改用户 √
        Route::get('/company/user/edit', 'Company\UserController@userEdit');
        // 更新用户
        Route::post('/company/user/update', 'Company\UserController@userUpdate');
        // 添加用户成功
        Route::get('/company/user/create/success', 'Company\UserController@userCreateSuccess');
        // 删除用户 √
        Route::get('/company/user/delete', 'Company\UserController@userDelete');
        // 用户权限 √
        Route::get('/company/user/access', 'Company\UserController@userAccess');
        // 用户权限更新
        Route::post('/company/user/access/update', 'Company\UserController@userAccessUpdate');
        // 用户权限更新成功
        Route::get('/company/user/access/success', 'Company\UserController@userAccessSuccess');
    // 教师评级
        // 查看教师评级 √
        Route::get('/company/teacherType', 'Company\TeacherTypeController@teacherType');
        // 添加教师评级 √
        Route::get('/company/teacherType/create', 'Company\TeacherTypeController@teacherTypeCreate');
        // 保存教师评级
        Route::post('/company/teacherType/store', 'Company\TeacherTypeController@teacherTypeStore');
        // 修改教师评级 √
        Route::get('/company/teacherType/edit', 'Company\TeacherTypeController@teacherTypeEdit');
        // 更新教师评级
        Route::post('/company/teacherType/update', 'Company\TeacherTypeController@teacherTypeUpdate');
    // 员工工资
        // 查看员工工资 √
        Route::get('/company/salary', 'Company\SalaryController@salary');
        // 结算工资 √
        Route::get('/company/salary/create', 'Company\SalaryController@salaryCreate');
        // 结算工资2-工资信息
        Route::get('/company/salary/create2', 'Company\SalaryController@salaryCreate2');
        // 生成工资结算
        Route::post('/company/salary/store', 'Company\SalaryController@salaryStore');


// 教务运营 ********************************************************************************
    // 学生管理
        // 查看学生 √
        Route::get('/education/student', 'Education\StudentController@student');
        // 导出学生名单 √
        Route::get('/education/student/export', 'Education\StudentController@studentExport');
        // 添加学生 √
        Route::get('/education/student/create', 'Education\StudentController@studentCreate');
        // 保存学生
        Route::post('/education/student/store', 'Education\StudentController@studentStore');
        // 添加学生成功
        Route::get('/education/student/create/success', 'Education\StudentController@studentCreateSuccess');
        // 删除学生(转为离校) √
        Route::get('/education/student/delete', 'Education\StudentController@studentDelete');
        // 学生购课时 √
        Route::get('/education/student/payment/create', 'Education\StudentController@studentPaymentCreate');
        // 保存购课时
        Route::post('/education/student/payment/store', 'Education\StudentController@studentPaymentStore');
        // 学生购课时成功
        Route::get('/education/student/payment/create/success', 'Education\StudentController@studentPaymentCreateSuccess');
        // 学生购晚托 √
        Route::get('/education/student/daycare/create', 'Education\StudentController@studentDaycareCreate');
        // 保存购晚托
        Route::post('/education/student/daycare/store', 'Education\StudentController@studentDaycareStore');
        // 学生购晚托成功
        Route::get('/education/student/daycare/create/success', 'Education\StudentController@studentDaycareCreateSuccess');
    // 学生课时
        // 查看学生课时 √
        Route::get('/education/hour', 'Education\HourController@hour');
        // 申请课时退费 √
        Route::get('/education/hour/refund/create', 'Education\HourController@hourRefundCreate');
        // 课时退费保存
        Route::post('/education/hour/refund/store', 'Education\HourController@hourRefundStore');
    // 学生晚托
        // 查看学生晚托 √
        Route::get('/education/daycare', 'Education\DaycareController@daycare');
        // 申请晚托退费 √
        Route::get('/education/daycare/refund/create', 'Education\DaycareController@daycareRefundCreate');
        // 晚托退费保存
        Route::post('/education/daycare/refund/store', 'Education\DaycareController@daycareRefundStore');
    // 班级管理
        // 查看班级 √
        Route::get('/education/class', 'Education\ClassController@class');
        // 添加班级 √
        Route::get('/education/class/create', 'Education\ClassController@classCreate');
        // 保存班级
        Route::post('/education/class/store', 'Education\ClassController@classStore');
        // 添加班级成功
        Route::get('/education/class/create/success', 'Education\ClassController@classCreateSuccess');
        // 删除班级(结课) √
        Route::get('/education/class/delete', 'Education\ClassController@classDelete');
        // 添加上课记录（点名） √
        Route::get('/education/class/lesson/create', 'Education\ClassController@classLessonCreate');
        // 保存上课记录
        Route::post('/education/class/lesson/store', 'Education\ClassController@classLessonStore');
        // 添加上课记录成功
        Route::get('/education/class/lesson/create/success', 'Education\ClassController@classLessonCreateSuccess');
    // 上课记录
        // 查看上课记录 √
        Route::get('/education/lesson', 'Education\LessonController@lesson');
        // 复核上课记录 √
        Route::get('/education/lesson/review', 'Education\LessonController@lessonReview');
        // 复核全部上课记录 √
        Route::get('/education/lesson/review/all', 'Education\LessonController@lessonReviewAll');
        // 删除上课记录 √
        Route::get('/education/lesson/delete', 'Education\LessonController@lessonDelete');


// 财务中心 ********************************************************************************
    // 课程购买记录
        // 查看购课记录 √
        Route::get('/finance/payment', 'Finance\PaymentController@payment');
        // 复核购课记录 √
        Route::get('/finance/payment/review', 'Finance\PaymentController@paymentReview');
        // 复核全部购课记录 √
        Route::get('/finance/payment/review/all', 'Finance\PaymentController@paymentReviewAll');
        // 删除购课记录 √
        Route::get('/finance/payment/delete', 'Finance\PaymentController@paymentDelete');
    // 晚托购买记录
        // 查看购晚托记录 √
        Route::get('/finance/daycareRecord', 'Finance\DaycareRecordController@daycareRecord');
        // 复核晚托记录 √
        Route::get('/finance/daycareRecord/review', 'Finance\DaycareRecordController@daycareRecordReview');
        // 复核全部晚托记录 √
        Route::get('/finance/daycareRecord/review/all', 'Finance\DaycareRecordController@daycareRecordReviewAll');
        // 删除晚托记录 √
        Route::get('/finance/daycareRecord/delete', 'Finance\DaycareRecordController@daycareRecordDelete');
    // 课时退费记录
        // 查看课时退费记录 √
        Route::get('/finance/refund/payment', 'Finance\RefundPaymentController@refundPayment');
        // 审核课时退费记录 √
        Route::get('/finance/refund/payment/review', 'Finance\RefundPaymentController@refundPaymentReview');
        // 提交课时退费记录审核结果 √
        Route::post('/finance/refund/payment/review/store', 'Finance\RefundPaymentController@refundPaymentReviewStore');
        // 删除课时退费记录 √
        Route::get('/finance/refund/payment/delete', 'Finance\RefundPaymentController@refundPaymentDelete');
    // 晚托退费记录
        // 查看晚托退费记录 √
        Route::get('/finance/refund/daycare', 'Finance\RefundDaycareController@refundDaycare');
        // 审核晚托退费记录 √
        Route::get('/finance/refund/daycare/review', 'Finance\RefundDaycareController@refundDaycareReview');
        // 提交晚托退费记录审核结果 √
        Route::post('/finance/refund/daycare/review/store', 'Finance\RefundDaycareController@refundDaycareReviewStore');
        // 删除晚托退费记录 √
        Route::get('/finance/refund/daycare/delete', 'Finance\RefundDaycareController@refundDaycareDelete');
    // 费用支出记录
        // 查看支出记录 √
        Route::get('/finance/expenditure', 'Finance\ExpenditureController@expenditure');
        // 添加支出记录 √
        Route::get('/finance/expenditure/create', 'Finance\ExpenditureController@expenditureCreate');
        // 保存支出记录
        Route::post('/finance/expenditure/store', 'Finance\ExpenditureController@expenditureStore');
        // 审核支出记录 √
        Route::get('/finance/expenditure/review', 'Finance\ExpenditureController@expenditureReview');
        // 批量审核支出记录 √
        Route::get('/finance/expenditure/review/all', 'Finance\ExpenditureController@expenditureReviewAll');
        // 删除支出记录 √
        Route::get('/finance/expenditure/delete', 'Finance\ExpenditureController@expenditureDelete');


// 文档资料 ********************************************************************************
    // 教案查询
        // 查看教案 √
        Route::get('/file/document', 'File\DocumentController@document');
        // 下载教案 √
        Route::get('/file/document/download', 'File\DocumentController@documentDownload');
    // 标准教案
        // 查看标准教案 √
        Route::get('/file/standardDocument', 'File\StandardDocumentController@standardDocument');
        // 下载标准教案 √
        Route::get('/file/standardDocument/download', 'File\StandardDocumentController@standardDocumentDownload');
    // 试卷资料
        // 查看试卷资料 √
        Route::get('/file/paper', 'File\PaperController@paper');
        // 下载试卷 √
        Route::get('/file/paper/download', 'File\PaperController@paperDownload');
    // 原系统教案查询
        // 查看原系统教案 √
        Route::get('/file/document', 'File\DocumentController@document');
        // 下载教案 √
        Route::get('/file/document/download', 'File\DocumentController@documentDownload');


// 教师中心 ********************************************************************************
    // 教师考核
        // 查看教师考核 √
        Route::get('/teacher/assessment', 'Teacher\AssessmentController@assessment');
        // 新建自评
        Route::get('/teacher/assessment/self/create', 'Teacher\AssessmentController@assessmentSelfCreate');
        // 保存自评
        Route::post('/teacher/assessment/self/store', 'Teacher\AssessmentController@assessmentSelfStore');
        // 新建教务评
        Route::get('/teacher/assessment/staff/create', 'Teacher\AssessmentController@assessmentStaffCreate');
        // 保存教务评
        Route::post('/teacher/assessment/staff/store', 'Teacher\AssessmentController@assessmentStaffStore');
        // 新建分校长评
        Route::get('/teacher/assessment/manager/create', 'Teacher\AssessmentController@assessmentManagerCreate');
        // 保存分校长评
        Route::post('/teacher/assessment/manager/store', 'Teacher\AssessmentController@assessmentManagerStore');


// 统计中心 ********************************************************************************
    // 收入统计
        // 查看收入统计 √
        Route::get('/statistic/income', 'Statistic\IncomeController@income');
    // 课消统计
        // 查看课消统计 √
        Route::get('/statistic/consumption', 'Statistic\ConsumptionController@consumption');
    // 课时统计
        // 查看课时统计 √
        Route::get('/statistic/hour', 'Statistic\HourController@hour');
    // 工资统计
        // 查看工资统计 √
        Route::get('/statistic/salary', 'Statistic\SalaryController@salary');


// 个人信息
    // 查看个人信息
    Route::get('/profile', 'ProfileController@profile');
    // 修改个人信息
    Route::post('/profile/update', 'ProfileController@profileUpdate');
    // 修改密码
    Route::post('/profile/password', 'ProfileController@profilePassword');


// 学生详情
    // 查看学生详情 √
    Route::get('/student', 'StudentController@student');
    // 添加班级
    Route::get('/student/member/add', 'StudentController@studentMemberAdd');
    // 删除班级
    Route::get('/student/member/delete', 'StudentController@studentMemberDelete');
    // 修改学生信息
    Route::post('/student/update', 'StudentController@studentUpdate');
// 班级详情
    // 查看班级详情 √
    Route::get('/class', 'ClassController@class');
    // 添加成员
    Route::get('/class/member/add', 'ClassController@classMemberAdd');
    // 删除成员
    Route::get('/class/member/delete', 'ClassController@classMemberDelete');
    // 修改班级信息
    Route::post('/class/update', 'ClassController@classUpdate');
// 用户详情
    // 查看用户详情 √
    Route::get('/user', 'UserController@user');
    // 修改用户信息
    Route::post('/user/update', 'UserController@userUpdate');

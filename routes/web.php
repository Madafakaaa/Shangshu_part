<?php
// 登陆控制器
Route::get('/', 'LoginController@index');
Route::post('/login', 'LoginController@login');
Route::get('/exit', 'LoginController@exit');
// 主页
Route::get('/home', 'HomeController@home');

// 公司管理 ********************************************************************************
// 校区设置
Route::get('/company/department', 'Company\DepartmentController@department');
    // 添加校区
    Route::get('/company/department/create', 'Company\DepartmentController@departmentCreate');
    // 保存校区
    Route::post('/company/department/store', 'Company\DepartmentController@departmentStore');
    // 修改校区
    Route::get('/company/department/edit', 'Company\DepartmentController@departmentEdit');
    // 更新校区
    Route::post('/company/department/update', 'Company\DepartmentController@departmentUpdate');
    // 删除校区
    Route::get('/company/department/delete', 'Company\DepartmentController@departmentDelete');
// 课程设置
Route::get('/company/course', 'Company\CourseController@course');
    // 添加课程
    Route::get('/company/course/create', 'Company\CourseController@courseCreate');
    // 保存课程
    Route::post('/company/course/store', 'Company\CourseController@courseStore');
    // 修改课程
    Route::get('/company/course/edit', 'Company\CourseController@courseEdit');
    // 更新课程
    Route::post('/company/course/update', 'Company\CourseController@courseUpdate');
    // 删除课程
    Route::get('/company/course/delete', 'Company\CourseController@courseDelete');
    // 恢复课程
    Route::get('/company/course/restore', 'Company\CourseController@courseRestore');
// 用户管理
Route::get('/company/user', 'Company\UserController@user');
    // 添加用户
    Route::get('/company/user/create', 'Company\UserController@userCreate');
    // 保存用户
    Route::post('/company/user/store', 'Company\UserController@userStore');
    // 删除用户
    Route::get('/company/user/delete', 'Company\UserController@userDelete');
    // 用户权限
    Route::get('/company/user/access', 'Company\UserController@userAccess');
    Route::post('/company/user/access/update', 'Company\UserController@userAccessUpdate');
    // 密码恢复
    Route::get('/company/user/password/restore', 'Company\UserController@userPasswordRestore');

// 教务中心 ********************************************************************************
// 学生管理
Route::get('/education/student', 'Education\StudentController@student');
    // 添加学生
    Route::get('/education/student/create', 'Education\StudentController@studentCreate');
    // 保存学生
    Route::post('/education/student/store', 'Education\StudentController@studentStore');
    // 添加学生成功
    Route::get('/education/student/create/success', 'Education\StudentController@studentCreateSuccess');
    // 学生删除(转为离校)
    Route::get('/education/student/delete', 'Education\StudentController@studentDelete');
    // 学生购课
    Route::get('/education/student/payment/create', 'Education\StudentController@studentPaymentCreate');
    // 保存购课
    Route::post('/education/student/payment/store', 'Education\StudentController@studentPaymentStore');
    // 学生购课成功
    Route::get('/education/student/payment/create/success', 'Education\StudentController@studentPaymentCreateSuccess');
// 学生课时
Route::get('/education/hour', 'Education\HourController@hour');
// 班级管理
Route::get('/education/class', 'Education\ClassController@class');
    // 添加班级
    Route::get('/education/class/create', 'Education\ClassController@classCreate');
    // 保存班级
    Route::post('/education/class/store', 'Education\ClassController@classStore');
    // 添加班级成功
    Route::get('/education/class/create/success', 'Education\ClassController@classCreateSuccess');
    // 班级删除(结课)
    Route::get('/education/class/delete', 'Education\ClassController@classDelete');
    // 添加上课记录
    Route::get('/education/class/lesson/create', 'Education\ClassController@classLessonCreate');
    // 保存上课记录
    Route::post('/education/class/lesson/store', 'Education\ClassController@classLessonStore');
// 上课记录
Route::get('/education/lesson', 'Education\LessonController@lesson');
// 购课记录
Route::get('/education/payment', 'Education\PaymentController@payment');


// 财务中心 ********************************************************************************
// 课时缴费
Route::get('/finance/payment', 'Finance\PaymentController@payment');
    // 购课删除(转为离校)
    Route::get('/finance/payment/delete', 'Finance\PaymentController@paymentDelete');



// 班级详情
Route::get('/class', 'ClassController@class');
    // 添加成员
    Route::get('/class/member/add', 'ClassController@classMemberAdd');
    // 删除成员
    Route::get('/class/member/delete', 'ClassController@classMemberDelete');

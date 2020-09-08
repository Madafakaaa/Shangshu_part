<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ClassController extends Controller
{

    public function class(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/class", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $db_classes = DB::table('class')
                        ->join('department', 'class.class_department', '=', 'department.department_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->join('user', 'class.class_teacher', '=', 'user.user_id')
                        ->where('class_is_available', 1)
                        ->whereIn('class_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null,
                        "filter_subject" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_classes = $db_classes->where('class_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_classes = $db_classes->where('class_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 科目
        if ($request->filled('filter_subject')) {
            $db_classes = $db_classes->where('class_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        $db_classes = $db_classes->orderBy('class_department', 'asc')
                                 ->orderBy('class_grade', 'asc')
                                 ->orderBy('class_max_num', 'asc')
                                 ->orderBy('class_id', 'asc')
                                 ->get();

        $classes = array();
        foreach($db_classes as $db_class){
            $temp=array();
            $temp['department_name']=$db_class->department_name;
            $temp['class_id']=$db_class->class_id;
            $temp['class_name']=$db_class->class_name;
            $temp['user_id']=$db_class->user_id;
            $temp['user_name']=$db_class->user_name;
            $temp['grade_name']=$db_class->grade_name;
            $temp['subject_name']=$db_class->subject_name;
            $temp['class_current_num']=$db_class->class_current_num;
            $temp['class_max_num']=$db_class->class_max_num;
            $temp['class_attended_num']=$db_class->class_attended_num;

            $temp['members'] = array();
            $members = DB::table('member')
                         ->join('student', 'student.student_id', '=', 'member.member_student')
                         ->join('grade', 'grade.grade_id', '=', 'student.student_grade')
                         ->where('member_class', $db_class->class_id)
                         ->get();
            foreach($members as $member){
                $member_temp = array();
                $member_temp['student_id'] = $member->student_id;
                $member_temp['student_name'] = $member->student_name;
                $member_temp['grade_name'] = $member->grade_name;
                $temp['members'][] = $member_temp;
            }

            $temp['lessons'] = array();
            $lessons = DB::table('lesson')
                         ->join('user', 'user.user_id', '=', 'lesson.lesson_teacher')
                         ->where('lesson_class', $db_class->class_id)
                         ->orderBy('lesson_date', 'desc')
                         ->orderBy('lesson_start', 'desc')
                         ->get();
            foreach($lessons as $lesson){
                $lesson_temp = array();
                $lesson_temp['lesson_date'] = $lesson->lesson_date;
                $lesson_temp['lesson_start'] = $lesson->lesson_start;
                $lesson_temp['lesson_teacher'] = $lesson->user_name;
                $lesson_temp['lesson_student_num'] = $lesson->lesson_student_num;
                $lesson_temp['lesson_attended_num'] = $lesson->lesson_attended_num;
                $lesson_temp['lesson_leave_num'] = $lesson->lesson_leave_num;
                $lesson_temp['lesson_absence_num'] = $lesson->lesson_absence_num;
                $temp['lessons'][] = $lesson_temp;
            }
            $classes[]=$temp;
        }

        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        // 返回列表视图
        return view('education/class/class', ['classes' => $classes,
                                              'filters' => $filters,
                                              'filter_departments' => $filter_departments,
                                              'filter_grades' => $filter_grades,
                                              'filter_subjects' => $filter_subjects]);
    }

    public function classCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/class/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取年级信息
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $users = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->where('user_department', Session::get('user_department'))
                   ->where('user_is_available', 1)
                   ->get();
        $other_department_users = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->where('user_department', '!=',Session::get('user_department'))
                   ->where('user_is_available', 1)
                   ->orderBy('user_department', 'asc')
                   ->get();
        return view('education/class/classCreate', ['grades' => $grades, 'subjects' => $subjects, 'users' => $users, 'other_department_users' => $other_department_users]);
    }

    public function classStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $class_name = $request->input('input_class_name');
        $class_grade = $request->input('input_class_grade');
        $class_subject = $request->input('input_class_subject');
        $class_teacher = $request->input('input_class_teacher');
        $class_max_num = $request->input('input_class_max_num');

        $class_department = Session::get('user_department');

        // 生成班级ID
        if(DB::table('class')->where('class_department', '=', $class_department)->exists()){
            // 获取上一个班级班号
            $pre_class_id = DB::table('class')
                                ->where('class_department', '=', $class_department)
                                ->orderBy('class_id', 'desc')
                                ->limit(1)
                                ->first();
            if(intval(substr($pre_class_id->class_id , 7 , 10))==999){
                return redirect("/education/class/create")
                       ->with(['notify' => true,
                               'type' => 'danger',
                               'title' => '客户添加失败',
                               'message' => '本校本月添加学生数量已超过超出上限，错误码:201']);
            }
            $new_class_num = intval(substr($pre_class_id->class_id , 7 , 10))+1;
            $class_id = "C".substr(date('Ym'),2).sprintf("%02d", $class_department).sprintf("%03d", $new_class_num);
        }else{
            // 生成新班级ID
            $class_id = "C".substr(date('Ym'),2).sprintf("%02d", $class_department).sprintf("%03d", 1);
        }
        // 插入数据库
        DB::beginTransaction();
        try{
            DB::table('class')->insert(
                ['class_id' => $class_id,
                 'class_department' => $class_department,
                 'class_name' => $class_name,
                 'class_grade' => $class_grade,
                 'class_subject' => $class_subject,
                 'class_teacher' => $class_teacher,
                 'class_max_num' => $class_max_num,
                 'class_create_user' => Session::get('user_id'),
                 'class_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/class/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '班级添加失败',
                           'message' => '班级添加失败，该班级已经存在于本校区，错误码:202']);
        }
        DB::commit();
        // 返回学生列表
        return redirect("/education/class/create/success?id=".encode($class_id, 'class_id'))
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '班级添加成功',
                       'message' => '班级添加成功']);
    }

    public function classCreateSuccess(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取id
        $class_id = decode($request->input('id'), 'class_id');
        return view('education/class/classCreateSuccess', ['class_id' => $class_id]);
    }


    public function classDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/class/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取class_id
        $request_ids=$request->input('id');
        $class_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $class_ids[]=decode($request_id, 'class_id');
            }
        }else{
            $class_ids[]=decode($request_ids, 'class_id');
        }
        // 更新班级可用状态
        DB::beginTransaction();
        try{
            foreach ($class_ids as $class_id){
                // 更新班级信息：人数，状态，修改信息
                DB::table('class')
                  ->where('class_id', $class_id)
                  ->update(['class_is_available' => 0,
                            'class_modified_user' => Session::get('user_id'),
                            'class_modified_time' => date('Y-m-d H:i:s')]);
                // 从班级成员中删除该班级
                // DB::table('member')->where('member_class', $class_id)->delete();
                // 从课程表中删除该班级
                /* TODO */
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/class")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '班级删除失败',
                         'message' => '班级删除失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/education/class")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '班级删除成功',
                       'message' => '班级删除成功!']);
    }

    /**
     * 课程考勤视图
     * URL: GET /education/schedule/attend/{schedule_id}
     * @param  int  $schedule_id
     */
    public function classLessonCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/class/lesson/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        $class_id = decode($request->input('id'), 'class_id');
        // 获取班级信息
        $class = DB::table('class')
                   ->join('department', 'class.class_department', '=', 'department.department_id')
                   ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                   ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                   ->join('user', 'class.class_teacher', '=', 'user.user_id')
                   ->where('class_id', $class_id)
                   ->first();

        // 获取本校教师
        $teachers = DB::table('user')
                      ->join('department', 'user.user_department', '=', 'department.department_id')
                      ->where('user_department', '=', $class->class_department)
                      ->where('user_is_available', 1)
                      ->get();
        $other_department_teachers = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->where('user_department', '!=', $class->class_department)
                   ->where('user_is_available', 1)
                   ->orderBy('user_department', 'asc')
                   ->get();

        // 获取班级成员
        $members = array();
        // 获取班级学生
        $db_members = DB::table('member')
                        ->where('member_class', $class_id)
                        ->get();
        foreach ($db_members as $member){
            // 获取学生信息
            $student = DB::table('student')
                         ->where('student_id', $member->member_student)
                         ->first();
            // 获取学生已购课程
            $courses = DB::table('hour')
                         ->join('student', 'student.student_id', '=', 'hour.hour_student')
                         ->join('course', 'hour.hour_course', '=', 'course.course_id')
                         ->where([
                             ['student.student_id', '=', $member->member_student],
                             ['hour.hour_remain', '>', '0'],
                         ])
                         ->get();
            $members[] = array($student, $courses);
        }
        return view('education/class/classLessonCreate', ['class' => $class,
                                                          'teachers' => $teachers,
                                                          'other_department_teachers' => $other_department_teachers,
                                                          'members' => $members]);
    }

    public function classLessonStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $lesson_class = $request->input('input_lesson_class');
        $lesson_teacher = $request->input('input_lesson_teacher');
        $lesson_date = $request->input('input_lesson_date');
        $lesson_start = $request->input('input_lesson_start');
        // 获取班级信息
        $class = DB::table('class')
                   ->where('class_id', $lesson_class)
                   ->first();
        // 判断是否有学生
        if($class->class_current_num==0){
            return redirect("/education/class")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '班级点名失败',
                           'message' => '班级内没有学生，错误码:326']);
        }

        // 判断老师是否有冲突
        $teacher_lesson_exist = DB::table('participant')
                                  ->join('lesson', 'participant.participant_lesson', 'lesson.lesson_id')
                                  ->where('lesson_teacher', $lesson_teacher)
                                  ->where('lesson_date', $lesson_date)
                                  ->where('lesson_start', $lesson_start)
                                  ->exists();
        if($teacher_lesson_exist){
            // 返回
            return redirect("/education/class/lesson/create?id=".encode($lesson_class, 'class_id'))
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '课程点名失败',
                         'message' => "教师在此时间段已有上课记录！"]);
        }
        // 获取上课人数
        $lesson_student_num = $class->class_current_num;
        /*
         *  教案
         */
        // 获取教案文件
        if (!$request->hasFile('file')) {
            return redirect("/education/class/lesson/create?id=".encode($lesson_class, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传教案',
                           'message' => '没有上传教案，班级点名失败，错误码:401']);
        }
        $tmp_file = $request->file('file');
        if (!$tmp_file->isValid()) {
            return redirect("/education/class/lesson/create?id=".encode($lesson_class, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法教案文件，班级点名失败，错误码:401']);
        }
        // 获取文件大小(MB)
        // $document_file_size = $tmp_file->getClientSize(); 导致500？？
        $document_file_size = 0;
        // 获取文件名称
        $document_name = $tmp_file->getClientOriginalName();
        // 获取文件扩展名
        $document_ext = $tmp_file->getClientOriginalExtension();
        // 生成路径
        $document_path = "D".date('ymdHis').rand(1000000000,9999999999).".".$document_ext;
        // 获取教案信息
        $document_department = $class->class_department;
        $document_subject = $class->class_subject;
        $document_grade = $class->class_grade;
        $document_teacher = $lesson_teacher;

        /*
         *  扣除学生课时提交上课记录和教案
         */
        // 统计上课人数
        $lesson_attended_num = 0; // 正常
        $lesson_leave_num = 0; // 请假
        $lesson_absence_num = 0; // 旷课

        DB::beginTransaction();
        try{
            // 添加教案记录
            $document_id = DB::table('document')->insertGetId(
                                ['document_name' => $document_name,
                                 'document_department' => $document_department,
                                 'document_subject' => $document_subject,
                                 'document_grade' => $document_grade,
                                 'document_teacher' => $document_teacher,
                                 'document_path' => $document_path,
                                 'document_file_size' => $document_file_size,
                                 'document_create_user' => Session::get('user_id')]
                            );

            // 添加上课记录
            $lesson_id = DB::table('lesson')->insertGetId(
                              ['lesson_class' => $lesson_class,
                               'lesson_teacher' => $lesson_teacher,
                               'lesson_date' => $lesson_date,
                               'lesson_start' => $lesson_start,
                               'lesson_student_num' => $lesson_student_num,
                               'lesson_document' => $document_id,
                               'lesson_create_user' => Session::get('user_id')]
                          );
            // 消耗课时价值
            $lesson_hour_price = 0;
            $lesson_hour_amount = 0;
            // 扣除学生课时
            for($i=1;$i<=$lesson_student_num;$i++){
                $participant_student = $request->input('input_student_id_'.$i);
                $participant_attend_status = $request->input('input_student_status_'.$i);
                if($participant_attend_status==1){ // 正常（计课时）
                    // 判断学生是否有课程冲突
                    if(
                       DB::table('participant')
                       ->join('lesson', 'participant.participant_lesson', 'lesson.lesson_id')
                       ->where('participant_student', $participant_student)
                       ->where('lesson_date', $lesson_date)
                       ->where('lesson_start', $lesson_start)
                       ->exists()
                      )
                    {
                        DB::rollBack();
                        // 返回第一步
                        return redirect("/education/class/lesson/create?id=".encode($lesson_class, 'class_id'))
                               ->with(['notify' => true,
                                     'type' => 'danger',
                                     'title' => '课程点名失败',
                                     'message' => "学生在此时间段已有上课记录，学号：{$participant_student}"]);
                    }
                    $participant_course = $request->input('input_student_course_'.$i);
                    $participant_amount = $request->input('input_student_amount_'.$i);
                    $lesson_attended_num = $lesson_attended_num + 1; // 增加正常上课人数
                }else if($participant_attend_status==2){ // 请假（不计课时）
                    $participant_course = 0;
                    $participant_amount = 0;
                    $lesson_leave_num = $lesson_leave_num + 1; // 增加请假人数
                }else { // 旷课（计课时）
                    $participant_course = $request->input('input_student_course_'.$i);
                    $participant_amount = $request->input('input_student_amount_'.$i);
                    $lesson_absence_num = $lesson_absence_num + 1; // 增加旷课人数
                }
                // 扣除剩余课时
                if($participant_attend_status!=2){
                    // 扣除学生正常课时
                    DB::table('hour')
                      ->where('hour_course', $participant_course)
                      ->where('hour_student', $participant_student)
                      ->decrement('hour_remain', $participant_amount);
                    // 增加已用正常课时数
                    DB::table('hour')
                      ->where('hour_course', $participant_course)
                      ->where('hour_student', $participant_student)
                      ->increment('hour_used', $participant_amount);
                    // 增加消耗课时价值
                    $hour_unit_price = DB::table('hour')
                                         ->where('hour_course', $participant_course)
                                         ->where('hour_student', $participant_student)
                                         ->first()
                                         ->hour_unit_price;
                    $lesson_hour_price += $hour_unit_price * $participant_amount;
                    $lesson_hour_amount+=$participant_amount;
                }
                // 添加上课成员表
                DB::table('participant')->insert(
                    ['participant_lesson' => $lesson_id,
                     'participant_student' => $participant_student,
                     'participant_attend_status' => $participant_attend_status,
                     'participant_course' => $participant_course,
                     'participant_amount' => $participant_amount,
                     'participant_create_user' => Session::get('user_id')]
                );
            }
            // 获取教师提成
            $lesson_teacher_fee = 0;
            if($lesson_attended_num!=0){
                $lesson_teacher_fee = DB::table('deduction')
                                        ->join('user', 'user.user_teacher_type', 'deduction.deduction_teacher_type')
                                        ->where('user_id', $lesson_teacher)
                                        ->where('deduction_grade', $class->class_grade)
                                        ->where('deduction_student_num', $lesson_attended_num)
                                        ->first()
                                        ->deduction_fee;
            }
            // 完善上课记录
            DB::table('lesson')
              ->where('lesson_id', $lesson_id)
              ->update(['lesson_hour_price' => $lesson_hour_price,
                        'lesson_hour_amount' => $lesson_hour_amount,
                        'lesson_teacher_fee' => $lesson_teacher_fee,
                        'lesson_attended_num' => $lesson_attended_num,
                        'lesson_leave_num' => $lesson_leave_num,
                        'lesson_absence_num' => $lesson_absence_num]);
            // 更新班级上课记录数量
            DB::table('class')
              ->where('class_id', $lesson_class)
              ->increment('class_attended_num');
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回第一步
            return redirect("/education/class/lesson/create?id=".encode($lesson_class, 'class_id'))
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '学生剩余课时不足',
                         'message' => '学生剩余课时不足，错误码:328']);
        }
        DB::commit();
        // 上传教案文件
        //$tmp_file->move("/files/document", $document_path);
        $tmp_file->move(public_path("/files/document"), $document_path);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/education/class/lesson/create/success?id=".encode($lesson_class, 'class_id'))
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程点名成功',
                       'message' => '课程点名成功']);
    }


    public function classLessonCreateSuccess(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取id
        $class_id = decode($request->input('id'), 'class_id');
        return view('education/class/classLessonCreateSuccess', ['class_id' => $class_id]);
    }

}

<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class StudentController extends Controller
{

    /**
     * 显示单个班级详细信息
     * URL: GET /student/{id}
     * @param  int  $student_id
     */
    public function student(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $student_id = decode($request->input('id'), 'student_id');
        // 获取数据信息
        $student = DB::table('student')
                     ->join('department', 'student.student_department', '=', 'department.department_id')
                     ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                     ->where('student_id', $student_id)
                     ->first();

        // 获取班级成员数据
        $members = DB::table('member')
                      ->join('class', 'member.member_class', '=', 'class.class_id')
                      ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                      ->where('member.member_student', $student_id)
                      ->get();
        // 生成已有班级ID数组
        $member_class_ids = array();
        foreach($members as $member){
            $member_class_ids[] = $member->member_class;
        }
        // 获取可添加班级信息
        $same_grade_classes = DB::table('class')
                      ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                      ->where('class_department', $student->student_department)
                      ->where('class_grade', $student->student_grade)
                      ->where('class_is_available', 1)
                      ->whereColumn('class_current_num', '<', 'class_max_num')
                      ->whereNotIn('class_id', $member_class_ids)
                      ->orderBy('class_id', 'asc')
                      ->get();
        $diff_grade_classes = DB::table('class')
                      ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                      ->where('class_department', $student->student_department)
                      ->where('class_grade', '!=', $student->student_grade)
                      ->where('class_is_available', 1)
                      ->whereColumn('class_current_num', '<', 'class_max_num')
                      ->whereNotIn('class_id', $member_class_ids)
                      ->orderBy('class_grade', 'asc')
                      ->orderBy('class_id', 'asc')
                      ->get();

        // 获取上课记录
        $db_lessons = DB::table('participant')
                        ->join('lesson', 'participant.participant_lesson', '=', 'lesson.lesson_id')
                        ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->join('user', 'lesson.lesson_teacher', '=', 'user.user_id')
                        ->leftJoin('course', 'participant.participant_course', '=', 'course.course_id')
                        ->where('participant_student', $student_id)
                        ->orderBy('lesson_date', 'desc')
                        ->orderBy('lesson_start', 'desc')
                        ->get();

        $lessons = array();
        foreach($db_lessons as $db_lesson){
            $temp=array();
            $temp['lesson_id']=$db_lesson->lesson_id;
            $temp['class_id']=$db_lesson->class_id;
            $temp['class_name']=$db_lesson->class_name;
            $temp['teacher_id']=$db_lesson->user_id;
            $temp['teacher_name']=$db_lesson->user_name;
            $temp['grade_name']=$db_lesson->grade_name;
            $temp['subject_name']=$db_lesson->subject_name;
            $temp['lesson_date']=$db_lesson->lesson_date;
            $temp['lesson_start']=$db_lesson->lesson_start;
            $temp['lesson_attended_num']=$db_lesson->lesson_attended_num;
            $temp['lesson_leave_num']=$db_lesson->lesson_leave_num;
            $temp['lesson_absence_num']=$db_lesson->lesson_absence_num;
            $temp['lesson_document']=$db_lesson->lesson_document;
            $temp['course_name']=$db_lesson->course_name;
            $temp['participant_amount']=$db_lesson->participant_amount;
            $temp['participant_attend_status']=$db_lesson->participant_attend_status;
            $lessons[]=$temp;
        }

        // 获取剩余课时信息
        $hours = DB::table('hour')
                   ->join('course', 'hour.hour_course', '=', 'course.course_id')
                   ->where('hour_student', $student_id)
                   ->orderBy('hour_remain', 'asc')
                   ->orderBy('hour_used', 'desc')
                   ->get();

        // 获取晚托及购买信息
        $daycare_records = DB::table('daycare_record')
                             ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                             ->orderBy('daycare_record_is_refunded', 'asc')
                             ->orderBy('daycare_record_start', 'desc')
                             ->where('daycare_record.daycare_record_student', $student_id)
                             ->get();

        // 获取购课记录
        $payments = DB::table('payment')
                      ->join('course', 'payment.payment_course', '=', 'course.course_id')
                      ->where('payment_student', $student_id)
                      ->orderBy('payment_date', 'desc')
                      ->orderBy('payment_id', 'desc')
                      ->get();

        // 获取年级信息用于修改
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();

        return view('student/student', ['student' => $student,
                                        'same_grade_classes' => $same_grade_classes,
                                        'diff_grade_classes' => $diff_grade_classes,
                                        'members' => $members,
                                        'lessons' => $lessons,
                                        'hours' => $hours,
                                        'daycare_records' => $daycare_records,
                                        'payments' => $payments,
                                        'grades' => $grades]);
    }

    /**
     * 插入班级提交
     * URL: GET /operation/member/store
     */
    public function studentMemberAdd(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $member_student = $request->input('input_member_student');
        $member_class = $request->input('input_member_class');

        $class = DB::table('class')
                   ->where('class_id', $member_class)
                   ->first();

        if($class->class_current_num>=$class->class_max_num){
            return redirect("/student?id=".encode($student_id, 'student_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '加入班级失败',
                           'message' => '加入班级失败，班级人数已达上限']);
        }
        // 插入数据库
        DB::beginTransaction();
        try{
            // 添加班级成员
            DB::table('member')->insert(
                ['member_student' => $member_student,
                 'member_class' => $member_class,
                 'member_create_user' => Session::get('user_id')]
            );
            // 增加班级人数
            DB::table('class')
              ->where('class_id', $member_class)
              ->increment('class_current_num');
            // 插入学生动态
            /* TODO */
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/student?id=".encode($member_student, 'student_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '添加学生失败',
                           'message' => '添加学生失败，请重新输入信息']);
        }
        DB::commit();
        // 返回客户列表
        return redirect("/student?id=".encode($member_student, 'student_id'))
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '添加学生成功',
                      'message' => '添加学生成功']);
    }

    /**
     * 班级成员删除
     * URL: DELETE/student/{student_id}
     */
    public function studentMemberDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $student_id = decode($request->input('student_id'), 'student_id');
        $class_id = decode($request->input('class_id'), 'class_id');
        // 插入数据库
        DB::beginTransaction();
        try{
            // 删除班级成员
            DB::table('member')
              ->where('member_student', $student_id)
              ->where('member_class', $class_id)
              ->delete();
            // 更新班级人数
            DB::table('class')
              ->where('class_id', $class_id)
              ->decrement('class_current_num');
            // 插入学生动态
            //
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/student?id=".encode($student_id, 'student_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '删除成员失败',
                           'message' => '删除成员失败，请联系系统管理员']);
        }
        DB::commit();
        // 返回客户列表
        return redirect("/student?id=".encode($student_id, 'student_id'))
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '删除成员成功',
                      'message' => '删除成员成功']);
    }

    /**
     * 修改班级提交
     * URL: PUT /student/{id}
     * @param  Request  $request
     * @param  $request->input('input1'): 名称
     * @param  $request->input('input2'): 年级
     * @param  $request->input('input3'): 科目
     * @param  $request->input('input4'): 负责教师
     * @param  $request->input('input5'): 最大人数
     * @param  $request->input('input6'): 备注
     * @param  int  $student_id
     */
    public function studentUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
         // 获取表单输入
        $student_id = $request->input('input_student_id');
        $student_name = $request->input('input_student_name');
        $student_gender = $request->input('input_student_gender');
        $student_grade = $request->input('input_student_grade');
        $student_school = $request->input('input_student_school');
        $student_phone = $request->input('input_student_phone');
        $student_birthday = $request->input('input_student_birthday');
        // 更新数据库
        try{
            DB::table('student')
              ->where('student_id', $student_id)
              ->update(['student_name' => $student_name,
                        'student_gender' => $student_gender,
                        'student_grade' => $student_grade,
                        'student_school' => $student_school,
                        'student_phone' => $student_phone,
                        'student_birthday' => $student_birthday,
                        'student_modified_user' => Session::get('user_id'),
                        'student_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/student/edit?id=".encode($student_id, 'student_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '学生修改失败',
                           'message' => '学生修改失败，请重新输入信息']);
        }
        return redirect("/student?id=".encode($student_id, 'student_id'))
               ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '学生修改成功',
                         'message' => '学生修改成功!']);
    }

}

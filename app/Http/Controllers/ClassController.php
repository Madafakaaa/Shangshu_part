<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ClassController extends Controller
{

    /**
     * 显示单个班级详细信息
     * URL: GET /class/{id}
     * @param  int  $class_id
     */
    public function class(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/class')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        $class_id = decode($request->input('id'), 'class_id');
        // 获取数据信息
        $class = DB::table('class')
                   ->join('department', 'class.class_department', '=', 'department.department_id')
                   ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                   ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                   ->join('user', 'class.class_teacher', '=', 'user.user_id')
                   ->where('class_id', $class_id)
                   ->first();

        // 获取成员数据
        $members = DB::table('member')
                  ->join('student', 'member.member_student', '=', 'student.student_id')
                  ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                  ->where('member.member_class', $class_id)
                  ->get();

        // 生成已有学生ID数组
        $member_student_ids = array();
        foreach($members as $member){
            $member_student_ids[] = $member->member_student;
        }

        // 获取可添加学生信息
        $same_grade_students = DB::table('student')
                                 ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                                 ->where('student_department', $class->class_department)
                                 ->where('student_grade', $class->class_grade)
                                 ->where('student_is_available', 1)
                                 ->whereNotIn('student_id', $member_student_ids)
                                 ->orderBy('student_id', 'asc')
                                 ->get();
        $diff_grade_students = DB::table('student')
                                 ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                                 ->where('student_department', $class->class_department)
                                 ->where('student_grade', '!=', $class->class_grade)
                                 ->where('student_is_available', 1)
                                 ->whereNotIn('student_id', $member_student_ids)
                                 ->orderBy('student_grade', 'asc')
                                 ->orderBy('student_id', 'asc')
                                 ->get();

        // 获取上课记录
        $db_lessons = DB::table('lesson')
                        ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->join('user', 'lesson.lesson_teacher', '=', 'user.user_id')
                        ->where('lesson_class', $class_id)
                        ->orderBy('lesson_date', 'desc')
                        ->orderBy('lesson_start', 'desc')
                        ->limit(200)
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
            // 获取创建者信息
            $temp_create_user = DB::table('user')
                                  ->where('user_id', $db_lesson->lesson_create_user)
                                  ->first();
            $temp['create_user_id']=$temp_create_user->user_id;
            $temp['create_user_name']=$temp_create_user->user_name;
            // 获取上课成员
            $temp['participants'] = array();
            $participants = DB::table('participant')
                             ->join('student', 'student.student_id', '=', 'participant.participant_student')
                             ->join('grade', 'grade.grade_id', '=', 'student.student_grade')
                             ->leftJoin('course', 'course.course_id', '=', 'participant.participant_course')
                             ->where('participant_lesson', $db_lesson->lesson_id)
                             ->get();
            foreach($participants as $participant){
                $participant_temp = array();
                $participant_temp['student_id'] = $participant->student_id;
                $participant_temp['student_name'] = $participant->student_name;
                $participant_temp['grade_name'] = $participant->grade_name;
                $participant_temp['course_name'] = $participant->course_name;
                $participant_temp['participant_amount'] = $participant->participant_amount;
                $participant_temp['participant_attend_status'] = $participant->participant_attend_status;
                $temp['participants'][] = $participant_temp;
            }
            $lessons[]=$temp;
        }

        // 获取年级信息
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $users = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->where('user_department', $class->class_department)
                   ->where('user_is_available', 1)
                   ->get();
        $other_department_users = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->where('user_department', '!=', $class->class_department)
                   ->where('user_is_available', 1)
                   ->orderBy('user_department', 'asc')
                   ->get();
        return view('class/class', ['class' => $class,
                                    'same_grade_students' => $same_grade_students,
                                    'diff_grade_students' => $diff_grade_students,
                                    'members' => $members,
                                    'lessons' => $lessons,
                                    'grades' => $grades,
                                    'subjects' => $subjects,
                                    'users' => $users,
                                    'other_department_users' => $other_department_users]);
    }

    /**
     * 插入班级提交
     * URL: GET /operation/member/store
     */
    public function classMemberAdd(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $member_class = $request->input('input_member_class');
        $member_student = $request->input('input_member_student');

        $class = DB::table('class')
                   ->where('class_id', $member_class)
                   ->first();

        if($class->class_current_num>=$class->class_max_num){
            return redirect("/class?id=".encode($class_id, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '添加学生失败',
                           'message' => '添加学生失败，班级人数已达上限']);
        }
        // 插入数据库
        DB::beginTransaction();
        try{
            // 添加班级成员
            DB::table('member')->insert(
                ['member_class' => $member_class,
                 'member_student' => $member_student,
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
            return redirect("/class?id=".encode($member_class, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '添加学生失败',
                           'message' => '添加学生失败，请重新输入信息']);
        }
        DB::commit();
        // 返回客户列表
        return redirect("/class?id=".encode($member_class, 'class_id'))
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '添加学生成功',
                      'message' => '添加学生成功']);
    }

    /**
     * 班级成员删除
     * URL: DELETE/class/{class_id}
     */
    public function classMemberDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $class_id = decode($request->input('class_id'), 'class_id');
        $student_id = decode($request->input('student_id'), 'student_id');
        // 插入数据库
        DB::beginTransaction();
        try{
            // 删除班级成员
            DB::table('member')
              ->where('member_class', $class_id)
              ->where('member_student', $student_id)
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
            return redirect("/class?id=".encode($class_id, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '删除成员失败',
                           'message' => '删除成员失败，请联系系统管理员']);
        }
        DB::commit();
        // 返回客户列表
        return redirect("/class?id=".encode($class_id, 'class_id'))
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '删除成员成功',
                      'message' => '删除成员成功']);
    }

    /**
     * 修改班级提交
     * URL: PUT /class/{id}
     * @param  Request  $request
     * @param  $request->input('input1'): 名称
     * @param  $request->input('input2'): 年级
     * @param  $request->input('input3'): 科目
     * @param  $request->input('input4'): 负责教师
     * @param  $request->input('input5'): 最大人数
     * @param  $request->input('input6'): 备注
     * @param  int  $class_id
     */
    public function classUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
         // 获取表单输入
        $class_id = $request->input('input_class_id');
        $class_name = $request->input('input_class_name');
        $class_grade = $request->input('input_class_grade');
        $class_subject = $request->input('input_class_subject');
        $class_teacher = $request->input('input_class_teacher');
        $class_max_num = $request->input('input_class_max_num');
        // 更新数据库
        try{
            DB::table('class')
              ->where('class_id', $class_id)
              ->update(['class_name' => $class_name,
                        'class_grade' => $class_grade,
                        'class_subject' => $class_subject,
                        'class_teacher' => $class_teacher,
                        'class_max_num' => $class_max_num,
                        'class_modified_user' => Session::get('user_id'),
                        'class_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/class/edit?id=".encode($class_id, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '班级修改失败',
                           'message' => '班级修改失败，请重新输入信息']);
        }
        return redirect("/class?id=".encode($class_id, 'class_id'))
               ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '班级修改成功',
                         'message' => '班级修改成功!']);
    }

}

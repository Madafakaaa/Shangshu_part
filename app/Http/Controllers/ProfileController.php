<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ProfileController extends Controller
{

    /**
     * 显示单个班级详细信息
     * URL: GET /class/{id}
     * @param  int  $user_id
     */
    public function profile(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $user_id = Session::get('user_id');

        // 获取数据信息
        $user = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->join('teacher_type', 'user.user_teacher_type', '=', 'teacher_type.teacher_type_id')
                   ->join('position', 'user.user_position', '=', 'position.position_id')
                   ->where('user_id', $user_id)
                   ->first();

        // 获取上课记录
        $db_lessons = DB::table('lesson')
                        ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->where('lesson_teacher', $user_id)
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
            $temp['grade_name']=$db_lesson->grade_name;
            $temp['subject_name']=$db_lesson->subject_name;
            $temp['lesson_date']=$db_lesson->lesson_date;
            $temp['lesson_start']=$db_lesson->lesson_start;
            $temp['lesson_teacher_fee']=$db_lesson->lesson_teacher_fee;
            $temp['lesson_hour_price']=$db_lesson->lesson_hour_price;
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

        // 获取负责班级
        $classes = DB::table('class')
                      ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                      ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                      ->where('class_teacher', $user_id)
                      ->where('class_is_available', 1)
                      ->orderBy('class_grade', 'asc')
                      ->orderBy('class_max_num', 'asc')
                      ->orderBy('class_current_num', 'asc')
                      ->get();

        // 获取考核信息
        $month_assessments = DB::table('month_assessment')
                               ->join('user', 'month_assessment.month_assessment_user', '=', 'user.user_id')
                               ->where('user_id', $user_id)
                               ->orderBy('month_assessment_month', 'desc')
                               ->get();

        // 获取工资信息
        $salaries = DB::table('salary')
                      ->join('user', 'salary.salary_user', '=', 'user.user_id')
                      ->where('user_id', $user_id)
                      ->orderBy('salary_month', 'desc')
                      ->get();

        return view('profile/profile', ['user' => $user,
                                        'salaries' => $salaries,
                                        'classes' => $classes,
                                        'month_assessments' => $month_assessments,
                                        'lessons' => $lessons]);
    }

    /**
     * 修改班级提交
     * URL: PUT /class/{id}
     * @param  Request  $request
     * @param  int  $user_id
     */
    public function profileUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
         // 获取表单输入
        $user_gender = $request->input('input_user_gender');
        $user_birthday = $request->input('input_user_birthday');
        // 更新数据库
        try{
            DB::table('user')
              ->where('user_id', Session::get('user_id'))
              ->update(['user_gender' => $user_gender,
                        'user_birthday' => $user_birthday,
                        'user_modified_user' => Session::get('user_id'),
                        'user_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/profile")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '信息修改失败',
                           'message' => '信息修改失败，请重新输入信息']);
        }
        return redirect("/profile")
               ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '信息修改成功',
                         'message' => '信息修改成功!']);
    }

    /**
     * 修改密码
     * URL: PUT /class/{id}
     * @param  Request  $request
     * @param  int  $user_id
     */
    public function profilePassword(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
         // 获取表单输入
        $old_password = $request->input('old_password');
        $new_password = $request->input('new_password');
        $new_password_confirm = $request->input('new_password_confirm');
        if($new_password!==$new_password_confirm){
            return redirect("/profile")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '新密码两次输入不同',
                           'message' => '新密码两次输入不同，修改密码失败！']);
        }
        $db_old_password = DB::table('user')
                              ->where('user_id', Session::get('user_id'))
                              ->first()
                              ->user_password;
        if($old_password!==$db_old_password){
            return redirect("/profile")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '原密码输入错误',
                           'message' => '原密码输入错误，修改密码失败！']);
        }
        // 更新数据库
        try{
            DB::table('user')
              ->where('user_id', Session::get('user_id'))
              ->update(['user_password' => $new_password,
                        'user_modified_user' => Session::get('user_id'),
                        'user_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/profile")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '密码修改失败',
                           'message' => '密码修改失败，请重新输入信息']);
        }
        return redirect("/profile")
               ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '密码修改成功',
                         'message' => '密码修改成功!']);
    }
}

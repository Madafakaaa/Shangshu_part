<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class LessonController extends Controller
{

    public function lesson(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取用户校区权限
        // $department_access = Session::get('department_access');
                  //->whereIn('lesson_department', $department_access)
        // 获取数据
        $db_lessons = DB::table('lesson')
                        ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                        ->join('department', 'class.class_department', '=', 'department.department_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->join('user', 'lesson.lesson_teacher', '=', 'user.user_id')
                        ->orderBy('lesson_date', 'desc')
                        ->orderBy('lesson_start', 'desc')
                        ->get();

        $lessons = array();
        foreach($db_lessons as $db_lesson){
            $temp=array();
            $temp['lesson_id']=$db_lesson->lesson_id;
            $temp['department_name']=$db_lesson->department_name;
            $temp['class_id']=$db_lesson->class_id;
            $temp['class_name']=$db_lesson->class_name;
            $temp['user_id']=$db_lesson->user_id;
            $temp['user_name']=$db_lesson->user_name;
            $temp['grade_name']=$db_lesson->grade_name;
            $temp['subject_name']=$db_lesson->subject_name;
            $temp['lesson_date']=$db_lesson->lesson_date;
            $temp['lesson_start']=$db_lesson->lesson_start;
            $temp['lesson_attended_num']=$db_lesson->lesson_attended_num;
            $temp['lesson_leave_num']=$db_lesson->lesson_leave_num;
            $temp['lesson_absence_num']=$db_lesson->lesson_absence_num;

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
                $temp['participants'][] = $participant_temp;
            }
            $lessons[]=$temp;
        }

        // 获取校区、年级信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();

        // 返回列表视图
        return view('education/lesson/lesson', ['lessons' => $lessons]);
    }

    public function lessonDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取lesson_id
        $request_ids=$request->input('id');
        $lesson_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $lesson_ids[]=decode($request_id, 'lesson_id');
            }
        }else{
            $lesson_ids[]=decode($request_ids, 'lesson_id');
        }
        // 更新班级可用状态
        try{
            foreach ($lesson_ids as $lesson_id){
                DB::table('lesson')
                  ->where('lesson_id', $lesson_id)
                  ->update(['lesson_is_available' => 0,
                            'lesson_modified_user' => Session::get('user_id'),
                            'lesson_modified_time' => date('Y-m-d H:i:s')]);
                // 从班级成员中删除该班级
                /*
                DB::table('member')
                  ->where('member_lesson', $lesson_id)
                  ->delete();
                */
                // 从课程安排中删除该班级
                /* TODO */
            }
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/education/lesson")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '班级删除失败',
                         'message' => '班级删除失败，错误码:204']);
        }
        // 返回课程列表
        return redirect("/education/lesson")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '班级删除成功',
                       'message' => '班级删除成功!']);
    }

}

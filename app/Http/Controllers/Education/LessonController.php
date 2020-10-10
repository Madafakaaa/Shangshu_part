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
        // 检测用户权限
        if(!in_array("/education/lesson", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $db_lessons = DB::table('lesson')
                        ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                        ->join('department', 'class.class_department', '=', 'department.department_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->leftJoin('user', 'lesson.lesson_review_user', '=', 'user.user_id')
                        ->whereIn('class_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null,
                        "filter_subject" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_lessons = $db_lessons->where('class_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_lessons = $db_lessons->where('class_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 科目
        if ($request->filled('filter_subject')) {
            $db_lessons = $db_lessons->where('class_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        $db_lessons = $db_lessons->orderBy('lesson_date', 'desc')
                                 ->orderBy('lesson_start', 'desc')
                                 ->limit(200)
                                 ->get();

        $lessons = array();
        foreach($db_lessons as $db_lesson){
            $temp=array();
            $temp['lesson_id']=$db_lesson->lesson_id;
            $temp['department_name']=$db_lesson->department_name;
            $temp['class_id']=$db_lesson->class_id;
            $temp['class_name']=$db_lesson->class_name;
            $temp['review_user_id']=$db_lesson->user_id;
            $temp['review_user_name']=$db_lesson->user_name;
            $temp['grade_name']=$db_lesson->grade_name;
            $temp['subject_name']=$db_lesson->subject_name;
            $temp['lesson_date']=$db_lesson->lesson_date;
            $temp['lesson_start']=$db_lesson->lesson_start;
            $temp['lesson_attended_num']=$db_lesson->lesson_attended_num;
            $temp['lesson_leave_num']=$db_lesson->lesson_leave_num;
            $temp['lesson_absence_num']=$db_lesson->lesson_absence_num;
            $temp['lesson_document']=$db_lesson->lesson_document;
            // 获取创建者信息
            $temp_teacher = DB::table('user')
                                  ->where('user_id', $db_lesson->lesson_teacher)
                                  ->first();
            $temp['teacher_id'] = $temp_teacher->user_id;
            $temp['teacher_name'] = $temp_teacher->user_name;
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
                $participant_temp['participant_secondary_date'] = $participant->participant_secondary_date;
                $participant_temp['participant_secondary_start'] = $participant->participant_secondary_start;
                $temp['participants'][] = $participant_temp;
            }
            $lessons[]=$temp;
        }

        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();

        // 返回列表视图
        return view('education/lesson/lesson', ['lessons' => $lessons,
                                               'filters' => $filters,
                                               'filter_departments' => $filter_departments,
                                               'filter_grades' => $filter_grades,
                                               'filter_subjects' => $filter_subjects]);
    }

    public function lessonDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/lesson/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
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
        // 删除上课记录
        foreach ($lesson_ids as $lesson_id){
            DB::beginTransaction();
            try{
                // 获取上课信息
                $lesson =  DB::table('lesson')
                             ->where('lesson_id', $lesson_id)
                             ->first();
                // 获取上课成员信息
                $participants =  DB::table('participant')
                                   ->where('participant_lesson', $lesson_id)
                                   ->get();
                // 更新学生课时
                foreach($participants as $participant){
                    // 减少已用课时
                    DB::table('hour')
                      ->where('hour_course', $participant->participant_course)
                      ->where('hour_student', $participant->participant_student)
                      ->decrement('hour_used', $participant->participant_amount);
                    // 增加剩余课时
                    DB::table('hour')
                      ->where('hour_course', $participant->participant_course)
                      ->where('hour_student', $participant->participant_student)
                      ->increment('hour_remain', $participant->participant_amount);
                }
                // 获取教案文件、信息
                $document =  DB::table('document')
                               ->where('document_id', $lesson->lesson_document)
                               ->first();

                $document_path = "files/document/".$document->document_path;
                // 删除教案数据
                DB::table('document')
                  ->where('document_id', $lesson->lesson_document)
                  ->delete();
                // 删除上课记录信息
                DB::table('lesson')
                  ->where('lesson_id', $lesson_id)
                  ->delete();
                // 删除上课成员信息 ？？
                DB::table('participant')
                  ->where('participant_lesson', $lesson_id)
                  ->delete();
                // 更新班级上课记录数量
                DB::table('class')
                  ->where('class_id', $lesson->lesson_class)
                  ->decrement('class_attended_num');
                // 删除教案文件
                if (file_exists($document_path)) {
                    unlink($document_path);
                }
            }
            // 捕获异常
            catch(Exception $e){
                DB::rollBack();
                return redirect("/education/lesson")
                       ->with(['notify' => true,
                             'type' => 'danger',
                             'title' => '上课记录删除失败',
                             'message' => '上课记删除失败，错误码:204']);
            }
            DB::commit();
        }
        // 返回课程列表
        return redirect("/education/lesson")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '上课记删除成功',
                       'message' => '上课记删除成功!']);
    }

    public function lessonReviewAll(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/lesson/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 复核上课记录
        DB::beginTransaction();
        try{
            // 更新可复核班级上课记录复核信息
            DB::table('lesson')
              ->whereNull('lesson_review_user')
              ->where('lesson_create_user', '<>', Session::get('user_id'))
              ->update(['lesson_review_user' => Session::get('user_id'),
                        'lesson_review_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/lesson")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '可复核上课记录复核失败',
                         'message' => '可复核上课记复核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/education/lesson")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '全部可复核上课记录复核成功',
                       'message' => '全部可复核上课记录复核成功!']);
    }

    public function lessonReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/lesson/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
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
        // 复核上课记录
        DB::beginTransaction();
        try{
            foreach ($lesson_ids as $lesson_id){
                // 更新班级上课记录复核信息
                DB::table('lesson')
                  ->where('lesson_id', $lesson_id)
                  ->update(['lesson_review_user' => Session::get('user_id'),
                            'lesson_review_time' => date('Y-m-d H:i:s')]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/lesson")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '上课记录复核失败',
                         'message' => '上课记复核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/education/lesson")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '上课记录复核成功',
                       'message' => '上课记录复核成功!']);
    }

}

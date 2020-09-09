<?php
namespace App\Http\Controllers\Statistic;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ConsumptionController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     */
    public function consumption(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/statistic/consumption", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_participants = DB::table('participant')
                              ->join('lesson', 'lesson.lesson_id', '=', 'participant.participant_lesson')
                              ->join('student', 'participant.participant_student', '=', 'student.student_id')
                              ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                              ->join('department', 'student.student_department', '=', 'department.department_id')
                              ->join('course', 'participant.participant_course', '=', 'course.course_id')
                              ->join('subject', 'course.course_subject', '=', 'subject.subject_id')
                              ->join('hour', [
                                                 ['hour.hour_course', '=', 'course.course_id'],
                                                 ['hour.hour_student', '=', 'student.student_id'],
                                             ])

                              ->select(DB::raw('sum(participant_amount) as total_participant_amount, count(*) as lesson_num, student_id, student_name, course_name, department_name, hour_remain, subject_name, grade_name, hour_unit_price'))
                              ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null,
                        "filter_subject" => null,
                        "filter_course" => null,
                        "filter_date_start" =>date('Y-m')."-01",
                        "filter_date_end" => date('Y-m-d'),
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_participants = $db_participants->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_participants = $db_participants->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 课程
        if ($request->filled('filter_course')) {
            $db_participants = $db_participants->where('course_id', '=', $request->input('filter_course'));
            $filters['filter_course']=$request->input("filter_course");
        }
        // 科目
        if ($request->filled('filter_subject')) {
            $db_participants = $db_participants->where('course_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        // 期限
        if ($request->filled('filter_date_start')) {
            $filters['filter_date_start']=$request->input("filter_date_start");
        }
        if ($request->filled('filter_date_end')) {
            $filters['filter_date_end']=$request->input("filter_date_end");
        }
        $db_participants = $db_participants->where('lesson_date', '>=', $filters['filter_date_start'])
                                           ->where('lesson_date', '<=', $filters['filter_date_end'])
                                           ->groupBy('student_id', 'course_id')
                                           ->orderBy('student_department', 'asc')
                                           ->orderBy('student_grade', 'asc')
                                           ->orderBy('student_id', 'asc')
                                           ->orderBy('course_subject', 'asc')
                                           ->orderBy('course_type', 'asc')
                                           ->get();
        // 数据面板
        $dashboard = array(
                             "dashboard_dates" => null,
                             "dashboard_lesson_num" => 0,
                             "dashboard_hour_used" => 0,
                             "dashboard_hour_used_price" => 0,
                           );
        $dashboard['dashboard_dates'] = date('Y.m.d', strtotime($filters['filter_date_start']))." - ".date('Y.m.d', strtotime($filters['filter_date_end']));
        if(date('Y', strtotime($filters['filter_date_start']))==date('Y', strtotime($filters['filter_date_end']))){
            $dashboard['dashboard_dates'] = date('Y.m.d', strtotime($filters['filter_date_start']))." - ".date('m.d', strtotime($filters['filter_date_end']));
        }
        if(date('Y.m', strtotime($filters['filter_date_start']))==date('Y.m', strtotime($filters['filter_date_end']))){
            $dashboard['dashboard_dates'] = date('Y.m.d', strtotime($filters['filter_date_start']))." - ".date('d', strtotime($filters['filter_date_end']));
        }
        if($filters['filter_date_start']==$filters['filter_date_end']){
            $dashboard['dashboard_dates'] = date('Y.m.d', strtotime($filters['filter_date_start']));
        }

        $participants = array();
        foreach($db_participants as $db_participant){
            $temp = array();
            $temp['total_participant_amount'] = $db_participant->total_participant_amount;
            $temp['total_participant_price'] = $db_participant->total_participant_amount*$db_participant->hour_unit_price;
            $temp['lesson_num'] = $db_participant->lesson_num;
            $temp['student_id'] = $db_participant->student_id;
            $temp['student_name'] = $db_participant->student_name;
            $temp['course_name'] = $db_participant->course_name;
            $temp['department_name'] = $db_participant->department_name;
            $temp['hour_remain'] = $db_participant->hour_remain;
            $temp['hour_remain_price'] = $db_participant->hour_remain*$db_participant->hour_unit_price;
            $temp['subject_name'] = $db_participant->subject_name;
            $temp['grade_name'] = $db_participant->grade_name;
            // 更新dashboard
            $dashboard['dashboard_lesson_num']+=$temp['lesson_num'];
            $dashboard['dashboard_hour_used']+=$temp['total_participant_amount'];
            $dashboard['dashboard_hour_used_price']+=$temp['total_participant_price'];
            $participants[] = $temp;
        }

        // 获取校区、年级、科目、课程信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $filter_courses = DB::table('course')->where('course_is_available', 1)->orderBy('course_grade', 'asc')->orderBy('course_subject', 'asc')->orderBy('course_type', 'asc')->get();
        // 返回列表视图
        return view('statistic/consumption/consumption', ['participants' => $participants,
                                                          'dashboard' => $dashboard,
                                                          'filters' => $filters,
                                                          'filter_departments' => $filter_departments,
                                                          'filter_courses' => $filter_courses,
                                                          'filter_subjects' => $filter_subjects,
                                                          'filter_grades' => $filter_grades]);
    }

}

<?php
namespace App\Http\Controllers\Statistic;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class HourController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     */
    public function hour(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/statistic/hour", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_hours = DB::table('hour')
                      ->join('student', 'hour.hour_student', '=', 'student.student_id')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->join('course', 'hour.hour_course', '=', 'course.course_id')
                      ->leftJoin('subject', 'course.course_subject', '=', 'subject.subject_id')
                      ->where('student_is_available', 1)
                      ->where('hour_remain', '>', 0)
                      ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null,
                        "filter_subject" => null,
                        "filter_course" => null,
                        "filter_grade" => null,
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_hours = $db_hours->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_hours = $db_hours->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 课程
        if ($request->filled('filter_course')) {
            $db_hours = $db_hours->where('course_id', '=', $request->input('filter_course'));
            $filters['filter_course']=$request->input("filter_course");
        }
        // 科目
        if ($request->filled('filter_subject')) {
            $db_hours = $db_hours->where('course_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        $db_hours = $db_hours->orderBy('student_department', 'asc')
                             ->orderBy('student_grade', 'asc')
                             ->orderBy('student_id', 'asc')
                             ->orderBy('course_subject', 'asc')
                             ->orderBy('course_type', 'asc')
                             ->get();

        // 数据面板
        $dashboard = array(
                             "dashboard_hour_refunded" => 0,
                             "dashboard_hour_used" => 0,
                             "dashboard_hour_remain" => 0,
                             "dashboard_hour_remain_price" => 0,
                           );

        $hours = array();
        foreach($db_hours as $db_hour){
            $temp = array();
            $temp['student_name'] = $db_hour->student_name;
            $temp['student_id'] = $db_hour->student_id;
            $temp['department_name'] = $db_hour->department_name;
            $temp['course_name'] = $db_hour->course_name;
            $temp['grade_name'] = $db_hour->grade_name;
            $temp['subject_name'] = $db_hour->subject_name;
            $temp['hour_unit_price'] = $db_hour->hour_unit_price;
            $temp['hour_remain'] = $db_hour->hour_remain;
            $temp['hour_remain_price'] = $db_hour->hour_remain*$db_hour->hour_unit_price;
            $temp['hour_used'] = $db_hour->hour_used;
            $temp['hour_used_price'] = $db_hour->hour_used*$db_hour->hour_unit_price;
            $temp['hour_refunded'] = $db_hour->hour_refunded;
            // 更新dashboard
            $dashboard['dashboard_hour_refunded']+=$temp['hour_refunded'];
            $dashboard['dashboard_hour_used']+=$temp['hour_used'];
            $dashboard['dashboard_hour_remain']+=$temp['hour_remain'];
            $dashboard['dashboard_hour_remain_price']+=$temp['hour_remain_price'];
            $hours[] = $temp;
        }

        // 获取校区、年级、科目、课程信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $filter_courses = DB::table('course')->where('course_is_available', 1)->orderBy('course_grade', 'asc')->orderBy('course_subject', 'asc')->orderBy('course_type', 'asc')->get();
        // 返回列表视图
        return view('statistic/hour/hour', ['hours' => $hours,
                                           'dashboard' => $dashboard,
                                           'filters' => $filters,
                                           'filter_departments' => $filter_departments,
                                           'filter_courses' => $filter_courses,
                                           'filter_subjects' => $filter_subjects,
                                           'filter_grades' => $filter_grades]);
    }

}

<?php
namespace App\Http\Controllers\Statistic;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class DaycareController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     */
    public function daycare(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null,
                        "filter_date_start" =>date('Y-m')."-01",
                        "filter_date_end" => date('Y-m-d'),
                    );

        // 期限
        if ($request->filled('filter_date_start')) {
            $filters['filter_date_start']=$request->input("filter_date_start");
        }
        if ($request->filled('filter_date_end')) {
            $filters['filter_date_end']=$request->input("filter_date_end");
        }
        // 获取数据
        $db_daycare_records = DB::table('daycare_record')
                                ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                                ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                                ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                                ->join('department', 'student.student_department', '=', 'department.department_id')
                                ->whereIn('student_department', $department_access)
                                ->whereRaw('( (daycare_record_start >= ? AND daycare_record_start <= ?) OR
                                              (daycare_record_end >= ? AND daycare_record_end <= ?) OR
                                              (daycare_record_start <= ? AND daycare_record_end >= ?) )',
                                           [$filters['filter_date_start'], $filters['filter_date_end'],
                                            $filters['filter_date_start'], $filters['filter_date_end'],
                                            $filters['filter_date_start'], $filters['filter_date_end']]);
        // 校区
        if ($request->filled('filter_department')) {
            $db_daycare_records = $db_daycare_records->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_daycare_records = $db_daycare_records->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_daycare_records = $db_daycare_records->where('daycare_record_is_refunded', 0)
                                                 ->orderBy('student_department', 'asc')
                                                 ->orderBy('student_grade', 'asc')
                                                 ->get();
        // 数据面板
        $dashboard = array(
                             "dashboard_dates" => null,
                             "dashboard_student_num" => 0,
                             "dashboard_day_num" => 0,
                             "dashboard_daycare_value" => 0,
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
        $daycare_records = array();
        foreach($db_daycare_records as $db_daycare_record){
            $temp = array();
            $temp['student_id'] = $db_daycare_record->student_id;
            $temp['student_name'] = $db_daycare_record->student_name;
            $temp['department_name'] = $db_daycare_record->department_name;
            $temp['grade_name'] = $db_daycare_record->grade_name;
            $temp['daycare_record_start'] = $db_daycare_record->daycare_record_start;
            $temp['daycare_record_end'] = $db_daycare_record->daycare_record_end;
            $temp['daycare_record_total_price'] = $db_daycare_record->daycare_record_total_price;
            $temp['daycare_record_month'] = $db_daycare_record->daycare_record_month;
            $temp['daycare_record_unit_price'] = round($db_daycare_record->daycare_record_total_price/$db_daycare_record->daycare_record_month/30, 2);
            // 计算使用天数
            // 计算统计天数
            $date_start=date('Y-m-d', strtotime($filters['filter_date_start']));
            $date_end=date('Y-m-d', strtotime($filters['filter_date_end']));
            $Date_List_start=explode("-",$date_start);
            $Date_List_end=explode("-",$date_end);
            $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
            $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
            $temp['duration']=round(($d2-$d1)/3600/24)+1;
            // 计算开始后未使用天数
            if($filters['filter_date_start']<$temp['daycare_record_start']){
                  $date_start=date('Y-m-d', strtotime($filters['filter_date_start']));
                  $date_end=date('Y-m-d', strtotime($temp['daycare_record_start']));
                  $Date_List_start=explode("-",$date_start);
                  $Date_List_end=explode("-",$date_end);
                  $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                  $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                  $temp['duration']-=round(($d2-$d1)/3600/24);
            }
            if($filters['filter_date_end']>$temp['daycare_record_end']){
                  $date_start=date('Y-m-d', strtotime($temp['daycare_record_end']));
                  $date_end=date('Y-m-d', strtotime($filters['filter_date_end']));
                  $Date_List_start=explode("-",$date_start);
                  $Date_List_end=explode("-",$date_end);
                  $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                  $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                  $temp['duration']-=round(($d2-$d1)/3600/24);
            }
            $temp['daycare_value'] = $temp['duration']*$temp['daycare_record_unit_price'];
            // 更新dashboard
            $dashboard['dashboard_student_num']++;
            $dashboard['dashboard_day_num']+=$temp['duration'];
            $dashboard['dashboard_daycare_value']+=$temp['daycare_value'];
            $daycare_records[] = $temp;
        }

        // 获取校区、年级、科目、课程信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('statistic/daycare/daycare', ['daycare_records' => $daycare_records,
                                                  'dashboard' => $dashboard,
                                                  'filters' => $filters,
                                                  'filter_departments' => $filter_departments,
                                                  'filter_grades' => $filter_grades]);
    }

}

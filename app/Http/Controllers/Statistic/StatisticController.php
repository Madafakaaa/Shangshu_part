<?php
namespace App\Http\Controllers\Statistic;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class StatisticController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     */
    public function statistic(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 合计数据
        $total = array(
                        "total_course_income" => 0,
                        "total_daycare_income" => 0,
                        "total_income" => 0,
                        "total_course_consumption" => 0,
                        "total_daycare_consumption" => 0,
                        "total_consumption" => 0,
                        "total_salary_expenditure" => 0,
                        "total_other_expenditure" => 0,
                        "total_expenditure" => 0,
                        "total_profit" => 0,
                    );
        // 搜索条件
        $filters = array(
                        "filter_month" => date('Y-m'),
                        "filter_date_start" => date('Y-m')."-01",
                        "filter_date_end" => date('Y-m-t'),
                    );
        // 月份
        if ($request->filled('filter_month')) {
            $filters['filter_month']=$request->input("filter_month");
            $filters['filter_date_start']=$request->input("filter_month")."-01";
            $filters['filter_date_end']=date('Y-m-t',strtotime($request->input("filter_month")));
        }
        // 获取校区
        $db_departments = DB::table('department')
                           ->where('department_is_available', 1)
                           ->orderBy('department_id', 'asc')
                           ->get();
        $departments = array();
        foreach($db_departments as $db_department){
            $temp = array();
            $temp['month'] = $filters['filter_month'];
            $temp['department_name'] = $db_department->department_name;
            // 课时收入
            $temp['course_income'] = 0;
            $temp_payment = DB::table('payment')
                              ->join('student', 'payment.payment_student', '=', 'student.student_id')
                              ->select(DB::raw('sum(payment_total_price) as sum_hour_price'))
                              ->where('payment_date', 'like', $filters['filter_month'].'%')
                              ->where('student_department', $db_department->department_id)
                              ->first();
            $temp['course_income'] += round($temp_payment->sum_hour_price,2);
            $total['total_course_income'] += $temp['course_income'];
            // 晚托收入
            $temp['daycare_income'] = 0;
            $temp_daycare_record = DB::table('daycare_record')
                                      ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                                      ->select(DB::raw('sum(daycare_record_total_price) as sum_daycare_price'))
                                      ->where('daycare_record_date', 'like', $filters['filter_month'].'%')
                                      ->where('student_department', $db_department->department_id)
                                      ->first();
            $temp['daycare_income'] += round($temp_daycare_record->sum_daycare_price,2);
            $total['total_daycare_income'] += $temp['daycare_income'];
            // 合计收入
            $temp['income'] = $temp['course_income']+$temp['daycare_income'];
            $total['total_income'] += $temp['income'];
            // 课时消耗
            $temp['course_consumption'] = 0;
            $temp_lesson = DB::table('lesson')
                          ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                          ->select(DB::raw('sum(lesson_hour_price) as sum_consumption_hour_price'))
                          ->where('lesson_date', 'like', $filters['filter_month'].'%')
                          ->where('class_department', $db_department->department_id)
                          ->first();
            $temp['course_consumption'] += round($temp_lesson->sum_consumption_hour_price,2);
            $total['total_course_consumption'] += $temp['course_consumption'];
            // 晚托消耗
            $temp['daycare_consumption'] = 0;
            $temp_daycare_records = DB::table('daycare_record')
                                    ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                                    ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                                    ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                                    ->join('department', 'student.student_department', '=', 'department.department_id')
                                    ->whereRaw('( (daycare_record_start >= ? AND daycare_record_start <= ?) OR
                                                  (daycare_record_end >= ? AND daycare_record_end <= ?) OR
                                                  (daycare_record_start <= ? AND daycare_record_end >= ?) )',
                                               [$filters['filter_date_start'], $filters['filter_date_end'],
                                                $filters['filter_date_start'], $filters['filter_date_end'],
                                                $filters['filter_date_start'], $filters['filter_date_end']])
                                    ->where('student_department', $db_department->department_id)
                                    ->get();
            foreach($temp_daycare_records as $db_daycare_record){
                $temp2 = array();
                $temp2['daycare_record_start'] = $db_daycare_record->daycare_record_start;
                $temp2['daycare_record_end'] = $db_daycare_record->daycare_record_end;
                $temp2['daycare_record_total_price'] = $db_daycare_record->daycare_record_total_price;
                $temp2['daycare_record_month'] = $db_daycare_record->daycare_record_month;
                $temp2['daycare_record_unit_price'] = round($db_daycare_record->daycare_record_total_price/$db_daycare_record->daycare_record_month/30, 2);
                // 计算使用天数
                // 计算统计天数
                $date_start=date('Y-m-d', strtotime($filters['filter_date_start']));
                $date_end=date('Y-m-d', strtotime($filters['filter_date_end']));
                $Date_List_start=explode("-",$date_start);
                $Date_List_end=explode("-",$date_end);
                $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                $temp2['duration']=round(($d2-$d1)/3600/24)+1;
                // 计算开始后未使用天数
                if($filters['filter_date_start']<$temp2['daycare_record_start']){
                      $date_start=date('Y-m-d', strtotime($filters['filter_date_start']));
                      $date_end=date('Y-m-d', strtotime($temp2['daycare_record_start']));
                      $Date_List_start=explode("-",$date_start);
                      $Date_List_end=explode("-",$date_end);
                      $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                      $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                      $temp2['duration']-=round(($d2-$d1)/3600/24);
                }
                if($filters['filter_date_end']>$temp2['daycare_record_end']){
                      $date_start=date('Y-m-d', strtotime($temp2['daycare_record_end']));
                      $date_end=date('Y-m-d', strtotime($filters['filter_date_end']));
                      $Date_List_start=explode("-",$date_start);
                      $Date_List_end=explode("-",$date_end);
                      $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                      $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                      $temp2['duration']-=round(($d2-$d1)/3600/24);
                }
                $temp['daycare_consumption'] += round($temp2['duration']*$temp2['daycare_record_unit_price'],1);
            }
            $total['total_daycare_consumption'] += $temp['daycare_consumption'];
            // 合计消耗
            $temp['consumption'] = $temp['course_consumption']+$temp['daycare_consumption'];
            $total['total_consumption'] += $temp['consumption'];
            // 工资支出
            $temp['salary_expenditure'] = 0;
            $temp_salary = DB::table('salary')
                             ->join('user', 'salary.salary_user', '=', 'user.user_id')
                             ->select(DB::raw('sum(salary_actual_total) as sum_salary_actual_total'))
                             ->where('salary_month', $filters['filter_month'])
                             ->where('user_department', $db_department->department_id)
                             ->first();
            $temp['salary_expenditure'] += round($temp_salary->sum_salary_actual_total,2);
            $total['total_salary_expenditure'] += $temp['salary_expenditure'];
            // 其他支出
            $temp['other_expenditure'] = 0;
            $temp_expenditure = DB::table('expenditure')
                                   ->select(DB::raw('sum(expenditure_fee) as sum_expenditure_fee'))
                                   ->where('expenditure_date', 'like', $filters['filter_month']."%")
                                   ->where('expenditure_department', $db_department->department_id)
                                   ->first();
            $temp['other_expenditure'] += round($temp_expenditure->sum_expenditure_fee,2);
            $total['total_other_expenditure'] += $temp['other_expenditure'];
            // 合计支出
            $temp['expenditure'] = $temp['salary_expenditure'] + $temp['other_expenditure'];
            $total['total_expenditure'] += $temp['expenditure'];
            // 毛利润（消耗-支出）
            $temp['profit'] = $temp['consumption'] - $temp['expenditure'];
            $total['total_profit'] += $temp['profit'];
            $departments[] = $temp;
        }
        // 返回列表视图
        return view('statistic/statistic/statistic', ['departments' => $departments,
                                                      'total' => $total,
                                                      'filters' => $filters]);
    }

}

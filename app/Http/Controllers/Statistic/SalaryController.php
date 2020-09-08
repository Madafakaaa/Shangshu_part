<?php
namespace App\Http\Controllers\Statistic;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class SalaryController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     */
    public function salary(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/statistic/salary", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }


        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_month_start" => date('Y-m'),
                        "filter_month_end" => date('Y-m')
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $filters['filter_department']=$request->input("filter_department");
        }
        // 期限
        if ($request->filled('filter_month_start')) {
            $filters['filter_month_start']=$request->input("filter_month_start");
        }
        if ($request->filled('filter_month_end')) {
            $filters['filter_month_end']=$request->input("filter_month_end");
        }
        // 计算期限长度（月）
        $start_list=explode("-", $filters['filter_month_start']);
        $end_list=explode("-", $filters['filter_month_end']);
        $duration=12*($end_list[0]-$start_list[0])+($end_list[1]-$start_list[1])+1;

        // 数据数组
        $dashboard = array(
                             "dashboard_department_name" => "全部校区",
                             "dashboard_month" => date('Y.m', strtotime($filters['filter_month_start']))." ~ ".date('Y.m', strtotime($filters['filter_month_end'])),
                             "dashboard_user_num" => 0,
                             "dashboard_hour_price" => 0,
                             "dashboard_salary" => 0,
                             "dashboard_radio" => 0,
                           );
        if($filters['filter_month_start']==$filters['filter_month_end']){
            $dashboard['dashboard_month'] = date('Y.m', strtotime($filters['filter_month_start']));
        }elseif(date('Y', strtotime($filters['filter_month_start']))==date('Y', strtotime($filters['filter_month_end']))){
            $dashboard['dashboard_month'] = date('Y.m', strtotime($filters['filter_month_start']))." ~ ".date('m', strtotime($filters['filter_month_end']));
        }

        // 获取用户数据
        $db_users = DB::table('user')
                      ->join('department', 'user.user_department', '=', 'department.department_id')
                      ->join('teacher_type', 'user.user_teacher_type', '=', 'teacher_type.teacher_type_id')
                      ->join('position', 'user.user_position', '=', 'position.position_id')
                      ->where('user_is_available', 1)
                      ->whereIn('user_department', $department_access);
        // 校区
        if ($request->filled('filter_department')) {
            $db_users = $db_users->where('user_department', '=', $request->input("filter_department"));
        }
        $db_users = $db_users->orderBy('user_department', 'asc')
                             ->orderBy('user_position', 'asc')
                             ->get();

        $users = array();
        foreach($db_users as $db_user){
            $temp = array();
            $temp['user_name'] = $db_user->user_name;
            $temp['user_id'] = $db_user->user_id;
            $temp['department_name'] = $db_user->department_name;
            $temp['position_name'] = $db_user->position_name;
            $temp['teacher_type_name'] = $db_user->teacher_type_name;
            // 获取课消信息
            $temp['lesson_hour_amount'] = 0;
            $temp['lesson_hour_price'] = 0;
            $db_consumption = DB::table('lesson')
                                ->select(DB::raw('sum(lesson_hour_amount) as lesson_hour_amount, sum(lesson_hour_price) as lesson_hour_price'))
                                ->where('lesson_teacher', $temp['user_id'])
                                ->where('lesson_date', '>=', $filters['filter_month_start']."-01")
                                ->where('lesson_date', '<=', $filters['filter_month_end']."-31")
                                ->first();
            $temp['lesson_hour_amount'] += $db_consumption->lesson_hour_amount;
            $temp['lesson_hour_price'] += $db_consumption->lesson_hour_price;
            // 获取工资信息
            $temp['salary_actual_total'] = 0;
            $temp['salary_actual_average'] = 0;
            $db_salary = DB::table('salary')
                           ->select(DB::raw('sum(salary_actual_total) as salary_actual_total'))
                           ->where('salary_user', $temp['user_id'])
                           ->where('salary_month', '>=', $filters['filter_month_start'])
                           ->where('salary_month', '<=', $filters['filter_month_end'])
                           ->first();
            $temp['salary_actual_total'] += $db_salary->salary_actual_total;
            $temp['salary_actual_average'] = $temp['salary_actual_total']/$duration;
            // 计算收入产出比
            $temp['salary_ratio'] = 0;
            if($temp['salary_actual_total']!=0){
                $temp['salary_ratio'] = $temp['lesson_hour_price']/$temp['salary_actual_total']*100;
            }
            // 更新dashboard
            $dashboard['dashboard_user_num']++;
            $dashboard['dashboard_hour_price']+=$temp['lesson_hour_price'];
            $dashboard['dashboard_salary']+=$temp['salary_actual_total'];
            $users[] = $temp;
        }
        if($dashboard['dashboard_salary']!=0){
            $dashboard['dashboard_radio'] = round($dashboard['dashboard_hour_price']/$dashboard['dashboard_salary']*100, 2);
        }
        // 获取校区信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        // 返回列表视图
        return view('statistic/salary/salary', ['users' => $users,
                                                'dashboard' => $dashboard,
                                                'filters' => $filters,
                                                'filter_departments' => $filter_departments]);
    }

}

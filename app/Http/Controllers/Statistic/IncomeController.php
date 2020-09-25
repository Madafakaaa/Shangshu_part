<?php
namespace App\Http\Controllers\Statistic;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class IncomeController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     */
    public function income(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/statistic/income", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_departments = DB::table('department')->whereIn('department_id', $department_access);

        // 搜索条件
        $filters = array(
                        "filter_date_start" => date('Y-m')."-01",
                        "filter_date_end" => date('Y-m-d'),
                        "filter_department" => null,
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_departments = $db_departments->where('department_id', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 期限
        if ($request->filled('filter_date_start')) {
            $filters['filter_date_start']=$request->input("filter_date_start");
        }
        if ($request->filled('filter_date_end')) {
            $filters['filter_date_end']=$request->input("filter_date_end");
        }
        $db_departments = $db_departments->get();

        // 数据面板
        $dashboard = array(
                             "dashboard_dates" => null,
                             "dashboard_payment_hour" => 0,
                             "dashboard_payment_total_price" => 0,
                             "dashboard_daycare_record_total_price" => 0,
                             "dashboard_total_income" => 0,
                             "dashboard_expenditure_fee" => 0,
                             "dashboard_actual_price" => 0
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

        $departments = array();
        foreach($db_departments as $db_department){
            $temp = array();
            $temp['department_name'] = $db_department->department_name;
            // 获取支出金额
            $temp['expenditure_fee'] = DB::table('expenditure')
                                         ->where('expenditure_department', $db_department->department_id)
                                         ->where('expenditure_date', '>=', $filters['filter_date_start'])
                                         ->where('expenditure_date', '<=', $filters['filter_date_end'])
                                         ->sum('expenditure_fee');
            // 获取课时数量
            $temp['payment_hour'] = DB::table('payment')
                                       ->join('student', 'student.student_id', '=', 'payment.payment_student')
                                       ->where('student_department', $db_department->department_id)
                                       ->where('payment_date', '>=', $filters['filter_date_start'])
                                       ->where('payment_date', '<=', $filters['filter_date_end'])
                                       ->sum('payment_hour');
            // 获取课时收入
            $temp['payment_total_price'] = DB::table('payment')
                                             ->join('student', 'student.student_id', '=', 'payment.payment_student')
                                             ->where('student_department', $db_department->department_id)
                                             ->where('payment_date', '>=', $filters['filter_date_start'])
                                             ->where('payment_date', '<=', $filters['filter_date_end'])
                                             ->sum('payment_total_price');
            // 获取晚托收入
            $temp['daycare_record_total_price'] = DB::table('daycare_record')
                                                    ->join('student', 'student.student_id', '=', 'daycare_record.daycare_record_student')
                                                    ->where('student_department', $db_department->department_id)
                                                    ->where('daycare_record_date', '>=', $filters['filter_date_start'])
                                                    ->where('daycare_record_date', '<=', $filters['filter_date_end'])
                                                    ->sum('daycare_record_total_price');
            $temp['total_income'] = $temp['daycare_record_total_price']+$temp['payment_total_price'];
            $temp['actual_price'] = $temp['daycare_record_total_price']+$temp['payment_total_price']-$temp['expenditure_fee'];
            $departments[] = $temp;
            $dashboard['dashboard_payment_hour']+=$temp['payment_hour'];
            $dashboard['dashboard_payment_total_price']+=$temp['payment_total_price'];
            $dashboard['dashboard_daycare_record_total_price']+=$temp['daycare_record_total_price'];
            $dashboard['dashboard_total_income']+=$temp['total_income'];
            $dashboard['dashboard_expenditure_fee']+=$temp['expenditure_fee'];
            $dashboard['dashboard_actual_price']+=$temp['actual_price'];
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('statistic/income/income', ['departments' => $departments,
                                                'dashboard' => $dashboard,
                                                'filters' => $filters,
                                                'filter_departments' => $filter_departments,
                                                'filter_grades' => $filter_grades]);
    }

}

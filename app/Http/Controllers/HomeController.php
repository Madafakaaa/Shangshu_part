<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    /**
     * 主界面显示
     * URL: GET /home
     */
    public function home(Request $request)
    {
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 模块1 统计数据 ----------------------------------------------------------------------------------
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_month" => date('Y-m')
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $filters['filter_department']=$request->input("filter_department");
        }
        // 数据数组
        $dashboard = array(
                             "dashboard_department_name" => "全部校区",
                             "dashboard_hour_amount" => 0,
                             "dashboard_hour_price" => 0,
                             "dashboard_daycare_price" => 0,
                             "dashboard_total_price" => 0,
                             "dashboard_lesson_student_num" => 0,
                             "dashboard_lesson_num" => 0,
                             "dashboard_consumption_hour_amount" => 0,
                             "dashboard_consumption_hour_price" => 0,
                           );
        // 获取售课数量、金额
        $dashboard1 = DB::table('payment')
                      ->join('student', 'payment.payment_student', '=', 'student.student_id')
                      ->select(DB::raw('sum(payment_hour) as dashboard_hour_amount, sum(payment_total_price) as dashboard_hour_price'))
                      ->where('payment_date', 'like', $filters['filter_month'].'%');
        if($request->filled('filter_department')){
            $dashboard1 = $dashboard1->where('student_department', $filters['filter_department'])->first();
        }else{
            $dashboard1 = $dashboard1->whereIn('student_department', $department_access)->first();
        }
        $dashboard['dashboard_hour_amount']+=$dashboard1->dashboard_hour_amount;
        $dashboard['dashboard_hour_price']+=$dashboard1->dashboard_hour_price;
        // 获取晚托金额
        $dashboard2 = DB::table('daycare_record')
                      ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                      ->select(DB::raw('sum(daycare_record_total_price) as dashboard_daycare_price'))
                      ->where('daycare_record_date', 'like', $filters['filter_month'].'%');
        if($request->filled('filter_department')){
            $dashboard2 = $dashboard2->where('student_department', $filters['filter_department'])->first();
        }else{
            $dashboard2 = $dashboard2->whereIn('student_department', $department_access)->first();
        }
        $dashboard['dashboard_daycare_price']+=$dashboard2->dashboard_daycare_price;
        $dashboard['dashboard_total_price']+=$dashboard['dashboard_hour_price']+$dashboard['dashboard_daycare_price'];
        // 获取上课次数、消耗课时价值
        $dashboard3 = DB::table('lesson')
                      ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                      ->select(DB::raw('count(*) as dashboard_lesson_num, sum(lesson_attended_num) as dashboard_lesson_student_num, sum(lesson_hour_price) as dashboard_consumption_hour_price, sum(lesson_hour_amount) as dashboard_consumption_hour_amount'))
                      ->where('lesson_date', 'like', $filters['filter_month'].'%');
        if($request->filled('filter_department')){
            $dashboard3 = $dashboard3->where('class_department', $filters['filter_department'])->first();
        }else{
            $dashboard3 = $dashboard3->whereIn('class_department', $department_access)->first();
        }
        $dashboard['dashboard_lesson_num']+=$dashboard3->dashboard_lesson_num;
        $dashboard['dashboard_lesson_student_num']+=$dashboard3->dashboard_lesson_student_num;
        $dashboard['dashboard_consumption_hour_price']+=$dashboard3->dashboard_consumption_hour_price;
        $dashboard['dashboard_consumption_hour_amount']+=$dashboard3->dashboard_consumption_hour_amount;
        // 获取当前校区名称
        if($request->filled('filter_department')){
            $dashboard['dashboard_department_name'] = DB::table('department')->where('department_id', $filters['filter_department'])->first()->department_name;
        }
        // 获取筛选部门列表
        $filter_departments = DB::table('department')
                              ->where('department_is_available', 1)
                              ->whereIn('department_id', $department_access)
                              ->orderBy('department_id', 'asc')
                              ->get();
        // 模块2 。。。 ----------------------------------------------------------------------------------

        return view('/dashboard', ['dashboard' => $dashboard,
                                   'filters' => $filters,
                                   'filter_departments' => $filter_departments]);
    }

}

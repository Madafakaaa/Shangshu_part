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


        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_payments = DB::table('payment')
                        ->join('student', 'payment.payment_student', '=', 'student.student_id')
                        ->join('department', 'student.student_department', '=', 'department.department_id')
                        ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                        ->join('course', 'payment.payment_course', '=', 'course.course_id')
                        ->leftJoin('user', 'payment.payment_review_user', '=', 'user.user_id');
        // 搜索条件
        $filters = array(
                        "filter_date_start" => date('Y-m')."-01",
                        "filter_date_end" => date('Y-m-d')
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_payments = $db_payments->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 期限
        if ($request->filled('filter_date_start')) {
            $filters['filter_date_start']=$request->input("filter_date_start");
        }
        if ($request->filled('filter_date_end')) {
            $filters['filter_date_end']=$request->input("filter_date_end");
        }
        $db_payments = $db_payments->where('payment_date', '>=', $filters['filter_date_start']);
        $db_payments = $db_payments->where('payment_date', '<=', $filters['filter_date_end']);
        $db_payments = $db_payments->orderBy('payment_date', 'desc')
                                   ->orderBy('payment_id', 'desc')
                                   ->limit(200)
                                   ->get();
        $payments = array();
        foreach($db_payments as $db_payment){
            $temp = array();
            $temp['department_name'] = $db_payment->department_name;
            $temp['student_id'] = $db_payment->student_id;
            $temp['student_name'] = $db_payment->student_name;
            $temp['student_gender'] = $db_payment->student_gender;
            $temp['grade_name'] = $db_payment->grade_name;
            $temp['course_name'] = $db_payment->course_name;
            $temp['payment_hour'] = $db_payment->payment_hour;
            $temp['payment_discount_total'] = $db_payment->payment_discount_total;
            $temp['payment_extra'] = $db_payment->payment_extra;
            $temp['payment_total_price'] = $db_payment->payment_total_price;
            $temp['payment_date'] = $db_payment->payment_date;
            $temp['review_user_id'] = $db_payment->user_id;
            $temp['review_user_name'] = $db_payment->user_name;
            $temp['payment_id'] = $db_payment->payment_id;
            // 获取登记用户
            $temp_create_user = DB::table('user')
                                  ->where('user_id', $db_payment->payment_create_user)
                                  ->first();
            $temp['create_user_id'] = $temp_create_user->user_id;
            $temp['create_user_name'] = $temp_create_user->user_name;
            $payments[] = $temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('statistic/income', ['payments' => $payments,
                                          'filters' => $filters,
                                          'filter_departments' => $filter_departments,
                                          'filter_grades' => $filter_grades]);
    }

}

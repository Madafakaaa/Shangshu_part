<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class PaymentController extends Controller
{

    public function payment(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/finance/payment')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_payments = DB::table('payment')
                        ->join('student', 'payment.payment_student', '=', 'student.student_id')
                        ->join('department', 'student.student_department', '=', 'department.department_id')
                        ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                        ->join('course', 'payment.payment_course', '=', 'course.course_id')
                        ->leftJoin('user', 'payment.payment_review_user', '=', 'user.user_id')
                        ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_payments = $db_payments->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_payments = $db_payments->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
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
        return view('finance/payment/payment', ['payments' => $payments,
                                                'filters' => $filters,
                                                'filter_departments' => $filter_departments,
                                                'filter_grades' => $filter_grades]);
    }

    public function paymentDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/finance/payment/delete')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取payment_id
        $request_ids=$request->input('id');
        $payment_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $payment_ids[]=decode($request_id, 'payment_id');
            }
        }else{
            $payment_ids[]=decode($request_ids, 'payment_id');
        }
        // 删除购课记录
        DB::beginTransaction();
        try{
            foreach ($payment_ids as $payment_id){
                // 获取购课信息
                $payment =  DB::table('payment')
                              ->where('payment_id', $payment_id)
                              ->first();
                // 更新学生剩余课时、课时单价
                $hour = DB::table('hour')
                          ->where('hour_course', $payment->payment_course)
                          ->where('hour_student', $payment->payment_student)
                          ->first();
                $prev_hour_remain = $hour->hour_remain;
                $prev_hour_used = $hour->hour_used;
                $prev_hour_unit_price = $hour->hour_unit_price;

                $total_value = ($prev_hour_remain+$prev_hour_used)*$prev_hour_unit_price-($payment->payment_total_price-$payment->payment_extra);
                $total_hour = $prev_hour_remain+$prev_hour_used-$payment->payment_hour;
                if($total_hour!=0){
                    $new_hour_unit_price = $total_value/$total_hour;
                }else{
                    $new_hour_unit_price = 0;
                }
                DB::table('hour')
                  ->where('hour_course', $payment->payment_course)
                  ->where('hour_student', $payment->payment_student)
                  ->update(['hour_remain' => $prev_hour_remain-$payment->payment_hour,
                            'hour_unit_price' => $new_hour_unit_price]);
                // 如果剩余已用课时均为零删除课时信息
                $hour = DB::table('hour')
                          ->where('hour_course', $payment->payment_course)
                          ->where('hour_student', $payment->payment_student)
                          ->first();
                if(($hour->hour_remain+$hour->hour_used)==0){
                    DB::table('hour')
                      ->where('hour_course', $payment->payment_course)
                      ->where('hour_student', $payment->payment_student)
                      ->delete();
                }
                // 删除购课信息
                DB::table('payment')
                  ->where('payment_id', $payment_id)
                  ->delete();
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/payment")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '购课记录删除失败',
                         'message' => '部分学生剩余课时不足，购课记录删除失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/payment")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '购课记录删除成功',
                       'message' => '购课记录删除成功!']);
    }

    public function paymentReviewAll(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/finance/payment/review')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 复核购课记录
        DB::beginTransaction();
        try{
            // 更新可复核班级购课记录复核信息
            DB::table('payment')
              ->whereNull('payment_review_user')
              ->where('payment_create_user', '<>', Session::get('user_id'))
              ->update(['payment_review_user' => Session::get('user_id'),
                        'payment_review_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/payment")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '可复核购课记录复核失败',
                         'message' => '可复核购课记复核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/payment")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '全部可复核购课记录复核成功',
                       'message' => '全部可复核购课记录复核成功!']);
    }

    public function paymentReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/finance/payment/review')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取payment_id
        $request_ids=$request->input('id');
        $payment_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $payment_ids[]=decode($request_id, 'payment_id');
            }
        }else{
            $payment_ids[]=decode($request_ids, 'payment_id');
        }
        // 复核购课记录
        DB::beginTransaction();
        try{
            foreach ($payment_ids as $payment_id){
                // 更新购课记录复核信息
                DB::table('payment')
                  ->where('payment_id', $payment_id)
                  ->update(['payment_review_user' => Session::get('user_id'),
                            'payment_review_time' => date('Y-m-d H:i:s')]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/payment")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '购课记录复核失败',
                         'message' => '购课记复核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/payment")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '购课记录复核成功',
                       'message' => '购课记录复核成功!']);
    }


}

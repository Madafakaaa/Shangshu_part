<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class RefundDaycareController extends Controller
{

    public function refundDaycare(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/finance/refund/daycare')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_daycare_refunds = DB::table('daycare_refund')
                        ->join('student', 'daycare_refund.daycare_refund_student', '=', 'student.student_id')
                        ->join('department', 'student.student_department', '=', 'department.department_id')
                        ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                        ->join('daycare_record', 'daycare_refund.daycare_refund_daycare_record', '=', 'daycare_record.daycare_record_id')
                        ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                        ->leftJoin('user', 'daycare_refund.daycare_refund_reviewed_user', '=', 'user.user_id')
                        ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_daycare_refunds = $db_daycare_refunds->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_daycare_refunds = $db_daycare_refunds->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_daycare_refunds = $db_daycare_refunds->orderBy('daycare_refund_date', 'desc')
                                                  ->orderBy('daycare_refund_id', 'desc')
                                                  ->get();
        $daycare_refunds = array();
        foreach($db_daycare_refunds as $db_daycare_refund){
            $temp = array();
            $temp['department_name'] = $db_daycare_refund->department_name;
            $temp['student_id'] = $db_daycare_refund->student_id;
            $temp['student_name'] = $db_daycare_refund->student_name;
            $temp['student_gender'] = $db_daycare_refund->student_gender;
            $temp['grade_name'] = $db_daycare_refund->grade_name;
            $temp['daycare_name'] = $db_daycare_refund->daycare_name;
            $temp['daycare_record_start'] = $db_daycare_refund->daycare_record_start;
            $temp['daycare_record_end'] = $db_daycare_refund->daycare_record_end;
            $temp['daycare_refund_fee'] = $db_daycare_refund->daycare_refund_fee;
            $temp['daycare_refund_date'] = $db_daycare_refund->daycare_refund_date;
            $temp['daycare_refund_method'] = $db_daycare_refund->daycare_refund_method;
            $temp['daycare_refund_remark'] = $db_daycare_refund->daycare_refund_remark;
            $temp['daycare_refund_reviewed_status'] = $db_daycare_refund->daycare_refund_reviewed_status;
            $temp['review_user_id'] = $db_daycare_refund->user_id;
            $temp['review_user_name'] = $db_daycare_refund->user_name;
            $temp['daycare_refund_id'] = $db_daycare_refund->daycare_refund_id;
            // 获取登记用户
            $temp_create_user = DB::table('user')
                                  ->where('user_id', $db_daycare_refund->daycare_refund_create_user)
                                  ->first();
            $temp['create_user_id'] = $temp_create_user->user_id;
            $temp['create_user_name'] = $temp_create_user->user_name;
            $daycare_refunds[] = $temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('finance/refundDaycare/refundDaycare', ['daycare_refunds' => $daycare_refunds,
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
           ->where('access_url', '/finance/refund/daycare/delete')
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
           ->where('access_url', '/finance/refund/daycare/review')
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
           ->where('access_url', '/finance/refund/daycare/review')
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

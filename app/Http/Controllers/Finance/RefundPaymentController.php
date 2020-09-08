<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class RefundPaymentController extends Controller
{

    public function refundPayment(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/refund/payment", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_hour_refunds = DB::table('hour_refund')
                        ->join('student', 'hour_refund.hour_refund_student', '=', 'student.student_id')
                        ->join('department', 'student.student_department', '=', 'department.department_id')
                        ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                        ->join('course', 'hour_refund.hour_refund_course', '=', 'course.course_id')
                        ->leftJoin('user', 'hour_refund.hour_refund_reviewed_user', '=', 'user.user_id')
                        ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_hour_refunds = $db_hour_refunds->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_hour_refunds = $db_hour_refunds->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_hour_refunds = $db_hour_refunds->orderBy('hour_refund_date', 'desc')
                                           ->orderBy('hour_refund_id', 'desc')
                                           ->limit(200)
                                           ->get();
        $hour_refunds = array();
        foreach($db_hour_refunds as $db_hour_refund){
            $temp = array();
            $temp['department_name'] = $db_hour_refund->department_name;
            $temp['student_id'] = $db_hour_refund->student_id;
            $temp['student_name'] = $db_hour_refund->student_name;
            $temp['student_gender'] = $db_hour_refund->student_gender;
            $temp['grade_name'] = $db_hour_refund->grade_name;
            $temp['course_name'] = $db_hour_refund->course_name;
            $temp['hour_refund_amount'] = $db_hour_refund->hour_refund_amount;
            $temp['hour_refund_value'] = $db_hour_refund->hour_refund_value;
            $temp['hour_refund_fee'] = $db_hour_refund->hour_refund_fee;
            $temp['hour_refund_date'] = $db_hour_refund->hour_refund_date;
            $temp['hour_refund_method'] = $db_hour_refund->hour_refund_method;
            $temp['hour_refund_remark'] = $db_hour_refund->hour_refund_remark;
            $temp['hour_refund_reviewed_status'] = $db_hour_refund->hour_refund_reviewed_status;
            $temp['review_user_id'] = $db_hour_refund->user_id;
            $temp['review_user_name'] = $db_hour_refund->user_name;
            $temp['hour_refund_id'] = $db_hour_refund->hour_refund_id;
            // 获取登记用户
            $temp_create_user = DB::table('user')
                                  ->where('user_id', $db_hour_refund->hour_refund_create_user)
                                  ->first();
            $temp['create_user_id'] = $temp_create_user->user_id;
            $temp['create_user_name'] = $temp_create_user->user_name;
            $hour_refunds[] = $temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('finance/refundPayment/refundPayment', ['hour_refunds' => $hour_refunds,
                                                             'filters' => $filters,
                                                             'filter_departments' => $filter_departments,
                                                             'filter_grades' => $filter_grades]);
    }

    public function refundPaymentReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/refund/payment/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取hour_refund_id
        $hour_refund_id=decode($request->input('id'), 'hour_refund_id');
        // 获取退款信息
        $hour_refund = DB::table('hour_refund')
                         ->join('student', 'hour_refund.hour_refund_student', '=', 'student.student_id')
                         ->join('department', 'student.student_department', '=', 'department.department_id')
                         ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                         ->join('course', 'hour_refund.hour_refund_course', '=', 'course.course_id')
                         ->join('user', 'hour_refund.hour_refund_create_user', '=', 'user.user_id')
                         ->where('hour_refund_id', $hour_refund_id)
                         ->first();
        // 返回视图
        return view('finance/refundPayment/refundPaymentReview', ['hour_refund' => $hour_refund]);
    }

    public function refundPaymentReviewStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 获取表单数据
        $hour_refund_id = $request->input('hour_refund_id');
        $hour_refund_reviewed_status = $request->input('hour_refund_reviewed_status');

        // 复核购课记录
        DB::beginTransaction();
        try{
            if($hour_refund_reviewed_status==1){
                // 同意、更新审核状态
                DB::table('hour_refund')
                  ->where('hour_refund_id', $hour_refund_id)
                  ->update(['hour_refund_reviewed_status' => 1,
                            'hour_refund_reviewed_user' => Session::get('user_id'),
                            'hour_refund_reviewed_time' => date('Y-m-d H:i:s')]);
            }else{
                // 拒绝、退还学生课时
                DB::table('hour_refund')
                  ->where('hour_refund_id', $hour_refund_id)
                  ->update(['hour_refund_reviewed_status' => 2,
                            'hour_refund_reviewed_user' => Session::get('user_id'),
                            'hour_refund_reviewed_time' => date('Y-m-d H:i:s')]);
                //  获取退款信息
                $hour_refund = DB::table('hour_refund')
                                 ->where('hour_refund_id', $hour_refund_id)
                                 ->first();
                // 增加学生课时
                DB::table('hour')
                  ->where('hour_course', $hour_refund->hour_refund_course)
                  ->where('hour_student', $hour_refund->hour_refund_student)
                  ->increment('hour_remain', $hour_refund->hour_refund_amount);
                // 减少已退课时数
                DB::table('hour')
                  ->where('hour_course', $hour_refund->hour_refund_course)
                  ->where('hour_student', $hour_refund->hour_refund_student)
                  ->decrement('hour_refunded', $hour_refund->hour_refund_amount);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/refund/payment")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '退款记录审核失败',
                         'message' => '退款记录审核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/refund/payment")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '退款记录审核成功',
                       'message' => '退款记录审核成功!']);
    }


}

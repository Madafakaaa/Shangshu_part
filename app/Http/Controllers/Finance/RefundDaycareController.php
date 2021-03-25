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
        if(!in_array("/finance/refund/daycare", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
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
                                                  ->limit(200)
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
            $temp['daycare_refund_remark'] = $db_daycare_refund->daycare_refund_remark;
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

    public function refundDaycareReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/refund/daycare/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取hour_refund_id
        $daycare_refund_id=decode($request->input('id'), 'daycare_refund_id');
        // 获取退款信息
        $daycare_refund = DB::table('daycare_refund')
                             ->join('daycare_record', 'daycare_refund.daycare_refund_daycare_record', '=', 'daycare_record.daycare_record_id')
                             ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                             ->join('department', 'student.student_department', '=', 'department.department_id')
                             ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                             ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                             ->join('user', 'daycare_refund.daycare_refund_create_user', '=', 'user.user_id')
                             ->where('daycare_refund_id', $daycare_refund_id)
                             ->first();
        // 返回视图
        return view('finance/refundDaycare/refundDaycareReview', ['daycare_refund' => $daycare_refund]);
    }


    public function refundDaycareReviewStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 获取表单数据
        $daycare_refund_id = $request->input('daycare_refund_id');
        $daycare_refund_reviewed_status = $request->input('daycare_refund_reviewed_status');

        // 复核购课记录
        DB::beginTransaction();
        try{
            if($daycare_refund_reviewed_status==2){
               $daycare_refund = DB::table('daycare_refund')->where('daycare_refund_id', $daycare_refund_id)->first();
                DB::table('daycare_record')
                  ->where('daycare_record_id', $daycare_refund->daycare_refund_daycare_record)
                  ->update(['daycare_record_is_refunded' => 0]);

            }
            // 同意、更新审核状态
            DB::table('daycare_refund')
              ->where('daycare_refund_id', $daycare_refund_id)
              ->update(['daycare_refund_reviewed_status' => $daycare_refund_reviewed_status,
                        'daycare_refund_reviewed_user' => Session::get('user_id'),
                        'daycare_refund_reviewed_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/refund/daycare")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '退款记录审核失败',
                         'message' => '退款记录审核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/refund/daycare")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '退款记录审核成功',
                       'message' => '退款记录审核成功!']);
    }
}

<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ReceiptController extends Controller
{

    public function receipt(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/receipt", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_receipts = DB::table('receipt')
                         ->join('student', 'receipt.receipt_student', '=', 'student.student_id')
                         ->join('department', 'student.student_department', '=', 'department.department_id')
                         ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                         ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_receipts = $db_receipts->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_receipts = $db_receipts->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_receipts = $db_receipts->orderBy('receipt_reviewed_status', 'asc')
                                   ->orderBy('receipt_create_time', 'asc')
                                   ->get();
        $receipts = array();
        foreach($db_receipts as $db_receipt){
            $temp = array();
            $temp['receipt_id'] = $db_receipt->receipt_id;
            $temp['department_name'] = $db_receipt->department_name;
            $temp['student_id'] = $db_receipt->student_id;
            $temp['student_name'] = $db_receipt->student_name;
            $temp['student_gender'] = $db_receipt->student_gender;
            $temp['grade_name'] = $db_receipt->grade_name;
            $temp['receipt_header'] = $db_receipt->receipt_header;
            $temp['receipt_tax_number'] = $db_receipt->receipt_tax_number;
            $temp['receipt_fee'] = $db_receipt->receipt_fee;
            $temp['receipt_date'] = $db_receipt->receipt_date;
            $temp['receipt_type'] = $db_receipt->receipt_type;
            $temp['receipt_remark'] = $db_receipt->receipt_remark;
            $temp['receipt_reviewed_status'] = $db_receipt->receipt_reviewed_status;
            $temp['receipt_create_time'] = $db_receipt->receipt_create_time;
            // 获取登记用户
            $temp_create_user = DB::table('user')
                                  ->where('user_id', $db_receipt->receipt_create_user)
                                  ->first();
            $temp['receipt_create_user_id'] = $temp_create_user->user_id;
            $temp['receipt_create_user_name'] = $temp_create_user->user_name;
            $receipts[] = $temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('finance/receipt/receipt', ['receipts' => $receipts,
                                                'filters' => $filters,
                                                'filter_departments' => $filter_departments,
                                                'filter_grades' => $filter_grades]);
    }

    public function receiptCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $student_id=decode($request->input('id'), 'student_id');
        // 获取学生信息
        $student = DB::table('student')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_id', $student_id)
                      ->first();
        // 获取学生可开发票购课时、晚托记录
        $payments = DB::table('payment')
                      ->join('course', 'payment.payment_course', '=', 'course.course_id')
                      ->where('payment_student', $student_id)
                      ->whereNull('payment_receipt')
                      ->get();
        $daycare_records = DB::table('daycare_record')
                             ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                             ->where('daycare_record_student', $student_id)
                             ->whereNull('daycare_record_receipt')
                             ->get();

        return view('finance/receipt/receiptCreate', ['student' => $student, 'payments' => $payments, 'daycare_records' => $daycare_records]);
    }

    public function receiptStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检查是否选择至少一项购买记录
        if(!$request->filled('payments')&&!$request->filled('daycare_records')){
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '发票申请失败',
                                 'message' => '发票申请失败，须至少选择一项购买记录！']);
        }
        // 获取表单输入信息
        $receipt_student=$request->input('receipt_student');
        $receipt_header=$request->input('receipt_header');
        $receipt_tax_number=$request->input('receipt_tax_number');
        $receipt_remark=$request->input('receipt_remark');
        $receipt_type="申请";
        $receipt_reviewed_status=0;
        $receipt_fee=0;

        // 插入数据库
        DB::beginTransaction();
        try{
            // 添加新发票信息
            $receipt_id = DB::table('receipt')->insertGetId(
                ['receipt_student' => $receipt_student,
                 'receipt_header' => $receipt_header,
                 'receipt_tax_number' => $receipt_tax_number,
                 'receipt_remark' => $receipt_remark,
                 'receipt_type' => $receipt_type,
                 'receipt_reviewed_status' => $receipt_reviewed_status,
                 'receipt_fee' => $receipt_fee,
                 'receipt_create_user' => Session::get('user_id')]
            );
            // 更新开发票购课时记录
            if($request->filled('payments')){
                $payments = DB::table('payment')
                               ->whereIn('payment_id', $request->input('payments'))
                               ->get();
                foreach($payments as $payment){
                    $receipt_fee += $payment->payment_total_price;
                    DB::table('payment')->where('payment_id', $payment->payment_id)->update(['payment_receipt' => $receipt_id]);
                }
            }
            // 更新开发票购晚托记录
            if($request->filled('daycare_records')){
                $daycare_records = DB::table('daycare_record')
                                     ->whereIn('daycare_record_id', $request->input('daycare_records'))
                                     ->get();
                foreach($daycare_records as $daycare_record){
                    $receipt_fee += $daycare_record->daycare_record_total_price;
                    DB::table('daycare_record')->where('daycare_record_id', $daycare_record->daycare_record_id)->update(['daycare_record_receipt' => $receipt_id]);
                }
            }
            // 更新发票金额
            DB::table('receipt')->where('receipt_id', $receipt_id)->update(['receipt_fee' => $receipt_fee]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return $e;
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '发票申请失败',
                                 'message' => '发票申请失败，请联系系统管理员！']);
        }
        DB::commit();
        return redirect("/finance/payment")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '发票申请成功',
                       'message' => '发票申请成功!']);
    }

    public function receiptReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/receipt/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户id
        $receipt_id = decode($request->input('id'), 'receipt_id');
        // 获取发票信息
        $receipt = DB::table('receipt')
                     ->join('student', 'receipt.receipt_student', '=', 'student.student_id')
                     ->join('department', 'student.student_department', '=', 'department.department_id')
                     ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                     ->join('user', 'receipt.receipt_create_user', '=', 'user.user_id')
                     ->where('receipt_id', $receipt_id)
                     ->first();
        // 获取购课时信息
        $payments = DB::table('payment')
                      ->join('course', 'payment.payment_course', '=', 'course.course_id')
                      ->where('payment_receipt', $receipt_id)
                      ->get();
        // 获取购晚托信息
        $daycare_records = DB::table('daycare_record')
                             ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                             ->where('daycare_record_receipt', $receipt_id)
                             ->get();
        // 获取开票公司信息信息
        $corporations = DB::table('corporation')
                          ->where('corporation_is_available', 1)
                          ->orderBy('corporation_id', 'asc')
                          ->get();
        // 返回列表视图
        return view('finance/receipt/receiptReview', ['receipt' => $receipt,
                                                      'corporations' => $corporations,
                                                      'payments' => $payments,
                                                      'daycare_records' => $daycare_records]);
    }

    public function receiptReviewStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入信息
        $receipt_id = $request->input('receipt_id');
        $receipt_header = $request->input('receipt_header');
        $receipt_tax_number = $request->input('receipt_tax_number');
        $receipt_number = $request->input('receipt_number');
        $receipt_fee = $request->input('receipt_fee');
        $receipt_reviewed_status = $request->input('receipt_reviewed_status');
        $receipt_date = $request->input('receipt_date');
        $receipt_corporation = $request->input('receipt_corporation');
        $receipt_remark = $request->input('receipt_remark');

        // 插入数据库
        DB::beginTransaction();
        try{
            if($receipt_reviewed_status==1){
            // 同意发票申请
                DB::table('receipt')
                ->where('receipt_id', $receipt_id)
                ->update(['receipt_header' => $receipt_header,
                          'receipt_tax_number' => $receipt_tax_number,
                          'receipt_fee' => $receipt_fee,
                          'receipt_reviewed_status' => 1,
                          'receipt_date' => $receipt_date,
                          'receipt_corporation' => $receipt_corporation,
                          'receipt_remark' => $receipt_remark,
                          'receipt_number' => $receipt_number,
                          'receipt_reviewed_user' => Session::get('user_id')]);
            }else{
                // 拒绝发票申请
                DB::table('receipt')
                ->where('receipt_id', $receipt_id)
                ->update(['receipt_reviewed_status' => 2,
                          'receipt_reviewed_user' => Session::get('user_id')]);
                // 更新购课记录发票信息
                DB::table('payment')
                   ->where('payment_receipt', $receipt_id)
                   ->update(['payment_receipt' => null]);
                // 更新购晚托记录发票信息
                DB::table('daycare_record')
                   ->where('daycare_record_receipt', $receipt_id)
                   ->update(['daycare_record_receipt' => null]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '发票审核失败',
                                 'message' => '发票审核失败，请联系系统管理员！']);
        }
        DB::commit();
        return redirect("/finance/receipt")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '发票审核成功',
                       'message' => '发票审核成功!']);
    }
}

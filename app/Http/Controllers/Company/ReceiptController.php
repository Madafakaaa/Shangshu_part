<?php
namespace App\Http\Controllers\Company;

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
        if(!in_array("/company/receipt", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_receipts = DB::table('receipt')
                         ->join('student', 'receipt.receipt_student', '=', 'student.student_id')
                         ->join('department', 'student.student_department', '=', 'department.department_id')
                         ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                         ->join('corporation', 'receipt.receipt_corporation', '=', 'corporation.corporation_id')
                         ->where('receipt_reviewed_status', 1)
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
            $temp['receipt_number'] = $db_receipt->receipt_number;
            $temp['receipt_fee'] = $db_receipt->receipt_fee;
            $temp['receipt_date'] = $db_receipt->receipt_date;
            $temp['receipt_type'] = $db_receipt->receipt_type;
            $temp['receipt_remark'] = $db_receipt->receipt_remark;
            $temp['receipt_reviewed_status'] = $db_receipt->receipt_reviewed_status;
            $temp['receipt_create_time'] = $db_receipt->receipt_create_time;
            $temp['corporation_name'] = $db_receipt->corporation_name;
            // 获取登记用户
            $temp_reviewed_user = DB::table('user')
                                  ->where('user_id', $db_receipt->receipt_reviewed_user)
                                  ->first();
            $temp['receipt_reviewed_user_id'] = $temp_reviewed_user->user_id;
            $temp['receipt_reviewed_user_name'] = $temp_reviewed_user->user_name;
            $receipts[] = $temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('company/receipt/receipt', ['receipts' => $receipts,
                                                'filters' => $filters,
                                                'filter_departments' => $filter_departments,
                                                'filter_grades' => $filter_grades]);
    }

    public function receiptCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/receipt/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取学生信息
        $students = DB::table('student')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_is_available', 1)
                      ->orderBy('department_id', 'asc')
                      ->orderBy('grade_id', 'asc')
                      ->get();
        // 获取开票公司信息信息
        $corporations = DB::table('corporation')
                          ->where('corporation_is_available', 1)
                          ->orderBy('corporation_id', 'asc')
                          ->get();

        return view('company/receipt/receiptCreate', ['students' => $students, 'corporations' => $corporations]);
    }

    public function receiptStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入信息
        $receipt_student=$request->input('receipt_student');
        $receipt_header=$request->input('receipt_header');
        $receipt_tax_number=$request->input('receipt_tax_number');
        $receipt_fee=$request->input('receipt_fee');
        $receipt_date=$request->input('receipt_date');
        $receipt_type=$request->input('receipt_type');
        $receipt_corporation=$request->input('receipt_corporation');
        $receipt_remark=$request->input('receipt_remark');
        $receipt_number=$request->input('receipt_number');
        $receipt_reviewed_status=1;

        // 插入数据库
        DB::beginTransaction();
        try{
            // 添加新发票信息
            DB::table('receipt')->insert(
                ['receipt_student' => $receipt_student,
                 'receipt_header' => $receipt_header,
                 'receipt_tax_number' => $receipt_tax_number,
                 'receipt_fee' => $receipt_fee,
                 'receipt_date' => $receipt_date,
                 'receipt_type' => $receipt_type,
                 'receipt_corporation' => $receipt_corporation,
                 'receipt_remark' => $receipt_remark,
                 'receipt_number' => $receipt_number,
                 'receipt_reviewed_status' => $receipt_reviewed_status,
                 'receipt_reviewed_user' => Session::get('user_id'),
                 'receipt_create_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '发票添加失败',
                                 'message' => '发票添加失败，请联系系统管理员！']);
        }
        DB::commit();
        return redirect("/company/receipt")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '发票添加成功',
                       'message' => '发票添加成功!']);
    }

    public function receiptDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/receipt/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // receipt_id
        $receipt_id=decode($request->input('id'), 'receipt_id');
        // 更新状态
        DB::beginTransaction();
        try{
            DB::table('receipt')
              ->where('receipt_id', $receipt_id)
              ->delete();
            // 更新购课记录发票信息
            DB::table('payment')
               ->where('payment_receipt', $receipt_id)
               ->update(['payment_receipt' => null]);
            // 更新购晚托记录发票信息
            DB::table('daycare_record')
               ->where('daycare_record_receipt', $receipt_id)
               ->update(['daycare_record_receipt' => null]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '发票删除失败',
                                 'message' => '发票删除失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/company/receipt")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '发票删除成功',
                       'message' => '发票删除成功!']);
    }

}

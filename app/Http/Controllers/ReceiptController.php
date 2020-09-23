<?php
namespace App\Http\Controllers;

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
        // 返回列表视图
        return view('receipt/receipt', ['receipt' => $receipt,
                                        'payments' => $payments,
                                        'daycare_records' => $daycare_records]);
    }

}

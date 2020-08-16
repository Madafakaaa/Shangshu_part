<?php
namespace App\Http\Controllers\Education;

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
        // 获取用户校区权限
        // $department_access = Session::get('department_access');
                  //->whereIn('student_department', $department_access)
        // 获取数据
        $payments = DB::table('payment')
                      ->join('student', 'payment.payment_student', '=', 'student.student_id')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->join('course', 'payment.payment_course', '=', 'course.course_id')
                      ->orderBy('payment_id', 'desc')
                      ->get();

        // 获取校区、年级信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/payment/payment', ['payments' => $payments]);
    }

}

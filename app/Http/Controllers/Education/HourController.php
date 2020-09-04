<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class HourController extends Controller
{

    public function hour(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/education/hour')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $hours = DB::table('hour')
                   ->join('student', 'hour.hour_student', '=', 'student.student_id')
                   ->join('department', 'student.student_department', '=', 'department.department_id')
                   ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                   ->join('course', 'hour.hour_course', '=', 'course.course_id')
                   ->leftJoin('subject', 'course.course_subject', '=', 'subject.subject_id')
                   ->where('student_is_available', 1)
                   ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $hours = $hours->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $hours = $hours->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $hours = $hours->orderBy('student_department', 'asc')
                       ->orderBy('student_grade', 'asc')
                       ->orderBy('student_id', 'asc')
                       ->orderBy('course_subject', 'asc')
                       ->orderBy('course_type', 'asc')
                       ->get();
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/hour/hour', ['hours' => $hours,
                                           'filters' => $filters,
                                           'filter_departments' => $filter_departments,
                                           'filter_grades' => $filter_grades]);
    }

    public function hourRefundCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/education/hour/refund/create')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取学生课程id
        $hour_student = decode($request->input('student_id'), 'student_id');
        $hour_course = decode($request->input('course_id'), 'course_id');

        // 获取数据
        $hour = DB::table('hour')
                   ->join('student', 'hour.hour_student', '=', 'student.student_id')
                   ->join('department', 'student.student_department', '=', 'department.department_id')
                   ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                   ->join('course', 'hour.hour_course', '=', 'course.course_id')
                   ->where('hour_student', $hour_student)
                   ->where('hour_course', $hour_course)
                   ->first();

        // 获取校区、年级信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();

        // 返回列表视图
        return view('education/hour/hourRefundCreate', ['hour' => $hour]);
    }

    /**
     * 创建新校区提交数据库
     * URL: POST /company/department/store
     */
    public function hourRefundStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $hour_refund_student = $request->input('refund_student');
        $hour_refund_course = $request->input('refund_course');
        $hour_refund_amount = $request->input('refund_amount');
        $hour_refund_fee = $request->input('refund_fee');
        $hour_refund_method = $request->input('refund_method')."：".$request->input('refund_account');
        $hour_refund_date = $request->input('refund_date');
        $hour_refund_remark = $request->input('refund_remark');
        // 获取学生课时单价，计算课时价值
        $hour_unit_price = DB::table('hour')
                             ->where('hour_course', $hour_refund_course)
                             ->where('hour_student', $hour_refund_student)
                             ->first()
                             ->hour_unit_price;
        $hour_refund_value = $hour_unit_price * $hour_refund_amount;
        // 插入数据库
        DB::beginTransaction();
        try{
            // 扣除学生课时
            DB::table('hour')
              ->where('hour_course', $hour_refund_course)
              ->where('hour_student', $hour_refund_student)
              ->decrement('hour_remain', $hour_refund_amount);
            // 增加已退课时数
            DB::table('hour')
              ->where('hour_course', $hour_refund_course)
              ->where('hour_student', $hour_refund_student)
              ->increment('hour_refunded', $hour_refund_amount);
           // 新增退款记录
           DB::table('hour_refund')->insert(
                ['hour_refund_student' => $hour_refund_student,
                 'hour_refund_course' => $hour_refund_course,
                 'hour_refund_amount' => $hour_refund_amount,
                 'hour_refund_value' => $hour_refund_value,
                 'hour_refund_fee' => $hour_refund_fee,
                 'hour_refund_date' => $hour_refund_date,
                 'hour_refund_method' => $hour_refund_method,
                 'hour_refund_remark' => $hour_refund_remark,
                 'hour_refund_create_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/hour/refund/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课时退款失败',
                           'message' => '课时退款失败，错误码:101']);
        }
        DB::commit();
        // 返回校区列表
        return redirect("/education/hour")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课时退款成功',
                       'message' => '课时退款成功!']);
    }

}

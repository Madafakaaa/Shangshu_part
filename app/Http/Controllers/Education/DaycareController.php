<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class DaycareController extends Controller
{

    public function daycare(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/education/daycare')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $daycare_records = DB::table('daycare_record')
                             ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                             ->join('department', 'student.student_department', '=', 'department.department_id')
                             ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                             ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                             ->where('student_is_available', 1)
                             ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $daycare_records = $daycare_records->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $daycare_records = $daycare_records->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $daycare_records = $daycare_records->orderBy('daycare_record_is_refunded', 'asc')
                                           ->orderBy('daycare_record_start', 'desc')
                                           ->orderBy('daycare_record_end', 'asc')
                                           ->get();
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/daycare/daycare', ['daycare_records' => $daycare_records,
                                                  'filters' => $filters,
                                                  'filter_departments' => $filter_departments,
                                                  'filter_grades' => $filter_grades]);
    }

    public function daycareRefundCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/education/daycare/refund/create')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取学生课程id
        $daycare_record_id = decode($request->input('id'), 'daycare_record_id');

        // 获取数据
        $daycare_record = DB::table('daycare_record')
                             ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                             ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                             ->where('daycare_record_id', $daycare_record_id)
                             ->first();

        // 获取校区、年级信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();

        // 返回列表视图
        return view('education/daycare/daycareRefundCreate', ['daycare_record' => $daycare_record]);
    }

    /**
     * 创建新校区提交数据库
     * URL: POST /company/department/store
     */
    public function daycareRefundStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $daycare_refund_student = $request->input('daycare_refund_student');
        $daycare_refund_daycare_record = $request->input('daycare_refund_daycare_record');
        $daycare_refund_fee = $request->input('daycare_refund_fee');
        $daycare_refund_date = $request->input('daycare_refund_date');
        $daycare_refund_method = $request->input('daycare_refund_method')."：".$request->input('daycare_refund_account');
        $daycare_refund_remark = $request->input('daycare_refund_remark');
        // 插入数据库
        DB::beginTransaction();
        try{
            // 更新学生晚托退费状态
            DB::table('daycare_record')
              ->where('daycare_record_id', $daycare_refund_daycare_record)
              ->update(['daycare_record_is_refunded' => 1]);
           // 新增退款记录
           DB::table('daycare_refund')->insert(
                ['daycare_refund_student' => $daycare_refund_student,
                 'daycare_refund_daycare_record' => $daycare_refund_daycare_record,
                 'daycare_refund_fee' => $daycare_refund_fee,
                 'daycare_refund_date' => $daycare_refund_date,
                 'daycare_refund_method' => $daycare_refund_method,
                 'daycare_refund_remark' => $daycare_refund_remark,
                 'daycare_refund_create_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/daycare/refund/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '晚托退款失败',
                           'message' => '晚托退款失败，错误码:101']);
        }
        DB::commit();
        // 返回校区列表
        return redirect("/education/daycare")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '晚托退款成功',
                       'message' => '晚托退款成功!']);
    }
}

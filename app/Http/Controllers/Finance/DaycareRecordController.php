<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class DaycareRecordController extends Controller
{

    public function daycareRecord(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/daycareRecord", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取数据
        $db_daycare_records = DB::table('daycare_record')
                                ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                                ->join('department', 'student.student_department', '=', 'department.department_id')
                                ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                                ->join('daycare', 'daycare_record.daycare_record_daycare', '=', 'daycare.daycare_id')
                                ->leftJoin('user', 'daycare_record.daycare_record_review_user', '=', 'user.user_id')
                                ->leftJoin('receipt', 'daycare_record.daycare_record_receipt', '=', 'receipt.receipt_id')
                                ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_daycare_records = $db_daycare_records->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_daycare_records = $db_daycare_records->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_daycare_records = $db_daycare_records->orderBy('daycare_record_date', 'desc')
                                                 ->orderBy('daycare_record_id', 'desc')
                                                 ->limit(200)
                                                 ->get();
        $daycare_records = array();
        foreach($db_daycare_records as $db_daycare_record){
            $temp = array();
            $temp['daycare_record_id'] = $db_daycare_record->daycare_record_id;
            $temp['department_name'] = $db_daycare_record->department_name;
            $temp['student_gender'] = $db_daycare_record->student_gender;
            $temp['student_id'] = $db_daycare_record->student_id;
            $temp['student_name'] = $db_daycare_record->student_name;
            $temp['daycare_name'] = $db_daycare_record->daycare_name;
            $temp['daycare_record_month'] = $db_daycare_record->daycare_record_month;
            $temp['daycare_record_start'] = $db_daycare_record->daycare_record_start;
            $temp['daycare_record_end'] = $db_daycare_record->daycare_record_end;
            $temp['daycare_record_discount_total'] = $db_daycare_record->daycare_record_discount_total;
            $temp['daycare_record_total_price'] = $db_daycare_record->daycare_record_total_price;
            $temp['daycare_record_date'] = $db_daycare_record->daycare_record_date;
            $temp['daycare_record_receipt'] = $db_daycare_record->daycare_record_receipt;
            $temp['daycare_record_remark'] = $db_daycare_record->daycare_record_remark;
            $temp['receipt_reviewed_status'] = $db_daycare_record->receipt_reviewed_status;
            $temp['review_user_id'] = $db_daycare_record->user_id;
            $temp['review_user_name'] = $db_daycare_record->user_name;
            // 获取登记用户
            $temp_create_user = DB::table('user')
                                  ->where('user_id', $db_daycare_record->daycare_record_create_user)
                                  ->first();
            $temp['create_user_id'] = $temp_create_user->user_id;
            $temp['create_user_name'] = $temp_create_user->user_name;
            $daycare_records[] = $temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('finance/daycareRecord/daycareRecord', ['daycare_records' => $daycare_records,
                                                             'filters' => $filters,
                                                             'filter_departments' => $filter_departments,
                                                             'filter_grades' => $filter_grades]);
    }

    public function daycareRecordDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/daycareRecord/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取daycare_record_id
        $request_ids=$request->input('id');
        $daycare_record_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $daycare_record_ids[]=decode($request_id, 'daycare_record_id');
            }
        }else{
            $daycare_record_ids[]=decode($request_ids, 'daycare_record_id');
        }
        // 删除晚托记录
        DB::beginTransaction();
        try{
            foreach ($daycare_record_ids as $daycare_record_id){
                // 获取晚托信息
                $daycare_record =  DB::table('daycare_record')
                                     ->where('daycare_record_id', $daycare_record_id)
                                     ->delete();
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/daycareRecord")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '晚托记录删除失败',
                         'message' => '晚托记录删除失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/daycareRecord")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '晚托记录删除成功',
                       'message' => '晚托记录删除成功!']);
    }

    public function daycareRecordReviewAll(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/daycareRecord/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 复核晚托记录
        DB::beginTransaction();
        try{
            // 更新可复核晚托记录复核信息
            DB::table('daycare_record')
              ->whereNull('daycare_record_review_user')
              ->where('daycare_record_create_user', '<>', Session::get('user_id'))
              ->update(['daycare_record_review_user' => Session::get('user_id'),
                        'daycare_record_review_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/daycareRecord")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '可复核晚托记录复核失败',
                         'message' => '可复核晚托记复核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/daycareRecord")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '全部可复核晚托记录复核成功',
                       'message' => '全部可复核晚托记录复核成功!']);
    }

    public function daycareRecordReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/daycareRecord/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取daycare_record_id
        $request_ids=$request->input('id');
        $daycare_record_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $daycare_record_ids[]=decode($request_id, 'daycare_record_id');
            }
        }else{
            $daycare_record_ids[]=decode($request_ids, 'daycare_record_id');
        }
        // 复核晚托记录
        DB::beginTransaction();
        try{
            foreach ($daycare_record_ids as $daycare_record_id){
                // 更新晚托记录复核信息
                DB::table('daycare_record')
                  ->where('daycare_record_id', $daycare_record_id)
                  ->update(['daycare_record_review_user' => Session::get('user_id'),
                            'daycare_record_review_time' => date('Y-m-d H:i:s')]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/daycareRecord")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '晚托记录复核失败',
                         'message' => '晚托记复核失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/daycareRecord")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '晚托记录复核成功',
                       'message' => '晚托记录复核成功!']);
    }


}

<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ExpenditureController extends Controller
{

    public function expenditure(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/expenditure", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_date_start" => date('Y-m')."-01",
                        "filter_date_end" => date('Y-m-d'),
                    );
        // 期限
        if ($request->filled('filter_date_start')) {
            $filters['filter_date_start']=$request->input("filter_date_start");
        }
        if ($request->filled('filter_date_end')) {
            $filters['filter_date_end']=$request->input("filter_date_end");
        }
        // 获取数据
        $expenditures = DB::table('expenditure')
                        ->join('department', 'expenditure.expenditure_department', '=', 'department.department_id')
                        ->join('user', 'expenditure.expenditure_create_user', '=', 'user.user_id')
                        ->where('expenditure_date', '>=', $filters['filter_date_start'])
                        ->where('expenditure_date', '<=', $filters['filter_date_end'])
                        ->whereIn('expenditure_department', $department_access);
        // 校区
        if ($request->filled('filter_department')) {
            $expenditures = $expenditures->where('expenditure_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        $expenditures = $expenditures->orderBy('expenditure_date', 'desc')
                                     ->orderBy('expenditure_department', 'asc')
                                     ->get();
        $expenditure_sum = 0;
        foreach($expenditures as $expenditure){
            $expenditure_sum += $expenditure->expenditure_fee;
        }
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        // 返回列表视图
        return view('finance/expenditure/expenditure', ['expenditures' => $expenditures,
                                                        'expenditure_sum' => $expenditure_sum,
                                                        'filters' => $filters,
                                                        'filter_departments' => $filter_departments]);
    }

    public function expenditureCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/expenditure/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取校区
        $departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        return view('finance/expenditure/expenditureCreate', ['departments' => $departments]);
    }

    public function expenditureStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $expenditure_department = $request->input('expenditure_department');
        $expenditure_fee = $request->input('expenditure_fee');
        $expenditure_remark = $request->input('expenditure_remark');
        $expenditure_date = $request->input('expenditure_date');
        // 插入数据库
        DB::beginTransaction();
        try{
            DB::table('expenditure')->insert(
                ['expenditure_fee' => $expenditure_fee,
                 'expenditure_remark' => $expenditure_remark,
                 'expenditure_date' => $expenditure_date,
                 'expenditure_department' => $expenditure_department,
                 'expenditure_create_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/expenditure/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '支出记录添加失败',
                           'message' => '支出记录添加失败，错误码:202']);
        }
        DB::commit();
        // 返回支出列表
        return redirect("/finance/expenditure")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '支出记录添加成功',
                       'message' => '支出记录添加成功']);
    }

    public function expenditureDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/expenditure/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取expenditure_id
        $request_ids=$request->input('id');
        $expenditure_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $expenditure_ids[]=decode($request_id, 'expenditure');
            }
        }else{
            $expenditure_ids[]=decode($request_ids, 'expenditure');
        }
        // 删除记录
        DB::beginTransaction();
        try{
            foreach ($expenditure_ids as $expenditure_id){
                // 硬删除记录
                DB::table('expenditure')
                  ->where('expenditure_id', $expenditure_id)
                  ->delete();
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/expenditure")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '支出记录删除失败',
                         'message' => '支出记录删除失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/finance/expenditure")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '支出记录删除成功',
                       'message' => '支出记录删除成功!']);
    }

    public function expenditureReview(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/expenditure/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取expenditure_id
        $expenditure_id=decode($request->input('id'), 'expenditure_id');
        // 更新支出记录
        DB::beginTransaction();
        try{
            // 更新支出记录
            DB::table('expenditure')
              ->where('expenditure_id', $expenditure_id)
              ->update(['expenditure_reviewed_user' => Session::get('user_id'),
                        'expenditure_reviewed_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/expenditure")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '支出记录审核失败',
                         'message' => '支出记录审核失败，错误码:204']);
        }
        DB::commit();
        // 返回记录列表
        return redirect("/finance/expenditure")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '支出记录审核成功',
                       'message' => '支出记录审核成功!']);
    }

    public function expenditureReviewAll(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/finance/expenditure/review", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 更新支出记录
        DB::beginTransaction();
        try{
            // 更新全部可审核支出记录
            DB::table('expenditure')
              ->whereNull('expenditure_reviewed_user')
              ->where('expenditure_create_user', '<>', Session::get('user_id'))
              ->update(['expenditure_reviewed_user' => Session::get('user_id'),
                        'expenditure_reviewed_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/finance/expenditure")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '支出记录批量审核失败',
                         'message' => '支出记录批量审核失败，错误码:204']);
        }
        DB::commit();
        // 返回记录列表
        return redirect("/finance/expenditure")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '支出记录批量审核成功',
                       'message' => '支出记录批量审核成功!']);
    }
}

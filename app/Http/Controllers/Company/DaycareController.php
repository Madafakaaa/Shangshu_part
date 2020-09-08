<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class DaycareController extends Controller
{

    /**
     * 课程设置
     * URL: GET /company/daycare
     */
    public function daycare(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/daycare", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取数据
        $daycares = DB::table('daycare')
                      ->leftJoin('grade', 'daycare.daycare_grade', '=', 'grade.grade_id')
                      ->orderBy('daycare_is_available', 'desc')
                      ->orderBy('daycare_grade', 'asc')
                      ->orderBy('daycare_unit_price', 'asc')
                      ->get();
        // 获取校区、年级、科目信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();
        //$filter_subjects = DB::table('subject')->where('subject_status', 1)->orderBy('subject_id', 'asc')->get();
        // 返回列表视图
        return view('/company/daycare/daycare', ['daycares' => $daycares]);
    }

    /**
     * 创建新课程页面
     * URL: GET /company/daycare/create
     */
    public function daycareCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/daycare/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取年级、科目信息、课程类型
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('/company/daycare/daycareCreate', ['grades' => $grades]);
    }

    /**
     * 创建新课程提交数据库
     * URL: POST /company/daycare/store
     */
    public function daycareStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $daycare_name = $request->input('input_daycare_name');
        $daycare_grade = $request->input('input_daycare_grade');
        $daycare_unit_price = $request->input('input_daycare_unit_price');
        // 插入数据库
        try{
           DB::table('daycare')->insert(
                ['daycare_name' => $daycare_name,
                 'daycare_grade' => $daycare_grade,
                 'daycare_unit_price' => $daycare_unit_price,
                 'daycare_create_user' => Session::get('user_id'),
                 'daycare_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/daycare/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程添加失败',
                           'message' => '课程添加失败，错误码:104']);
        }
        // 返回课程列表
        return redirect("/company/daycare")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程添加成功',
                       'message' => '课程名称: '.$daycare_name]);
    }

    /**
     * 修改单个课程
     * URL: GET /company/daycare/edit
     */
    public function daycareEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/daycare/edit", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取daycare_id
        $daycare_id = decode($request->input('id'), 'daycare_id');
        // 获取数据信息
        $daycare = DB::table('daycare')->where('daycare_id', $daycare_id)->first();
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('/company/daycare/daycareEdit', ['daycare' => $daycare, 'grades' => $grades]);
    }

    /**
     * 修改新课程提交数据库
     * URL: POST /daycare/create/update
     */
    public function daycareUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取daycare_id
        $daycare_id = $request->input('input_daycare_id');
         // 获取表单输入
        $daycare_name = $request->input('input_daycare_name');
        $daycare_grade = $request->input('input_daycare_grade');
        $daycare_unit_price = $request->input('input_daycare_unit_price');
        // 更新数据库
        try{
            DB::table('daycare')
              ->where('daycare_id', $daycare_id)
              ->update(['daycare_name' => $daycare_name,
                        'daycare_grade' => $daycare_grade,
                        'daycare_unit_price' => $daycare_unit_price,
                        'daycare_modified_user' => Session::get('user_id'),
                        'daycare_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("company/daycare/edit?id=".encode($daycare_id, 'daycare_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程修改失败',
                           'message' => '课程修改失败，错误码:105']);
        }
        return redirect("/company/daycare")
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '课程修改成功',
                      'message' => '课程修改成功! ']);
    }

    /**
     * 删除课程
     * URL: DELETE /company/daycare/delete
     */
    public function daycareDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/daycare/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取daycare_id
        $request_ids=$request->input('id');
        $daycare_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $daycare_ids[]=decode($request_id, 'daycare_id');
            }
        }else{
            $daycare_ids[]=decode($request_ids, 'daycare_id');
        }
        // 删除数据
        try{
            foreach ($daycare_ids as $daycare_id){
                DB::table('daycare')
                  ->where('daycare_id', $daycare_id)
                  ->update(['daycare_is_available' => 0,
                            'daycare_modified_user' => Session::get('user_id'),
                            'daycare_modified_time' => date('Y-m-d H:i:s')]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/daycare")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程结课失败',
                           'message' => '课程结课失败，错误码:106']);
        }
        // 返回课程列表
        return redirect("/company/daycare")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程结课成功',
                       'message' => '课程结课成功!']);
    }

    /**
     * 恢复课程
     * URL: DELETE /company/daycare/restore
     */
    public function daycareRestore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/daycare/restore", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取daycare_id
        $daycare_id = decode($request->input('id'), 'daycare_id');
        // 删除数据
        try{
            DB::table('daycare')
              ->where('daycare_id', $daycare_id)
              ->update(['daycare_is_available' => 1,
                        'daycare_modified_user' => Session::get('user_id'),
                        'daycare_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/daycare")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程恢复失败',
                           'message' => '课程恢复失败，错误码:106']);
        }
        // 返回课程列表
        return redirect("/company/daycare")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程恢复成功',
                       'message' => '课程恢复成功!']);
    }

}

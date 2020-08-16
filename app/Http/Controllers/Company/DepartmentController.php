<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class DepartmentController extends Controller
{
    /**
     * 显示所有校区记录
     * URL: GET /company/department
     */
    public function department(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取数据
        $departments = DB::table('department')
                         ->where('department_is_available', 1)
                         ->orderBy('department_id', 'asc')
                         ->get();
        // 返回列表视图
        return view('/company/department/department', ['departments' => $departments]);
    }

    /**
     * 创建新校区页面
     * URL: GET /company/department/create
     */
    public function departmentCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        return view('/company/department/departmentCreate');
    }

    /**
     * 创建新校区提交数据库
     * URL: POST /company/department/store
     */
    public function departmentStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $department_name = $request->input('input_department_name');
        // 插入数据库
        try{
           DB::table('department')->insert(
                ['department_name' => $department_name,
                 'department_create_user' => Session::get('user_id'),
                 'department_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/department/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '校区添加失败',
                           'message' => '校区名已存在，错误码:101']);
        }
        // 返回校区列表
        return redirect("/company/department")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '校区添加成功',
                       'message' => '校区添加成功!']);
    }

    /**
     * 修改单个校区
     * URL: GET /company/department/edit
     */
    public function departmentEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取id
        $department_id = decode($request->input('id'), 'department_id');
        // 获取数据信息
        $department = DB::table('department')
                        ->where('department_id', $department_id)
                        ->first();
        return view('/company/department/departmentEdit', ['department' => $department]);
    }

    /**
     * 修改校区提交数据库
     * URL: POST /company/department/update
     */
    public function departmentUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
         // 获取表单输入
        $department_id = $request->input('input_department_id');
        $department_name = $request->input('input_department_name');
        // 更新数据库
        try{
            DB::table('department')
              ->where('department_id', $department_id)
              ->update(['department_name' => $department_name,
                        'department_modified_user' => Session::get('user_id'),
                        'department_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/department/edit?id=".encode($department_id, 'department_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '校区修改失败',
                           'message' => '校区修改失败，错误码:102']);
        }
        return redirect("/company/department")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '校区修改成功',
                       'message' => '校区修改成功!']);
    }

    /**
     * 删除校区
     * URL: DELETE /company/department/delete
     */
    public function departmentDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取department_id
        $department_id = decode($request->input('id'),'department_id');
        // 删除数据
        try{
            DB::table('department')
              ->where('department_id', $department_id)
              ->update(['department_is_available' => 0,
                        'department_modified_user' => Session::get('user_id'),
                        'department_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/department")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '校区删除失败',
                           'message' => '校区删除失败，错误码:103']);
        }
        // 返回校区列表
        return redirect("/company/department")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '校区删除成功',
                       'message' => '校区删除成功!']);
    }

}

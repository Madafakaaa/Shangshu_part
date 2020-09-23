<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class CorporationController extends Controller
{
    /**
     * 显示所有单位记录
     * URL: GET /company/corporation
     */
    public function corporation(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/corporation", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取数据
        $corporations = DB::table('corporation')
                          ->where('corporation_is_available', 1)
                          ->orderBy('corporation_id', 'asc')
                          ->get();
        // 返回列表视图
        return view('/company/corporation/corporation', ['corporations' => $corporations]);
    }

    /**
     * 创建新单位页面
     * URL: GET /company/corporation/create
     */
    public function corporationCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/corporation/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        return view('/company/corporation/corporationCreate');
    }

    /**
     * 创建新单位提交数据库
     * URL: POST /company/corporation/store
     */
    public function corporationStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $corporation_name = $request->input('corporation_name');
        $corporation_receipt_amount = $request->input('corporation_receipt_amount');
        // 插入数据库
        try{
           DB::table('corporation')->insert(
                ['corporation_name' => $corporation_name,
                 'corporation_receipt_amount' => $corporation_receipt_amount,
                 'corporation_create_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/corporation/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '单位添加失败',
                           'message' => '单位名已存在，错误码:101']);
        }
        // 返回单位列表
        return redirect("/company/corporation")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '单位添加成功',
                       'message' => '单位添加成功!']);
    }

    /**
     * 修改单个单位
     * URL: GET /company/corporation/edit
     */
    public function corporationEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/corporation/edit", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取id
        $corporation_id = decode($request->input('id'), 'corporation_id');
        // 获取数据信息
        $corporation = DB::table('corporation')
                        ->where('corporation_id', $corporation_id)
                        ->first();
        return view('/company/corporation/corporationEdit', ['corporation' => $corporation]);
    }

    /**
     * 修改单位提交数据库
     * URL: POST /company/corporation/update
     */
    public function corporationUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
         // 获取表单输入
        $corporation_id = $request->input('corporation_id');
        $corporation_name = $request->input('corporation_name');
        $corporation_receipt_amount = $request->input('corporation_receipt_amount');
        // 更新数据库
        try{
            DB::table('corporation')
              ->where('corporation_id', $corporation_id)
              ->update(['corporation_name' => $corporation_name,
                        'corporation_receipt_amount' => $corporation_receipt_amount]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/corporation/edit?id=".encode($corporation_id, 'corporation_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '单位修改失败',
                           'message' => '单位修改失败，错误码:102']);
        }
        return redirect("/company/corporation")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '单位修改成功',
                       'message' => '单位修改成功!']);
    }

    /**
     * 删除单位
     * URL: DELETE /company/corporation/delete
     */
    public function corporationDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/corporation/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取corporation_id
        $corporation_id = decode($request->input('id'),'corporation_id');
        // 删除数据
        try{
            DB::table('corporation')
              ->where('corporation_id', $corporation_id)
              ->update(['corporation_is_available' => 0]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/corporation")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '单位删除失败',
                           'message' => '单位删除失败，错误码:103']);
        }
        // 返回单位列表
        return redirect("/company/corporation")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '单位删除成功',
                       'message' => '单位删除成功!']);
    }

}

<?php
namespace App\Http\Controllers\Teacher;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class AnnouncementController extends Controller
{
    /**
     * 显示所有校区记录
     * URL: GET /company/announcement
     */
    public function announcement(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取数据
        $announcements = DB::table('announcement')
                           ->where('announcement_level', '>=', Session::get('user_position'))
                           ->orderBy('announcement_id', 'desc')
                           ->get();
        // 返回列表视图
        return view('/teacher/announcement/announcement', ['announcements' => $announcements]);
    }

    /**
     * 创建新校区页面
     * URL: GET /company/announcement/create
     */
    public function announcementCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/teacher/announcement/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        return view('/teacher/announcement/announcementCreate');
    }

    /**
     * 创建新校区提交数据库
     * URL: POST /company/announcement/store
     */
    public function announcementStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $tmp_file = $request->file('file');
        if (!$tmp_file->isValid()) {
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '非法文件',
                                 'message' => '非法通知文件，通知添加失败，错误码:401']);
        }
        // 获取文件名称
        // $announcement_name = $tmp_file->getClientOriginalName();
        // 获取文件扩展名
        $announcement_ext = $tmp_file->getClientOriginalExtension();
        // 生成路径
        $announcement_path = "A".date('ymdHis').rand(1000000000,9999999999).".".$announcement_ext;
        // 获取表单输入
        $announcement_name = $tmp_file->getClientOriginalName();
        $announcement_level = $request->input('announcement_level');
        // 插入数据库
        DB::beginTransaction();
        try{
           DB::table('announcement')->insert(
                ['announcement_name' => $announcement_name,
                 'announcement_level' => $announcement_level,
                 'announcement_path' => $announcement_path,
                 'announcement_create_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '通知添加失败',
                                 'message' => '通知添加失败，错误码:101']);
        }
        DB::commit();
        $tmp_file->move(public_path("/files/announcement"), $announcement_path);
        // 返回校区列表
        return redirect("/teacher/announcement")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '通知添加成功',
                       'message' => '通知添加成功!']);
    }

    /**
     * 删除校区
     * URL: DELETE /company/announcement/delete
     */
    public function announcementDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/teacher/announcement/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取announcement_id
        $announcement_id = decode($request->input('id'),'announcement_id');
        // 删除数据
        try{
            $announcement = DB::table('announcement')
                              ->where('announcement_id', $announcement_id)
                              ->first();
            // 删除教案文件
            if (file_exists("files/announcement/".$announcement->announcement_path)) {
                unlink("files/announcement/".$announcement->announcement_path);
            }
            DB::table('announcement')
              ->where('announcement_id', $announcement_id)
              ->delete();
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/teacher/announcement")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '通知删除失败',
                           'message' => '通知删除失败，错误码:103']);
        }
        // 返回校区列表
        return redirect("/teacher/announcement")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '通知删除成功',
                       'message' => '通知删除成功!']);
    }

    public function announcementDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取教案id
        $announcement_id = decode($request->input('id'), 'announcement_id');
        // 获取教案数据信息
        $announcement = DB::table('announcement')->where('announcement_id', $announcement_id)->first();
        // 获取文件名和路径
        $file_path = "files/announcement/".$announcement->announcement_path;
        $file_name = $announcement->announcement_name;
        // 下载文件
        if (file_exists($file_path)) {// 文件存在
            // 返回文件
            return response()->download($file_path, $file_name ,$headers = ['Content-Type'=>'application/zip;charset=utf-8']);
        }else{ // 文件不存在
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '通知下载失败',
                                 'message' => '通知文件已删除，错误码:403']);
        }
    }
}

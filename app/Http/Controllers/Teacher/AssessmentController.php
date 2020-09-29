<?php
namespace App\Http\Controllers\Teacher;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class AssessmentController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/user
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     * @param  $request->input('filter1'): 用户姓名
     * @param  $request->input('filter2'): 用户校区
     * @param  $request->input('filter3'): 用户岗位
     * @param  $request->input('filter4'): 用户等级
     */
    public function assessment(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取用户等级
        $position = Session::get('user_position');
        // 获取月份
        $month = date('Y-m');
        if ($request->filled('month')) {
            $month=$request->input("month");
        }
        // 获取用户数据
        $db_users = DB::table('user')
                     ->join('department', 'user.user_department', '=', 'department.department_id')
                     ->where('user_is_available', 1);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_users = $db_users->where('user_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 普通教师 只允许查看自己
        if($position==5){
            $db_users = $db_users->where('user_id', Session::get('user_id'));
        }
        // 教务及以上 语序查看有权限校区用户
        if($position>5){
            $db_users = $db_users->whereIn('user_department', $department_access);
        }
        $db_users = $db_users->orderBy('user_department', 'asc')
                             ->get();
        $users = array();
        foreach($db_users as $db_user){
            $temp_user=array();
            $temp_user['user_name']=$db_user->user_name;
            $temp_user['user_id']=$db_user->user_id;
            $temp_user['user_gender']=$db_user->user_gender;
            $temp_user['department_name']=$db_user->department_name;
            $temp_user['month_assessment_1']='';
            $temp_user['month_assessment_2']='';
            $temp_user['month_assessment_3']='';
            if(DB::table('month_assessment')->where('month_assessment_user', $db_user->user_id)->where('month_assessment_month', $month)->exists()){
                $temp_assessment = DB::table('month_assessment')
                             ->where('month_assessment_user', $db_user->user_id)
                             ->where('month_assessment_month', $month)
                             ->first();
                $temp_user['month_assessment_1']=$temp_assessment->month_assessment_1;
                $temp_user['month_assessment_2']=$temp_assessment->month_assessment_2;
                $temp_user['month_assessment_3']=$temp_assessment->month_assessment_3;
            }
            $users[]=$temp_user;
        }

        // 获取校区信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        // 返回列表视图
        return view('teacher/assessment/assessment', ['month' => $month,
                                                      'users' => $users,
                                                      'filters' => $filters,
                                                      'filter_departments' => $filter_departments]);
    }

    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function assessmentSelfCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取信息
        $month = $request->input('month');
        $user_id = $request->input('user_id');

        return view('teacher/assessment/assessmentSelfCreate', ['month' => $month, 'user_id' => $user_id]);
    }

    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function assessmentSelfStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单信息
        $month_assessment_user = $request->input('month_assessment_user');
        $month_assessment_month = $request->input('month_assessment_month');
        // 获取评分
        $month_assessment_1 = 0;
        for($i=1;$i<=30;$i++){
            $month_assessment_1 += $request->input('input'.$i);
        }

        DB::beginTransaction();
        // 插入数据库
        try{
            // 判断是否已有评分
            if(DB::table('month_assessment')->where('month_assessment_user', $month_assessment_user)->where('month_assessment_month', $month_assessment_month)->exists()){
                // 已有评分记录，更新评分记录
                DB::table('month_assessment')
                  ->where('month_assessment_user', $month_assessment_user)
                  ->where('month_assessment_month', $month_assessment_month)
                  ->update(['month_assessment_1' => $month_assessment_1]);
            }else{
                // 没有评分记录，新增评分记录
                DB::table('month_assessment')
                  ->insert(['month_assessment_user' => $month_assessment_user,
                            'month_assessment_month' => $month_assessment_month,
                            'month_assessment_1' => $month_assessment_1]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回购课界面
            return redirect("/teacher/assessment/self/create?month=".$month_assessment_month."&user_id=".$month_assessment_user)
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '教师自评失败',
                         'message' => '教师自评失败，请联系系统管理员']);
        }
        DB::commit();
        return redirect("/teacher/assessment?month=".$month_assessment_month)
               ->with(['notify' => true,
                     'type' => 'success',
                     'title' => '教师自评成功',
                     'message' => '教师自评成功']);
    }


    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function assessmentStaffCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取信息
        $month = $request->input('month');
        $user_id = $request->input('user_id');

        return view('teacher/assessment/assessmentStaffCreate', ['month' => $month, 'user_id' => $user_id]);
    }

    public function assessmentStaffStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单信息
        $month_assessment_user = $request->input('month_assessment_user');
        $month_assessment_month = $request->input('month_assessment_month');
        // 获取评分
        $month_assessment_2 = 0;
        for($i=1;$i<=30;$i++){
            $month_assessment_2 += $request->input('input'.$i);
        }

        DB::beginTransaction();
        // 插入数据库
        try{
            // 判断是否已有评分
            if(DB::table('month_assessment')->where('month_assessment_user', $month_assessment_user)->where('month_assessment_month', $month_assessment_month)->exists()){
                // 已有评分记录，更新评分记录
                DB::table('month_assessment')
                  ->where('month_assessment_user', $month_assessment_user)
                  ->where('month_assessment_month', $month_assessment_month)
                  ->update(['month_assessment_2' => $month_assessment_2]);
            }else{
                // 没有评分记录，新增评分记录
                DB::table('month_assessment')
                  ->insert(['month_assessment_user' => $month_assessment_user,
                            'month_assessment_month' => $month_assessment_month,
                            'month_assessment_2' => $month_assessment_2]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回购课界面
            return redirect("/teacher/assessment/staff/create?month=".$month_assessment_month."&user_id=".$month_assessment_user)
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '教务评分失败',
                         'message' => '教务评分失败，请联系系统管理员']);
        }
        DB::commit();
        return redirect("/teacher/assessment?month=".$month_assessment_month)
               ->with(['notify' => true,
                     'type' => 'success',
                     'title' => '教务评分成功',
                     'message' => '教务评分成功']);
    }

    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function assessmentManagerCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取信息
        $month = $request->input('month');
        $user_id = $request->input('user_id');

        return view('teacher/assessment/assessmentManagerCreate', ['month' => $month, 'user_id' => $user_id]);
    }

    public function assessmentManagerStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单信息
        $month_assessment_user = $request->input('month_assessment_user');
        $month_assessment_month = $request->input('month_assessment_month');
        // 获取评分
        $month_assessment_3 = 0;
        for($i=1;$i<=30;$i++){
            $month_assessment_3 += $request->input('input'.$i);
        }

        DB::beginTransaction();
        // 插入数据库
        try{
            // 判断是否已有评分
            if(DB::table('month_assessment')->where('month_assessment_user', $month_assessment_user)->where('month_assessment_month', $month_assessment_month)->exists()){
                // 已有评分记录，更新评分记录
                DB::table('month_assessment')
                  ->where('month_assessment_user', $month_assessment_user)
                  ->where('month_assessment_month', $month_assessment_month)
                  ->update(['month_assessment_3' => $month_assessment_3]);
            }else{
                // 没有评分记录，新增评分记录
                DB::table('month_assessment')
                  ->insert(['month_assessment_user' => $month_assessment_user,
                            'month_assessment_month' => $month_assessment_month,
                            'month_assessment_3' => $month_assessment_3]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回购课界面
            return redirect("/teacher/assessment/manager/create?month=".$month_assessment_month."&user_id=".$month_assessment_user)
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '分校长评分失败',
                         'message' => '分校长评分失败，请联系系统管理员']);
        }
        DB::commit();
        return redirect("/teacher/assessment?month=".$month_assessment_month)
               ->with(['notify' => true,
                     'type' => 'success',
                     'title' => '分校长评分成功',
                     'message' => '分校长评分成功']);
    }
}

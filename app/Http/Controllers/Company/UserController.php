<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class UserController extends Controller
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
    public function user(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/user", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取数据
        $users = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->join('teacher_type', 'user.user_teacher_type', '=', 'teacher_type.teacher_type_id')
                   ->join('position', 'user.user_position', '=', 'position.position_id')
                   ->where('user_is_available', 1)
                   ->orderBy('user_department', 'asc')
                   ->orderBy('user_position', 'asc')
                   ->get();

        // 筛选条件
        $filter_departments = DB::table('department')
                                ->where('department_is_available', 1)
                                ->orderBy('department_id', 'asc')
                                ->get();

        // 返回列表视图
        return view('company/user/user', ['users' => $users, 'filter_departments' => $filter_departments]);
    }

    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function userCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/user/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取校区、教师评级信息
        $departments = DB::table('department')
                         ->where('department_is_available', 1)
                         ->orderBy('department_id', 'asc')
                         ->get();
        $teacher_types = DB::table('teacher_type')
                         ->orderBy('teacher_type_id', 'asc')
                         ->get();
        $positions = DB::table('position')
                         ->orderBy('position_id', 'asc')
                         ->get();
        return view('company/user/userCreate', ['departments' => $departments, 'teacher_types' => $teacher_types, 'positions' => $positions]);
    }

    /**
     * 创建新用户提交数据库
     * URL: POST /company/user/create
     * @param  Request  $request
     * @param  $request->input('input1'): 用户姓名
     */
    public function userStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 随机生成新用户ID
        $user_id=chr(rand(97,122)).chr(rand(97,122)).chr(rand(97,122)).chr(rand(97,122)).substr(date('Ym'),2);
        // 获取表单输入
        $user_name = $request->input('input_user_name');
        $user_gender = $request->input('input_user_gender');
        $user_department = $request->input('input_user_department');
        $user_birthday = $request->input('input_user_birthday');
        $user_teacher_type = $request->input('input_user_teacher_type');
        $user_position = $request->input('input_user_position');
        $user_salary_basic = $request->input('input_user_salary_basic');
        $user_salary_housing = $request->input('input_user_salary_housing');
        $user_salary_pension = $request->input('input_user_salary_pension');
        $user_salary_medical = $request->input('input_user_salary_medical');
        $user_salary_unemployment = $request->input('input_user_salary_unemployment');
        $user_salary_provident = $request->input('input_user_salary_provident');
        $user_salary_children = $request->input('input_user_salary_children');
        $user_salary_elderly = $request->input('input_user_salary_elderly');
        $user_salary_performance = $request->input('input_user_salary_performance');
        $user_salary_commission = $request->input('input_user_salary_commission');
        $user_salary_method = $request->input('input_user_salary_method');
        // 插入数据库
        try{
            DB::table('user')->insert(
                ['user_id' => $user_id,
                 'user_name' => $user_name,
                 'user_gender' => $user_gender,
                 'user_department' => $user_department,
                 'user_birthday' => $user_birthday,
                 'user_teacher_type' => $user_teacher_type,
                 'user_position' => $user_position,
                 'user_salary_basic' => $user_salary_basic,
                 'user_salary_housing' => $user_salary_housing,
                 'user_salary_pension' => $user_salary_pension,
                 'user_salary_medical' => $user_salary_medical,
                 'user_salary_unemployment' => $user_salary_unemployment,
                 'user_salary_provident' => $user_salary_provident,
                 'user_salary_children' => $user_salary_children,
                 'user_salary_elderly' => $user_salary_elderly,
                 'user_salary_performance' => $user_salary_performance,
                 'user_salary_commission' => $user_salary_commission,
                 'user_salary_method' => $user_salary_method,
                 'user_create_user' => Session::get('user_id'),
                 'user_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/user/create")
                     ->with(['notify' => true,
                             'type' => 'danger',
                             'title' => '用户添加失败',
                             'message' => '用户添加失败，错误码:113']);
        }
        // 返回用户列表
        return redirect("/company/user/create/success?id=".encode($user_id, 'user_id'))
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户添加成功',
                       'message' => '用户添加成功']);
    }

    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function userCreateSuccess(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取id
        $user_id = decode($request->input('id'), 'user_id');
        return view('company/user/userCreateSuccess', ['user_id' => $user_id]);
    }

    /**
     * 创建新用户页面
     * URL: GET /company/user/create
     */
    public function userEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/user/edit", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户id
        $user_id = decode($request->input('id'), 'user_id');
        // 获取用户信息
        $user = DB::table('user')
                         ->where('user_id', $user_id)
                         ->first();
        // 获取校区、教师评级信息
        $departments = DB::table('department')
                         ->where('department_is_available', 1)
                         ->orderBy('department_id', 'asc')
                         ->get();
        $teacher_types = DB::table('teacher_type')
                         ->orderBy('teacher_type_id', 'asc')
                         ->get();
        $positions = DB::table('position')
                         ->orderBy('position_id', 'asc')
                         ->get();
        return view('company/user/userEdit', ['user' => $user, 'departments' => $departments, 'teacher_types' => $teacher_types, 'positions' => $positions]);
    }

    /**
     * 创建新用户提交数据库
     * URL: POST /company/user/create
     * @param  Request  $request
     * @param  $request->input('input1'): 用户姓名
     */
    public function userUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $user_id=$request->input('input_user_id');
        $user_name = $request->input('input_user_name');
        $user_gender = $request->input('input_user_gender');
        $user_department = $request->input('input_user_department');
        $user_birthday = $request->input('input_user_birthday');
        $user_teacher_type = $request->input('input_user_teacher_type');
        $user_position = $request->input('input_user_position');
        $user_salary_basic = $request->input('input_user_salary_basic');
        $user_salary_housing = $request->input('input_user_salary_housing');
        $user_salary_pension = $request->input('input_user_salary_pension');
        $user_salary_medical = $request->input('input_user_salary_medical');
        $user_salary_unemployment = $request->input('input_user_salary_unemployment');
        $user_salary_provident = $request->input('input_user_salary_provident');
        $user_salary_children = $request->input('input_user_salary_children');
        $user_salary_elderly = $request->input('input_user_salary_elderly');
        $user_salary_performance = $request->input('input_user_salary_performance');
        $user_salary_commission = $request->input('input_user_salary_commission');
        $user_salary_method = $request->input('input_user_salary_method');
        // 插入数据库
        try{
            DB::table('user')
              ->where('user_id', $user_id)
              ->update(
                ['user_id' => $user_id,
                 'user_name' => $user_name,
                 'user_gender' => $user_gender,
                 'user_department' => $user_department,
                 'user_birthday' => $user_birthday,
                 'user_teacher_type' => $user_teacher_type,
                 'user_position' => $user_position,
                 'user_salary_basic' => $user_salary_basic,
                 'user_salary_housing' => $user_salary_housing,
                 'user_salary_pension' => $user_salary_pension,
                 'user_salary_medical' => $user_salary_medical,
                 'user_salary_unemployment' => $user_salary_unemployment,
                 'user_salary_provident' => $user_salary_provident,
                 'user_salary_children' => $user_salary_children,
                 'user_salary_elderly' => $user_salary_elderly,
                 'user_salary_performance' => $user_salary_performance,
                 'user_salary_commission' => $user_salary_commission,
                 'user_salary_method' => $user_salary_method,
                 'user_create_user' => Session::get('user_id'),
                 'user_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/user/edit?id=".encode($user_id, "user_id"))
                     ->with(['notify' => true,
                             'type' => 'danger',
                             'title' => '用户修改失败',
                             'message' => '用户修改失败，错误码:113']);
        }
        // 返回用户列表
        return redirect("/company/user")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户修改成功',
                       'message' => '用户修改成功']);
    }

    /**
     * 用户权限视图
     * URL: GET /company/user/access/{user_id}
     * @param  int  $user_id
     */
    public function userAccess(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/user/access", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取user_id
        $user_id = decode($request->input('id'), 'user_id');
        // 获取全部校区
        $user = DB::table('user')
                  ->join('department', 'user.user_department', '=', 'department.department_id')
                  ->join('position', 'user.user_position', '=', 'position.position_id')
                  ->join('teacher_type', 'user.user_teacher_type', '=', 'teacher_type.teacher_type_id')
                  ->where('user_id', $user_id)
                  ->first();
        // 获取全部校区
        $departments = DB::table('department')
                          ->where('department_is_available', 1)
                          ->orderBy('department_id', 'asc')
                          ->get();
        $department_array = array();
        foreach($departments AS $department){
            $department_array[$department->department_id] = array($department->department_id, $department->department_name, 0);
        }
        // 获取用户校区权限
        $user_departments = DB::table('user_department')
                              ->where('user_department_user', $user_id)
                              ->get();
        foreach($user_departments AS $user_department){
            $department_array[$user_department->user_department_department][2]=1;
        }

        // 获取主页权限
        $dashboard_accesses = DB::table('dashboard_access')->get();
        // 获取用户主页权限
        $db_user_dashboards = DB::table('user_dashboard')
                                ->where('user_dashboard_user', $user_id)
                                ->get();
        $user_dashboards = array();
        foreach($db_user_dashboards AS $db_user_dashboard){
            $user_dashboards[] = $db_user_dashboard->user_dashboard_dashboard;
        }

        // 获取全部页面种类及其页面
        $accesses = array();
        $db_access_categories = DB::table('access')->select('access_category')->distinct()->get();
        foreach($db_access_categories as $db_access_category){
            $db_access_pages = DB::table('access')
                                 ->select('access_page')
                                 ->where('access_category', $db_access_category->access_category)
                                 ->distinct()
                                 ->get();
            foreach($db_access_pages as $db_access_page){
                $db_access_features = DB::table('access')
                                        ->where('access_category', $db_access_category->access_category)
                                        ->where('access_page', $db_access_page->access_page)
                                        ->get();
                foreach($db_access_features as $db_access_feature){
                    $temp = array();
                    $temp['access_url']=$db_access_feature->access_url;
                    $temp['access_feature']=$db_access_feature->access_feature;
                    $accesses[$db_access_category->access_category][$db_access_page->access_page][] = $temp;
                }
            }
        }
        // 获取用户页面权限
        $user_accesses = array();
        $db_user_accesses = DB::table('user_access')
                              ->where('user_access_user', $user_id)
                              ->get();
        foreach($db_user_accesses AS $db_user_access){
            $user_accesses[] = $db_user_access->user_access_access;
        }
        return view('company/user/userAccess', ['user' => $user,
                                                'department_array' => $department_array,
                                                'dashboard_accesses' => $dashboard_accesses,
                                                'user_dashboards' => $user_dashboards,
                                                'accesses' => $accesses,
                                                'user_accesses' => $user_accesses]);
    }

    /**
     * 修改用户权限提交
     * URL: POST /user/access/{user_id}
     * @param  Request  $request
     * @param  $request->input('departments'): 校区权限
     * @param  $request->input('pages'): 页面权限
     * @param  int  $user_id: 用户id
     */
    public function userAccessUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $user_id = $request->input('user_id');
        $accesses = $request->input('accesses');
        $departments = $request->input('departments');
        $dashboards = $request->input('dashboards');
        // 更新数据库
        DB::beginTransaction();
        try{
            // 删除原有权限
            DB::table('user_department')
              ->where('user_department_user', $user_id)
              ->delete();
            DB::table('user_access')
              ->where('user_access_user', $user_id)
              ->delete();
            DB::table('user_dashboard')
              ->where('user_dashboard_user', $user_id)
              ->delete();
            if($departments!=NULL){
                // 添加校区权限
                foreach($departments as $department){
                    DB::table('user_department')->insert(
                        ['user_department_user' => $user_id,
                         'user_department_department' => $department]
                    );
                }
            }
            if($dashboards!=NULL){
                // 添加主页权限
                foreach($dashboards as $dashboard){
                    DB::table('user_dashboard')->insert(
                        ['user_dashboard_user' => $user_id,
                         'user_dashboard_dashboard' => $dashboard]
                    );
                }
            }
            if($accesses!=NULL){
                // 添加页面权限
                foreach($accesses as $access){
                    DB::table('user_access')->insert(
                        ['user_access_user' => $user_id,
                         'user_access_access' => $access]
                    );
                }
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/company/user/access?id=".encode($user_id, 'user_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '用户权限修改失败',
                           'message' => '用户权限修改失败，错误码:114']);
        }
        DB::commit();
        return redirect("/company/user/access/success?id=".encode($user_id, 'user_id'))
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户权限修改成功',
                       'message' => '用户权限修改成功,新权限将在重新登录后生效！']);
    }

    /**
     * 用户权限成功
     * URL: GET /company/user/access/success
     */
    public function userAccessSuccess(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取id
        $user_id = decode($request->input('id'), 'user_id');
        return view('company/user/userAccessSuccess', ['user_id' => $user_id]);
    }

    public function userPassword(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/user/password", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取user_id
        $user_id = decode($request->input('id'), 'user_id');
        // 删除数据
        try{
            DB::table('user')
              ->where('user_id', $user_id)
              ->update(['user_password' => '000000']);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/user")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '密码重置失败',
                         'message' => '密码重置失败，错误码:116']);
        }
        // 返回用户列表
        return redirect("/company/user")
                 ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '密码重置成功',
                         'message' => '密码重置成功']);
    }

    /**
     * 删除用户
     * URL: DELETE /company/user/{id}
     * @param  int  $user_id
     */
    public function userDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/user/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取user_id
        $user_id = decode($request->input('id'), 'user_id');
        // 删除数据
        try{
            DB::table('user')
              ->where('user_id', $user_id)
              ->update(['user_is_available' => 0,
                        'user_modified_user' => Session::get('user_id'),
                        'user_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/user")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '用户删除失败',
                         'message' => '用户删除失败，错误码:116']);
        }
        // 返回用户列表
        return redirect("/company/user")
                 ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '用户删除成功',
                         'message' => '用户删除成功']);
    }


}

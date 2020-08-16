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

        // 获取数据
        $users = DB::table('user')
                   ->join('department', 'user.user_department', '=', 'department.department_id')
                   ->where('user_is_available', 1)
                   ->orderBy('user_department', 'asc')
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
        // 获取年级、科目、用户信息
        $departments = DB::table('department')
                         ->where('department_is_available', 1)
                         ->orderBy('department_id', 'asc')
                         ->get();
        return view('company/user/userCreate', ['departments' => $departments]);
    }

    /**
     * 创建新用户提交数据库
     * URL: POST /company/user/create
     * @param  Request  $request
     * @param  $request->input('input1'): 用户姓名
     * @param  $request->input('input2'): 用户性别
     * @param  $request->input('input3'): 用户校区
     * @param  $request->input('input4'): 用户岗位
     * @param  $request->input('input5'): 入职日期
     * @param  $request->input('input6'): 是否可以跨校区上课
     * @param  $request->input('input7'): 用户手机
     * @param  $request->input('input8'): 用户微信
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
        // 插入数据库
        try{
            DB::table('user')->insert(
                ['user_id' => $user_id,
                 'user_name' => $user_name,
                 'user_gender' => $user_gender,
                 'user_department' => $user_department,
                 'user_birthday' => $user_birthday,
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
        return redirect("/company/user")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户添加成功',
                       'message' => '用户添加成功']);
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
        // 获取user_id
        $user_id = decode($request->input('id'), 'user_id');
        // 获取全部校区
        $user = DB::table('user')
                  ->join('department', 'user.user_department', '=', 'department.department_id')
                  ->join('position', 'user.user_position', '=', 'position.position_id')
                  ->join('section', 'position.position_section', '=', 'section.section_id')
                  ->where('user_id', $user_id)
                  ->first();
        // 获取全部校区
        $departments = DB::table('department')
                          ->where('department_status', 1)
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
        // 获取全部页面种类及其页面
        $page_categories = $users = DB::table('page')->select('page_category')->distinct()->get();
        $categories = array();
        $pages = array();
        foreach($page_categories AS $page_category){
            $temp = array($page_category->page_category);
            $page_array = array();
            $temp_pages = DB::table('page')->where('page_category', $page_category->page_category)->get();
            foreach($temp_pages AS $temp_page){
                $page_array[$temp_page->page_id] = array($temp_page->page_id, $temp_page->page_name);
                $pages[$temp_page->page_id] = array($temp_page->page_id, $temp_page->page_name, 0);
            }
            $temp[] = $page_array;
            $categories[] = $temp;
        }
        // 获取用户页面权限
        $user_pages = DB::table('user_page')
                        ->where('user_page_user', $user_id)
                        ->get();
        foreach($user_pages AS $user_page){
            $pages[$user_page->user_page_page][2] = 1;
        }
        return view('company/user/userAccess', ['user' => $user,
                                            'department_array' => $department_array,
                                            'categories' => $categories,
                                            'pages' => $pages]);
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
        // 获取user_id
        $user_id = decode($request->input('id'), 'user_id');
        // 获取表单输入
        $departments = $request->input('departments');
        $pages = $request->input('pages');
        // 更新数据库
        DB::beginTransaction();
        try{
            // 删除原有权限
            DB::table('user_department')
              ->where('user_department_user', $user_id)
              ->delete();
            DB::table('user_page')
              ->where('user_page_user', $user_id)
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
            if($pages!=NULL){
                // 添加页面权限
                foreach($pages as $page){
                    DB::table('user_page')->insert(
                        ['user_page_user' => $user_id,
                         'user_page_page' => $page]
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
        return redirect("/company/user/access?id=".encode($user_id, 'user_id'))
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户权限修改成功',
                       'message' => '用户权限修改成功,新权限将在重新登录后生效！']);
    }

}

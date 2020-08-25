<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class TeacherTypeController extends Controller
{
    /**
     * 显示所有校区记录
     * URL: GET /company/department
     */
    public function teacherType(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/company/teacherType')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取数据
        $teacher_types = DB::table('teacher_type')
                         ->orderBy('teacher_type_id', 'asc')
                         ->get();
        // 返回列表视图
        return view('/company/teacherType/teacherType', ['teacher_types' => $teacher_types]);
    }

    /**
     * 创建新校区页面
     * URL: GET /company/department/create
     */
    public function teacherTypeCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/company/teacherType/create')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        $grades = DB::table('grade')
                    ->orderBy('grade_id', 'asc')
                    ->get();
        return view('/company/teacherType/teacherTypeCreate', ['grades' => $grades]);
    }

    /**
     * 创建新校区提交数据库
     * URL: POST /company/department/store
     */
    public function teacherTypeStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $teacher_type_name = $request->input('input_teacher_type_name');
        DB::beginTransaction();
        // 插入数据库
        try{
            // 添加教师评级记录
            $teacher_type_id = DB::table('teacher_type')->insertGetId(['teacher_type_name' => $teacher_type_name]);
            // 添加课时提成记录
            for($i=1;$i<=12;$i++){
                for($j=1;$j<=6;$j++){
                    DB::table('deduction')->insert(
                        ['deduction_teacher_type' => $teacher_type_id,
                         'deduction_grade' => $i,
                         'deduction_student_num' => $j,
                         'deduction_fee' => $request->input('input_'.$i.'_'.$j)]
                    );
                }
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/company/teacherType/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '用户评级添加失败',
                           'message' => '用户评级名称已存在，错误码:101']);
        }
        DB::commit();
        // 返回校区列表
        return redirect("/company/teacherType")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户评级添加成功',
                       'message' => '用户评级添加成功!']);
    }

    /**
     * 修改单个校区
     * URL: GET /company/department/edit
     */
    public function teacherTypeEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!DB::table('user_access')
           ->join('access', 'user_access.user_access_access', '=', 'access.access_id')
           ->where('user_access_user', Session::get('user_id'))
           ->where('access_url', '/company/teacherType/edit')
           ->exists()){
           return back()->with(['notify' => true,
                                'type' => 'danger',
                                'title' => '访问失败',
                                'message' => '您的账户没有访问权限']);
        }
        // 获取id
        $teacher_type_id = decode($request->input('id'), 'teacher_type_id');
        // 获取教师评级信息
        $teacher_type = DB::table('teacher_type')
                          ->where('teacher_type_id', $teacher_type_id)
                          ->first();
        // 获取课时费信息
        $db_deductions = DB::table('deduction')
                        ->where('deduction_teacher_type', $teacher_type_id)
                        ->orderBy('deduction_grade', 'asc')
                        ->orderBy('deduction_student_num', 'asc')
                        ->get();
        $deductions = array();
        foreach($db_deductions as $db_deduction){
            $deductions[$db_deduction->deduction_grade][$db_deduction->deduction_student_num] = $db_deduction->deduction_fee;
        }
        // 获取年级信息
        $grades = DB::table('grade')
                    ->orderBy('grade_id', 'asc')
                    ->get();
        return view('/company/teacherType/teacherTypeEdit', ['teacher_type' => $teacher_type, 'deductions' => $deductions, 'grades' => $grades]);
    }

    /**
     * 修改校区提交数据库
     * URL: POST /company/department/update
     */
    public function teacherTypeUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $teacher_type_name = $request->input('input_teacher_type_name');
        $teacher_type_id = $request->input('input_teacher_type_id');
        DB::beginTransaction();
        // 插入数据库
        try{
            // 修改教师评级记录
            DB::table('teacher_type')
              ->where('teacher_type_id', $teacher_type_id)
              ->update(['teacher_type_name' => $teacher_type_name]);
            // 修改课时提成记录
            for($i=1;$i<=12;$i++){
                for($j=1;$j<=6;$j++){
                    DB::table('deduction')
                      ->where('deduction_grade', $i)
                      ->where('deduction_student_num', $j)
                      ->update(['deduction_fee' => $request->input('input_'.$i.'_'.$j)]);
                }
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/company/teacherType/edit?".encode($teacher_type_id, 'teacher_type_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '用户评级修改失败',
                           'message' => '用户评级名称已存在，错误码:101']);
        }
        DB::commit();
        return redirect("/company/teacherType")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户评级修改成功',
                       'message' => '用户评级修改成功!']);
    }

}

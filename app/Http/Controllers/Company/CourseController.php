<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class CourseController extends Controller
{

    /**
     * 课程设置
     * URL: GET /company/course
     */
    public function course(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取数据
        $courses = DB::table('course')
                     ->leftJoin('grade', 'course.course_grade', '=', 'grade.grade_id')
                     ->orderBy('course_is_available', 'desc')
                     ->orderBy('course_type', 'asc')
                     ->orderBy('course_grade', 'asc')
                     ->orderBy('course_unit_price', 'asc')
                     ->get();
        // 获取校区、年级、科目信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();
        //$filter_subjects = DB::table('subject')->where('subject_status', 1)->orderBy('subject_id', 'asc')->get();
        // 返回列表视图
        return view('/company/course/course', ['courses' => $courses]);
    }

    /**
     * 创建新课程页面
     * URL: GET /company/course/create
     */
    public function courseCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取年级、科目信息、课程类型
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('/company/course/courseCreate', ['grades' => $grades]);
    }

    /**
     * 创建新课程提交数据库
     * URL: POST /company/course/store
     */
    public function courseStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $course_name = $request->input('input_course_name');
        $course_quarter = $request->input('input_course_quarter');
        $course_grade = $request->input('input_course_grade');
        $course_unit_price = $request->input('input_course_unit_price');
        $course_type = $request->input('input_course_type');
        // 插入数据库
        try{
           DB::table('course')->insert(
                ['course_name' => $course_name,
                 'course_quarter' => $course_quarter,
                 'course_grade' => $course_grade,
                 'course_unit_price' => $course_unit_price,
                 'course_type' => $course_type,
                 'course_create_user' => Session::get('user_id'),
                 'course_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/course/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程添加失败',
                           'message' => '课程添加失败，错误码:104']);
        }
        // 返回课程列表
        return redirect("/company/course")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程添加成功',
                       'message' => '课程名称: '.$course_name]);
    }

    /**
     * 修改单个课程
     * URL: GET /company/course/edit
     */
    public function courseEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取course_id
        $course_id = decode($request->input('id'), 'course_id');
        // 获取数据信息
        $course = DB::table('course')->where('course_id', $course_id)->first();
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('/company/course/courseEdit', ['course' => $course, 'grades' => $grades]);
    }

    /**
     * 修改新课程提交数据库
     * URL: POST /course/create/update
     */
    public function courseUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取course_id
        $course_id = decode($request->input('id'), 'course_id');
         // 获取表单输入
        $course_name = $request->input('input1');
        $course_department = $request->input('input2');
        $course_quarter = $request->input('input3');
        $course_grade = $request->input('input4');
        $course_subject = $request->input('input5');
        $course_type = $request->input('input7');
        if($request->filled('input9')) {
            $course_remark = $request->input('input9');
        }else{
            $course_remark = "";
        }
        // 更新数据库
        try{
            DB::table('course')
              ->where('course_id', $course_id)
              ->update(['course_name' => $course_name,
                        'course_department' => $course_department,
                        'course_quarter' => $course_quarter,
                        'course_grade' => $course_grade,
                        'course_subject' => $course_subject,
                        'course_unit_price' => $course_unit_price,
                        'course_type' => $course_type,
                        'course_time' => $course_time,
                        'course_remark' => $course_remark]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("company/course/edit?id=".encode($course_id, 'course_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程修改失败',
                           'message' => '课程修改失败，错误码:105']);
        }
        return redirect("/company/course")
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '课程修改成功',
                      'message' => '课程修改成功，课程名称: ']);
    }

    /**
     * 删除课程
     * URL: DELETE /company/course/delete
     */
    public function courseDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取course_id
        $request_ids=$request->input('id');
        $course_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $course_ids[]=decode($request_id, 'course_id');
            }
        }else{
            $course_ids[]=decode($request_ids, 'course_id');
        }
        // 删除数据
        try{
            foreach ($course_ids as $course_id){
                DB::table('course')
                  ->where('course_id', $course_id)
                  ->update(['course_is_available' => 0,
                            'course_modified_user' => Session::get('user_id'),
                            'course_modified_time' => date('Y-m-d H:i:s')]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/course")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程结课失败',
                           'message' => '课程结课失败，错误码:106']);
        }
        // 返回课程列表
        return redirect("/company/course")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程结课成功',
                       'message' => '课程结课成功!']);
    }

    /**
     * 恢复课程
     * URL: DELETE /company/course/restore
     */
    public function courseRestore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取course_id
        $course_id = decode($request->input('id'), 'course_id');
        // 删除数据
        try{
            DB::table('course')
              ->where('course_id', $course_id)
              ->update(['course_is_available' => 1,
                        'course_modified_user' => Session::get('user_id'),
                        'course_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/course")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '课程恢复失败',
                           'message' => '课程恢复失败，错误码:106']);
        }
        // 返回课程列表
        return redirect("/company/course")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '课程恢复成功',
                       'message' => '课程恢复成功!']);
    }

}

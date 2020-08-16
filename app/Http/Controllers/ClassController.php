<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ClassController extends Controller
{

    /**
     * 显示单个班级详细信息
     * URL: GET /class/{id}
     * @param  int  $class_id
     */
    public function class(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $class_id = decode($request->input('id'), 'class_id');
        // 获取数据信息
        $class = DB::table('class')
                   ->join('department', 'class.class_department', '=', 'department.department_id')
                   ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                   ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                   ->join('user', 'class.class_teacher', '=', 'user.user_id')
                   ->where('class_id', $class_id)
                   ->first();

        // 获取成员数据
        $members = DB::table('member')
                  ->join('student', 'member.member_student', '=', 'student.student_id')
                  ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                  ->where('member.member_class', $class_id)
                  ->get();

        // 获取学生信息
        $students = DB::table('student')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_department', $class->class_department)
                      ->where('student_is_available', 1)
                      ->orderBy('student_id', 'asc')
                      ->get();


        return view('class/class', ['class' => $class,
                                    'students' => $students,
                                    'members' => $members]);
    }

    /**
     * 插入班级提交
     * URL: GET /operation/member/store
     */
    public function classMemberAdd(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $member_class = $request->input('input_member_class');
        $member_student = $request->input('input_member_student');

        $class = DB::table('class')
                   ->where('class_id', $member_class)
                   ->first();

        if($class->class_current_num>=$class->class_max_num){
            return redirect("/class?id=".encode($class_id, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '添加学生失败',
                           'message' => '添加学生失败，班级人数已达上限']);
        }
        // 插入数据库
        DB::beginTransaction();
        try{
            // 添加班级成员
            DB::table('member')->insert(
                ['member_class' => $member_class,
                 'member_student' => $member_student,
                 'member_create_user' => Session::get('user_id')]
            );
            // 增加班级人数
            DB::table('class')
              ->where('class_id', $member_class)
              ->increment('class_current_num');
            // 插入学生动态
            /* TODO */
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/class?id=".encode($member_class, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '添加学生失败',
                           'message' => '添加学生失败，请重新输入信息']);
        }
        DB::commit();
        // 返回客户列表
        return redirect("/class?id=".encode($member_class, 'class_id'))
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '添加学生成功',
                      'message' => '添加学生成功']);
    }

    /**
     * 班级成员删除
     * URL: DELETE/class/{class_id}
     */
    public function classMemberDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $class_id = decode($request->input('class_id'), 'class_id');
        $student_id = decode($request->input('student_id'), 'student_id');
        // 插入数据库
        DB::beginTransaction();
        try{
            // 删除班级成员
            DB::table('member')
              ->where('member_class', $class_id)
              ->where('member_student', $student_id)
              ->delete();
            // 更新班级人数
            DB::table('class')
              ->where('class_id', $class_id)
              ->decrement('class_current_num');
            // 插入学生动态
            //
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/class?id=".encode($class_id, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '删除成员失败',
                           'message' => '删除成员失败，请联系系统管理员']);
        }
        DB::commit();
        // 返回客户列表
        return redirect("/class?id=".encode($class_id, 'class_id'))
               ->with(['notify' => true,
                      'type' => 'success',
                      'title' => '删除成员成功',
                      'message' => '删除成员成功']);
    }

    /**
     * 修改班级提交
     * URL: PUT /class/{id}
     * @param  Request  $request
     * @param  $request->input('input1'): 名称
     * @param  $request->input('input2'): 年级
     * @param  $request->input('input3'): 科目
     * @param  $request->input('input4'): 负责教师
     * @param  $request->input('input5'): 最大人数
     * @param  $request->input('input6'): 备注
     * @param  int  $class_id
     */
    public function update(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $class_id = decode($request->input('id'), 'class_id');
         // 获取表单输入
        $class_name = $request->input('input1');
        $class_grade = $request->input('input2');
        $class_subject = $request->input('input3');
        $class_teacher = $request->input('input4');
        $class_max_num = $request->input('input5');
        if($request->filled('input6')) {
            $class_remark = $request->input('input6');
        }else{
            $class_remark = '无';
        }
        // 更新数据库
        try{
            DB::table('class')
              ->where('class_id', $class_id)
              ->update(['class_name' => $class_name,
                        'class_grade' => $class_grade,
                        'class_subject' => $class_subject,
                        'class_teacher' => $class_teacher,
                        'class_max_num' => $class_max_num,
                        'class_remark' => $class_remark]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/class/edit?id=".encode($class_id, 'class_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '班级修改失败',
                           'message' => '班级修改失败，请重新输入信息']);
        }
        return redirect("/class?id=".encode($class_id, 'class_id'))
               ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '班级修改成功',
                         'message' => '班级修改成功，班级名称: '.$class_name]);
    }

}

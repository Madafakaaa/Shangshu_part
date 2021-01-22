<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class DeletedStudentController extends Controller
{

    public function deletedStudent(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/deletedStudent", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $db_students = DB::table('student')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_is_available', 0)
                      ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_students = $db_students->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_students = $db_students->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_students = $db_students->orderBy('student_department', 'asc')
                                   ->orderBy('student_grade', 'asc')
                                   ->orderBy('student_id', 'asc')
                                   ->get();
        $students = array();
        foreach($db_students as $db_student){
            $temp = array();
            $temp['student_id']=$db_student->student_id;
            $temp['department_name']=$db_student->department_name;
            $temp['student_gender']=$db_student->student_gender;
            $temp['student_name']=$db_student->student_name;
            $temp['grade_name']=$db_student->grade_name;
            // 获取所在班级
            $temp['classes'] = array();
            $classes = DB::table('member')
                         ->join('class', 'class.class_id', '=', 'member.member_class')
                         ->join('grade', 'grade.grade_id', '=', 'class.class_grade')
                         ->join('subject', 'subject.subject_id', '=', 'class.class_subject')
                         ->where('member_student', $db_student->student_id)
                         ->get();
            foreach($classes as $class){
                $class_temp = array();
                $class_temp['class_id'] = $class->class_id;
                $class_temp['class_name'] = $class->class_name;
                $class_temp['grade_name'] = $class->grade_name;
                $class_temp['subject_name'] = $class->subject_name;
                $temp['classes'][] = $class_temp;
            }
            // 获取剩余课时
            $temp['hours'] = array();
            $hours = DB::table('hour')
                         ->join('course', 'hour.hour_course', '=', 'course.course_id')
                         ->where('hour_student', $db_student->student_id)
                         ->get();
            foreach($hours as $hour){
                $hour_temp = array();
                $hour_temp['course_name'] = $hour->course_name;
                $hour_temp['hour_remain'] = $hour->hour_remain;
                $hour_temp['hour_used'] = $hour->hour_used;
                $temp['hours'][] = $hour_temp;
            }
            // 获取最近上课记录
            /* TODO */
            // 获取晚托状态
            $temp['student_daycare'] = "";
            if(DB::table('daycare_record')->where('daycare_record_student', $db_student->student_id)->where('daycare_record_is_refunded', '=',  0)->where('daycare_record_start', '<=',  date('Y-m-d'))->where('daycare_record_end', '>=',  date('Y-m-d'))->exists()){
                $temp['student_daycare']="1";
            }
            $students[]=$temp;
        }
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/deletedStudent/deletedStudent', ['students' => $students,
                                                  'filters' => $filters,
                                                  'filter_departments' => $filter_departments,
                                                  'filter_grades' => $filter_grades]);
    }

    public function deletedStudentExport(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/deletedStudent/export", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $students = DB::table('student')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_is_available', 0)
                      ->whereIn('student_department', $department_access);
        // 校区
        if ($request->filled('filter_department')) {
            $students = $students->where('student_department', '=', $request->input("filter_department"));
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $students = $students->where('student_grade', '=', $request->input('filter_grade'));
        }
        $students = $students->orderBy('student_department', 'asc')
                             ->orderBy('student_grade', 'asc')
                             ->orderBy('student_id', 'asc')
                             ->get();
        // 返回列表视图
        return view('education/deletedStudent/deletedStudentExport', ['students' => $students]);
    }

    public function deletedStudentRestore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/deletedStudent/restore", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取student_id
        $request_ids=$request->input('id');
        $student_ids = array();
        if(is_array($request_ids)){
            foreach ($request_ids as $request_id) {
                $student_ids[]=decode($request_id, 'student_id');
            }
        }else{
            $student_ids[]=decode($request_ids, 'student_id');
        }
        // 更新学生可用状态
        DB::beginTransaction();
        try{
            foreach ($student_ids as $student_id){
                DB::table('student')
                  ->where('student_id', $student_id)
                  ->update(['student_is_available' => 1,
                            'student_modified_user' => Session::get('user_id'),
                            'student_modified_time' => date('Y-m-d H:i:s')]);
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '学生恢复失败',
                                 'message' => '学生恢复失败，错误码:204']);
        }
        DB::commit();
        // 返回课程列表
        return back()->with(['notify' => true,
                             'type' => 'success',
                             'title' => '学生恢复成功',
                             'message' => '学生恢复成功!']);
    }


}

<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class HourController extends Controller
{

    public function hour(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取用户校区权限
        // $department_access = Session::get('department_access');
                  //->whereIn('student_department', $department_access)
        // 获取数据
        $hours = DB::table('hour')
                   ->join('student', 'hour.hour_student', '=', 'student.student_id')
                   ->join('department', 'student.student_department', '=', 'department.department_id')
                   ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                   ->join('course', 'hour.hour_course', '=', 'course.course_id')
                   ->where('student_is_available', 1)
                   ->orderBy('student_department', 'asc')
                   ->orderBy('student_grade', 'asc')
                   ->get();

        // 获取校区、年级信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/hour/hour', ['hours' => $hours]);
    }

}

<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class StudentController extends Controller
{

    public function student(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取用户校区权限
        // $department_access = Session::get('department_access');
                  //->whereIn('student_department', $department_access)
        // 获取数据
        $students = DB::table('student')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_is_available', 1)
                      ->orderBy('student_department', 'asc')
                      ->orderBy('student_grade', 'asc')
                      ->get();
        // 获取校区、年级信息(筛选)
        //$filter_departments = DB::table('department')->where('department_status', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        //$filter_grades = DB::table('grade')->where('grade_status', 1)->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/student/student', ['students' => $students]);
    }

    public function studentCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取年级信息
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('education/student/studentCreate', ['grades' => $grades]);
    }

    public function studentStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $student_name = $request->input('input_student_name');
        $student_gender = $request->input('input_student_gender');
        $student_grade = $request->input('input_student_grade');
        $student_school = $request->input('input_student_school');
        $student_phone = $request->input('input_student_phone');
        $student_birthday = $request->input('input_student_birthday');

        $student_department = Session::get('user_department');

        // 生成学生ID
        if(DB::table('student')->where('student_department', '=', $student_department)->exists()){
            // 获取上一个学生学号
            $pre_student_id = DB::table('student')
                                ->where('student_department', '=', $student_department)
                                ->orderBy('student_id', 'desc')
                                ->limit(1)
                                ->first();
            if(intval(substr($pre_student_id->student_id , 7 , 10))==999){
                return redirect("/education/student/create")
                       ->with(['notify' => true,
                               'type' => 'danger',
                               'title' => '客户添加失败',
                               'message' => '本校本月添加学生数量已超过超出上限，错误码:201']);
            }
            $new_student_num = intval(substr($pre_student_id->student_id , 7 , 10))+1;
            $student_id = "S".substr(date('Ym'),2).sprintf("%02d", $student_department).sprintf("%03d", $new_student_num);
        }else{
            // 生成新学生ID
            $student_id = "S".substr(date('Ym'),2).sprintf("%02d", $student_department).sprintf("%03d", 1);
        }
        // 插入数据库
        DB::beginTransaction();
        try{
            DB::table('student')->insert(
                ['student_id' => $student_id,
                 'student_department' => $student_department,
                 'student_name' => $student_name,
                 'student_grade' => $student_grade,
                 'student_gender' => $student_gender,
                 'student_birthday' => $student_birthday,
                 'student_school' => $student_school,
                 'student_phone' => $student_phone,
                 'student_create_user' => Session::get('user_id'),
                 'student_modified_user' => Session::get('user_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/education/student/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '客户添加失败',
                           'message' => '客户添加失败，该学生已经存在于本校区，错误码:202']);
        }
        DB::commit();
        // 返回学生列表
        //return redirect("/education/student/create/success?id=".encode($student_id, 'student_id'))
        return redirect("/education/student")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '客户添加成功',
                       'message' => '客户添加成功']);
    }

    public function studentDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
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
        try{
            foreach ($student_ids as $student_id){
                DB::table('student')
                  ->where('student_id', $student_id)
                  ->update(['student_is_available' => 0,
                            'student_modified_user' => Session::get('user_id'),
                            'student_modified_time' => date('Y-m-d H:i:s')]);
                // 从班级成员中删除该学生
                /*
                DB::table('member')
                  ->where('member_student', $student_id)
                  ->delete();
                */
                // 更新班级人数
                /* TODO */

            }
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/education/student")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '学生删除失败',
                         'message' => '学生删除失败，错误码:204']);
        }
        // 返回课程列表
        return redirect("/education/student")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '学生删除成功',
                       'message' => '学生删除成功!']);
    }

    public function studentPaymentCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取学生信息
        $student_id = decode($request->input('id'), 'student_id');
        $student = DB::table('student')
                     ->join('department', 'student.student_department', '=', 'department.department_id')
                     ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                     ->where('student_id', $student_id)
                     ->first();
        // 获取学生已有课时
        /* TODO */

        // 获取可购买课程信息
        // 相同年级课程
        $course_same_grade = DB::table('course')
                               ->join('grade', 'course.course_grade', '=', 'grade.grade_id')
                               ->where('course_grade', $student->student_grade)
                               ->orderBy('course_id', 'desc')
                               ->get();
        // 全年级课程
        $course_all_grade = DB::table('course')
                              ->leftJoin('grade', 'course.course_grade', '=', 'grade.grade_id')
                              ->where('course_grade', 0)
                              ->orderBy('course_id', 'desc')
                              ->get();
        // 全年级课程
        $course_diff_grade = DB::table('course')
                               ->join('grade', 'course.course_grade', '=', 'grade.grade_id')
                               ->where([
                                   ['course_grade', '<>', $student->student_grade],
                                   ['course_grade', '<>', 0],
                               ])
                               ->orderBy('course_grade', 'asc')
                               ->orderBy('course_id', 'desc')
                               ->get();
        return view('education/student/studentPaymentCreate', ['student' => $student,
                                                        'course_same_grade' => $course_same_grade,
                                                        'course_all_grade' => $course_all_grade,
                                                        'course_diff_grade' => $course_diff_grade]);
    }

    public function studentPaymentStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单信息
        $course_num = $request->input("course_num");
        $payment_student = $request->input("payment_student");
        $payment_method = $request->input("payment_method");
        $payment_date = $request->input("payment_date");
        $payment_remark = $request->input("payment_remark");

        DB::beginTransaction();
        // 插入数据库
        try{
            for($i=1;$i<=$course_num;$i++){
                $payment_course=$request->input("payment_course_id_{$i}");
                $payment_course_unit_price=round((float)$request->input("payment_course_unit_price_{$i}"), 2);
                $payment_hour=round((float)$request->input("payment_hour_{$i}"), 2);
                $payment_original_price=$payment_course_unit_price*$payment_hour;
                $payment_discount_percentage=round((float)$request->input("payment_discount_percentage_{$i}"), 2);
                $payment_discount_amount=round((float)$request->input("payment_discount_amount_{$i}"), 2);
                $payment_total_price = $payment_original_price*(100-$payment_discount_percentage)/100-$payment_discount_amount;
                $payment_discount_total = $payment_original_price - $payment_total_price;

                $hour_unit_price = round($payment_total_price/$payment_hour, 2);

                $payment_extra=round((float)$request->input("payment_extra_{$i}"), 2);
                $payment_total_price = $payment_total_price+$payment_extra;
                // 插入Payment表
                DB::table('payment')->insert(
                    ['payment_student' => $payment_student,
                     'payment_course' => $payment_course,
                     'payment_course_unit_price' => $payment_course_unit_price,
                     'payment_hour' => $payment_hour,
                     'payment_original_price' => $payment_original_price,
                     'payment_discount_percentage' => $payment_discount_percentage,
                     'payment_discount_amount' => $payment_discount_amount,
                     'payment_discount_total' => $payment_discount_total,
                     'payment_extra' => $payment_extra,
                     'payment_total_price' => $payment_total_price,
                     'payment_method' => $payment_method,
                     'payment_remark' => $payment_remark,
                     'payment_date' => $payment_date,
                     'payment_create_user' => Session::get('user_id'),
                     'payment_modified_user' => Session::get('user_id')]
                );
                // 更新Hour表
                if(DB::table('hour')->where('hour_course', $payment_course)->where('hour_student', $payment_student)->exists()){
                    $hour = DB::table('hour')
                              ->where('hour_course', $payment_course)
                              ->where('hour_student', $payment_student)
                              ->first();
                    $prev_hour_remain = $hour->hour_remain;
                    $prev_hour_used = $hour->hour_used;
                    $prev_hour_unit_price = $hour->hour_unit_price;

                    $total_value = ($prev_hour_remain+$prev_hour_used)*$prev_hour_unit_price+$payment_hour*$hour_unit_price;
                    $total_hour = $prev_hour_remain+$prev_hour_used+$payment_hour;
                    if($total_hour!=0){
                        $new_hour_unit_price = $total_value/$total_hour;
                    }else{
                        $new_hour_unit_price = 0;
                    }
                    DB::table('hour')
                      ->where('hour_course', $payment_course)
                      ->where('hour_student', $payment_student)
                      ->update(['hour_remain' => $prev_hour_remain+$payment_hour,
                                'hour_unit_price' => $new_hour_unit_price]);
                }else{
                    DB::table('hour')->insert(
                        ['hour_student' => $payment_student,
                         'hour_course' => $payment_course,
                         'hour_remain' => $payment_hour,
                         'hour_used' => 0,
                         'hour_unit_price' => $hour_unit_price]
                    );
                }

            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回购课界面
            return redirect("/education/student/payment/create?id=".encode($payment_student, 'student_id'))
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '购课添加失败',
                         'message' => '购课添加失败，错误码:333']);
        }
        DB::commit();

        return redirect("/education/student")
               ->with(['notify' => true,
                     'type' => 'success',
                     'title' => '购课添加成功',
                     'message' => '购课添加成功']);
    }
}

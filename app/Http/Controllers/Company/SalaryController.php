<?php
namespace App\Http\Controllers\Company;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class SalaryController extends Controller
{

    /**
     * 课程设置
     * URL: GET /company/course
     */
    public function salary(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/salary", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取数据
        $salaries = DB::table('salary')
                      ->join('user', 'salary.salary_user', '=', 'user.user_id')
                      ->join('department', 'user.user_department', '=', 'department.department_id')
                      ->orderBy('salary_month', 'desc')
                      ->orderBy('user_teacher_type', 'asc')
                      ->orderBy('user_department', 'asc')
                      ->get();
        // 返回列表视图
        return view('/company/salary/salary', ['salaries' => $salaries]);
    }

    /**
     * 创建新课程页面
     * URL: GET /company/course/create
     */
    public function salaryCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/company/salary/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        return view('/company/salary/salaryCreate');
    }


    public function salaryCreate2(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $salary_month = $request->input('input_salary_month');
        // 获取用户
        $db_users = DB::table('user')
                      ->join('department', 'department.department_id', '=', 'user.user_department')
                      ->join('teacher_type', 'teacher_type.teacher_type_id', '=', 'user.user_teacher_type')
                      ->join('position', 'position.position_id', '=', 'user.user_position')
                      ->where('user_is_available', 1)
                      ->orderBy('user_teacher_type', 'asc')
                      ->get();
        // 获取校区
        // 计算校区课消
        $db_departments = DB::table('department')
                           ->orderBy('department_id', 'asc')
                           ->get();
        $department_consumptions = array();
        foreach($db_departments as $db_department){
            $department_consumptions[$db_department->department_id] = 0;
        }
        $db_lessons = DB::table('lesson')
                            ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                            ->join('department', 'department.department_id', '=', 'class.class_department')
                            ->whereYear('lesson_date', date('Y', strtotime($salary_month)))
                            ->whereMonth('lesson_date', date('m', strtotime($salary_month)))
                            ->groupBy('department_id')
                            ->select(DB::raw("sum(lesson_hour_price) as department_consumption"), "department_id")
                            ->get();
        foreach($db_lessons as $db_lesson){
            $department_consumptions[$db_lesson->department_id] = $db_lesson->department_consumption;
        }
        $month_date_start=$salary_month."-01";
        $month_date_end=date('Y-m-t',strtotime($salary_month));
        // 计算校区晚托消耗
        $department_daycares = array();
        foreach($db_departments as $db_department){
            $department_daycares[$db_department->department_id] = 0;
            $db_daycare_records = DB::table('daycare_record')
                                    ->join('student', 'daycare_record.daycare_record_student', '=', 'student.student_id')
                                    ->whereRaw('( (daycare_record_start >= ? AND daycare_record_start <= ?) OR
                                                  (daycare_record_end >= ? AND daycare_record_end <= ?) OR
                                                  (daycare_record_start <= ? AND daycare_record_end >= ?) )',
                                               [$month_date_start, $month_date_end,
                                                $month_date_start, $month_date_end,
                                                $month_date_start, $month_date_end])
                                    ->where('student_department', $db_department->department_id)
                                    ->get();
            foreach($db_daycare_records as $db_daycare_record){
                $temp = array();
                $temp['daycare_record_start'] = $db_daycare_record->daycare_record_start;
                $temp['daycare_record_end'] = $db_daycare_record->daycare_record_end;
                $temp['daycare_record_total_price'] = $db_daycare_record->daycare_record_total_price;
                $temp['daycare_record_month'] = $db_daycare_record->daycare_record_month;
                $temp['daycare_record_unit_price'] = round($db_daycare_record->daycare_record_total_price/$db_daycare_record->daycare_record_month/30, 2);
                // 计算使用天数
                // 计算统计天数
                $date_start=date('Y-m-d', strtotime($month_date_start));
                $date_end=date('Y-m-d', strtotime($month_date_end));
                $Date_List_start=explode("-",$date_start);
                $Date_List_end=explode("-",$date_end);
                $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                $temp['duration']=round(($d2-$d1)/3600/24)+1;
                // 计算开始后未使用天数
                if($month_date_start<$temp['daycare_record_start']){
                      $date_start=date('Y-m-d', strtotime($month_date_start));
                      $date_end=date('Y-m-d', strtotime($temp['daycare_record_start']));
                      $Date_List_start=explode("-",$date_start);
                      $Date_List_end=explode("-",$date_end);
                      $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                      $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                      $temp['duration']-=round(($d2-$d1)/3600/24);
                }
                if($month_date_end>$temp['daycare_record_end']){
                      $date_start=date('Y-m-d', strtotime($temp['daycare_record_end']));
                      $date_end=date('Y-m-d', strtotime($month_date_end));
                      $Date_List_start=explode("-",$date_start);
                      $Date_List_end=explode("-",$date_end);
                      $d1=mktime(0,0,0,$Date_List_start[1],$Date_List_start[2],$Date_List_start[0]);
                      $d2=mktime(0,0,0,$Date_List_end[1],$Date_List_end[2],$Date_List_end[0]);
                      $temp['duration']-=round(($d2-$d1)/3600/24);
                }
                $department_daycares[$db_department->department_id] += round($temp['duration']*$temp['daycare_record_unit_price'], 2);
            }
        }

        // 计算用户课时费等
        $users = array();
        foreach($db_users as $db_user){
            $temp = array();
            $temp['user_id'] = $db_user->user_id;
            $temp['user_name'] = $db_user->user_name;
            $temp['department_name'] = $db_user->department_name;
            $temp['teacher_type_name'] = $db_user->teacher_type_name;
            $temp['position_name'] = $db_user->position_name;
            $temp['user_salary_basic'] = $db_user->user_salary_basic;
            $temp['user_salary_housing'] = $db_user->user_salary_housing;
            $temp['user_salary_pension'] = $db_user->user_salary_pension;
            $temp['user_salary_medical'] = $db_user->user_salary_medical;
            $temp['user_salary_unemployment'] = $db_user->user_salary_unemployment;
            $temp['user_salary_provident'] = $db_user->user_salary_provident;
            $temp['user_salary_children'] = $db_user->user_salary_children;
            $temp['user_salary_elderly'] = $db_user->user_salary_elderly;
            $temp['user_salary_performance'] = $db_user->user_salary_performance;
            $temp['user_salary_commission'] = $db_user->user_salary_commission;
            $temp['user_salary_method'] = $db_user->user_salary_method;
            $temp['user_salary_basic'] = $db_user->user_salary_basic;
            $temp['department_consumption'] = $department_consumptions[$db_user->department_id];
            $temp['department_daycare'] = round($department_daycares[$db_user->department_id], 2);
            $temp['user_salary_commission_actual'] = round($db_user->user_salary_commission*($department_consumptions[$db_user->department_id]+$department_daycares[$db_user->department_id]))/100;
            // 计算课时费
            $temp['lesson_teacher_fee'] = 0;
            $temp_lessons = DB::table('lesson')
                              ->where('lesson_teacher', $db_user->user_id)
                              ->where('lesson_date', 'like', $salary_month."%")
                              ->get();
            foreach($temp_lessons as $temp_lesson){
                $temp['lesson_teacher_fee']+=$temp_lesson->lesson_teacher_fee;
            }
            // 计算绩效工资 （月考核分数*绩效工资）
            $temp['month_assessment'] = 0;
            if(DB::table('month_assessment')->where('month_assessment_user', $db_user->user_id)->where('month_assessment_month', 'like', $salary_month."%")->exists()){
                $temp_month_assessment = DB::table('month_assessment')
                                           ->where('month_assessment_user', $db_user->user_id)
                                           ->where('month_assessment_month', 'like', $salary_month."%")
                                           ->first();
								$a=$temp_month_assessment->month_assessment_1;
								$b=$temp_month_assessment->month_assessment_2;
								$c=$temp_month_assessment->month_assessment_3;
								if($a!=null&&$b!=null&&$c!=null){
                    if($a>$b){
                      $d=$a;
                      $a=$b;
                      $b=$d;
                    }
                    if($b>$c){
                      $d=$b;
                      $b=$c;
                      $c=$d;
                    }
                    if($a>$b){
                      $d=$a;
                      $a=$b;
                      $b=$d;
                    }
                    $temp['month_assessment']=$b;
								}
            }
            $temp['user_salary_performance_actual'] = round($db_user->user_salary_performance*$temp['month_assessment']/100, 2);
            $users[] = $temp;
        }
        return view('/company/salary/salaryCreate2', ['salary_month' => $salary_month, 'users' => $users]);
    }

    /**
     * 创建新课程提交数据库
     * URL: POST /company/course/store
     */
    public function salaryStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $salary_month = $request->input('salary_month');
        $salary_user_num = $request->input('salary_user_num');
        // 插入数据库
        DB::beginTransaction();
        try{
           // 删除已有工资单
           DB::table('salary')
             ->where('salary_month', $salary_month)
             ->delete();
           // 添加新工资单记录
           for($i=1;$i<=$salary_user_num;$i++){
               $salary_user = $request->input('salary_user_'.$i);
               $salary_basic = $request->input('salary_basic_'.$i);
               $salary_housing = $request->input('salary_housing_'.$i);
               $salary_lesson = $request->input('salary_lesson_'.$i);
               $salary_performance = $request->input('salary_performance_'.$i);
               $salary_commission = $request->input('salary_commission_'.$i);
               $salary_total = $salary_basic+$salary_housing+$salary_lesson+$salary_performance+$salary_commission;
               $salary_pension = $request->input('salary_pension_'.$i);
               $salary_medical = $request->input('salary_medical_'.$i);
               $salary_unemployment = $request->input('salary_unemployment_'.$i);
               $salary_provident = $request->input('salary_provident_'.$i);
               $salary_tax = $request->input('salary_tax_'.$i);
               $salary_penalty = $request->input('salary_penalty_'.$i);
               $salary_actual_total = $salary_total-$salary_pension-$salary_medical-$salary_unemployment-$salary_provident-$salary_tax-$salary_penalty;
               $salary_children = $request->input('salary_children_'.$i);
               $salary_elderly = $request->input('salary_elderly_'.$i);
               $salary_method = $request->input('salary_method_'.$i);
               DB::table('salary')->insert(
                    ['salary_user' => $salary_user,
                     'salary_month' => $salary_month,
                     'salary_basic' => $salary_basic,
                     'salary_housing' => $salary_housing,
                     'salary_lesson' => $salary_lesson,
                     'salary_performance' => $salary_performance,
                     'salary_commission' => $salary_commission,
                     'salary_total' => $salary_total,
                     'salary_pension' => $salary_pension,
                     'salary_medical' => $salary_medical,
                     'salary_unemployment' => $salary_unemployment,
                     'salary_provident' => $salary_provident,
                     'salary_children' => $salary_children,
                     'salary_elderly' => $salary_elderly,
                     'salary_penalty' => $salary_penalty,
                     'salary_tax' => $salary_tax,
                     'salary_actual_total' => $salary_actual_total,
                     'salary_method' => $salary_method,
                     'salary_create_user' => Session::get('user_id')]
               );
           }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/company/salary/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '工资结算失败',
                           'message' => '工资结算失败，错误码:104']);
        }
        DB::commit();
        // 返回课程列表
        return redirect("/company/salary")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '工资结算成功',
                       'message' => '工资结算成功']);
    }


}

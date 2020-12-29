<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class MeetingController extends Controller
{

    public function meeting(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/meeting", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $db_meetings = DB::table('meeting')
                   ->join('student', 'meeting.meeting_student', '=', 'student.student_id')
                   ->join('department', 'student.student_department', '=', 'department.department_id')
                   ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                   ->join('user', 'meeting.meeting_teacher', '=', 'user.user_id')
                   ->join('subject', 'meeting.meeting_subject', '=', 'subject.subject_id')
                   ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_meetings = $db_meetings->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_meetings = $db_meetings->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_meetings = $db_meetings->orderBy('meeting_date', 'desc')
                                   ->orderBy('student_department', 'asc')
                                   ->orderBy('student_grade', 'asc')
                                   ->orderBy('student_id', 'asc')
                                   ->get();
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/meeting/meeting', ['db_meetings' => $db_meetings,
                                                   'filters' => $filters,
                                                   'filter_departments' => $filter_departments,
                                                   'filter_grades' => $filter_grades]);
    }




    public function meetingCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/education/meeting/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取用户校区权限
        $department_access = Session::get('department_access');

        // 获取学生数据
        $db_students = DB::table('student')
                      ->join('department', 'student.student_department', '=', 'department.department_id')
                      ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                      ->where('student_is_available', 1)
                      ->whereIn('student_department', $department_access)
                      ->orderBy('student_department', 'asc')
                      ->orderBy('student_grade', 'asc')
                      ->orderBy('student_id', 'asc')
                      ->get();

        // 获取教师数据
        $db_users = DB::table('user')
                      ->join('department', 'user.user_department', '=', 'department.department_id')
                      ->where('user_is_available', 1)
                      ->whereIn('user_department', $department_access)
                      ->orderBy('user_department', 'asc')
                      ->orderBy('user_id', 'asc')
                      ->get();

        // 获取科目
        $db_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();

        // 返回列表视图
        return view('education/meeting/meetingCreate', ['db_students' => $db_students,
                                                        'db_users' => $db_users,
                                                        'db_subjects' => $db_subjects]);
    }

    public function meetingStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $meeting_student = $request->input('input_meeting_student');
        $meeting_teacher = $request->input('input_meeting_teacher');
        $meeting_subject = $request->input('input_meeting_subject');
        $meeting_date = $request->input('input_meeting_date');
        $meeting_comment = $request->input('input_meeting_comment');
        /*
         *  文件
         */
        // 获取文件
        $tmp_file = $request->file('file');
        // 获取文件扩展名
        $document_ext = $tmp_file->getClientOriginalExtension();
        // 生成路径
        $document_path = "M".date('ymdHis').rand(1000000000,9999999999).".".$document_ext;

        DB::beginTransaction();
        try{
            // 添加记录
            DB::table('meeting')->insert(['meeting_student' => $meeting_student,
                                          'meeting_teacher' => $meeting_teacher,
                                          'meeting_path' => $document_path,
                                          'meeting_subject' => $meeting_subject,
                                          'meeting_date' => $meeting_date,
                                          'meeting_comment' => $meeting_comment,
                                          'meeting_create_user' => Session::get('user_id')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回第一步
            return redirect("/education/meeting/create")
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '家长会记录添加失败',
                           'message' => '家长会记录添加失败']);
        }
        DB::commit();
        // 上传教案文件
        //$tmp_file->move("/files/document", $document_path);
        $tmp_file->move(public_path("/files/meeting"), $document_path);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/education/meeting")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '家长会记录添加成功',
                       'message' => '家长会记录添加成功']);
    }

    /**
     * 家长会删除
     * URL: DELETE/meeting/delete
     */
    public function meetingDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/education/meeting/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        $meeting_id = decode($request->input('id'), 'meeting_id');
        // 插入数据库
        DB::beginTransaction();
        try{
            // 删除记录
            DB::table('meeting')
              ->where('meeting_id', $meeting_id)
              ->delete();
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '删除记录失败',
                                 'message' => '删除记录失败，请联系系统管理员']);
        }
        DB::commit();
        // 返回列表
        return back()->with(['notify' => true,
                             'type' => 'success',
                             'title' => '删除记录成功',
                             'message' => '删除记录成功']);
    }
}

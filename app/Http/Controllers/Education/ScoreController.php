<?php
namespace App\Http\Controllers\Education;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class ScoreController extends Controller
{

    public function score(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/education/score", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取用户校区权限
        $department_access = Session::get('department_access');
        // 获取数据
        $db_scores = DB::table('score')
                       ->join('student', 'score.score_student', '=', 'student.student_id')
                       ->join('department', 'student.student_department', '=', 'department.department_id')
                       ->join('grade', 'student.student_grade', '=', 'grade.grade_id')
                       ->join('user', 'score.score_create_user', '=', 'user.user_id')
                       ->join('subject', 'score.score_subject', '=', 'subject.subject_id')
                       ->whereIn('student_department', $department_access);
        // 搜索条件
        $filters = array(
                        "filter_department" => null,
                        "filter_grade" => null
                    );
        // 校区
        if ($request->filled('filter_department')) {
            $db_scores = $db_scores->where('student_department', '=', $request->input("filter_department"));
            $filters['filter_department']=$request->input("filter_department");
        }
        // 年级
        if ($request->filled('filter_grade')) {
            $db_scores = $db_scores->where('student_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        $db_scores = $db_scores->orderBy('score_test_date', 'desc')
                               ->orderBy('student_department', 'asc')
                               ->orderBy('student_grade', 'asc')
                               ->orderBy('student_id', 'asc')
                               ->get();
        // 获取校区、年级信息(筛选)
        $filter_departments = DB::table('department')->where('department_is_available', 1)->whereIn('department_id', $department_access)->orderBy('department_id', 'asc')->get();
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        // 返回列表视图
        return view('education/score/score', ['db_scores' => $db_scores,
                                                  'filters' => $filters,
                                                  'filter_departments' => $filter_departments,
                                                  'filter_grades' => $filter_grades]);
    }

    public function scoreCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/education/score/create", Session::get('user_accesses'))){
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

        // 获取科目
        $db_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();

        // 返回列表视图
        return view('education/score/scoreCreate', ['db_students' => $db_students,
                                                    'db_subjects' => $db_subjects]);
    }

    public function scoreStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $score_student = $request->input('input_score_student');
        $score_test_name = $request->input('input_score_test_name');
        $score_test_type = "考试成绩";
        $score_test_date = $request->input('input_score_test_date');
        $test_num = $request->input('test_num');

        for($i=1;$i<=$test_num;$i++){
            /*
             *  文件
             */
            if (!$request->hasFile('file_'.$i)) {
                $document_path = "";
            }else{
                // 获取文件
                $tmp_file = $request->file('file_'.$i);
                // 获取文件扩展名
                $document_ext = $tmp_file->getClientOriginalExtension();
                // 生成路径
                $document_path = "S".date('ymdHis').rand(1000000000,9999999999).".".$document_ext;
            }
            $score_subject = $request->input('input_score_subject_'.$i);
            $score_mark = $request->input('input_score_mark_'.$i);

            DB::beginTransaction();
            try{
                // 添加记录
                DB::table('score')->insert(['score_student' => $score_student,
                                            'score_subject' => $score_subject,
                                            'score_test_name' => $score_test_name,
                                            'score_test_type' => $score_test_type,
                                            'score_test_date' => $score_test_date,
                                            'score_mark' => $score_mark,
                                            'score_path' => $document_path,
                                            'score_create_user' => Session::get('user_id')]);
            }
            // 捕获异常
            catch(Exception $e){
                DB::rollBack();
                // 返回第一步
                return redirect("/education/score/create")
                       ->with(['notify' => true,
                               'type' => 'danger',
                               'title' => '成绩档案添加失败',
                               'message' => '成绩档案添加失败']);
            }
            DB::commit();
            // 上传教案文件
            //$tmp_file->move("/files/document", $document_path);
            if($document_path != ""){
                $tmp_file->move(public_path("/files/score"), $document_path);
            }
        }
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/education/score")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '成绩档案添加成功',
                       'message' => '成绩档案添加成功']);
    }

    /**
     * 家长会删除
     * URL: DELETE/meeting/delete
     */
    public function scoreDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/education/score/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        $score_id = decode($request->input('id'), 'score_id');
        // 插入数据库
        DB::beginTransaction();
        try{
            // 删除记录
            DB::table('score')
              ->where('score_id', $score_id)
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

    public function scoreLessonCreate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        $lesson_id = decode($request->input('id'), 'lesson_id');

        // 获取课程数据
        $db_lesson = DB::table('lesson')
                        ->join('class', 'lesson.lesson_class', '=', 'class.class_id')
                        ->join('grade', 'class.class_grade', '=', 'grade.grade_id')
                        ->join('subject', 'class.class_subject', '=', 'subject.subject_id')
                        ->where('lesson_id', $lesson_id)
                        ->first();

        $db_participants = DB::table('lesson')
                              ->join('participant', 'participant.participant_lesson', '=', 'lesson.lesson_id')
                              ->join('student', 'participant.participant_student', '=', 'student.student_id')
                              ->where('lesson_id', $lesson_id)
                              ->get();

        // 返回列表视图
        return view('education/score/scoreLessonCreate', ['db_lesson' => $db_lesson,'db_participants' => $db_participants]);
    }

    public function scoreLessonStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取表单输入
        $input_student_num = $request->input('input_student_num');
        $score_subject = $request->input('input_score_subject');
        $score_test_name = $request->input('input_score_test_name');
        $score_test_type = "入门测";
        $score_test_date = $request->input('input_score_test_date');


        DB::beginTransaction();

        for($i=1;$i<=$input_student_num;$i++){
            /*
             *  文件
             */
            if (!$request->hasFile('file_'.$i)) {
                $document_path = "";
            }else{
                // 获取文件
                $tmp_file = $request->file('file_'.$i);
                // 获取文件扩展名
                $document_ext = $tmp_file->getClientOriginalExtension();
                // 生成路径
                $document_path = "S".date('ymdHis').rand(1000000000,9999999999).".".$document_ext;
            }
            try{
                // 添加记录
                DB::table('score')
                  ->insert(['score_student' => $request->input('input_student_id_'.$i),
                            'score_subject' => $score_subject,
                            'score_test_name' => $score_test_name,
                            'score_test_type' => $score_test_type,
                            'score_test_date' => $score_test_date,
                            'score_mark' => $request->input('input_score_mark_'.$i),
                            'score_path' => $document_path,
                            'score_create_user' => Session::get('user_id')]);
                // 更新上课记录
                DB::table('participant')
                  ->where('participant_id', $request->input('input_participant_id_'.$i))
                  ->update(['participant_test_mark' => $request->input('input_score_mark_'.$i),
                            'participant_test_path' => $document_path]);

                if($document_path != ""){
                    $tmp_file->move(public_path("/files/score"), $document_path);
                }
            }
            // 捕获异常
            catch(Exception $e){
                DB::rollBack();
                return $e;
                // 返回第一步
                return back()
                       ->with(['notify' => true,
                               'type' => 'danger',
                               'title' => '成绩档案添加失败',
                               'message' => '成绩档案添加失败']);
            }
        }

        DB::commit();
        // 上传教案文件
        //$tmp_file->move("/files/document", $document_path);
        //if($document_path != ""){
        //    $tmp_file->move(public_path("/files/score"), $document_path);
        //}
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/profile")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '成绩档案添加成功',
                       'message' => '成绩档案添加成功']);
    }
}

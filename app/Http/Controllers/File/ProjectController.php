<?php
namespace App\Http\Controllers\File;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class projectController extends Controller
{

    /**
     * 教案中心视图
     * URL: GET /education/document
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     * @param  $request->input('filter1'): 用户姓名
     * @param  $request->input('filter2'): 用户校区
     * @param  $request->input('filter3'): 档案名称
     */
    public function project(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/file/project", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取数据project
        $rows = DB::table('project')
                  ->join('subject', 'project.project_subject', '=', 'subject.subject_id')
                  ->join('grade', 'project.project_grade', '=', 'grade.grade_id');

        // 搜索条件
        $filters = array(
                        "filter_name" => null,
                        "filter_grade" => null,
                        "filter_subject" => null,
                        "filter_semester" => null,
                    );
        // 教案年级
        if ($request->filled('filter_grade')) {
            $rows = $rows->where('project_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 教案科目
        if ($request->filled('filter_subject')) {
            $rows = $rows->where('project_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        // 教案学期
        if ($request->filled('filter_semester')) {
            $rows = $rows->where('project_semester', '=', $request->input('filter_semester'));
            $filters['filter_semester']=$request->input("filter_semester");
        }
        // 排序并获取数据对象
        $rows = $rows->orderBy('project_subject', 'asc')
                     ->orderBy('project_grade', 'asc')
                     ->orderBy('project_semester', 'asc')
                     ->orderBy('project_id', 'asc')
                     ->limit(200)
                     ->get();

        // 获取校区信息(筛选)
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();

        // 返回列表视图
        return view('file/project/project', ['rows' => $rows,
                                                'request' => $request,
                                                'filters' => $filters,
                                                'filter_subjects' => $filter_subjects,
                                                'filter_grades' => $filter_grades]);
    }

    /**
     * 下载档案文件
     * URL: GET /education/document/{document_id}
     * @param  int  $document_id
     */
    public function projectDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取教案id
        $project_id = decode($request->input('id'), 'project_id');
        // 获取教案数据信息
        $project = DB::table('project')->where('project_id', $project_id)->first();
        // 获取文件名和路径
        $file_path = "files/project/".$project->project_document;
        $arr = explode('.', $file_path);
        $ext = end($arr);
        $file_name = $project->project_name."-教案".".".$ext;
        // 下载文件
        if (file_exists($file_path)) {// 文件存在
            // 返回文件
            return response()->download($file_path, $file_name ,$headers = ['Content-Type'=>'application/zip;charset=utf-8']);
        }else{ // 文件不存在
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '档案下载失败',
                                 'message' => '档案文件已删除，错误码:403']);
        }
    }

    public function projectAnswerDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取教案id
        $project_id = decode($request->input('id'), 'project_id');
        // 获取教案数据信息
        $project = DB::table('project')->where('project_id', $project_id)->first();
        // 获取文件名和路径
        $file_path = "files/project/".$project->project_answer;
        $arr = explode('.', $file_path);
        $ext = end($arr);
        $file_name = $project->project_name."-答案".".".$ext;
        // 下载文件
        if (file_exists($file_path)) {// 文件存在
            // 返回文件
            return response()->download($file_path, $file_name ,$headers = ['Content-Type'=>'application/zip;charset=utf-8']);
        }else{ // 文件不存在
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '档案下载失败',
                                 'message' => '档案文件已删除，错误码:403']);
        }
    }

    public function projectCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/project/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取信息
        $subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('file/project/projectCreate', ['subjects' => $subjects, 'grades' => $grades]);
    }

    public function projectStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        /*
         *  文件
         */
        // 获取文件
        if (!$request->hasFile('file1')) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传文件',
                           'message' => '没有上传文件，文件上传失败，错误码:401']);
        }
        $tmp_file1 = $request->file('file1');
        if (!$tmp_file1->isValid()) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法文件格式，文件上传失败，错误码:401']);
        }
        if (!$request->hasFile('file2')) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传文件',
                           'message' => '没有上传文件，文件上传失败，错误码:401']);
        }
        $tmp_file2 = $request->file('file2');
        if (!$tmp_file2->isValid()) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法文件格式，文件上传失败，错误码:401']);
        }
        // 获取文件扩展名
        $document_ext1 = $tmp_file1->getClientOriginalExtension();
        $document_ext2 = $tmp_file2->getClientOriginalExtension();
        // 生成路径
        $document_path1 = "ST".date('ymdHis').rand(1000000000,9999999999).".".$document_ext1;
        $document_path2 = "STA".date('ymdHis').rand(1000000000,9999999999).".".$document_ext2;

        // 获取表单输入
        $project_name = $request->input('input_project_name');
        $project_subject = $request->input('input_project_subject');
        $project_grade = $request->input('input_project_grade');
        $project_semester = $request->input('input_project_semester');
        DB::beginTransaction();
        try{
            // 添加记录
            DB::table('project')->insert(['project_name' => $project_name,
                                                    'project_subject' => $project_subject,
                                                    'project_grade' => $project_grade,
                                                    'project_semester' => $project_semester,
                                                    'project_document' => $document_path1,
                                                    'project_answer' => $document_path2,
                                                    'project_create_user' => Session::get('user_id')]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回第一步
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '文件上传失败',
                           'message' => '文件上传失败']);
        }
        DB::commit();
        // 上传教案文件
        //$tmp_file->move("/files/document", $document_path);
        $tmp_file1->move(public_path("/files/project"), $document_path1);
        $tmp_file2->move(public_path("/files/project"), $document_path2);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/file/project")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '试卷文件添加成功',
                       'message' => '试卷文件添加成功']);
    }


    public function projectEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/project/edit", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取试卷id
        $project_id = decode($request->input('id'), 'project_id');
        // 获取试卷数据信息
        $project = DB::table('project')
                    ->join('subject', 'project.project_subject', '=', 'subject.subject_id')
                    ->join('grade', 'project.project_grade', '=', 'grade.grade_id')
                    ->where('project_id', $project_id)
                    ->first();
        return view('file/project/projectEdit', ['project' => $project]);
    }

    public function projectUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        /*
         *  文件
         */
        // 获取文件
        if (!$request->hasFile('file1')) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传文件',
                           'message' => '没有上传文件，文件上传失败，错误码:401']);
        }
        $tmp_file1 = $request->file('file1');
        if (!$tmp_file1->isValid()) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法文件格式，文件上传失败，错误码:401']);
        }
        if (!$request->hasFile('file2')) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传文件',
                           'message' => '没有上传文件，文件上传失败，错误码:401']);
        }
        $tmp_file2 = $request->file('file2');
        if (!$tmp_file2->isValid()) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法文件格式，文件上传失败，错误码:401']);
        }
        // 获取文件扩展名
        $document_ext1 = $tmp_file1->getClientOriginalExtension();
        $document_ext2 = $tmp_file2->getClientOriginalExtension();
        // 生成路径
        $document_path1 = "ST".date('ymdHis').rand(1000000000,9999999999).".".$document_ext1;
        $document_path2 = "STA".date('ymdHis').rand(1000000000,9999999999).".".$document_ext2;

        // 获取试卷id
        $project_id = $request->input('input_project_id');
        // 获取试卷数据信息
        $project = DB::table('project')
                    ->join('subject', 'project.project_subject', '=', 'subject.subject_id')
                    ->join('grade', 'project.project_grade', '=', 'grade.grade_id')
                    ->where('project_id', $project_id)
                    ->first();

        DB::beginTransaction();
        try{
            // 删除教案文件
            if (file_exists("files/project/".$project->project_document)) {
                unlink("files/project/".$project->project_document);
            }
            if (file_exists("files/project/".$project->project_answer)) {
                unlink("files/project/".$project->project_answer);
            }
            // 修改记录
            DB::table('project')
              ->where('project_id', $project_id)
              ->update(['project_document' => $document_path1,
                        'project_answer' => $document_path2]);
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回第一步
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '文件上传失败',
                           'message' => '文件上传失败']);
        }
        DB::commit();
        // 上传教案文件
        //$tmp_file->move("/files/document", $document_path);
        $tmp_file1->move(public_path("/files/project"), $document_path1);
        $tmp_file2->move(public_path("/files/project"), $document_path2);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/file/project")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '教案文件修改成功',
                       'message' => '教案文件修改成功']);
    }


    public function projectDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/project/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取试卷id
        $project_id = decode($request->input('id'), 'project_id');
        // 获取试卷数据信息
        $project = DB::table('project')
                                ->where('project_id', $project_id)
                                ->first();
        DB::beginTransaction();
        try{
            // 删除教案文件
            if (file_exists("files/project/".$project->project_document)) {
                unlink("files/project/".$project->project_document);
            }
            if (file_exists("files/project/".$project->project_answer)) {
                unlink("files/project/".$project->project_answer);
            }
            // 修改记录
            DB::table('project')
              ->where('project_id', $project_id)
              ->delete();
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            // 返回第一步
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '文件删除失败',
                           'message' => '文件删除失败']);
        }
        DB::commit();
        // 返回第一步
        return back()
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '文件删除成功',
                       'message' => '文件删除成功']);
    }
}

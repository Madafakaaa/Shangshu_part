<?php
namespace App\Http\Controllers\File;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class paperController extends Controller
{

    /**
     * 试卷中心视图
     * URL: GET /education/document
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     * @param  $request->input('filter1'): 用户姓名
     * @param  $request->input('filter2'): 用户校区
     * @param  $request->input('filter3'): 档案名称
     */
    public function paper(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/file/paper", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取数据paper
        $rows = DB::table('paper')
                  ->join('subject', 'paper.paper_subject', '=', 'subject.subject_id')
                  ->join('grade', 'paper.paper_grade', '=', 'grade.grade_id');

        // 搜索条件
        $filters = array(
                        "filter_name" => null,
                        "filter_grade" => null,
                        "filter_subject" => null,
                        "filter_semester" => null,
                    );
        // 试卷年级
        if ($request->filled('filter_grade')) {
            $rows = $rows->where('paper_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 试卷科目
        if ($request->filled('filter_subject')) {
            $rows = $rows->where('paper_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        // 试卷学期
        if ($request->filled('filter_semester')) {
            $rows = $rows->where('paper_semester', '=', $request->input('filter_semester'));
            $filters['filter_semester']=$request->input("filter_semester");
        }
        // 排序并获取数据对象
        $rows = $rows->orderBy('paper_subject', 'asc')
                     ->orderBy('paper_grade', 'asc')
                     ->orderBy('paper_semester', 'asc')
                     ->orderBy('paper_id', 'asc')
                     ->limit(200)
                     ->get();

        // 获取校区信息(筛选)
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();

        // 返回列表视图
        return view('file/paper/paper', ['rows' => $rows,
                                          'request' => $request,
                                          'filters' => $filters,
                                          'filter_subjects' => $filter_subjects,
                                          'filter_grades' => $filter_grades]);
    }

    /**
     * 下载档案文件
     * URL: GET /education/paper
     * @param  int  $paper_id
     */
    public function paperDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取试卷id
        $paper_id = decode($request->input('id'), 'paper_id');
        // 获取试卷数据信息
        $paper = DB::table('paper')->where('paper_id', $paper_id)->first();
        // 获取文件名和路径
        $file_path = "files/".$paper->paper_document;
        $arr = explode('.', $file_path);
        $ext = end($arr);
        $file_name = $paper->paper_name.".".$ext;
        // 下载文件
        if (file_exists($file_path)) {// 文件存在
            // 返回文件
            return response()->download($file_path, $file_name ,$headers = ['Content-Type'=>'application/zip;charset=utf-8']);
        }else{ // 文件不存在
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '试卷下载失败',
                                 'message' => '试卷文件已删除，错误码:403']);
        }
    }

    public function paperCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/paper/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取信息
        $subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('file/paper/paperCreate', ['subjects' => $subjects, 'grades' => $grades]);
    }

    public function paperStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        /*
         *  文件
         */
        // 获取文件
        if (!$request->hasFile('file')) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传文件',
                           'message' => '没有上传文件，文件上传失败，错误码:401']);
        }
        $tmp_file = $request->file('file');
        if (!$tmp_file->isValid()) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法文件格式，文件上传失败，错误码:401']);
        }
        // 获取文件扩展名
        $document_ext = $tmp_file->getClientOriginalExtension();
        // 生成路径
        $document_path = "P".date('ymdHis').rand(1000000000,9999999999).".".$document_ext;

        // 获取表单输入
        $paper_name = $request->input('input_paper_name');
        $paper_subject = $request->input('input_paper_subject');
        $paper_grade = $request->input('input_paper_grade');
        $paper_semester = $request->input('input_paper_semester');
        DB::beginTransaction();
        try{
            // 添加记录
            DB::table('paper')->insert(['paper_name' => $paper_name,
                                        'paper_subject' => $paper_subject,
                                        'paper_grade' => $paper_grade,
                                        'paper_semester' => $paper_semester,
                                        'paper_document' => "paper/".$document_path,
                                        'paper_create_user' => Session::get('user_id')]);
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
        $tmp_file->move(public_path("/files/paper"), $document_path);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/file/paper")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '试卷文件添加成功',
                       'message' => '试卷文件添加成功']);
    }


    public function paperEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/paper/edit", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取试卷id
        $paper_id = decode($request->input('id'), 'paper_id');
        // 获取试卷数据信息
        $paper = DB::table('paper')
                    ->join('subject', 'paper.paper_subject', '=', 'subject.subject_id')
                    ->join('grade', 'paper.paper_grade', '=', 'grade.grade_id')
                    ->where('paper_id', $paper_id)
                    ->first();
        return view('file/paper/paperEdit', ['paper' => $paper]);
    }

    public function paperUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        /*
         *  文件
         */
        // 获取文件
        if (!$request->hasFile('file')) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '没有上传文件',
                           'message' => '没有上传文件，文件上传失败，错误码:401']);
        }
        $tmp_file = $request->file('file');
        if (!$tmp_file->isValid()) {
            return back()
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '非法文件',
                           'message' => '非法文件格式，文件上传失败，错误码:401']);
        }

        // 获取试卷id
        $paper_id = $request->input('input_paper_id');
        // 获取试卷数据信息
        $paper = DB::table('paper')
                    ->join('subject', 'paper.paper_subject', '=', 'subject.subject_id')
                    ->join('grade', 'paper.paper_grade', '=', 'grade.grade_id')
                    ->where('paper_id', $paper_id)
                    ->first();
        // 获取文件扩展名
        $document_ext = $tmp_file->getClientOriginalExtension();
        // 生成路径
        $document_path = "P".date('ymdHis').rand(1000000000,9999999999).".".$document_ext;
        DB::beginTransaction();
        try{
            // 删除教案文件
            if (file_exists("files/".$paper->paper_document)) {
                unlink("files/".$paper->paper_document);
            }
            // 修改记录
            DB::table('paper')
              ->where('paper_id', $paper_id)
              ->update(['paper_document' => "paper/".$document_path]);
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
        $tmp_file->move(public_path("/files/paper"), $document_path);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/file/paper")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '试卷文件修改成功',
                       'message' => '试卷文件修改成功']);
    }

    public function paperDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/paper/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取试卷id
        $paper_id = decode($request->input('id'), 'paper_id');
        // 获取试卷数据信息
        $paper = DB::table('paper')
                    ->join('subject', 'paper.paper_subject', '=', 'subject.subject_id')
                    ->join('grade', 'paper.paper_grade', '=', 'grade.grade_id')
                    ->where('paper_id', $paper_id)
                    ->first();
        DB::beginTransaction();
        try{
            // 删除教案文件
            if (file_exists("files/".$paper->paper_document)) {
                unlink("files/".$paper->paper_document);
            }
            // 修改记录
            DB::table('paper')
              ->where('paper_id', $paper_id)
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

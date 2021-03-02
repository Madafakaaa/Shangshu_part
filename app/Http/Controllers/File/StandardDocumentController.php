<?php
namespace App\Http\Controllers\File;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class standardDocumentController extends Controller
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
    public function standardDocument(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 检测用户权限
        if(!in_array("/file/standardDocument", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }

        // 获取数据standard_document
        $rows = DB::table('standard_document')
                  ->join('subject', 'standard_document.standard_document_subject', '=', 'subject.subject_id')
                  ->join('grade', 'standard_document.standard_document_grade', '=', 'grade.grade_id');

        // 搜索条件
        $filters = array(
                        "filter_name" => null,
                        "filter_grade" => null,
                        "filter_subject" => null,
                        "filter_semester" => null,
                    );
        // 教案年级
        if ($request->filled('filter_grade')) {
            $rows = $rows->where('standard_document_grade', '=', $request->input('filter_grade'));
            $filters['filter_grade']=$request->input("filter_grade");
        }
        // 教案科目
        if ($request->filled('filter_subject')) {
            $rows = $rows->where('standard_document_subject', '=', $request->input('filter_subject'));
            $filters['filter_subject']=$request->input("filter_subject");
        }
        // 教案学期
        if ($request->filled('filter_semester')) {
            $rows = $rows->where('standard_document_semester', '=', $request->input('filter_semester'));
            $filters['filter_semester']=$request->input("filter_semester");
        }
        // 排序并获取数据对象
        $rows = $rows->orderBy('standard_document_subject', 'asc')
                     ->orderBy('standard_document_grade', 'asc')
                     ->orderBy('standard_document_semester', 'asc')
                     ->orderBy('standard_document_id', 'asc')
                     ->limit(200)
                     ->get();

        // 获取校区信息(筛选)
        $filter_grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        $filter_subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();

        // 返回列表视图
        return view('file/standardDocument/standardDocument', ['rows' => $rows,
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
    public function standardDocumentDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取教案id
        $standard_document_id = decode($request->input('id'), 'standard_document_id');
        // 获取教案数据信息
        $standard_document = DB::table('standard_document')->where('standard_document_id', $standard_document_id)->first();
        // 获取文件名和路径
        $file_path = "files/standardDocument/".$standard_document->standard_document_document;
        $arr = explode('.', $file_path);
        $ext = end($arr);
        $file_name = $standard_document->standard_document_name."-教案".".".$ext;
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

    public function standardDocumentAnswerDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取教案id
        $standard_document_id = decode($request->input('id'), 'standard_document_id');
        // 获取教案数据信息
        $standard_document = DB::table('standard_document')->where('standard_document_id', $standard_document_id)->first();
        // 获取文件名和路径
        $file_path = "files/standardDocument/".$standard_document->standard_document_answer;
        $arr = explode('.', $file_path);
        $ext = end($arr);
        $file_name = $standard_document->standard_document_name."-答案".".".$ext;
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

    public function standardDocumentCreate(){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/standardDocument/create", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取信息
        $subjects = DB::table('subject')->orderBy('subject_id', 'asc')->get();
        $grades = DB::table('grade')->orderBy('grade_id', 'asc')->get();
        return view('file/standardDocument/standardDocumentCreate', ['subjects' => $subjects, 'grades' => $grades]);
    }

    public function standardDocumentStore(Request $request){
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
        $standard_document_name = str_replace(strrchr($tmp_file1->getClientOriginalName(), "."),"",$tmp_file1->getClientOriginalName());
        $standard_document_subject = $request->input('input_standard_document_subject');
        $standard_document_grade = $request->input('input_standard_document_grade');
        $standard_document_semester = $request->input('input_standard_document_semester');
        DB::beginTransaction();
        try{
            // 添加记录
            DB::table('standard_document')->insert(['standard_document_name' => $standard_document_name,
                                                    'standard_document_subject' => $standard_document_subject,
                                                    'standard_document_grade' => $standard_document_grade,
                                                    'standard_document_semester' => $standard_document_semester,
                                                    'standard_document_document' => $document_path1,
                                                    'standard_document_answer' => $document_path2,
                                                    'standard_document_create_user' => Session::get('user_id')]);
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
        $tmp_file1->move(public_path("/files/standardDocument"), $document_path1);
        $tmp_file2->move(public_path("/files/standardDocument"), $document_path2);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/file/standardDocument")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '试卷文件添加成功',
                       'message' => '试卷文件添加成功']);
    }


    public function standardDocumentEdit(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/standardDocument/edit", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取试卷id
        $standard_document_id = decode($request->input('id'), 'standard_document_id');
        // 获取试卷数据信息
        $standard_document = DB::table('standard_document')
                    ->join('subject', 'standard_document.standard_document_subject', '=', 'subject.subject_id')
                    ->join('grade', 'standard_document.standard_document_grade', '=', 'grade.grade_id')
                    ->where('standard_document_id', $standard_document_id)
                    ->first();
        return view('file/standardDocument/standardDocumentEdit', ['standard_document' => $standard_document]);
    }

    public function standardDocumentUpdate(Request $request){
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
        $standard_document_id = $request->input('input_standard_document_id');
        // 获取试卷数据信息
        $standard_document = DB::table('standard_document')
                    ->join('subject', 'standard_document.standard_document_subject', '=', 'subject.subject_id')
                    ->join('grade', 'standard_document.standard_document_grade', '=', 'grade.grade_id')
                    ->where('standard_document_id', $standard_document_id)
                    ->first();

        DB::beginTransaction();
        try{
            // 删除教案文件
            if (file_exists("files/standardDocument/".$standard_document->standard_document_document)) {
                unlink("files/standardDocument/".$standard_document->standard_document_document);
            }
            if (file_exists("files/standardDocument/".$standard_document->standard_document_answer)) {
                unlink("files/standardDocument/".$standard_document->standard_document_answer);
            }
            // 修改记录
            DB::table('standard_document')
              ->where('standard_document_id', $standard_document_id)
              ->update(['standard_document_document' => $document_path1,
                        'standard_document_answer' => $document_path2]);
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
        $tmp_file1->move(public_path("/files/standardDocument"), $document_path1);
        $tmp_file2->move(public_path("/files/standardDocument"), $document_path2);
        //$tmp_file->storeAs('document', $document_path);
        // 返回我的上课记录视图
        return redirect("/file/standardDocument")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '教案文件修改成功',
                       'message' => '教案文件修改成功']);
    }


    public function standardDocumentDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 检测用户权限
        if(!in_array("/file/standardDocument/delete", Session::get('user_accesses'))){
           return back()->with(['notify' => true,'type' => 'danger','title' => '您的账户没有访问权限']);
        }
        // 获取试卷id
        $standard_document_id = decode($request->input('id'), 'standard_document_id');
        // 获取试卷数据信息
        $standard_document = DB::table('standard_document')
                                ->where('standard_document_id', $standard_document_id)
                                ->first();
        DB::beginTransaction();
        try{
            // 删除教案文件
            if (file_exists("files/standardDocument/".$standard_document->standard_document_document)) {
                unlink("files/standardDocument/".$standard_document->standard_document_document);
            }
            if (file_exists("files/standardDocument/".$standard_document->standard_document_answer)) {
                unlink("files/standardDocument/".$standard_document->standard_document_answer);
            }
            // 修改记录
            DB::table('standard_document')
              ->where('standard_document_id', $standard_document_id)
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

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
                     ->limit(500)
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
    public function documentDownload(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取教案id
        $document_id = decode($request->input('id'), 'document_id');
        // 获取教案数据信息
        $document = DB::table('document')->where('document_id', $document_id)->first();
        // 获取文件名和路径
        $file_path = "files/document/".$document->document_path;
        $file_name = $document->document_name;
        // 下载文件
        if (file_exists($file_path)) {// 文件存在
            // 更新文件下载次数
            DB::table('document')->where('document_id', $document_id)->increment('document_downloaded_num', 1);
            // 返回文件
            return response()->download($file_path, $file_name ,$headers = ['Content-Type'=>'application/zip;charset=utf-8']);
        }else{ // 文件不存在
            return back()->with(['notify' => true,
                                 'type' => 'danger',
                                 'title' => '档案下载失败',
                                 'message' => '档案文件已删除，错误码:403']);
        }
    }

}

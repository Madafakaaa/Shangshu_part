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
        $file_path = "files/paper/".$paper->paper_path;
        $file_name = $paper->paper_name;
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

}

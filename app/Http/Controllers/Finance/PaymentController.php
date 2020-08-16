<?php
namespace App\Http\Controllers\Finance;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Exception;

class PaymentController extends Controller
{

    /**
     * 显示所有用户记录
     * URL: GET /company/payment
     * @param  Request  $request
     * @param  $request->input('page'): 页数
     * @param  $request->input('filter1'): 用户姓名
     * @param  $request->input('filter2'): 用户校区
     * @param  $request->input('filter3'): 用户岗位
     * @param  $request->input('filter4'): 用户等级
     */
    public function payment(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }

        // 获取数据
        $payments = DB::table('payment')
                      ->join('department', 'payment.payment_department', '=', 'department.department_id')
                      ->join('student', 'payment.payment_student', '=', 'student.student_id')
                      ->join('course', 'payment.payment_course', '=', 'course.course_id')
                      ->join('user', 'payment.payment_create_user', '=', 'user.user_id')
                      ->orderBy('payment_date', 'desc')
                      ->get();

        // 筛选条件
        $filter_departments = DB::table('department')
                                ->where('department_is_available', 1)
                                ->orderBy('department_id', 'asc')
                                ->get();

        // 返回列表视图
        return view('finance/payment/payment', ['payments' => $payments, 'filter_departments' => $filter_departments]);
    }


    /**
     * 创建新用户提交数据库
     * URL: POST /company/payment/create
     * @param  Request  $request
     * @param  $request->input('input1'): 用户姓名
     * @param  $request->input('input2'): 用户性别
     * @param  $request->input('input3'): 用户校区
     * @param  $request->input('input4'): 用户岗位
     * @param  $request->input('input5'): 入职日期
     * @param  $request->input('input6'): 是否可以跨校区上课
     * @param  $request->input('input7'): 用户手机
     * @param  $request->input('input8'): 用户微信
     */
    public function paymentStore(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 随机生成新用户ID
        $payment_id=chr(rand(97,122)).chr(rand(97,122)).chr(rand(97,122)).chr(rand(97,122)).substr(date('Ym'),2);
        // 获取表单输入
        $payment_name = $request->input('input_payment_name');
        $payment_gender = $request->input('input_payment_gender');
        $payment_department = $request->input('input_payment_department');
        $payment_birthday = $request->input('input_payment_birthday');
        // 插入数据库
        try{
            DB::table('payment')->insert(
                ['payment_id' => $payment_id,
                 'payment_name' => $payment_name,
                 'payment_gender' => $payment_gender,
                 'payment_department' => $payment_department,
                 'payment_birthday' => $payment_birthday,
                 'payment_create_payment' => Session::get('payment_id'),
                 'payment_modified_payment' => Session::get('payment_id')]
            );
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/payment/create")
                     ->with(['notify' => true,
                             'type' => 'danger',
                             'title' => '用户添加失败',
                             'message' => '用户添加失败，错误码:113']);
        }
        // 返回用户列表
        return redirect("/company/payment")
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户添加成功',
                       'message' => '用户添加成功']);
    }

    /**
     * 删除用户
     * URL: DELETE /company/payment/{id}
     * @param  int  $payment_id
     */
    public function paymentDelete(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取payment_id
        $payment_id = decode($request->input('id'), 'payment_id');
        // 删除数据
        try{
            DB::table('payment')
              ->where('payment_id', $payment_id)
              ->update(['payment_is_available' => 0,
                        'payment_modified_payment' => Session::get('payment_id'),
                        'payment_modified_time' => date('Y-m-d H:i:s')]);
        }
        // 捕获异常
        catch(Exception $e){
            return redirect("/company/payment")
                   ->with(['notify' => true,
                         'type' => 'danger',
                         'title' => '用户删除失败',
                         'message' => '用户删除失败，错误码:116']);
        }
        // 返回用户列表
        return redirect("/company/payment")
                 ->with(['notify' => true,
                         'type' => 'success',
                         'title' => '用户删除成功',
                         'message' => '用户删除成功']);
    }

    /**
     * 用户权限视图
     * URL: GET /company/payment/access/{payment_id}
     * @param  int  $payment_id
     */
    public function paymentAccess(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取payment_id
        $payment_id = decode($request->input('id'), 'payment_id');
        // 获取全部校区
        $payment = DB::table('payment')
                  ->join('department', 'payment.payment_department', '=', 'department.department_id')
                  ->join('position', 'payment.payment_position', '=', 'position.position_id')
                  ->join('section', 'position.position_section', '=', 'section.section_id')
                  ->where('payment_id', $payment_id)
                  ->first();
        // 获取全部校区
        $departments = DB::table('department')
                          ->where('department_status', 1)
                          ->orderBy('department_id', 'asc')
                          ->get();
        $department_array = array();
        foreach($departments AS $department){
            $department_array[$department->department_id] = array($department->department_id, $department->department_name, 0);
        }
        // 获取用户校区权限
        $payment_departments = DB::table('payment_department')
                              ->where('payment_department_payment', $payment_id)
                              ->get();
        foreach($payment_departments AS $payment_department){
            $department_array[$payment_department->payment_department_department][2]=1;
        }
        // 获取全部页面种类及其页面
        $page_categories = $payments = DB::table('page')->select('page_category')->distinct()->get();
        $categories = array();
        $pages = array();
        foreach($page_categories AS $page_category){
            $temp = array($page_category->page_category);
            $page_array = array();
            $temp_pages = DB::table('page')->where('page_category', $page_category->page_category)->get();
            foreach($temp_pages AS $temp_page){
                $page_array[$temp_page->page_id] = array($temp_page->page_id, $temp_page->page_name);
                $pages[$temp_page->page_id] = array($temp_page->page_id, $temp_page->page_name, 0);
            }
            $temp[] = $page_array;
            $categories[] = $temp;
        }
        // 获取用户页面权限
        $payment_pages = DB::table('payment_page')
                        ->where('payment_page_payment', $payment_id)
                        ->get();
        foreach($payment_pages AS $payment_page){
            $pages[$payment_page->payment_page_page][2] = 1;
        }
        return view('company/payment/paymentAccess', ['payment' => $payment,
                                            'department_array' => $department_array,
                                            'categories' => $categories,
                                            'pages' => $pages]);
    }

    /**
     * 修改用户权限提交
     * URL: POST /payment/access/{payment_id}
     * @param  Request  $request
     * @param  $request->input('departments'): 校区权限
     * @param  $request->input('pages'): 页面权限
     * @param  int  $payment_id: 用户id
     */
    public function paymentAccessUpdate(Request $request){
        // 检查登录状态
        if(!Session::has('login')){
            return loginExpired(); // 未登录，返回登陆视图
        }
        // 获取payment_id
        $payment_id = decode($request->input('id'), 'payment_id');
        // 获取表单输入
        $departments = $request->input('departments');
        $pages = $request->input('pages');
        // 更新数据库
        DB::beginTransaction();
        try{
            // 删除原有权限
            DB::table('payment_department')
              ->where('payment_department_payment', $payment_id)
              ->delete();
            DB::table('payment_page')
              ->where('payment_page_payment', $payment_id)
              ->delete();
            if($departments!=NULL){
                // 添加校区权限
                foreach($departments as $department){
                    DB::table('payment_department')->insert(
                        ['payment_department_payment' => $payment_id,
                         'payment_department_department' => $department]
                    );
                }
            }
            if($pages!=NULL){
                // 添加页面权限
                foreach($pages as $page){
                    DB::table('payment_page')->insert(
                        ['payment_page_payment' => $payment_id,
                         'payment_page_page' => $page]
                    );
                }
            }
        }
        // 捕获异常
        catch(Exception $e){
            DB::rollBack();
            return redirect("/company/payment/access?id=".encode($payment_id, 'payment_id'))
                   ->with(['notify' => true,
                           'type' => 'danger',
                           'title' => '用户权限修改失败',
                           'message' => '用户权限修改失败，错误码:114']);
        }
        DB::commit();
        return redirect("/company/payment/access?id=".encode($payment_id, 'payment_id'))
               ->with(['notify' => true,
                       'type' => 'success',
                       'title' => '用户权限修改成功',
                       'message' => '用户权限修改成功,新权限将在重新登录后生效！']);
    }

}

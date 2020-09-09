@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">购买课时</h2>
<nav aria-label="breadcrumb" class="d-none d-inline-block ml-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/education/student">学生管理</a></li>
    <li class="breadcrumb-item active">购买课时</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <form action="/education/student/payment/store" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submit_button')">
    @csrf
    <input type="hidden" value="0" name="course_num" id="course_num">
    <input type="hidden" value="{{ $student->student_id }}" name="payment_student">
    <div class="row">
      <div class="col-5">
        <div class="card">
          <div class="card-header">
            <h4 class="mb-0">学生信息</h4>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <div class="form-group row mb-0">
                  <label class="col-4 col-form-label form-control-label">姓名</label>
                  <label class="col-8 col-form-label form-control-label">{{ $student->student_name }}</label>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row mb-0">
                  <label class="col-4 col-form-label form-control-label">校区</label>
                  <label class="col-8 col-form-label form-control-label">{{ $student->department_name }}</label>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row mb-0">
                  <label class="col-4 col-form-label form-control-label">年级</label>
                  <label class="col-8 col-form-label form-control-label">{{ $student->grade_name }}</label>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-7">
        <div class="card">
          <div class="card-header">
            <h4 class="mb-0">已购课程</h4>
          </div>
          <div class="card-body" style="height:180px; overflow:auto;">
            <ul class="list-group list-group-flush list my--3">
              @foreach ($hours as $hour)
                <li class="list-group-item px-0">
                  <div class="row align-items-center">
                    <div class="col">
                      <small>课程:</small>
                      <h5 class="mb-0">{{ $hour->course_name }}</h5>
                    </div>
                    <div class="col">
                      <small>剩余</small>
                      <h5 class="mb-0">{{ $hour->hour_remain }} 课时</h5>
                    </div>
                    <div class="col">
                      <small>已用</small>
                      <h5 class="mb-0">{{ $hour->hour_used }} 课时</h5>
                    </div>
                  </div>
                </li>
              @endforeach
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <div class="row">
              <div class="col-6">
                <h4 class="mb-0">购课信息</h4>
              </div>
              <div class="col-6 text-right">
                <a href=""><button type="button" class="btn btn-sm btn-outline-danger">重新选择<i class="fa fa-redo"></i></button></a>
              </div>
            </div>
          </div>
          <div class="card-body p-0">
            <div class="table-responsive">
              <table class="table align-items-center table-hover text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:200px;'>课程</th>
                    <th style='width:100px;'>课时单价</th>
                    <th style='width:100px;'>课时数量</th>
                    <th style='width:100px;'>折扣优惠（%）</th>
                    <th style='width:100px;'>金额优惠</th>
                    <th style='width:100px;'>资料费</th>
                    <th style='width:150px;'>合计金额</th>
                  </tr>
                </thead>
                <tbody id="table-body">
                  <tr>
                    <td class="text-center"><label class="col-form-label form-control-label text-warning">添加课程</label></td>
                    <td colspan="4">
                      <select class="form-control form-control-sm" id="new_course" data-toggle="select" onChange="addCourse()">
                        <option value='initial'>添加课程...</option>
                        @foreach($course_same_grade as $course)
                          <option value="{{$course->course_id}},{{$course->course_unit_price}},[{{$course->grade_name}}] {{$course->course_name}}">[ {{$course->grade_name}} ] {{$course->course_name}}</option>
                        @endforeach
                        @foreach($course_all_grade as $course)
                          <option value="{{$course->course_id}},{{$course->course_unit_price}},[全年级] {{$course->course_name}}">[ 全年级 ] {{$course->course_name}}</option>
                        @endforeach
                        @foreach($course_diff_grade as $course)
                          <option value="{{$course->course_id}},{{$course->course_unit_price}},[{{$course->grade_name}}] {{$course->course_name}}">[ {{$course->grade_name}} ] {{$course->course_name}}</option>
                        @endforeach
                      </select>
                    </td>
                    <td class="text-center"><label class="col-form-label form-control-label text-warning">合计</label></td>
                    <td><input class='form-control form-control-sm' type="text" value="0" id="payment_total_price" readonly></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4 class="mb-0">其它信息</h4>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group row">
                  <label class="col-4 col-form-label form-control-label">付费方式<span style="color:red">*</span></label>
                  <div class="col-8">
                    <select class="form-control" name="payment_method" data-toggle="select" required>
                      <option value=''>请选择付费方式...</option>
                      <option value='现金'>现金</option>
                      <option value='转账'>转账</option>
                      <option value='刷卡'>刷卡</option>
                      <option value='微信'>微信</option>
                      <option value='支付宝'>支付宝</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <label class="col-md-4 col-form-label form-control-label">购课日期<span style="color:red">*</span></label>
                  <div class="col-md-8">
                    <input class="form-control datepicker" name="payment_date" type="text" value="{{ date('Y-m-d') }}" required>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <div class="form-group row">
                  <label class="col-4 col-form-label form-control-label">类型<span style="color:red">*</span></label>
                  <div class="col-8">
                    <select class="form-control" name="payment_is_new" data-toggle="select" required>
                      <option value='1' @if(count($hours)==0) selected @endif>新生</option>
                      <option value='0' @if(count($hours)>0) selected @endif>续费</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">购课备注</label>
                  <div class="col-md-10">
                    <textarea class="form-control" name="payment_remark" rows="3" resize="none" placeholder="购课备注..." maxlength="50"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card-footer">
            <div class="row">
              <div class="col-9 my-2"></div>
              <div class="col-3">
                <input type="hidden" name="student_id" value="{{ $student->student_id }}">
                <input type="hidden" name="selected_course_num" id="selected_course_num" value="0">
                <input type="submit" class="btn btn-warning btn-block" id="submit_button" value="提交" disabled="true">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-education');
  navbarActive('navbar-education');
  linkActive('educationStudent');

function addCourse(){
    // 获取已选课程数量
    var course_num = parseInt($("#course_num").val());
    // 增加已选课程数量
    course_num = course_num + 1;
    // 更新已选课程数量
    $("#course_num").val(course_num);
    // 获取已选课程信息
    course_info = $("#new_course").val();
    new_course_id=parseInt(course_info.split(",")[0]);
    new_course_unit_price=parseFloat(course_info.split(",")[1]);
    new_course_name=course_info.split(",")[2];
    // 清除课程选择框
    // $("#new_course").find("option[text='添加课程...']").attr("selected",true);
    // 增加课程表格<tr>
    var tr = "<tr>";
    tr += "<td><label class='col-form-label form-control-label'>"+new_course_name+"</label><input type='hidden' value='"+new_course_id+"' name='payment_course_id_"+course_num+"'></td>";
    tr += "<td><input class='form-control form-control-sm' type='number' readonly value='"+new_course_unit_price+"' name='payment_course_unit_price_"+course_num+"' id='payment_course_unit_price_"+course_num+"'></td>";
    tr += "<td><input class='form-control form-control-sm' type='number' value='0' autocomplete='off' required min='1.0' step='0.1' name='payment_hour_"+course_num+"' id='payment_hour_"+course_num+"' oninput='update("+course_num+")'></td>";
    tr += "<td><input class='form-control form-control-sm' type='number' value='0' autocomplete='off' required max='100' min='0' step='1' name='payment_discount_percentage_"+course_num+"' id='payment_discount_percentage_"+course_num+"' oninput='update("+course_num+")'></td>";
    tr += "<td><input class='form-control form-control-sm' type='number' value='0' autocomplete='off' required min='0.00' step='0.01' name='payment_discount_amount_"+course_num+"' id='payment_discount_amount_"+course_num+"' oninput='update("+course_num+")'></td>";
    tr += "<td><input class='form-control form-control-sm' type='number' value='0' autocomplete='off' required min='0.00' step='0.01' name='payment_extra_"+course_num+"' id='payment_extra_"+course_num+"' oninput='update("+course_num+")'></td>";
    tr += "<td><input class='form-control form-control-sm' type='number' value='0' readonly id='payment_total_price_"+course_num+"'></td>";
    tr += "</tr>";
    $("#table-body").prepend(tr);
    // 删除已选选项
    // var $select = $("#new_course");
    // $select.find("option[value="+$("#new_course").val()+"]").remove();
}

function update(id){
  // 获取输入信息
  var payment_course_unit_price = parseFloat($("#payment_course_unit_price_"+id).val());
  var payment_hour = parseInt($("#payment_hour_"+id).val());
  var payment_discount_percentage = parseInt($("#payment_discount_percentage_"+id).val());
  var payment_discount_amount = parseFloat($("#payment_discount_amount_"+id).val());
  var payment_extra = parseFloat($("#payment_extra_"+id).val());
  // 计算总价并赋值
  if( (!isNaN(payment_course_unit_price)) & (!isNaN(payment_hour)) & (!isNaN(payment_discount_percentage)) & (!isNaN(payment_discount_amount)) & (!isNaN(payment_extra)) ){
    var payment_total_price = Math.round( (payment_course_unit_price*payment_hour*(100-payment_discount_percentage)/100-payment_discount_amount+payment_extra)*100 )/100;
    if(payment_total_price<0){
      $("#payment_total_price_"+id).val(0);
      $('#submit_button').attr("disabled", true);
    }else{
      $("#payment_total_price_"+id).val(payment_total_price);
      $('#submit_button').attr("disabled", false);
    }
  }else{
    $("#payment_total_price_"+id).val(0);
    $('#submit_button').attr("disabled", true);
  }
  // 计算所有金额
  var total_price = 0;
  // 获取已选课程数量
  var course_num = parseInt($("#course_num").val());
  for (var i=1;i<=course_num;i++)
  {
       total_price += parseFloat($("#payment_total_price_"+i).val());
  }

  $("#payment_total_price").val(total_price);
}
</script>
@endsection

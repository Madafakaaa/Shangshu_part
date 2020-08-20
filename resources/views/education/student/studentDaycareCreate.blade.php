@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">购买晚托</h2>
<nav aria-label="breadcrumb" class="d-none d-inline-block ml-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/education/student">学生管理</a></li>
    <li class="breadcrumb-item active">购买晚托</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <form action="/education/student/daycare/store" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submit_button')">
    @csrf
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
            <h4 class="mb-0">已购晚托</h4>
          </div>
          <div class="card-body" style="height:180px; overflow:auto;">
            <ul class="list-group list-group-flush list my--3">
              @foreach ($daycares as $daycare)
                <li class="list-group-item px-0">
                  <div class="row align-items-center">
                    <div class="col">
                      <small>晚托类型:</small>
                      <h5 class="mb-0">{{ $daycare->daycare_name }}</h5>
                    </div>
                    <div class="col">
                      <small>开始日期</small>
                      <h5 class="mb-0">{{ $daycare->daycare_record_start }}</h5>
                    </div>
                    <div class="col">
                      <small>结束日期</small>
                      <h5 class="mb-0">{{ $daycare->daycare_record_end }}</h5>
                    </div>
                    <div class="col">
                      <small>状态</small>
                      @if($daycare->daycare_record_is_refunded==1)
                        <h5 class="mb-0"><span class="text-danger">已退费</span></h5>
                      @elseif(date('Y-m-d')>$daycare->daycare_record_end)
                        <h5 class="mb-0"><span class="text-warning">已过期</span></h5>
                      @elseif(date('Y-m-d')>=$daycare->daycare_record_start&&date('Y-m-d')<=$daycare->daycare_record_end)
                        <h5 class="mb-0"><span class="text-success">使用中</span></h5>
                      @else
                        <h5 class="mb-0"><span class="text-info">未开始</span></h5>
                      @endif
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
                <h4 class="mb-0">晚托信息</h4>
              </div>
            </div>
          </div>
          <div class="card-body p-0">
            <div class="table-responsive">
              <table class="table align-items-center table-hover text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:250px;'>晚托</th>
                    <th style='width:110px;'>开始日期</th>
                    <th style='width:110px;'>收费标准 (元/月)</th>
                    <th style='width:110px;'>晚托时长 (月)</th>
                    <th style='width:110px;'>折扣优惠（%）</th>
                    <th style='width:110px;'>金额优惠</th>
                    <th style='width:130px;'>合计金额</th>
                  </tr>
                </thead>
                <tbody id="table-body">
                  <tr>
                    <td>
                      <select class="form-control form-control-sm" id="daycare_info" data-toggle="select" onChange="update()">
                        <option value='0'>选择晚托...</option>
                        @foreach($daycare_same_grade as $daycare)
                          <option value="{{$daycare->daycare_id}},{{$daycare->daycare_unit_price}}">{{$daycare->daycare_name}} [ {{$daycare->grade_name}}  | {{$daycare->daycare_unit_price}} 元 / 30天 ]</option>
                        @endforeach
                        @foreach($daycare_all_grade as $daycare)
                          <option value="{{$daycare->daycare_id}},{{$daycare->daycare_unit_price}}">{{$daycare->daycare_name}} [ 全年级  | {{$daycare->daycare_unit_price}} 元 / 30天 ]</option>
                        @endforeach
                        @foreach($daycare_diff_grade as $daycare)
                          <option value="{{$daycare->daycare_id}},{{$daycare->daycare_unit_price}}">{{$daycare->daycare_name}} [ {{$daycare->grade_name}}  | {{$daycare->daycare_unit_price}} 元 / 30天 ]</option>
                        @endforeach
                      </select>
                    </td>
                    <td><input class="form-control form-control-sm datepicker" name="daycare_record_start" type="text" value="{{ date('Y-m-d') }}" required></td>
                    <td><input class='form-control form-control-sm' type='number' value='0' name='daycare_record_daycare_unit_price' id='daycare_record_daycare_unit_price' readonly></td>
                    <td><input class='form-control form-control-sm' type='number' value='0' name='daycare_record_month' id='daycare_record_month' autocomplete='off' required min='0.1' step='0.1' oninput='update()'></td>
                    <td><input class='form-control form-control-sm' type='number' value='0' name='daycare_record_discount_percentage' id='daycare_record_discount_percentage' autocomplete='off' required max='100' min='0' step='1' oninput='update()'></td>
                    <td><input class='form-control form-control-sm' type='number' value='0' name='daycare_record_discount_amount' id='daycare_record_discount_amount' autocomplete='off' required min='0.00' step='0.01' oninput='update()'></td>
                    <td><input class='form-control form-control-sm' type='number' value='0' id='daycare_total_price' readonly></td>
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
                    <select class="form-control" name="daycare_record_method" data-toggle="select" required>
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
                  <label class="col-md-4 col-form-label form-control-label">购买日期<span style="color:red">*</span></label>
                  <div class="col-md-8">
                    <input class="form-control datepicker" name="daycare_record_date" type="text" value="{{ date('Y-m-d') }}" required>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">备注</label>
                  <div class="col-md-10">
                    <textarea class="form-control" name="daycare_record_remark" rows="3" resize="none" placeholder="备注..." maxlength="50"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card-footer">
            <div class="row">
              <div class="col-9 my-2"></div>
              <div class="col-3">
                <input type="hidden" name="daycare_record_student" value="{{ $student->student_id }}">
                <input type="hidden" name="daycare_record_daycare" id="daycare_record_daycare" value="">
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

function update(){
  $('#submit_button').attr("disabled", true);
  // 获取已选晚托信息
  var daycare_info = $("#daycare_info").val();
  // 判断是否已选晚托
  if(daycare_info!=0){
      var daycare_record_daycare=parseInt(daycare_info.split(",")[0]);
      var daycare_record_daycare_unit_price=parseFloat(daycare_info.split(",")[1]);
      // 赋值给input
      $("#daycare_record_daycare").val(daycare_record_daycare);
      $("#daycare_record_daycare_unit_price").val(daycare_record_daycare_unit_price);

      var daycare_record_month = parseFloat($("#daycare_record_month").val());
      var daycare_record_discount_percentage = parseFloat($("#daycare_record_discount_percentage").val());
      var daycare_record_discount_amount = parseFloat($("#daycare_record_discount_amount").val());
      var daycare_total_price = 0;
      if( (!isNaN(daycare_record_daycare_unit_price)) & (!isNaN(daycare_record_month)) & (!isNaN(daycare_record_discount_percentage)) & (!isNaN(daycare_record_discount_amount))){
          daycare_total_price = Math.round( (daycare_record_daycare_unit_price*daycare_record_month*(100-daycare_record_discount_percentage)/100-daycare_record_discount_amount) * 100 ) / 100;
          if(daycare_total_price>=0){
              $('#submit_button').attr("disabled", false);
          }else{
              daycare_total_price = 0;
          }
      }
      $("#daycare_total_price").val(daycare_total_price);
  }
}
</script>
@endsection

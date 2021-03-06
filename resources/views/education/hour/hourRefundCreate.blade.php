@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">课时退费</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务运营</li>
    <li class="breadcrumb-item"><a href="/education/hour">学生课时</a></li>
    <li class="breadcrumb-item active">课时退费</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-9 card-wrapper ct-example">
      <div class="card">
        <form action="/education/hour/refund/store" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">课时退费</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-2 text-center">
                <label class="form-control-label">学生</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="text" value="{{$hour->student_name}}" readonly>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">课程</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="text" value="{{$hour->course_name}}" readonly>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">已用</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="text" value="{{$hour->hour_used}} 课时" readonly>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">剩余</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="text" value="{{$hour->hour_remain}} 课时" readonly>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">退课数量<span style="color:red">*</span></label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="number" name="refund_amount" placeholder="退课数量..." min="0" max="{{$hour->hour_remain}}" required>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">退课金额<span style="color:red">*</span></label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="number" name="refund_fee" placeholder="退课金额..." min="0.00" step="0.01"  required>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">退款方式<span style="color:red">*</span></label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <select class="form-control form-control-sm" name="refund_method" data-toggle="selectNoFilter" required>
                    <option value='现金'>现金</option>
                    <option value='银行'>银行</option>
                    <option value='微信'>微信</option>
                    <option value='支付宝'>支付宝</option>
                    <option value='其它'>其它</option>
                  </select>
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">退款账户</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" type="text" name="refund_account" placeholder="退款账户..." maxlength="27" autocomplete="off">
                </div>
              </div>
              <div class="col-2 text-center">
                <label class="form-control-label">退款日期<span style="color:red">*</span></label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm datepicker" name="refund_date" type="text" value="{{ date('Y-m-d') }}" required>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-2 text-center">
                <label class="form-control-label">退款备注<span style="color:red">*</span></label>
              </div>
              <div class="col-10 px-2 mb-2">
                <div class="form-group mb-1">
                  <textarea class="form-control" name="refund_remark" rows="4" resize="none" placeholder="退款备注...（50字之内）" maxlength="50" required></textarea>
                </div>
              </div>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="/education/hour"><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="refund_student" value="{{$hour->student_id}}">
                <input type="hidden" name="refund_course" value="{{$hour->course_id}}">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交申请">
              </div>
            </div>
          </div>
        <form>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-education');
  navbarActive('navbar-education');
  linkActive('educationHour');
</script>
@endsection

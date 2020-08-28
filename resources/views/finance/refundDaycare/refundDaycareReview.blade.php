@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">退费审核</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/finance/refund/daycare">晚托退费记录</a></li>
    <li class="breadcrumb-item active">退费审核</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12 card-wrapper ct-example">
      <div class="card">
        <form action="/finance/refund/daycare/review/store" method="post" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">学生</h3>
              </div>
              <div class="col-6">
                <a href="/student?id={{encode($daycare_refund->student_id, 'student_id')}}"><h3 style="font-weight:450;">{{ $daycare_refund->student_name }}</h3></a>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">晚托开始日期</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->daycare_record_start }}</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">晚托截止日期</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->daycare_record_end }}</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">申请日期</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->daycare_refund_date }}</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">申请用户</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->user_name }}</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">退费金额</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->daycare_refund_fee }} 元</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">退费方式</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->daycare_refund_method }}</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">备注</h3>
              </div>
              <div class="col-6">
                <h3 style="font-weight:450;">{{ $daycare_refund->daycare_refund_remark }}</h3>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-4 text-right">
                <h3 class="text-muted">审核意见</h3>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <select class="form-control" name="daycare_refund_reviewed_status" data-toggle="selectNoFilter" required>
                    <option value=''>请选择审核意见...</option>
                    <option value='1'>同意</option>
                    <option value='2'>拒绝</option>
                  </select>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="daycare_refund_id" value="{{ $daycare_refund->daycare_refund_id }}" readonly>
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-finance');
  navbarActive('navbar-finance');
  linkActive('financeRefundDaycare');
</script>
@endsection

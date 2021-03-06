@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加费用支出记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item"><a href="/finance/expenditure">费用支出记录</a></li>
    <li class="breadcrumb-item active">添加费用支出记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-6 col-md-9 col-sm-12">
      <div class="card">
        <form action="/finance/expenditure/store" method="post" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">添加费用支出记录</h3>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">支出校区<span style="color:red">*</span></label>
                  <select class="form-control" name="expenditure_department" data-toggle="selectNoFilter" required>
                    <option value=''>请选择校区...</option>
                    @foreach ($departments as $department)
                      <option value="{{ $department->department_id }}">{{ $department->department_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">申请用户</label>
                  <input class="form-control" type="text" value="{{ Session::get('user_name') }}" readonly>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">支出金额<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="expenditure_fee" placeholder="请输入支出金额..." autocomplete='off' min="0" required>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">支出说明<span style="color:red">*</span></label>
                  <textarea class="form-control" name="expenditure_remark" rows="4" resize="none" placeholder="支出说明..." maxlength="50"></textarea>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">支出日期<span style="color:red">*</span></label>
                  <input class="form-control datepicker" name="expenditure_date" type="text" value="{{ date('Y-m-d') }}" required>
                </div>
              </div>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
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
  linkActive('link-finance');
  navbarActive('navbar-finance');
  linkActive('financeExpenditure');
</script>
@endsection

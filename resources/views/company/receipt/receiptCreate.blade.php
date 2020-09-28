@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加票据</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/receipt">票据管理</a></li>
    <li class="breadcrumb-item active">添加票据</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <form action="/company/receipt/store" method="post" onsubmit="submitButtonDisable('submitButton1')">
    @csrf
    <div class="row justify-content-center">
      <div class="col-lg-6 col-md-9 col-sm-12">
        <div class="card">
          <div class="card-header">
            <h3 class="mb-0">添加票据</h3>
          </div>
          <div class="card-body py-3">
            <div class="row">
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">学生<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <select class="form-control" name="receipt_student" data-toggle="select" required>
                      <option value=''>请选择开票学生...</option>
                      @foreach ($students as $student)
                        <option value="{{ $student->student_id }}">[ {{$student->department_name}} - {{$student->grade_name}} ] {{ $student->student_name }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">抬头<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" name="receipt_header" placeholder="请输入票据抬头..." autocomplete='off' maxlength="40" required>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">税号<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" name="receipt_tax_number" placeholder="请输入税号..." autocomplete='off' maxlength="20" required>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">金额<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control" type="number" name="receipt_fee" placeholder="请输入金额..." autocomplete='off' min="0" required step="0.01">
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">开票时间<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control datepicker" name="receipt_date" type="text" value="{{ date('Y-m-d') }}" required>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">开票类型<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <select class="form-control" name="receipt_type" data-toggle="selectNoFilter" required>
                      <option value=''>请选择开票类型...</option>
                      <!-- <option value='申请'>申请</option> -->
                      <option value='公对公'>公对公</option>
                      <option value='刷卡'>刷卡</option>
                      <option value='现金'>现金</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">开票单位<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <select class="form-control" name="receipt_corporation" data-toggle="selectNoFilter" required>
                      <option value=''>请选择开票单位...</option>
                      @foreach ($corporations as $corporation)
                        <option value="{{ $corporation->corporation_id }}">{{ $corporation->corporation_name }} [ 额度：{{$corporation->corporation_receipt_amount}}元 ]</option>
                      @endforeach
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">票据号<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" name="receipt_number" placeholder="请输入票据号..." autocomplete='off' maxlength="30" required>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">备注<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <textarea class="form-control" name="receipt_remark" rows="5" resize="none" placeholder="票据备注..." maxlength="50" required></textarea>
                  </div>
                </div>
              </div>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-6 my-2"></div>
              <div class="col-6">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
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
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companyReceipt');
</script>
@endsection

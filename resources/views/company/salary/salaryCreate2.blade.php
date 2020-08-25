@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">结算工资</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/department">员工工资</a></li>
    <li class="breadcrumb-item active">结算工资</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <form action="/company/salary/store" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">结算工资</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-2 text-center">
                <label class="form-control-label">
                  结算月份
                </label>
              </div>
              <div class="col-2 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" name="salary_month" type="text" value="{{ $salary_month }}" readonly>
                </div>
              </div>
              <div class="col-6 text-left">
                <label class="form-control-label">
                  @if(date('Y-m', strtotime($salary_month))>date('Y-m'))
                    <span class="text-danger"> 结算月份在当前月份之后，请检查是否选错年份！</span>
                  @endif
                </label>
              </div>
            </div>
            <hr class="my-3">
            @foreach($users as $user)
              <div class="row">
                <div class="col-2 text-center"><label class="form-control-label">姓名</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" value="{{ $user['user_name'] }}" readonly>
                    <input type="hidden" name="salary_user_{{$loop->iteration}}" value="{{ $user['user_id'] }}">
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">校区</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" value="{{ $user['department_name'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">评级</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" value="{{ $user['teacher_type_name'] }}" readonly>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-2 text-center"><label class="form-control-label">基本工资</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_basic_{{$loop->iteration}}" value="{{ $user['user_salary_basic'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">住房补贴</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_housing_{{$loop->iteration}}" value="{{ $user['user_salary_housing'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">课时费</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_lesson_{{$loop->iteration}}" value="{{ $user['lesson_teacher_fee'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center">
                  <label class="form-control-label">
                    绩效工资
                    <span class="btn-inner--icon" data-toggle="tooltip" data-original-title="绩效总金额：{{ $user['user_salary_performance'] }} * 月考核分数(%)：{{ $user['month_assessment'] }}"><i class="fas fa-question-circle"></i></span>
                  </label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_performance_{{$loop->iteration}}" value="{{ $user['user_salary_performance_actual'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center">
                  <label class="form-control-label">
                    课消提成
                    <span class="btn-inner--icon" data-toggle="tooltip" data-original-title="本月校区课消金额：{{ $user['department_consumption'] }} * 课消提成比例(%)：{{ $user['user_salary_commission'] }}"><i class="fas fa-question-circle"></i></span>
                  </label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_commission_{{$loop->iteration}}" value="{{ $user['user_salary_commission_actual'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">养老保险</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_pension_{{$loop->iteration}}" value="{{ $user['user_salary_pension'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">医疗保险</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_medical_{{$loop->iteration}}" value="{{ $user['user_salary_medical'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">失业保险</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_unemployment_{{$loop->iteration}}" value="{{ $user['user_salary_unemployment'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">公积金</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_provident_{{$loop->iteration}}" value="{{ $user['user_salary_provident'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">子女教育</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_children_{{$loop->iteration}}" value="{{ $user['user_salary_children'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">赡养老人</label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="text" name="salary_elderly_{{$loop->iteration}}" value="{{ $user['user_salary_elderly'] }}" readonly>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">工资支付方式<span style="color:red">*</span></label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <select class="form-control form-control-sm" name="salary_method_{{$loop->iteration}}" data-toggle="selectNoFilter" required>
                      <option value='现金' @if($user['user_salary_method']=="现金") selected @endif>现金</option>
                      <option value='银行' @if($user['user_salary_method']=="银行") selected @endif>银行</option>
                      <option value='微信' @if($user['user_salary_method']=="微信") selected @endif>微信</option>
                      <option value='支付宝' @if($user['user_salary_method']=="支付宝") selected @endif>支付宝</option>
                      <option value='其它' @if($user['user_salary_method']=="其它") selected @endif>其它</option>
                    </select>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">个人所得税<span style="color:red">*</span></label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="number" name="salary_tax_{{$loop->iteration}}" value="0" min="0" required>
                  </div>
                </div>
                <div class="col-2 text-center"><label class="form-control-label">处罚扣款<span style="color:red">*</span></label>
                </div>
                <div class="col-2 px-2 mb-2">
                  <div class="form-group mb-1">
                    <input class="form-control form-control-sm" type="number" name="salary_penalty_{{$loop->iteration}}" value="0" min="0" required>
                  </div>
                </div>
              </div>
              <hr class="my-3">
            @endforeach
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="/company/salary/create" ><button type="button" class="btn btn-outline-primary btn-block">上一步</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="salary_user_num" value="{{count($users)}}">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="结算">
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
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companySalary');
</script>
@endsection

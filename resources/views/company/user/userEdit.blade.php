@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">修改用户</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/user">用户管理</a></li>
    <li class="breadcrumb-item active">修改用户</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12 card-wrapper ct-example">
      <div class="card">
        <form action="/company/user/update" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">修改用户</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">姓名<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_user_name" value="{{$user->user_name}}" autocomplete='off' required maxlength="5">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">性别<span style="color:red">*</span></label>
                  <select class="form-control" name="input_user_gender" data-toggle="selectNoFilter" required>
                    <option value=''>请选择性别...</option>
                    <option value='男' @if($user->user_gender=="男") selected @endif>男</option>
                    <option value='女' @if($user->user_gender=="女") selected @endif>女</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">校区<span style="color:red">*</span></label>
                  <select class="form-control" name="input_user_department" data-toggle="selectNoFilter" required>
                    <option value=''>请选择校区...</option>
                    @foreach ($departments as $department)
                      <option value="{{ $department->department_id }}" @if($user->user_department==$department->department_id) selected @endif>{{ $department->department_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">生日<span style="color:red">*</span></label>
                  <input class="form-control datepicker" name="input_user_birthday" placeholder="Select date" type="text" value="{{$user->user_birthday}}" required>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">
                    教师评级<span style="color:red">*</span>
                    <span class="btn-inner--icon" data-toggle="tooltip" data-original-title="教师评级适用于计算教师课时费。"><i class="fas fa-question-circle"></i></span>
                    </label>
                  <select class="form-control" name="input_user_teacher_type" data-toggle="select" required>
                    <option value=''>请选择教师评级...</option>
                    @foreach ($teacher_types as $teacher_type)
                      <option value="{{ $teacher_type->teacher_type_id }}" @if($user->user_teacher_type==$teacher_type->teacher_type_id) selected @endif>{{ $teacher_type->teacher_type_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">
                    用户级别<span style="color:red">*</span>
                    <span class="btn-inner--icon" data-toggle="tooltip" data-original-title="用户级别适用于教师考核。"><i class="fas fa-question-circle"></i></span>
                  </label>
                  <select class="form-control" name="input_user_position" data-toggle="selectNoFilter" required>
                    <option value=''>请选择用户级别...</option>
                    @foreach ($positions as $position)
                      <option value="{{ $position->position_id }}" @if($user->user_position==$position->position_id) selected @endif>{{ $position->position_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
            </div>
            <hr class="mb-3">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">基本工资<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_basic" value="{{$user->user_salary_basic}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">住房补贴<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_housing" value="{{$user->user_salary_housing}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">养老保险<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_pension" value="{{$user->user_salary_pension}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">医疗保险<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_medical" value="{{$user->user_salary_medical}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">失业保险<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_unemployment" value="{{$user->user_salary_unemployment}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">公积金<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_provident" value="{{$user->user_salary_provident}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">子女教育<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_children" value="{{$user->user_salary_children}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">赡养老人<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_elderly" value="{{$user->user_salary_elderly}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">绩效工资<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_performance" value="{{$user->user_salary_performance}}" autocomplete='off' required min="0">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">校区月课消提成百分比<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_user_salary_commission" value="{{$user->user_salary_commission}}" step="0.1" autocomplete='off' required min="0" max="100">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">工资支付方式<span style="color:red">*</span></label>
                  <select class="form-control" name="input_user_salary_method" data-toggle="selectNoFilter" required>
                    <option value=''>请选择工资支付方式...</option>
                    <option value='现金' @if($user->user_salary_method=='现金') selected @endif>现金</option>
                    <option value='银行' @if($user->user_salary_method=='银行') selected @endif>银行</option>
                    <option value='微信' @if($user->user_salary_method=='微信') selected @endif>微信</option>
                    <option value='支付宝' @if($user->user_salary_method=='支付宝') selected @endif>支付宝</option>
                    <option value='其它' @if($user->user_salary_method=='其它') selected @endif>其它</option>
                  </select>
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
                <input type="hidden" name="input_user_id" value="{{$user->user_id}}">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="修改">
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
  linkActive('companyUser');
</script>
@endsection

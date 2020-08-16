@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加班级</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/education/class">班级管理</a></li>
    <li class="breadcrumb-item active">添加班级</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12">
      <div class="card">
        <form action="/education/class/store" method="post" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">添加班级</h3>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">班级名称<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_class_name" placeholder="请输入班级姓名..." autocomplete='off' maxlength="20" required>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">班级校区<span style="color:red">*</span></label>
                  <input class="form-control" type="text" value="{{ Session::get('user_department_name') }}" readonly>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">班级年级<span style="color:red">*</span></label>
                  <select class="form-control" name="input_class_grade" data-toggle="select" required>
                    <option value=''>请选择班级年级...</option>
                    @foreach ($grades as $grade)
                      <option value="{{ $grade->grade_id }}">{{ $grade->grade_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">班级科目<span style="color:red">*</span></label>
                  <select class="form-control" name="input_class_subject" data-toggle="select" required>
                    <option value=''>请选择班级科目...</option>
                    @foreach ($subjects as $subject)
                      <option value="{{ $subject->subject_id }}">{{ $subject->subject_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">班级教师<span style="color:red">*</span></label>
                  <select class="form-control" name="input_class_teacher" data-toggle="select" required>
                    <option value=''>请选择班级教师...</option>
                    @foreach ($users as $user)
                      <option value="{{ $user->user_id }}">[ {{ $user->department_name }} ] {{ $user->user_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">最大人数<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_class_max_num" value="6" placeholder="请输入班级姓名..." autocomplete='off' min="0" max="99" required>
                </div>
              </div>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-lg-3 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-6 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-3 col-md-5 col-sm-12">
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
  linkActive('link-education');
  navbarActive('navbar-education');
  linkActive('educationClass');
</script>
@endsection

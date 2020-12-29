@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加家长会记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/education/meeting">家长会记录</a></li>
    <li class="breadcrumb-item active">添加家长会记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12">
      <div class="card">
        <form action="/education/meeting/store" method="post" enctype="multipart/form-data" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">添加家长会记录</h3>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">学生姓名<span style="color:red">*</span></label>
                  <select class="form-control" name="input_meeting_student" data-toggle="select" required>
                    <option value=''>选择学生...</option>
                    @foreach ($db_students as $student)
                      <option value="{{ $student->student_id }}">[ {{ $student->department_name }} {{ $student->grade_name }} ] {{ $student->student_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">主持教师<span style="color:red">*</span></label>
                  <select class="form-control" name="input_meeting_teacher" data-toggle="select" required>
                    <option value=''>选择主持教师...</option>
                    @foreach ($db_users as $user)
                      <option value="{{ $user->user_id }}">[ {{ $user->department_name }} ] {{ $user->user_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">科目<span style="color:red">*</span></label>
                  <select class="form-control" name="input_meeting_subject" data-toggle="select" required>
                    <option value=''>选择科目...</option>
                    @foreach ($db_subjects as $subject)
                      <option value="{{ $subject->subject_id }}">{{ $subject->subject_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">日期<span style="color:red">*</span></label>
                  <input class="form-control datepicker" type="text" name="input_meeting_date" value="{{ date('Y-m-d') }}" required>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">家长会备注<span style="color:red">*</span></label>
                  <textarea class="form-control" name="input_meeting_comment" rows="3" resize="none" placeholder="家长会备注..." maxlength="255" required></textarea>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">教案文件(请将文件转为PDF格式后上传)<span style="color:red">*</span></label>
                  <div class="input-group">
                    <input id='location' class="form-control" aria-describedby="button-addon" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file').click();" style="margin:0;" id="button-addon" required>
                      <input type="file" name='file' id='i-file' onChange="$('#location').val($('#i-file').val());" style="display: none" accept=".pdf" required>
                    </div>
                  </div>
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
  linkActive('educationMeeting');
</script>
@endsection

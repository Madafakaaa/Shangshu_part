@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加成绩档案</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/education/meeting">成绩档案</a></li>
    <li class="breadcrumb-item active">添加成绩档案</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12">
      <div class="card">
        <form action="/education/score/lesson/store" method="post" enctype="multipart/form-data" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">添加成绩档案</h3>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">学生姓名<span style="color:red">*</span></label>
                  <input type="hidden" name="input_participant_id" value="{{$db_participant->participant_id}}">
                  <input type="hidden" name="input_score_student" value="{{$db_participant->student_id}}">
                  <input class="form-control" type="text" value="{{$db_participant->student_name}}" disabled>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">科目<span style="color:red">*</span></label>
                  <input type="hidden" name="input_score_subject" value="{{$db_participant->subject_id}}">
                  <input class="form-control" type="text" value="{{$db_participant->subject_name}}" disabled>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">考试名称<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_score_test_name" value="{{$db_participant->lesson_date}} {{$db_participant->subject_name}} 入门测" required readonly>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">考试日期<span style="color:red">*</span></label>
                  <input class="form-control datepicker" type="text" name="input_score_test_date" value="{{$db_participant->lesson_date}}" required readonly>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">考试成绩<span style="color:red">*</span></label>
                  <select class="form-control" name="input_score_mark" data-toggle="selectNoFilter" required>
                    <option value=''>请选择成绩...</option>
                    <option value='A'>A</option>
                    <option value='B'>B</option>
                    <option value='C'>C</option>
                    <option value='D'>D</option>
                  </select>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">成绩文件(请上传图片格式)<span style="color:red">*</span></label>
                  <div class="input-group">
                    <input id='location' class="form-control" aria-describedby="button-addon" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file').click();" style="margin:0;" id="button-addon" required>
                      <input type="file" name='file' id='i-file' onChange="$('#location').val($('#i-file').val());" style="display: none" accept="image/*">
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

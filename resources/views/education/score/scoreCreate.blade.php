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
        <form action="/education/score/store" method="post" enctype="multipart/form-data" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <div class="row">
              <div class="col-4">
                <h3 class="mb-0">添加成绩档案</h3>
              </div>
              <div class="col-5">
              </div>
              <div class="col-3">
                <button type="button" class="btn btn-outline-primary btn-sm btn-block" onclick="addSubject()">增加科目 +</button>
              </div>
            </div>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">学生姓名<span style="color:red">*</span></label>
                  <select class="form-control" name="input_score_student" data-toggle="select" required>
                    <option value=''>选择学生...</option>
                    @foreach ($db_students as $student)
                      <option value="{{ $student->student_id }}">[ {{ $student->department_name }} {{ $student->grade_name }} ] {{ $student->student_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">考试名称<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_score_test_name" placeholder="考试名称..."  maxlength="20" required>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">考试日期<span style="color:red">*</span></label>
                  <input class="form-control datepicker" type="text" name="input_score_test_date" value="{{ date('Y-m-d') }}" required>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">科目 1<span style="color:red">*</span></label>
                  <select class="form-control" name="input_score_subject_1" data-toggle="select" required>
                    <option value=''>选择科目...</option>
                    @foreach ($db_subjects as $subject)
                      <option value="{{ $subject->subject_id }}">{{ $subject->subject_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">考试分数 1<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="input_score_mark_1" placeholder="考试分数..." min="0" max="200" required>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">成绩文件 1<span style="color:red">*</span></label>
                  <div class="input-group">
                    <input id='location_1' class="form-control" aria-describedby="button-addon_1" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check_1" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file_1').click();" style="margin:0;" id="button-addon_1">
                      <input type="file" name='file_1' id='i-file_1' onChange="$('#location_1').val($('#i-file_1').val());" style="display: none">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            @for ($i = 2; $i <= 9; $i++)
            <div id="display_div_{{$i}}" style="display:none;">
              <hr>
              <div class="row">
                <div class="col-6">
                  <div class="form-group">
                    <label class="form-control-label">科目 {{$i}}<span style="color:red">*</span></label>
                    <select class="form-control" name="input_score_subject_{{$i}}" id="input_score_subject_{{$i}}" data-toggle="select">
                      <option value=''>选择科目...</option>
                      @foreach ($db_subjects as $subject)
                        <option value="{{ $subject->subject_id }}">{{ $subject->subject_name }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <label class="form-control-label">考试分数 {{$i}}<span style="color:red">*</span></label>
                    <input class="form-control" type="number" name="input_score_mark_{{$i}}" id="input_score_mark_{{$i}}" placeholder="考试分数..." min="0" max="200">
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-group">
                    <label class="form-control-label">成绩文件 {{$i}}<span style="color:red">*</span></label>
                    <div class="input-group">
                      <input id='location_{{$i}}' class="form-control" aria-describedby="button-addon_{{$i}}" disabled>
                      <div class="input-group-append">
                        <input type="button" id="i-check_{{$i}}" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file_{{$i}}').click();" style="margin:0;" id="button-addon_{{$i}}">
                        <input type="file" name='file_{{$i}}' id='i-file_{{$i}}' onChange="$('#location_{{$i}}').val($('#i-file_{{$i}}').val());" style="display: none">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            @endfor
            <hr class="my-3">
            <div class="row">
              <div class="col-lg-3 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-6 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-3 col-md-5 col-sm-12">
                <input type="hidden" name="test_num" id="test_num" value="1">
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

function addSubject(){
    var test_num = parseInt($("#test_num").val());
    if(test_num < 9){
        test_num = test_num + 1;
        $("#test_num").val(test_num);
        $("#display_div_"+test_num).css('display','block');
        $("#input_score_subject_"+test_num).setAttribute("required","true");
        $("#input_score_mark_"+test_num).setAttribute("required","true");
    }
}

</script>
@endsection

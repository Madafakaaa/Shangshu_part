@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">试卷资料</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/file/paper">试卷资料</a></li>
    <li class="breadcrumb-item active">添加试卷资料</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12">
      <div class="card">
        <form action="/file/paper/store" method="post" enctype="multipart/form-data" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">添加试卷资料</h3>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">年级<span style="color:red">*</span></label>
                  <select class="form-control" name="input_paper_grade" data-toggle="select" required autocomplete="off">
                    <option value=''>选择年级...</option>
                    @foreach ($grades as $grade)
                      <option value="{{ $grade->grade_id }}">{{ $grade->grade_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">科目<span style="color:red">*</span></label>
                  <select class="form-control" name="input_paper_subject" data-toggle="select" required autocomplete="off">
                    <option value=''>选择科目...</option>
                    @foreach ($subjects as $subject)
                      <option value="{{ $subject->subject_id }}">{{ $subject->subject_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">学期<span style="color:red">*</span></label>
                  <select class="form-control" name="input_paper_semester" data-toggle="select" required autocomplete="off">
                    <option value=''>选择学期...</option>
                    <option value="1">秋季班</option>
                    <option value="2">春季班</option>
                    <option value="3">寒假班</option>
                    <option value="4">暑假班</option>
                  </select>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">试卷文件<span style="color:red">*</span></label>
                  <div class="input-group">
                    <input id='location' class="form-control" aria-describedby="button-addon" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file').click();" style="margin:0;" id="button-addon" required>
                      <input type="file" name='file' id='i-file' onChange="$('#location').val($('#i-file').val());" style="display: none">
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
  linkActive('link-file');
  navbarActive('navbar-file');
  linkActive('filePaper');
</script>
@endsection

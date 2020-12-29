@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">标准教案</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item"><a href="/file/standardDocument">标准教案</a></li>
    <li class="breadcrumb-item active">修改标准教案</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12">
      <div class="card">
        <form action="/file/standardDocument/update" method="post" enctype="multipart/form-data" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">修改标准教案</h3>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">教案名称<span style="color:red">*</span></label>
                  <input class="form-control" type="text" value="{{$standard_document->standard_document_name}}" readonly>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">年级<span style="color:red">*</span></label>
                  <input class="form-control" type="text" value="{{$standard_document->grade_name}}" readonly>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">科目<span style="color:red">*</span></label>
                  <input class="form-control" type="text" value="{{$standard_document->subject_name}}" readonly>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">学期<span style="color:red">*</span></label>
                  <input class="form-control" type="text" value="{{$standard_document->standard_document_semester}}" readonly>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">教案文件<span style="color:red">*</span></label>
                  <div class="input-group">
                    <input id='location' class="form-control" aria-describedby="button-addon" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file').click();" style="margin:0;" id="button-addon" required>
                      <input type="file" name='file1' id='i-file' onChange="$('#location').val($('#i-file').val());" style="display: none">
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">答案文件<span style="color:red">*</span></label>
                  <div class="input-group">
                    <input id='location1' class="form-control" aria-describedby="button-addon" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check1" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file1').click();" style="margin:0;" id="button-addon1" required>
                      <input type="file" name='file2' id='i-file1' onChange="$('#location1').val($('#i-file1').val());" style="display: none">
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
                <input type="hidden" name="input_standard_document_id" value="{{$standard_document->standard_document_id}}">
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
  linkActive('fileStandardDocument');
</script>
@endsection

@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">修改课程</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/course">课程设置</a></li>
    <li class="breadcrumb-item active">修改课程</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12 card-wrapper ct-example">
      <div class="card">
        <form action="/company/course/update?id={{encode($course->course_id, 'course_id')}}" method="post" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">修改课程</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">课程名称<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_course_name" value="{{ $course->course_name }}" autocomplete='off' required maxlength="10">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">课时单价（元）</label>
                  <input class="form-control" type="number" value="{{ $course->course_unit_price }}" readonly>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">课程类型<span style="color:red">*</span></label>
                  <select class="form-control" name="input_course_type" data-toggle="selectNoFilter" required>
                    <option value='1' @if($course->course_type==1) selected @endif>1人班</option>
                    <option value='2' @if($course->course_type==1) selected @endif>2人班</option>
                    <option value='3' @if($course->course_type==1) selected @endif>3-6人班</option>
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">课程季度<span style="color:red">*</span></label>
                  <select class="form-control" name="input_course_quarter" data-toggle="selectNoFilter" required>
                    <option value=''>请选择季度...</option>
                    <option value='全年' @if($course->course_quarter=='全年') selected @endif>全年</option>
                    <option value='春季' @if($course->course_quarter=='春季') selected @endif>春季</option>
                    <option value='暑假' @if($course->course_quarter=='暑假') selected @endif>暑假</option>
                    <option value='秋季' @if($course->course_quarter=='秋季') selected @endif>秋季</option>
                    <option value='寒假' @if($course->course_quarter=='寒假') selected @endif>寒假</option>
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">课程年级<span style="color:red">*</span></label>
                  <select class="form-control" name="input_course_grade" data-toggle="selectNoFilter">
                    <option value='0'>全年级</option>
                    @foreach ($grades as $grade)
                      <option value="{{ $grade->grade_id }}" @if($course->course_grade==$grade->grade_id) selected @endif>{{ $grade->grade_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="input_course_id" value="{{ $course->course_id }}" readonly>
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companyCourse');
</script>
@endsection

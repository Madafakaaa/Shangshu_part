@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">上课点名</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教学中心</li>
    <li class="breadcrumb-item"><a href="/education/class">班级管理</a></li>
    <li class="breadcrumb-item active">上课点名</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-10 col-md-10 col-sm-12 card-wrapper ct-example">
      <div class="card">
        <form action="/education/class/lesson/store" method="post" enctype="multipart/form-data" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">上课点名</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-2 text-right">
                <label class="form-control-label">班级</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control form-control-sm" type="text" value="{{ $class->class_name }} [ {{ $class->class_id }} ]" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label">校区</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control form-control-sm" type="text" value="{{ $class->department_name }}" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label">年级</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control form-control-sm" type="text" value="{{ $class->grade_name }}" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label">科目</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control form-control-sm" type="text" value="{{ $class->subject_name }}" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label">人数</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control form-control-sm" type="text" value="{{ $class->class_current_num }} / {{ $class->class_max_num }} 人" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label"><span style="color:red">*</span>教师</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <select class="form-control form-control-sm" name="input_lesson_teacher" data-toggle="select" required>
                    @if(count($teachers)>0)
                      <optgroup label="{{Session::get('user_department_name')}}">
                        @foreach ($teachers as $user)
                          <option value="{{ $user->user_id }}" @if($class->class_teacher==$user->user_id) selected @endif>{{ $user->user_name }}</option>
                        @endforeach
                      </optgroup>
                    @endif
                    @if(count($other_department_teachers)>0)
                      <optgroup label="其它校区">
                        @foreach ($other_department_teachers as $user)
                          <option value="{{ $user->user_id }}" @if($class->class_teacher==$user->user_id) selected @endif>[ {{ $user->department_name }} ] {{ $user->user_name }}</option>
                        @endforeach
                      </optgroup>
                    @endif
                  </select>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label"><span style="color:red">*</span>日期</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm datepicker" type="text" name="input_lesson_date" value="{{ date('Y-m-d') }}" required>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label"><span style="color:red">*</span>时间</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <select class="form-control form-control-sm" name="input_lesson_start" data-toggle="select" required>
                    <option style='display: none' value=''>上课时间...</option>
                    <option value='07:30'>07:30 - 09:00</option>
                    <option value='09:00'>09:00 - 10:30</option>
                    <option value='10:30'>10:30 - 12:00</option>
                    <option value='13:00'>13:00 - 14:30</option>
                    <option value='14:30'>14:30 - 16:00</option>
                    <option value='16:00'>16:00 - 17:30</option>
                    <option value='18:00'>18:00 - 19:30</option>
                    <option value='19:30'>19:30 - 21:00</option>
                  </select>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label"><span style="color:red">*</span>教案</label>
              </div>
              <div class="col-4 px-2 mb-2">
                  <div class="input-group">
                    <input id='location' class="form-control form-control-sm" aria-describedby="button-addon" disabled>
                    <div class="input-group-append">
                      <input type="button" id="i-check" value="浏览文件" class="btn btn-outline-primary btn-sm" onClick="$('#i-file').click();" style="margin:0;" id="button-addon" required>
                      <input type="file" name='file' id='i-file' onChange="$('#location').val($('#i-file').val());" style="display: none">
                    </div>
                  </div>
              </div>
            </div>
            <hr>
            @foreach ($members as $member)
              <div class="row">
                <div class="col-2 text-right">
                  <label class="form-control-label">学生 {{ $loop->iteration }}</label>
                </div>
                <div class="col-4 px-2 mb-2">
                  <div class="form-group mb-1">
                    <label>
                      <a href="/student?id={{encode($member[0]->student_id,'student_id')}}">{{ $member[0]->student_name }}</a> <small>[ {{ $member[0]->student_id }} ]</small>
                      @if($member[0]->student_gender=="男")
                        <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                      @else
                        <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                      @endif
                    </label>
                    <input type="hidden" name="input_student_id_{{ $loop->iteration }}" value="{{ $member[0]->student_id }}">
                  </div>
                </div>
                <div class="col-2 text-right">
                  <label class="form-control-label">
                    <span style="color:red">*</span>
                    <span class="btn-inner--icon" data-toggle="tooltip" data-original-title="正常和旷课扣除课时，请假不扣除课时。"><i class="fas fa-question-circle"></i></span>
                    点名
                  </label>
                </div>
                <div class="col-4 px-2 mb-2">
                  <div class="form-group mb-1">
                    <div class="custom-control custom-radio custom-control-inline ml-2 mr-4">
                      <input type="radio" id="radio{{ $loop->iteration }}_1" name="input_student_status_{{ $loop->iteration }}"  class="custom-control-input" value="1" checked onchange="disableInput({{ $loop->iteration }});">
                      <label class="custom-control-label" for="radio{{ $loop->iteration }}_1">正常</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline ml-2 mr-4">
                      <input type="radio" id="radio{{ $loop->iteration }}_2" name="input_student_status_{{ $loop->iteration }}" class="custom-control-input" value="2" onchange="disableInput({{ $loop->iteration }});">
                      <label class="custom-control-label" for="radio{{ $loop->iteration }}_2">请假</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline ml-2 mr-4">
                      <input type="radio" id="radio{{ $loop->iteration }}_3" name="input_student_status_{{ $loop->iteration }}" class="custom-control-input" value="3" onchange="disableInput({{ $loop->iteration }});">
                      <label class="custom-control-label" for="radio{{ $loop->iteration }}_3">旷课</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-2 text-right">
                  <label class="form-control-label"><span style="color:red">*</span>扣除课程</label>
                </div>
                <div class="col-4 px-2 mb-2">
                  <div class="form-group mb-1">
                    <select class="form-control form-control-sm" name="input_student_course_{{ $loop->iteration }}" id="input_student_course_{{ $loop->iteration }}" data-toggle="select" required>
                      <option value=''>选择扣除课程...</option>
                      @foreach ($member[1] as $course)
                        <option value="{{ $course->course_id }}">
                          {{ $course->course_name }} [剩余：{{ $course->hour_remain }} 课时]
                        </option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-2 text-right">
                  <label class="form-control-label"><span style="color:red">*</span>扣除课时</label>
                </div>
                <div class="col-4 px-2 mb-2">
                  <div class="form-group mb-1">
                    <select class="form-control form-control-sm" name="input_student_amount_{{ $loop->iteration }}" id="input_student_amount_{{ $loop->iteration }}" required data-toggle="selectNoFilter">
                      <option value='1' selected>1 课时</option>
                      <option value='2'>2 课时</option>
                      <option value='3'>3 课时</option>
                    </select>
                  </div>
                </div>
              </div>
              <hr>
            @endforeach
            <div class="row">
              <div class="col-lg-3 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)"><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-6 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-3 col-md-5 col-sm-12">
                <input type="hidden" name="input_lesson_class" value="{{ $class->class_id }}">
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
  linkActive('operationClass');

  function disableInput(a){
    if($("input[name='input_student_status_"+a+"']:checked").val()==2){
      $("#input_student_course_"+a).attr("disabled","disabled");
      $("#input_student_amount_"+a).attr("disabled","disabled");
      // $("#input"+a+"_2 option[index='0']").attr("selected", true);
    }else{
      $("#input_student_course_"+a).removeAttr("disabled");
      $("#input_student_amount_"+a).removeAttr("disabled");
    }
  }
</script>
@endsection

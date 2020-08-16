@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">班级详情</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">班级详情</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card">
        <div class="card-body pt-4">
          <div class="text-center pb-0">
            <h1>{{ $class->class_name }}</h1>
            <div class="h5 font-weight-300">{{ $class->class_id }}</div>
            <hr>
            <div class="row text-left ml-2">
              <div class="col-4">
                <div class="h4">校区</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $class->department_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">年级</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $class->grade_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">科目</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $class->subject_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">教师</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $class->user_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">人数</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $class->class_current_num }} / {{ $class->class_max_num }} 人</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header">
          <h5 class="h3 mb-0">班级成员 ( {{ $class->class_current_num }} / {{ $class->class_max_num }} 人 )</h5>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush list my--2">
            @foreach ($members as $member)
            <li class="list-group-item px-0">
              <div class="row align-items-center">
                <div class="col ml-2">
                  <h4 class="mb-0">
                    <a href="#!">{{ $member->student_name }}</a>
                  </h4>
                  <span class="text-success">●</span>
                  <small>{{ $member->grade_name }}</small>
                </div>
                <div class="col-auto">
                  <a href="/student?id={{encode($member->student_id,'student_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="deleteConfirm('delete_button_{{$loop->iteration}}', '/class/member/delete?class_id={{ encode($class->class_id, 'class_id') }}&student_id={{ encode($member->student_id, 'student_id') }}', '确认删除学生？')">删除</button>
                </div>
              </div>
            </li>
            @endforeach
          </ul>
          <hr>
          <form action="/class/member/add" method="get" onsubmit="submitButtonDisable('submitButton1')">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-8">
                  <div class="form-group mb-2">
                    <select class="form-control" name="input_member_student" data-toggle="select" required>
                      <option value=''>添加班级成员...</option>
                      @foreach ($students as $student)
                        <option value="{{ $student->student_id }}">[ {{ $student->grade_name }} ] {{ $student->student_name }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-4">
                  <input type="hidden" name="input_member_class" value="{{ $class->class_id }}">
                  <input type="submit" class="form-control btn btn-warning btn-block" value="添加" id="submitButton1">
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="col-lg-9 col-md-6 col-sm-12">
      <div class="nav-wrapper p-0">
        <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
          <li class="nav-item">
            <a class="nav-link mb-3 active" id="lessons-tab" data-toggle="tab" href="#lessons" role="tab" aria-controls="lessons" aria-selected="true"><i class="ni ni-badge mr-2"></i>上课记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="edit-tab" data-toggle="tab" href="#edit" role="tab" aria-controls="edit" aria-selected="false"><i class="ni ni-archive-2 mr-2"></i>修改信息</a>
          </li>
        </ul>
      </div>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="lessons" role="tabpanel" aria-labelledby="lessons-tab">
          <div class="card mb-4">
            <div class="table-responsive py-4">
              <table class="table table-flush datatable-basic">
                <thead class="thead-light">
                  <tr>
                    <th style="width:20px;">序号</th>
                    <th style="width:40px;">校区</th>
                    <th style="width:90px;">教师</th>
                    <th style="width:40px;">科目</th>
                    <th style="width:40px;">年级</th>
                    <th style="width:70px;">日期</th>
                    <th style="width:70px;">时间</th>
                    <th style="width:60px;">地点</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit-tab">
          <div class="card mb-4">
            aa
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-3');
  navbarActive('navbar-3');
</script>
@endsection

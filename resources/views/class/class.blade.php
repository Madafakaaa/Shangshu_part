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
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/class/member/delete?class_id={{ encode($class->class_id, 'class_id') }}&student_id={{ encode($member->student_id, 'student_id') }}', '确认删除学生？')">删除</button>
                </div>
              </div>
            </li>
            @endforeach
          </ul>
          @if($class->class_current_num<$class->class_max_num)
            <form action="/class/member/add" method="get" onsubmit="submitButtonDisable('submitButton1')">
              <div class="card-body p-0 mt-3">
                <div class="row">
                  <div class="col-12">
                    <div class="form-group mb-2">
                      <select class="form-control" name="input_member_student" data-toggle="select" required>
                        <option value=''>添加班级成员...</option>
                        @if(count($same_grade_students)>0)
                          <optgroup label="{{$class->grade_name}}学生">
                            @foreach ($same_grade_students as $student)
                              <option value="{{ $student->student_id }}">[ {{ $student->grade_name }} ] {{ $student->student_name }}</option>
                            @endforeach
                          </optgroup>
                        @endif
                        @if(count($diff_grade_students)>0)
                          <optgroup label="其它年级">
                            @foreach ($diff_grade_students as $student)
                              <option value="{{ $student->student_id }}">[ {{ $student->grade_name }} ] {{ $student->student_name }}</option>
                            @endforeach
                          </optgroup>
                        @endif
                      </select>
                    </div>
                  </div>
                  <div class="col-12">
                    <input type="hidden" name="input_member_class" value="{{ $class->class_id }}">
                    <input type="submit" class="form-control btn btn-warning btn-block" value="添加" id="submitButton1">
                  </div>
                </div>
              </div>
            </form>
          @endif
        </div>
      </div>
    </div>
    <div class="col-lg-9 col-md-6 col-sm-12">
      <div class="nav-wrapper p-0">
        <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
          <li class="nav-item">
            <a class="nav-link mb-3 active" id="lessons-tab" data-toggle="tab" href="#lessons" role="tab" aria-controls="lessons" aria-selected="true"><i class="ni ni-ruler-pencil mr-2"></i>上课记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="edit-tab" data-toggle="tab" href="#edit" role="tab" aria-controls="edit" aria-selected="false"><i class="fa fa-cog mr-2"></i>修改信息</a>
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
                    <th style='width:40px;'>序号</th>
                    <th style='width:80px;'>上课教师</th>
                    <th style='width:120px;'>上课学生</th>
                    <th style='width:40px;'>年级</th>
                    <th style='width:40px;'>科目</th>
                    <th style='width:140px;'>时间</th>
                    <th style='width:80px;'>登记用户</th>
                    <th style='width:140px;'>操作管理</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($lessons as $lesson)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>
                      <a href="/user?id={{encode($lesson['teacher_id'], 'user_id')}}">{{ $lesson['teacher_name'] }}</a>
                    </td>
                    <td>
                      {{ $lesson['lesson_attended_num'] }} / {{ $lesson['lesson_attended_num']+$lesson['lesson_leave_num']+$lesson['lesson_absence_num'] }} 人
                      <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal-{{$loop->iteration}}-1">查看</button>
                      <div class="modal fade" id="modal-{{$loop->iteration}}-1" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
                        <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h6 class="modal-title">{{ $lesson['class_name'] }}</h6>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <ul class="list-group list-group-flush list my--3">
                                @foreach ($lesson['participants'] as $participant)
                                  <li class="list-group-item px-0">
                                    <div class="row align-items-center">
                                      <div class="col-auto">
                                        <a href="#" class="avatar rounded-circle">
                                          <img alt="..." src="{{ asset(_ASSETS_.'/avatar/student.png') }}">
                                        </a>
                                      </div>
                                      <div class="col ml--2">
                                        <h4 class="mb-0">
                                          <a href="/student?id={{encode($participant['student_id'], 'student_id')}}">{{ $participant['student_name'] }}</a>
                                        </h4>
                                        @if($participant['participant_attend_status']==1)
                                          <span class="text-success">●</span>
                                          <small>正常 | {{ $participant['course_name'] }} [ {{ $participant['participant_amount'] }} 课时 ]</small>
                                        @elseif($participant['participant_attend_status']==2)
                                          <span class="text-warning">●</span>
                                          <small>请假</small>
                                        @else
                                          <span class="text-danger">●</span>
                                          <small>旷课 | {{ $participant['course_name'] }} [ {{ $participant['participant_amount'] }} 课时 ]</small>
                                        @endif
                                      </div>
                                      <div class="col-auto">
                                        <a href="/student?id={{encode($participant['student_id'], 'student_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
                                      </div>
                                    </div>
                                  </li>
                                @endforeach
                              </ul>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">关闭</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td>{{ $lesson['grade_name'] }}</td>
                    <td>{{ $lesson['subject_name'] }}</td>
                    <td>
                      {{ date('m-d', strtotime($lesson['lesson_date'])) }} {{ dateToDay($lesson['lesson_date']) }} - {{ date('H:i', strtotime($lesson['lesson_start'])) }}
                    </td>
                    <td>
                      <a href="/user?id={{encode($lesson['create_user_id'], 'user_id')}}">{{ $lesson['create_user_name'] }}</a>
                    </td>
                    <td>
                      <a href='/file/document/download?id={{encode($lesson['lesson_document'], 'document_id')}}'><button type="button" class="btn btn-primary btn-sm">下载教案</button></a>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit-tab">
          <div class="card">
            <form action="/class/update" method="post" onsubmit="submitButtonDisable('submitButton2')">
              @csrf
              <div class="card-body">
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">班级名称<span style="color:red">*</span></label>
                      <input class="form-control" type="text" name="input_class_name" value="{{$class->class_name}}" autocomplete='off' maxlength="20" required>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">校区</label>
                      <input class="form-control" type="text" value="{{$class->department_name}}" readonly>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">年级<span style="color:red">*</span></label>
                      <select class="form-control" name="input_class_grade" data-toggle="selectNoFilter" required>
                        @foreach ($grades as $grade)
                          <option value="{{ $grade->grade_id }}" @if($class->class_grade==$grade->grade_id) selected @endif>{{ $grade->grade_name }}</option>
                        @endforeach
                      </select>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">科目<span style="color:red">*</span></label>
                      <select class="form-control" name="input_class_subject" data-toggle="selectNoFilter" required>
                        @foreach ($subjects as $subject)
                          <option value="{{ $subject->subject_id }}" @if($class->class_subject==$subject->subject_id) selected @endif>{{ $subject->subject_name }}</option>
                        @endforeach
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">教师<span style="color:red">*</span></label>
                      <select class="form-control" name="input_class_teacher" data-toggle="select" required>
                        @foreach ($users as $user)
                          <option value="{{ $user->user_id }}" @if($class->class_teacher==$user->user_id) selected @endif>[ {{ $user->department_name }} ] {{ $user->user_name }}</option>
                        @endforeach
                      </select>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">最大人数<span style="color:red">*</span></label>
                      <input class="form-control" type="number" name="input_class_max_num" value="{{ $class->class_max_num }}" autocomplete='off' min="{{ $class->class_current_num }}" max="6" required>
                    </div>
                  </div>
                </div>
                <hr class="my-3">
                <div class="row">
                  <div class="col-lg-9 col-md-7 col-sm-12 my-2"></div>
                  <div class="col-lg-3 col-md-5 col-sm-12">
                    <input type="hidden" name="input_class_id" value="{{ $class->class_id }}">
                    <input type="submit" id="submitButton2" class="btn btn-warning btn-block" value="修改">
                  </div>
                </div>
              </div>
            <form>
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

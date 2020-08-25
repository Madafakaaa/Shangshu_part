@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">用户详情</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">用户详情</li>
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
            <h1>{{ $user->user_name }}</h1>
            <div class="h5 font-weight-300">{{ $user->user_id }}</div>
            <hr>
            <div class="row text-left ml-2">
              <div class="col-4">
                <div class="h4">校区</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $user->department_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">级别</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $user->position_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">评级</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $user->teacher_type_name }}</div>
              </div>
            </div>
          </div>
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
            <a class="nav-link mb-3" id="classes-tab" data-toggle="tab" href="#classes" role="tab" aria-controls="classes" aria-selected="false"><i class="fa fa-users mr-2"></i>负责班级</a>
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
                    <th style='width:35px;'>序号</th>
                    <th style='width:130px;'>班级</th>
                    <th style='width:110px;'>上课学生</th>
                    <th style='width:45px;'>年级</th>
                    <th style='width:45px;'>科目</th>
                    <th style='width:150px;'>时间</th>
                    <th style='width:80px;'>登记用户</th>
                    <th style='width:80px;'>课时费</th>
                    <th style='width:90px;'>操作管理</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($lessons as $lesson)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>
                      <a href="/class?id={{encode($lesson['class_id'], 'class_id')}}">{{ $lesson['class_name'] }}</a>
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
                    <td>{{ $lesson['lesson_teacher_fee'] }} 元</td>
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

        <div class="tab-pane fade" id="classes" role="tabpanel" aria-labelledby="classes-tab">
          <div class="card">
            <div class="table-responsive py-4">
              <table class="table table-hover datatable-basic text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:60px;'>序号</th>
                    <th style='width:150px;'>班级</th>
                    <th style='width:80px;'>年级</th>
                    <th style='width:80px;'>科目</th>
                    <th style='width:80px;'>人数</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($classes as $class)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td><a href="/class?id={{encode($class->class_id, 'class_id')}}">{{ $class->class_name }}</a></td>
                    <td>{{ $class->grade_name }}</td>
                    <td>{{ $class->subject_name }}</td>
                    <td>{{ $class->class_current_num }} / {{ $class->class_max_num }} 人</td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit-tab">
          <div class="card">
            <form action="/user/update" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
              @csrf
              <!-- Card body -->
              <div class="card-body">
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">姓名<span style="color:red">*</span></label>
                      <input class="form-control" type="text" name="input_user_name" value="{{$user->user_name}}" autocomplete='off' required maxlength="5">
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">校区</label>
                      <input class="form-control" type="text" value="{{ $user->department_name }}" readonly>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">性别<span style="color:red">*</span></label>
                      <select class="form-control" name="input_user_gender" data-toggle="selectNoFilter" required>
                        <option value=''>请选择性别...</option>
                        <option value='男' @if($user->user_gender=="男") selected @endif>男</option>
                        <option value='女' @if($user->user_gender=="女") selected @endif>女</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">生日<span style="color:red">*</span></label>
                      <input class="form-control datepicker" name="input_user_birthday" placeholder="Select date" type="text" value="{{$user->user_birthday}}" required>
                    </div>
                  </div>
                </div>
                <hr class="my-3">
                <div class="row">
                  <div class="col-lg-4 col-md-5 col-sm-12">
                    <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
                  </div>
                  <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
                  <div class="col-lg-4 col-md-5 col-sm-12">
                    <input type="hidden" name="input_user_id" value="{{ $user->user_id }}">
                    <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
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

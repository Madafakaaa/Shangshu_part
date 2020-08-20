@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">上课记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">上课记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <button type="button" class="btn btn-sm btn-outline-warning btn-round btn-icon" id='review_all_button' onclick="buttonConfirm('review_all_button', '/education/lesson/review/all', '确认复核所有可复核上课记录？')">
        <span class="btn-inner--icon"><i class="ni ni-check-bold"></i></span>
        <span class="btn-inner--text">全部复核</span>
      </button>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/education/lesson/delete', 'delete-button', '删除后将返还学生所用课时。是否确认删除上课记录')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量删除</span>
      </button>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="table-responsive py-4">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:20px;'></th>
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:190px;'>班级</th>
                <th style='width:80px;'>上课教师</th>
                <th style='width:40px;'>年级</th>
                <th style='width:40px;'>科目</th>
                <th style='width:110px;'>上课学生</th>
                <th style='width:160px;'>时间</th>
                <th style='width:80px;'>登记用户</th>
                <th style='width:80px;'>复核用户</th>
                <th>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($lessons as $lesson)
              <tr>
                <td>
                  @if($lesson['review_user_name']=="")
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($lesson['lesson_id'], 'lesson_id')}}'>
                      <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                    </div>
                  @endif
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $lesson['department_name'] }}</td>
                <td>
                  <a href="/class?id={{encode($lesson['class_id'], 'class_id')}}">{{ $lesson['class_name'] }}</a>
                </td>
                <td>
                  <a href="/user?id={{encode($lesson['teacher_id'], 'user_id')}}">{{ $lesson['teacher_name'] }}</a>
                </td>
                <td>{{ $lesson['grade_name'] }}</td>
                <td>{{ $lesson['subject_name'] }}</td>
                <td>
                  {{ $lesson['lesson_attended_num'] }} / {{ $lesson['lesson_attended_num']+$lesson['lesson_leave_num']+$lesson['lesson_absence_num'] }}人
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
                <td>
                  {{ date('m-d', strtotime($lesson['lesson_date'])) }} {{ dateToDay($lesson['lesson_date']) }} | {{ date('H:i', strtotime($lesson['lesson_start'])) }}
                </td>
                <td>
                  <a href="/user?id={{encode($lesson['create_user_id'], 'user_id')}}">{{ $lesson['create_user_name'] }}</a>
                </td>
                <td>
                  @if($lesson['review_user_name']=="")
                    @if($lesson['create_user_id']==Session::get('user_id'))
                      <a href='#'><button type="button" class="btn btn-warning btn-sm" disabled>待复核</button></a>
                    @else
                      <button type="button" class="btn btn-warning btn-sm" id='review_button_{{$loop->iteration}}' onclick="buttonConfirm('review_button_{{$loop->iteration}}', '/education/lesson/review?id={{encode($lesson['lesson_id'], 'lesson_id')}}', '确认复核所选上课记录？')">复核</button>
                    @endif
                  @else
                    <a href="/user?id={{encode($lesson['review_user_id'], 'user_id')}}">{{ $lesson['review_user_name'] }}</a>
                  @endif
                </td>
                <td>
                  <a href='/education/lesson/document?id={{encode($lesson['lesson_document'], 'document_id')}}'><button type="button" class="btn btn-primary btn-sm">下载教案</button></a>
                  @if($lesson['review_user_name']=="")
                    <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/education/lesson/delete?id={{encode($lesson['lesson_id'], 'lesson_id')}}', '删除后将返还学生所用课时。是否确认删除上课记录？')">删除</button>
                  @endif
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-education');
  navbarActive('navbar-education');
  linkActive('educationLesson');
</script>
@endsection
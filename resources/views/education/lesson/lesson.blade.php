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
      <!-- <button type="button" class="btn btn-sm btn-outline-warning btn-round btn-icon" id='review_all_button' onclick="buttonConfirm('review_all_button', '/education/lesson/review/all', '确认复核所有可复核上课记录？')">
        <span class="btn-inner--icon"><i class="ni ni-check-bold"></i></span>
        <span class="btn-inner--text">全部复核</span>
      </button> -->
      <button class="btn btn-sm btn-outline-warning btn-round btn-icon" data-toggle="tooltip" data-original-title="批量复核" onclick="batchConfirm('/education/lesson/review', 'delete-button', '是否确认复核所勾选记录')">
        <span class="btn-inner--icon"><i class="ni ni-check-bold"></i></span>
        <span class="btn-inner--text">批量复核</span>
      </button>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/education/lesson/delete', 'delete-button', '删除后将返还学生所用课时。是否确认删除上课记录')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量删除</span>
      </button>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="card-header p-0" style="border-bottom:0px;">
          <div class="row my-3 mx-1">
            <div class="col-12">
              <small class="text-muted font-weight-bold px-2">校区：</small>
              <a href="?@foreach($filters as $key => $value) @if($key!='filter_department') {{$key}}={{$value}}& @endif @endforeach">
                <button type="button" @if(!isset($filters['filter_department'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
              </a>
              @foreach($filter_departments as $filter_department)
                <a href="?@foreach($filters as $key => $value) @if($key!='filter_department') {{$key}}={{$value}}& @endif @endforeach &filter_department={{$filter_department->department_id}}"><button type="button" @if($filters['filter_department']==$filter_department->department_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_department->department_name}}</button></a>
              @endforeach
            </div>
          </div>
          <div class="row my-3 mx-1">
            <div class="col-12">
              <small class="text-muted font-weight-bold px-2">年级：</small>
              <a href="?@foreach($filters as $key => $value) @if($key!='filter_grade') {{$key}}={{$value}}& @endif @endforeach">
                <button type="button" @if(!isset($filters['filter_grade'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
              </a>
              @foreach($filter_grades as $filter_grade)
                <a href="?@foreach($filters as $key => $value) @if($key!='filter_grade') {{$key}}={{$value}}& @endif @endforeach filter_grade={{$filter_grade->grade_id}}"><button type="button" @if($filters['filter_grade']==$filter_grade->grade_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_grade->grade_name}}</button></a>
              @endforeach
            </div>
          </div>
          <div class="row my-3 mx-1">
            <div class="col-12">
              <small class="text-muted font-weight-bold px-2">科目：</small>
              <a href="?@foreach($filters as $key => $value) @if($key!='filter_subject') {{$key}}={{$value}}& @endif @endforeach">
                <button type="button" @if(!isset($filters['filter_subject'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
              </a>
              @foreach($filter_subjects as $filter_subject)
                <a href="?@foreach($filters as $key => $value) @if($key!='filter_subject') {{$key}}={{$value}}& @endif @endforeach filter_subject={{$filter_subject->subject_id}}"><button type="button" @if($filters['filter_subject']==$filter_subject->subject_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_subject->subject_name}}</button></a>
              @endforeach
            </div>
          </div>
        </div>
        <hr>
        <div class="table-responsive py-3">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:20px;'></th>
                <th style='width:35px;'>序号</th>
                <th style='width:40px;'>校区</th>
                <th style='width:220px;'>班级</th>
                <th style='width:65px;'>上课教师</th>
                <th style='width:40px;'>年级</th>
                <th style='width:40px;'>科目</th>
                <th style='width:105px;'>实到/应到人数</th>
                <th style='width:160px;'>时间</th>
                <th style='width:65px;'>登记用户</th>
                <th style='width:65px;'>复核用户</th>
                <th style='width:180px;'>操作管理</th>
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
                <td title="{{$lesson['class_name']}}">
                  <a href="/class?id={{encode($lesson['class_id'], 'class_id')}}">{{ $lesson['class_name'] }}</a>
                </td>
                <td>
                  <a href="/user?id={{encode($lesson['teacher_id'], 'user_id')}}">{{ $lesson['teacher_name'] }}</a>
                </td>
                <td>{{ $lesson['grade_name'] }}</td>
                <td>{{ $lesson['subject_name'] }}</td>
                <td>
                  @if($lesson['lesson_leave_num']+$lesson['lesson_absence_num']==0)
                    <span class="text-success">{{ $lesson['lesson_attended_num'] }} / {{ $lesson['lesson_attended_num']+$lesson['lesson_leave_num']+$lesson['lesson_absence_num'] }}人</span>
                  @else
                    <span class="text-warning">{{ $lesson['lesson_attended_num'] }} / {{ $lesson['lesson_attended_num']+$lesson['lesson_leave_num']+$lesson['lesson_absence_num'] }}人</span>
                  @endif
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
                                    @elseif($participant['participant_attend_status']==3)
                                      <span class="text-info">●</span>
                                      <small>补课 | {{ $participant['course_name'] }} [ {{ $participant['participant_amount'] }} 课时 ] | {{ date('m-d', strtotime($participant['participant_secondary_date'])) }} {{ date('H:i', strtotime($participant['participant_secondary_start'])) }}</small>
                                    @else
                                      <span class="text-danger">●</span>
                                      <small>旷课 | {{ $participant['course_name'] }} [ {{ $participant['participant_amount'] }} 课时 ]</small>
                                    @endif
                                    @if($participant['participant_test_mark']!="")
                                      @if($participant['participant_test_path']!="")
                                        <small> | <a href="/files/score/{{$participant['participant_test_path']}}" target="_blank">成绩：{{ $participant['participant_test_mark'] }}</a></small>
                                      @else
                                        <small> | 成绩：{{ $participant['participant_test_mark'] }}</small>
                                      @endif
                                    @endif
                                  </div>
                                  <div class="col-auto">
                                    <a href="/student?id={{encode($participant['student_id'], 'student_id')}}"><button type="button" class="btn btn-primary btn-sm">学生详情</button></a>
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
                  <a href='/education/score/lesson/create?id={{encode($lesson['lesson_id'], 'lesson_id')}}'><button type="button" class="btn btn-outline-primary btn-sm">入门测</button></a>
                  <a href='/file/document/download?id={{encode($lesson['lesson_document'], 'document_id')}}'><button type="button" class="btn btn-primary btn-sm">教案</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/education/lesson/delete?id={{encode($lesson['lesson_id'], 'lesson_id')}}', '删除后将返还学生所用课时。是否确认删除上课记录？')">删除</button>
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

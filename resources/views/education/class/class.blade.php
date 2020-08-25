@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">班级管理</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">班级管理</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/education/class/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加班级">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加班级</span>
      </a>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/education/class/delete', 'delete-button', '删除后班级将无法进行上课点名。是否确认批量删除所选班级？')">
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
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:240px;'>班级</th>
                <th style='width:80px;'>教师</th>
                <th style='width:40px;'>年级</th>
                <th style='width:40px;'>科目</th>
                <th style='width:100px;'>人数</th>
                <th style='width:80px;'>已上课</th>
                <th style='width:200px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($classes as $class)
              <tr>
                <td>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($class['class_id'], 'class_id')}}'>
                    <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                  </div>
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $class['department_name'] }}</td>
                <td>
                  [ {{ $class['class_id'] }} ]
                  <a href="/class?id={{encode($class['class_id'], 'class_id')}}">{{ $class['class_name'] }}</a>
                </td>
                <td><a href="/user?id={{encode($class['user_id'], 'user_id')}}">{{ $class['user_name'] }}</a></td>
                <td>{{ $class['grade_name'] }}</td>
                <td>{{ $class['subject_name'] }}</td>
                <td>
                  {{ $class['class_current_num'] }} / {{ $class['class_max_num'] }} 人
                  <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal-{{$loop->iteration}}-1">查看</button>
                  <div class="modal fade" id="modal-{{$loop->iteration}}-1" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
                    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h6 class="modal-title">{{ $class['class_name'] }}</h6>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <ul class="list-group list-group-flush list my--3">
                            @if(count($class['members'])==0)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      班级当前无学生
                                    </h4>
                                  </div>
                                </div>
                              </li>
                            @endif
                            @foreach ($class['members'] as $member)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col-auto">
                                    <a href="#" class="avatar rounded-circle">
                                      <img alt="..." src="{{ asset(_ASSETS_.'/avatar/student.png') }}">
                                    </a>
                                  </div>
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      <a href="/student?id={{encode($member['student_id'], 'student_id')}}">{{ $member['student_name'] }}</a>
                                    </h4>
                                    <span class="text-success">●</span>
                                    <small>{{ $member['student_id'] }}</small>
                                  </div>
                                  <div class="col-auto">
                                    <a href="/student?id={{encode($member['student_id'], 'student_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
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
                  {{ $class['class_attended_num'] }} 节
                  <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal-{{$loop->iteration}}-2">查看</button>
                  <div class="modal fade" id="modal-{{$loop->iteration}}-2" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
                    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h6 class="modal-title">{{ $class['class_name'] }}</h6>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <ul class="list-group list-group-flush list my--3">
                            @if(count($class['lessons'])==0)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      班级当前无上课记录
                                    </h4>
                                  </div>
                                </div>
                              </li>
                            @endif
                            @foreach ($class['lessons'] as $lesson)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col">
                                    <h4 class="mb-0">
                                      教师：{{ $lesson['lesson_teacher'] }}
                                    </h4>
                                  </div>
                                  <div class="col">
                                    <h4 class="mb-0">
                                      时间：{{ date('m-d', strtotime($lesson['lesson_date'])) }} {{ date('H:i', strtotime($lesson['lesson_start'])) }}
                                    </h4>
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
                  @if($class['class_current_num']>0)
                    <a href="/education/class/lesson/create?id={{encode($class['class_id'], 'class_id')}}"><button type="button" class="btn btn-warning btn-sm">点名</button></a>
                  @else
                    <a href="#"><button type="button" class="btn btn-warning btn-sm" disabled>点名</button></a>
                  @endif
                  <a href="/class?id={{encode($class['class_id'], 'class_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/education/class/delete?id={{encode($class['class_id'], 'class_id')}}', '删除后班级将无法进行上课点名。是否确认删除所选班级？')">删除</button>
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
  linkActive('educationClass');
</script>
@endsection

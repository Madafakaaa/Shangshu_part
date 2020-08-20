@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">学生管理</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">学生管理</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/education/student/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加学生">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加学生</span>
      </a>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/education/student/delete', 'delete-button', '删除后学生将转为离校学生，且从所在班级中退出。是否确认批量删除所选学生？')">
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
                <th style='width:70px;'>校区</th>
                <th style='width:200px;'>学生</th>
                <th style='width:50px;'>年级</th>
                <th style='width:80px;'>所在班级</th>
                <th style='width:80px;'>剩余课时</th>
                <th style='width:80px;'>晚托状态</th>
                <th style='width:200px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($students as $student)
              <tr>
                <td>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($student['student_id'], 'student_id')}}'>
                    <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                  </div>
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $student['department_name'] }}</td>
                <td>
                  @if($student['student_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  [ {{ $student['student_id'] }} ]
                  <a href="/student?id={{encode($student['student_id'], 'student_id')}}">{{ $student['student_name'] }}</a>
                </td>
                <td>{{ $student['grade_name'] }}</td>
                <td>
                  {{ count($student['classes']) }} 个
                  <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal-{{$loop->iteration}}-1">查看</button>
                  <div class="modal fade" id="modal-{{$loop->iteration}}-1" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
                    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h6 class="modal-title">{{ $student['student_name'] }}</h6>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <ul class="list-group list-group-flush list my--3">
                            @if(count($student['classes'])==0)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      学生当前没有班级
                                    </h4>
                                  </div>
                                </div>
                              </li>
                            @endif
                            @foreach ($student['classes'] as $class)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col-auto">
                                    <a href="#" class="avatar rounded-circle">
                                      <img alt="..." src="{{ asset(_ASSETS_.'/avatar/class.png') }}">
                                    </a>
                                  </div>
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      <a href="/class?id={{encode($class['class_id'], 'class_id')}}">{{ $class['class_name'] }}</a>
                                    </h4>
                                    <span class="text-success">●</span>
                                    <small>{{ $class['grade_name'] }} {{ $class['subject_name'] }}</small>
                                  </div>
                                  <div class="col-auto">
                                    <a href="/class?id={{encode($class['class_id'], 'class_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
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
                  {{ count($student['hours']) }} 个
                  <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal-{{$loop->iteration}}-2">查看</button>
                  <div class="modal fade" id="modal-{{$loop->iteration}}-2" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
                    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h6 class="modal-title">{{ $student['student_name'] }}</h6>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <ul class="list-group list-group-flush list my--3">
                            @if(count($student['hours'])==0)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      学生当前没有课时
                                    </h4>
                                  </div>
                                </div>
                              </li>
                            @endif
                            @foreach ($student['hours'] as $hour)
                              <li class="list-group-item px-0">
                                <div class="row align-items-center">
                                  <div class="col-auto">
                                    <a href="#" class="avatar rounded-circle">
                                      <img alt="..." src="{{ asset(_ASSETS_.'/avatar/hour.png') }}">
                                    </a>
                                  </div>
                                  <div class="col ml--2">
                                    <h4 class="mb-0">
                                      {{ $hour['course_name'] }}
                                    </h4>
                                    @if($hour['hour_remain']<=5)
                                      <span class="text-warning">●</span>
                                    @else
                                      <span class="text-success">●</span>
                                    @endif
                                    <small>剩余：{{ $hour['hour_remain'] }} 课时</small>
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
                @if($student['student_daycare']=="")
                  <td><span class="text-danger">当前无晚托</span></td>
                @else
                  <td><span class="text-success">晚托使用中</span></td>
                @endif
                <td>
                  <a href="/education/student/payment/create?id={{encode($student['student_id'], 'student_id')}}"><button type="button" class="btn btn-warning btn-sm">购课时</button></a>
                  <a href="/education/student/daycare/create?id={{encode($student['student_id'], 'student_id')}}"><button type="button" class="btn btn-info btn-sm">购晚托</button></a>
                  <a href='/student?id={{encode($student['student_id'], 'student_id')}}'><button type="button" class="btn btn-primary btn-sm">详情</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/education/student/delete?id={{encode($student['student_id'], 'student_id')}}', '删除后学生将转为离校学生，且从所在班级中退出。是否确认删除所选学生？')">删除</button>
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
  linkActive('educationStudent');
</script>
@endsection

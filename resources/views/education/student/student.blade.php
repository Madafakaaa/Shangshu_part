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
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchDeleteConfirm('/education/student/delete', '删除后学生将转为离校学生，且从所在班级中退出。是否确认批量删除所选学生？？')">
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
                <th style='width:210px;'>学生</th>
                <th style='width:40px;'>年级</th>
                <th style='width:150px;'>学校</th>
                <th style='width:100px;'>电话</th>
                <th style='width:80px;'>生日</th>
                <th style='width:60px;'>晚托状态</th>
                <th style='width:160px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($students as $student)
              <tr>
                <td>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($student->student_id, 'student_id')}}'>
                    <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                  </div>
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $student->department_name }}</td>
                <td>
                  @if($student->student_gender=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  [ {{ $student->student_id }} ]
                  <a href="/student?id={{encode($student->student_id, 'student_id')}}">{{ $student->student_name }}</a>
                </td>
                <td>{{ $student->grade_name }}</td>
                <td>{{ $student->student_school }}</td>
                <td>{{ $student->student_phone }}</td>
                <td>{{ $student->student_birthday }}</td>
                <td> - </td>
                <td>
                  <a href="/education/student/payment/create?id={{encode($student->student_id, 'student_id')}}"><button type="button" class="btn btn-warning btn-sm">购课</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="deleteConfirm('delete_button_{{$loop->iteration}}', '/education/student/delete?id={{encode($student->student_id, 'student_id')}}', '删除后学生将转为离校学生，且从所在班级中退出。是否确认删除所选学生？')">删除</button>
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

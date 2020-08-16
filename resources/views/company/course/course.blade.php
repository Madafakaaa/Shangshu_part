@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">课程设置</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">课程设置</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/course/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加课程">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加课程</span>
      </a>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量结课" onclick="batchDeleteConfirm('/company/course/delete', '确认批量删除所选课程？')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量结课</span>
      </button>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="table-responsive py-4">
          <table class="table table-hover datatable-basic text-center table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:40px;'></th>
                <th style='width:120px;'>名称</th>
                <th style='width:100px;'>类型</th>
                <th style='width:100px;'>年级</th>
                <th style='width:100px;'>单价</th>
                <th style='width:100px;'>状态</th>
                <th style='width:100px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($courses as $course)
              <tr>
                <td>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($course->course_id, 'course_id')}}'>
                    <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                  </div>
                </td>
                <td>{{ $course->course_name }}</td>
                <td>
                  @if($course->course_type==1)
                    1人班
                  @elseif($course->course_type==2)
                    2人班
                  @else
                    3-6人班
                  @endif
                </td>
                <td>@if($course->course_grade==0) 全年级 @else{{ $course->grade_name }}@endif</td>
                <td>{{ $course->course_unit_price }}元</td>
                <td>
                  @if($course->course_is_available==1)
                    <span class="text-success">可购买</span>
                  @else
                    <span class="text-danger">已结课</span>
                  @endif
                </td>
                <td>
                  @if($course->course_is_available==1)
                    <a href='/company/course/edit?id={{encode($course->course_id, 'course_id')}}'><button type="button" class="btn btn-primary btn-sm">修改</button></a>
                    <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="deleteConfirm('delete_button_{{$loop->iteration}}', '/company/course/delete?id={{encode($course->course_id, 'course_id')}}', '确认结束课程？')">结课</button>
                  @else
                    <a href='/company/course/restore?id={{encode($course->course_id, 'course_id')}}'><button type="button" class="btn btn-outline-primary btn-sm">恢复</button></a>
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
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companyCourse');
</script>
@endsection

@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">通知文件</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教师中心</li>
    <li class="breadcrumb-item active">通知文件</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/teacher/announcement/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加通知">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加通知</span>
      </a>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="table-responsive py-4">
          <table class="table table-hover datatable-basic text-center table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:40px;'>序号</th>
                <th style='width:300px;' class="text-left">通知</th>
                <th style='width:120px;'>范围</th>
                <th style='width:120px;'>日期</th>
                <th style='width:150px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($announcements as $announcement)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td class="text-left"><a href="/files/announcement/{{ $announcement->announcement_path }}" target="_blank">{{ $announcement->announcement_name }}</a></td>
                @if($announcement->announcement_level==5)
                  <td>全部可见</td>
                @elseif($announcement->announcement_level==4)
                  <td>教务及已上可见</td>
                @else
                  <td>分校长及已上可见</td>
                @endif
                <td>{{ date('Y-m-d', strtotime($announcement->announcement_create_time)) }}</td>
                <td>
                  <a href="/files/announcement/{{ $announcement->announcement_path }}" target="_blank"><button type="button" class="btn btn-primary btn-sm">预览</button></a>
                  <a href='/teacher/announcement/download?id={{encode($announcement->announcement_id, 'announcement_id')}}'><button type="button" class="btn btn-primary btn-sm">下载文件</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/teacher/announcement/delete?id={{encode($announcement->announcement_id, 'announcement_id')}}', '确认删除通知？')">删除</button>
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
  linkActive('link-teacher');
  navbarActive('navbar-teacher');
  linkActive('teacherAnnouncement');
</script>
@endsection

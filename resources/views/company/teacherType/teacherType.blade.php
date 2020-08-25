@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">教师评级</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">教师评级</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/teacherType/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加教师评级">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加教师评级</span>
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
                <th style='width:200px;'>教师评级</th>
                <th style='width:80px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($teacher_types as $teacher_type)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $teacher_type->teacher_type_name }}</td>
                <td>
                  <a href='/company/teacherType/edit?id={{encode($teacher_type->teacher_type_id, 'teacher_type_id')}}'><button type="button" class="btn btn-primary btn-sm">修改课时费</button></a>
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
  linkActive('companyTeacherType');
</script>
@endsection

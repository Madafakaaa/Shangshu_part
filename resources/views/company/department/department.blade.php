@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">校区设置</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">校区设置</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/department/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加校区">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加校区</span>
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
                <th style='width:120px;'>校区</th>
                <th style='width:120px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($departments as $department)
              <tr>
                </td>
                <td>{{ $department->department_name }}</td>
                <td>
                  <a href='/company/department/edit?id={{encode($department->department_id, 'department_id')}}'><button type="button" class="btn btn-primary btn-sm">修改</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="deleteConfirm('delete_button_{{$loop->iteration}}', '/company/department/delete?id={{encode($department->department_id, 'department_id')}}', '确认删除校区？')">删除</button>
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
  linkActive('companyDepartment');
</script>
@endsection

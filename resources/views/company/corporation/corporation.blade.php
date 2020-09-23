@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">单位设置</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">单位设置</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/corporation/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加单位">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加单位</span>
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
                <th style='width:200px;'>单位</th>
                <th style='width:200px;'>每月额度</th>
                <th style='width:100px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($corporations as $corporation)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $corporation->corporation_name }}</td>
                <td>{{ $corporation->corporation_receipt_amount }}</td>
                <td>
                  <a href='/company/corporation/edit?id={{encode($corporation->corporation_id, 'corporation_id')}}'><button type="button" class="btn btn-primary btn-sm">修改</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/company/corporation/delete?id={{encode($corporation->corporation_id, 'corporation_id')}}', '确认删除单位？')">删除</button>
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
  linkActive('companyCorporation');
</script>
@endsection

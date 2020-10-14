@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">员工工资</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">员工工资</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/salary/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="结算工资">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">结算工资</span>
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
                <th style='width:60px;'></th>
                <th style='width:150px;'>月份</th>
                <th style='width:200px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($salaries as $salary)
              <tr>
                <td>{{$loop->iteration}}</td>
                <td>{{$salary->salary_month}}</td>
                <td>
                  <a href='/company/salary/month?month={{$salary->salary_month}}' target="_blank"><button type="button" class="btn btn-primary btn-sm">查看工资表</button></a>
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
  linkActive('companySalary');
</script>
@endsection

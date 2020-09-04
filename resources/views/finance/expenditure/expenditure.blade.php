@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">费用支出记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item active">费用支出记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/finance/expenditure/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加记录">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加记录</span>
      </a>
      <button type="button" class="btn btn-sm btn-outline-warning btn-round btn-icon" id='review_all_button' onclick="buttonConfirm('review_all_button', '/finance/expenditure/review/all', '确认复核所有可复核支出记录？')">
        <span class="btn-inner--icon"><i class="ni ni-check-bold"></i></span>
        <span class="btn-inner--text">全部复核</span>
      </button>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/finance/expenditure/delete', 'delete-button', '是否确认删除所选支出记录')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量删除</span>
      </button>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="table-responsive py-3">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:20px;'></th>
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:80px;' class="text-right">支出金额</th>
                <th style='width:350px;'>支出说明</th>
                <th style='width:90px;'>日期</th>
                <th style='width:70px;'>登记用户</th>
                <th style='width:80px;'>复核状态</th>
                <th style='width:70px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($expenditures as $expenditure)
              <tr>
                <td>
                  @if($expenditure->expenditure_reviewed_user=="")
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($expenditure->expenditure_id, 'expenditure_id')}}'>
                      <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                    </div>
                  @endif
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $expenditure->department_name }}</td>
                <td class="text-right">{{ $expenditure->expenditure_fee }} 元</td>
                <td>{{ $expenditure->expenditure_remark }}</td>
                <td>{{ $expenditure->expenditure_date }}</td>
                <td>
                  <a href="/user?id={{encode($expenditure->user_id, 'user_id')}}">{{ $expenditure->user_name }}</a>
                </td>
                <td>
                  @if($expenditure->expenditure_reviewed_user=="")
                    @if($expenditure->expenditure_reviewed_user==Session::get('user_id'))
                      <button type="button" class="btn btn-warning btn-sm" disabled>待复核</button>
                    @else
                      <button type="button" class="btn btn-warning btn-sm" id='review_button_{{$loop->iteration}}' onclick="buttonConfirm('review_button_{{$loop->iteration}}', '/finance/expenditure/review?id={{encode($expenditure->expenditure_id, 'expenditure_id')}}', '确认复核所选支出记录？')">复核</button>
                    @endif
                  @else
                    <span class="text-success">已复核</span>
                  @endif
                </td>
                <td>
                  @if($expenditure->expenditure_reviewed_user=="")
                    <button type="button" class="btn btn-outline-danger btn-sm" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/finance/expenditure/delete?id={{encode($expenditure->expenditure_id, 'expenditure_id')}}', '确认删除支出记录？')">删除</button>
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
  linkActive('link-finance');
  navbarActive('navbar-finance');
  linkActive('financeExpenditure');
</script>
@endsection

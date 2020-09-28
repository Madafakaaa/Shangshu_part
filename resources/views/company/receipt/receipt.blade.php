@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">票据管理</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">票据管理</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/receipt/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加票据">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加票据</span>
      </a>
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
        </div>
        <hr>
        <div class="table-responsive py-3">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:65px;'>学生</th>
                <th style='width:45px;'>校区</th>
                <th style='width:180px;'>抬头-税号</th>
                <th style='width:80px;' class="text-right">金额</th>
                <th style='width:150px;'>开票公司</th>
                <th style='width:100px;'>票据号</th>
                <th style='width:65px;'>开票日期</th>
                <th style='width:80px;'>添加/审核用户</th>
                <th style='width:60px;'>类型</th>
                <th style='width:60px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($receipts as $receipt)
              <tr>
                <td>
                  @if($receipt['student_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($receipt['student_id'], 'student_id')}}">{{ $receipt['student_name'] }}</a>
                </td>
                <td>{{ $receipt['department_name'] }}</td>
                <td title="{{ $receipt['receipt_header'] }} - {{ $receipt['receipt_tax_number'] }}">{{ $receipt['receipt_header'] }} - {{ $receipt['receipt_tax_number'] }}</td>
                <td class="text-right">{{ $receipt['receipt_fee'] }} 元</td>
                <td>{{ $receipt['corporation_name'] }}</td>
                <td>{{ $receipt['receipt_number'] }}</td>
                <td>{{ date('y-m-d', strtotime($receipt['receipt_date'])) }}</td>
                <td><a href="/user?id={{encode($receipt['receipt_reviewed_user_id'], 'user_id')}}">{{ $receipt['receipt_reviewed_user_name'] }}</a></td>
                <td>{{ $receipt['receipt_type'] }}</td>
                <td>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/company/receipt/delete?id={{encode($receipt['receipt_id'], 'receipt_id')}}', '确认删除票据？')">删除</button>
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
  linkActive('companyReceipt');
</script>
@endsection

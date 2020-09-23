@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">发票申请记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item active">发票申请记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
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
                <th style='width:40px;'>序号</th>
                <th style='width:70px;'>学生</th>
                <th style='width:50px;'>校区</th>
                <th style='width:200px;'>抬头</th>
                <th style='width:180px;'>税号</th>
                <th style='width:80px;' class="text-right">金额</th>
                <th style='width:65px;'>申请日期</th>
                <th style='width:65px;'>申请用户</th>
                <th style='width:65px;'>审批状态</th>
                <th style='width:60px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($receipts as $receipt)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>
                  @if($receipt['student_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($receipt['student_id'], 'student_id')}}">{{ $receipt['student_name'] }}</a>
                </td>
                <td>{{ $receipt['department_name'] }}</td>
                <td>{{ $receipt['receipt_header'] }}</td>
                <td>{{ $receipt['receipt_tax_number'] }}</td>
                <td class="text-right">{{ $receipt['receipt_fee'] }} 元</td>
                <td>{{ date('y-m-d', strtotime($receipt['receipt_create_time'])) }}</td>
                <td><a href="/user?id={{encode($receipt['receipt_create_user_id'], 'user_id')}}">{{ $receipt['receipt_create_user_name'] }}</a></td>
                @if($receipt['receipt_reviewed_status']==0)
                  <td class="text-info">待审核</td>
                @elseif($receipt['receipt_reviewed_status']==1)
                  <td class="text-success">同意</td>
                @else
                  <td class="text-danger">拒绝</td>
                @endif
                <td>
                  <!-- <a href="/receipt?id={{encode($receipt['receipt_id'], 'receipt_id')}}" target="_blank"><button type="button" class="btn btn-primary btn-sm">详情</button></a>-->
                  @if($receipt['receipt_reviewed_status']==0)
                    <a href="/finance/receipt/review?id={{encode($receipt['receipt_id'], 'receipt_id')}}"><button type="button" class="btn btn-warning btn-sm">审批</button></a>
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
  linkActive('financeReceipt');
</script>
@endsection

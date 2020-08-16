@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">课时缴费</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">课时缴费</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/finance/payment/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加购课">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加购课</span>
      </a>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchDeleteConfirm('/finance/payment/delete', '删除后学生将转为离校学生，且从所在班级中退出。是否确认批量删除所选学生？？')">
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
                <th style='width:50px;'>校区</th>
                <th style='width:140px;'>学生</th>
                <th style='width:40px;'>课程</th>
                <th style='width:40px;'>购买课时</th>
                <th style='width:40px;'>优惠金额</th>
                <th style='width:40px;'>资料费</th>
                <th style='width:40px;'>实付</th>
                <th style='width:40px;'>登记用户</th>
                <th style='width:160px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($payments as $payment)
              <tr>
                <td>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($payment->payment_id, 'payment_id')}}'>
                    <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                  </div>
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $payment->department_name }}</td>
                <td>
                  @if($payment->payment_gender=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  [ {{ $payment->payment_id }} ]
                  <a href="/payment?id={{encode($payment->payment_id, 'payment_id')}}">{{ $payment->payment_name }}</a>
                </td>
                <td>{{ $payment->course_name }}</td>
                <td>{{ $payment->course_name }}</td>
                <td>{{ $payment->course_name }}</td>
                <td>{{ $payment->course_name }}</td>
                <td>{{ $payment->course_name }}</td>
                <td>{{ $payment->course_name }}</td>
                <td>
                  <a href="/finance/payment/create?id={{encode($payment->payment_id, 'payment_id')}}"><button type="button" class="btn btn-warning btn-sm">购课</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="deleteConfirm('delete_button_{{$loop->iteration}}', '/finance/payment/delete?id={{encode($payment->payment_id, 'payment_id')}}', '删除后学生将转为离校学生，且从所在班级中退出。是否确认删除所选学生？')">删除</button>
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
  linkActive('financePayment');
</script>
@endsection

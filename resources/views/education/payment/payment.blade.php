@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">购课记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">购课记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchDeleteConfirm('/education/student/delete', '删除后学生将转为离校学生，且从所在班级中退出。是否确认批量删除所选学生？？')">
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
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:210px;'>学生</th>
                <th style='width:40px;'>年级</th>
                <th style='width:140px;'>购买课程</th>
                <th style='width:70px;' class="text-right">数量</th>
                <th style='width:80px;' class="text-right">优惠信息</th>
                <th style='width:80px;' class="text-right">资料费</th>
                <th style='width:80px;' class="text-right">合计</th>
                <th style='width:90px;'>购课日期</th>
                <th style='width:70px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($payments as $payment)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $payment->department_name }}</td>
                <td>
                  @if($payment->student_gender=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  [ {{ $payment->student_id }} ]
                  <a href="/student?id={{encode($payment->student_id, 'student_id')}}">{{ $payment->student_name }}</a>
                </td>
                <td>{{ $payment->grade_name }}</td>
                <td>{{ $payment->course_name }}</td>
                <td class="text-right">{{ $payment->payment_hour }} 课时</td>
                @if($payment->payment_discount_total==0)
                  <td class="text-right"> - </td>
                @else
                  <td class="text-right"><span class="text-danger">- {{ $payment->payment_discount_total }} 元</span></td>
                @endif
                @if($payment->payment_extra==0)
                  <td class="text-right"> - </td>
                @else
                  <td class="text-right">{{ $payment->payment_extra }} 元</td>
                @endif
                <td class="text-right"><strong>{{ $payment->payment_total_price }} 元</strong></td>
                <td>{{ $payment->payment_date }}</td>
                <td>
                  <a href='/company/course/edit?id='><button type="button" class="btn btn-outline-danger btn-sm">删除</button></a>
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
  linkActive('link-education');
  navbarActive('navbar-education');
  linkActive('educationPayment');
</script>
@endsection

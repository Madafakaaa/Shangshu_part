@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">课时退费记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item active">课时退费记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
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
          <div class="row my-3 mx-1">
            <div class="col-12">
              <small class="text-muted font-weight-bold px-2">年级：</small>
              <a href="?@foreach($filters as $key => $value) @if($key!='filter_grade') {{$key}}={{$value}}& @endif @endforeach">
                <button type="button" @if(!isset($filters['filter_grade'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
              </a>
              @foreach($filter_grades as $filter_grade)
                <a href="?@foreach($filters as $key => $value) @if($key!='filter_grade') {{$key}}={{$value}}& @endif @endforeach filter_grade={{$filter_grade->grade_id}}"><button type="button" @if($filters['filter_grade']==$filter_grade->grade_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_grade->grade_name}}</button></a>
              @endforeach
            </div>
          </div>
        </div>
        <hr>
        <div class="table-responsive py-3">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:20px;'></th>
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:100px;'>学生</th>
                <th style='width:140px;'>退费课程</th>
                <th style='width:70px;' class="text-right">退款数量</th>
                <th style='width:80px;' class="text-right">退款金额</th>
                <th style='width:260px;'>退费方式</th>
                <th style='width:90px;'>退费日期</th>
                <th style='width:70px;'>申请用户</th>
                <th style='width:80px;'>审核状态</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($hour_refunds as $hour_refund)
              <tr>
                <td>
                  @if($hour_refund['review_user_name']=="")
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($hour_refund['hour_refund_id'], 'hour_refund_id')}}'>
                      <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                    </div>
                  @endif
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $hour_refund['department_name'] }}</td>
                <td>
                  @if($hour_refund['student_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($hour_refund['student_id'], 'student_id')}}">{{ $hour_refund['student_name'] }}</a>
                </td>
                <td>{{ $hour_refund['course_name'] }}</td>
                <td class="text-right">{{ $hour_refund['hour_refund_amount'] }} 课时</td>
                <td class="text-right"><strong>{{ number_format($hour_refund['hour_refund_fee'],1) }} 元</strong></td>
                <td>{{ $hour_refund['hour_refund_method'] }}</td>
                <td>{{ $hour_refund['hour_refund_date'] }}</td>
                <td>
                  <a href="/user?id={{encode($hour_refund['create_user_id'], 'user_id')}}">{{ $hour_refund['create_user_name'] }}</a>
                </td>
                <td>
                  @if($hour_refund['hour_refund_reviewed_status']==0)
                    <a href="/finance/refund/payment/review?id={{encode($hour_refund['hour_refund_id'], 'hour_refund_id')}}"><button type="button" class="btn btn-warning btn-sm">审核</button></a>
                  @elseif($hour_refund['hour_refund_reviewed_status']==1)
                    <span class="text-success">同意</span>
                  @else
                    <span class="text-danger">拒绝</span>
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
  linkActive('financeRefundPayment');
</script>
@endsection

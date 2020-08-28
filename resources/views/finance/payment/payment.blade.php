@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">购课记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item active">购课记录</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <button type="button" class="btn btn-sm btn-outline-warning btn-round btn-icon" id='review_all_button' onclick="buttonConfirm('review_all_button', '/finance/payment/review/all', '确认复核所有可复核购课记录？')">
        <span class="btn-inner--icon"><i class="ni ni-check-bold"></i></span>
        <span class="btn-inner--text">全部复核</span>
      </button>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/finance/payment/delete', 'delete-button', '删除后将扣除学生课时，若学生剩余课时不足将无法扣除。是否确认删除购课记录')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量删除</span>
      </button>
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
                <th style='width:140px;'>购买课程</th>
                <th style='width:70px;' class="text-right">数量</th>
                <th style='width:80px;' class="text-right">合计优惠</th>
                <th style='width:80px;' class="text-right">资料费</th>
                <th style='width:90px;' class="text-right">合计</th>
                <th style='width:90px;'>购课日期</th>
                <th style='width:70px;'>登记用户</th>
                <th style='width:80px;'>复核用户</th>
                <th style='width:70px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($payments as $payment)
              <tr>
                <td>
                  @if($payment['review_user_name']=="")
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($payment['payment_id'], 'payment_id')}}'>
                      <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                    </div>
                  @endif
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $payment['department_name'] }}</td>
                <td>
                  @if($payment['student_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($payment['student_id'], 'student_id')}}">{{ $payment['student_name'] }}</a>
                </td>
                <td>{{ $payment['course_name'] }}</td>
                <td class="text-right">{{ $payment['payment_hour'] }} 课时</td>
                @if($payment['payment_discount_total']==0)
                  <td class="text-right"> - </td>
                @else
                  <td class="text-right"><span class="text-danger">- {{ number_format($payment['payment_discount_total'], 1) }} 元</span></td>
                @endif
                @if($payment['payment_extra']==0)
                  <td class="text-right"> - </td>
                @else
                  <td class="text-right">{{ number_format($payment['payment_extra'], 1) }} 元</td>
                @endif
                <td class="text-right"><strong>{{ number_format($payment['payment_total_price'],1) }} 元</strong></td>
                <td>{{ $payment['payment_date'] }}</td>
                <td>
                  <a href="/user?id={{encode($payment['create_user_id'], 'user_id')}}">{{ $payment['create_user_name'] }}</a>
                </td>
                <td>
                  @if($payment['review_user_name']=="")
                    @if($payment['create_user_id']==Session::get('user_id'))
                      <a href='#'><button type="button" class="btn btn-warning btn-sm" disabled>待复核</button></a>
                    @else
                      <button type="button" class="btn btn-warning btn-sm" id='review_button_{{$loop->iteration}}' onclick="buttonConfirm('review_button_{{$loop->iteration}}', '/finance/payment/review?id={{encode($payment['payment_id'], 'payment_id')}}', '确认复核所选购课记录？')">复核</button>
                    @endif
                  @else
                    <a href="/user?id={{encode($payment['review_user_id'], 'user_id')}}">{{ $payment['review_user_name'] }}</a>
                  @endif
                </td>
                <td>
                  @if($payment['review_user_name']=="")
                    <button type="button" class="btn btn-outline-danger btn-sm" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/finance/payment/delete?id={{encode($payment['payment_id'], 'payment_id')}}', '确认删除所选购课记录？')">删除</button>
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
  linkActive('financePayment');
</script>
@endsection

@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">收入支出</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">统计中心</li>
    <li class="breadcrumb-item active">收入支出</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row">
    <div class="col-12">
      <div class="card mb-4">
        <form action="" method="get" onsubmit="submitButtonDisable('submitButton1')">
          <div class="card-header p-3" style="border-bottom:0px;">
            <div class="row">
              <div class="col-1 text-center">
                <small class="text-muted font-weight-bold px-2">起始日期</small>
              </div>
              <div class="col-2">
                <input class="form-control form-control-sm datepicker" name="filter_date_start" type="text" value="{{$filters['filter_date_start']}}" autocomplete="off">
              </div>
              <div class="col-1 text-center">
                <small class="text-muted font-weight-bold px-2">截止日期</small>
              </div>
              <div class="col-2">
                <input class="form-control form-control-sm datepicker" name="filter_date_end" type="text" value="{{$filters['filter_date_end']}}" autocomplete="off">
              </div>
              <div class="col-1 text-center">
                <small class="text-muted font-weight-bold px-2">校区</small>
              </div>
              <div class="col-2">
                <select class="form-control form-control-sm" name="filter_department" data-toggle="select">
                  <option value=''>全部校区</option>
                  @foreach ($filter_departments as $department)
                    <option value="{{ $department->department_id }}" @if($filters['filter_department']==$department->department_id) selected @endif>{{ $department->department_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-1">
              </div>
              <div class="col-2">
                <input type="submit" id="submitButton1" class="btn btn-sm btn-primary btn-block" value="查询">
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">售出课时</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-primary"></span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="ni ni-single-copy-04"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{date('Y.m.d', strtotime($filters['filter_date_start']))}} ~ {{date('Y.m.d', strtotime($filters['filter_date_end']))}}</span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">授课金额</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-primary"></span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-user-clock"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{date('Y.m.d', strtotime($filters['filter_date_start']))}} ~ {{date('Y.m.d', strtotime($filters['filter_date_end']))}}</span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">晚托金额</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-primary"></span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{date('Y.m.d', strtotime($filters['filter_date_start']))}} ~ {{date('Y.m.d', strtotime($filters['filter_date_end']))}}</span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">晚托金额</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green"></span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{date('Y.m.d', strtotime($filters['filter_date_start']))}} ~ {{date('Y.m.d', strtotime($filters['filter_date_end']))}}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="card-header">
          <h3 class="mb-0">课时收入明细</h3>
        </div>
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
                    <span class="text-warning">待审核</span>
                  @else
                    <a href="/user?id={{encode($payment['review_user_id'], 'user_id')}}">{{ $payment['review_user_name'] }}</a>
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
  linkActive('link-statistic');
  navbarActive('navbar-statistic');
  linkActive('statisticIncome');
</script>
@endsection

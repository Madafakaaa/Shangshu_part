@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">收入统计</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">统计中心</li>
    <li class="breadcrumb-item active">收入统计</li>
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
              <h5 class="card-title text-uppercase text-muted mb-0">课时收入</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-primary">{{ $dashboard['dashboard_payment_total_price'] }}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-user-clock"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{ $dashboard['dashboard_dates'] }}</span>
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
              <h5 class="card-title text-uppercase text-muted mb-0">晚托收入</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-info">{{ $dashboard['dashboard_daycare_record_total_price'] }}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{ $dashboard['dashboard_dates'] }}</span>
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
              <h5 class="card-title text-uppercase text-muted mb-0">合计收入</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{ $dashboard['dashboard_total_income'] }}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{ $dashboard['dashboard_dates'] }}</span>
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
              <h5 class="card-title text-uppercase text-muted mb-0">支出金额</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-warning">{{ $dashboard['dashboard_expenditure_fee'] }}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                <i class="ni ni-single-copy-04"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{ $dashboard['dashboard_dates'] }}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="table-responsive">
          <table class="table table-hover text-center table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:50px;'>序号</th>
                <th style='width:160px;'>统计期间</th>
                <th style='width:100px;'>校区</th>
                <th style='width:120px;' class="text-right">售出课时</th>
                <th style='width:120px;' class="text-right">课时收入（元）</th>
                <th style='width:120px;' class="text-right">晚托收入（元）</th>
                <th style='width:120px;' class="text-right">共计收入</th>
                <th style='width:120px;' class="text-right">支出（元）</th>
                <th style='width:120px;' class="text-right">合计</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($departments as $department)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $dashboard['dashboard_dates'] }}</td>
                <td>{{ $department['department_name'] }}</td>
                <td class="text-right">{{ $department['payment_hour'] }}</td>
                <td class="text-right">{{ $department['payment_total_price'] }}</td>
                <td class="text-right">{{ $department['daycare_record_total_price'] }}</td>
                <td class="text-right">{{ $department['total_income'] }}</td>
                <td class="text-right">{{ $department['expenditure_fee'] }}</td>
                <td class="text-right">{{ $department['actual_price'] }}</td>
              </tr>
              @endforeach
              <tr>
                <td colspan="3"><strong>合计</strong></td>
                <td class="text-right"><strong>{{ $dashboard['dashboard_payment_hour'] }}</strong></td>
                <td class="text-right"><strong>{{ $dashboard['dashboard_payment_total_price'] }}</strong></td>
                <td class="text-right"><strong>{{ $dashboard['dashboard_daycare_record_total_price'] }}</strong></td>
                <td class="text-right"><strong>{{ $dashboard['dashboard_total_income'] }}</strong></td>
                <td class="text-right"><strong>{{ $dashboard['dashboard_expenditure_fee'] }}</strong></td>
                <td class="text-right"><strong>{{ $dashboard['dashboard_actual_price'] }}</strong></td>
              </tr>
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

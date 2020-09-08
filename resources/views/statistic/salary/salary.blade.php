@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">工资统计</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">统计中心</li>
    <li class="breadcrumb-item active">工资统计</li>
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
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">起始月份</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <input class="form-control form-control-sm monthpicker" name="filter_month_start" type="text" value="{{$filters['filter_month_start']}}" autocomplete="off">
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">截止月份</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <input class="form-control form-control-sm monthpicker" name="filter_month_end" type="text" value="{{$filters['filter_month_end']}}" autocomplete="off">
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">校区</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <select class="form-control form-control-sm" name="filter_department" data-toggle="select">
                  <option value=''>全部校区</option>
                  @foreach ($filter_departments as $department)
                    <option value="{{ $department->department_id }}" @if($filters['filter_department']==$department->department_id) selected @endif>{{ $department->department_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4">
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8">
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
              <h5 class="card-title text-uppercase text-muted mb-1">员工数量</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{$dashboard['dashboard_user_num']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="ni ni-single-02"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{$dashboard['dashboard_month']}}</span>
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
              <h5 class="card-title text-uppercase text-muted mb-1">消耗课时价值</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{$dashboard['dashboard_hour_price']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="fa fa-history"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{$dashboard['dashboard_month']}}</span>
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
              <h5 class="card-title text-uppercase text-muted mb-1">员工合计工资</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{$dashboard['dashboard_salary']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{$dashboard['dashboard_month']}}</span>
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
              <h5 class="card-title text-uppercase text-muted mb-1">收入产出比</h5>
              <span class="h1 font-weight-bold mb-0 text-green">{{$dashboard['dashboard_radio']}}%</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="ni ni-chart-bar-32"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{$dashboard['dashboard_month']}}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="table-responsive">
          <button type="button" class="btn btn-waring btn-block" onclick="table_export('table-1', '工资统计 ({{$dashboard['dashboard_month']}})')">导出表格</button>
          <table class="table table-hover text-center table-bordered" id="table-1">
            <thead class="thead-light">
              <tr>
                <th style='width:50px;'>序号</th>
                <th style='width:140px;'>月份</th>
                <th style='width:100px;'>姓名</th>
                <th style='width:60px;'>校区</th>
                <th style='width:80px;'>岗位</th>
                <th style='width:100px;'>评级</th>
                <th style='width:90px;' class="text-right">消耗课时数量</th>
                <th style='width:100px;' class="text-right">消耗课时价值</th>
                <th style='width:100px;' class="text-right">合计工资</th>
                <th style='width:100px;' class="text-right">月平均工资</th>
                <th style='width:80px;' class="text-right">收入产出比</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($users as $user)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{$dashboard['dashboard_month']}}</td>
                <td><a href="/user?id={{encode($user['user_id'], 'user_id')}}">{{ $user['user_name'] }}</a></td>
                <td>{{ $user['department_name'] }}</td>
                <td>{{ $user['position_name'] }}</td>
                <td>{{ $user['teacher_type_name'] }}</td>
                @if($user['lesson_hour_amount']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right"><span class="text-danger">{{ number_format($user['lesson_hour_amount'], 1) }} 课时</span></td>
                @endif
                @if($user['lesson_hour_price']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right"><span class="text-danger">{{ number_format($user['lesson_hour_price'], 2) }} 元</span></td>
                @endif
                @if($user['salary_actual_total']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($user['salary_actual_total'], 2) }} 元</td>
                @endif
                @if($user['salary_actual_average']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($user['salary_actual_average'], 2) }} 元</td>
                @endif
                @if($user['salary_ratio']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ round($user['salary_ratio'], 1) }}%</td>
                @endif
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
  linkActive('statisticSalary');
</script>
@endsection

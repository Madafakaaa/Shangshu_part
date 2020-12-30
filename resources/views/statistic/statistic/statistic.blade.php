@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">综合统计</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">统计中心</li>
    <li class="breadcrumb-item active">综合统计</li>
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
              <div class="col-lg-7 col-md-2 col-sm-4">
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
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="table-responsive">
          <button type="button" class="btn btn-waring btn-block" onclick="table_export('table-1', '综合统计 - {{$filters['filter_month_start']}}~{{$filters['filter_month_end']}})')">导出表格</button>
          <table class="table table-hover text-center table-bordered" id="table-1">
            <thead class="thead-light">
              <tr>
                <th style='width:60px;'>校区</th>
                <th style='width:90px;'>课时收入</th>
                <th style='width:90px;'>晚托收入</th>
                <th style='width:100px;'>合计收入</th>
                <th style='width:100px;'>课时消耗</th>
                <th style='width:90px;'>晚托消耗</th>
                <th style='width:100px;'>合计消耗</th>
                <th style='width:100px;'>工资支出</th>
                <th style='width:90px;'>其它支出</th>
                <th style='width:100px;'>合计支出</th>
                <th style='width:100px;'>毛利润</th>
                <th style='width:100px;'>纯利润</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($departments as $department)
                <tr>
                  <td>{{ $department['department_name'] }}</td>
                  <td>{{ $department['course_income'] }}</td>
                  <td>{{ $department['daycare_income'] }}</td>
                  <td>{{ $department['income'] }}</td>
                  <td>{{ $department['course_consumption'] }}</td>
                  <td>{{ $department['daycare_consumption'] }}</td>
                  <td>{{ $department['consumption'] }}</td>
                  <td>{{ $department['salary_expenditure'] }}</td>
                  <td>{{ $department['other_expenditure'] }}</td>
                  <td>{{ $department['expenditure'] }}</td>
                  <td>{{ $department['gross_profit'] }}</td>
                  <td>{{ $department['net_profit'] }}</td>
                </tr>
              @endforeach
              <tr>
                <td><strong>合计</strong></td>
                <td><strong>{{ $total['total_course_income'] }}</strong></td>
                <td><strong>{{ $total['total_daycare_income'] }}</strong></td>
                <td><strong>{{ $total['total_income'] }}</strong></td>
                <td><strong>{{ $total['total_course_consumption'] }}</strong></td>
                <td><strong>{{ $total['total_daycare_consumption'] }}</strong></td>
                <td><strong>{{ $total['total_consumption'] }}</strong></td>
                <td><strong>{{ $total['total_salary_expenditure'] }}</strong></td>
                <td><strong>{{ $total['total_other_expenditure'] }}</strong></td>
                <td><strong>{{ $total['total_expenditure'] }}</strong></td>
                <td><strong>{{ $total['total_gross_profit'] }}</strong></td>
                <td><strong>{{ $total['total_net_profit'] }}</strong></td>
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
  linkActive('statisticStatistic');
</script>
@endsection

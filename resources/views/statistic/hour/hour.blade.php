@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">剩余课时</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">统计中心</li>
    <li class="breadcrumb-item active">剩余课时</li>
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
                <small class="text-muted font-weight-bold px-2">校区</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <select class="form-control form-control-sm" name="filter_department" data-toggle="selectNoFilter">
                  <option value=''>全部校区</option>
                  @foreach ($filter_departments as $department)
                    <option value="{{ $department->department_id }}" @if($filters['filter_department']==$department->department_id) selected @endif>{{ $department->department_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">年级</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <select class="form-control form-control-sm" name="filter_grade" data-toggle="selectNoFilter">
                  <option value=''>全部年级</option>
                  @foreach ($filter_grades as $grade)
                    <option value="{{ $grade->grade_id }}" @if($filters['filter_grade']==$grade->grade_id) selected @endif>{{ $grade->grade_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">科目</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <select class="form-control form-control-sm" name="filter_subject" data-toggle="selectNoFilter">
                  <option value=''>全部科目</option>
                  @foreach ($filter_subjects as $subject)
                    <option value="{{ $subject->subject_id }}" @if($filters['filter_subject']==$subject->subject_id) selected @endif>{{ $subject->subject_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4">
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8">
                <input type="submit" id="submitButton1" class="btn btn-sm btn-primary btn-block" value="查询">
              </div>
            </div>
            <div class="row">
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">课程</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <select class="form-control form-control-sm" name="filter_course" data-toggle="select">
                  <option value=''>全部课程</option>
                  @foreach ($filter_courses as $course)
                    <option value="{{ $course->course_id }}" @if($filters['filter_course']==$course->course_id) selected @endif>{{ $course->course_name }}</option>
                  @endforeach
                </select>
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
              <h5 class="card-title text-uppercase text-muted mb-1">退款课时数量</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-danger">{{$dashboard['dashboard_hour_refunded']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                <i class="fa fa-sign-out-alt"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap"></span>
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
              <h5 class="card-title text-uppercase text-muted mb-1">消耗课时数量</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{$dashboard['dashboard_hour_used']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="fa fa-history"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap"></span>
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
              <h5 class="card-title text-uppercase text-muted mb-1">剩余课时数量</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-primary">{{$dashboard['dashboard_hour_remain']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-user-clock"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap"></span>
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
              <h5 class="card-title text-uppercase text-muted mb-1">剩余课时价值</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-primary">{{$dashboard['dashboard_hour_remain_price']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap"></span>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="table-responsive">
          <button type="button" class="btn btn-waring btn-block" onclick="table_export('table-1', '剩余课时 ({{date('Y-m-d')}})')">导出表格</button>
          <table class="table table-hover text-center table-bordered" id="table-1">
            <thead class="thead-light">
              <tr>
                <th style='width:50px;'>序号</th>
                <th style='width:70px;'>校区</th>
                <th style='width:100px;'>学生</th>
                <th style='width:60px;'>年级</th>
                <th style='width:140px;'>课程</th>
                <th style='width:60px;'>科目</th>
                <th style='width:140px;' class="text-right">课时单价</th>
                <th style='width:100px;' class="text-right">已退课时</th>
                <th style='width:100px;' class="text-right">已消耗课时数量</th>
                <th style='width:100px;' class="text-right">已消耗课时价值</th>
                <th style='width:100px;' class="text-right">剩余课时数量</th>
                <th style='width:100px;' class="text-right">剩余课时价值</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($hours as $hour)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $hour['department_name'] }}</td>
                <td><a href="/student?id={{encode($hour['student_id'], 'student_id')}}">{{ $hour['student_name'] }}</a></td>
                <td>{{ $hour['grade_name'] }}</td>
                <td>{{ $hour['course_name'] }}</td>
                <td>{{ $hour['subject_name'] }}</td>
                <td class="text-right">{{ number_format($hour['hour_unit_price'], 2) }} 元 / 课时</td>
                @if($hour['hour_refunded']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right"><span class="text-danger">{{ number_format($hour['hour_refunded']) }} 课时</span></td>
                @endif
                @if($hour['hour_used']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right"><span class="text-success">{{ number_format($hour['hour_used']) }} 课时</span></td>
                @endif
                @if($hour['hour_used_price']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right"><span class="text-success">{{ number_format($hour['hour_used_price'], 2) }} 元</span></td>
                @endif
                @if($hour['hour_remain']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($hour['hour_remain']) }} 课时</td>
                @endif
                <td class="text-right">{{ number_format($hour['hour_remain_price'], 2) }} 元</td>
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
  linkActive('statisticHour');
</script>
@endsection

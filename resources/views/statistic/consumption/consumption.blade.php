@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">课消统计</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">统计中心</li>
    <li class="breadcrumb-item active">课消统计</li>
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
                <small class="text-muted font-weight-bold px-2">起始日期</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <input class="form-control form-control-sm datepicker" name="filter_date_start" type="text" value="{{$filters['filter_date_start']}}" autocomplete="off">
              </div>
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">截止日期</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <input class="form-control form-control-sm datepicker" name="filter_date_end" type="text" value="{{$filters['filter_date_end']}}" autocomplete="off">
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
              <div class="col-lg-1 col-md-2 col-sm-4 text-center">
                <small class="text-muted font-weight-bold px-2">年级</small>
              </div>
              <div class="col-lg-2 col-md-4 col-sm-8 mb-1">
                <select class="form-control form-control-sm" name="filter_grade" data-toggle="select">
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
                <select class="form-control form-control-sm" name="filter_subject" data-toggle="select">
                  <option value=''>全部科目</option>
                  @foreach ($filter_subjects as $subject)
                    <option value="{{ $subject->subject_id }}" @if($filters['filter_subject']==$subject->subject_id) selected @endif>{{ $subject->subject_name }}</option>
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
    <div class="col-lg-4 col-md-4 col-sm-12">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-1">上课人次</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{$dashboard['dashboard_lesson_num']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="fa fa-user"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{$dashboard['dashboard_dates']}}</span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12">
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
            <span class="text-nowrap">{{$dashboard['dashboard_dates']}}</span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-1">消耗课时价值</h5>
              <span class="h1 font-weight-bold mb-0 counter-value text-green">{{$dashboard['dashboard_hour_used_price']}}</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <p class="mt-2 mb-0 text-sm">
            <span class="text-nowrap">{{$dashboard['dashboard_dates']}}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="table-responsive">
          <button type="button" class="btn btn-waring btn-block" onclick="table_export('table-1', '课消统计 ({{$dashboard['dashboard_dates']}})')">导出表格</button>
          <table class="table table-hover text-center table-bordered" id="table-1">
            <thead class="thead-light">
              <tr>
                <th style='width:50px;'>序号</th>
                <th style='width:160px;'>日期</th>
                <th style='width:80px;'>校区</th>
                <th style='width:100px;'>学生</th>
                <th style='width:80px;'>年级</th>
                <th style='width:160px;'>课程</th>
                <th style='width:80px;'>科目</th>
                <th style='width:100px;' class="text-right">上课次数（节）</th>
                <th style='width:100px;' class="text-right">消耗课时</th>
                <th style='width:100px;' class="text-right">剩余课时</th>
                <th style='width:100px;' class="text-right">消耗+剩余</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($participants as $participant)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{$dashboard['dashboard_dates']}}</td>
                <td>{{ $participant['department_name'] }}</td>
                <td><a href="/student?id={{encode($participant['student_id'], 'student_id')}}">{{ $participant['student_name'] }}</a></td>
                <td>{{ $participant['grade_name'] }}</td>
                <td>{{ $participant['course_name'] }}</td>
                <td>{{ $participant['subject_name'] }}</td>
                @if($participant['lesson_num']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($participant['lesson_num'], 0) }}</td>
                @endif
                @if($participant['total_participant_amount']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($participant['total_participant_amount'], 0) }}</td>
                @endif
                @if($participant['hour_remain']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($participant['hour_remain'], 0) }}</td>
                @endif
                @if($participant['hour_remain']+$participant['total_participant_amount']==0)
                  <td class="text-right"></td>
                @else
                  <td class="text-right">{{ number_format($participant['hour_remain']+$participant['total_participant_amount'], 0) }}</td>
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
  linkActive('statisticConsumption');
</script>
@endsection

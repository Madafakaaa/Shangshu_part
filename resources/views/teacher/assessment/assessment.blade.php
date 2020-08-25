@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">教师考核</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教师中心</li>
    <li class="breadcrumb-item active">教师考核</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="header bg-primary">
  <div class="container-fluid">
    <div class="header-body">
      <div class="row align-items-center py-3">
        <div class="col-3 text-left">
          <a href="?month={{ date('Y-m', strtotime ('-1 month', strtotime($month))) }}"><button type="button" class="btn btn-secondary btn-icon-only rounded-circle"><i class="fa fa-chevron-left"></i></button></a>
        </div>
        <div class="col-6 text-center">
          <h1 class="text-white mb-0">{{date('Y.m', strtotime($month))}}</h1>
        </div>
        <div class="col-3 text-right">
          <a href="?month={{ date('Y-m', strtotime ('+1 month', strtotime($month))) }}"><button type="button" class="btn btn-secondary btn-icon-only rounded-circle"><i class="fa fa-chevron-right"></i></button></a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid mt-3">
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
        </div>
        <hr>
        <div class="table-responsive py-3">
          <table class="table table-hover datatable-basic text-center table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:40px;'>序号</th>
                <th style='width:100px;'>姓名</th>
                <th style='width:100px;'>账号</th>
                <th style='width:100px;'>校区</th>
                <th style='width:100px;'>月份</th>
                <th style='width:100px;'>自评</th>
                <th style='width:100px;'>教务评</th>
                <th style='width:100px;'>分校长评</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($users as $user)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>
                  <a href="/user?id={{encode($user['user_id'],'user_id')}}">{{ $user['user_name'] }}</a>&nbsp;
                  @if($user['user_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                </td>
                <td>{{ $user['user_id'] }}</td>
                <td>{{ $user['department_name'] }}</td>
                <td>{{ $month }}</td>
                @if($user['month_assessment_1']=="")
                  @if($user['user_id']==Session::get('user_id'))
                    <td><a href="/teacher/assessment/self/create?month={{$month}}&user_id={{$user['user_id']}}"><button type="button" class="btn btn-warning btn-sm">评分</button></a></td>
                  @else
                    <td>-</td>
                  @endif
                @else
                  <td>{{ $user['month_assessment_1'] }}</td>
                @endif
                @if($user['month_assessment_2']=="")
                  @if(Session::get('user_position')<=4)
                    <td><a href="/teacher/assessment/staff/create?month={{$month}}&user_id={{$user['user_id']}}"><button type="button" class="btn btn-warning btn-sm">评分</button></a></td>
                  @else
                    <td>-</td>
                  @endif
                @else
                  <td>{{ $user['month_assessment_2'] }}</td>
                @endif
                @if($user['month_assessment_3']=="")
                  @if(Session::get('user_position')<=3)
                    <td><a href="/teacher/assessment/manager/create?month={{$month}}&user_id={{$user['user_id']}}"><button type="button" class="btn btn-warning btn-sm">评分</button></a></td>
                  @else
                    <td>-</td>
                  @endif
                @else
                  <td>{{ $user['month_assessment_3'] }}</td>
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
  linkActive('link-teacher');
  navbarActive('navbar-teacher');
  linkActive('teacherAssessment');
</script>
@endsection

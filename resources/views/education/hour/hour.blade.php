@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">学生课时</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">学生课时</li>
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
                <th style='width:40px;'>序号</th>
                <th style='width:120px;'>学生</th>
                <th style='width:50px;'>校区</th>
                <th style='width:50px;'>年级</th>
                <th style='width:180px;'>课程</th>
                <th style='width:60px;' class="text-right">已使用</th>
                <th style='width:60px;' class="text-right">已退款</th>
                <th style='width:60px;' class="text-right">剩余</th>
                <th style='width:160px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($hours as $hour)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>
                  @if($hour->student_gender=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($hour->student_id, 'student_id')}}">{{ $hour->student_name }}</a>
                </td>
                <td>{{ $hour->department_name }}</td>
                <td>{{ $hour->grade_name }}</td>
                <td>{{ $hour->course_name }}</td>
                <td class="text-right">{{ $hour->hour_used }} 课时</td>
                <td class="text-right">{{ $hour->hour_refunded }} 课时</td>
                @if($hour->hour_remain<=5)
                  <td class="text-right text-warning"><strong>{{ $hour->hour_remain }} 课时</strong></td>
                @else
                  <td class="text-right"><strong>{{ $hour->hour_remain }} 课时</strong></td>
                @endif
                <td>
                  <a href="/education/hour/refund/create?student_id={{encode($hour->student_id, 'student_id')}}&course_id={{encode($hour->course_id, 'course_id')}}"><button type="button" class="btn btn-outline-danger btn-sm">退费</button></a>
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
  linkActive('educationHour');
</script>
@endsection

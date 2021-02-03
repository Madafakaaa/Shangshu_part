@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">成绩档案</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">成绩档案</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/education/score/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加记录">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加记录</span>
      </a>
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
                <th style='width:35px;'>序号</th>
                <th style='width:45px;'>校区</th>
                <th style='width:70px;'>学生</th>
                <th style='width:50px;'>年级</th>
                <th style='width:280px;'>考试</th>
                <th style='width:60px;'>科目</th>
                <th style='width:80px;'>日期</th>
                <th style='width:60px;'>分数</th>
                <th style='width:60px;'>登记人</th>
                <th style='width:180px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($db_scores as $score)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $score->department_name }}</td>
                <td>
                  @if($score->student_gender=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($score->student_id, 'student_id')}}">{{ $score->student_name }}</a>
                </td>
                <td>{{ $score->grade_name }}</td>
                <td>{{ $score->score_test_name }}</td>
                <td>{{ $score->subject_name }}</td>
                <td>{{ $score->score_test_date }}</td>
                <td >{{ $score->score_mark }}</td>
                <td>
                  <a href="/user?id={{encode($score->user_id, 'user_id')}}">{{ $score->user_name }}</a>
                </td>
                <td>
                  @if($score->score_path!="")
                    <a href="/files/score/{{$score->score_path}}" target="_blank"><button type="button" class="btn btn-primary btn-sm">查看记录文件</button></a>
                  @else
                    <a><button type="button" class="btn btn-primary btn-sm" disabled>查看记录文件</button></a>
                  @endif
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/education/score/delete?id={{encode($score->score_id, 'score_id')}}', '是否确认删除所选记录？')">删除</button>
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
  linkActive('educationScore');
</script>
@endsection

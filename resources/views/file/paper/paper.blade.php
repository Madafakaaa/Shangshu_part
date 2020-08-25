@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">试卷资料</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">文档资料</li>
    <li class="breadcrumb-item active">试卷资料</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card mb-4">
        <div class="card-header p-2" style="border-bottom:0px;">
          <small class="text-muted font-weight-bold px-2">年级：</small>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_grade') {{$key}}={{$value}}& @endif @endforeach">
            <button type="button" @if(!isset($filters['filter_grade'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
          </a>
          @foreach($filter_grades as $filter_grade)
            <a href="?@foreach($filters as $key => $value) @if($key!='filter_grade') {{$key}}={{$value}}& @endif @endforeach filter_grade={{$filter_grade->grade_id}}"><button type="button" @if($filters['filter_grade']==$filter_grade->grade_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_grade->grade_name}}</button></a>
          @endforeach
        </div>
        <div class="card-header p-2" style="border-bottom:0px;">
          <small class="text-muted font-weight-bold px-2">科目：</small>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_subject') {{$key}}={{$value}}& @endif @endforeach">
            <button type="button" @if(!isset($filters['filter_subject'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
          </a>
          @foreach($filter_subjects as $filter_subject)
            <a href="?@foreach($filters as $key => $value) @if($key!='filter_subject') {{$key}}={{$value}}& @endif @endforeach filter_subject={{$filter_subject->subject_id}}"><button type="button" @if($filters['filter_subject']==$filter_subject->subject_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_subject->subject_name}}</button></a>
          @endforeach
        </div>
        <div class="card-header p-2" style="border-bottom:0px;">
          <small class="text-muted font-weight-bold px-2">学期：</small>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach">
            <button type="button" @if(!isset($filters['filter_semester'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
          </a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=1"><button type="button" @if($filters['filter_semester']=='1') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>秋季班</button></a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=2"><button type="button" @if($filters['filter_semester']=='2') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>春季班</button></a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=3"><button type="button" @if($filters['filter_semester']=='3') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>寒假班</button></a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=4"><button type="button" @if($filters['filter_semester']=='4') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>暑假班</button></a>
        </div>
        <hr>
        <div class="table-responsive pb-4">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:70px;'>序号</th>
                <th style='width:500px;'>教案名称</th>
                <th style='width:60px;'>科目</th>
                <th style='width:60px;'>年级</th>
                <th style='width:60px;'>学期</th>
                <th style='width:100px;'>上传时间</th>
                <th style='width:150px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($rows as $row)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td><a href="/file/paper/download?id={{encode($row->paper_id, 'paper_id')}}">{{ $row->paper_name }}</a></td>
                <td>{{ $row->subject_name }}</td>
                <td>{{ $row->grade_name }}</td>
                @if($row->paper_semester==1)
                  <td>秋季班</td>
                @elseif($row->paper_semester==2)
                  <td>春季班</td>
                @elseif($row->paper_semester==3)
                  <td>寒假班</td>
                @else
                  <td>暑假班</td>
                @endif
                <td>{{ date('Y-m-d', strtotime($row->paper_create_time)) }}</td>
                <td>
                  <a href="/file/paper/download?id={{encode($row->paper_id, 'paper_id')}}"><button type="button" class="btn btn-primary btn-sm">下载试卷</button></a>
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
  linkActive('link-file');
  navbarActive('navbar-file');
  linkActive('filePaper');
</script>
@endsection

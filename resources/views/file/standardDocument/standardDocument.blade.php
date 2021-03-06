@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">标准教案</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">文档资料</li>
    <li class="breadcrumb-item active">标准教案</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/file/standardDocument/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加教案">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加教案</span>
      </a>
    </div>
  </div>
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
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=秋季班"><button type="button" @if($filters['filter_semester']=='秋季班') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>秋季班</button></a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=春季班"><button type="button" @if($filters['filter_semester']=='春季班') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>春季班</button></a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=寒假班"><button type="button" @if($filters['filter_semester']=='寒假班') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>寒假班</button></a>
          <a href="?@foreach($filters as $key => $value) @if($key!='filter_semester') {{$key}}={{$value}}& @endif @endforeach filter_semester=暑假班"><button type="button" @if($filters['filter_semester']=='暑假班') class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>暑假班</button></a>
        </div>
        <hr>
        <div class="table-responsive pb-4">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:60px;'>序号</th>
                <th style='width:250px;'>教案名称</th>
                <th style='width:60px;'>科目</th>
                <th style='width:60px;'>年级</th>
                <th style='width:60px;'>学期</th>
                <th style='width:180px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($rows as $row)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td><a href="/file/standardDocument/download?id={{encode($row->standard_document_id, 'standard_document_id')}}">{{ $row->standard_document_name }}</a></td>
                <td>{{ $row->subject_name }}</td>
                <td>{{ $row->grade_name }}</td>
                <td>{{ $row->standard_document_semester }}</td>
                <td>
                  <a href="/file/standardDocument/download?id={{encode($row->standard_document_id, 'standard_document_id')}}"><button type="button" class="btn btn-primary btn-sm">教案下载</button></a>
                  <a href="/file/standardDocument/answer/download?id={{encode($row->standard_document_id, 'standard_document_id')}}"><button type="button" class="btn btn-primary btn-sm">答案下载</button></a>
                  <a href="/file/standardDocument/edit?id={{encode($row->standard_document_id, 'standard_document_id')}}"><button type="button" class="btn btn-primary btn-sm">修改</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/file/standardDocument/delete?id={{encode($row->standard_document_id, 'standard_document_id')}}', '是否确认删除所选教案？')">删除</button>
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
  linkActive('fileStandardDocument');
</script>
@endsection

@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">学生晚托</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">学生晚托</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-3">
  <div class="row mb-3">
    <div class="col-auto">
      <button type="button" class="btn btn-sm btn-outline-warning btn-round btn-icon" id='review_all_button' onclick="buttonConfirm('review_all_button', '/education/daycareRecord/review/all', '确认复核所有可复核晚托记录？')">
        <span class="btn-inner--icon"><i class="ni ni-check-bold"></i></span>
        <span class="btn-inner--text">全部复核</span>
      </button>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量删除" onclick="batchConfirm('/education/daycareRecord/delete', 'delete-button', '删除后将扣除学生课时，若学生剩余课时不足将无法扣除。是否确认删除晚托记录')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量删除</span>
      </button>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="table-responsive py-4">
          <table class="table table-hover datatable-basic text-left table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:100px;'>学生</th>
                <th style='width:100px;'>年级</th>
                <th style='width:100px;'>晚托类型</th>
                <th style='width:100px;'>开始日期</th>
                <th style='width:100px;'>结束日期</th>
                <th style='width:100px;'>晚托状态</th>
                <th style='width:60px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($daycare_records as $daycare_record)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $daycare_record->department_name }}</td>
                <td>
                  @if($daycare_record->student_gender=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($daycare_record->student_id, 'student_id')}}">{{ $daycare_record->student_name }}</a>
                </td>
                <td>{{ $daycare_record->grade_name }}</td>
                <td>{{ $daycare_record->daycare_name }}</td>
                <td>{{ $daycare_record->daycare_record_start }}</td>
                <td>{{ $daycare_record->daycare_record_end }}</td>
                @if($daycare_record->daycare_record_is_refunded==1)
                  <td><span class="text-danger">已退费</span></td>
                @elseif(date('Y-m-d')>$daycare_record->daycare_record_end)
                  <td><span class="text-warning">已过期</span></td>
                @elseif(date('Y-m-d')>=$daycare_record->daycare_record_start&&date('Y-m-d')<=$daycare_record->daycare_record_end)
                  <td><span class="text-success">使用中</span></td>
                @else
                  <td><span class="text-info">未开始</span></td>
                @endif
                <td>
                  <!-- <a href='/education/daycare/refund/create'><button type="button" class="btn btn-outline-danger btn-sm">退费</button></a> -->
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
  linkActive('educationDaycare');
</script>
@endsection

@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">晚托记录</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务中心</li>
    <li class="breadcrumb-item active">晚托记录</li>
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
                <th style='width:20px;'></th>
                <th style='width:40px;'>序号</th>
                <th style='width:60px;'>校区</th>
                <th style='width:110px;'>学生</th>
                <th style='width:100px;'>晚托类型</th>
                <th style='width:220px;'>晚托时间</th>
                <th style='width:80px;' class="text-right">合计优惠</th>
                <th style='width:80px;' class="text-right">合计金额</th>
                <th style='width:90px;'>购买日期</th>
                <th style='width:60px;'>登记用户</th>
                <th style='width:60px;'>复核用户</th>
                <th style='width:60px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($daycare_records as $daycare_record)
              <tr>
                <td>
                  @if($daycare_record['review_user_name']=="")
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($daycare_record['daycare_record_id'], 'daycare_record_id')}}'>
                      <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                    </div>
                  @endif
                </td>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $daycare_record['department_name'] }}</td>
                <td>
                  @if($daycare_record['student_gender']=="男")
                    <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                  @else
                    <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                  @endif
                  <a href="/student?id={{encode($daycare_record['student_id'], 'student_id')}}">{{ $daycare_record['student_name'] }}</a>
                </td>
                <td>{{ $daycare_record['daycare_name'] }}</td>
                <td>{{ date('y.m.d', strtotime($daycare_record['daycare_record_start'])) }} ~ {{ date('y.m.d', strtotime($daycare_record['daycare_record_end'])) }} [ {{$daycare_record['daycare_record_month']}}月 ]</td>

                @if($daycare_record['daycare_record_discount_total']==0)
                  <td class="text-right"> - </td>
                @else
                  <td class="text-right"><span class="text-danger">- {{ number_format($daycare_record['daycare_record_discount_total'],1) }} 元</span></td>
                @endif
                <td class="text-right"><strong>{{ number_format($daycare_record['daycare_record_total_price'],1) }} 元</strong></td>
                <td>{{ $daycare_record['daycare_record_date'] }}</td>
                <td>
                  <a href="/user?id={{encode($daycare_record['create_user_id'], 'user_id')}}">{{ $daycare_record['create_user_name'] }}</a>
                </td>
                <td>
                  @if($daycare_record['review_user_name']=="")
                    @if($daycare_record['create_user_id']==Session::get('user_id'))
                      <a href='#'><button type="button" class="btn btn-warning btn-sm" disabled>待复核</button></a>
                    @else
                      <button type="button" class="btn btn-warning btn-sm" id='review_button_{{$loop->iteration}}' onclick="buttonConfirm('review_button_{{$loop->iteration}}', '/education/daycareRecord/review?id={{encode($daycare_record['daycare_record_id'], 'daycare_record_id')}}', '确认复核所选晚托记录？')">复核</button>
                    @endif
                  @else
                    <a href="/user?id={{encode($daycare_record['review_user_id'], 'user_id')}}">{{ $daycare_record['review_user_name'] }}</a>
                  @endif
                </td>
                <td>
                  @if($daycare_record['review_user_name']=="")
                    <button type="button" class="btn btn-outline-danger btn-sm" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/education/daycareRecord/delete?id={{encode($daycare_record['daycare_record_id'], 'daycare_record_id')}}', '确认删除所选晚托记录？')">删除</button>
                  @endif
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
  linkActive('educationDaycareRecord');
</script>
@endsection

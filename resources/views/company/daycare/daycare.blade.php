@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">晚托设置</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">晚托设置</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/daycare/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="添加晚托">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">添加晚托</span>
      </a>
      <button class="btn btn-sm btn-outline-danger btn-round btn-icon" data-toggle="tooltip" data-original-title="批量结课" onclick="batchConfirm('/company/daycare/delete',  'delete-button', '确认批量删除所选晚托？')">
        <span class="btn-inner--icon"><i class="fas fa-trash"></i></span>
        <span class="btn-inner--text">批量结课</span>
      </button>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="table-responsive py-4">
          <table class="table table-hover datatable-basic text-center table-bordered">
            <thead class="thead-light">
              <tr>
                <th style='width:20px;'></th>
                <th style='width:40px;'>序号</th>
                <th style='width:140px;' class="text-left">名称</th>
                <th style='width:80px;'>年级</th>
                <th style='width:80px;' class="text-right">收费标准（30天）</th>
                <th style='width:80px;'>状态</th>
                <th style='width:100px;'>操作管理</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($daycares as $daycare)
              <tr>
                <td>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkbox_{{ $loop->iteration }}" name="id" value='{{encode($daycare->daycare_id, 'daycare_id')}}'>
                    <label class="custom-control-label" for="checkbox_{{ $loop->iteration }}"></label>
                  </div>
                </td>
                <td>{{ $loop->iteration }}</td>
                <td class="text-left">{{ $daycare->daycare_name }}</td>
                <td>@if($daycare->daycare_grade==0) 全年级 @else{{ $daycare->grade_name }}@endif</td>
                <td class="text-right"><strong>{{ number_format($daycare->daycare_unit_price,1) }} 元</strong></td>
                <td>
                  @if($daycare->daycare_is_available==1)
                    <span class="text-success">可购买</span>
                  @else
                    <span class="text-danger">已结课</span>
                  @endif
                </td>
                <td>
                  @if($daycare->daycare_is_available==1)
                    <a href='/company/daycare/edit?id={{encode($daycare->daycare_id, 'daycare_id')}}'><button type="button" class="btn btn-primary btn-sm">修改</button></a>
                    <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/company/daycare/delete?id={{encode($daycare->daycare_id, 'daycare_id')}}', '确认结束晚托？')">结课</button>
                  @else
                    <a href='/company/daycare/restore?id={{encode($daycare->daycare_id, 'daycare_id')}}'><button type="button" class="btn btn-outline-primary btn-sm">恢复</button></a>
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
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companyDaycare');
</script>
@endsection

@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">发票详情</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">发票详情</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-lg-8 col-md-8 col-sm-12">
      <div class="card">
        <div class="card-header">
          <h3 class="mb-0">发票详情</h3>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">申请学生</label>
                <input class="form-control" type="text" value="{{$receipt->student_name}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">校区</label>
                <input class="form-control" type="text" value="{{$receipt->department_name}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">发票抬头</label>
                <input class="form-control" type="text" value="{{$receipt->receipt_header}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">税号</label>
                <input class="form-control" type="text" value="{{$receipt->receipt_tax_number}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">金额</label>
                <input class="form-control" type="text" value="{{$receipt->receipt_fee}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">申请时间</label>
                <input class="form-control" type="text" value="{{$receipt->receipt_create_time}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">申请用户</label>
                <input class="form-control" type="text" value="{{$receipt->user_name}}" readonly>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label class="form-control-label">审批状态</label>
                @if($receipt->receipt_reviewed_status==0)
                  <input class="form-control" type="text" value="待审批" readonly>
                @elseif($receipt->receipt_reviewed_status==1)
                  <input class="form-control" type="text" value="同意" readonly>
                @else
                  <input class="form-control" type="text" value="拒绝" readonly>
                @endif
              </div>
            </div>
            <div class="col-12">
              <div class="form-group">
                <label class="form-control-label">备注</label>
                <input class="form-control" type="text" value="{{$receipt->receipt_remark}}" readonly>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12">
      <div class="card">
        <div class="card-header">
          <h3 class="mb-0">购课记录</h3>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush" data-toggle="checklist">
            @forelse ($payments as $payment)
              <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                <div class="checklist-item checklist-item-info">
                  <div class="checklist-info">
                    <h5 class="checklist-title mb-0">{{$payment->course_name}} [ {{$payment->payment_hour}}课时 ]</h5>
                    <small>{{$payment->payment_total_price}}元 | {{$payment->payment_method}} | {{$payment->payment_date}}</small>
                  </div>
                </div>
              </li>
            @empty
              <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                <div class="checklist-item checklist-item-danger">
                  <div class="checklist-info">
                    <h5 class="checklist-title mb-0 text-danger">没有开发票购课记录</h5>
                  </div>
                </div>
              </li>
            @endforelse
          </ul>
        </div>
      </div>
      <div class="card">
        <div class="card-header">
          <h3 class="mb-0">晚托记录</h3>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush" data-toggle="checklist">
            @forelse ($daycare_records as $daycare_record)
              <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                <div class="checklist-item checklist-item-info">
                  <div class="checklist-info">
                    <h5 class="checklist-title mb-0">{{$daycare_record->daycare_name}} [ {{$daycare_record->daycare_record_month}}月 ]</h5>
                    <small>{{$daycare_record->daycare_record_total_price}}元 | {{$daycare_record->daycare_record_method}} | {{$daycare_record->daycare_record_date}}</small>
                  </div>
                </div>
              </li>
            @empty
              <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                <div class="checklist-item checklist-item-danger">
                  <div class="checklist-info">
                    <h5 class="checklist-title mb-0 text-danger">没有开发票晚托记录</h5>
                  </div>
                </div>
              </li>
            @endforelse
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-finance');
  navbarActive('navbar-finance');
  linkActive('financeReceipt');
</script>
@endsection

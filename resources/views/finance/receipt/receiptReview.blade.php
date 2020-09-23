@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">发票审批</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item"><a href="/finance/receipt">发票申请记录</a></li>
    <li class="breadcrumb-item active">发票审批</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row">
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
    <div class="col-lg-8 col-md-8 col-sm-12">
      <div class="card">
        <form action="/finance/receipt/review/store" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
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
                  <label class="form-control-label">发票抬头<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="receipt_header" value="{{$receipt->receipt_header}}" autocomplete='off' maxlength="40" required>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">税号<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="receipt_tax_number" value="{{$receipt->receipt_tax_number}}" autocomplete='off' maxlength="20" required>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">金额<span style="color:red">*</span></label>
                  <input class="form-control" type="number" name="receipt_fee" value="{{$receipt->receipt_fee}}" autocomplete='off' min="0" required step="0.01">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">审批结果<span style="color:red">*</span></label>
                  <select class="form-control" name="receipt_reviewed_status" data-toggle="select" required>
                    <option value=''>请选择审批结果...</option>
                    <option value='1'>同意</option>
                    <option value='2'>拒绝</option>
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">开票时间<span style="color:red">*</span></label>
                  <input class="form-control datepicker" name="receipt_date" type="text" value="{{ date('Y-m-d') }}" required>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">开票单位<span style="color:red">*</span></label>
                  <select class="form-control" name="receipt_corporation" data-toggle="selectNoFilter" required>
                    <option value=''>请选择开票单位...</option>
                    @foreach ($corporations as $corporation)
                      <option value="{{ $corporation->corporation_id }}">{{ $corporation->corporation_name }} [ 额度：{{$corporation->corporation_receipt_amount}}元 ]</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">发票号<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="receipt_number" placeholder="发票号..." autocomplete='off' maxlength="30" required>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label class="form-control-label">备注<span style="color:red">*</span></label>
                  <textarea class="form-control" name="receipt_remark" rows="5" resize="none" maxlength="50" required>{{$receipt->receipt_remark}}</textarea>
                </div>
              </div>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-lg-8 col-md-6 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-6 col-sm-12">
                <input type="hidden" name="receipt_id" value="{{$receipt->receipt_id}}">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
              </div>
            </div>
          </div>
        </form>
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

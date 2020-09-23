@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">发票申请</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">财务中心</li>
    <li class="breadcrumb-item"><a href="/finance/receipt">发票申请记录</a></li>
    <li class="breadcrumb-item active">发票申请</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <form action="/finance/receipt/store" method="post" onsubmit="submitButtonDisable('submitButton1')">
    @csrf
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-6 col-sm-12">
        <div class="card">
          <div class="card-header">
            <div class="row">
              <div class="col-6 px-4 mb-2">
                <h3 class="mb-0">可开发票购课记录</h3>
              </div>
              <div class="col-3 px-4 mb-2">
                <button type="button" class="btn btn-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="checkAll('payment');">全选</button>
              </div>
              <div class="col-3 px-4 mb-2">
                <button type="button" class="btn btn-outline-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="uncheckAll('payment');">全不选</button>
              </div>
            </div>
          </div>
          <div class="card-body py-1" style="height:250px; overflow:auto;">
            <ul class="list-group list-group-flush" data-toggle="checklist">
              @forelse ($payments as $payment)
                <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                  <div class="checklist-item checklist-item-info">
                    <div class="checklist-info">
                      <h5 class="checklist-title mb-0">{{$payment->course_name}} [ {{$payment->payment_hour}}课时 ]</h5>
                      <small>{{$payment->payment_total_price}}元 | {{$payment->payment_method}} | {{$payment->payment_date}}</small>
                    </div>
                    <div>
                      <div class="custom-control custom-checkbox custom-checkbox-info">
                        <input class="custom-control-input payment" id="payment_{{$payment->payment_id}}" type="checkbox" name="payments[]" value="{{$payment->payment_id}}">
                        <label class="custom-control-label" for="payment_{{$payment->payment_id}}"></label>
                      </div>
                    </div>
                  </div>
                </li>
              @empty
                <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                  <div class="checklist-item checklist-item-danger">
                    <div class="checklist-info">
                      <h5 class="checklist-title mb-0 text-danger">没有可开发票购课记录</h5>
                    </div>
                  </div>
                </li>
              @endforelse
            </ul>
          </div>
        </div>
        <div class="card">
          <div class="card-header">
            <div class="row">
              <div class="col-6 px-4 mb-2">
                <h3 class="mb-0">可开发票购课记录</h3>
              </div>
              <div class="col-3 px-4 mb-2">
                <button type="button" class="btn btn-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="checkAll('daycare_record');">全选</button>
              </div>
              <div class="col-3 px-4 mb-2">
                <button type="button" class="btn btn-outline-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="uncheckAll('daycare_record');">全不选</button>
              </div>
            </div>
          </div>
          <div class="card-body py-1" style="height:250px; overflow:auto;">
            <ul class="list-group list-group-flush" data-toggle="checklist">
              @forelse ($daycare_records as $daycare_record)
                <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                  <div class="checklist-item checklist-item-info">
                    <div class="checklist-info">
                      <h5 class="checklist-title mb-0">{{$daycare_record->daycare_name}} [ {{$daycare_record->daycare_record_month}}月 ]</h5>
                      <small>{{$daycare_record->daycare_record_total_price}}元 | {{$daycare_record->daycare_record_method}} | {{$daycare_record->daycare_record_date}}</small>
                    </div>
                    <div>
                      <div class="custom-control custom-checkbox custom-checkbox-info">
                        <input class="custom-control-input daycare_record" id="payment_{{$daycare_record->daycare_record_id}}" type="checkbox" name="daycare_records[]" value="{{$daycare_record->daycare_record_id}}">
                        <label class="custom-control-label" for="payment_{{$daycare_record->daycare_record_id}}"></label>
                      </div>
                    </div>
                  </div>
                </li>
              @empty
                <li class="checklist-entry list-group-item flex-column align-items-start py-2 px-2">
                  <div class="checklist-item checklist-item-danger">
                    <div class="checklist-info">
                      <h5 class="checklist-title mb-0 text-danger">没有可开发票晚托记录</h5>
                    </div>
                  </div>
                </li>
              @endforelse
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12">
        <div class="card">
          <div class="card-header">
            <h3 class="mb-0">发票信息</h3>
          </div>
          <div class="card-body py-3">
            <div class="row">
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">学生</label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" value="{{$student->student_name}}" readonly>
                    <input type="hidden" name="receipt_student" value="{{$student->student_id}}">
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">校区</label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" value="{{$student->department_name}}" readonly>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">抬头<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" name="receipt_header" placeholder="请输入发票抬头..." autocomplete='off' maxlength="40" required>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">税号<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <input class="form-control" type="text" name="receipt_tax_number" placeholder="请输入税号..." autocomplete='off' maxlength="20" required>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group row">
                  <label class="col-md-2 col-form-label form-control-label">备注<span style="color:red">*</span></label>
                  <div class="col-md-10">
                    <textarea class="form-control" name="receipt_remark" rows="5" resize="none" placeholder="发票备注..." maxlength="50" required></textarea>
                  </div>
                </div>
              </div>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-6 my-2"></div>
              <div class="col-6">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-finance');
  navbarActive('navbar-finance');
  linkActive('financeReceipt');
</script>
@endsection

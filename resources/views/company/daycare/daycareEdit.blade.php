@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">修改晚托</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/daycare">晚托设置</a></li>
    <li class="breadcrumb-item active">修改晚托</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12 card-wrapper ct-example">
      <div class="card">
        <form action="/company/daycare/update?id={{encode($daycare->daycare_id, 'daycare_id')}}" method="post" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">修改晚托</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">晚托名称<span style="color:red">*</span></label>
                  <input class="form-control" type="text" name="input_daycare_name" value="{{ $daycare->daycare_name }}" autocomplete='off' required maxlength="10">
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">晚托年级<span style="color:red">*</span></label>
                  <select class="form-control" name="input_daycare_grade" data-toggle="selectNoFilter">
                    <option value='0'>全年级</option>
                    @foreach ($grades as $grade)
                      <option value="{{ $grade->grade_id }}" @if($daycare->daycare_grade==$grade->grade_id) selected @endif>{{ $grade->grade_name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  <label class="form-control-label">收费标准（元 / 30天）</label>
                  <input class="form-control" type="number" name="input_daycare_unit_price" value="{{ $daycare->daycare_unit_price }}" autocomplete='off' required min="0.00" step="0.01">
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="javascript:history.go(-1)" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="input_daycare_id" value="{{ $daycare->daycare_id }}" readonly>
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
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companyDaycare');
</script>
@endsection

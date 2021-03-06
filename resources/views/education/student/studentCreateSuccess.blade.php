@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加学生</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教务运营</li>
    <li class="breadcrumb-item"><a href="/education/student">学生管理</a></li>
    <li class="breadcrumb-item active">添加学生</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-6">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10 col-sm-12">
      <div class="card p-4">
          <!-- Card body -->
          <div class="card-body pt-2">
            <div class="row justify-content-center my-3">
              <div class="col-4 text-center">
                <img src="{{ asset(_ASSETS_.'/img/icons/success.png') }}" style="height:150px;">
              </div>
            </div>
            <div class="row justify-content-center my-3">
              <div class="col-3 text-center">
                <h1 class="my-2 text-success">学生添加成功</h1>
              </div>
            </div>
            <hr>
            <div class="row mt-4">
              <div class="col-lg-3 col-md-6 col-sm-12">
                <a href="/education/student/payment/create?id={{encode($student_id, 'student_id')}}" ><button type="button" class="btn btn-outline-primary btn-block">购买课时</button></a>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-12">
                <a href="/student?id={{encode($student_id, 'student_id')}}" ><button type="button" class="btn btn-outline-primary btn-block">学生详情</button></a>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-12">
                <a href="/education/student"><button type="button" class="btn btn-outline-primary btn-block">学生管理</button></a>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-12">
                <a href="/education/student/create"><button type="button" class="btn btn-outline-primary btn-block">继续添加学生</button></a>
              </div>
            </div>
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
  linkActive('educationStudent');
</script>
@endsection

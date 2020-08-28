@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">添加班级</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教学中心</li>
    <li class="breadcrumb-item"><a href="/education/class">班级管理</a></li>
    <li class="breadcrumb-item active">添加班级</li>
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
                <h1 class="my-2 text-success">添加班级成功</h1>
              </div>
            </div>
            <hr>
            <div class="row mt-4">
              <div class="col-lg-4 col-md-4 col-sm-12">
                <a href="/education/class"><button type="button" class="btn btn-outline-primary btn-block">班级管理</button></a>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-12">
                <a href="/class?id={{encode($class_id, 'class_id')}}"><button type="button" class="btn btn-outline-primary btn-block">班级详情</button></a>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-12">
                <a href="/education/class/lesson/create?id={{encode($class_id, 'class_id')}}"><button type="button" class="btn btn-outline-primary btn-block">继续点名</button></a>
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
  linkActive('educationClass');
</script>
@endsection

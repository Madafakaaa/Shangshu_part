@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">修改教师评级</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/teacherType">教师评级</a></li>
    <li class="breadcrumb-item active">修改教师评级</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <form action="/company/teacherType/update" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">修改教师评级</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-hover text-center table-bordered">
                <tbody>
                  <td style='width:160px;'>教师评级<span style="color:red">*</span></td>
                  <td style='width:400px;'><input class="form-control" type="text" name="input_teacher_type_name" value="{{$teacher_type->teacher_type_name}}" autocomplete='off' required maxlength="10"></td>
                </tbody>
              </table>
              <table class="table table-hover text-center table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th colspan="7">课时费标准</th>
                  </tr>
                  <tr>
                    <th style='width:80px;'>年级</th>
                    <th style='width:80px;'>1人课</th>
                    <th style='width:80px;'>2人课</th>
                    <th style='width:80px;'>3人课</th>
                    <th style='width:80px;'>4人课</th>
                    <th style='width:80px;'>5人课</th>
                    <th style='width:80px;'>6人课</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($grades as $grade)
                    <tr>
                      <td>{{ $grade->grade_name }}</td>
                      @for ($i = 1; $i <= 6; $i++)
                        <td><input class="form-control form-control form-control-sm" name="input_{{$grade->grade_id}}_{{$i}}" type="number" value="{{$deductions[$grade->grade_id][$i]}}" min='0' required></td>
                      @endfor
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
            <hr class="my-3">
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="/company/teacherType" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="input_teacher_type_id" value="{{$teacher_type->teacher_type_id}}">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="提交">
              </div>
            </div>
          </div>
        <form>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-company');
  navbarActive('navbar-company');
  linkActive('companyTeacherType');
</script>
@endsection

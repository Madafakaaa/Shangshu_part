@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">用户权限</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item"><a href="/company/user">用户管理</a></li>
    <li class="breadcrumb-item active">用户权限</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-8 col-sm-12">
      <div class="card">
        <form action="/company/user/access/update" method="post" onsubmit="submitButtonDisable('submitButton1')">
          @csrf
          <div class="card-header">
            <h3 class="mb-0">用户权限</h3>
          </div>
          <!-- Card body -->
          <div class="card-body">
            <div class="row">
              <div class="col-2 text-right">
                <label class="form-control-label">用户</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" value="{{ $user->user_name }}" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label">校区</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" value="{{ $user->department_name }}" readonly>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-2 text-right">
                <label class="form-control-label">级别</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" value="{{ $user->position_name }}" readonly>
                </div>
              </div>
              <div class="col-2 text-right">
                <label class="form-control-label">评级</label>
              </div>
              <div class="col-4 px-2 mb-2">
                <div class="form-group mb-1">
                  <input class="form-control form-control-sm" value="{{ $user->teacher_type_name }}" readonly>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-2 text-right">
                <label class="form-control-label">校区权限</label>
              </div>
              <div class="col-8 px-4 mb-2">
                <div class="form-group mb-1">
                  <div class="custom-control custom-checkbox">
                    <div class="row">
                      @foreach($department_array as $department)
                        <div class="col-3 pl-2 pr-2 mb-2">
                          <input type="checkbox" class="custom-control-input department" id="department_{{ $loop->iteration }}" name="departments[]" value="{{ $department[0] }}" @if($department[2]==1) checked @endif>
                          <label class="custom-control-label" for="department_{{ $loop->iteration }}">{{ $department[1] }}</label>
                        </div>
                      @endforeach
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-2 px-4 mb-2">
                <div class="row">
                  <div class="col-12 mb-2">
                    <button type="button" class="btn btn-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="checkAll('department');">全选</button>
                  </div>
                  <div class="col-12 mb-2">
                    <button type="button" class="btn btn-outline-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="uncheckAll('department');">全不选</button>
                  </div>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-2 text-right">
                <label class="form-control-label">主页权限</label>
              </div>
              <div class="col-8 px-4 mb-2">
                <div class="form-group mb-1">
                  <div class="custom-control custom-checkbox">
                    <div class="row">
                      @foreach($dashboard_accesses as $dashboard_access)
                        <div class="col-6 pl-2 pr-2 mb-2">
                          <input type="checkbox" class="custom-control-input dashboard" id="dashboard_{{ $loop->iteration }}" name="dashboards[]" value="{{ $dashboard_access->dashboard_access_name }}" @if(in_array($dashboard_access->dashboard_access_name, $user_dashboards)) checked @endif>
                          <label class="custom-control-label" for="dashboard_{{ $loop->iteration }}">{{ $dashboard_access->dashboard_access_name }}</label>
                        </div>
                      @endforeach
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-2 px-4 mb-2">
                <div class="row">
                  <div class="col-12 mb-2">
                    <button type="button" class="btn btn-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="checkAll('dashboard');">全选</button>
                  </div>
                  <div class="col-12 mb-2">
                    <button type="button" class="btn btn-outline-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="uncheckAll('dashboard');">全不选</button>
                  </div>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-2 text-right">
                <label class="form-control-label">功能权限</label>
              </div>
            </div>
            <div class="row">
              <div class="col-12 px-4 mb-2">
                <div class="form-group mb-1">
                  <div class="custom-control custom-checkbox">
                    @foreach($accesses as $category => $pages)
                      <div class="row">
                        <div class="col-3 mb-2 text-center">
                          {{ $category }}
                        </div>
                        <div class="col-2 mb-2">
                          <button type="button" class="btn btn-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="checkAll('{{ $category }}');">全选</button>
                        </div>
                        <div class="col-2 mb-2">
                          <button type="button" class="btn btn-outline-primary btn-block btn-sm" style="white-space:nowrap; overflow:hidden;" onclick="uncheckAll('{{ $category }}');">全不选</button>
                        </div>
                      </div>
                      <div class="row">
                        @foreach($pages as $page => $features)
                          <div class="col-3 mb-2 text-center">
                            {{ $page }}
                          </div>
                          <div class="col-9 mb-2">
                            <div class="row">
                              @foreach($features as $feature)
                                <div class="col-2 mb-2">
                                  <input type="checkbox" class="custom-control-input {{ $category }} {{ $page }}" id="label_{{ $feature['access_url'] }}" name="accesses[]" value="{{ $feature['access_url'] }}" @if(in_array($feature['access_url'], $user_accesses)) checked @endif>
                                  <label class="custom-control-label" for="label_{{ $feature['access_url'] }}">{{ $feature['access_feature'] }}</label>
                                </div>
                              @endforeach
                            </div>
                          </div>
                        @endforeach
                      </div>
                      <hr>
                    @endforeach
                  </div>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-lg-4 col-md-5 col-sm-12">
                <a href="/company/user" ><button type="button" class="btn btn-outline-primary btn-block">返回</button></a>
              </div>
              <div class="col-lg-4 col-md-2 col-sm-12 my-2"></div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <input type="hidden" name="user_id" value="{{$user->user_id}}">
                <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="修改">
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
  linkActive('companyUser');
</script>
@endsection

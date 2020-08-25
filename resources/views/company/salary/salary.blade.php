@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">员工工资</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">公司管理</li>
    <li class="breadcrumb-item active">员工工资</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row mb-3">
    <div class="col-auto">
      <a href="/company/salary/create" class="btn btn-sm btn-neutral btn-round btn-icon" data-toggle="tooltip" data-original-title="结算工资">
        <span class="btn-inner--icon"><i class="fas fa-user-edit"></i></span>
        <span class="btn-inner--text">结算工资</span>
      </a>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="table-responsive py-4">
          <table class="table table-hover datatable-basic text-center table-bordered">
            <thead class="thead-light">
              <tr>
                <th rowspan="2" style='width:30px;'><strong>序号</strong></th>
                <th rowspan="2" style='width:50px;'><strong>月份</strong></th>
                <th rowspan="2" style='width:55px;'><strong>姓名</strong></th>
                <th rowspan="2" style='width:50px;'><strong>基本</strong></th>
                <th rowspan="2" style='width:45px;'><strong>住房</strong></th>
                <th rowspan="2" style='width:50px;'><strong>课时</strong></th>
                <th rowspan="2" style='width:50px;'><strong>绩效</strong></th>
                <th rowspan="2" style='width:50px;'><strong>课消</strong></th>
                <th rowspan="2" style='width:70px;'><strong>应发</strong></th>
                <th colspan="4" style='width:240px;'><strong>代扣款项</strong></th>
                <th colspan="2" style='width:110px;'><strong>六项专项扣除</strong></th>
                <th rowspan="2" style='width:45px;'><strong>处罚</strong></th>
                <th rowspan="2" style='width:45px;'><strong>所得税</strong></th>
                <th rowspan="2" style='width:70px;'><strong>实发</strong></th>
              </tr>
              <tr>
                <th><strong>养老</strong></th>
                <th><strong>医疗</strong></th>
                <th><strong>失业</strong></th>
                <th><strong>公积金</strong></th>
                <th><strong>子女</strong></th>
                <th><strong>老人</strong></th>
              </tr>
            </thead>
            <tbody>
              @foreach ($salaries as $salary)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ date('y-m', strtotime($salary->salary_month)) }}</td>
                <td class="text-right"><a href="/user?id={{encode($salary->user_id, 'user_id')}}">{{ $salary->user_name }}</a></td>
                <!-- 基本 -->
                @if($salary->salary_basic!=0)
                  <td class="text-right">{{ floatval($salary->salary_basic) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 住房 -->
                @if($salary->salary_housing!=0)
                  <td class="text-right">{{ floatval($salary->salary_housing) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 课时 -->
                @if($salary->salary_lesson!=0)
                  <td class="text-right">{{ floatval($salary->salary_lesson) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 绩效 -->
                @if($salary->salary_performance!=0)
                  <td class="text-right">{{ floatval($salary->salary_performance) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 课消 -->
                @if($salary->salary_commission!=0)
                  <td class="text-right">{{ floatval($salary->salary_commission) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 应发 -->
                <td class="text-right">{{ floatval($salary->salary_total) }}</td>
                <!-- 养老 -->
                @if($salary->salary_pension!=0)
                  <td class="text-right">{{ floatval($salary->salary_pension) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 医疗 -->
                @if($salary->salary_medical!=0)
                  <td class="text-right">{{ floatval($salary->salary_medical) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 失业 -->
                @if($salary->salary_unemployment!=0)
                  <td class="text-right">{{ floatval($salary->salary_unemployment) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 公积金 -->
                @if($salary->salary_provident!=0)
                  <td class="text-right">{{ floatval($salary->salary_provident) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 子女 -->
                @if($salary->salary_children!=0)
                  <td class="text-right">{{ floatval($salary->salary_children) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 老人 -->
                @if($salary->salary_elderly!=0)
                  <td class="text-right">{{ floatval($salary->salary_elderly) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 处罚 -->
                @if($salary->salary_penalty!=0)
                  <td class="text-right">{{ floatval($salary->salary_penalty) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 所得税 -->
                @if($salary->salary_tax!=0)
                  <td class="text-right">{{ floatval($salary->salary_tax) }}</td>
                @else
                  <td class="text-right"></td>
                @endif
                <!-- 实发 -->
                <td class="text-right">{{ floatval($salary->salary_actual_total) }}</td>
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
  linkActive('companySalary');
</script>
@endsection

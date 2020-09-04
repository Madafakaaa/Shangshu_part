@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">上海尚书教育</h2>
@endsection

@section('content')
<div class="container-fluid mt-3">
  @if(Session::get('user_id')=='admi0001')
  <form name="form1" id="form1" method="get" action="" enctype="multipart/form-data">
    <div class="row">
      <div class="col-lg-9 col-md-12">
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="form-group mb-3">
          <select class="form-control form-control-sm" name="filter_department" data-toggle="selectNoFilter" onChange="form_submit('form1')">
            <option value=''>全部校区</option>
            @foreach ($filter_departments as $department)
              <option value="{{ $department->department_id }}" @if($filters['filter_department']==$department->department_id) selected @endif>{{ $department->department_name }}</option>
            @endforeach
          </select>
        </div>
      </div>
    </div>
  </form>
  <div class="row">
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-success h3 m-0">售课数量</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-success display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_hour_amount']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-success text-white rounded-circle shadow">
                <i class="ni ni-money-coins"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-success h3 m-0">售课收入</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-success display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_hour_price']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-success text-white rounded-circle shadow">
                <i class="fa fa-yen-sign"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-info h3 m-0">晚托收入</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-info display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_daycare_price']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                <i class="fa fa-yen-sign"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-warning h3 m-0">合计收入</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-warning display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_total_price']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                <i class="fa fa-yen-sign"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-primary h3 m-0">上课次数</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-primary display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_lesson_num']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-chalkboard-teacher"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-primary h3 m-0">上课人次</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-primary display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_lesson_student_num']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-users"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-primary h3 m-0">消耗课时</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-primary display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_consumption_hour_amount']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-history"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card mb-3">
        <div class="card-body p-4">
          <div class="text-primary h3 m-0">消耗价值</div>
          <div class="d-flex">
            <div class="py-1 m-0 text-center text-primary display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_consumption_hour_price']}}</span></div>
            <div class="ml-auto">
              <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                <i class="fa fa-yen-sign"></i>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-flex">
            <div class="mr-auto"><small>{{$filters['filter_month']}}</small></div>
            <div class="ml-auto"><small><i class="fa fa-map-marker-alt text-muted"></i> {{$dashboard['dashboard_department_name']}}</small></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  @endif
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('home');
</script>
@endsection

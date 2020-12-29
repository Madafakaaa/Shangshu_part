@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">上海尚书教育</h2>
@endsection

@section('content')
<div class="container-fluid mt-3">
  @if(in_array("收入/课消数据统计", Session::get('user_dashboards')))
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
            <div class="text-primary h3 m-0">课时价值</div>
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
      <div class="col-lg-3 col-md-6">
        <div class="card mb-3">
          <div class="card-body p-4">
            <div class="text-primary h3 m-0">消耗晚托</div>
            <div class="d-flex">
              <div class="py-1 m-0 text-center text-primary display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_consumption_daycare_price']}}</span></div>
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
      <div class="col-lg-3 col-md-6">
        <div class="card mb-3">
          <div class="card-body p-4">
            <div class="text-primary h3 m-0">合计消耗</div>
            <div class="d-flex">
              <div class="py-1 m-0 text-center text-primary display-3 counter-value"><span class="counter-value">{{$dashboard['dashboard_consumption_total_price']}}</span></div>
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

  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h5 class="h3 mb-0">通知文件</h5>
        </div>
        <div class="card-body p-0">
          <ul class="list-group list-group-flush" data-toggle="checklist">
            @foreach ($announcements as $announcement)
              <li class="checklist-entry list-group-item flex-column align-items-start py-4 px-4">
                <div class="checklist-item checklist-item-success">
                  <div class="checklist-info">
                    <h5 class="checklist-title mb-0"><a href="/files/announcement/{{ $announcement->announcement_path }}" target="_blank">{{ $announcement->announcement_name }}</a></h5>
                    <small>{{ date('Y-m-d', strtotime($announcement->announcement_create_time)) }}</small>
                  </div>
                  <div>
                    <a href="/files/announcement/{{ $announcement->announcement_path }}" target="_blank"><button type="button" class="btn btn-primary btn-sm">预览</button></a>
                    <a href='/teacher/announcement/download?id={{encode($announcement->announcement_id, 'announcement_id')}}'><button type="button" class="btn btn-primary btn-sm">下载文件</button></a>
                  </div>
                </div>
              </li>
            @endforeach
          </ul>
        </div>
      </div>
    </div>
  </div>

  @if(in_array("发票申请审批", Session::get('user_dashboards')))
    <div class="row">
      <div class="col-12">
        <div class="card mb-3">
          <div class="card-header p-3">
            <h4 class="mb-0">发票申请</h4>
          </div>
          <div class="table-responsive" style="max-height:220px;">
            <table class="table table-hover table-bordered">
              <thead class="thead-light">
                <tr>
                  <th style='width:40px;'>序号</th>
                  <th style='width:70px;'>学生</th>
                  <th style='width:50px;'>校区</th>
                  <th style='width:200px;'>抬头</th>
                  <th style='width:180px;'>税号</th>
                  <th style='width:80px;' class="text-right">金额</th>
                  <th style='width:65px;'>申请日期</th>
                  <th style='width:65px;'>申请用户</th>
                  <th style='width:60px;'>操作管理</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($receipts as $receipt)
                <tr>
                  <td>{{ $loop->iteration }}</td>
                  <td>
                    @if($receipt->student_gender=="男")
                      <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                    @else
                      <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                    @endif
                    <a href="/student?id={{encode($receipt->student_id, 'student_id')}}">{{ $receipt->student_name }}</a>
                  </td>
                  <td>{{ $receipt->department_name }}</td>
                  <td>{{ $receipt->receipt_header }}</td>
                  <td>{{ $receipt->receipt_tax_number }}</td>
                  <td class="text-right">{{ $receipt->receipt_fee }} 元</td>
                  <td>{{ date('y-m-d', strtotime($receipt->receipt_create_time)) }}</td>
                  <td><a href="/user?id={{encode($receipt->user_id, 'user_id')}}">{{ $receipt->user_name }}</a></td>
                  <td>
                    <!-- <a href="/receipt?id={{encode($receipt->receipt_id, 'receipt_id')}}" target="_blank"><button type="button" class="btn btn-primary btn-sm">详情</button></a>-->
                    @if($receipt->receipt_reviewed_status==0)
                      <a href="/finance/receipt/review?id={{encode($receipt->receipt_id, 'receipt_id')}}"><button type="button" class="btn btn-warning btn-sm">审批</button></a>
                    @endif
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  @endif
  @if(in_array("课时/晚托退款申请", Session::get('user_dashboards')))
    <div class="row">
      <div class="col-12">
        <div class="card mb-3">
          <div class="card-header p-3">
            <h4 class="mb-0">课时退费申请</h4>
          </div>
          <div class="table-responsive" style="max-height:220px;">
            <table class="table table-hover table-bordered">
              <thead>
                <tr>
                  <th style='width:40px;'>序号</th>
                  <th style='width:60px;'>校区</th>
                  <th style='width:100px;'>学生</th>
                  <th style='width:120px;'>退费课程</th>
                  <th style='width:120px;' class="text-right">退款数量</th>
                  <th style='width:80px;' class="text-right">退款金额</th>
                  <th style='width:100px;'>申请日期</th>
                  <th style='width:100px;'>申请用户</th>
                  <th style='width:100px;'>操作管理</th>
                </tr>
              </thead>
              <tbody>
                @forelse($hour_refunds as $hour_refund)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $hour_refund->department_name }}</td>
                    <td>
                      @if($hour_refund->student_gender=="男")
                        <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                      @else
                        <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                      @endif
                      <a href="/student?id={{encode($hour_refund->student_id, 'student_id')}}">{{ $hour_refund->student_name }}</a>
                    </td>
                    <td>{{ $hour_refund->course_name }}</td>
                    <td class="text-right">{{ $hour_refund->hour_refund_amount }} 课时</td>
                    <td class="text-right"><strong>{{ number_format($hour_refund->hour_refund_fee,1) }} 元</strong></td>
                    <td>{{ $hour_refund->hour_refund_date }}</td>
                    <td>
                      <a href="/user?id={{encode($hour_refund->user_id, 'user_id')}}">{{ $hour_refund->user_name }}</a>
                    </td>
                    <td>
                      <a href="/finance/refund/payment/review?id={{encode($hour_refund->hour_refund_id, 'hour_refund_id')}}"><button type="button" class="btn btn-warning btn-sm">审核</button></a>
                    </td>
                  </tr>
                @empty
                   <tr><td colspan="9" class="text-center text-success"><strong>当前无申请</strong></td></tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card mb-3">
          <div class="card-header p-3">
            <h4 class="mb-0">晚托退费申请</h4>
          </div>
          <div class="table-responsive" style="max-height:220px;">
            <table class="table table-hover table-bordered">
              <thead>
                <tr>
                  <th style='width:40px;'>序号</th>
                  <th style='width:60px;'>校区</th>
                  <th style='width:100px;'>学生</th>
                  <th style='width:120px;'>退费晚托</th>
                  <th style='width:60px;'>开始日期</th>
                  <th style='width:60px;'>截止日期</th>
                  <th style='width:80px;' class="text-right">退款金额</th>
                  <th style='width:100px;'>申请日期</th>
                  <th style='width:100px;'>申请用户</th>
                  <th style='width:100px;'>操作管理</th>
                </tr>
              </thead>
              <tbody>
                @forelse($daycare_refunds as $daycare_refund)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $daycare_refund->department_name }}</td>
                    <td>
                      @if($daycare_refund->student_gender=="男")
                        <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                      @else
                        <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                      @endif
                      <a href="/student?id={{encode($daycare_refund->student_id, 'student_id')}}">{{ $daycare_refund->student_name }}</a>
                    </td>
                    <td>{{ $daycare_refund->daycare_name }}</td>
                    <td>{{ date('y-m-d', strtotime($daycare_refund->daycare_record_start)) }}</td>
                    <td>{{ date('y-m-d', strtotime($daycare_refund->daycare_record_end)) }}</td>
                    <td class="text-right"><strong>{{ number_format($daycare_refund->daycare_refund_fee,1) }} 元</strong></td>
                    <td>{{ $daycare_refund->daycare_refund_date }}</td>
                    <td>
                      <a href="/user?id={{encode($daycare_refund->user_id, 'user_id')}}">{{ $daycare_refund->user_name }}</a>
                    </td>
                    <td>
                      <a href="/finance/refund/daycare/review?id={{encode($daycare_refund->daycare_refund_id, 'daycare_refund_id')}}"><button type="button" class="btn btn-warning btn-sm">审核</button></a>
                    </td>
                  </tr>
                @empty
                   <tr><td colspan="10" class="text-center text-success"><strong>当前无申请</strong></td></tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  @endif
  @if(in_array("课时/晚托剩余提醒", Session::get('user_dashboards')))
    <div class="row">
      <div class="col-12">
        <div class="card mb-3">
          <div class="card-header p-3">
            <h4 class="mb-0">剩余课时提醒</h4>
          </div>
          <div class="table-responsive" style="max-height:220px;">
            <table class="table table-hover table-bordered">
              <thead>
                <tr>
                  <th style='width:40px;'>序号</th>
                  <th style='width:60px;'>校区</th>
                  <th style='width:100px;'>学生</th>
                  <th style='width:60px;'>学生年级</th>
                  <th style='width:200px;'>课程</th>
                  <th style='width:60px;'>课程科目</th>
                  <th style='width:100px;' class="text-right">已使用</th>
                  <th style='width:100px;' class="text-right">已退款</th>
                  <th style='width:100px;' class="text-right">剩余</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($hours as $hour)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $hour->department_name }}</td>
                    <td>
                      @if($hour->student_gender=="男")
                        <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                      @else
                        <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                      @endif
                      <a href="/student?id={{encode($hour->student_id, 'student_id')}}">{{ $hour->student_name }}</a>
                    </td>
                    <td>{{ $hour->grade_name }}</td>
                    <td>{{ $hour->course_name }}</td>
                    <td>{{ $hour->subject_name }}</td>
                    <td class="text-right">{{ $hour->hour_used }} 课时</td>
                    <td class="text-right">{{ $hour->hour_refunded }} 课时</td>
                    @if($hour->hour_remain<=5)
                      <td class="text-right text-warning"><strong>{{ $hour->hour_remain }} 课时</strong></td>
                    @else
                      <td class="text-right"><strong>{{ $hour->hour_remain }} 课时</strong></td>
                    @endif
                  </tr>
                @empty
                   <tr><td colspan="9" class="text-center text-success"><strong>无</strong></td></tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card mb-3">
          <div class="card-header p-3">
            <h4 class="mb-0">晚托到期提醒</h4>
          </div>
          <div class="table-responsive" style="max-height:220px;">
            <table class="table table-hover table-bordered">
              <thead>
                <tr>
                  <th style='width:40px;'>序号</th>
                  <th style='width:60px;'>校区</th>
                  <th style='width:100px;'>学生</th>
                  <th style='width:60px;'>学生年级</th>
                  <th style='width:260px;'>晚托类型</th>
                  <th style='width:100px;'>开始日期</th>
                  <th style='width:100px;'>结束日期</th>
                  <th style='width:100px;'>晚托状态</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($daycare_records as $daycare_record)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $daycare_record->department_name }}</td>
                    <td>
                      @if($daycare_record->student_gender=="男")
                        <img src="{{ asset(_ASSETS_.'/img/icons/male.png') }}" style="height:20px;">
                      @else
                        <img src="{{ asset(_ASSETS_.'/img/icons/female.png') }}" style="height:20px;">
                      @endif
                      <a href="/student?id={{encode($daycare_record->student_id, 'student_id')}}">{{ $daycare_record->student_name }}</a>
                    </td>
                    <td>{{ $daycare_record->grade_name }}</td>
                    <td>{{ $daycare_record->daycare_name }}</td>
                    <td>{{ $daycare_record->daycare_record_start }}</td>
                    <td>{{ $daycare_record->daycare_record_end }}</td>
                    @if($daycare_record->daycare_record_is_refunded==1)
                      <td><strong><span class="text-danger">已退费</span></strong></td>
                    @elseif(date('Y-m-d')>$daycare_record->daycare_record_end)
                      <td><strong><span class="text-warning">已过期</span></strong></td>
                    @elseif(date('Y-m-d')>=$daycare_record->daycare_record_start&&date('Y-m-d')<=$daycare_record->daycare_record_end)
                      <td><strong><span class="text-success">使用中</span></strong></td>
                    @else
                      <td><strong><span class="text-info">未开始</span></strong></td>
                    @endif
                  </tr>
                @empty
                   <tr><td colspan="8" class="text-center text-success"><strong>无</strong></td></tr>
                @endforelse
              </tbody>
            </table>
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

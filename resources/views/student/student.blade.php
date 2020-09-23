@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">学生详情</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">学生详情</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card card-profile">
        <img src="{{ asset(_ASSETS_.'/img/theme/student-bg.jpg') }}" alt="Image placeholder" class="card-img-top">
        <div class="row justify-content-center">
          <div class="col-lg-3 order-lg-2">
            <div class="card-profile-image">
              <a href="#">
                <img src="{{ asset(_ASSETS_.'/avatar/student.png') }}" class="rounded-circle">
              </a>
            </div>
          </div>
        </div>
        <div class="card-body mt-4">
          <div class="text-center pb-0">
            <h1>{{ $student->student_name }}</h1>
            <div class="h5 font-weight-300">{{ $student->student_id }}</div>
            <hr>
            <div class="row text-left ml-2">
              <div class="col-4">
                <div class="h4">校区</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $student->department_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">年级</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $student->grade_name }}</div>
              </div>
              <div class="col-4">
                <div class="h4">学校</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $student->student_school }}</div>
              </div>
              <div class="col-4">
                <div class="h4">电话</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $student->student_phone }}</div>
              </div>
              <div class="col-4">
                <div class="h4">生日</div>
              </div>
              <div class="col-8">
                <div class="h4">{{ $student->student_birthday }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header">
          <h5 class="h3 mb-0">所在班级 ( {{ count($members) }} 个 )</h5>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush list my--2">
            @foreach ($members as $member)
            <li class="list-group-item px-0">
              <div class="row align-items-center">
                <div class="col ml-2">
                  <h4 class="mb-0">
                    <a href="#!">{{ $member->class_name }}</a>
                  </h4>
                  <span class="text-success">●</span>
                  <small>{{ $member->grade_name }} [{{$member->class_current_num}}/{{$member->class_max_num}}]</small>
                </div>
                <div class="col-auto">
                  <a href="/class?id={{encode($member->class_id,'class_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
                  <button type="button" class="btn btn-outline-danger btn-sm delete-button" id='delete_button_{{$loop->iteration}}' onclick="buttonConfirm('delete_button_{{$loop->iteration}}', '/student/member/delete?class_id={{ encode($member->class_id, 'class_id') }}&student_id={{ encode($student->student_id, 'student_id') }}', '确认退出班级？')">退出</button>
                </div>
              </div>
            </li>
            @endforeach
          </ul>
        </div>
      </div>
    </div>
    <div class="col-lg-9 col-md-6 col-sm-12">
      <div class="nav-wrapper p-0">
        <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
          <li class="nav-item">
            <a class="nav-link mb-3 active" id="lessons-tab" data-toggle="tab" href="#lessons" role="tab" aria-controls="lessons" aria-selected="true"><i class="ni ni-ruler-pencil mr-2"></i>上课记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="hours-tab" data-toggle="tab" href="#hours" role="tab" aria-controls="hours" aria-selected="false"><i class="fa fa-user-clock mr-2"></i>学生课时</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="daycare_records-tab" data-toggle="tab" href="#daycare_records" role="tab" aria-controls="daycare_records" aria-selected="false"><i class="fa fa-user-shield mr-2"></i>晚托记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="payments-tab" data-toggle="tab" href="#payments" role="tab" aria-controls="payments" aria-selected="false"><i class="ni ni-money-coins mr-2"></i>购课记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="edit-tab" data-toggle="tab" href="#edit" role="tab" aria-controls="edit" aria-selected="false"><i class="fa fa-cog mr-2"></i>修改信息</a>
          </li>
        </ul>
      </div>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="lessons" role="tabpanel" aria-labelledby="lessons-tab">
          <div class="card mb-4">
            <div class="table-responsive py-4">
              <table class="table table-flush datatable-basic">
                <thead class="thead-light">
                  <tr>
                    <th style='width:40px;'>序号</th>
                    <th style='width:220px;'>班级</th>
                    <th style='width:35px;'>状态</th>
                    <th style='width:160px;'>扣除课时</th>
                    <th style='width:70px;'>教师</th>
                    <th style='width:35px;'>年级</th>
                    <th style='width:35px;'>科目</th>
                    <th style='width:150px;'>时间</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($lessons as $lesson)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>
                      <a href="/class?id={{encode($lesson['class_id'], 'class_id')}}">{{ $lesson['class_name'] }}</a>
                    </td>
                    <td>
                      @if($lesson['participant_attend_status']==1)
                        <span class="text-success">正常</span>
                      @elseif($lesson['participant_attend_status']==2)
                        <span class="text-warning">请假</span>
                      @else
                        <span class="text-danger">旷课</span>
                      @endif
                    </td>
                    <td>
                      @if($lesson['participant_attend_status']==2)
                        <span class="text-warning"><strong>-</strong></span>
                      @else
                        {{ $lesson['course_name'] }} <small>[ {{$lesson['participant_amount']}} 课时 ]</small>
                      @endif
                    </td>
                    <td>
                      <a href="/user?id={{encode($lesson['teacher_id'], 'user_id')}}">{{ $lesson['teacher_name'] }}</a>
                    </td>
                    <td>{{ $lesson['grade_name'] }}</td>
                    <td>{{ $lesson['subject_name'] }}</td>
                    <td>
                      {{ date('m-d', strtotime($lesson['lesson_date'])) }} {{ dateToDay($lesson['lesson_date']) }} | {{ date('H:i', strtotime($lesson['lesson_start'])) }}
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="hours" role="tabpanel" aria-labelledby="hours-tab">
          <div class="card">
            <div class="table-responsive py-4">
              <table class="table table-hover datatable-basic text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:60px;'>序号</th>
                    <th style='width:150px;'>课程</th>
                    <th style='width:80px;' class="text-right">剩余</th>
                    <th style='width:80px;' class="text-right">已使用</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($hours as $hour)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $hour->course_name }}</td>
                    <td class="text-right"><strong>{{ $hour->hour_remain }} 课时</strong></td>
                    <td class="text-right"><strong>{{ $hour->hour_used }} 课时</strong></td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="daycare_records" role="tabpanel" aria-labelledby="daycare_records-tab">
          <div class="card">
            <div class="table-responsive py-4">
              <table class="table table-hover datatable-basic text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:40px;'>序号</th>
                    <th style='width:100px;'>晚托类型</th>
                    <th style='width:100px;'>开始日期</th>
                    <th style='width:100px;'>结束日期</th>
                    <th style='width:100px;'>晚托状态</th>
                    <th style='width:80px;' class="text-right">合计金额</th>
                    <th style='width:90px;'>购买日期</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($daycare_records as $daycare_record)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $daycare_record->daycare_name }}</td>
                    <td>{{ $daycare_record->daycare_record_start }}</td>
                    <td>{{ $daycare_record->daycare_record_end }}</td>
                    @if($daycare_record->daycare_record_is_refunded==1)
                      <td><span class="text-danger">已退费</span></td>
                    @elseif(date('Y-m-d')>$daycare_record->daycare_record_end)
                      <td><span class="text-warning">已过期</span></td>
                    @elseif(date('Y-m-d')>=$daycare_record->daycare_record_start&&date('Y-m-d')<=$daycare_record->daycare_record_end)
                      <td><span class="text-success">使用中</span></td>
                    @else
                      <td><span class="text-info">未开始</span></td>
                    @endif
                    <td class="text-right"><strong>{{ number_format($daycare_record->daycare_record_total_price,1) }} 元</strong></td>
                    <td>{{ $daycare_record->daycare_record_date }}</td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="payments" role="tabpanel" aria-labelledby="payments-tab">
          <div class="card">
            <div class="table-responsive py-4">
              <table class="table table-hover datatable-basic text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:40px;'>序号</th>
                    <th style='width:140px;'>购买课程</th>
                    <th style='width:70px;' class="text-right">数量</th>
                    <th style='width:80px;' class="text-right">合计优惠</th>
                    <th style='width:80px;' class="text-right">资料费</th>
                    <th style='width:90px;' class="text-right">合计</th>
                    <th style='width:90px;'>购课日期</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($payments as $payment)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $payment->course_name }}</td>
                    <td class="text-right">{{ $payment->payment_hour }} 课时</td>
                    @if($payment->payment_discount_total==0)
                      <td class="text-right"> - </td>
                    @else
                      <td class="text-right"><span class="text-danger">- {{ number_format($payment->payment_discount_total, 1) }} 元</span></td>
                    @endif
                    @if($payment->payment_extra==0)
                      <td class="text-right"> - </td>
                    @else
                      <td class="text-right">{{ number_format($payment->payment_extra, 1) }} 元</td>
                    @endif
                    <td class="text-right"><strong>{{ number_format($payment->payment_total_price,1) }} 元</strong></td>
                    <td>{{ $payment->payment_date }}</td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit-tab">
          <div class="card">
            <form action="/student/update" method="post" onsubmit="submitButtonDisable('submitButton2')">
              @csrf
              <div class="card-body">
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">学生姓名<span style="color:red">*</span></label>
                      <input class="form-control" type="text" name="input_student_name" value="{{ $student->student_name }}" autocomplete='off' maxlength="5" required>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">学生校区</label>
                      <input class="form-control" type="text" value="{{ $student->department_name }}" readonly>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">学生性别<span style="color:red">*</span></label>
                      <select class="form-control" name="input_student_gender" data-toggle="selectNoFilter" required>
                        <option value=''>请选择性别...</option>
                        <option value='男' @if($student->student_gender=="男") selected @endif>男</option>
                        <option value='女' @if($student->student_gender=="女") selected @endif>女</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">学生年级<span style="color:red">*</span></label>
                      <select class="form-control" name="input_student_grade" data-toggle="selectNoFilter" required>
                        <option value=''>请选择学生年级...</option>
                        @foreach ($grades as $grade)
                          <option value="{{ $grade->grade_id }}" @if($student->student_grade==$grade->grade_id) selected @endif>{{ $grade->grade_name }}</option>
                        @endforeach
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">在读学校<span style="color:red">*</span></label>
                      <input class="form-control" type="text" name="input_student_school" value="{{ $student->student_school }}" required maxlength="10">
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">联系电话<span style="color:red">*</span></label>
                      <input class="form-control" type="text" name="input_student_phone" value="{{ $student->student_phone }}" autocomplete='off' required maxlength="11">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">学生生日<span style="color:red">*</span></label>
                      <input class="form-control datepicker" name="input_student_birthday" type="text" value="{{ $student->student_birthday }}" required>
                    </div>
                  </div>
                </div>
                <hr class="my-3">
                <div class="row">
                  <div class="col-lg-9 col-md-7 col-sm-12 my-2"></div>
                  <div class="col-lg-3 col-md-5 col-sm-12">
                    <input type="hidden" name="input_student_id" value="{{ $student->student_id }}">
                    <input type="submit" id="submitButton2" class="btn btn-warning btn-block" value="修改">
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-3');
  navbarActive('navbar-3');
</script>
@endsection

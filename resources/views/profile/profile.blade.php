@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">个人信息</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">个人信息</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-12">
      <div class="nav-wrapper p-0">
        <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
          <li class="nav-item">
            <a class="nav-link mb-3 active" id="lessons-tab" data-toggle="tab" href="#lessons" role="tab" aria-controls="lessons" aria-selected="true"><i class="fa fa-chalkboard-teacher mr-2"></i>上课记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="classes-tab" data-toggle="tab" href="#classes" role="tab" aria-controls="classes" aria-selected="false"><i class="fa fa-users mr-2"></i>负责班级</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="assessment-tab" data-toggle="tab" href="#assessment" role="tab" aria-controls="assessment" aria-selected="false"><i class="fa fa-list-ol mr-2"></i>考核分数</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="salary-tab" data-toggle="tab" href="#salary" role="tab" aria-controls="salary" aria-selected="false"><i class="fa fa-list-alt mr-2"></i>工资记录</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="edit-tab" data-toggle="tab" href="#edit" role="tab" aria-controls="edit" aria-selected="false"><i class="fa fa-cog mr-2"></i>基本信息</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mb-3" id="password-tab" data-toggle="tab" href="#password" role="tab" aria-controls="password" aria-selected="false"><i class="fa fa-unlock-alt mr-2"></i>修改密码</a>
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
                    <th style='width:35px;'>序号</th>
                    <th style='width:240px;'>班级</th>
                    <th style='width:110px;'>上课学生</th>
                    <th style='width:45px;'>年级</th>
                    <th style='width:45px;'>科目</th>
                    <th style='width:150px;'>时间</th>
                    <th style='width:80px;'>登记用户</th>
                    <th style='width:80px;'>课时费</th>
                    <th style='width:90px;'>操作管理</th>
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
                      {{ $lesson['lesson_attended_num'] }} / {{ $lesson['lesson_attended_num']+$lesson['lesson_leave_num']+$lesson['lesson_absence_num'] }} 人
                      <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal-{{$loop->iteration}}-1">查看</button>
                      <div class="modal fade" id="modal-{{$loop->iteration}}-1" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
                        <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h6 class="modal-title">{{ $lesson['class_name'] }}</h6>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <ul class="list-group list-group-flush list my--3">
                                @foreach ($lesson['participants'] as $participant)
                                  <li class="list-group-item px-0">
                                    <div class="row align-items-center">
                                      <div class="col-auto">
                                        <a href="#" class="avatar rounded-circle">
                                          <img alt="..." src="{{ asset(_ASSETS_.'/avatar/student.png') }}">
                                        </a>
                                      </div>
                                      <div class="col ml--2">
                                        <h4 class="mb-0">
                                          <a href="/student?id={{encode($participant['student_id'], 'student_id')}}">{{ $participant['student_name'] }}</a>
                                        </h4>
                                        @if($participant['participant_attend_status']==1)
                                          <span class="text-success">●</span>
                                          <small>正常 | {{ $participant['course_name'] }} [ {{ $participant['participant_amount'] }} 课时 ]</small>
                                        @elseif($participant['participant_attend_status']==2)
                                          <span class="text-warning">●</span>
                                          <small>请假</small>
                                        @else
                                          <span class="text-danger">●</span>
                                          <small>旷课 | {{ $participant['course_name'] }} [ {{ $participant['participant_amount'] }} 课时 ]</small>
                                        @endif
                                      </div>
                                      <div class="col-auto">
                                        <a href="/student?id={{encode($participant['student_id'], 'student_id')}}"><button type="button" class="btn btn-primary btn-sm">详情</button></a>
                                      </div>
                                    </div>
                                  </li>
                                @endforeach
                              </ul>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">关闭</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td>{{ $lesson['grade_name'] }}</td>
                    <td>{{ $lesson['subject_name'] }}</td>
                    <td>
                      {{ date('m-d', strtotime($lesson['lesson_date'])) }} {{ dateToDay($lesson['lesson_date']) }} - {{ date('H:i', strtotime($lesson['lesson_start'])) }}
                    </td>
                    <td>
                      <a href="/user?id={{encode($lesson['create_user_id'], 'user_id')}}">{{ $lesson['create_user_name'] }}</a>
                    </td>
                    <td>{{ $lesson['lesson_teacher_fee'] }} 元</td>
                    <td>
                      <a href='/file/document/download?id={{encode($lesson['lesson_document'], 'document_id')}}'><button type="button" class="btn btn-primary btn-sm">下载教案</button></a>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="classes" role="tabpanel" aria-labelledby="classes-tab">
          <div class="card">
            <div class="table-responsive py-4">
              <table class="table table-hover datatable-basic text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:60px;'>序号</th>
                    <th style='width:150px;'>班级</th>
                    <th style='width:80px;'>年级</th>
                    <th style='width:80px;'>科目</th>
                    <th style='width:80px;'>人数</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($classes as $class)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td><a href="/class?id={{encode($class->class_id, 'class_id')}}">{{ $class->class_name }}</a></td>
                    <td>{{ $class->grade_name }}</td>
                    <td>{{ $class->subject_name }}</td>
                    <td>{{ $class->class_current_num }} / {{ $class->class_max_num }} 人</td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="assessment" role="tabpanel" aria-labelledby="assessment-tab">
          <div class="card">
            <table class="table table-bordered text-center">
              <thead class="thead-light">
                <tr>
                  <th style='width:60px;'>序号</th>
                  <th style='width:150px;'>月份</th>
                  <th style='width:80px;'>自评</th>
                  <th style='width:80px;'>教务评</th>
                  <th style='width:80px;'>分校长评</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($month_assessments as $month_assessment)
                <tr>
                  <td>{{ $loop->iteration }}</td>
                  <td>{{ $month_assessment->month_assessment_month }}</td>
                  @if($month_assessment->month_assessment_1=="")
                    <td>-</td>
                  @else
                    <td>{{ $month_assessment->month_assessment_1 }}</td>
                  @endif
                  @if($month_assessment->month_assessment_2=="")
                    <td>-</td>
                  @else
                    <td>{{ $month_assessment->month_assessment_2 }}</td>
                  @endif
                  @if($month_assessment->month_assessment_3=="")
                    <td>-</td>
                  @else
                    <td>{{ $month_assessment->month_assessment_3 }}</td>
                  @endif
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>

        <div class="tab-pane fade" id="salary" role="tabpanel" aria-labelledby="salary-tab">
          <div class="card">
            <table class="table table-bordered text-center">
              <thead class="thead-light">
                <tr>
                  <th rowspan="2" style='width:60px;'><strong>月份</strong></th>
                  <th rowspan="2" style='width:55px;'><strong>基本</strong></th>
                  <th rowspan="2" style='width:55px;'><strong>住房</strong></th>
                  <th rowspan="2" style='width:55px;'><strong>课时</strong></th>
                  <th rowspan="2" style='width:55px;'><strong>绩效</strong></th>
                  <th rowspan="2" style='width:55px;'><strong>课消</strong></th>
                  <th rowspan="2" style='width:65px;'><strong>应发</strong></th>
                  <th colspan="4" style='width:240px;'><strong>代扣款项</strong></th>
                  <th rowspan="2" style='width:60px;'><strong>处罚</strong></th>
                  <th rowspan="2" style='width:60px;'><strong>所得税</strong></th>
                  <th rowspan="2" style='width:65px;'><strong>实发</strong></th>
                </tr>
                <tr>
                  <th><strong>养老</strong></th>
                  <th><strong>医疗</strong></th>
                  <th><strong>失业</strong></th>
                  <th><strong>公积金</strong></th>
                </tr>
              </thead>
              <tbody class="list">
                @foreach ($salaries as $salary)
                <tr>
                  <td>{{ date('y-m', strtotime($salary->salary_month)) }}</td>
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

        <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit-tab">
          <div class="card">
            <div class="row justify-content-center">
              <div class="col-3">
                <div class="card-profile-image mt-5">
                  <a href="#">
                    <img src="{{ asset(_ASSETS_.'/avatar/male.png') }}" class="rounded-circle" style="height:100px; width:100px;">
                  </a>
                </div>
              </div>
            </div>
            <div class="card-body mt-4 pb-0">
              <div class="text-center pb-0">
                <h1>{{ $user->user_name }}</h1>
                <div class="h5 font-weight-300">{{ $user->user_id }}</div>
                <hr>
              </div>
            </div>
            <form action="/profile/update" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
              @csrf
              <!-- Card body -->
              <div class="card-body">
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">姓名</label>
                      <input class="form-control" type="text" value="{{$user->user_name}}" readonly>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">校区</label>
                      <input class="form-control" type="text" value="{{ $user->department_name }}" readonly>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">级别</label>
                      <input class="form-control" type="text" value="{{$user->position_name}}" readonly>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">评级</label>
                      <input class="form-control" type="text" value="{{ $user->teacher_type_name }}" readonly>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">性别<span style="color:red">*</span></label>
                      <select class="form-control" name="input_user_gender" data-toggle="selectNoFilter" required>
                        <option value=''>请选择性别...</option>
                        <option value='男' @if($user->user_gender=="男") selected @endif>男</option>
                        <option value='女' @if($user->user_gender=="女") selected @endif>女</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="form-control-label">生日<span style="color:red">*</span></label>
                      <input class="form-control datepicker" name="input_user_birthday" placeholder="Select date" type="text" value="{{$user->user_birthday}}" required>
                    </div>
                  </div>
                </div>
                <hr class="my-3">
                <div class="row">
                  <div class="col-lg-8 col-md-7 col-sm-12 my-2"></div>
                  <div class="col-lg-4 col-md-5 col-sm-12">
                    <input type="submit" id="submitButton1" class="btn btn-warning btn-block" value="修改">
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
          <div class="card">
            <div class="row justify-content-center">
              <div class="col-3">
                <div class="card-profile-image mt-5">
                  <a href="#">
                    <img src="{{ asset(_ASSETS_.'/avatar/male.png') }}" class="rounded-circle" style="height:100px; width:100px;">
                  </a>
                </div>
              </div>
            </div>
            <div class="card-body mt-4 pb-0">
              <div class="text-center pb-0">
                <h1>{{ $user->user_name }}</h1>
                <div class="h5 font-weight-300">{{ $user->user_id }}</div>
                <hr>
              </div>
            </div>
            <form action="/profile/password" method="post" id="form2" name="form2" onsubmit="submitButtonDisable('submitButton2')">
              @csrf
              <!-- Card body -->
              <div class="card-body">
                <div class="row justify-content-center">
                  <div class="col-4">
                    <div class="form-group">
                      <label class="form-control-label">原密码<span style="color:red">*</span></label>
                      <input class="form-control" type="password" name="old_password" placeholder="原密码..." autocomplete='off' required maxlength="15">
                    </div>
                  </div>
                </div>
                <div class="row justify-content-center">
                  <div class="col-4">
                    <div class="form-group">
                      <label class="form-control-label">新密码<span style="color:red">*</span></label>
                      <input class="form-control" type="password" name="new_password" placeholder="新密码..." autocomplete='off' required maxlength="15" minlength="6">
                    </div>
                  </div>
                </div>
                <div class="row justify-content-center">
                  <div class="col-4">
                    <div class="form-group">
                      <label class="form-control-label">新密码确认<span style="color:red">*</span></label>
                      <input class="form-control" type="password" name="new_password_confirm" placeholder="新密码确认..." autocomplete='off' required maxlength="15" minlength="6">
                    </div>
                  </div>
                </div>
                <hr class="my-3">
                <div class="row">
                  <div class="col-lg-8 col-md-7 col-sm-12 my-2"></div>
                  <div class="col-lg-4 col-md-5 col-sm-12">
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
  linkActive('link-profile');
</script>
@endsection

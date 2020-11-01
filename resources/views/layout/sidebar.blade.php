<!-- Sidenav -->
<nav class="sidenav navbar navbar-vertical fixed-left navbar-expand-xs navbar-light bg-white" id="sidenav-main">
<div class="scrollbar-inner">
  <!-- Brand -->
  <div class="sidenav-header d-flex align-items-center">
    <a class="navbar-brand" href="/home">
      <h2 class="mb-0" style="color:rgb(94,114,228);font-size:1.45rem;">上海尚书教育</h2>
    </a>
    <div class="ml-auto">
      <!-- Sidenav toggler -->
      <div class="sidenav-toggler d-none d-xl-block" data-action="sidenav-unpin" data-target="#sidenav-main">
        <div class="sidenav-toggler-inner">
          <i class="sidenav-toggler-line"></i>
          <i class="sidenav-toggler-line"></i>
          <i class="sidenav-toggler-line"></i>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar-inner">
    <!-- Collapse -->
    <div class="collapse navbar-collapse" id="sidenav-collapse-main">
      <!-- Nav items -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/home" id="home">
            <i class="fa fa-home text-primary"></i>
            <span class="nav-link-text">主页</span>
          </a>
        </li>
        @if(in_array("公司管理", Session::get('access_categories')))
          <li class="nav-item">
            <a class="nav-link" href="#navbar-company" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-company" id="link-company">
              <i class="ni ni-building text-green"></i>
              <span class="nav-link-text">公司管理</span>
            </a>
            <div class="collapse" id="navbar-company">
              <ul class="nav nav-sm flex-column">
                @if(in_array("/company/corporation", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/corporation" class="nav-link" id="companyCorporation">
                      <i class="fa fa-building text-green"></i>
                      <span class="nav-link-text">单位设置</span>
                    </a>
                  </li>
                @endif
                @if(in_array("/company/department", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/department" class="nav-link" id="companyDepartment">
                      <i class="ni ni-building text-green"></i>
                      <span class="nav-link-text">校区设置</span>
                    </a>
                  </li>
                @endif
                @if(in_array("/company/user", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/company/user" class="nav-link" id="companyUser">
                    <i class="ni ni-badge text-green"></i>
                    <span class="nav-link-text">用户管理</span>
                  </a>
                </li>
                @endif
                @if(in_array("/company/teacherType", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/teacherType" class="nav-link" id="companyTeacherType">
                      <i class="fa fa-user-tag text-green"></i>
                      <span class="nav-link-text">教师评级</span>
                    </a>
                  </li>
                @endif
                @if(in_array("/company/course", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/course" class="nav-link" id="companyCourse">
                      <i class="ni ni-book-bookmark text-green"></i>
                      <span class="nav-link-text">课程设置</span>
                    </a>
                  </li>
                @endif
                @if(in_array("/company/daycare", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/daycare" class="nav-link" id="companyDaycare">
                      <i class="fa fa-shield-alt text-green"></i>
                      <span class="nav-link-text">晚托设置</span>
                    </a>
                  </li>
                @endif
                @if(in_array("/company/salary", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/salary" class="nav-link" id="companySalary">
                      <i class="fa fa-list-alt text-green"></i>
                      <span class="nav-link-text">员工工资</span>
                    </a>
                  </li>
                @endif
                @if(in_array("/company/receipt", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/company/receipt" class="nav-link" id="companyReceipt">
                      <i class="fa fa-receipt text-green"></i>
                      <span class="nav-link-text">票据管理</span>
                    </a>
                  </li>
                @endif
              </ul>
            </div>
          </li>
        @endif
        @if(in_array("教务运营", Session::get('access_categories')))
        <li class="nav-item">
          <a class="nav-link" href="#navbar-education" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-education" id="link-education">
            <i class="ni ni-book-bookmark text-warning"></i>
            <span class="nav-link-text">教务运营</span>
          </a>
          <div class="collapse" id="navbar-education">
            <ul class="nav nav-sm flex-column">
              @if(in_array("/education/student", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/education/student" class="nav-link" id="educationStudent">
                    <i class="fa fa-user text-warning"></i>
                    <span class="nav-link-text">学生管理</span>
                  </a>
                </li>
              @endif
              @if(in_array("/education/hour", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/education/hour" class="nav-link" id="educationHour">
                    <i class="fa fa-user-clock text-warning"></i>
                    <span class="nav-link-text">学生课时</span>
                  </a>
                </li>
              @endif
              @if(in_array("/education/daycare", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/education/daycare" class="nav-link" id="educationDaycare">
                    <i class="fa fa-user-shield text-warning"></i>
                    <span class="nav-link-text">学生晚托</span>
                  </a>
                </li>
              @endif
              @if(in_array("/education/class", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/education/class" class="nav-link" id="educationClass">
                    <i class="fa fa-users text-warning"></i>
                    <span class="nav-link-text">班级管理</span>
                  </a>
                </li>
              @endif
              @if(in_array("/education/lesson", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/education/lesson" class="nav-link" id="educationLesson">
                    <i class="fa fa-chalkboard-teacher text-warning"></i>
                    <span class="nav-link-text">上课记录</span>
                  </a>
                </li>
              @endif
              <!-- <li class="nav-item">
                <a href="/education/schedule" class="nav-link" id="educationSchedule">
                  <i class="ni ni-calendar-grid-58 text-warning"></i>
                  <span class="nav-link-text">课程安排</span>
                </a>
              </li> -->
            </ul>
          </div>
        </li>
        @endif
        @if(in_array("财务中心", Session::get('access_categories')))
        <li class="nav-item">
          <a class="nav-link" href="#navbar-finance" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-finance" id="link-finance">
            <i class="fa fa-money-check-alt text-purple"></i>
            <span class="nav-link-text">财务中心</span>
          </a>
          <div class="collapse" id="navbar-finance">
            <ul class="nav nav-sm flex-column">
              @if(in_array("/finance/payment", Session::get('user_accesses')))
                  <li class="nav-item">
                    <a href="/finance/payment" class="nav-link" id="financePayment">
                      <i class="fa fa-list-ul text-purple"></i>
                      <span class="nav-link-text">课时购买记录</span>
                    </a>
                  </li>
              @endif
              @if(in_array("/finance/daycareRecord", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/finance/daycareRecord" class="nav-link" id="financeDaycareRecord">
                    <i class="fa fa-list-ul text-purple"></i>
                    <span class="nav-link-text">晚托缴费记录</span>
                  </a>
                </li>
              @endif
              @if(in_array("/finance/refund/payment", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/finance/refund/payment" class="nav-link" id="financeRefundPayment">
                    <i class="fa fa-sign-out-alt text-purple"></i>
                    <span class="nav-link-text">课时退费记录</span>
                  </a>
                </li>
              @endif
              @if(in_array("/finance/refund/daycare", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/finance/refund/daycare" class="nav-link" id="financeRefundDaycare">
                    <i class="fa fa-sign-out-alt text-purple"></i>
                    <span class="nav-link-text">晚托退费记录</span>
                  </a>
                </li>
              @endif
              @if(in_array("/finance/expenditure", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/finance/expenditure" class="nav-link" id="financeExpenditure">
                    <i class="fa fa-hand-holding-usd text-purple"></i>
                    <span class="nav-link-text">费用支出记录</span>
                  </a>
                </li>
              @endif
              @if(in_array("/finance/receipt", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/finance/receipt" class="nav-link" id="financeReceipt">
                    <i class="fa fa-receipt text-purple"></i>
                    <span class="nav-link-text">发票申请记录</span>
                  </a>
                </li>
              @endif
            </ul>
          </div>
        </li>
        @endif
        <li class="nav-item">
          <a class="nav-link" href="#navbar-file" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-file" id="link-file">
            <i class="fa fa-folder-open text-info"></i>
            <span class="nav-link-text">文档资料</span>
          </a>
          <div class="collapse" id="navbar-file">
            <ul class="nav nav-sm flex-column">
              <li class="nav-item">
                <a href="/file/document" class="nav-link" id="fileDocument">
                  <i class="fa fa-file-alt text-info"></i>
                  <span class="nav-link-text">上课教案</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/file/standardDocument" class="nav-link" id="fileStandardDocument">
                  <i class="fa fa-file-word text-info"></i>
                  <span class="nav-link-text">标准教案</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/file/paper" class="nav-link" id="filePaper">
                  <i class="fa fa-file-powerpoint text-info"></i>
                  <span class="nav-link-text">试卷资料</span>
                </a>
              </li>
              <!--
              <li class="nav-item">
                <a href="/file/previousDocument" class="nav-link" id="filePreviousDocument">
                  <i class="fa fa-file-import text-info"></i>
                  <span class="nav-link-text">原系统教案</span>
                </a>
              </li>
              -->
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#navbar-teacher" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-teacher" id="link-teacher">
            <i class="fa fa-address-card text-indigo"></i>
            <span class="nav-link-text">教师中心</span>
          </a>
          <div class="collapse" id="navbar-teacher">
            <ul class="nav nav-sm flex-column">
              <li class="nav-item">
                <a href="/teacher/assessment" class="nav-link" id="teacherAssessment">
                  <i class="fa fa-list-ol text-indigo"></i>
                  <span class="nav-link-text">教师考核</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/teacher/announcement" class="nav-link" id="teacherAnnouncement">
                  <i class="ni ni-notification-70 text-indigo"></i>
                  <span class="nav-link-text">通知文件</span>
                </a>
              </li>
              <!--
              <li class="nav-item">
                <a href="/teacher/summary" class="nav-link" id="teacherSummary">
                  <i class="fa fa-clipboard-list text-indigo"></i>
                  <span class="nav-link-text">周总结</span>
                </a>
              </li>
              -->
            </ul>
          </div>
        </li>
        @if(in_array("统计中心", Session::get('access_categories')))
        <li class="nav-item">
          <a class="nav-link" href="#navbar-statistic" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-statistic" id="link-statistic">
            <i class="fa fa-chart-bar text-gray-dark"></i>
            <span class="nav-link-text">统计中心</span>
          </a>
          <div class="collapse" id="navbar-statistic">
            <ul class="nav nav-sm flex-column">
              @if(in_array("/statistic/statistic", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/statistic/statistic" class="nav-link" id="statisticStatistic">
                    <i class="ni ni-money-coins text-gray-dark"></i>
                    <span class="nav-link-text">综合统计</span>
                  </a>
                </li>
              @endif
              @if(in_array("/statistic/income", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/statistic/income" class="nav-link" id="statisticIncome">
                    <i class="ni ni-money-coins text-gray-dark"></i>
                    <span class="nav-link-text">收入统计</span>
                  </a>
                </li>
              @endif
              @if(in_array("/statistic/consumption", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/statistic/consumption" class="nav-link" id="statisticConsumption">
                    <i class="fa fa-minus-square text-gray-dark"></i>
                    <span class="nav-link-text">课消统计</span>
                  </a>
                </li>
              @endif
              @if(in_array("/statistic/daycare", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/statistic/daycare" class="nav-link" id="statisticDaycare">
                    <i class="fa fa-minus-square text-gray-dark"></i>
                    <span class="nav-link-text">晚托消耗</span>
                  </a>
                </li>
              @endif
              @if(in_array("/statistic/hour", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/statistic/hour" class="nav-link" id="statisticHour">
                    <i class="fa fa-user-clock text-gray-dark"></i>
                    <span class="nav-link-text">剩余课时</span>
                  </a>
                </li>
              @endif
              @if(in_array("/statistic/salary", Session::get('user_accesses')))
                <li class="nav-item">
                  <a href="/statistic/salary" class="nav-link" id="statisticSalary">
                    <i class="fa fa-address-card text-gray-dark"></i>
                    <span class="nav-link-text">工资统计</span>
                  </a>
                </li>
              @endif
            </ul>
          </div>
        </li>
        @endif
      </ul>
      <!-- Divider -->
      <hr class="my-3">
      <!-- Heading -->
      <!-- <h6 class="navbar-heading p-0 text-muted">其它</h6> -->
      <!-- Navigation -->
      <ul class="navbar-nav mb-md-3">
        <li class="nav-item">
          <a class="nav-link" href="/profile" id="link-profile">
            <i class="ni ni-circle-08"></i>
            <span class="nav-link-text">个人信息</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exit">
            <i class="ni ni-user-run text-red"></i>
            <span class="nav-link-text text-red">退出系统</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>
</nav>

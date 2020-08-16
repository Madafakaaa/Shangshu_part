<!-- Sidenav -->
<nav class="sidenav navbar navbar-vertical fixed-left navbar-expand-xs navbar-light bg-white" id="sidenav-main">
<div class="scrollbar-inner">
  <!-- Brand -->
  <div class="sidenav-header d-flex align-items-center">
    <a class="navbar-brand" href="/home">
      <img src="{{ asset(_ASSETS_.'/img/brand/blue.png') }}" class="navbar-brand-img" alt="...">
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
            <i class="ni ni-shop text-primary"></i>
            <span class="nav-link-text">主页</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#navbar-company" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-company" id="link-company">
            <i class="ni ni-building text-green"></i>
            <span class="nav-link-text">公司管理</span>
          </a>
          <div class="collapse" id="navbar-company">
            <ul class="nav nav-sm flex-column">
              <li class="nav-item">
                <a href="/company/department" class="nav-link" id="companyDepartment">
                  <i class="ni ni-building text-green"></i>
                  <span class="nav-link-text">校区设置</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/company/user" class="nav-link" id="companyUser">
                  <i class="ni ni-badge text-green"></i>
                  <span class="nav-link-text">用户管理</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/company/course" class="nav-link" id="companyCourse">
                  <i class="ni ni-book-bookmark text-green"></i>
                  <span class="nav-link-text">课程设置</span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#navbar-education" data-toggle="collapse" aria-expanded="false" role="button" aria-controls="navbar-education" id="link-education">
            <i class="ni ni-book-bookmark text-warning"></i>
            <span class="nav-link-text">运营中心</span>
          </a>
          <div class="collapse" id="navbar-education">
            <ul class="nav nav-sm flex-column">
              <li class="nav-item">
                <a href="/education/student" class="nav-link" id="educationStudent">
                  <i class="ni ni-single-02 text-warning"></i>
                  <span class="nav-link-text">学生管理</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/education/hour" class="nav-link" id="educationHour">
                  <i class="ni ni-single-copy-04 text-warning"></i>
                  <span class="nav-link-text">学生课时</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/education/class" class="nav-link" id="educationClass">
                  <i class="ni ni-circle-08 text-warning"></i>
                  <span class="nav-link-text">班级管理</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="/education/lesson" class="nav-link" id="educationLesson">
                  <i class="ni ni-ruler-pencil text-warning"></i>
                  <span class="nav-link-text">上课记录</span>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a href="/education/schedule" class="nav-link" id="educationSchedule">
                  <i class="ni ni-calendar-grid-58 text-warning"></i>
                  <span class="nav-link-text">课程安排</span>
                </a>
              </li> -->
              <hr>
              <li class="nav-item">
                <a href="/education/payment" class="nav-link" id="educationPayment">
                  <i class="ni ni-money-coins text-warning"></i>
                  <span class="nav-link-text">购课记录</span>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a href="/education/payment" class="nav-link" id="educationPayment">
                  <i class="ni ni-credit-card text-warning"></i>
                  <span class="nav-link-text">退款记录</span>
                </a>
              </li> -->
            </ul>
          </div>
        </li>
      </ul>
      <!-- Divider -->
      <hr class="my-3">
      <!-- Heading -->
      <!-- <h6 class="navbar-heading p-0 text-muted">Documentation</h6> -->
      <!-- Navigation -->
      <ul class="navbar-nav mb-md-3">
        <li class="nav-item">
          <a class="nav-link" href="/profile" id="profile">
            <i class="ni ni-circle-08"></i>
            <span class="nav-link-text">个人信息</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exit">
            <i class="ni ni-user-run text-red"></i>
            <span class="nav-link-text">退出系统</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>
</nav>

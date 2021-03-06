<!-- Topnav -->
<nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      @section('nav')
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
          <!-- Nav -->
          <li class="breadcrumb-item"><h1 class="mb-0" style="color:white;">上海尚书教育</h1></li>
        </ol>
      </nav>
      @show

      <!-- Navbar links -->
      <ul class="navbar-nav align-items-center ml-md-auto">
        <li class="nav-item d-xl-none">
          <!-- Sidenav toggler -->
          <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
            </div>
          </div>
        </li>
        <li class="nav-item d-sm-none">
          <a class="nav-link" href="#" data-action="search-show" data-target="#navbar-search-main">
            <i class="ni ni-zoom-split-in"></i>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-xl dropdown-menu-right py-0 overflow-hidden">
            <!-- Dropdown header -->
            <div class="px-3 py-3">
              <h6 class="text-sm text-muted m-0">近期有<strong class="text-primary">{{count(Session::get('announcements'))}}</strong>个通知.</h6>
            </div>
            <!-- List group -->
            <div class="list-group list-group-flush">
              @forelse(Session::get('announcements') as $announcement)
                <a href="/files/announcement/{{$announcement['announcement_path']}}" class="list-group-item list-group-item-action" title="点击预览" target="_blank">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <!-- Avatar -->
                      <img alt="Image placeholder" src="{{ asset(_ASSETS_.'/avatar/male.png') }}" class="avatar rounded-circle">
                    </div>
                    <div class="col ml--2">
                      <div class="d-flex justify-content-between align-items-center">
                        <div>
                          <h4 class="mb-0 text-sm">{{$announcement['user_name']}}</h4>
                        </div>
                        <div class="text-right text-muted">
                          <small>{{$announcement['announcement_date']}}</small>
                        </div>
                      </div>
                      <p class="text-sm mb-0">{{$announcement['announcement_name']}}</p>
                    </div>
                  </div>
                </a>
              @empty
              @endforelse
            </div>
            <!-- View all -->
            <a href="/teacher/announcement" class="dropdown-item text-center text-primary font-weight-bold py-3">查看全部</a>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav align-items-center ml-auto ml-md-0">
        <li class="nav-item dropdown">
          <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img src="{{ asset(_ASSETS_.'/avatar/male.png') }}" class="rounded-circle" alt="Image missing">
              </span>
              <div class="media-body ml-2 d-none d-lg-block">
                <span class="mb-0 text-sm  font-weight-bold">{{ Session::get('user_name') }}</span>
              </div>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-right">
            <a href="#!" class="dropdown-item">
              <i class="ni ni-single-02 text-green"></i>
              <span>{{ Session::get('user_name') }}</span>
            </a>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-square-pin text-green"></i>
              <span>{{ Session::get('user_department_name') }}</span>
            </a>
            <a href="#!" class="dropdown-item">
              <i class="fa fa-sitemap text-green"></i>
              <span>{{ Session::get('user_position_name') }}</span>
            </a>
            <a href="#!" class="dropdown-item">
              <i class="fa fa-user-tag text-green"></i>
              <span>{{ Session::get('user_teacher_type_name') }}</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="/exit" class="dropdown-item">
              <i class="ni ni-user-run text-red"></i>
              <span class="text-red">退出系统</span>
            </a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Header -->
<!--  <div class="header bg-primary pb-6"></div> -->

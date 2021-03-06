<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="上海尚书教育管理系统">
  <meta name="author" content="张子一">
  <title>上海尚书教育管理系统</title>
  <!-- Favicon -->
  <link rel="icon" href="assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <link rel="stylesheet" href="assets/vendor/animate.css/animate.min.css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="assets/css/argon.css?v=1.1.0" type="text/css">
  <style>
    html,body,#container,#row{ padding:0; margin:0; height:100%; width:100%; max-height:100%; max-width:100%;}
  </style>
</head>
<body>
  <div class="container" id="container">
    <div class="row" id="row">
      <div class="col-md-9" style="background:url(assets/img/background/bg1.jpg) 22%;background-size:100% 100%; ">
      </div>
      <div class="col-md-3">
        <div class="card mt-7">
          <div class="card-body mt-4">
            <form action="/login" method="post">
              @csrf
              <div style="text-align:center; margin-bottom:15%;">
                <img src="assets\img\brand\logo.JPG" width="200px;" height="200px;">
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="ni ni-circle-08 text-primary"></i>
                  </span>
                </div>
                <input type="text" name="input1" class="form-control" placeholder="用户名..." maxlength="10">
              </div>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="ni ni-key-25 text-primary"></i>
                  </span>
                </div>
                <input type="password" name="input2" class="form-control" placeholder="密码..." maxlength="20">
              </div>
              <br>
              <div class="input-group" style="margin-top:10%;">
                <input type="submit" class="btn btn-primary btn-round btn-block mb-3" value="登陆">
              </div>
              <a href="/old/index.php"><small>登陆旧系统</small></a>
            </form>
          </div>
        </div>
        <footer class="footer ml-1 mt-6">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6">
              <div class="copyright text-center text-lg-left text-muted">
                <small>沪ICP备19011989号-1</small>
                <br>
                <small>&copy; 2020 上海尚书教育</small>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
  </div>
  <!-- Script files -->
  @include('layout.scripts')
</body>
</html>

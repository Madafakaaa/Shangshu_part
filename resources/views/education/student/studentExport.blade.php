@include('layout.header')
<body>
  <div class="main-content" id="panel">
    <div class="container-fluid mt-3">
      <div class="row justify-content-center">
        <div class="col-9">
          <div class="card mb-4">
            <div class="table-responsive">
              <button type="button" class="btn btn-waring btn-block" onclick="table_export('table-1', '学生名单')">导出表格</button>
              <table class="table text-left table-bordered" id="table-1">
                <thead class="thead-light">
                  <tr>
                    <th style='width:40px;'>序号</th>
                    <th style='width:60px;'>学生</th>
                    <th style='width:50px;'>性别</th>
                    <th style='width:50px;'>校区</th>
                    <th style='width:50px;'>年级</th>
                    <th style='width:100px;'>学校</th>
                    <th style='width:100px;'>电话</th>
                    <th style='width:100px;'>生日</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($students as $student)
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $student->student_name }}</td>
                    <td>{{ $student->student_gender }}</td>
                    <td>{{ $student->department_name }}</td>
                    <td>{{ $student->grade_name }}</td>
                    <td>{{ $student->student_school }}</td>
                    <td>{{ $student->student_phone }}</td>
                    <td>{{ $student->student_birthday }}</td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Script files -->
  @include('layout.scripts')
</body>
</html>


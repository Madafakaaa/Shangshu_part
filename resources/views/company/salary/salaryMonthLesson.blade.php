@include('layout.header')
<body>
  <div class="main-content" id="panel">
    <div class="container-fluid mt-3">
      <div class="row justify-content-center">
        <div class="col-12">
          <div class="card mb-2">
            <div class="table-responsive">
              <table class="table text-left table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th style='width:100px;'>上课校区</th>
                    <th style='width:120px;'>上课次数</th>
                    <th style='width:120px;'>课时费合计</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($summary_lessons as $summary_lesson)
                    <tr>
                      <td>{{ $summary_lesson->department_name }}</td>
                      <td>{{ $summary_lesson->count_lesson }}</td>
                      <td>{{ $summary_lesson->sum_lesson_teacher_fee }}</td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card mb-4">
            <div class="table-responsive">
              <button type="button" class="btn btn-block" onclick="table_export('table-1', '课时明细-{{$month}}')">导出表格</button>
              <button type="button" class="btn btn-warning btn-block" onclick="doPrint()">打印表格</button>
              <!--startprint-->
              <table class="table text-left table-bordered" id="table-1">
                <thead class="thead-light">
                  <tr>
                    <th style='width:40px;'>序号</th>
                    <th style='width:60px;'>教师</th>
                    <th style='width:160px;'>班级</th>
                    <th style='width:60px;'>上课学生</th>
                    <th style='width:45px;'>年级</th>
                    <th style='width:45px;'>科目</th>
                    <th style='width:150px;'>时间</th>
                    <th style='width:70px;' class="text-right">课时费</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($db_lessons as $lesson)
                    <tr>
                      <td>{{ $loop->iteration }}</td>
                      <td>{{ $lesson->user_name }}</td>
                      <td>[ {{$lesson->department_name}} ] {{ $lesson->class_name }}</td>
                      <td>{{ $lesson->lesson_attended_num }}人</td>
                      <td>{{ $lesson->grade_name }}</td>
                      <td>{{ $lesson->subject_name }}</td>
                      <td>
                        {{ date('m-d', strtotime($lesson->lesson_date)) }} {{ dateToDay($lesson->lesson_date) }} | {{ date('H:i', strtotime($lesson->lesson_start)) }}
                      </td>
                      <td class="text-right">{{ $lesson->lesson_teacher_fee }} 元</td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
              <!--endprint-->
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
<script language="javascript">
function doPrint() {
    bdhtml=window.document.body.innerHTML;
    sprnstr="<!--startprint-->";
    eprnstr="<!--endprint-->";
    prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
    prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
    window.document.body.innerHTML=prnhtml;
    window.print();
}
</script>


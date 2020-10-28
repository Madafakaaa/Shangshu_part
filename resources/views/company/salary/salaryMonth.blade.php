@include('layout.header')
<body>
  <div class="main-content" id="panel">
    <div class="container-fluid mt-3">
      <div class="card mb-4">
        <div class="row my-3 mx-1">
          <div class="col-12">
            <small class="text-muted font-weight-bold px-2">校区：</small>
            <a href="?month={{$month}}">
              <button type="button" @if(!isset($filters['filter_department'])) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>全部</button>
            </a>
            @foreach($filter_departments as $filter_department)
              <a href="?month={{$month}}&filter_department={{$filter_department->department_id}}"><button type="button" @if($filters['filter_department']==$filter_department->department_id) class="btn btn-primary btn-sm" disabled @else class="btn btn-sm" @endif>{{$filter_department->department_name}}</button></a>
            @endforeach
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-12">
          <div class="card mb-4">
            <div class="table-responsive">
              <button type="button" class="btn btn-block" onclick="table_export('table-1', '工资表-{{$month}}')">导出表格</button>
              <button type="button" class="btn btn-warning btn-block" onclick="doPrint()">打印表格</button>
              <!--startprint-->
              <table class="table text-left table-bordered" id="table-1">
                <thead class="thead-light">
                  <tr>
                    <th rowspan="2" style='width:45px;'><strong>月份</strong></th>
                    <th rowspan="2" style='width:80px;'><strong>员工</strong></th>
                    <th rowspan="2" style='width:45px;'><strong>基本</strong></th>
                    <th rowspan="2" style='width:45px;'><strong>住房</strong></th>
                    <th rowspan="2" style='width:50px;'><strong>课时</strong></th>
                    <th rowspan="2" style='width:50px;'><strong>绩效</strong></th>
                    <th rowspan="2" style='width:60px;'><strong>课消</strong></th>
                    <th rowspan="2" style='width:62px;'><strong>应发</strong></th>
                    <th colspan="4" style='width:232px;'><strong>代扣款项</strong></th>
                    <th colspan="2" style='width:106px;'><strong>六项专项扣除</strong></th>
                    <th rowspan="2" style='width:45px;'><strong>处罚</strong></th>
                    <th rowspan="2" style='width:50px;'><strong>所得税</strong></th>
                    <th rowspan="2" style='width:62px;'><strong>实发</strong></th>
                  </tr>
                  <tr>
                    <th><strong>养老</strong></th>
                    <th><strong>医疗</strong></th>
                    <th><strong>失业</strong></th>
                    <th><strong>公积金</strong></th>
                    <th><strong>子女</strong></th>
                    <th><strong>老人</strong></th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($salaries as $salary)
                  <tr>
                    <td style="font-size: 0.8rem">{{ date('y-m', strtotime($salary['salary_month'])) }}</td>
                    <td style="font-size: 0.8rem">[ {{ $salary['department_name'] }} ] {{ $salary['user_name'] }}</td>
                    <!-- 基本 -->
                    @if($salary['salary_basic']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_basic']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 住房 -->
                    @if($salary['salary_housing']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_housing']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 课时 -->
                    @if($salary['salary_lesson']!=0)
                      <td class="text-right" style="font-size: 0.8rem">
                        <a href="/company/salary/month/lesson?month={{$month}}&user_id={{$salary['user_id']}}" target="_blank">{{ floatval($salary['salary_lesson']) }}</a>
                      </td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 绩效 -->
                    @if($salary['salary_performance']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_performance']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 课消 -->
                    @if($salary['salary_commission']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_commission']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 应发 -->
                    <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_total']) }}</td>
                    <!-- 养老 -->
                    @if($salary['salary_pension']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_pension']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 医疗 -->
                    @if($salary['salary_medical']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_medical']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 失业 -->
                    @if($salary['salary_unemployment']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_unemployment']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 公积金 -->
                    @if($salary['salary_provident']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_provident']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 子女 -->
                    @if($salary['salary_children']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_children']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 老人 -->
                    @if($salary['salary_elderly']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_elderly']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 处罚 -->
                    @if($salary['salary_penalty']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_penalty']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 所得税 -->
                    @if($salary['salary_tax']!=0)
                      <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_tax']) }}</td>
                    @else
                      <td class="text-right" style="font-size: 0.8rem"></td>
                    @endif
                    <!-- 实发 -->
                    <td class="text-right" style="font-size: 0.8rem">{{ floatval($salary['salary_actual_total']) }}</td>
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


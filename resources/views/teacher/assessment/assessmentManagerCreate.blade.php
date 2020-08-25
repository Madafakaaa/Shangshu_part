@extends('main')

@section('nav')
<h2 class="text-white d-inline-block mb-0">校长评分</h2>
<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
  <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
    <li class="breadcrumb-item"><a href="/home"><i class="fas fa-home"></i></a></li>
    <li class="breadcrumb-item active">教师中心</li>
    <li class="breadcrumb-item"><a href="/teacher/assessment">教师考核</a></li>
    <li class="breadcrumb-item active">校长评分</li>
  </ol>
</nav>
@endsection

@section('content')
<div class="container-fluid mt-4">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="card-body p-0">
          <form action="/teacher/assessment/manager/store" method="post" id="form1" name="form1" onsubmit="submitButtonDisable('submitButton1')">
            @csrf
            <table class="table table-hover datatable-basic text-left table-bordered p-0">
              <thead class="thead-light">
                <tr>
                  <th style='width:40px;'>内容</th>
                  <th style='width:20px;'>比值</th>
                  <th style='width:25px;'>分值</th>
                  <th style='width:600px;'>指标评价标准</th>
                  <th style='width:40px;'>分数</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td rowspan="9">教务工作</td>
                  <td rowspan="9">37%</td>
                  <td>1-3分</td>
                  <td>在接单后10天之内是否按学生情况制定个性化的教学计划并在教学过程中认真执行；是否根据学生进步情况进行适当及时的调整。</td>
                  <td><input type="number" class="form-control" name="input1" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>教案格式内容齐全，内容充实，各项填写详尽，环节清晰，字迹工整且有教学主管签章。</td>
                  <td><input type="number" class="form-control" name="input2" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>按规定时间进行月考(模板)，试卷难易比例适中，考后有详细及完整的试卷分析存放在学生档案中。</td>
                  <td><input type="number" class="form-control" name="input3" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>所教授学生每月课时消耗是否按计划进行，因故缺课是否及时补上。</td>
                  <td><input type="number" class="form-control" name="input4" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-6分</td>
                  <td>所教授学生每月月考成绩是否有稳步提高，提高5分以内一段，5-10分一段，10分以上一段。</td>
                  <td><input type="number" class="form-control" name="input5" number="true" min="1" max="6" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>是否积极参加学校教务部门组织的教研、教务竞赛等活动。</td>
                  <td><input type="number" class="form-control" name="input6" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>课后作业布置合理，能有效配合课堂教学且及时认真地批改。(用红色笔批改)</td>
                  <td><input type="number" class="form-control" name="input7" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>0-3分</td>
                  <td>是否有出现退单</td>
                  <td><input type="number" class="form-control" name="input8" number="true" min="0" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-6分</td>
                  <td>任课教师在每次课后，每周例会时是否及时地和学管沟通、反映学生学习情况，并形成文字记录。</td>
                  <td><input type="number" class="form-control" name="input9" number="true" min="1" max="6" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td rowspan="6">教育督导</td>
                  <td rowspan="6">24%</td>
                  <td>1-4分</td>
                  <td>陪读记录表中是否详细记录学生陪读期间的学习状态及表现，发现问题时是否及时与学管老师沟通并配合解决。</td>
                  <td><input type="number" class="form-control" name="input10" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>陪读期间合理安排学生学习时间，认真有效地完成学校作业并协调各科老师予以检查及解答疑难习题。</td>
                  <td><input type="number" class="form-control" name="input11" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>陪读期间能管理学生纪律，核对家校本上记录的各项作业，没完成及时记录并在学生离开时及时告知家长。</td>
                  <td><input type="number" class="form-control" name="input12" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>能配合主管召开家长会，并准备好相关材料。</td>
                  <td><input type="number" class="form-control" name="input13" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>辅导日和家长沟通上周上课情况，且提前准备知识点、易错题发给家长并督促学生完成。</td>
                  <td><input type="number" class="form-control" name="input14" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>陪读期间对学生的安全负责，学生短暂离开校区时陪读老师要及时告知学管老师保证不出意外。</td>
                  <td><input type="number" class="form-control" name="input15" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td rowspan="5">责任心</td>
                  <td rowspan="5">15%</td>
                  <td>1-3分</td>
                  <td>能够积极主动地把工作中遇到的问题向上级领导反映，并提出自己的想法和建议，并在工作中加以运用。</td>
                  <td><input type="number" class="form-control" name="input16" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>对于工作中出现的困难，能够主动想办法处理。</td>
                  <td><input type="number" class="form-control" name="input17" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>能正确认识自己工作中存在的问题，并积极地改善。</td>
                  <td><input type="number" class="form-control" name="input18" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>是否每周上交第二周的工作计划，是否每周上交上一周的工作回顾小结。</td>
                  <td><input type="number" class="form-control" name="input19" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>对于同事遇到的问题能够主动地帮忙解决，陪读过程中能互帮互助，做到科目互补，具有良好的团队合作意识。</td>
                  <td><input type="number" class="form-control" name="input20" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td rowspan="7">工作纪律</td>
                  <td rowspan="7">24%</td>
                  <td>0-3分</td>
                  <td>每月出勤是否正常(月事假3天以上0分)。</td>
                  <td><input type="number" class="form-control" name="input21" number="true" min="0" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>是否听从领导工作总体安排，是否在接受学生过程中存在区别对待现象，是否存在借故拒绝辅导现象发生。</td>
                  <td><input type="number" class="form-control" name="input22" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>0-3分</td>
                  <td>是否有迟到早退现象(月迟到早退次数3次以上0分)。</td>
                  <td><input type="number" class="form-control" name="input23" number="true" min="0" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>是否按规定穿工装，个人办公区域及公共区域打扫是否干净。</td>
                  <td><input type="number" class="form-control" name="input24" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>上课期间不玩手机，在教师内不吸烟，进入校区后手机调为震动模式。</td>
                  <td><input type="number" class="form-control" name="input25" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-4分</td>
                  <td>一对一授课课时是否保证，是否出现课时不够或用休息变相缩减课时的现象。上课不迟到、不无故缺课。</td>
                  <td><input type="number" class="form-control" name="input26" number="true" min="1" max="4" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td>1-3分</td>
                  <td>是否违反学校各项规章制度。</td>
                  <td><input type="number" class="form-control" name="input27" number="true" min="1" max="3" autocomplete="off" required></td>
                </tr>
                <tr>
                  <td rowspan="3" colspan="2">加分项</td>
                  <td>0-5分</td>
                  <td>参加本校教材研发并按进度完成工作且提交，当月加5分。</td>
                  <td><input type="number" class="form-control" name="input28" number="true" min="0" max="5" autocomplete="off" required value="0"></td>
                </tr>
                <tr>
                  <td>0-10分</td>
                  <td>参加招生宣传10次以上或有转介绍学生的当月加5分。</td>
                  <td><input type="number" class="form-control" name="input29" number="true" min="0" max="10" autocomplete="off" required value="0"></td>
                </tr>
                <tr>
                  <td>0-20分</td>
                  <td>主持召开家长会每次加1分。</td>
                  <td><input type="number" class="form-control" name="input30" number="true" min="0" max="20" autocomplete="off" required value="0"></td>
                </tr>
                <tr>
                  <td colspan="4"></td>
                  <td>
                    <input type="hidden" name="month_assessment_user" value="{{$user_id}}">
                    <input type="hidden" name="month_assessment_month" value="{{$month}}">
                    <input type="submit" class="form-control btn btn-warning">
                  </td>
                </tr>
              </tbody>
            </table>
          <form>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

@section('sidebar_status')
<script>
  linkActive('link-teacher');
  navbarActive('navbar-teacher');
  linkActive('teacherAssessment');
</script>
@endsection

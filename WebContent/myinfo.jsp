<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>个人信息</title>
  <link rel="stylesheet" href="./css/myinfo/base.css" type="text/css" />
  <link rel="stylesheet" href="./css/myinfo/moco.min.css" type="text/css" />
  <link rel="stylesheet" href="./css/myinfo/profile-less.css" type="text/css" />
  <link rel="stylesheet" href="./css/base/index.css" />
  <link rel="stylesheet" href="./css/base/bootstrap.css" />
</head>
<body >
<div class="nava"></div>
<div class="myinfo_center">
<div class="bg">
  <img src="./img/背景.png" width="950" height="400"/>
</div>
<div id="main">

  <div class="page-settings">
    <div class="top">
      <div class="w960 mauto top_title">
        <p>个人信息</p>
      </div>
    </div>
    <div class="setting pb10">
      <div class="nav-tabs pa">
        <a href="javascript:;" class="baseinfo fl active" id="a" onclick="a()">项目总览与获奖信息</a>
        <a href="javascript:;" class="countinfo fl" id="a1" onclick="a1()">报名信息</a>
        <a href="javascript:;" class="countinfo fl" id="a2" onclick="a2()">修改报名信息</a>  
        <a href="javascript:;" class="countinfo fl" id="a3" onclick="a3()">添加项目</a> 
      </div>
   <div class="contentBox">
      <div class="formBox">
          <div id="setting-profile" class="setting-wrap setting-profile">          
              <div class="wlfg-wrap clearfix">
                <s:iterator value="#request.products1" var="user">
                <label class="label-name" for="nick" >项目名称：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" style="color:#07111b" name="nickname" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="<s:property value="#user.products_name" />"/>
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
                <label class="label-name" for="nick" >获奖情况：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" style="color:#07111b" name="nickname" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="<s:property value="#user.products_author" />"/>
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
                </s:iterator>
              </div>
          </div>
        </div>
      
      <div class="formBox1" style="display:none;">									
       <form id="profile" >
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >姓名：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" name="nickname" style="color:#07111b" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_name }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
       </form>
       <form id="profile" >
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >性别：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" name="nickname" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_sex }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
       </form>
       <form id="profile" >
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >学院：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" name="nickname" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_department }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
       </form>
       <form id="profile" >
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >学号：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" name="nickname" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_id }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
       </form>
        <form id="profile" >
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >电话号码：</label>
                <div class="rlf-group">
                  <input type="text" readonly="readonly" name="nickname" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_tel }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
         </form>
       </div>
         <div class="formBox2" style="display:none;">
          <form action="${path}updateSign_upX" method="post">									
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >姓名：</label>
                <div class="rlf-group">
                  <input type="text" name="student_name" style="color:#07111b" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_name }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >性别：</label>
                <div class="rlf-group">
                  <input type="text" name="student_sex" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_sex }"/>
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >学院：</label>
                <div class="rlf-group">
                  <input type="text" name="student_department" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_department }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >学号：</label>
                <div class="rlf-group">
                  <input type="text" name="student_id" readonly="readonly" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_id }" />
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >电话号码：</label>
                <div class="rlf-group">
                  <input type="text" name="student_tel" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control" value="${session.student_tel }" />
                  <input type="text" style="display:none" name="user.tel" value="${session.tel }">
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
          <input type="submit" class="btn btn-primary" value="确认修改" />
        </form>
       </div>
       <div class="formBox3" style="display:none;">
         <form action="${path}QaddProducts" method="post">								
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >团队成员：</label>
                <div class="rlf-group">
                  <input type="text" name="products_author" style="color:#07111b" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入团队成员,成员之间用空格隔开."/>
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >指导老师：</label>
                <div class="rlf-group">
                  <input type="text" name="instructor" style="color:#07111b" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入项目指导老师."/>
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >项目名称：</label>
                <div class="rlf-group">
                  <input type="text" name="products_name" id="nick" style="color:#07111b" autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入项目名称."/>
                  <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <div class="wlfg-wrap clearfix">
                <label class="label-name" for="nick" >比赛：</label>
                <div class="rlf-group">
                 <select name="match.match_id" class="form-control" class="dfinput">
					    <option value="1" selected="selected">计算机创新创业大赛</option>
				 </select>	
                 <input type="text" name="user.tel" style="display:none" value="${session.tel }" />
                 <p class="rlf-tip-wrap errorHint color-red" ></p>
                </div>
              </div>
              <input type="submit" class="btn btn-primary" value="添加" />
             </form>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="bottom"></div>
</body>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/index.js" ></script>
</html>

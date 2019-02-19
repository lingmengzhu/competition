<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
request.setAttribute("path", basePath);  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/competition/admin/css/add.css" type="text/css" />
<script type="text/javascript" src="/competition/admin/js/jquery.js"></script>
<link rel="stylesheet" href="/competition/admin/css/bootstrap.min.css" type="text/css" media="screen" />
</head>
<body>
<div>
		<p>添加作品</p>
        <div class="content" >
		   <form action="${path }admin/updateSign_up">
		   	  <ul>
		   	  <li class="">
                     <label class="">得到的奖项:</label>
                     <input class="" type="text" value="${sign_up.student_prize }" name="student_prize"/>
                </li>
		   	    <li class="">
                     <label class="">学生学号:</label>
                     <input class="" type="text" value="${sign_up.student_id }" name="student_id"/>
                </li>
                <li class="">
                     <label class="">学生性别:</label>
                     <input class="" type="text" value="${sign_up.student_sex }" name="student_sex"/>
                </li>
                <li class="">
                     <label class="">获奖用户:</label>
                     <input class="" type="text" value="${sign_up.user.tel }" name="user.tel"/>
                </li>
                <li class="">
                     <label class="">学生所属院系:</label>
                     <input class="" type="text" value="${sign_up.student_department }" name="student_department"/>
                </li>
                <li class="">
                     <label class="">学生姓名:</label>
                     <input class="" type="text" value="${sign_up.student_name }" name="student_name"/>
                </li>
		   	  	  <li class="">
                     <label class="">参与的比赛:</label>
                     <input class="" type="text" value="${sign_up.match.match_id }" name="match.match_id"/>
                </li>
                 <li class="">
                     <label class="">参与比赛的项目</label>
                     <input class="" type="text" value="${sign_up.student_project }" name="student_project"/>
                </li> 
                <li class="">
                     <label class="">联系电话:</label>
                     <input class="" type="text" value="${sign_up.student_tel }" name="student_tel"/>
                </li>
               
                 <li >
                 	<label class=""></label>
                 	<button name=""  type="submit" class="determine" onclick="vs()" >确认</button>
                 </li>
             </ul>
          </form>
	    </div>
    </div>
</body>
<script type="text/javascript">
function vs(){
	alter("更新成功")
}
</script>
</html>
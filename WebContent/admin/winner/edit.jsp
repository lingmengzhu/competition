<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
request.setAttribute("path", basePath);  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>作品添加</title>
<link rel="stylesheet" href="/competition/admin/css/borain-timeChoice.css">
<link rel="stylesheet" href="/competition/admin/css/add.css" type="text/css" />
<script type="text/javascript" src="/competition/admin/js/jquery.js"></script>
<link rel="stylesheet" href="/competition/admin/css/bootstrap.min.css" type="text/css" media="screen" />
	<body>
	<div>
		<p>添加作品</p>
        <div class="content" >
		   <form action="${path }admin/updateUserinfo">
		   	  <ul>
		   	    <li class="">
                     <label class="">获奖id:</label>
                     <input class="" type="text" value="${userinfo.own_id }" name="own_id"/>
                </li>
                <li class="">
                     <label class="">获奖用户:</label>
                     <input class="" type="text" value="${userinfo.user.tel }" name="user.tel"/>
                </li>
                <li class="">
                     <label class="">学生姓名:</label>
                     <input class="" type="text" value="${userinfo.own_studentname }" name="own_studentname"/>
                </li>
		   	  	  <li class="">
                     <label class="">参与的比赛:</label>
                     <input class="" type="text" value="${userinfo.own_matchs }" name="own_matchs"/>
                </li>
                 <li class="">
                     <label class="">参与比赛的作品</label>
                     <input class="" type="text" value="${userinfo.own_products }" name="own_products"/>
                </li>
                 <li class="">
                     <label class="">得到的奖项:</label>
                     <input class="" type="text" value="${userinfo.own_prizes }" name="own_prizes"/>
                </li>
                <li class="">
                     <label class="">联系电话:</label>
                     <input class="" type="text" value="${userinfo.own_tel }" name="own_tel"/>
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
		alert="添加成功"
	}
	</script>
</html>

 
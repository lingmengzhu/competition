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
<link rel="stylesheet" href="../css/borain-timeChoice.css">
<link rel="stylesheet" href="../css/add.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" media="screen" />
	<body>
	<div>
		<p>添加作品</p>
        <div class="content" >
		   <form action="${path }admin/addUserinfo">
		   	  <ul>
		   	     <li class="">
                     <label class="">用户名:</label>
                     <input class="" type="text" value="" name="user.tel"/>
                 </li>
		   	     <li class="">
                     <label class="">学生姓名:</label>
                     <input class="" type="text" value="" name="own_studentname"/>
                 </li>
		   	  	 <li class="">
                     <label class="">参与的比赛:</label>
                     <input class="" type="text" value="" name="own_matchs"/>
                 </li>
                 <li class="">
                     <label class="">参与比赛的作品</label>
                     <input class="" type="text" value="" name="own_products"/>
                </li>
                 <li class="">
                     <label class="">得到的奖项:</label>
                     <input class="" type="text" value="" name="own_prizes"/>
                </li>
                <li class="">
                     <label class="">个人电话:</label>
                     <input class="" type="text" value="" name="own_tel"/>
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

 
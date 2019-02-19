<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
	</head>
	<body>
		<div class="bottom">
			        <div class="logo_icon">
			 	      <div class="icon1"></div>
			 	      <div><img src="./img/logo.png" height="30" width="300" class="name"></div>
			        </div>
			        <div class="nav_menu">
			        <p>版权：萍乡学院&nbsp;信息与计算机工程学院 &nbsp;地址：江西省萍乡市萍安北大道211号 </p>
			        <p>邮编：337055 &nbsp;
			                      联系电话：0799-6684899 传真：0799-6682222 &nbsp;</p>
			        </div>
	    </div>
	</body>
</html>
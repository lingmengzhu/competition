<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	request.setAttribute("path", basePath);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录界面</title>
<link rel="stylesheet" type="text/css" href="css/base/Login_style.css" />
<script type="text/javascript" src="js/Login_javascript.js"></script>

</head>
<body>
<h2 style="padding-top: 80px; padding-left: 560px;">赛事网后台管理系统登录</h2>
<div class="login_frame"></div>
<div class="LoginWindow">
  <div>
    <div class="login">
    <form action="<c:url value='${path}login.action'/>" method="post">
    <p>
      <label for="login">帐号:</label>
      <input type="text" name="managername" id="id" value="">
    </p>
    <p>
      <label for="password">密码:</label>
      <input type="password" name="managerpassword" id="password" value="">
    </p>
    <p class="login-submit">
      <a href="#"><button type="submit" class="login-button">Login</button></a>
    </p>
    </form>
    </div>
    
  </div>
</div>
</body>
</html>

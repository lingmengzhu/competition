<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>萍院“互联网+”大赛</title>
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/bootstrap.css" />
        <link rel="stylesheet" href="<%=basePath%>/css/base/login-register.css" />
	</head>
	<body>
		<div class="top">
			 <div class="logo_icon">
			 	<div class="icon1"></div>
			 	<div><a href="index.jsp"><img src="./img/logo.png" height="30" width="300" class="name"></a></div>
			 </div>
			 <div class="nav_menu">
		     	 <ul style="list-style:none;" >
			       <li> <a href="${path }findAllTypeProductsForShow"><img src="img/nav1.png" width="100" ></a></li>
			        <li><a href="Award.jsp"><img src="img/nav2.png" width="100"></a></li>
			       <s:if test="#session.tel==null">
			       <li> <a data-toggle="modal" onclick="openLoginModal();">
			        <img src="img/nav3.png" width="100" >
			        </a></li>
			       <li> <a data-toggle="modal" onclick="openLoginModal();">
			        <img src="img/nav6.png" width="100">
			        </a></li>
			       <li> <a data-toggle="modal"  onclick="openLoginModal();">
			        <img src="img/nav4.png" width="60"  id="aab">
			        </a></li>
			       <li> <a data-toggle="modal" onclick="openRegisterModal();">
			        <img src="img/nav5.png" width="60">
			        </a></li>
			        </s:if>
			         <s:else>
			        <li> <a href="${path }findUserProductsForShow"><img src="img/nav3.png" width="100" ></a></li>
			        <li> <a href="contest.jsp"><img src="img/nav6.png" width="100"></a></li>		  
			        <li><img  src="img/2.png" width="60" id="aaa"></li>
                    <li><h3 style="color:white;">${session.tel}</h3>            
                    <li id="b"><a href="logout.action" style="font-size:23px;color:white;">注销</a></li>
	                </s:else>	
			        </ul>        
			 </div>
		</div>
		
     <div class="container">
      		 <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">     
                       <div class="modal-body">                     
                        <div class="box">
                             <div class="content">                       
                                <div class="form loginBox">
                                	<div class="login-header" align="center" > <h1>登陆</h1></div>
                                    <input id="username" class="form-control" type="text" placeholder="请输入账号" name="tel">
                                    <input id="password" class="form-control" type="password" placeholder="请输入密码" name="password">
                                    <input class="btn btn-default btn-login" type="submit" value="登陆" onclick="check('username','password')">
                                </div>	
                                
                            </div>
                        </div>
                        <!--注册框内的内容-->
                        <div class="box">
                            <div class="content registerBox" >
                             <div class="form">
                             	<div class="login-header" align="center" > <h1>注册</h1></div>
                                <form name="myForm">
                                <input id="username" class="form-control" type="text" placeholder="账号*请输入6到11位数字*" name="tel">
                                <input id="password" class="form-control" type="password" placeholder="密码 *以字母开头，长度在6~10之间*" name="password">
                                <input id="password_confirmation" class="form-control" type="password" placeholder="重复密码" name="password_confirmation">
                                <button type="button" class="btn btn-default btn-register" onclick="validateForm()">注册</button>  
                                </form>
                                </div>
                                
                            </div>
                        </div>

                    </div>
                    
                    
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>
                                 <a href="javascript: showRegisterForm();">进行注册</a>
                            ?</span>
                        </div>
                        <!--注册的底部，达到跳转到登陆界面的作用-->
                        <div class="forgot register-footer" style="display:none">
                             <span>已经有了一个账号?</span>
                             <a href="javascript: showLoginForm();">登陆</a>
                        </div>
                        
                    </div>        
    		      </div>
		      </div>
		  </div>
    </div>
        <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=basePath%>/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=basePath%>/js/login-register.js" ></script>
		
	</body>
</html>

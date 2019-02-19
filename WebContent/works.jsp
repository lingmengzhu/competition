<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
 <%@taglib uri="/struts-tags" prefix="s" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>作品展示</title>
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/layout.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/login-register.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/bootstrap.css" />
	    <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
		 <script type="text/javascript" src="<%=basePath%>/js/jquery.easing.min.js"></script>
		 <script type="text/javascript" src="<%=basePath%>/js/jquery.mixitup.min.js"></script>
		 <script type="text/javascript" src="<%=basePath%>/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=basePath%>/js/login-register.js" ></script>		
		<script type="text/javascript">
		$(function(){
			var filterList = {
				init:function(){
					// MixItUp plugin
					$('#portfoliolist').mixitup({
						targetSelector: '.portfolio',
						filterSelector: '.filter',
						effects: ['fade'],
						easing: 'snap',
						// call the hover effect
						onMixEnd: filterList.hoverEffect()
					});				
				},
				hoverEffect:function(){
					// Simple parallax effect
					$('#portfoliolist .portfolio').hover(function(){
						$(this).find('.label').stop().animate({bottom:0},200,'easeOutQuad');
						$(this).find('img').stop().animate({top:-30},500,'easeOutQuad');				
					},function(){
						$(this).find('.label').stop().animate({bottom:-40},200,'easeInQuad');
						$(this).find('img').stop().animate({top:0},300,'easeOutQuad');								
					});				
				}
			};
			filterList.init();
			
		});	
	</script>
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
	    <div class="myinfo_center1">
	    <div class="container"> 
	            <nav class="navbar" role="navigation">
					    <ul class="nav nav-tabs clearfix" id="filters"> 
							  <li class="active"><span  class="filter active" data-filter="app card icon logo web">全部</span></li>
							  <li><span class="filter" data-filter="app">视频</span></li>
							  <li><span class="filter" data-filter="web">开发</span></li>
							  <li><span class="filter" data-filter="logo">图片</span></li>
							   <form class="navbar-form navbar-right" role="search">			 
						        <div class="form-group">
						        <input type="text" class="form-control" id="bb" placeholder="搜索">
						        </div>
						        <button type="button"  onclick="search()" class="btn btn-default">搜索</button>
						       </form>
						</ul>	
		       </nav> 
					<div id="portfoliolist">
					<s:iterator value="#request.videoproducts" id="videoproducts">
						<div class="portfolio logo" data-cat="logo">
						
							<div class="portfolio-wrapper">
								<img src="<s:property value="#videoproducts.pic_path" />" alt="" />
								<div class="label">
									<div class="label-text"><a class="text-title"><s:property value="#videoproducts.products_name" /></a></div>
									<div class="label-bg"></div>
								</div>
							</div>
					
						</div>
							</s:iterator>
							<s:iterator value="#request.developproducts" id="developproducts">
						<div class="portfolio app" data-cat="app">
						
							<div class="portfolio-wrapper">
								<img src="<s:property value="#developproducts.pic_path" />" alt="" />
								<div class="label">
									<div class="label-text"><a class="text-title"><s:property value="#developproducts.products_name" /></a></div>
									<div class="label-bg"></div>
								</div>
							</div>
					
						</div>
							</s:iterator>
								<s:iterator value="#request.pictureproducts" id="pictureproducts">
						<div class="portfolio web" data-cat="web">
					
							<div class="portfolio-wrapper">
								<img src="<s:property value="#pictureproducts.pic_path" />" alt="" />
								<div class="label">
									<div class="label-text"><a class="text-title"><s:property value="#pictureproducts.products_name" /></a></div>
									<div class="label-bg"></div>
								</div>
							</div>
					
						</div>	
							</s:iterator>	
	    </div>			
	    </div>
	    </div>
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

<script type="text/javascript">
function check(userid,passwordid) { 
    var username = document.getElementById(userid).value;  
    var password = document.getElementById(passwordid).value;  
    if (username.length == 0) {  
        alert("用户名不能为空");  
    } else if (password.length == 0) {  
    	alert("密码不能为空");
    }else if(username.length != 0 && password.length != 0){  
        //ajax(user,password);  
        if(!(/(^[1-9]\d*$)/.test(username))){  
            document.getElementById("inform").innerHTML="用户名含有非法字符";//有其他字母或者符号型字符的存在  
        }else{  
           user=parseInt(username);
            ajax(user,password);  
        }  
          
    }  
}  
function createXMLhttp() {  
    var xmlhttp;  
    if (window.XMLHttpRequest)  
    {  
        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码  
        xmlhttp=new XMLHttpRequest();  
    }  
    else  
    {  
        // IE6, IE5 浏览器执行代码  
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    return xmlhttp;  
}
function ajax(user,password) {  
	console.log("sss");
    var xmlhttp = createXMLhttp();
    //发送向指定url发送Ajax请求  
    var sendData = "Username="+user+"&Password="+password+"&t="+Math.random();//添加Math.random（）后缀消除缓存  
    var url = "log?"+sendData;  
    xmlhttp.open("GET",url,true);  
    xmlhttp.send();  
    //当请求得到响应时，执行的逻辑  
    xmlhttp.onreadystatechange=function(){  
        if (xmlhttp.readyState==4 && xmlhttp.status==200)  
        {  
            var logindata = JSON.parse(xmlhttp.responseText);  
            if(logindata.checkResult == null){  
                alert("该用户不存在");  
            }else if (logindata.checkResult == true) {  
                window.location.href="index.jsp";  
                //alert("done");  
            }else if (logindata.checkResult == false){  
            	alert("密码输入错误");
            }       
        }  
    }   
} 
function search(){
	var a=document.getElementById("bb").value;
	var url="${pageContext.request.contextPath}/findProductsBykey.action";
	var param={keywords:a};
	$.post(url,param,function(data){
		$(data).each(function(i,n){
			
		});
	},"json");
};
</script>
</html>

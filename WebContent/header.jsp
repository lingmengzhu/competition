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
		<title>校园赛事网</title>
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/bootstrap.css" />
	</head>
	<body>
	<div id="carousel-example-generic" class="carousel slide header ">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	  </ol>
	
	  <!-- Wrapper for slides -->
	 <div class="carousel-inner">
	  <div class="item active">
	    <img src="img/背景3.png">
	    <div class="carousel-caption">
	    </div>
	  </div>
	
	  <div class="item">
	    <img src="img/背景4.png">
	    <div class="carousel-caption">
	    </div>
	  </div>
	  
	  <div class="item">
	    <img src="img/背景5.png">
	    <div class="carousel-caption">
	    </div>
	  </div>
	</div>
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>
	</div>
	<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
	<script type="text/javascript" src="<%=basePath%>/js/bootstrap.js" ></script>
		<script>
			$('.carousel').carousel({
                   interval:3000,
                  })
		</script>
	</body>
</html>

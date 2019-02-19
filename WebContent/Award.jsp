<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
	
		<title>获奖动态</title>
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/bootstrap.css" />
	  
	</head>
	<body>
	    <div class="nava"></div>
	    <div class="myinfo_center1">
	          <h2>萍乡学院“互联网+”大学生创新创业获奖情况详情</h2>
	          <h3>发布时间:2018-01-01</h3>
              
				<div class="match_center">
				     <div class="match_center_img"></div><span><font size="5px">比赛信息</font></span>
				      <div class="match-center_text"><h3>创新创业大赛是有由信息与计算机工程学院承办，萍乡学院主办的科技型大赛。大赛秉承“政府主导、公益支持、市场机制”的模式，既有效发挥了政府的统筹引导能力，又最大化聚合激发了学生的积极性</h3></div>
				      
				       <div class="match_center_img"></div><span><font size="5px">比赛规则</font></span>
				      <div class="match-center_text"><h3>学生准备好项目讲解，由老师点评并决定名次</h3></div>
				      
				      <div class="match_center_img"></div><span><font size="5px">获奖详情</font></span>
				      <div class="match-center_text"><h3>一等奖:XXXXXXXX</h3><h3>二等奖:XXXXXXXX</h3><h3>三等奖:XXXXXXXX</h3></div>
				      
				       <div class="match_center_img"></div><span><font size="5px">联系我们</font></span>
				      <div class="match-center_text">信息与计算机工程学院副院长:李希勇老师<h3>138-7996-9798</h3></div>
				
				</div>
	      </div>
<%-- 	      <div class="myinfo_right">
	                    <h2>项目获奖详情</h2>
						    <div class="section">
	                     <ul class="clearfix">			
						    <li>
							<div class="photo"><img src="${session.pic_path0}" width="250" height="210"/></div>
							<div class="rsp"></div>
							<div class="text"><a href="#"><h3>一等奖</h3></a></div>
							</li>
							 <li>
							<div class="photo"><img src="${session.pic_path1}" width="250" height="210"/></div>
							<div class="rsp"></div>
							<div class="text"><a href="#"><h3>一等奖</h3></a></div>
							</li>
							 <li>
							<div class="photo"><img src="${session.pic_path2}" width="250" height="210"/></div>
							<div class="rsp"></div>
							<div class="text"><a href="#"><h3>一等奖</h3></a></div>
							</li>
							
						</ul>
						<div class="clear"></div>
	                    </div>
		 </div> --%>

    
		<div class="bottom"></div>
	</body>
	 <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
     <script type="text/javascript" src="<%=basePath%>/js/index.js" ></script>
</html>

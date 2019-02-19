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
		 <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
	     <script type="text/javascript" src="<%=basePath%>/js/index.js" ></script>
	  
	</head>
	<body>
	    <div class="nava"></div> 
       <div class="box1">
			<ul class="fl_l">
				<li class="active"><a href="##">项目简介</a></li>
				<li><a href="##">团队成员</a></li>
				<li><a href="##">指导老师</a></li>
				<li><a href="##">项目预览</a></li>
			</ul>
			<ul class="fl_r">
				<li style="height: 400px;"><p>${products.products_name }</p></li>
				<li style="height: 400px;"><p>${products.products_author }</p></li>
				<li style="height: 400px;"><p>${products.instructor }</p></li>
				<li style="height: 200px;"><p>我觉得这里可以放一个图片，或者其他的</p></li>
			</ul>
			<div style="clear: both;"></div>
		</div>
		<script type="text/javascript">
			$(function(){
				//设置标杆
				var _line=parseInt($(window).height()/3);
				$(window).scroll(function(){
					//滚动400px，左侧导航固定定位
					if ($(window).scrollTop()>250) {
						$('.fl_l').css({'position':'fixed','top':50})
					}else{
						$('.fl_l').css({'position':'','top':''})
					};
					$('.fl_l li').eq(0).addClass('active');
					//滚动到标杆位置,左侧导航加active
					$('.fl_r li').each(function(){
						var _target=parseInt($(this).offset().top-$(window).scrollTop()-_line);
						var _i=$(this).index();
						if (_target<=0) {
							$('.fl_l li').removeClass('active');
							$('.fl_l li').eq(_i).addClass('active');
						}
						//如果到达页面底部，给左侧导航最后一个加active
						else if($(document).height()==$(window).scrollTop()+$(window).height()){
							$('.fl_l li').removeClass('active');
							$('.fl_l li').eq($('.fl_r li').length-1).addClass('active');
						}
					});
				});
				$('.fl_l li').click(function(){
					$(this).addClass('active').siblings().removeClass('active');
					var _i=$(this).index();
					 $('body, html').animate({scrollTop:$('.fl_r li').eq(_i).offset().top-_line},500);
				});
			});
		</script>
		<div class="bottom"></div>
	</body>
	
</html>

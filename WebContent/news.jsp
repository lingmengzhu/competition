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
		<title>新闻页面</title>
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/bootstrap.css" />
	</head>
	<body>
		<div class="nava"></div>
		<div class="news">
			<div class="panel-body">
		    <ol class="breadcrumb">
			  <li><a href="index.jsp">首页</a></li>
			  <li class="active">新闻详情</li>
            </ol>
           </div>
			<div class="titlt"><font size="6" color="red">江西省第四届大学生创业公开课首场活动在萍乡学院拉开序幕</font></div>
			<div class="datatime"><font size="4" color="brown">2017-15-7</font></div>
			<div class="text_news">
				<h3>11月16日下午，由省教育厅、省发改委、省人力资
					源和社会保障厅、省国税局、省工信委、省金融办、
					省广播电视台联合主办、萍乡学院承办的江西省第
					四届创业公开课首场活动在萍乡学院音乐厅拉开序幕
					。萍乡学院院长史焕平、党委副书记蔡宝琦、省高等院
					校毕业生就业工作办公室主任陈学军、萍乡市劳动就业
					服务管理局局长刘忠文、省广播电视台综合新闻频率副总
					监杨盛海、省广播电视台综合新闻频率策划部主任高颖、
					省高等院校毕业生就业工作办公室创业科科长安光等领导出
					席了本场活动。</h3>
					<img src="img/58f827499f333_1024.png">
                 <h3>本次活动旨在通过媒体+社会资源的力量，激发大学生创新
                 	创业热情，精准培育高校创新创业项目，为我省高校创新创业
                 	成果转化和产学研用紧密结合提供有益实践，推动我省的大
                 	学生创新创业工作。</h3>
                 <h3>活动从萍乡学院10个创业团队中选出了
                 	《萍城傩艺》、《工业烟气净化用超重力旋转床》、《疯狂
                 	功夫》3个团队进入神秘营销箱、团队有默契、项目展示、
                 	创业分享、导师给资源五个活动环节的激烈PK，最终《疯狂
                 	功夫》项目综合得分第一获胜。</h3>
                 	<h3>现场1000多名在校大学生分
                 	享了团队管理模式和创业历程，传递了他们的创业体会，鼓励
                 	同学们勇敢地走出创业第一步，激发了大学生的创造力，气
                 	氛十分热烈，新媒体直播在线收看人数突破十万人次，得到
                 	了社会的高度赞誉.</h3>
			</div>
		</div>

		<div class="bottom"></div>
		<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=basePath%>/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=basePath%>/js/index.js" ></script>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
request.setAttribute("path", basePath);  %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
		<link rel="stylesheet" href="<%=basePath%>/css/base/crowd.css" />
		<title>我要参赛</title>
	</head>
	<body>
	<s:if test="#session.student_id==null">
	  <div class="nava"></div>
     <div class="contest_center">
		<div class="content-agileits">
			<h1 class="title">报名信息</h1>
			<div class="right1">
            </div>
		<div class="left1">
				<form action="<%=basePath%>addSign_up" method="post" data-toggle="validator">
					<div class="form-group">
						<label for="firstname" class="control-label">姓名:</label>
						<input type="text" class="form-control" id="firstname" name="student_name" placeholder="姓名" required>
					</div>
					<div class="form-group">
						<label for="lastname" class="control-label">学院:</label>
						<select name="student_department" class="form-control" class="dfinput">
					    <option value="信计学院" selected="selected">信计学院</option>
					    <option value="艺术学院">艺术学院</option>
				        </select>	
					</div>
					<div class="form-group">
						<label for="inputEmail" class="control-label">学号:</label>
						<input type="text" class="form-control" id="number" name="student_id" placeholder="学号" required>
					</div>
					<div class="form-group">
						<label for="Phone" class="control-label">电话号码:</label>
						<input type="text" class="form-control" id="tel" name="student_tel" placeholder="电话号码"  required>
					</div>
					<div class="form-group w3ls-opt">
						<label for="Phone" class="control-label">性别:</label>
						<label class="w3layouts">
							<input type="radio" id="hire" name="student_sex" value="男" checked>男
						</label>
						<label class="w3layouts label2">
							<input type="radio" id="work" name="student_sex" value="女">女
						</label>
					</div>
					<input type="text" name="user.tel" style="display:none" value="${session.tel}"/>
					<div class="form-group" id="submit-match">
						<button type="submit" class="btn btn-success btn-lg">报名参赛</button>
					</div>
				</form>
			</div>
		</div>
     </div>
    <div class="bottom"></div> 
	</s:if>
	<s:else>
    <div class="nava"></div>
    <h1 style="text-align:center;margin-top:200px;">您已参赛,修改以及添加项目信息请在个人信息中自行操作</h1>
    </s:else>
	<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/index.js" ></script>
	</body>	
</html>

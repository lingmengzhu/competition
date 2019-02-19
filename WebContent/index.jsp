<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=basePath%>/css/base/index.css" />
<link rel="stylesheet" href="<%=basePath%>/css/base/bootstrap.css" >
</head>
<body>
	<div class="nava"></div>
	<div class="header"></div>
	<div class="center">	
		<div class="center_top">
			<div class="center_menu">
				<span style="margin-left:-12px;"><img src="img/pin.png">
				<img src="img/works.png"
				width="100"> </span> <span class="more"><a href="${path}findAllProductsForShow">更多</a></span>
			</div>
			 <s:action name="findFourProducts" executeResult="false" namespace="/"></s:action>
			<div class="row">
			 <s:iterator value="#request.list" id="list">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<a href="javascript:void(0);" class="pic" >
	                      <a href="<s:property value="#list.products_link" />"><img src="<s:property value='#list.pic_path' />" width="270" height="200"></a>
	                    </a>
						<div class="caption">
							<h4 style="text-align:center"><s:property value="#list.products_name" /></h4>
							<%-- <h4 style="text-align:center"><s:property value="#list.products_author" /></h4> --%>
							<p style="text-align:center">
								<a href="#" class="btn btn-primary" role="button" onclick="edit(<s:property value="#list.products_id"/>)">
									查看详情 </a>
							</p>
						</div>
					</div>
				</div>
				</s:iterator>
			</div>

			<div class="center_menu">
				<span style="margin-left:-12px;"><img src="img/pin.png"> <img src="img/menu2.png"
					width="100"> </span> <span class="more"><a
					href="Award.jsp">更多</a></span>
					<s:action name="findFourMatch" executeResult="false" namespace="/"></s:action>
			 <div class="row">
			   <s:iterator value="#request.matchlist1" id="matchlist1">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<a href="javascript:void(0);" class="pic" >
	                      <img src="<s:property value='#matchlist1.match_picture'/>" width="250" height="210">
	                    </a>
						<div class="caption">
							<h4 style="text-align:center"><s:property value="#matchlist1.match_name" /></h4>
							<p style="text-align:center">
								<a href="Award.jsp" class="btn btn-primary " role="button">
									查看详情 </a>
							</p>
						</div>
					</div>
				</div>
				</s:iterator>
			</div>
			</div>
		</div>
	</div>
<%-- 	<div class="newsa">
		<div class="col-md-pull-8">
			<div class="panel panel-success">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-list-alt"></span><b>获奖动态</b>
				</div>
				<div class="panel-body">
				 <s:action name="findFourNews" executeResult="false" namespace="/"></s:action>
					<div class="row">
						<div class="col-xs-12">
							<ul class="demo1">
							<s:iterator value="#request.list1" id="list1">
								<li class="news-item">
									<table cellpadding="4">
										<tr>
											<td> <img src="<s:property value='#list1.news_pic' />" alt="" width="60" class="img-circle"></td>
											<th><s:property value="#list1.news_title" /><a
												href="news.jsp">点击查看</a></th>
										</tr>
									</table>
								</li>
							</s:iterator>
					
							</ul>
						</div>
					</div>
				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div> --%>
	<div class="bottom"></div>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/index.js"></script>
<script type="text/javascript">
function edit(products_id){
			location.href="${pageContext.request.contextPath}/QeditProducts.action?products_id="+products_id;
		}
</script>
	
</body>
</html>

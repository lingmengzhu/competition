<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
	String path = request.getContextPath();
    System.out.println(path);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
 <%@taglib uri="/struts-tags" prefix="s" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
<link rel="stylesheet" href="css/query.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
    th{
        text-align:center;/** 设置水平方向居中 */
        vertical-align:middle/** 设置垂直方向居中 */
    }
    td{
        text-align:center;/** 设置水平方向居中 */
        vertical-align:middle/** 设置垂直方向居中 */
    }
</style>
	</head>
<body>
<div>	
<form action="${path }admin/findAllMatch" id="matchListForm" name="ff" method="post">
<table class="table">
    <thead>
      <tr>
           <th>Id</th>
           <th>比赛名字</th>
           <th>比赛简介</th>
           <th>比赛活动时间</th>
           <th>作品提交截止时间</th>
           <th>比赛的上传时间</th>
           <th colspan="1">操作</th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${!empty pb.list}">
      <s:iterator value="pb.list" id="match">	
       <tr>
	        <td><s:property value="#match.match_id" /></td>
	        <td><s:property value="#match.match_name" /></td>
	        <td><s:property value="#match.match_info" /></td>
	        <td><s:property value="#match.match_time" /></td>
	        <td><s:property value="#match.lastsubmit_time" /></td>
	        <td><s:property value="#match.match_publishtime" /></td>
	        <td><a href='#' onclick="edit(<s:property value="#match.match_id"/>)">编辑赛事</a></td>
	        <%-- <td><a href='#' onclick="del(<s:property value="#match.match_id"/>)">删除赛事以及其作品</a></td> --%>
	  </tr>
	   </s:iterator>
	  </c:if>
	  <c:if test="${empty pb.list}">
					<tr>
					<td colspan="8" align="center">
					暂无信息
					</td>
					</tr>  
	  </c:if>
	  	  <tr>
					<td colspan="8" align="center">
					<div class="pagination">					
					第<s:property value="#request.pb.currentPage" />页
						&nbsp;&nbsp; 共<s:property value="#request.pb.totalPage" /> 页
						&nbsp;&nbsp; 共<s:property value="#request.pb.count" />条信息
					 <div style="height:10px;"></div>
					 <s:if test="#request.pb.currentPage == 1"> 首页&nbsp;&nbsp;上一页 </s:if>
						<s:else>
							<a href='#' onclick="fy(1)">首页</a> 
							<a href='#' onclick="fy(<s:property value="#request.pb.currentPage - 1"/>)">上一页</a>
						</s:else> <s:if test="#request.pb.currentPage != #request.pb.totalPage">
							<a href='#'
								onclick="fy(<s:property value="#request.pb.currentPage + 1"/>)">下一页</a>
								<a	href='#' onclick="fy(<s:property value="#request.pb.totalPage"/>)">尾页</a>
						</s:if> <s:else>下一页&nbsp;&nbsp;尾页</s:else> &nbsp;&nbsp;
						跳转至 <input type="text" style="height:22px;border: 1px solid #888;width:30px;border-radius: 0.2rem;" name="page" id="page"> 页 <a
						href='#' onclick="validate()">跳转</a>
				</div>
					</td>
					</tr>			
      </tbody>
</table> 
<script type="text/javascript">
	          function fy(page)
	          {
	        	  var form=document.getElementById("matchListForm");
	  			 form.action="${pageContext.request.contextPath}/admin/findAllMatch.action?currentPage=" + page ;
	  			 form.submit();
	   		   //window.document.location.href = "${pageContext.request.contextPath}/admin/findInfosByPage.action?currentPage=" + page 		  
	          }
	      	function validate()
	        {
	            var page = document.getElementById("page").value;
	            if(page > <s:property value="#request.pb.totalPage"/> || page <= 0 )
	            {
	                alert("你输入的页数大于最大页数或小于最小页面，页面将跳转到首页！");
	                fy(1)
	             }else{
	            	fy(page)
	           }
	        }
	          </script>
	          <script type="text/javascript">
	          function edit(match_id){
	        	  location.href="${pageContext.request.contextPath}/admin/editMatch.action?match_id="+match_id;
	          }
		function del(match_id){
			if(window.confirm("您确定要删除该比赛？"))
			{
			   
				location.href="${pageContext.request.contextPath}/admin/delMatch.action?match_id="+match_id;
			 }
		}
	</script>
	<%-- <script type="text/javascript">
	$('.table tbody tr:odd').addClass('odd');
</script>   --%>
</form>
</div>
</body>
</html>

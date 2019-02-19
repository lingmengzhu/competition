<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	request.setAttribute("path", basePath);  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>后台主界面</title>
	<link rel="stylesheet" href="${path}admin/css/index.css" />
	<script type="text/javascript" src="${path}admin/js/jquery.js"></script>
	<script type="text/javascript" src="${path}admin/js/common.js"></script>
</head>
<body>
    <!--顶部-->
    <div class="layout_top_header">
            <div style="float: left"><span style="font-size: 24px;line-height: 70px;padding-left: 60px;color: #8d8d8d">赛事网后台管理</span></div>
            <div id="ad_setting" class="ad_setting">
                <a class="ad_setting_a" href="javascript:; ">
                    <i class="icon-user glyph-icon" style="font-size: 30px"></i>
                    <span>管理员</span>
                    <i class="icon-chevron-down glyph-icon"></i>
                </a>
                
                <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
                    <li class="ad_setting_ul_li" onclick="javascript:$('#uform').submit();"> 
                    	<a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span></a></li>
                </ul>
              
            </div>
    </div>
    <!--顶部结束-->
    <!--菜单-->
    <div class="layout_left_menu">
        <ul id="menu">
        	
            <li class="childUlLi">
               <a href="javascript:;"  target="menuFrame"> <i class="glyph-icon icon-home"></i>用户管理</a>
                <ul>
                    <li><a href="${path }admin/findAllUser" target="menuFrame"><i class="glyph-icon icon-chevron-right" id="glyph-icon icon-chevron-right"></i>查询用户</a></li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="javascript:;"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>赛事管理</a>
                <ul>
                    <li><a href="${path }admin/findAllMatch" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>查询赛事</a></li>
                    <li><a href="javascript:show('admin/matchs/add.jsp')"><i class="glyph-icon icon-chevron-right"></i>添加赛事</a></li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="javascript:;"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>新闻管理</a>
                <ul>
                    <li><a href="${path }admin/findAllNews" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>查询新闻</a></li>
                    <li><a href="javascript:show('admin/news/add.jsp')"><i class="glyph-icon icon-chevron-right"></i>添加新闻</a></li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="javascript:;" target="menuFrame" > <i class="glyph-icon  icon-reorder"></i>作品管理</a>
                <ul>
                    <li><a href="${path }admin/findAllProducts" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>查询作品</a></li>
                    <li><a href="javascript:show('admin/works/add.jsp')"><i class="glyph-icon icon-chevron-right"></i>添加作品</a></li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="javascript:;" target="menuFrame"> <i class="glyph-icon icon-location-arrow"></i>参赛人员管理</a>
                <ul>
                    <li><a href="${path }admin/findAllSign_up" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>查询参赛学生</a></li>
                   <%--  <li><a href="${path }admin/findSomeSign_up" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>查询获奖情况</a></li> --%>
                   <!--  <li><a href="javascript:show('admin/winner/add.jsp')"><i class="glyph-icon icon-chevron-right"></i>添加获奖情况</a></li> -->
                </ul>
            </li> 
        </ul>
    </div>
    <!--菜单-->
    <div id="layout_right_content" class="layout_right_content">

        <div class="route_bg">
            <a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i>
            <a href="#">菜单管理</a>
        </div>
        <div class="mian_content">
            <div id="page_content">
                <iframe id="menuFrame" name="menuFrame" src="${path}admin/success.jsp" style="overflow:visible;"
                        scrolling="yes"  frameborder="0" width="100%" height="100%"></iframe>
            </div>
        </div>
    </div>
  

</body>
<script type="text/javascript">
function show(url){
	$("#menuFrame").attr("src",url);
}
</script>


</html>
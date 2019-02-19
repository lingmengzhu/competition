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
		<title>作品添加</title>

<link rel="stylesheet" href="/competition/admin/css/add.css" type="text/css" />
<script type="text/javascript" src="/competition/admin/js/jquery.js"></script>
<link rel="stylesheet" href="/competition/admin/css/bootstrap.min.css" type="text/css" media="screen" />

<!--编辑器-->
<link rel="stylesheet" href="/competition/admin/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="/competition/admin/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/competition/admin/kindeditor/lang/zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script type="text/javascript" src="${path }js/ajaxfileupload.js"></script>
<!-- <script type="text/javascript">		
			KindEditor.ready(function(K) {
			var editor = K.create('textarea[id="content"]', {
				cssPath : '../kindeditor/plugins/code/prettify.css',
				uploadJson : '../kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterBlur : function() {
					this.sync();
					K.ctrl(document, 13, function() {
					K("form[name='ff']")[0].submit();
					});
					K.ctrl(this.edit.doc, 13, function() {
					K("form[name='ff']")[0].submit();
					});
					}
				});
				prettyPrint();
			});		
		</script>   -->
	<body>
	<div>
		<p>添加作品</p>
        <div class="content" >
		   <form action="${path }admin/updateProducts" method="post" enctype="multipart/form-data">
		   	  <ul>
                     <input class="" type="text" style="display:none" value="${products.products_id}" name="products_id"/>
		   	  	<li class="">
                     <label class="">参与的比赛id:</label>
                     <input class="" type="text" value="${products.match.match_id}" name="match.match_id"/>
                </li>
                <li class="">
                     <label class="">作品名</label>
                     <input class="" type="text" value="${products.products_name}" name="products_name"/>
                </li>
                <li class="">
                     <label class="">项目成员</label>
                     <input class="" type="text" value="${products.products_author}" name="products_author"/>
                </li>
                <li class="">
                     <label class="">项目指导老师</label>
                     <input class="" type="text" value="${products.instructor}" name="instructor"/>
                </li>
                <li class="">
                     <label class="">项目获奖情况</label>
                     <input class="" type="text" value="${products.products_prize}" name="products_prize"/>
                </li>
                 <li class="">
                     <label class="">项目链接</label>
                     <input class="" type="text" value="${products.products_link}" name="products_prize"/>
                </li>
                <li>
               	<label class="">作品类别:</label>
               <select name="products_type">
    				<option value="${products.products_type}" selected="selected">${products.products_type}</option>
    				<option value="开发">开发</option>
    				<option value="图片">图片</option>
    				<option value="视频">视频</option>
    			</select>
               	</li>
                  <li>
               	<label class="">图片:</label>
                    <input id="file1" name="file" type="file"  onchange="fileUpload();"/><i></i>
                </li>
                 <img src="${path }${products.pic_path}" id="pic" width="120px" border="0"/>
                <li><input id="picPath" name="pic_path" type="hidden" /></li>
                 <li><label style="width:80px;">是否发布：</label>
                 <select name="products_value">
    				<option value="1" selected="selected">是</option>
    				<option value="0">否</option>
    			 </select>
    			 </li>
                 <li>
                 	<label class=""></label>
                 	<button name=""  type="submit" class="determine" onclick="vs()" >确认</button>
                 </li>
             </ul>
          </form>
	    </div>
    </div>
	</body>	
<!-- 比赛名字字数超过提醒-->
<script type="text/javascript">
function vs(){
	if(("#picPath").val()==""){
	$("#picPath").val("${products.pic_path}");
	}
	alert("更新成功");
}
</script>
<script type="text/javascript">
	function fileUpload() {
	var files = ['file1'];  //将上传三个文件 ID 分别为file2,file2,file3
	$.ajaxFileUpload( {
	url : 'fileUploadAction',     //用于文件上传的服务器端请求地址  
	secureuri : false,            //一般设置为false  
	fileElementId : files,        //文件上传空间的id属性  <input type="file" id="file" name="file" />  
	dataType : 'json',            //返回值类型 一般设置为json  
	success : function(data, status) {
	var fileNames = data.fileFileName; //返回的文件名 
	var filePaths = data.filePath;     //返回的文件地址 
	for(var i=0;i<data.fileFileName.length;i++){
	//将上传后的文件 添加到页面中 以进行下载											
	$("#pic").attr("src","${path }attached/"+filePaths[i]);	
	$("#picPath").val("attached/"+filePaths[i]);	
}
}
})
}
</script>
</html>

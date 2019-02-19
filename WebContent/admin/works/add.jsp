<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
request.setAttribute("path", basePath);  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>作品添加</title>
<link rel="stylesheet" href="../css/add.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" media="screen" />
<!--编辑器-->
<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script type="text/javascript" src="../../js/ajaxfileupload.js"></script>
	<body>
	<div>
		<p>添加作品</p>
        <div class="content" >
		   <form action="${path }admin/addProducts" enctype="multipart/form-data">
		   	  <ul>
		   	  <li class="">
		   	  <label class="">参与比赛</label>
		   	  <select name="match.match_id" id="match_id"  class="dfinput">
						<option value="">--请选择--</option>
						<c:forEach items="${list }" var="c">
							<option value="${c.match_id }">${c.match_name }</option>
						</c:forEach>
				</select>	
		   	  </li> 	  
                <li class="">
                     <label class="">作品名</label>
                     <input class="" type="text" value="" name="products_name"/>
                </li>
                <li class="">
                     <label class="">项目成员</label>
                     <input class="" type="text" value="" name="products_author"/>
                 </li>
                 <li class="">
                     <label class="">项目链接</label>
                     <input class="" type="text" value="" name="products_link"/>
                 </li>
                 <li class="">
                     <label class="">项目指导老师</label>
                     <input class="" type="text" value="" name="instructor"/>
                 </li>
                  <li class="">
                     <label class="">项目类别</label>
                    <select name="products_type">
    				<option value="开发" selected="selected">开发</option>
    				<option value="图片">图片</option>
    				<option value="视频">视频</option>
    			</select>
                 </li>
                 <li class="">
                     <label class="">作品获奖情况</label>
                     <input class="" type="text" value="" name="products_prize"/>
                 </li>
                <li>
               	<label class="">图片:</label>
                    <input id="file1" name="file" type="file"  onchange="fileUpload();"/><i></i>
                </li>
                 <img src="" id="pic" width="120px" border="0"/>
                <li><input id="picPath" name="pic_path" type="hidden" /></li>
                  <!-- <li>
                 	<label class="" style="font-weight:bolder;">作品简介:<br>
                  	<textarea id="content" name="products_text" cols="100" rows="8" style="width:800px;height:400px;" ></textarea></label>
                 </li> -->
                 <li><label style="width:80px;">是否发布：</label><select name="products_value">
    							<option value="1">是</option>
    							<option value="0">否</option>
    						 </select><i></i></li>
                 <li >
                 	<label class=""></label>
                 	<button name=""  type="submit" class="determine" onclick="vs()" >确认</button>
                 </li>
             </ul>
          </form>
	    </div>
    </div>
	</body>	
<!--
	编辑器
-->
<script type="text/javascript">		
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
		</script>
<!-- 比赛名字字数超过提醒-->
<script type="text/javascript">
function vs(){
	alert("添加成功")
}
    function controlLen(){ 
    //获取input输入框元素 
    var inputText = document.getElementById('mytext').value; 
    if(inputText.length > 30){ 
        var text = inputText.substring(0,30); 
        document.getElementById('mytext').value = text;//从新设置input输入框的值 
        alert("最多输入30个字符"); 
    } 
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
<script type="text/javascript"> 
		$(document).ready(function () {  
            var url = "${path}admin/findAllMatchForDrop.action";  
            $.ajax({  
                type:'get',  
                url:url,  
                dataType: 'json',  
                success:function(data){  
                    $.each(data,function(i,list){  
                    	$("#match_id").append("<option value='"+list.match_id+"'>"+list.match_name+"</option>");
                    })  
                }  
            })
        })  
    </script> 
</html>
 
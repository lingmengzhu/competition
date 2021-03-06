<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
request.setAttribute("path", basePath);  %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>添加比赛</title>
<link rel="stylesheet" href="/competition/admin/css/borain-timeChoice.css">
<link rel="stylesheet" href="/competition/admin/css/add.css" type="text/css" />
<link rel="stylesheet" href="/competition/admin/css/bootstrap.min.css" type="text/css" media="screen" />
<!--编辑器-->
<link rel="stylesheet" href="/competition/admin/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="/competition/admin/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/competition/admin/kindeditor/lang/zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>  
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
	<body>
	<div class="matchs_add">
		<p>添加赛事</p>
        <div class="content" >
		   <form action="${path }admin/updateMatch" enctype="multipart/form-data">
		   	  <ul>
		   	      <li>
		   	         <label >比赛id:</label>
                     <input class="" type="text" value="${match.match_id}" name="match_id"  />
                  </li>
		   	  	 <li >
                  	 <label >比赛活动时间:</label>
                     <input class="" type="text" value="${match.match_time}" name="match_time" />
                  </li>
		   	  	<li >
                  	 <label class="">作品提交截止时间:</label>
                     <input class="" type="text" value="${match.lastsubmit_time}" name="lastsubmit_time"/>
                </li>
                <li >
                  	 <label class="">比赛提交时间:</label>
                     <input class="" type="text" value="${match.match_publishtime}" name="match_publishtime"/>
                </li>
		   	  	<li class="">
                     <label class="">比赛名字:</label>
                     <input class="" id="mytext" onkeydown="controlLen();" type="text" value="${match.match_name}" name="match_name"/>
                </li>
               <li>
               	<label class="">图片:</label>
                    <input id="file1" name="file" type="file"  onchange="fileUpload();"/><i></i>
                </li>
                 <img src="${path }${match.match_picture}" id="pic" width="120px" border="0"/>
                <li><input id="picPath" name="match_picture" type="hidden" /></li>
                 <li>
                  	 <label class="">比赛简介:<br>
                  	 <textarea id="content" cols="100" rows="8" style="width:800px;height:400px;" name="match_info">${match.match_info}</textarea></label>
                 </li>    
                 <li>
                	<label class=""></label>
                 	<button name=""  type="submit" class="determine" onclick="vs()">确认</button>    	
                 </li>
             </ul>
          </form>
	    </div>
    </div>
	</body>
	<script>
//  level分为 YM YMD H HM 四个有效值，分别表示年月 年月日 年月日时 年月日时分,less表示是否不可小于当前时间。年-月-日 时:分 时为24小时制
//  为确保控件结构只出现一次，在有需要的时候进行一次调用。
    onLoadTimeChoiceDemo();
    borainTimeChoice({
        start:".start",
        end:".end",
        level:"H",
        less:true
    });
    borainTimeChoice({
        start:".start-two",
        end:"",
        level:"H",
        less:false
    });
</script>
<!--
	编辑器
-->
<!-- 比赛名字字数超过提醒-->
<script type="text/javascript">
function vs(){
	if(("#picPath").val()==""){
	$("#picPath").val("${match.match_picture}");
	}
	alert("更新成功");
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
</html>
 
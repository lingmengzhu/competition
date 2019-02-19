
function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register with');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('Login with');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    $('#aa').css('display:none');
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}


function validateForm(){
	var tel=myForm.tel.value;
	var password=myForm.password.value;
	var password_confirmation=myForm.password_confirmation.value;
	var reg=/^\d{6,10}$/;
	var reg1=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/;
	if(tel==""||tel==null){
		alert("用户名不能为空");
	    myForm.username1.focus();
	    return false;
	}
	else if(password==""||password==null){
		alert("密码不能为空");
		 return false;
	}
	else  if(!reg.test(tel)){
		alert("用户名格式不正确");
		 return false;
	
	}
	else if(!reg1.test(password)){
		alert("密码格式不正确");
		 return false;
	}
	else if(password!=password_confirmation){
	   alert("两次密码不一致"); 
	   return false;
    }
	else{
		sss=parseInt(tel);
		ajaxreg(sss,password);
	}
}

function check(userid,passwordid) { 
    var username = document.getElementById(userid).value;  
    var password = document.getElementById(passwordid).value;  
    if (username.length == 0) {  
        alert("用户名不能为空");  
    } else if (password.length == 0) {  
    	alert("密码不能为空");
    }else if(username.length != 0 && password.length != 0){  
        //ajax(user,password);  
        if(!(/(^[1-9]\d*$)/.test(username))){  
            document.getElementById("inform").innerHTML="用户名含有非法字符";//有其他字母或者符号型字符的存在  
        }else{  
           user=parseInt(username);
            ajax(user,password);  
        }  
          
    }  
}  
function createXMLhttp() {  
    var xmlhttp;  
    if (window.XMLHttpRequest)  
    {  
        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码  
        xmlhttp=new XMLHttpRequest();  
    }  
    else  
    {  
        // IE6, IE5 浏览器执行代码  
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    return xmlhttp;  
}
function ajax(user,password) {  
    var xmlhttp = createXMLhttp();
    //发送向指定url发送Ajax请求  
    var sendData = "Username="+user+"&Password="+password+"&t="+Math.random();//添加Math.random（）后缀消除缓存  
    var url = "log?"+sendData;  
    xmlhttp.open("GET",url,true);  
    xmlhttp.send();  
    //当请求得到响应时，执行的逻辑  
    xmlhttp.onreadystatechange=function(){  
        if (xmlhttp.readyState==4 && xmlhttp.status==200)  
        {  
            var logindata = JSON.parse(xmlhttp.responseText);  
            if(logindata.checkResult == null){  
                alert("该用户不存在");  
            }else if (logindata.checkResult == true) {  
                window.location.href="index.jsp";  
                //alert("done");  
            }else if (logindata.checkResult == false){  
            	alert("密码输入错误");
            }     
        }  
    }   
}
function ajaxreg(sss,password) {  
    var xmlhttp = createXMLhttp();
    //发送向指定url发送Ajax请求  
    var sendData = "Tel="+sss+"&Password="+password+"&t="+Math.random();//添加Math.random（）后缀消除缓存  
    var url = "reg?"+sendData;  
    xmlhttp.open("GET",url,true);  
    xmlhttp.send();
    //当请求得到响应时，执行的逻辑  
    xmlhttp.onreadystatechange=function(){  
        if (xmlhttp.readyState==4 && xmlhttp.status==200)  
        {  
            var logindata = JSON.parse(xmlhttp.responseText);  
            if (logindata.checkResult == true) {  
                alert("注册成功");  
            }else if (logindata.checkResult == false){  
            	alert("此用户名已注册");
            }     
        }  
    }   
}  


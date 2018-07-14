<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResetPassword</title>
<script src="<%=path%>/wangwei/js/jquery-1.9.1.min.js"></script>
<link href="../wangwei/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="../wangwei/css/downpage-reset.css" rel="stylesheet" type="text/css" media="all" />
<script src="../wangwei/js/downpage-reset.js"></script>

<script language="javascript" type="text/javascript">
var code ; //在全局 定义验证码 
function createCode(){  
    code = "";  
    var codeLength = 4;//验证码的长度  
    //所有候选组成验证码的字符，可以用中文  
    var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C',
    		'D','E','F','G','H','I','J','K','L','M','N','O','P',
    		'Q','R','S','T','U','V','W','X','Y','Z','a','b','c',
    		'd','e','f','g','h','i','j','k','l','m','n','o','p',
    		'q','r','s','t','u','v','w','x','y','z');  
    for(var i=0;i<codeLength;i++){  
        var charIndex = Math.floor(Math.random()*60);  
        code +=selectChar[charIndex];  
    }  
    return code; 
}  
function validate(){  
    var inputCode = document.getElementById("code1").value.toLowerCase();  
    if(inputCode.length <=0){  
    	document.getElementById('checkcode').innerHTML="验证码不能为空";
        return false;  
    }  
    else if(inputCode != code.toLowerCase()){  
    	document.getElementById("checkcode").innerHTML="验证码输入有误";
        show();//刷新验证码  
        return false;  
    }else{ 
    	document.getElementById("checkcode").innerHTML="";
        return true;  
    }  
}  
function show(){  
        //显示验证码  
        document.getElementById("valiImg").src="CodeServlet?code="+createCode();  
        
}  
</script>
<script type="text/javascript">
function send(){ 
	var inputPhone = document.getElementById("tel").value;
		 $.ajax({
			 url:'${pageContext.request.contextPath}/page/send',
		  	  type:'post',
		  	  data:{"modiphone":inputPhone},
		  	  dataType:'json',
		  	  success:function(){
		  	  }
		 });
	}
</script>

<script type="text/javascript">
function checksend(){ 
	var temp = false;
	var inputcode = document.getElementById("msgcode").value; 
		 $.ajax({
			 url:'${pageContext.request.contextPath}/page/checksend',
		  	  type:'post',
		  	  data:{"msgcode":inputcode},
		  	  dataType:'json',
		  		async : false,
		  	  success:function(data){
		  		  if (inputcode.length>0&&data.msg==1) {
		  			 temp = true;
		  			return temp;
		  			document.getElementById("msgtip").innerText="";
		  		  }
		  		  	else{
		  			document.getElementById("msgtip").innerText="验证码输入错误";
		  			 temp = false;
		  			 
		  		  		}
		  		  
		  	  }
		 });
		 return temp;
		 
	}
</script>
<script type="text/javascript">
function checkphone(){ 
	var regx=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
	var temp = false;
	var inputPhone = document.getElementById("tel").value;  
	   $.ajax({
		  url:'${pageContext.request.contextPath}/CheckPhone',
	  	  type:'post',
	  	  data:{"inputPhone":inputPhone},
	  	  dataType:'json',
	  	  async : false,
	  	  success:function(data){
	  		  if ((inputPhone.length>0)&&regx.test(inputPhone)) {
	  			if (data.msg==1) {
	  			document.getElementById("checknum").innerText="非用户号码";
	  			temp= false;
						}
	  		  else {
	  			document.getElementById("checknum").innerText="";
	  			temp= true;
			}
	  		  }
	  		  else{
	  			document.getElementById("checknum").innerText="号码不能为空/格式不正确";
	  			temp= false;
	  		  }
	  	  }
	  });
	   return temp;
}
</script>
<script type="text/javascript">
function pass(){ 
	if (checkphone()&&validate()&&checksend()) {
		location.href='../page/downpage-setpwd.jsp'
	}
}
</script>
</head>
<body onload="show()">
<div class="container">
	<div class="row clearfix" id="ground">
		<div class="col-md-12 column">
			<input type="text" placeholder="请输入您的手机号" size="40" id="tel" onblur="checkphone()" ></input>
			<p class="text-warning"  id="checknum"></p>
			<input type="text" placeholder="请输入验证码" id="code1"  name="vlcode" onblur="validate()"></input> 
			<div id="code">
			<img src="" id="valiImg" style="width:128px;height:40px;cursor: pointer;"title="看不清？点击换一张" onclick="show()"/></div>
			<p class="text-warning"  id="checkcode"name="wortip"></p>
			<input type="text" placeholder="请输入短信验证码" id="msgcode" onblur="checksend()"></input> 
			<button type="button" class="btn btn-default" id="sms" onclick="send()">获取短信验证</button>
			<p class="text-warning"  id="msgtip"></p>
			<button type="button" class="btn btn-default" id="submit" onclick="pass()">下一步</button>
		</div>
			
	</div>
</div>


</body>
</html>
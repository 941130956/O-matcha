<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<% String path = request.getContextPath(); %>
<script src="<%=path%>/wangwei/js/jquery-1.9.1.min.js"></script>
<script src="../wangwei/js/downpage-setpwd.js"></script>
<script language="javascript" type="text/javascript">
function checkname(){ 
	var temp = false;
	 var inputName = document.getElementById("forgetusername").value;  
	   $.ajax({
		  url:'${pageContext.request.contextPath}/CheckName',
	  	  type:'post',
	  	  data:{"username":inputName},
	  	  dataType:'json',
	  	  async : true,
	  	  success:function(data){
	  		if (inputName.length>0){
	  		   if (data.msg==1) {
	  			document.getElementById("forgetname").innerText="该用户不存在";
	  			temp= false;
			}
	  		  else {
	  			document.getElementById("forgetname").innerText="";
	  			temp= true;
			}
	  	  }
	  		else{
	  			document.getElementById("forgetname").innerText="用户名不能为空";
	  			temp= false;
	  		}
	  	  }
	  });
}
</script>
<script type="text/javascript">
function checkphone(){ 
	var regx=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
	var temp = false;
	var inputPhone = document.getElementById("forgetpnone").value;  
	   $.ajax({
		  url:'${pageContext.request.contextPath}/CheckPhone',
	  	  type:'post',
	  	  data:{"inputPhone":inputPhone},
	  	  dataType:'json',
	  	  async : false,
	  	  success:function(data){
	  		  if ((inputPhone.length>0)&&regx.test(inputPhone)) {
	  			if (data.msg==1) {
	  			document.getElementById("forgetnum").innerText="非用户号码";
	  			temp= false;
						}
	  		  else {
	  			document.getElementById("forgetnum").innerText="";
	  			temp= true;
			}
	  		  }
	  		  else{
	  			document.getElementById("forgetnum").innerText="号码不能为空/格式不正确";
	  			temp= false;
	  		  }
	  	  }
	  });
	   return temp;
}
</script>
<script type="text/javascript">
function send(){ 
	var inputPhone = document.getElementById("forgetpnone").value;
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
function passcheck(){ 
	if (checkname()&&checkphone()&&checksend()&&checkpwd()&&checkapwd()) {
		return true;
	}else{
		alert("请检查您的填写");
		return false;
	}
}
</script>

<link href="../wangwei/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="../wangwei/css/forgetpwd.css" rel="stylesheet" type="text/css"  />
</head>
<body>
<jsp:include page="/page/indexHeader.jsp" flush="true"/>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form class="form-horizontal" role="form" action="forgetpwd" method="post" onsubmit="return passcheck()">
				<div class="form-group">
						<input type="text" placeholder="请输入您的账户名"  size="40" id="forgetusername" onkeyup="checkname()" name="modiname"></input><br/><br/>
						<p class="text-warning" id="forgetname"></p>
				</div>
				<div class="form-group">
					 <input type="tel" placeholder="请输入注册手机号" size="40" id="forgetpnone" onkeyup="checkphone()" name="modiphone"></input><br/><br/>
					<p class="text-warning"  id="forgetnum"></p>
				</div>
				<div class="form-group">
				<input type="text" placeholder="请输入短信验证码" size="24" id="inputcode" onblur="checksend()"></input> 
				<button type="button" class="btn btn-default" id="sms" onclick="">获取短信验证</button><br/><br/>
				<p class="text-warning"  id="forgetcode"></p>
				</div>
				<div class="form-group">
					<input type="password" placeholder="请设置您的新密码(6-20个字母、数字、下划线 )" size="40" id="pwd" onblur="checkpwd()" onfocus="blurpwd()" name="newpwd"></input><br/><br/>
					<p class="text-warning" hidden="hidden" id="checkpwd">密码格式不正确</p>
				</div>
				<div class="form-group">
					<input type="password" placeholder="请再次确认您的密码" size="40" id="apwd" onblur="checkapwd()" onfocus="blurapwd()"></input><br/><br/>
					<p class="text-warning" hidden="hidden" id="checkapwd">请检查两次是否一致</p>
				</div>
				<input type="submit" class="btn btn-default" id="submit" value="确认修改"/>
				</form>
				
		</div>
	</div>
</div>
<jsp:include   page="/page/indexFooter.jsp" flush="true"/>
</body>
</html>
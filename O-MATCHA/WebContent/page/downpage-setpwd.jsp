<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String path = request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link href="../wangwei/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="<%=path%>/wangwei/js/jquery-1.9.1.min.js"></script>
<script src="../wangwei/js/downpage-setpwd.js"></script>

</head>
<body>
<div class="container">
	<div class="row clearfix" id="ground">
		<div class="col-md-12 column">
		<form class="form-horizontal" role="form" action="modipwd" method="post">
			<input type="password" placeholder="请设置您的密码(6-20个字母、数字、下划线 )" size="40" id="pwd" onblur="checkpwd()" onfocus="blurpwd()" name="newpwd"></input><br/><br/>
			<p class="text-warning" hidden="hidden" id="checkpwd">密码格式不正确</p>
			<input type="password" placeholder="请再次确认您的密码" size="40" id="apwd" onblur="checkapwd()" onfocus="blurapwd()"></input><br/><br/>
			<p class="text-warning" hidden="hidden" id="checkapwd">请检查两次是否一致</p>
			<input type="submit" class="btn btn-default" id="submit" value="下一步" />
		</form>
		</div>
			
	</div>
</div>
</body>
</html>
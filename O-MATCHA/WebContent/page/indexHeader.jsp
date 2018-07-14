<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index-header</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/qingxiping/css/index.css"/>
<script type="text/javascript" src="<%=path%>/qingxiping/js/index.js"></script>
<script type="text/javascript">
	function ajax(){
		$.ajax({
			url:"${pageContext.request.contextPath}/count.do",
			type:"post",
			data:{},
			dataType:"json",
			success:function(data){	
				$('#count').text(data.count);
				if(data.uid!="null"){
					if(data.portraitPath!=null){
						$('#username').css({"display":"block"})
						$('#usericon').css({"display":"none"})
						$('#tx').src(data.portraitPath)
					}else{
						$('#username').css({"display":"block"})
						$('#usericon').css({"display":"none"})
					}
				}
			}
		});
	}
	$(function(){
		$('#username').mouseover(function(){
			$('#client').css({'display':'block'});
		});
		$('#client').mouseover(function(){
			$('#client').css({'display':'block'});
		});
		$('#client').mouseout(function(){
			$('#client').css({'display':'none'});
		});
		ajax();
	});
</script>
</head>
<body>

<!--导航栏-->
	<div id="main-header">
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
			<div class="navbar-header">
				<div class="pull-left logo">
					<a class="" href="<%=path%>/page/index.jsp"><img src="<%=path%>/qingxiping/images/index/logo.png" /></a>
				</div>
			</div>
			<div class="pull-left" style="margin-left:10px;line-height:80px"> 
				<span class="glyphicon glyphicon-map-marker"></span>
				<span id="city">
					广州市
				</span>
				<a id="changecity" href="#modal7" role="button" class="btn" data-toggle="modal">切换城市</a>
			</div>
     	 	<div class="pull-left">
	        	<ul id="navbar" class="nav navbar-nav pull-left" style="margin:15px;font-size:16px;font-family:'微软雅黑'">
	          		<li><a href="<%=path %>/page/index.jsp">首页</a></li>
	          		<li><a href="<%=path %>/product.do">全部商品</a></li>
	          		<li><a href="<%=path %>/cake.do">美食甜点</a></li>		  
	          		<li><a href="<%=path %>/coffee.do">咖啡时光</a></li>
	          		<li><a href="<%=path %>/drink.do">夏日饮品</a></li>
	         		<li><a href="<%=path %>/page/aboutUs.jsp">关于我们</a></li>
	        	</ul>
     	 	</div>
     	 	<div class="pull-right" style="line-height:80px;text-align:center;width:200px">
				<div class="search" style="float:left;line-height:80px;margin-top:28px">
				<input style="width:100px;height:25px" type="text" class="form-control" placeholder="搜索商品">			
				</div>
				<div class="icon" style="float:left"> 
					<a href="#">
						<span style="margin-left:10px" class="glyphicon glyphicon-search"></span>
					</a>
					<a href="<%=path%>/page/shoppingcart.jsp">
						<span style="margin-left:10px" class="glyphicon glyphicon-shopping-cart"><span style="position:relative;top:-12px;left:-2px;padding:2px 4px;" class="badge pull-right" id="count">0</span></span>
						
					</a>
					<a href="<%=path%>/page/login.jsp">
						<span id="usericon" style="position:absolute;left:1213px;top:32px;margin-left:5px;display:block" class="glyphicon glyphicon-user"></span>
					</a>
					<span id="username" style="float:right;width:25px;position:absolute;left:1216px;top:30px;display:none"><img id="tx" src="<%=path%>/wangwei/images/defaulttx.png" style="width:20px;height:20px"/></span>
					<ul id="client" class="" style="line-height:20px;">
						<li>
							 <a href="<%=path%>/page/Usermessage.jsp">个人中心</a>
						</li>
						<li>
							 <a href="<%=path%>/logout.do">退出登录</a>
						</li>
					</ul>
				</div>
     	 		
     	 	</div>
			
    	</div>
		</div>		 
	</div>
	
</body>
</html>
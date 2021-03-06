<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>订单提交  新鲜现做 就是O-MATCHA生日蛋糕/店面地址！</title>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
	<script type="text/javascript" src="ShoppingCart/js/jquery-1.7.2.js"></script>
	<script src="ShoppingCart/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
	<link rel="stylesheet"  href="ShoppingCart/bootstrap-3.3.5-dist/css/bootstrap.css"/>
	<script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>
</head>
<body>
<jsp:include   page="indexHeader.jsp" flush="true"/>
<input type="text" id="cityName" value="桐梓林商鼎国际"/>
<input type="button" onclick="setCity()" value="查找" />
<div id="container" style="margin-left:2.5%;width:95%;height:95%;align:center;" ></div>
 
 
<script type="text/javascript">
    var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
 
    var point = new BMap.Point(120.2,30.25);    //创建点坐标
    map.centerAndZoom(point, 14);                //初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom();                //激活滚轮调整大小功能
    map.addControl(new BMap.NavigationControl());    //添加控件：缩放地图的控件，默认在左上角；
    map.addControl(new BMap.MapTypeControl());        //添加控件：地图类型控件，默认在右上方；
    map.addControl(new BMap.ScaleControl());        //添加控件：地图显示比例的控件，默认在左下方；
    map.addControl(new BMap.OverviewMapControl());  //添加控件：地图的缩略图的控件，默认在右下方； TrafficControl    
 
    var search = new BMap.LocalSearch("中国", {
      onSearchComplete: function(result){
        if (search.getStatus() == BMAP_STATUS_SUCCESS){
          var res = result.getPoi(0);
          var point = res.point;
          map.centerAndZoom(point, 11);
        }
      },renderOptions: {  //结果呈现设置，
        map: map,  
        autoViewport: true,  
        selectFirstResult: true 
      } ,onInfoHtmlSet:function(poi,html){//标注气泡内容创建后的回调函数，有了这个，可以简单的改一下返回的html内容了。
        // alert(html.innerHTML)
      }//这一段可以不要，只不过是为学习更深层次应用而加入的。
    });
 
    function setCity(){
      search.search(document.getElementById("cityName").value);
    }
 
    search.search(document.getElementById("cityName").value);
 
 
</script>
<jsp:include   page="indexFooter.jsp" flush="true"/>
</body>
</html>
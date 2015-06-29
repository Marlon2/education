<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>"> 
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<style type="text/css">
.top {
	width: 990px;
	height: 80px;
	padding: 0;
	margin: 0 auto;
	zoom: 1;
}
.register_l {
	padding: 10px 0;
	float: none;
	margin: 0;
	position: relative;
	float: left;
}
.register_r {
	padding: 10px 0;
	float: none;
	margin-top:30px;
	font-size:26px;
	position: relative;
	float: left;
}
.footer{
	margin: 0 auto;
	margin-top:50px;
	text-align: center;
}
.copyright {
	margin: 0 auto;
}
</style>
</head>
<body>
<div class="pMinBar">
	<div class="wrap">
		<div class="pMinav">
			<s:if test="#session.student_admin.name!=null ">
				<a href="#">欢迎您，${student_admin.name }</a>
				<a href="#">[退出]</a>
			</s:if>
			<s:else>
				<a href="jsp/login.jsp">登录</a>
			</s:else>
			<span class="s">|</span>
			<a href="javascript:void(0);" id="setHome">免费注册</a>
			<span class="s">|</span>
			<a href="cartAction_cartlist.action" id="addFavorite">我的购物车</a>
			<span class="s">|</span>
			<a href="javascript:void(0);" id="addFavorite">加入收藏</a>
		</div>
	</div>
</div>
	<!-- 页头 -->
	<div class="top">
		<div class="register_l">
			<a href="home_init.action">
				<img src="<%=basePath%>images/common/zcjy.gif"> 
			</a>
		</div>
		
	</div>
	<br><br><br>
	<!-- 页体 -->
	<div class="wrap" align="center">
		<div align="center" style="color: red;font-size: 30px;">
			注册成功，请前往登录！！！<a href="jsp/login.jsp" style="color: blue;">去登陆</a>
		</div>
	</div>
	<!--尾部  -->
	
	<div class="footer">
		<div class="links"></div>
		<div class="copyright">Copyright©2004-2014 众筹教育zhongchou.com 版权所有</div>
	</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<style type="text/css">
body {
	margin: 0 auto;
	font: 14px/1.5 'Microsoft YaHei','微软雅黑','SimSun','宋体','Tahoma';
	background:url(./images/common/bg.jpg) center top repeat-x !important;
	font-size: 12px;
	color: #333;
	line-height: 150%;
	/* background-color: E8E8E8; */
}
.inp input{
	border: 0 none;
	outline: none;
}
.top {
	width: 990px;
	height: 80px;
	padding: 0;
	margin: 0 auto;
	zoom: 1;
}

.img {
	vertical-align: middle;
}

.logo {
	padding: 10px 0;
	float: none;
	margin: 0;
	position: relative;
}

.menu {
	height: 400px;
	padding: 2px;
	width:900px;
	border: 1px solid E8E8E8;
	margin: 0 auto;
	margin-top: 50px;
}

.loginForm {
	width: 890px;
	height: 400px;
	margin: 0 auto;
	float: left;
	font-size: 14px;
	font-family: arial,"宋体"; 
}

.img1 {
	width: 556px;
	height: 357px;
	float: left;
}

.item-info {
	width: 230px;
	height: 357px;
	margin-left:20px;
	float: left;
}

.item-info .info1 {
	height: 70px;
	margin-top:30px;
}
.item-info .info2 {
	height: 70px;
}
.text{
	width: 200px;
	float: none;
	height: 26px;
	line-height: 24px;
	border: 0px solid FAFFBD;
	background-color: FAFFBD;
	
}
.inp{
	
	background-color: FAFFBD;
	border: 1px solid FAFFBD;
}
.item-loginButton{
	ma
}
.button1, .button2{
	font: 14px/1.5 'Microsoft YaHei','微软雅黑','SimSun','宋体','Tahoma';
	color:white;
	width:80px;
	height:30px;
	border: 0 none;
	outline: none; 
	cursor:pointer;
	background-color: E2383B;
}
.button1{
	margin-left: 6px;
}
.button2{
	margin: 30px;
}
.item-login{
	margin-top: 30px;
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
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function onck(){
	var identity = $("input:radio[name='identity']:checked").val();
	if(identity=="stu"){
		$("#fm").attr("action","studentAction_login.action");
		$("#fm").submit();
	}else{
		$("#fm").attr("action","teacherAction_login.action");
		$("#fm").submit();
	}
	//alert($("#fm").attr("action"));
}

</script>
</head>

<body>
	<!-- 页头 -->
	<div class="top">
		<div class="logo">
			<img src="<%=basePath%>images/common/zcjy.gif"> 
			
		</div>
	</div>
	<!-- 页体 -->
	<div class="menu">
		<div class="loginForm">
			<form id="fm" action="<%=basePath%>studentAction_login.action" method="post">
				<div class="img1">
					<img src="<%=basePath%>images/login/edu.jpg">
				</div>
				<div class="item-info">
					<div class="info1">
						<span>用户名</span><br>
						<div class="inp">
						<input name="username" type="text" class="text" placeholder="学号或手机号">
						<img alt="用户名" src="<%=basePath%>images/login/account.jpg">
						</div> 
					</div>
					<div class="info2">
						<span>密码</span><br>
						<div class="inp"> 
						<input name="password" type="password" class="text">
						<img alt="密码" src="<%=basePath%>images/login/pwd1.jpg" style="width: 16px;" ">
						</div>
					</div>
					<div class="item-login">
						<div class="item-login-text">
							<!-- <input type="checkbox">
							<span>记住密码</span> -->
							<input type="radio" name="identity" value="stu" checked="checked">学生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="identity" value="tea">老师
						</div>
						<div>
							${login_msg }
						</div>
						<div class="item-loginButton">
							<input type="button" value="登 录" onclick="onck()" class="button1">
							<input type="button" onclick="window.location.href='jsp/register.jsp'" value="注 册" class="button2">
							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--尾部  -->
	
	<div class="footer">
		<!-- <hr width="1000px;" /> -->
		<div class="links"></div>
		<div class="copyright">Copyright©2004-2014 众筹教育zhongchou.com 版权所有</div>
	</div>
</body>
</html>

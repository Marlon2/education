<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="style/alogin.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录 </title>
</head>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/bg_images/favicon.ico"  type="image/x-icon">
<script type="text/javascript">
	function resetValue(){
		document.getElementById("username").value="";
		document.getElementById("password").value="";
	}
	
	function loadimage(){
		document.getElementById("randImage").src = "image.jsp?"+Math.random();
	}
</script>
<body>
<form id="form" action="login" method="post">
    <div class="Main">
        <ul>
            <li class="top"></li>
            <li class="top2"></li>
            <li class="topA"></li>
            <li class="topB"><span>
                <img src="bg_images/login/logo.png" alt="" style="" />
            </span></li>
            <li class="topC"></li>
            <li class="topD">
                <ul class="login">
                    <li><span class="left">用户名:</span> <span style="left">
                        <input type="text" value="${user.username }" name="user.username" id="userName"/>  
                     
                    </span></li>
                    <li><span class="left">密&nbsp;&nbsp;&nbsp;码:</span> <span style="left">
                       <input type="password" value="${user.password }" name="user.password" id="userPwd"/>  
                    </span></li>
                         <li><span class="left">验证码:</span> <span style="left">
                         <input type="text" value="${imageCode }" name="imageCode" id="imageCode" size="10"/>
                    </span>
                    <span style="left">
                       <img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle">
                    </span>
                    </li>
                    <li><span style="margin-left:25px"><font color="red" size=4>${error }</font></span></li>
                </ul>
            </li>
            <li class="topE"></li>
            <li class="middle_A"></li>
            <li class="middle_B"></li>
            <li class="middle_C">
            <span style="margin:15px"><input type="submit" value="登录"/></span>
            <span style="margin:10px"><input type="button" value="重置" onclick="resetValue()"/></span>
            </li>
            <li class="middle_D"></li>
            <li class="bottom_A"></li>
            <li class="bottom_B">
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
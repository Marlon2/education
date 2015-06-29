<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付成功</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
<div class="wrap" align="center">
<h3>
<s:property value="message"/>
</h3>
</div>
<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
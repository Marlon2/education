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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/common.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/content.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true"></jsp:include>

	<div id="content1">
		<div class="content2">
			<div class="content3">
				<span class="titlestyle10">今日话题</span>
			</div>
		</div>
		<div class="content4"></div>
		<div id="content5">
			<div class="content6" valign="top">
				<h1 align="center">
					<s:property value="content.title" />
				</h1>
				<div class="timestyle">
					<s:date name="content.publishdate" format="MM-dd-yy hh:mm:ss" />
				</div>
				<div class="contentstyle">
					<div style="color: black; font-family: 宋体; font-size: 16px">
						<s:property value="content.description" escape="false" />
					</div>
				</div>
				<br> <br>
				<div align="right">
					<span>【</span> <a class="more"
						href="javascript:window.opener=null;window.open('','_self');window.close();">
						<span>关闭窗口</span>
					</a> <span>】</span>
				</div>

			</div>
			<div id="blankstyle"></div>
		</div>
		<div id="content_bottom"></div>
		<!-- 页脚 -->
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
	
</body>
</html>
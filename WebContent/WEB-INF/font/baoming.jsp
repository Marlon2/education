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
<title>在线报名</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/common.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/style.css">
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
					<span class="titlestyle10">在线</span>
				</div>
			</div>
			<div class="content4"></div>
			<div id="content5">
				<div class="content6" valign="top">
					<h1 align="center">${zuban.name }</h1>
					<div class="timestyle">${zuban.zubandate }</div>
					<div align="center">
						<img src="${teacher.picture }"
							style="width: 200px; height: 255px;">
					</div>
					<div class="contentstyle">
						<p align="center">${teacher.name }</p>
						<p style="line-height: 150%; text-indent: 32px">
							<span
								style="color: black; line-height: 150%; font-family: 宋体; font-size: 16px">
								${teacher.remark } </span>
						</p>
						<p>
							已报人数：${zuban.signnumber }<br>
							剩余人数：${zuban.zubannumber-zuban.signnumber }<br> <a
								href="<%=basePath%>baoming_baoming.action"><button>我要报名</button>
							</a>
						</p>
					</div>
					<div align="right">
						<span>【</span> <a
							href="javascript:window.opener=null;window.open('','_self');window.close();">
							<span>关闭窗口</span>
						</a> <span>】</span>
					</div>

				</div>
				<div id="blankstyle"></div>
			</div>
			<div id="content_bottom"></div>
		</div>
		<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
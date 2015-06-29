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
<title>商品已成功加入购物车</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/addcart.css">
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	<div id="main-m">
		<div class="wrap">
			<div class="success">
				<div class="success-b">
					<h3>商品已成功加入购物车！</h3>
				</div>
				<div class="success-b">
					<a href="homeAction_init.action" class="btn-continue">继续购物</a> <a
						href="cartAction_cartlist.action" class="GotoShopingCart">去购物车结算&nbsp;&gt;</a>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
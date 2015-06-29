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
<title>众筹教育</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	
	<div id="slide_div">
		<div id="slide_box">
			<!-- 幻灯片图片 -->
			<ul class="slide_img">
				<s:iterator value="slides">
					<li><a href="contentAction_init.action?cid=<s:property value="id" />"
						target="_blank"><img src='<s:property value="pictureurl"/>'
							width="955" height="260" alt=""></a></li>
				</s:iterator>
			</ul>
			<!-- 幻灯片序列号 -->
			<div id="slide_order"></div>
		</div>
	</div>
	<div id="nav2">
		<ul id="tab">
			<li style="line-height: 38px;" class="licurrent">今日话题</li>
			<li style="line-height: 38px;">语文</li>
			<li style="line-height: 38px;">数学</li>
			<li style="line-height: 38px;">英语</li>
			<li style="line-height: 38px;">科学</li>
			<li style="line-height: 38px;">解题</li>
			<li style="line-height: 38px;">答辩</li>
		</ul>

		<hr id="hrid">
		<div id="content">
			<ul style="display: block;">
				<li><s:iterator value="today_topic" var="content" begin="0"
						end="2">
						<div class="addiv1">
							<div class="adpic1">
								<a
									href="contentAction_init.action?cid=<s:property value="#content.id" />"
									target="_blank"><img
									src="<s:property value="#content.pictureurl" />"
									style="width: 310px; height: 255px;"></a>
							</div>
							<div class="adtxt1">
								<p align="center">
									<s:property value="#content.title" />
								</p>
								<div>
									<s:property value="#content.introduce" escape="false" />
									...<a class="more"
										href="contentAction_init.action?cid=<s:property value="#content.id" />"
										target="_blank">[详情]</a>
								</div>
							</div>
						</div>
					</s:iterator></li>
			</ul>
			<ul>
				<li><s:iterator value="teachers1" var="teacher" begin="0"
						end="3">
						<div class="tMinav">
							<div class="tMinimg">
								<a
									href="teacherAction_init.action?id=<s:property value="#teacher.tid" />"
									target="_blank"><img
									src="<s:property value="#teacher.pictureurl" />"></a>
								<p align="center">
									<s:property value="#teacher.name" />
								</p>
							</div>
							<div class="tMintxt">
								<p align="left" class="p1">
									辅导科目：
									<s:iterator value="#teacher.subjects">
										<s:property value="name" />
									</s:iterator>
								</p>
								<p align="left" class="p2">教育简介：</p>
								<p class="p3">
									&nbsp;&nbsp;
									<s:property value="#teacher.introduce" />
									...<a class="more"
										href="teacherAction_init.action?id=<s:property value="#teacher.tid" />"
										target="_blank">[详情]</a>
								</p>
							</div>
						</div>
					</s:iterator></li>
			</ul>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
		</div>
	</div>
	<!-- <hr id="hrid"> -->

	<div class="teacherdiv">
		<div class="wrap">
			<div class="teacherbar">金牌名师</div>
			<s:iterator value="teachers1" var="teacher" begin="0" end="3">
				<div class="tMinav">
					<div class="tMinimg">
						<a
							href="teacherAction_init.action?id=<s:property value="#teacher.tid" />"
							target="_blank"><img
							src="<s:property value="#teacher.pictureurl" />"></a>
						<p align="center">
							<s:property value="#teacher.name" />
						</p>
					</div>
					<div class="tMintxt">
						<p align="left" class="p1">
							辅导科目：
							<s:iterator value="#teacher.subjects">
								<s:property value="name" />
							</s:iterator>
							<!--  var a = {aa:'你好',bb:'hehe'} -->
						</p>
						<p align="left" class="p2">教育简介：</p>
						<p class="p3">
							&nbsp;&nbsp;
							<s:property value="#teacher.introduce" />
							...<a class="more"
								href="teacherAction_init.action?id=<s:property value="#teacher.tid" />"
								target="_blank">[详情]</a>
						</p>
					</div>
				</div>
			</s:iterator>

		</div>
	</div>
	<div class="prizediv">
		<div class="wrap">
		<div class="teacherbar">获得的奖项</div>
			<s:iterator value="prizes">
				<div class="prizenav">
					<div class="prizeimg">
						<p>
							<img src='<s:property value="pictureurl" />'>
						</p>
					</div>
					<p align="center">
						<s:property value="title" />
					</p>
				</div>
			</s:iterator>
		</div>
	</div>
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
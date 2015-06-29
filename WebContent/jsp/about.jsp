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
<title>关于我们</title>
<link rel="stylesheet" type="text/css"	href="<%=basePath%>css/common.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/teacher.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
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
					<a href="<%=basePath%>jsp/login.jsp">登录</a>
				</s:else>
				<span class="s">|</span> <a href="jsp/register.jsp" id="setHome">免费注册</a>
				<span class="s">|</span> <a href="cartAction_cartlist.action"
					id="addFavorite">我的购物车</a> <span class="s">|</span> <a
					href="javascript:void(0);" id="addFavorite">加入收藏</a>
			</div>
		</div>
	</div>
	<div id="top">
		<div class="logo"></div>
		<div class="topz">
			<img src="images/common/1123.gif" />
		</div>
		<div class="topr">
			<img src="images/common/tel.png">
		</div>
	</div>
	<div class="pNavigation">
		<div class="wrap">
			<ul>
				<li class="item i1">
					<div class="home">
						<a href="home_init.action">主页</a>
					</div>
				</li>
				<li class="item i2">
					<div class="sub">
						<a href="#">课 堂</a>
					</div>
				</li>
				<li class="item i2">
					<div class="sub">
						<a href="teacher_teacherList.action">名师</a>
					</div>
				</li>
				<li class="item i3">
					<div class="sub">
						<a href="cartAction_cartlist.action">购物车</a>
					</div>
				</li>
				<li class="item i4">
					<div class="sub">
						<a href="#">我的订单</a>
					</div>
				</li>
				<li class="item i5">
					<div class="sub">
						<a href="jsp/about.jsp">关于我们</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<%-- <div class="wrap">
		<div style="margin: 20px 0; font-size: 18px;">
			<p style="line-height: 150%; text-indent: 32px">
				<span style="color: black; line-height: 150%;">
					北京市海淀区桦树湾教育培训学校创办伊始，便提出“以人为本，因材施教，做适合孩子的教育”。 </span>
			</p>
			<p style="line-height: 150%; text-indent: 32px">
				<span style="color: black; line-height: 150%;">
					“因材施教，学以致用”是桦树湾的教育理念，也是桦树湾人努力的方向。 </span>
			</p>
			<p style="line-height: 150%; text-indent: 32px">
				<span style="color: black; line-height: 150%;">
					北京市海淀区桦树湾教育培训学校创办于2005年，由赵晓峰老师带领的专业师资团队所创办，是一所以中小学数学竞赛、中学联赛培训为主，兼有语文、英语、信息学等多学科竞赛培训的教育培训机构。
					目前，桦树湾教育主要承担中小学各类杯赛活动的选拔、培训、组队、带队等工作，开设培训科目涉及英语、数学、信息学、作文等多个领域。
					桦树湾教育自创办以来，在校长赵晓峰老师带领的专业师资团队的共同努力下，硕果累累，捷报频传。 </span>
			</p>
		</div>
	</div> --%>
	<div id="content1">
		<div class="content2">
			<div class="content3">
				<span class="titlestyle10">关于我们</span>
			</div>
		</div>
		<div class="content4"></div>
		<div id="content5">
			<div class="content6" valign="top">
				<h3 align="center">众筹教育</h3>
				<br>
				<div style="line-height: 150%; text-indent: 32px;" align="left">
					<p style="line-height: 150%; text-indent: 32px">
						<span style="color: black; line-height: 150%;">
					北京市海淀区桦树湾教育培训学校创办伊始，便提出“以人为本，因材施教，做适合孩子的教育”。 </span>
					</p>
					<p style="line-height: 150%; text-indent: 32px">
						<span style="color: black; line-height: 150%;">
							“因材施教，学以致用”是桦树湾的教育理念，也是桦树湾人努力的方向。 </span>
					</p>
					<p style="line-height: 150%; text-indent: 32px">
						<span style="color: black; line-height: 150%;">
							北京市海淀区桦树湾教育培训学校创办于2005年，由赵晓峰老师带领的专业师资团队所创办，是一所以中小学数学竞赛、中学联赛培训为主，兼有语文、英语、信息学等多学科竞赛培训的教育培训机构。
							目前，桦树湾教育主要承担中小学各类杯赛活动的选拔、培训、组队、带队等工作，开设培训科目涉及英语、数学、信息学、作文等多个领域。
							桦树湾教育自创办以来，在校长赵晓峰老师带领的专业师资团队的共同努力下，硕果累累，捷报频传。 </span>
					</p>
					<p style="line-height: 150%; text-indent: 32px">
						<span style="color: black; line-height: 150%;">
							在2007年“走进美妙的数学花园”竞赛全国总决赛中，一等奖奖牌总数16枚，桦树湾教育代表北京一队取得10枚的骄人成绩。 在2009年第十四届“华杯赛”中，北京共有数十名学生获得小学生全国一等奖，
							其中80%以上都是桦树湾学员！获得小学组全国二等奖的共有200多名学生，在前100名中，75%以上是桦树湾学员。其中：中关村一小胥晓宇获小学组一等奖第二名（银牌），人大附中魏宏济同学获初中组
							一等奖第二名（银牌）；</span>
					</p>
					<p style="line-height: 150%; text-indent: 32px">
						<span style="color: black; line-height: 150%;">
							在2009年“数学解题能力展示”以及“英文活动日”竞赛中，桦树湾学员均取得了优异成绩，获奖率达到85%。其中一等奖总人数65%左右的考生是桦树湾学员，二、三等奖也达到了50%左右。</span>
					</p>
					<p style="line-height: 150%; text-indent: 32px">
						<span style="color: black; line-height: 150%;">
							2009年小升初，桦树湾教育数学尖子班学员有70%人被人大附中录取，其余30%分别被101中学、北大附中、清华附中以及西城四中、三帆中学等重点中学录取；信息奥赛班18名学员，
							海淀区赛一等奖5人、二等奖9人、三等奖3人；北京市竞赛一等奖7人、二等奖4人、三等奖6人，获得北京市一等奖的六年级学生均被人大附中、101学校等重点中学录取。 </span>
					</p>
				</div>
			</div>
			<div id="blankstyle"></div>
		</div>
		<div id="content_bottom"></div>
	</div>
	<!-- 页脚 -->
	<div class="pCopyright">
		咨询电话：62615022 建议邮箱：hsw@huashuwan.com<br> Copyright © 2014
		huashuwan.com, All Rights Reserved 桦树湾教育 版权所有<br> 京ICP备13041349号
	</div>
</body>
</html>
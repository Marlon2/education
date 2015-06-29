<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="pMinBar">
	<div class="wrap">
		<div class="pMinav">
			<s:if test="#session.student_admin.name!=null ">
				<a href="#">欢迎您，${student_admin.name }</a>
				<a href="studentAction_logout.action">[退出]</a>
			</s:if>
			<s:elseif test="#session.teacher_admin.name!=null ">
				<a href="#">欢迎您，${teacher_admin.name }</a>
				<a href="studentAction_logout.action">[退出]</a>
			</s:elseif>
			<s:else>
				<a href="jsp/login.jsp">登录</a>
			</s:else>
			<span class="s">|</span> <a href="jsp/register.jsp" id="setHome">免费注册</a>
			<span class="s">|</span> <a href="cartAction_cartlist.action"
				id="addFavorite">我的购物车</a><span class="s">|</span> <a
				href="personalAction_init.action" id="addFavorite">个人中心</a> <span
				class="s">|</span> <a
				href="javascript:AddFavorite(window.location,document.title)"
				id="addFavorite">加入收藏</a>
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
					<a href="homeAction_init.action">主页</a>
				</div>
			</li>
			<li class="item i2">
				<div class="sub">
					<a href="banjiAction_init.action">课 堂</a>
				</div>
			</li>
			<li class="item i2">
				<div class="sub">
					<a href="teacherAction_teacherList.action">名师</a>
				</div>
			</li>
			<li class="item i3">
				<div class="sub">
					<a href="cartAction_cartlist.action">购物车</a>
				</div>
			</li>
			<li class="item i4">
				<div class="sub">
					<a href="orderdAction_orderlist.action">我的订单</a>
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
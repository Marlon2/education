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
<!-- <link rel="stylesheet" type="text/css" href="css/common.css"> -->
<link rel="stylesheet" type="text/css" href="css/register.css">
<script type="text/javascript"
	src="<%=basePath%>DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$('#kaptchaImage').click(
				function() {
					$(this).attr(
							'src',
							'${pageContext.request.contextPath}/kaptcha.jpg?'
									+ Math.floor(Math.random() * 100));
				});

		$(".mustInput").each(
				function() {
					$(this).blur(
							function() {
								if ($(this).val().trim() != "") {
									if ($(this).attr("id") == "pswtwo") {
										if ($(this).val().trim() != $("#psw")
												.val().trim()) {
											$(this).next().attr("color", "red")
													.text("两次密码输入不一致，请重新输入！");
										} else {
											$(this).next().attr("color",
													"green").text("√");
										}
									} else {
										$(this).next().attr("color", "green")
												.text("√");
									}
								} else {
									$(this).next().attr("color", "red").text(
											"此项必填，请重新输入！");
								}
							});
				});
		$("#psw").bind(
				"change",
				function() {
					$("#pswtwo").val("").next().attr("color", "red").text(
							"请再次输入密码确认！");
				});
		$(".number").focus(function() {
			$(this).next().attr("color", "red").text("请输入11位数字！");
		}).blur(
				function() {
					var regExp = new RegExp("[0-9]{11}");
					if (regExp.test($(this).val().trim())) {
						$(this).next().attr("color", "green").text("√");
					} else {
						if ($(this).val().trim() == "") {
							$(this).next().attr("color", "red").text("");
						} else {
							$(this).next().attr("color", "red").text(
									"格式不正确，请输入11位数字！");
						}
					}
				});
		$(".email").focus(function() {
			$(this).next().attr("color", "red").text("请输入正确的邮箱！");
		}).blur(
				function() {
					var regExp = new RegExp("\\w+@\\w+(\\.\\w+)+");
					if (regExp.test($(this).val().trim())) {
						$(this).next().attr("color", "green").text("√");
					} else {
						if ($(this).val().trim() == "") {
							$(this).next().attr("color", "red").text("");
						} else {
							$(this).next().attr("color", "red").text(
									"格式不正确，请输入正确的邮箱！");
						}
					}
				});

		$("#regist")
				.bind(
						"click",
						function() {
							var flag = true;
							$(".mustInput").each(function() {
								if ($(this).next().text() != "√") {
									flag = false;
									return;
								}
							});
							$(".number")
									.each(
											function() {
												if ($(this).next().text()
														.trim() != ""
														&& $(this).next()
																.text().trim() != "√") {
													flag = false;
													return;
												}
											});
							$(".email")
									.each(
											function() {
												if ($(this).next().text()
														.trim() != ""
														&& $(this).next()
																.text().trim() != "√") {
													flag = false;
													return;
												}
											});
							if (flag) {
								$("#registForm").submit();
							}
						});
	});
</script>
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
				<span class="s">|</span> <a href="javascript:void(0);" id="setHome">免费注册</a>
				<span class="s">|</span> <a href="cartAction_cartlist.action"
					id="addFavorite">我的购物车</a> <span class="s">|</span> <a
					href="javascript:void(0);" id="addFavorite">加入收藏</a>
			</div>
		</div>
	</div>
	<!-- 页头 -->
	<div class="top">
		<div class="wrap">
			<div class="register_l">
				<a href="home_init.action"> <img
					src="<%=basePath%>images/common/zcjy.gif">
				</a>
			</div>
			<div class="register_r">欢迎注册</div>
		</div>
	</div>
	<!-- 页体 -->
	<div class="w" id="regist">
		<div class="mt">
			<ul class="tab">
				<li class="curr">学生注册</li>
				<li class="line">
					<a  href="jsp/teacherregister.jsp">老师注册</a>
				</li>
			</ul>
		</div>
		<div class="menu">
			<form action="<%=basePath%>register_saveStudent.action" method="post"
				id="registForm">
				<table cellspacing="20">
					<tbody>
						<tr>
							<td class="lefttd">学员姓名：</td>
							<td class="righttd"><input type="text" class="mustInput"
								name="student.name" value="${student.name }" /><font
								color="red">*</font></td>
						</tr>
						<tr>
							<td class="lefttd">学员性别：</td>
							<td class="righttd"><input type="radio" name="student.sex"
								class="sex" value="男" checked="checked" />&nbsp;男&nbsp;&nbsp; <input
								type="radio" name="student.sex" class="sex" value="女" />&nbsp;女
							</td>
						</tr>
						<tr>
							<td class="lefttd">学员生日：</td>
							<td class="righttd"><input type="text" class="mustInput"
								name="student.birthday" readonly="readonly"
								onClick="WdatePicker()" /><font color="red">*</font></td>
						</tr>
						<tr>
							<td class="lefttd">学员班级：</td>
							<td class="righttd"><select name="grade_id">
									<option value="1">一年级</option>
									<option value="2">二年级</option>
									<option value="3">三年级</option>
									<option value="4">四年级</option>
									<option value="5">五年级</option>
									<option value="6">六年级</option>
									<option value="7">初一</option>
									<option value="8">初二</option>
									<option value="9">初三</option>
									<option value="10">高一</option>
									<option value="11">高二</option>
									<option value="12">高三</option>
							</select></td>
						</tr>
						<tr>
							<td class="lefttd">电子邮箱：</td>
							<td class="righttd"><input type="text" class="email"
								name="student.email"><font color="red">*</font></td>
						</tr>
						<tr>
							<td class="lefttd">移动电话：</td>
							<td class="righttd"><input type="text" class="number"
								name="student.mobilenumber" maxlength="11" /><font color="red">*</font></td>
						</tr>
						<tr>
							<td class="lefttd">登录密码：</td>
							<td class="righttd"><input id="psw" class="mustInput"
								class="mustInput" type="password" name="student.password" /><font
								color="red">*</font></td>
						</tr>
						<tr>
							<td class="lefttd">确认密码：</td>
							<td class="righttd"><input id="pswtwo" class="mustInput"
								class="mustInput" type="password" name="password2" /><font
								color="red">*</font></td>
						</tr>
						<tr>
							<td class="lefttd">验证码：</td>
							<td class="righttd"><input name="vcode" class="mustInput"
								id="vcode" type="text" />&nbsp; <font color="red"
								style="width: 10px;">*</font><img id="kaptchaImage"
								style="height: 30px; cursor: pointer;"
								src="${pageContext.request.contextPath}/kaptcha.jpg" /></td>
						</tr>
						<tr>
							<td class="lefttd"></td>
							<td class="righttd" class="righttd"><font color="red"
								style="width: 10px;"><s:property value="message"/></font>
							</td>
						</tr>
						<tr>
							<td class="lefttd"></td>
							<td class="righttd"><input class="registerbtn" id="regist"
								type="button" value="立即注册" /></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!--尾部  -->

	<div class="footer">
		<!-- <hr width="1000px;" /> -->
		<div class="links"></div>
		<div class="copyright">Copyright©2004-2014 众筹教育zhongchou.com
			版权所有</div>
	</div>
</body>
</html>

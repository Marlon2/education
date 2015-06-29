<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript"
	src="<%=basePath%>DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function confirmForm() {
		var sessionName = "<%=session.getAttribute("teacher_admin")%>".toString();
		var oldpwd = $("#cur_pwd").val();

		var newpwd = $("#newpwd").val();

		var twopwd = $("#newpwd1").val();
		if (newpwd == oldpwd) {
			alert("新密码与原密码不能一致，请重新输入密码1");
			$("#newpwd").val("");
			$("#newpwd1").val("");

		} else if (twopwd != newpwd) {
			alert("两次密码不能一致，请重新输入密码");
			$("#newpwd").val("");
			$("#newpwd1").val("");
		} else {
			if (sessionName == "" || sessionName == "null") {
				//alert("aa");
				$("#upForm").attr("action", "studentAction_savePWD.action");
				$("#upForm").submit();
			} else {
				//alert("bb");
				$("#upForm").attr("action", "teacherAction_savePWD.action");
				$("#upForm").submit();
			}
		}

	}

	function Jump(obj){
		//判断登录的用户是教师，还是学生
		var sessionName = "<%=session.getAttribute("teacher_admin")%>".toString();
	
				
		if (sessionName == "" || sessionName == "null") {
			if (obj.id == "con_title_1") {
				window.location.href = "studentAction_detail.action";
			} else if (obj.id == "con_title_2") {
				window.location.href = "studentAction_saveUI.action";
			} else {
				window.location.href = "cartAction_cartlist.action";
			}
		} else {
			if (obj.id == "con_title_1") {
				window.location.href = "teacherAction_detail.action";
			} else if (obj.id == "con_title_2") {
				window.location.href = "teacherAction_saveUI.action";
			} else {
				window.location.href = "teacherAction_course.action";
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" />
	<jsp:include page="../common/left.jsp" />
	<div class="w" id="regist">
		<div class="menu">

			<div class="form">
				<form action="<%=basePath%>teacherAction_savePWD.action"
					method="post" id="upForm">
					<table cellspacing="20">
						<tbody>
							<tr>
								<td class="righttd"><s:if
										test="#session.student_admin.name!=null ">
										<input type="hidden" name="entity.sid" value="${sessions.sid}" />
									</s:if> <s:elseif test="#session.teacher_admin.name!=null ">
										<input type="hidden" name="entity.tid" value="${sessions.tid}" />

									</s:elseif></td>
							</tr>
							<tr>
								<td class="lefttd">原密码：</td>
								<td class="righttd"><input id="cur_pwd" type="password"
									value="${sessions.password}" /></td>
							</tr>
							<tr>
								<td class="lefttd">新密码：</td>
								<td class="righttd"><input id="newpwd" type="password"
									name="entity.password" /></td>
							</tr>
							<tr>
								<td class="lefttd">确认新密码：</td>
								<td class="righttd"><input id="newpwd1" type="password" /></td>
							</tr>
							<tr>
								<td class="lefttd"><input class="savebtn" id="save"
									type="button" value="保存" onclick="confirmForm()" /></td>
								<td class="righttd"><a class="backbtn" id="back"
									href="javascript:history.go(-1);" type="button"> 返回</a></td>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
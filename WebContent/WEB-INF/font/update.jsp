<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript"
	src="<%=basePath%>DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript">
	function saveConfirm(){
		var sessionName = "<%=session.getAttribute("teacher_admin")%>".toString();
				
		if (sessionName == "" || sessionName == "null") {
			//alert("aa");
			$("#updateInfo").attr("action", "studentAction_update.action");
			$("#updateInfo").submit();
		} else {
			//alert("bb");
			$("#updateInfo").attr("action", "teacherAction_update.action");
			$("#updateInfo").submit();
		}
		//alert(sessionName);
		return false;
	}

	function setTab(name, cursel, n) {
		for (i = 1; i <= n; i++) {//终止当前动画
			$("#" + "con_" + name + "_" + i).stop();
			$("#" + name + i).stop();
		}
		for (i = 1; i <= n; i++) {
			i == cursel ? $("#" + "con_" + name + "_" + i).animate({
				"height" : "30px"
			}, 500) : $("#" + "con_" + name + "_" + i).animate({
				"height" : "0px"
			}, 500);

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
	
	<!-- 页体 -->
	<div class="w" id="regist">
		<div class="menu">
			<div class="form">
				<form id="updateInfo" action="studentAction_update.action"
					method="post">
					<table cellspacing="20">
						<tbody>
							<tr>
								
								<td class="righttd">
								<s:if test="#session.student_admin.name!=null ">
									<input type="hidden" name="entity.sid"
									value="${sessions.sid}" />
									</s:if>
									<s:elseif test="#session.teacher_admin.name!=null ">
										<input type="hidden" name="entity.tid"
									value="${sessions.tid}" />
									
									</s:elseif>
									</td>
							</tr>

							<tr>
								<td class="lefttd">姓名：</td>
								<td class="righttd"><input type="text" class="mustInput"
									name="entity.name" value="${sessions.name}" /> <font
									color="red">*</font></td>
							</tr>
							<tr>
								<td class="lefttd">性别：</td>
								<td class="righttd"><input type="radio" name="entity.sex"
									class="sex" value="男"
									${sessions.sex eq "男" ? "checked='checked'":"" } />&nbsp;男&nbsp;&nbsp;
									<input type="radio" name="entity.sex" class="sex" value="女"
									${sessions.sex eq "女" ? "checked='checked'":"" } />&nbsp;女
								</td>
							</tr>
							<tr>
								<td class="lefttd">生日：</td>

								<td class="righttd"><input type="date" class="mustInput"
									name="entity.birthday"
									value="2014-01-13"  /><font color="red">*</font></td>
							</tr>

							<tr>
								<td class="lefttd">手机号：</td>
								<td class="righttd"><input type="text" class="number"
									name="entity.mobilenumber" maxlength="11"
									value="${sessions.mobilenumber}" required/><font color="red">*</font></td>
							</tr>
							<tr>
								<td class="lefttd">电子邮箱：</td>
								<td class="righttd"><input type="email" class="email"
									name="entity.email" value="${sessions.email}"><font
									color="red">*</font></td>
							</tr>

							<tr>
								<td class="lefttd"><input class="savebtn" id="save"
									type="button" value="保存" onclick="saveConfirm()" /></td>
								<td class="righttd"><a class="backbtn" id="back"
									href="javascript:history.go(-1);" type="button"> 返回</a></td>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
			<!-- 设置这个清除div的目的是：内部的子div浮动之后，希望内部的内容高度可以自适应，不需要设置div的高度 -->
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>
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
			if(obj.id=="con_title_1"){
					window.location.href="studentAction_detail.action";
				}
				else if (obj.id=="con_title_2") {
					window.location.href="studentAction_saveUI.action";
			}else{
				window.location.href="cartAction_cartlist.action";
			}
		} else {
			if(obj.id=="con_title_1"){
				window.location.href="teacherAction_detail.action";
			}
			else if (obj.id=="con_title_2") {
				window.location.href="teacherAction_saveUI.action";
		}else{
			window.location.href="teacherAction_course.action";
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
				<table cellspacing="20">
					<tbody>
						<tr>
						
							<td class="righttd"></td>
						</tr>
					</tbody>
				</table>

			</div>
			<!-- 设置这个清除div的目的是：内部的子div浮动之后，希望内部的内容高度可以自适应，不需要设置div的高度 -->
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>
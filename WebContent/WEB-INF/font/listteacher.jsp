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
<title>名师</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/common.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ketang.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/jBootsrapPage.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jBootstrapPage.js"></script>
<script type="text/javascript">
	function validate(totalPage) {
		var page = document.getElementsByName("page")[0].value;
		if ((page - totalPage) > 0) {
			alert("你输入的页数大于最大页数，页面将跳转到首页！");
			window.document.location.href = "AllSuperTypeServlet";
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	<!-- 主体部分 -->
	<div class="pCourseSearch">
		<div class="wrap">
			<div class="courseSearch">
				<h2>名师检索</h2>
				<form action="" class="courseSearchFrom" method="get">
					<input type="text" class="searchWord" placeholder="迎春版 奥数班 尖子班">
					<input type="submit" value="搜索" class="searchSubmit">
				</form>
			</div>
		</div>
	</div>
	<div style="margin: 10px 0;">
		<div class="wrap" style="background: #FCFCFC;">
			<div class="teacherbar">名师列表</div>
			<div class="searchList">
				<s:iterator value="#request.pageBean.list">
					<div class="sItem">
						<div class="pics">
							<a
								href="<%=basePath%>teacherAction_init.action?id=<s:property value="tid" />"><img
								alt="" src='<s:property value="pictureurl"/>'></a>
						</div>
						<div class="info">
							<h4>
								<a href="javascript:void(0)" target="_blank"><s:property
										value="name" /> </a> <span>老师编码：<s:property
										value="teachernumber" /></span>
							</h4>
							<div>
								简介：<br>
								<s:property value="introduce" />
							</div>
							<ul>
								<li>
									<div class="">
										班级：
										<s:iterator value="banjis">
											<a href="javascript:void(0)"><s:property
													value="classname" /></a>
										</s:iterator>
									</div>
								</li>
								<li>
									<div class="">
										年级：
										<s:iterator value="grades">
											<a href="javascript:void(0)"><s:property value="name" /></a>
										</s:iterator>
									</div>
								</li>
								<li>
									<div class="">
										科目：
										<s:iterator value="subjects">
											<a href="javascript:void(0)"><s:property value="name" /></a>
										</s:iterator>
									</div>
								</li>
							</ul>
						</div>
						<div class="states">
							<div>
								<s:property value="remark" />
							</div>
							<div class="btn1">
								<a
									href="<%=basePath%>teacherAction_init.action?id=<s:property value="tid" />"
									class="btn2">查看详情</a>
							</div>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
	<div class="pages">
		<div class="wrap" align="center">
			<input type="hidden" id="page" value="<s:property value="page" />">
			<input type="hidden" id="allRows"
				value="<s:property value="pageBean.allRows" />">
			<ul class="pagination" id="ulid"></ul>
		</div>
	</div>
	<!-- 页脚 -->
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
	<script type="text/javascript">
		var allRows = $("#allRows").val();
		createPage(3, 10, allRows);
		function createPage(pageSize, buttons, total) {
			$(".pagination")
					.jBootstrapPage(
							{
								pageSize : pageSize,
								total : total,
								maxPageButton : buttons,
								onPageClicked : function(obj, pageIndex) {
									window.location.href = "teacherAction_teacherList.action?page="
											+ (pageIndex + 1);
								}
							});
		}
		var page1 = $("#page").val();
		if (page1 != 0) {
			$("#ulid li.active").removeClass('active');
			var li = $("#ulid li").get(Number(page1) + 1);
			li.setAttribute('class', 'active');
		}
	</script>
</body>
</html>
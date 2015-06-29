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
<title>课堂</title>
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
				<h2>课程检索</h2>
				<form action="banjiAction_init.action" class="courseSearchFrom" method="get">
					<input type="text" class="searchWord" placeholder="迎春版 奥数班 尖子班">
					<input type="submit" value="搜索" class="searchSubmit">
				</form>
			</div>
		</div>
	</div>
	<div style="margin: 10px 0;">
		<div class="wrap" style="background: #FCFCFC;">
			<div class="teacherbar">课程列表</div>
			<div class="searchList">
				<s:iterator value="#request.pageBean.list">
					<div class="sItem">
						<div class="pics">
							<s:iterator value="teachers" status="stat">
								<s:if test="#stat.index==0">
									<a href="#"><img alt=""
										src='<s:property value="pictureurl"/>'></a>
								</s:if>
							</s:iterator>
						</div>
						<div class="info">
							<h4>
								<a href="#" target="_blank"><s:property value="classname" />
								</a> <span>班级编码：<s:property value="number" /></span>
							</h4>
							<ul>
								<li>
									<div class="">
										老师：
										<s:iterator value="teachers">
											<a href="#"><s:property value="name" /></a>
										</s:iterator>
									</div>
								</li>
								<li>适合年级：<s:property value="grade.name" /></li>
								<li>上课地点：<s:property value="address" /></li>
								<li>开课日期：<s:date name="startdate" format="MM-dd-yy" /> 至 <s:date
										name="enddate" format="MM-dd-yy" /></li>
								<li>上课时间：<s:property value="startime" /></li>
								<li>课次：<s:property value="classnumber" /> <span
									class="price"> 价格：<b style="font-size: 15px; color: red">￥<s:property
												value="price" /></b>
								</span>
								</li>
							</ul>
						</div>
						<div class="states">
							<div>
								<s:property value="remark" />
							</div>
							<div class="btn1">
								<a
									href="<%=basePath%>cartAction_init.action?bid=<s:property value="bid" />"
									class="btn2">立即报名</a>
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
			$(".pagination").jBootstrapPage(
					{
						pageSize : pageSize,
						total : total,
						maxPageButton : buttons,
						onPageClicked : function(obj, pageIndex) {
							window.location.href = "banjiAction_init.action?page="
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
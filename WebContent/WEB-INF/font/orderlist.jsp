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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
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
<div class="wrap">
	<div style="margin: 10px 0;">
		<div class="wrap" style="background: #FCFCFC;">
			<div class="teacherbar">订单列表</div>
			<div class="searchList">
				<s:iterator value="#request.pageBean.list">
					<div class="sItem">
						
						<div class="info">
							<h4>
								<a href="#" target="_blank"><s:property value="banji.classname" />
								</a> <span>班级编码：<s:property value="banji.number" /></span>
							</h4>
							<ul>
								<li>适合年级：<s:property value="banji.grade.name" /></li>
								<li>上课地点：<s:property value="banji.address" /></li>
								<li>开课日期：<s:date name="banji.startdate" format="MM-dd-yy" /> 至 <s:date
										name="banji.enddate" format="MM-dd-yy" /></li>
								<li>上课时间：<s:property value="banji.startime" /></li>
								<li>课次：<s:property value="banji.classnumber" /> <span
									class="price"> 价格：<b style="font-size: 15px; color: red">￥<s:property
												value="o_price" /></b>
								</span>
								</li>
							</ul>
						</div>
						<div class="states">
							<div>
								<s:property value="remark" />
							</div>
							<s:if test='ispay'>
								<div class="btn1">
									<a href="#">已付款</a>
								</div>
							</s:if>
							<s:else>
							
								<div class="btn1">
									<a href='<%=basePath%>orderdAction_pay.action?oid=<s:property value="id" />'
										class="btn2">提交订单</a>
								</div>
							</s:else>
						</div>
					</div>
				</s:iterator>
			</div>
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
							window.location.href = "orderdAction_orderlist.action?page="
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
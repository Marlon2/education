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
<title>老师信息</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/teacher.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	<div id="content1">
		<div class="content2">
			<div class="content3">
				<span class="titlestyle10">老师信息</span>
			</div>
		</div>
		<div class="content4"></div>
		<div id="content5">
			<div class="content6" valign="top">


				<h2 align="center">
					<font color="#FF2D2D"><s:property value="teacher.name" /></font>老师简介
				</h2>
				<div class="teacherinfo">

					<div align="center" class="teacherinfoleft">
						<img src='<s:property value="teacher.pictureurl"/>'
							style="width: 200px; height: 255px;">
					</div>
					<div class="teacherinforight">
						<p>
							老师姓名：
							<s:property value="teacher.name" />
						</p>
						<p>
							学科：
							<s:iterator value="teacher.subjects">
								<s:property value="name" />
							</s:iterator>
						</p>
						<p>
							年级：
							<s:iterator value="teacher.grades">
								<s:property value="name" />
							</s:iterator>
						</p>
					</div>
				</div>
				<div class="teacherdesp">
					<div class="teacherbar">老师简介</div>
					<div style="line-height: 150%; text-indent: 32px">
						<s:property value="teacher.description" />
					</div>
				</div>

				<div class="teacherclass">
					<div class="teacherbar">开设课程</div>
					<div>
						<table border="0" cellpadding="0" cellspacing="0" class="clsTable">
							<tbody>
								<tr>
									<th>班级名称</th>
									<th>上课老师及地点</th>
									<th>开课日期及时间</th>
									<th>费用</th>
									<th>操作</th>
								</tr>
								<s:iterator value="teacher.banjis">
									<tr>
										<td>
											<div class="classname">
												<s:property value="classname" />
											</div>
											<div class="classcode">
												编号：
												<s:property value="number" />
											</div>
										</td>
										<td>
											<div class="classname">
												<s:iterator value="teachers">
													<s:property value="name" />,
										</s:iterator>

											</div>
											<div class="classcode">
												<s:property value="address" />
											</div>
										</td>
										<td>
											<div class="classname">
												<s:date name="startdate" format="MM-dd-yy" />
												-
												<s:date name="enddate" format="MM-dd-yy" />
											</div>
											<div class="classcode">
												<s:property value="startime" />
											</div>
										</td>
										<td>
											<div>
												￥
												<s:property value="price" />
											</div>
										</td>
										<td>
											<div>
												<%
													int flag = 1;
												%>
												<s:iterator value="#session.carts">
													<s:if test="cid==bid">
														<font>已经报名</font>
														<%
															flag = 0;
														%>
													</s:if>
												</s:iterator>
												<%
													if (flag == 1) {
												%>
												<a class="more"
													href="<%=basePath%>cartAction_init.action?bid=<s:property value="bid" />&sid=<s:property value="#session.student_admin.sid" />">立即报名</a>
												<%
													}
												%>
											</div>
										</td>
									</tr>
								</s:iterator>

							</tbody>
						</table>
					</div>
				</div>


				<br> <br>
				<div align="right">
					<span>【</span> <a class="more"
						href="javascript:window.opener=null;window.open('','_self');window.close();">
						<span>关闭窗口</span>
					</a> <span>】</span>
				</div>
			</div>
			<div id="blankstyle"></div>
		</div>
		<div id="content_bottom"></div>
	</div>
	<!-- 页脚 -->
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
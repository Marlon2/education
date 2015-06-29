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
<title>confirm</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function order(){
	//alert(12);
	var address = $("#o_address").val();
	if(address==""){
		alert("请输入收货地址。");
		return;
	}
	$("#fm").submit();
}

</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	
	<form id="fm" action="studentAction_saveOrder.action" method="post">
	<div id="main-m">
		<div class="wrap">
			<div class="success">
				<div class="success-b">
					<br>
					<h3>请输入收货地址</h3>
					<textarea id="o_address" name="o_address" rows="3" cols="50"></textarea>
					<input type="hidden" name="bids" value='<s:property value="bids" />'>
					<input type="hidden" name="price" value='<s:property value="price" />'>
				</div>
			</div>
		</div>

	</div>
	<div class="wrap">
		<div class="buyClass-a">确认订单信息</div>
		<div class="buyClass-b">
			<table cellpadding="0" cellspacing="0" width="100%"
				class="Cart_table" style="border-collapse: collapse;">
				<tbody>
					<s:iterator value="banjis" var="banji">
						<tr>
							<td class="Por_list"><a href="#" class="f16px"><s:property
										value="classname" /></a>&nbsp;&nbsp; <a href="#" class="f14px">查看课程表</a><br>
								班级编码hsw222 <span class="pl">任课老师：王菲</span><br> 开课日期：<s:date
									name="startdate" format="MM-dd-yy" />（总课次数<s:property
									value="classnumber" />）<br> 上课时间：2月7日-13日,下午13:30-16:30<br>
								上课地点：<s:property value="address" /></td>
						</tr>
					</s:iterator>
				</tbody>

			</table>

		</div>
		<div class="checkout">
			<div class="r">
				<p>
					实付款：<span id="money"><s:property value="price" /></span>
				</p>
				<div class="button">
					<div class="checkout_btn3">
						<a href="javascript:order()" style="color: white;">提交订单</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<br>
	<br>
	<br>
	<!-- 页脚 -->
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
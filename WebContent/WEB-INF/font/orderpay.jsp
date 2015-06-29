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
<title>confirm</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function pay(){
	
	$("#fm").submit();
}
</script>
</head>
<body>
<jsp:include page="../common/top.jsp" flush="true"></jsp:include>

<div class="wrap">
		<div class="buyClass-a">订单信息</div>
		<div class="buyClass-b">
			<table cellpadding="0" cellspacing="0" width="100%"
				class="Cart_table" style="border-collapse: collapse;">
				<tbody>
						<tr>
							<td class="Por_list">
							<a href="#" class="f16px">
							<s:property value="orderd.banji.classname" /></a>&nbsp;&nbsp; <a href="#" class="f14px">查看课程表</a><br>
								班级编码hsw222 <span class="pl">任课老师：<s:property value="orderd.banji.classname" /></span><br> 开课日期：<s:date
									name="orderd.banji.startdate" format="MM-dd-yy" />（总课次数<s:property
									value="orderd.banji.classnumber" />）<br> 上课时间：<s:property value="orderd.banji.starttime" /><br>
								上课地点：<s:property value="orderd.banji.address" />
							</td>
						</tr>
				</tbody>

			</table>

		</div>
		<div class="checkout">
			<div class="r">
				<p>
					<span id="money"><s:property value="orderd.banji.price" />元</span>
				</p>
			</div>
		</div>
		<form id="fm" action="studentAction_pay.action" method="post">
		<div class="checkout" align="center">
			<div class="r">
				支付宝余额：100000元
				支付：<span id="money"><s:property value="orderd.banji.price" /></span>
				<h3>请输入支付宝密码</h3>
				<input type="password" name="pwd"><s:property value="message" />
				<input type="hidden" name="oids" value='<s:property value="orderd.id" />'>
				<div class="button">
					<div class="checkout_btn3">
						<a href="javascript:pay()" style="color: white;">确认付款</a>
					</div>
				</div>
			</div>
		</div>
		</form>
</div>

<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
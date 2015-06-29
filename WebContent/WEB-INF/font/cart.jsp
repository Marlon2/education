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
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<%-- <script type="text/javascript" src="js/common.js"></script> --%>
<script type="text/javascript">
	$().ready(
			function() {
				//批量删除---选中按钮
				$("#ckSelectAll").click(
						function() {
							if ($(this).prop("checked")) {
								$("input[name=nId][type=checkbox]").prop(
										"checked", "checked");
							} else {
								$("input[name=nId][type=checkbox]").prop(
										"checked", "");
							}
						});
				var money = 0.00;
				var trs = $("td[class=price]");
				trs.each(function() {
					money = money + parseFloat($(this).text());
				});
				$("#money").text(money);
				$("input[name=nId][type=checkbox]").each(
						function() {
							$(this).click(
									function() {
										var price1 = parseFloat($(this)
												.parent().parent().parent()
												.parent().children().last()
												.text());
										if ($(this).prop("checked")) {
											money = money + price1;
										} else {
											money = money - price1;
										}
										$("#money").text(money);
									});
						});
				/**
				 * 当页面进行加载的时候，给名称删除的超级连接添加一个事件
				 */
				$(".deleted").each(function() {
					$(this).unbind("click");
					$(this).bind("click", function() {
						if (confirm("是否将此班级删除?")) {
							return true;
						} else {
							return false;
						}
					});
				});
				$(".cleard").bind("click", function() {
					if (confirm("是否要清空购物车?")) {
						return true;
					} else {
						return false;
					}
				});

			});

function confirm_order(){
	var strIds=[];//选中的序号组合
	var url = "studentAction_confirmorder.action";
	$("input[name=nId][type=checkbox]").each(
		function() {
			if($(this).attr("checked")=="checked"){
				strIds.push($(this).prev().val());
				//alert($(this).prev().val());//get(0).tagName);
			}
		});
	var ids=strIds.join(",");
	if(ids!=""){
		window.location.href="studentAction_confirmorder.action?bids="+ids;
		//alert(ids);
	}
		return false;
	}
</script>
</head>
<body>
<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	<div class="wrap">
		<div class="buyClass-a">购买班级</div>
		<div class="buyClass-b">
			<table cellpadding="0" cellspacing="0" width="100%"
				class="Cart_table" style="border-collapse: collapse;">
				<tbody>
					<tr class="thcss">
						<th scope="col" class="tdlast"><label> <input
								type="checkbox" name="checkbox" id="ckSelectAll"
								checked="checked"> 全选
						</label></th>
						<th scope="col" width="450">班级</th>
						<th scope="col">班级状态</th>
						<th scope="col">当前班级价格</th>
					</tr>
					<s:iterator value="#session.cart_banji">
						<tr>
							<td class="tdlast">
								<div class="select">
									<label>
									<input type="hidden" name="bid" value="<s:property value='bid' />">
									<input type="checkbox" name="nId"
										checked="checked">&nbsp; 选中付款
									</label>
								</div>
								<div align="center">
									<a
										href='cartAction_delete.action?bid=<s:property value="bid"/> '
										class="deleted">删除</a>
								</div>
							</td>
							<td class="Por_list"><a href="#" class="f16px"><s:property
										value="classname" /></a>&nbsp;&nbsp; <a href="#" class="f14px">查看课程表</a><br>
								班级编码hsw222 <span class="pl">任课老师：王菲</span><br> 开课日期：<s:date
									name="startdate" format="MM-dd-yy" />（总课次数<s:property
									value="classnumber" />）<br> 上课时间：2月7日-13日,下午13:30-16:30<br>
								上课地点：<s:property value="address" /></td>
							<td align="center" class="status"><em><s:property
										value="remark" /></em></td>
							<td align="center" class="price"><s:property value="price" /></td>
						</tr>
					</s:iterator>
				</tbody>

			</table>

		</div>
		<div class="checkout">
			<div class="l">
				<div class="checkout_btn1">
					<a href="cartAction_clear.action" class="cleard">清空购物车</a>
				</div>
			</div>
			<div class="r">
				<p>
					应付金额：<span id="money"></span>
				</p>
				<div class="button">
					<div class="checkout_btn2">
						<a href="#">&lt;&lt; 继续选课</a>
					</div>
					<div class="checkout_btn3">
						<a href="javascript:confirm_order()" style="color: white;">马上结算</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<!-- 页脚 -->
	<jsp:include page="../common/bottom.jsp" flush="true"></jsp:include>
</body>
</html>
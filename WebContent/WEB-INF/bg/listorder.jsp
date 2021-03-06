<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息管理</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript">
var url;
//打开新增订单对话框
function openOrderdAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加订单信息");
	url="bgOrderdAction_add.action";//为url赋值
}

//重置对话框内数据
function resetValue(){
	$("#bid").val("");
	$("#sid").val("");
	$("#ispay").combobox("setValue","");
	
}
//关闭对话框
function closeOrderdDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
function closeOrderdWorkDialog(){
	$("#dlg1").dialog("close");
	resetValue();
}
//提交新增订单数据
function saveOrderd(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($('#ispay').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择是否支付");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
	});
}

//删除选中的订单数据
function deleteOrderd(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("bgOrderdAction_delete.action",{delIds:ids},function(result){
				if(result.success){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示',result.errorMsg);
				}
			},"json");
		}
	});
}
//修改订单资料
function openOrderdModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑订单资料");
	$("#sid").val(row.sid);
	$("#ispay").combobox("setValue",row.ispay);
	$("#bid").val(row.bid);
	
	url="bgOrderdAction_update.action?orderdId="+row.id;
}
//查询符合条件的用户
function searchOrderd(){
	$('#dg').datagrid('load',{
		o_sid:$('#o_sid').val(),
		o_ispay:$('#o_ispay').combobox("getValue"),
	});
}
</script>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin:5px">
<table id="dg" title="订单信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="bgOrderdAction_allOrderds.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center" hidden="true">用户ID</th>
				<th field="bid" width="50" align="center" hidden="true">班级ID</th>
				<th field="sid" width="80"  align="center">用户id</th>
				<th field="name" width="120" align="center" >班级名称</th>
				<th field="price" width="150" align="center">价格</th>
				<th field="ispay" width="150" align="center">是否付款</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openOrderdAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openOrderdModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteOrderd()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			<form id="export" method="post">
			&nbsp;用户id：&nbsp;<input type="text" name="o_sid" id="o_sid" size="10"/>
			&nbsp;是否付款：&nbsp;<select class="easyui-combobox" id="o_ispay" name="o_ispay" editable="false" panelHeight="auto">
			    <option value="-1">请选择...</option>
				<option value="1">已付款</option>
				<option value="0">未付款</option>
			</select>
			<a href="javascript:searchOrderd()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 530px;height: 330px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td>用户id：</td>
					<td><input type="text" name="sid" id="sid" class="easyui-validatebox" required="true"/></td>
					<td>班级id：</td>
					<td><input type="text" name="bid" id="bid" class="easyui-validatebox" required="true"/></td>
					
				</tr>
				<tr>
					<td>是否支付：</td>
					<td>
					<select class="easyui-combobox" id="ispay" name="ispay" editable="false" panelHeight="auto">
						<option value="">请选择...</option>
						<option value="1">已付款</option>
						<option value="0">未付款</option>
					</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveOrderd()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeOrderdDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>
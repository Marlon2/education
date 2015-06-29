<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员信息管理</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript">
var url;
//打开新增患者对话框
function openUserAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加管理员信息");
	url="userAction_add.action";//为url赋值
}

//重置对话框内数据
function resetValue(){
	$("#username").val("");
	$("#password").val("");
	$("#role").combobox("setValue","");
	$("#status").val("");
	
}
//关闭对话框
function closeUserDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
//提交新增管理员数据
function saveUser(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			if($('#role').combobox("getValue")==""){
				$.messager.alert("系统提示","请选择角色");
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

//删除选中的管理员数据
function deleteUser(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].uid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("userAction_delete.action",{delIds:ids},function(result){
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
//修改用户资料
function openUserModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑管理员资料");
	$("#username").val(row.username);
	$("#password").val(row.password);
	$("#role").combobox("setValue",row.role);
	$("#status").val(row.status);
	
	url="userAction_update.action?userId="+row.uid;
}
</script>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin:5px">
<table id="dg" title="管理员信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="userAction_allUsers.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="uid" width="50" align="center" hidden="true">用户ID</th>
				<th field="username" width="80" align="center" >用户名</th>
				<th field="password" width="80" align="center">密码</th>
				<th field="role" width="80" align="center">角色</th>
				<th field="status" width="80" align="center">状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
		
	<div id="dlg" class="easyui-dialog" style="width: 530px;height: 200px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td>姓名：</td>
					<td><input type="text" name="username" id="username" class="easyui-validatebox" required="true"/></td>
					<td>密码：</td>
					<td><input type="text" class="easyui-validatebox" name="password" id="password" required="true"/></td>
				</tr>
				<tr>
					<td>角色：</td>
					<td><select class="easyui-combobox" id="role" name="role" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="管理员">管理员</option>
						<option value="一般用户">一般用户</option>
					</select></td>
					<td>状态：</td>
					<td><input type="text" name="status" id="status"  required="false"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	<!-- <script type="text/javascript">
	$(function(){
		$('#dg').datagrid('hideColumn','password');
		alert(11);
	}); -->
	</script>
</body>
</html>
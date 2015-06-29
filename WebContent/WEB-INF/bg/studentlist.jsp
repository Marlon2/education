<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript">
var url;
//打开新增学生对话框
function openStudentAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加学生信息");
	url="bgStudentAction_add.action";//为url赋值
}

//重置对话框内数据
function resetValue(){
	$("#name").val("");
	$("#sex").combobox("setValue","");
	$("#mobilenumber").val("");
	$("#password").val("");
	$("#gid").combobox("setValue","");
	$("#birthday").datebox("setValue","");
	$("#email").val("");
	$("#address").val("");
	
}
//关闭对话框
function closeStudentDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
function closeStudentWorkDialog(){
	$("#dlg1").dialog("close");
	resetValue();
}
//提交新增学生数据
function saveStudent(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($('#sex').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择性别");
					return false;
				}
				if($('#gid').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择年级");
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

//删除选中的学生数据
function deleteStudent(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].sid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("bgStudentAction_delete.action",{delIds:ids},function(result){
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
//修改学生资料
function openStudentModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑学生资料");
	$("#name").val(row.name);
	$("#sex").combobox("setValue",row.sex);
	$("#mobilenumber").val(row.mobilenumber);
	$("#password").val(row.password);
	$("#gid").combobox("setValue",row.gname);
	$("#birthday").datebox("setValue",row.birthday);
	$("#email").val(row.email);
	$("#address").val(row.address);
	
	
	url="bgStudentAction_update.action?studentId="+row.sid;
}
//查询符合条件的用户
function searchStudent(){
	$('#dg').datagrid('load',{
		s_studentName:$('#s_studentName').val(),
		s_sex:$('#s_sex').combobox("getValue"),
		s_mobilenumber:$('#s_mobilenumber').val()
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
<table id="dg" title="学生信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="bgStudentAction_allStudent.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="sid" width="50" align="center" hidden="true">用户ID</th>
				<th field="name" width="120" align="center" >学生姓名</th>
				<th field="sex" width="80"  align="center">性别</th>
				<th field="mobilenumber" width="150" align="center">电话号码</th>
				<th field="password" width="150" align="center">密码</th>
				<th field="gname" width="150" align="center">年级</th>
				<th field="birthday" width="120" align="center">出生日期</th>
				<th field="email" width="120" align="center">邮箱</th>
				<th field="address" width="80" align="center">家庭住址</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openStudentAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openStudentModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteStudent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			<form id="export" method="post">
			&nbsp;姓名：&nbsp;<input type="text" name="s_studentName" id="s_studentName" size="10"/>
			&nbsp;性别：&nbsp;<select class="easyui-combobox" id="s_sex" name="s_sex" editable="false" panelHeight="auto">
			    <option value="">请选择...</option>
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
			&nbsp;电话号码：&nbsp;<input type="text" id="s_mobilenumber" name="s_mobilenumber" size="11" />  <!-- data-options="panelHeight:'auto',editable:false,valueField:'email',textField:'keshiName',url:'keshi'" --> 
			<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 530px;height: 330px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td>学生姓名：</td>
					<td><input type="text" name="name" id="name" class="easyui-validatebox" required="true"/></td>
					<td>性别：</td>
					<td><select class="easyui-combobox" id="sex" name="sex" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td>电话号码：</td>
					<td><input type="text" name="mobilenumber" id="mobilenumber" class="easyui-validatebox" required="true"/></td>
					<td>密码：</td>
					<td><input type="text" name="password" id="password" class="easyui-validatebox"  required="true"/></td>
					
				</tr>
				<tr>
					<td>年级：</td>
					<td><select class="easyui-combobox"  name="gid" id="gid" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'gid',textField:'name',url:'gradeAction_list.action'"></select> 
					</td>
					<td>出生日期：</td>
					<td><input class="easyui-datebox" name="birthday" id="birthday" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input type="text" name="email" id="email" class="easyui-validatebox" required="true"/></td>
					<td>家庭住址：</td>
					<td><input type="text" name="address" id="address" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeStudentDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师信息管理</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript">
var url;
//打开新增老师对话框
function openTeacherAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加老师信息");
	url="bgTeacherAction_add.action";//为url赋值
}

//重置对话框内数据
function resetValue(){
	$("#teachernumber").val("");
	$("#name").val("");
	$("#sex").combobox("setValue","");
	$("#mobilenumber").val("");
	$("#password").val("");
	$("#pictureurl").val("");
	$("#introduce").val("");
	$("#description").val("");
	$("#birthday").datebox("setValue","");
	$("#email").val("");
	$("#address").val("");
	
}
//关闭对话框
function closeTeacherDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
//提交新增老师数据
function saveTeacher(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($('#sex').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择性别");
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

//删除选中的老师数据
function deleteTeacher(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].tid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("bgTeacherAction_delete.action",{delIds:ids},function(result){
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
//修改老师资料
function openTeacherModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑老师资料");
	$("#teachernumber").val(row.teachernumber);
	$("#name").val(row.name);
	$("#sex").combobox("setValue",row.sex);
	$("#mobilenumber").val(row.mobilenumber);
	$("#password").val(row.password);
	
	$("#pictureurl").val(row.pictureurl);
	$("#introduce").val(row.introduce);
	$("#description").val(row.description);
	$("#birthday").datebox("setValue",row.birthday);
	$("#email").val(row.email);
	$("#address").val(row.address);
	
	url="bgTeacherAction_update.action?teacherId="+row.sid;
}
//查询符合条件的用户
function searchTeacher(){
	$('#dg').datagrid('load',{
		s_teacherName:$('#s_teacherName').val(),
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
<table id="dg" title="老师信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="bgTeacherAction_allTeacher.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="tid" width="50" align="center" hidden="true">用户ID</th>
				<th field="teachernumber" width="120" align="center" >老师编码</th>
				<th field="name" width="120" align="center" >老师姓名</th>
				<th field="sex" width="80"  align="center">性别</th>
				<th field="mobilenumber" width="150" align="center">电话号码</th>
				<th field="password" width="150" align="center">密码</th>
				<th field="pictureurl" width="150" align="center">照片路径</th>
				<th field="introduce" width="120" align="center">简介</th>
				<th field="description" width="120" align="center">描述</th>
				<th field="birthday" width="120" align="center">出生日期</th>
				<th field="email" width="120" align="center">邮箱</th>
				<th field="address" width="80" align="center">家庭住址</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openTeacherAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openTeacherModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteTeacher()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			<form id="export" method="post">
			&nbsp;姓名：&nbsp;<input type="text" name="s_teacherName" id="s_teacherName" size="10"/>
			&nbsp;性别：&nbsp;<select class="easyui-combobox" id="s_sex" name="s_sex" editable="false" panelHeight="auto">
			    <option value="">请选择...</option>
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
			&nbsp;电话号码：&nbsp;<input type="text" id="s_mobilenumber" name="s_mobilenumber" size="11" />  <!-- data-options="panelHeight:'auto',editable:false,valueField:'email',textField:'keshiName',url:'keshi'" --> 
			<a href="javascript:searchTeacher()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 530px;height: 300px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td>老师编码：</td>
					<td><input type="text" name="teachernumber" id="teachernumber" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>		
					<td>老师姓名：</td>
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
					<td>照片路径：</td>
					<td><input type="text" name="pictureurl" id="pictureurl" class="easyui-validatebox"  required="true"/></td>
					<td>简介：</td>
					<td><input type="text" name="introduce" id="introduce" class="easyui-validatebox" required="true"/></td>
					
				</tr>
				<tr>
					<td>描述：</td>
					<td><input type="text" name="description" id="description" class="easyui-validatebox"  required="true"/></td>
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
		<a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeTeacherDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>
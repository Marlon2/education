<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息管理</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript">
var url;
//打开新增班级对话框
function openBanjiAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加班级信息");
	url="bgBanjiAction_add.action";//为url赋值
}

//重置对话框内数据
function resetValue(){
	$("#number").val("");
	$("#gid").combobox("setValue","");
	$("#classname").val("");
	$("#description").val("");
	$("#studentnumber").val("");
	$("#signnumber").val("");
	$("#classnumber").val("");
	$("#startdate").datebox("setValue","");
	$("#enddate").datebox("setValue","");
	$("#startime").val("");
	$("#address").val("");
	
	$("#price").val("");
	$("#remark").val("");
	
}
//关闭对话框
function closeBanjiDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
//提交新增班级数据
function saveBanji(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
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
//删除选中的班级数据
function deleteBanji(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].bid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("bgBanjiAction_delete.action",{delIds:ids},function(result){
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
//修改班级资料
function openBanjiModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑班级资料");

	$("#number").val(row.number);
	$("#gid").combobox("setValue",row.gradename);
	$("#classname").val(row.classname);
	$("#description").val(row.description);
	$("#studentnumber").val(row.studentnumber);
	$("#signnumber").val(row.signnumber);
	$("#classnumber").val(row.classnumber);
	$("#startdate").datebox("setValue",row.startdate);
	$("#enddate").datebox("setValue",row.enddate);
	$("#startime").val(row.startime);
	$("#address").val(row.address);
	
	$("#price").val(row.price);
	$("#remark").val(row.remark);

	
	url="bgBanjiAction_update.action?banjiId="+row.bid;
}
//查询符合条件的用户
function searchBanji(){
	$('#dg').datagrid('load',{
		s_number:$('#s_number').val(),
		s_gid:$('#s_gid').combobox("getValue"),
		s_name:$('#s_name').val()
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
<table id="dg" title="班级信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="bgBanjiAction_allBanji.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="bid" width="50" align="center" hidden="true">用户ID</th>
				<th field="number" width="120" align="center" >班级编号</th>
				<th field="gradename" width="120" align="center" >所属年级</th>
				<th field="classname" width="120" align="center" >班级名称</th>
				<th field="description" width="120" align="center" >班级描述</th>
				<th field="studentnumber" width="50" align="center" >班级计划人数</th>
				<th field="signnumber" width="50"  align="center">已报人数</th>
				<th field="classnumber" width="50" align="center">课时数</th>
				<th field="startdate" width="180" align="center">开班日期</th>
				<th field="enddate" width="180" align="center">结束日期</th>
				<th field="startime" width="180" align="center">上课时间</th>
				<th field="address" width="180" align="center">上课地址</th>
				<th field="price" width="80" align="center">价格</th>
				<th field="remark" width="100" align="center">备注</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openBanjiAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openBanjiModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteBanji()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			<form id="export" method="post">
			&nbsp;编号：&nbsp;<input type="text" name="s_number" id="s_number" size="10"/>
			&nbsp;年级：&nbsp;<select class="easyui-combobox"  name="s_gid" id="s_gid" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'gid',textField:'name',url:'gradeAction_list.action'"></select> 
			&nbsp;班级名称：&nbsp;<input type="text" name="s_name" id="s_name" size="10"/>
			<a href="javascript:searchBanji()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div>
	</div>
		
	<div id="dlg" class="easyui-dialog" style="width: 530px;height: 320px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>	
					<td>班级编号：</td>
					<td><input type="text" name="number" id="number" class="easyui-validatebox" required="true"/></td>
					<td>所属年级：</td>
					<td><select class="easyui-combobox"  name="gid" id="gid" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'gid',textField:'name',url:'gradeAction_list.action'"></select> 
					</td>
				</tr>
				<tr>
					<td>班级名称：</td>
					<td><input type="text" name="classname" id="classname" class="easyui-validatebox" required="true"/></td>
					<td>班级简介：</td>
					<td><input type="text" name="description" id="description" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>班级人数：</td>
					<td><input type="text" name="studentnumber" id="studentnumber" class="easyui-validatebox" required="true"/></td>
					<td>已报人数：</td>
					<td><input type="text" name="signnumber" id="signnumber" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>课时数：</td>
					<td><input type="text" name="classnumber" id="classnumber" class="easyui-validatebox" data-options="required:true,validType:'length[1,2]'"/></td>
					<td>开始日期：</td>
					<td><input class="easyui-datebox" name="startdate" id="startdate" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>结束日期：</td>
					<td><input class="easyui-datebox" name="enddate" id="enddate" required="true" editable="false" /></td>
					<td>上课时间：</td>
					<td><input type="text" name="startime" id="startime" class="easyui-validatebox"  required="true"/></td>
				</tr>
				<tr>
					<td>上课地址：</td>
					<td><input type="text" name="address" id="address" class="easyui-validatebox" required="true"/></td>
					<td>价格：</td>
					<td><input type="text" name="price" id="price" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><input type="text" name="remark" id="remark" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveBanji()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeBanjiDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	<div id="dlg1" class="easyui-dialog" style="width: 270px;height: 220px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons1">
		<form id="fm1" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>上班日期：</td>
					<td><input class="easyui-datebox" name="doctorwork.time" id="time" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>预约数量：</td>
					<td><input type="text" name="doctorwork.num" id="num" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>最大预约数：</td>
					<td><input type="text" name="doctorwork.maxnum" id="maxnum" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons1">
		<a href="javascript:saveBanjiWrok()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeBanjiWorkDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>
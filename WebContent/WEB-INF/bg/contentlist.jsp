<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告信息管理</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript" src="<%=basePath%>/ckeditor_4.4/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('description',{toolbar:'Full', skin : 'kama'});  
var url;
//打开新增公告对话框
function openContentAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加公告信息");
	url="bgUploadAction_add.action";//为url赋值
}

//重置对话框内数据
function resetValue(){
	$("#title").val("");
	$("#uploadify").val("");
	$("#author").val("");
	$("#introduce").val("");
	$("#description").val("");
	$("#url1").val("");
	$("#deleted1").val("");
	$("#viewcount").val("");
	$("#publishdate").datebox("setValue","");
	$("#remark").val("");
	
	$("#channel_id").val("");
	
}
//关闭对话框
function closeContentDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
//提交新增公告数据
function saveContent(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			//alert(url);
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
//删除选中的公告数据
function deleteContent(){
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
			$.post("bgUploadAction_delete.action",{delIds:ids},function(result){
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
//修改公告资料
function openContentModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑公告资料");

	$("#title").val(row.title);
	$("#uploadify").val(row.uploadify);
	$("#author").val(row.author);
	$("#introduce").val(row.introduce);
	$("#description").val(row.description);
	$("#url1").val(row.url);
	$("#deleted1").val(row.deleted);
	$("#viewcount").val(row.viewcount);
	$("#publishdate").datebox("setValue",row.publishdate);
	
	$("#remark").val(row.remark);
	$("#channel_id").val(row.channel_id);

	url="bgUploadAction_update.action?contentId="+row.id;
}
//查询符合条件的用户
function searchContent(){
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
<table id="dg" title="公告信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="bgContentAction_allContent.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center" hidden="true">用户ID</th>
				<th field="title" width="120" align="center" >公告标题</th>
				<th field="pictureurl" width="120" align="center" >图片地址</th>
				<th field="author" width="120" align="center" >作者</th>
				<th field="introduce" width="250" align="center" >简介</th>
				<th field="description" width="320" align="center" >详细内容</th>
				<th field="url" width="80"  align="center">点击地址</th>
				<th field="deleted" width="80" align="center">是否不显示</th>
				<th field="viewcount" width="180" align="center">浏览次数</th>
				<th field="publishdate" width="180" align="center">发布时间</th>
				<th field="channel_id" width="180" align="center">渠道</th>
				<th field="remark" width="100" align="center">备注</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openContentAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openContentModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteContent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<%-- <div>
			<form id="export" method="post">
			&nbsp;编号：&nbsp;<input type="text" name="s_number" id="s_number" size="10"/>
			&nbsp;年级：&nbsp;<select class="easyui-combobox"  name="s_gid" id="s_gid" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'gid',textField:'name',url:'gradeAction_list.action'"></select> 
			&nbsp;公告名称：&nbsp;<input type="text" name="s_name" id="s_name" size="10"/>
			<a href="javascript:searchContent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div> --%>
	</div>
		
	<div id="dlg" class="easyui-dialog" style="width: 830px;height: 320px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" enctype="multipart/form-data" >
			<table cellspacing="5px;">
				 <tr>	
					<td>公告标题：</td>
					<td><input type="text" name="title" id="title" class="easyui-validatebox" required="true"/></td>
					<td>上传图片：</td>
					<td>
					 <input  name="upload" type="file" id="uploadify" />
					</td>
				</tr>
				<tr>
					<td>作者：</td>
					<td><input type="text" name="author" id="author" class="easyui-validatebox" required="true"/></td>
					<td>简介：</td>
					<td><input type="text" name="introduce" id="introduce" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>详细介绍：</td>
					<td colspan="3">
					<textarea class="ckeditor" cols="80" id="description" name="description" rows="10">  
      				 
					</textarea> 
					</td>
				</tr>
				<tr>
					<td>点击图片的地址：</td>
					<td><input type="text" name="url1" id="url1" class="easyui-validatebox" /></td>
					<td>是否显示：</td>
					<td><input type="text" name="deleted1" id="deleted1" class="easyui-validatebox" required="true"/></td>
				</tr>
				 <tr>
					<td>浏览次数：</td>
					<td><input type="text" name="viewcount" id="viewcount" class="easyui-validatebox" required="true"/></td>
					<td>发布时间：</td>
					<td><input class="easyui-datebox" name="publishdate" id="publishdate" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><input class="easyui-validatebox" name="remark" id="remark" required="true" editable="false" /></td>
					<td>发布渠道：</td>
					<td><input type="text" name="channel_id" id="channel_id" class="easyui-validatebox"  required="true"/></td>
				</tr> 
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveContent()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeContentDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>
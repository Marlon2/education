<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台信息管理系统</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/bg_images/favicon.ico"  type="image/x-icon">
<%
	// 权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		// 数据
		var treeData=[{
			text:"基础信息管理",
			iconCls:"icon-menu",
			children:[{
				text:"学生信息管理",
				iconCls:"icon-user",
				attributes:{
					url:"bgStudentAction_list.action"
				}
			},{
				text:"老师信息管理",
				iconCls:"icon-user",
				attributes:{
					url:"bgTeacherAction_list.action"
				}
			},{
				text:"管理员账户",
				iconCls:"icon-user",
				attributes:{
					url:"userAction_list.action"
				}
			}]
		},{
			text:"班级信息管理",
			iconCls:"icon-menu",
			children:[{
				text:"年级信息管理",
				iconCls:"icon-manage",
				attributes:{
					url:"gradeAction_listUI.action"
				}
			},{
				text:"班级信息管理",
				iconCls:"icon-manage",
				attributes:{
					url:"bgBanjiAction_listUI.action"
				}
			},{
				text:"课程信息管理",
				iconCls:"icon-manage",
				attributes:{
					url:"bgSubjectAction_listUI.action"
				}
			}]
		},{
			text:"订单信息管理",
			iconCls:"icon-menu",
			children:[{
				text:"订单管理",
				iconCls:"icon-manage",
				attributes:{
					url:"bgOrderdAction_listUI.action"
				}
			}]
		},{
			text:"公告信息管理",
			iconCls:"icon-menu",
			children:[{
				text:"所以公告信息",
				iconCls:"icon-manage",
				attributes:{
					url:"bgContentAction_list.action"
				}
			}]
		}];
		
		// 实例化树菜单
		$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url,node.iconCls);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url,iconCls){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content,
					iconCls:iconCls,
				});
			}
		}
	});
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 85px;background-color: #E0EDFF">
		<div align="left" style="float: left; height:80px"><img src="bg_images/logo.png"></div>
		<div style="padding-top: 50px;padding-right: 20px; float:right">当前用户：&nbsp;<font color="red" >${currentUser.username}</font><a href="login!logout" style="margin-left:20px;text-decoration:none">注销登录</a></div>
		
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页"  data-options="iconCls:'icon-welcome'">
				<div align="center" style="padding-top: 100px;"><font color="red" size="8"><b>欢迎使用众筹教育后台信息管理系统</b></font></div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 150px;" title="导航菜单" split="true">
		<ul id="tree"></ul>
	</div>
	<div region="south" style="height: 25px;" align="center">版权所有</div>
</body>
</html>
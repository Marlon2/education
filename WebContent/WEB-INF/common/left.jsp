<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="Navigation">
	<s:if test="#session.student_admin.name==null">
		
	</s:if>
	<s:elseif test="#session.teacher_admin.name==null">
	
	</s:elseif>
	<s:else>
		<h2 id="title1" onMouseOver="setTab('title',1,3)">帐号设置</h2>
		<ul>
			<li><a href="javascript:void(0);" id="con_title_1" class="ons"
				onclick="Jump(this)"><strong>基本信息</strong></a></li>
		</ul>
		<h2 id="title2" onMouseOver="setTab('title',2,3)">安全设置</h2>
		<ul>
			<li><a href="javascript:void(0);" id="con_title_2"
				onclick="Jump(this)">修改密码</a></li>
		</ul>
		<s:if test="#session.student_admin.name!=null ">
			<h2 id="title3" onMouseOver="setTab('title',3,3)">我的购物车</h2>
			<ul>
				<li><a href="javascript:void(0);" id="con_title_3"
					onclick="Jump(this)">购物车</a></li>
			</ul>
		</s:if>
		<s:elseif test="#session.teacher_admin.name!=null ">
			<h2 id="title3" onMouseOver="setTab('title',3,3)">我的课程</h2>
			<ul>
				<li><a href="javascript:void(0);" id="con_title_3"
					onclick="Jump(this)">课程</a></li>
			</ul>
		</s:elseif>
	</s:else>
</div>
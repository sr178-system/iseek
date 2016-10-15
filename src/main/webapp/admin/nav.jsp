<%@page import="com.sr178.iseek.admin.bean.UserInfo"%>
<%@page import="com.google.common.base.Strings"%>
<%@page import="com.sr178.iseek.admin.bo.AdminUser"%>
<%@page import="com.sr178.iseek.admin.service.AdminService"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String current = request.getParameter("current");
  AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
  String id = session.getId();
  UserInfo userInfo = adminService.isLogin(id);
  String class1 = "\"li1\"";
  String class2 = "\"li2\"";
  String class3 = "\"li3\"";
  String class4 = "\"li4\"";
  String class5 = "\"li5\"";
  String class6 = "\"li6\"";
  if(current.equals("1")){
	  class1 = "\"hover li1\"";
  }else if(current.equals("2")){
	  class2 = "\"hover li2\"";
  }else if(current.equals("3")){
	  class3 = "\"hover li3\"";
  }else if(current.equals("4")){
	  class4 = "\"hover li4\"";
  }else if(current.equals("5")){
	  class5 = "\"hover li5\"";
  }else if(current.equals("6")){
	  class6 = "\"hover li6\"";
  }
%>
<div class="lefter" region="west">
	<ul>
		<li><a class=<%=class1%> href="/adminindex">检查记录</a></li>
		<% if(userInfo.getRoleType()>0){%>
	    <% if(userInfo.getRoleType()==2){%>
	    <li><a class=<%=class3%> href="/adminList">管理员管理</a></li>
	    <% }%>
		<li><a class=<%=class4%> href="/userList">执法人员管理</a></li>
		<li><a class=<%=class5%> href="/checkItemList">检查项管理</a></li>
		<li><a class=<%=class6%> href="/noticeList">发布通知公告</a></li>
		<% }%>
	</ul>
</div>
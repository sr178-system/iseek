<%@page import="com.sr178.iseek.admin.service.AdminService"%>
<%@page import="com.sr178.game.framework.context.ServiceCacheFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>管理中心</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,IE=8">
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css"> 
		<link rel="stylesheet" href="../css/admin.css">  		
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/jquery.md5.js"></script>			
		<script type="text/javascript">
			$(function(){				
				$("#up-pasw").click(function(){
					$('#prompt-dialog-edit').modal('show');
				})			
				$(".navbar-inverse-cus").css("min-height",$(window).height()-59);
				$("#customer").css("min-height",$(window).height()-59);
				$(".nav-ul li").click(function(){
					$(".nav-ul li").removeClass("active");
					$(this).addClass("active");
				})
			})
		</script>
		<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
		<script type="text/javascript">
			var code = '${code}';
			if(code!=0){
				print_s("[${desc}]",function(){history.go(-1);});
			}
		</script>	
		<script type="text/javascript">
		function check(){
			 var nowpassword = $("#oldpassword").val();
			 var newpassword = $("#newpassword").val();
			 if(nowpassword==''||newpassword==''){
				 alert("密码不能为空！");
				 return false;
			 }
			 if($("#repassword").val()!=newpassword){
				 alert("2次输入的新密码不一致！",function(){});
				 return false;
			 }
			 
			var md5Password = $.md5('5X#6423D79C74b6b'+nowpassword+'AB8471%VAED8A76E');
			$("#oldpassword").val(md5Password);
			var md5newpassword = $.md5('5X#6423D79C74b6b'+newpassword+'AB8471%VAED8A76E');
			$("#newpassword").val(md5newpassword);
			var sendData =  {
					oldpassword: md5Password,
	                newpassword: md5newpassword
	            };
			$.post('editpassword',sendData,function(data){
				//print(JSON.stringify(data));
				if(data.flag!=0){
					alert(data.msg);
				}else{
					alert("修改成功！");
					$('#prompt-dialog-edit').modal('hide');
				}
				$("#oldpassword").val("");
				$("#newpassword").val("");
				$("#repassword").val("");
			});
			
			return false;
		}
		</script>	
		
		<style type="text/css">
		.modal-dialog {
		    margin: 95px auto !important;
		}
		.mobal-cus {
		    background: url('../image/password-bg.png');
		    background-position: 50% 50%;
		    width: 497px;
		    height: 340px;
		}
		.font-weight {
		    font-weight: 400;
		}
		.form-cont {
		    width: 100% !important;
		    height: auto !important;
		    display: initial !important;
		    margin: 0 7px !important;
		}
		.p6 {
		    padding: 6px 28px !important;
		}
		.sub-btn {
		    background-color: #65c3df !important;
		    color: #fff !important;
		    border-color: #65c3df !important;
		}
		.navbar-inverse .navbar-nav > li > a:focus{
		    color: #9d9d9d;
		}
		</style>
   </head>
   <body>	
	<nav class="navbar navbar-inverse custom-navbar-inverse" role="navigation">
		<div class="container-fluid container">
			<div class="navbar-header"><a class="navbar-brand custom-navbar-header" href="javascript:;"></a></div>
			<ul class="nav navbar-nav navbar-right">
		      <li><a href="javascript:;" class="a-font-color">当前用户：${adminUser.loginName}</a></li>
		      <li><a href="javascript:;" class="font-bul" id="up-pasw">修改密码 |</a></li>
		      <li><a href="logout" class="font-bul">退出</a></li>
		    </ul>
		</div>
	</nav>
	<div class="row">
		<div class="col-xs-2">
			<nav class="navbar navbar-inverse navbar-inverse-cus" role="navigation">
	
			        <ul class="nav navbar-nav nav-ul text-center ">
			           <%
			             AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
			             String userName = (String)request.getAttribute("userName");
			             if(adminService.checkPowerTitle(userName, 1)){
			            %>
			            <%="<li class=\"active\"> <a href=\"customer\" class=\"nav-icon service-icon\" target=\"customer\">客服管理</a></li>" %>
			            <%}%>
			             <%if(adminService.checkPowerTitle(userName, 3)){%>
			             <%="<li><a href=\"userlist\" class=\"nav-icon user-icon\" target=\"customer\">会员管理</a></li>" %> 
			             <%}%>
			             
			             <%
			             if(adminService.checkPowerTitle(userName, 5)){
				         %>
				          <%="<li><a href=\"chargelist\" class=\"nav-icon pay-icon\" target=\"customer\">财务管理</a></li>"%>
				         <%}%>
				         			             <%
			             if(adminService.checkPowerTitle(userName, 7)){
				         %>
				          <%= "<li><a href=\"updatenotice\" class=\"nav-icon sys-icon\" target=\"customer\">系统公告</a></li>"%>
				         <%}%>
				         			             <%
			             if(adminService.checkPowerTitle(userName, 8)){
				         %>
				          <%= "<li class=\"last-li\"><a href=\"message\" class=\"nav-icon msg-icon\" target=\"customer\">资讯管理</a></li>"%>
				         <%}%>
			        </ul>		
			</nav>
		</div>
		<div class="col-xs-10">
			<div class="content">
		<iframe id="customer" name="customer" frameborder=0 scrolling="yes" border=0 width=100% height=100% src="customer"></iframe>
			</div>								
		</div>
	</div>
	<!-- 模态框（Modal）对话框 -->
<div class="modal fade" id="prompt-dialog-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content mobal-cus">
            <div class="modal-header" style="height:106px">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                
            </div>
            <div class="modal-body">
				<form class="form-horizontal"  role="form" method="post" onSubmit="return false;">
					  <div class="form-group">
					    <label for="paasw" class="col-sm-3 control-label font-weight">旧密码：</label>
					    <div class="col-sm-7">
					     <input type="password" class="form-control form-cont" id="oldpassword" name="oldpassword" placeholder="输入旧密码">
					    </div>
					    <div class="col-sm-2"></div>
					  </div>
					  <div class="form-group">
					    <label for="npaasw" class="col-sm-3 control-label font-weight">新密码：</label>
					    <div class="col-sm-7">
					     <input type="password" class="form-control form-cont" id="newpassword" name="newpassword" placeholder="输入新密码">
					    </div>
					    <div class="col-sm-2"></div>
					  </div>					  
					  <div class="form-group">
					    <label for="password" class="col-sm-3 control-label font-weight">确认密码：</label>
					    <div class="col-sm-7">
					      <input type="password" class="form-control form-cont" id="repassword" name="repassword" placeholder="请重复输入新密码">
					    </div>
					    <div class="col-sm-2"></div>
					  </div>
		
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-10">
					      <button type="submit" class="btn btn-default btn-log sub-btn p6" onClick="check();" >提交</button>
					      <button type="button" class="btn btn-default btn-log p6" data-dismiss="modal" aria-hidden="true">取消</button>
					    </div>
					  </div>
					</form>	
            </div>          
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
   </body>
</html>
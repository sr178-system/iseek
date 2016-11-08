<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>客服管理</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  
		<link rel="stylesheet" href="../css/customer.css"> 		
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function () { 
			 $("#checkbox").click(function(){
			    var isChecked = $(this).prop("checked");
			    $("input[type='checkbox']").prop("checked", isChecked);
			    if(isChecked){
			    	$("input[type='checkbox']").parent("label").addClass("active-box");
			    }else{
			    	$("input[type='checkbox']").parent("label").removeClass("active-box");
			    }
			})
		    $(".chebox-label").click(function(){
		    	//alert($(this).children("input[type='checkbox']").prop("checked"))
			    if($(this).children("input[type='checkbox']").prop("checked")){
			    	$(this).addClass("active-box");
			    }else{
			    	$(this).removeClass("active-box");
			    }			    				    	
		    })			 
		})
		</script>
	</head>
	<body>
		<div class="page-header">
			<a href="javascript:;" class="custom-font-14">首页</a> > 
			<a href="javascript:;" class="custom-font-14 font-color">客服管理</a>
		</div>
		<table class="table table-bordered table-hover text-center">	
				<thead>
					<tr>					
						<td colspan=7 style="border-bottom: 0;" class="top-td">
							<p class="text-left" style="margin: 0;padding: 6px;">
								<a type="button" class="btn btn-default cus-btn add-btn">添加</a>
								<a type="button" class="btn btn-default cus-btn">删除</a>
								<a type="button" class="btn btn-default cus-btn">启用</a>
								<a type="button" class="btn btn-default cus-btn">停用</a>
							</p>
						</td>
					</tr>
				</thead>						
				<thead>
					<tr>					
						<td class="text-left"><label class="chebox-label"><input type="checkbox" id="checkbox"/></label>登陆名</td>
						<td>状态</td>
						<td>姓名</td>
						<td>性别</td>
						<td>权限</td>
						<td>最后登陆时间</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
				   <s:iterator var="data" value="dataList">
					<tr>
						<td class="text-left"><label class="chebox-label"><input type="checkbox"/></label>${data.loginName}</td>
						<c:if test="${data.status==0}"><td><span>已启用</span></td></c:if><c:if test="${data.status==1}"><td><span class="td-font-color">已停用</span></td></c:if>
						<td>${data.name}</td>
						<td><c:if test="${data.sex==1}">男</c:if><c:if test="${data.sex==2}">女</c:if></td>
						<td>${data.power}</td>
						<td><fmt:formatDate value="${data.lastLoginTime}" type="both" pattern="yyyy.MM.dd hh:mm"/></td>
						<td><a href="kf-editor.html" class="end-font-color">编辑</a></td>						
					</tr>
					</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=7>
						<div class="row" style="padding-top: 0 !important;line-height: 32px;margin: 0;">
							 		 <aldtags:pageTag/>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
	</body>
</html>
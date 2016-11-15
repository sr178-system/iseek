<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>会员管理</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  
		<link rel="stylesheet" href="../css/user-list.css">  		
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../scripts/jquery.datetimepicker.css"/>
        <script src="../scripts/jquery.datetimepicker.js"></script>
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
			 $(".type-rea").click(function(){
			 	$(this).next(".type-nav").toggle();
			 	$(".type-nav li").click(function(){
			 		$(this).parent("ul").prev(".type-rea").val($(this).text());
			 		$(this).parent("ul").hide();
			 	})
			 })
		})
		
		
		
				//弹窗
	function del(){
		var selok = $('.table td input:checked');
		if(!selok.size()){ return;};
		if(confirm("确定要删除这些用户吗？")){
			$.post('userdel',selok,function(data){
				if(data.flag==0){
					print_s("成功删除了"+selok.size()+"个",function(){location.href="userlist";});
				}else{
					print_s("删除失败，错误码"+data.code);
				}
			})
		}
		
	}
	
	//弹窗
	function editStatus(status){
		var selok = $('.table td input:checked');
		var desc = "";
		if(status==0){
			desc="启用";
		}else{
			desc="禁用";
		}
		if(!selok.size()){ return;};
		if(confirm("确定要"+desc+"这些用户吗？")){
			$.post('usereditstatus?status='+status,selok,function(data){
				if(data.flag==0){
					print_s("操作成功！",function(){location.href="userlist";});
					
				}else{
					print_s("操作失败，错误码"+data.flag);
				}
			})
		}
	}
	
	//弹窗
	function editShareCompressStatus(status){
		var selok = $('.table td input:checked');
		var desc = "";
		if(status==1){
			desc="启用";
		}else{
			desc="禁用";
		}
		if(!selok.size()){ return;};
		if(confirm("确定要"+desc+"这些用户吗？")){
			$.post('usereditsharecompstatus?status='+status,selok,function(data){
				if(data.flag==0){
					print_s("操作成功！",function(){location.href="userlist";});
					
				}else{
					print_s("操作失败，错误码"+data.flag);
				}
			})
		}
	}
	
	
	function submitForm(){
		$("#Form").submit();
	}
		</script>
		<style type="text/css">
		
				.select {
		    border: solid 1px #a5a4a4;
		    outline: none;
		    appearance: none;
		    -moz-appearance: none;
		    -webkit-appearance: none;
		    width: 130px;
		    padding-left: 5px;
		    height: 26px;
		    padding-right: 15px;
		    background: url("../image/type.png") no-repeat scroll center rgb(255, 255, 255);
		    background-position: 110px 5px;
		}
		.select::-ms-expand { display: none; }
		
		</style>
	</head>
	<body>
	<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
		<div class="page-header">
			<a href="javascript:;" class="custom-font-14">首页</a> > 
			<a href="javascript:;" class="custom-font-14 font-color">会员管理</a>
		</div>
		<table class="table table-bordered table-hover text-center">	
				<thead>
					<tr>					
						<td colspan=10 style="border-bottom: 0;" class="top-td">
							<p class="text-left" style="margin: 0;padding: 6px;">
								<a type="button" href="useradd" class="btn btn-default cus-btn add-btn">添加</a>
								<a type="button" href="javascript:;" class="btn btn-default cus-btn" onclick="del()">删除</a>
								<a type="button" href="javascript:;" class="btn btn-default cus-btn" onclick="editStatus(0)">启用</a>
								<a type="button" href="javascript:;" class="btn btn-default cus-btn" onclick="editStatus(1)">停用</a>
								<a type="button" href="javascript:;" class="btn btn-default cus-btn" onclick="editShareCompressStatus(1)">允许共享压缩包</a>
								<a type="button" href="javascript:;" class="btn btn-default cus-btn" onclick="editShareCompressStatus(2)">禁止共享压缩包</a>
							</p>
						</td>
					</tr>
				</thead>
				<form method="post" action="userlist" name="Form" id="Form">
				<thead>
					<tr>					
						<td colspan=10 style="border-bottom: 0;" class="tow-td text-left">
						
						登陆名 <input type="text" name="loginname" id="loginname" class="w110" placeholder="不填写查询全部" value="${loginname}"/>&nbsp;
						&nbsp;昵称 <input type="text" name="nickename" id="nickename" class="w110" value="${nickename}" placeholder="不填写查询全部"/>
						<div class="dropdown dropdown-type">
						类别  <select name="type" id="type" class="select">
						   <option value="1" <c:if test="${type==1}">selected</c:if>>全部</option>
						   <option value="2" <c:if test="${type==2}">selected</c:if>>未过期会员</option>
						   <option value="3" <c:if test="${type==3}">selected</c:if>>非会员</option>
						   <option value="4" <c:if test="${type==4}">selected</c:if>>已过期会员</option>
						</select>
						</div>
						<div class="dropdown dropdown-type m0">
						注册日期 <select name="datetype" id="datetype" class="select">
						   <option value="1" <c:if test="${datetype==1}">selected</c:if>>全部</option>
						   <option value="2" <c:if test="${datetype==2}">selected</c:if>>当日</option>
						   <option value="3" <c:if test="${datetype==3}">selected</c:if>>当月</option>
						</select>
						</div>	
						<div class="dropdown dropdown-type">
						<input type="text" class="w110 m0" name="startRegDate" id="startRegDate" value="${startRegDate}"/>		
						 至	
						 <input type="text" class="w110" name="endRegDate" id="endRegDate" value="${endRegDate}"/>		
						</div>	
						<a type="button" class="btn btn-default" onclick="submitForm()">查 询</a>											
						</td>
					</tr>
				</thead>	
				</form>					
				<thead>
					<tr>					
						<td class="text-left"><label class="chebox-label"><input type="checkbox" id="checkbox"/></label>登陆名</td>
						<td>状态</td>
						<td>共享压缩包</td>
						<td>昵称</td>
						<td>性别</td>
						<td>手机号</td>
						<td>邮箱</td>
						<td>会员有限期至</td>
						<td>最后登陆时间</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
				   <s:iterator var="data" value="dataList">
					<tr>
						<td class="text-left"><label class="chebox-label"><input type="checkbox" name="ids" value="${data.userId}"/></label>${data.loginName}</td>
						<c:if test="${data.status==0}"><td><span>已启用</span></td></c:if><c:if test="${data.status==1}"><td><span class="td-font-color">已停用</span></td></c:if>
						<c:if test="${data.shareCompress==1}"><td><span class="gr-font-color">允许</span></td></c:if><c:if test="${data.shareCompress==2}"><td><span>不允许</span></td></c:if>
						<td>${data.nickName}</td>
						<td><c:if test="${data.sex==1}">男</c:if><c:if test="${data.sex==2}">女</c:if></td>
						<td>${data.mobile}</td>
						<td>${data.email}</td>
						<td><fmt:formatDate value="${data.memberExpiryDay}" type="both" pattern="yyyy.MM.dd"/></td>
						<td><fmt:formatDate value="${data.lastLoginTime}" type="both" pattern="yyyy.MM.dd HH:mm"/></td>
						<td><a href="useredit?userid=${data.userId}" class="end-font-color">编辑</a></td>						
					</tr>
					</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=10>
						<div class="row" style="padding-top: 0 !important;line-height: 32px;margin: 0;">
							  <aldtags:pageTag paraStr="loginname,${loginname},nickename,${nickename},startRegDate,${startRegDate},endRegDate,${endRegDate},type,${type},datetype,${datetype}"/>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<script type="text/javascript">
				$('#startRegDate').datetimepicker({
					yearOffset : 0,
					lang : 'ch',
					timepicker : false,
					format : 'Y/m/d',
					formatDate : 'Y/m/d',
				//		minDate:'1970/01/01', // yesterday is minimum date
				//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
				});
				$('#endRegDate').datetimepicker({
					yearOffset : 0,
					lang : 'ch',
					timepicker : false,
					format : 'Y/m/d',
					formatDate : 'Y/m/d',
				//		minDate:'1970/01/01', // yesterday is minimum date
				//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
				});
			</script>
	</body>
</html>

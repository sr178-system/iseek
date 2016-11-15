<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>财务管理</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  
		<link rel="stylesheet" href="../css/finance.css"> 		
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../scripts/jquery.datetimepicker.css"/>
        <script src="../scripts/jquery.datetimepicker.js"></script>
		<script type="text/javascript">
		$(function () { 		 
			 $(".type-rea").click(function(){
			 	$(this).next(".type-nav").toggle();
			 	$(".type-nav li").click(function(){
			 		$(this).parent("ul").prev(".type-rea").val($(this).text());
			 		$(this).parent("ul").hide();
			 	})
			 })
		})
		
		
		function formSubmit(){
			$("#FormCharge").submit();
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
		<div class="page-header">
			<a href="javascript:;" class="custom-font-14">首页</a> > 
			<a href="javascript:;" class="custom-font-14 font-color">财务管理</a>
		</div>
		<table class="table table-bordered table-hover text-center">	
		<FORM action="chargelist" method="post" name="FormCharge" id="FormCharge">
				<thead>
					<tr>					
						<td colspan=7 style="border-bottom: 0;" class="tow-td text-left">
						
						登陆名 <input type="text" name="loginName" id="loginName" class="w110" placeholder="不填写查询全部" value="${loginName}"/>&nbsp;
						&nbsp;昵称 <input type="text" name="nickeName" id="nickeName" class="w110" placeholder="不填写查询全部" value="${nickeName}"/>
						<div class="dropdown dropdown-type m0">
						注册日期 <select name="datetype" id="datetype" class="select">
						   <option value="1" <c:if test="${datetype==1}">selected</c:if>>全部</option>
						   <option value="2" <c:if test="${datetype==2}">selected</c:if>>当日</option>
						   <option value="3" <c:if test="${datetype==3}">selected</c:if>>当月</option>
						</select>
						</div>	
						<div class="dropdown dropdown-type">
						<input type="text" class="w110 m0" name="startChargeDate" id="startChargeDate" value="${startChargeDate}"/>		
						 至	
						 <input type="text" class="w110" name="endChargeDate" id="endChargeDate" value="${endChargeDate}" />
						</div>	
						<a href="javascript:;" class="btn btn-default" onclick="formSubmit()">充值记录查询</a>
						<a href="updatechargeconfig" class="btn btn-default">财务设置</a>										
						</td>
					</tr>
				</thead>		
				</FORM>				
				<thead>
					<tr>											
						<td>充值时间</td>
						<td>登录名</td>
						<td>昵称</td>					
						<td>手机号</td>
						<td>充值金额（元）</td>
						<td>充值前会员有效期至</td>
						<td>充值后会员有效期至</td>						
					</tr>
				</thead>
				<tbody>
				<s:iterator var="data" value="dataList">
					<tr>								
						<td><fmt:formatDate value="${data.createdTime}" type="both" pattern="yyyy.MM.dd HH:mm"/></td>
						<td>${data.loginName} </td>
						<td>${data.nickName}</td>
						<td>${data.mobile}</td>
						<td>${data.amount}</td>
						<td><fmt:formatDate value="${data.beforVipTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td><fmt:formatDate value="${data.afterVipTime}" type="both" pattern="yyyy.MM.dd"/></td>						
					</tr>
				</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=10>
						<div class="row" style="padding-top: 0 !important;line-height: 32px;margin: 0;">
							  <aldtags:pageTag paraStr="loginName,${loginName},nickeName,${nickeName},startChargeDate,${startChargeDate},endChargeDate,${endChargeDate},datetype,${datetype}"/>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<script type="text/javascript">
				$('#startChargeDate').datetimepicker({
					yearOffset : 0,
					lang : 'ch',
					timepicker : false,
					format : 'Y/m/d',
					formatDate : 'Y/m/d',
				//		minDate:'1970/01/01', // yesterday is minimum date
				//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
				});
				$('#endChargeDate').datetimepicker({
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


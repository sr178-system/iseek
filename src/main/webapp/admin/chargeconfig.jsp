<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>财务管理-设置</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  			
		<link rel="stylesheet" href="../css/reg-2.css">  			
		<script src="../js/jquery.min.js"></script>	
		<script src="../js/bootstrap.min.js"></script>
		<style type="text/css">
		.col-sm-2{
			width: 13% !important;
		}
		</style>
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<c:if test="${code==2000}"><script type="text/javascript">print_s("修改成功。",function(){location.href="chargelist";});</script></c:if>
<div class="">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">首页</a> > 
	    <a href="chargelist" class="custom-font-14">财务管理</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">设置</a>
	</div>	
</div>
<div class="">
<form class="form-horizontal" role="form" method="post" action="updatechargeconfig?st=1">
	<div class="form-group">
		<label for="username" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>会员月费（元）：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="feePerMonth" name="feePerMonth" value="${config.feePerMonth}">
		</div>		
	</div>	
	<div class="form-group">
		<label for="nickname" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>会员有效期不足：</label>
		<div class="col-sm-1">
			<input type="text" class="form-control" id="remindDay" name="remindDay" value="${config.remindDay}">
		</div>	
		<div class="col-sm-3" style="line-height:34px;">天时发送提醒</div>
			
	</div>			
	<div class="container" style="padding-left: 48px;padding-top: 50px;">		
	<button type="submit" class="btn btn-default">保存</button>
	<a type="button" class="btn btn-default" href="chargelist">取消</a>
	</div>
</form>
</div>
</body>
</html>
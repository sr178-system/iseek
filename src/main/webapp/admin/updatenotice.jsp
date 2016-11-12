<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>系统公告</title>
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
		.form-group{
			margin-left: 0 !important;
			margin-right: 0 !important;
		}
		.text-left{
			text-align: left !important;
		}
		.p5{
			padding-bottom: 5px !important;		
		}
		.font-weight{
			font-weight: 400 !important;
		}
		</style>
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<c:if test="${code==2000}"><script type="text/javascript">print_s("修改成功。",function(){location.href="updatenotice";});</script></c:if>
		<script type="text/javascript">
			var code = '${code}';
			if(code!=0&&code!=2000){
				print_s("${desc}",function(){history.go(-1);});
			}
		</script>
<div class="">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">首页</a> > 	    
	    <a href="javascript:;" class="custom-font-14 font-color">系统公告</a>
	</div>	
</div>
<div class="">
<form class="form-horizontal" role="form" method="post" action="updatenotice?st=1">
	<div class="form-group">
		<label class="col-sm-12 control-label text-left p5 font-weight"><span style="color:#f00404"> * </span>公告内容：</label>
		<div class="col-sm-4">
			<textarea class="form-control" rows="5" name="content">${notice.noticeContent}</textarea>
		</div>		
	</div>	
	<div class="form-group">
		<label class="col-sm-12 control-label text-left p5 font-weight"><span style="color:#f00404"> * </span>链接URL（无链接请留空）：</label>
		<div class="col-sm-4">
			<input type="text" name="url" id="url" class="form-control"  value="${notice.noticeUrl}"/>
		</div>		
	</div>			
	<div class="" style="padding-left: 15px;padding-top: 50px;">		
		<button type="submit" class="btn btn-default">保存</button>	
	</div>
</form>
</div>
</body>
</html>
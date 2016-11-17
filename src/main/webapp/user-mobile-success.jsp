<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>个人设置</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="css/bootstrap.min.css">  	
		<link rel="stylesheet" href="css/bootstrapValidator.css">			
		<script src="js/jquery.min.js"></script>	
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrapValidator.js"></script>	
		<style type="text/css">
			body{font-family: '微软雅黑'}
			.page-header{
				margin-top:20px !important; 			
			}
			.custom-font-14{
				font-size: 14px !important;
				color: #1b1e26 !important;
				text-decoration: none !important;
			}
			.font-color{
				color: #65c3df !important;
			}
			.font-16{
				font-size: 16px;
			}
			.font-14{
				font-size: 14px;
			}	
			.footer {
			    height: 40px;
			    margin-top: 10px;
			    position: fixed;
			    width: 100%;
			    bottom: 0;
			}		
			.font-weight{
				font-weight: bold;
			}
			.font-weight-p{
				color: #ff6c6c !important;
				margin:35px auto 50px; 				
			}
			.reg-suc {
			    background: url(image/reg-icon.png) no-repeat left;
			    background-position: 3% 50%;
			    padding-left: 85px;
			    height: 60px;
			    line-height: 60px;
			}
			.padding-60{
				padding-top:60px !important;
			}
		</style>	
   </head>
<body>
<div class="header">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="user-header.html"></iframe>
</div>
<div class="container">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">个人设置</a> > 
	    <a href="javascript:;" class="custom-font-14">更好手机号</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">成功</a>
	</div>	
</div>
<div class="container padding-60">
	<div class="row">
		<div class="col-xs-4"></div>
		<div class="col-xs-4 text-center">
			<h2 class="reg-suc">手机号码更换成功！</h2>
		</div>
		<div class="col-xs-4"></div>
	</div>
</div>
<div class="footer">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</body>
</html>
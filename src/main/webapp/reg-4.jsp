<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>用户注册</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,IE=8">
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
			    background-position: 25% 50%;
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
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<div class="header">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="header.html"></iframe>
</div>
<div class="container">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">用户注册</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">注册成功</a>
	</div>	
</div>
<div class="container padding-60">
	<div class="row">
		<div class="col-xs-4"></div>
		<div class="col-xs-4 text-center">
			<h2 class="reg-suc">注册成功</h2>
		</div>
		<div class="col-xs-4"></div>
	</div>
	<div class="row padding-60" style="margin-left: 12%;">
		<div class="col-xs-3"></div>
		<div class="col-xs-6 text-center">
			<p class="font-14 custom-font-14">请登录软件界面后购买会员激活您的账号。</p>
			<p class="font-14 custom-font-14">如有疑问，请联系客服咨询。</p>
		</div>
		<div class="col-xs-3"></div>
	</div>	
	
</div>
<div class="footer">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</body>
</html>
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
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/scripts/jquery.easyui.min.js"></script>
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
			.font-weight{
				font-weight: bold;
			}
			.font-weight-p{
				color: #ff6c6c !important;
				margin:35px auto 50px; 				
			}
			.checkbox-inline{
				width: 150px;
				background: url('image/radio-icon.png') no-repeat left;
      			background-position: 0 1px;
			}
			.radio-checked{
				background-position: 0 -20px;
			}
			.checkbox-inline input[type='radio']{
				display: none;
			}
			.radio-margin{
				margin-bottom: 55px;
			}
			.btn-primary{
				background-color: #65c3df;
				border-color: #65c3df;
			}
			.footer {
			    height: 40px;
			    margin-top: 10px;
			    position: fixed;
			    width: 100%;
			    bottom: 0;
			}
			.custom-jumbotron{
				background-color: #65c3df !important;
				padding-top: 0;
				height: 60px;
				padding: 0;
			}
			.custom-panel-footer {
			    background-color: #f2f2f2 !important;
			    border: 0 !important;
			    padding: 0 !important;
			    height: 40px;
			    line-height: 40px;
			    position: absolute;
			    width: 100%;
			    bottom: 0;
			}
			.custom-panel-footer p{
			    margin: 0 !important;
			    color: #a4a4a4;
			    font-size: 13px;
			}			
			.ptext{ 
		border-bottom:1px solid #ccc; padding: 25px 20px; color: #333;
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
	    <a href="javascript:;" class="custom-font-14 font-color">注册提示</a>
	</div>
	<p class="text-center font-16 font-weight font-weight-p"><font size='30'>敬告</font></p>
</div>
<div class="container">
      <p style="margin-left: 35%;">尊敬的用户，欢迎使用i-Seek DJ产品.</p><p style="margin-left: 35%;">本产品是提供给专业DJ,制作人作交流使用的软件，并不对行业外的人士开放.</p><p style="margin-left: 35%;">如果不是相关行业专业人士请勿注册使用我们的产品。</p>
	<div class="page-header"></div>
	<a href="reg"><button type="button" class="text-center btn btn-primary" style="margin-left: 45%;">知道了</button></a>
</div>
<div class="footer">
<!-- 	<div class="panel-footer custom-panel-footer text-center">
		<p>Copyright ©i-Seek. All Rights Reserved.    京ICP证080047号    京公网安备11000002000006号</p>
	</div> -->
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</body>
</html>
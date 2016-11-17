<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>支付中心</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="css/bootstrap.min.css">  			
		<script src="js/jquery.min.js"></script>	
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){	
				$("#container #jumbotron").height($("#jumbotron").width()*4);
				$('.radio-group .checkbox-inline').click(function(){
					$('.radio-group .checkbox-inline').removeClass('radio-checked') && $(this).addClass('radio-checked');
				})				
			})	
		</script>	
		<style type="text/css">
			body{font-family: '微软雅黑'}
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
			.padding-60{
				padding-top:60px !important;
			}
			.padding-left{
				padding-left: 5px !important;
			}
			#container{
				padding-top: 20px !important;
			}
			#jumbotron{
			    padding-right: 40px;
			    padding-left: 40px;	
			    padding-top: 5px;
			}
			.font-color-h3 {
			    color: #ff6c6c !important;
			    line-height: 25px;
			    font-weight: bold;
			    font-size: 18px !important;
			}
			.jum-padding{
				padding-top:30px !important;
				padding-bottom: 30px !important;
				margin-bottom: 40px !important;
			}	
			.reg-suc {
			    background: url(image/reg-icon.png) no-repeat left;
			    background-position: 10% 50%;
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
	<iframe id="header" frameborder=0 scrolling="no" border=0 width=100% height=60 src="pay-header.html"></iframe>
</div>
<div class="container" id="container">
	<div class="row">
		<div class="col-xs-3">
			<div class="jumbotron text-center" id="jumbotron">
				<h3 class="font-color-h3">开学季，会员充值一律5折起！</h3>
			</div>
		</div>
		<div class="col-xs-9 padding-left">
			<div class="jumbotron jum-padding">
				<div class="row">
					<div class="col-xs-4"><label class="font-16">登陆名：<span>${user.loginName}</span></label></div>
					<div class="col-xs-4"><label class="font-16">昵  称：<span>${user.nickName}</span></label></div>
					<div class="col-xs-4"><label class="font-16">会员到期：<span><fmt:formatDate value="${user.memberExpiryDay}" pattern="yyyy.MM.dd"/></span></label></div>
				</div>
			</div>
			<div class=" padding-60">
				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4 text-center">
						<h2 class="reg-suc">充值成功！</h2>
					</div>
					<div class="col-xs-4"></div>
				</div>
				<div class="row padding-60">
					<div class="col-xs-3"></div>
					<div class="col-xs-6 text-center">
						<p class="font-14 custom-font-14">您充值后的会员有效期至 <fmt:formatDate value="${user.memberExpiryDay}" pattern="yyyy.MM.dd"/>。</p>					
					</div>
					<div class="col-xs-3"></div>
				</div>					
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</body>
</html>
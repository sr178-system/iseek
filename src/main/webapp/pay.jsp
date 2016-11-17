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
			.col-xs-cus{
			    width: 10% !important;
			    padding-right: 0 !important;
			    margin-right: 0 !important;
			}	
			.radio-margin{
				margin-bottom: 30px;
			}	
			.btn-primary{
				background-color: #65c3df;
				border-color: #65c3df;
			}
			.lw-100{
			    width:75px;
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
			<form name="pay" action="pay?st=1&sso_str=${tokenId}" method="post">
				<div class="radio-group row">
					<div class="col-xs-2 col-xs-cus">
						<label for="problem-2" class="font-weight">续费时长：</label>
					</div>
					<div class="col-xs-10">
						<div class="radio radio-margin" style="margin-top:0;">
							<label class="checkbox-inline radio-checked">
								<input type="radio" name="month" id="problem-2-1" value="12" checked> 12个月
							</label>
							<label class="font-14 lw-100"><del>600元</del></label>
							<label class="font-14" style="padding-left:130px"><p style="color:#ff6c6c"><fmt:formatNumber value="${12*feePerMonth}" pattern="0"/>元</p></label>
						</div>
						<div class="radio radio-margin">
							<label class="checkbox-inline">
								<input type="radio" name="month" id="problem-2-2" value="6"> 6个月
							</label>
							<label class="font-14 lw-100"><del>300元</del></label>
							<label class="font-14" style="padding-left:130px"><p style="color:#ff6c6c"><fmt:formatNumber value="${4*feePerMonth}" pattern="0"/>元</p></label>						
						</div>
						<div class="radio radio-margin">
							<label class="checkbox-inline">
								<input type="radio" name="month" id="problem-2-3" value="3"> 3个月
							</label>
							<label class="font-14 lw-100"><del>180元</del></label>
							<label class="font-14" style="padding-left:130px"><p style="color:#ff6c6c"><fmt:formatNumber value="${3*feePerMonth}" pattern="0"/>元</p></label>						
						</div>
						<div class="radio radio-margin">
							<label class="checkbox-inline">
								<input type="radio" name="month" id="problem-2-4" value="1"> 1个月
							</label>	
							<label class="font-14 lw-100"><del>60元</del></label>
							<label class="font-14" style="padding-left:130px"><p style="color:#ff6c6c"><fmt:formatNumber value="${1*feePerMonth}" pattern="0"/>元</p></label>							
						</div>	
					</div>
				</div>	
				<div class="row">
					<div class="col-xs-2 col-xs-cus">
						<label for="pay" class="font-weight">支付方式：</label>
					</div>
					<div class="col-xs-10">
						<div class="radio radio-margin" style="margin-top:0;">
							<label class="checkbox-inline radio-checked">
								<input type="radio" name="pay" id="pay" checked>
								<img src="image/pay-btn.png" style="margin-top:-7px;margin-left:10px">
							</label>
						</div>
					</div>
				</div>	
				<div class="page-header"></div>	
				<button type="submit" class="btn btn-primary">去 支 付</button>		
			</form>	
		</div>
	</div>
</div>
<div class="footer">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</body>
</html>
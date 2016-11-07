<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>用户登陆</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  
		<link rel="stylesheet" href="../css/bootstrapValidator.css">  
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/bootstrapValidator.js"></script>		
		<script src="../js/jquery.md5.js"></script>
		<script type="text/javascript" src="../scripts/jquery.cookie.js"></script>		
		<jsp:include page="/common/show-message.jsp" flush="true"></jsp:include>
		<script type="text/javascript">
		$(function(){
		    // validate form
		    $("form.required-validate").each(function() {
		        var $form = $(this);
		        $form.bootstrapValidator();
		        // 修复bootstrap validator重复向服务端提交bug
		        $form.on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();
		        });
		    })
		 	$('.form-horizontal').bootstrapValidator({
		         message: 'This value is not valid',
		         feedbackIcons: {/*input状态样式图片*/
		             valid: 'glyphicon glyphicon-ok',
		             invalid: 'glyphicon glyphicon-remove',
		             validating: 'glyphicon glyphicon-refresh'
		         },
		         fields: {/*验证：规则*/
		             username: {
		                 message: '用户名',
		                 validators: {
		                     notEmpty: {
		                         message: '用户名不能为空'
		                     }
		                 }
		             },
		             password: {
		                 message: '密码',
		                 validators: {
		                     notEmpty: {
		                         message: '密码不能为空'
		                     }		                     
		                 }
		             }
		         }
		     }).on('success.form.bv', function (e) {
				// Prevent form submission
				//e.preventDefault();
				//console.log('send');	
		    	 var nowpassword = $("#passWord").val();
				 var md5Password = $.md5('5X#6423D79C74b6b'+nowpassword+'AB8471%VAED8A76E');
				 $("#passWord").val(md5Password);

			});
		 });
		</script>		
		<style type="text/css">
		.login-layout {
		    background-color: #003d66;
		    background-image: url(../image/login-bg.png);
		    background-repeat: no-repeat;
		    background-position: center top;
		    overflow: hidden;
		    padding-top: 150px;
		}
		.login-lod{
		    /*background-color: #003d66;*/
		    background-image: url(../image/login.png);
		    background-repeat: no-repeat;
		    background-position: 0 50%;
		    overflow: hidden;	
		    background-size: 100%;	
		    width: 534px;
    		height: 347px;	
		}
		.font-weight{
			font-weight: 400;
		}
		.form-horizontal {
		    padding-top: 145px;
		    padding-bottom: 30px;
		}
		.btn-log{
			background-color: #65c3df !important;
			border-color: #65c3df !important;
			color: #fff !important;
			padding: 5px 28px;
		}
		</style>
   </head>
   <body class="login-layout">
	<div class="container">
		<div class="row">
			<div class="col-xs-3"></div>
			<div class="col-xs-6 login-lod">
				<div class="col-xs-4"></div>
				<div class="col-xs-8">
					<form class="form-horizontal"  role="form" method="post" name="Form" id="Form" action="login">
					  <div class="form-group">
					    <label for="username" class="col-sm-4 control-label font-weight">用户名：</label>
					    <div class="col-sm-8">
					     <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入名字">
					    </div>
					  </div>
					  <div class="form-group" style="margin-bottom:5px;">
					    <label for="password" class="col-sm-4 control-label font-weight">密&nbsp;&nbsp;&nbsp;码：</label>
					    <div class="col-sm-8">
					      <input type="password" class="form-control" id="passWord" name="passWord" placeholder="请输入密码">
					    </div>
					  </div>
					  <div class="form-group" style="margin-bottom:5px;">
					    <div class="col-sm-offset-4 col-sm-10">
					      <div class="checkbox">
					        <label>
					          <input type="checkbox" id="rember_me" name="rember_me">记住密码
					        </label>
					      </div>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-10">
					      <button type="submit" class="btn btn-default btn-log" id="loginbut">登录</button>
					    </div>
					  </div>
					</form>					
				</div>
			</div>
			<div class="col-xs-3"></div>
		</div>
	</div>
   </body>
</html>
<script type="text/javascript">
		$("#Form").keydown(function(e) {
			var e = e || event;
			var code = e.which || e.keyCode;
			if(code==13) {
				logins();
			}
		});
 	$(document).ready(function () {
		$("#loginbut").click(function() {
			var check = document.getElementById("rember_me").checked; 
			if (check) {
				var username = $("#userName").val();
				var password = $("#passWord").val();
				$.cookie("username", username, { expires: 7 });
				$.cookie("password", password, { expires: 7 });
			}else{
				$.cookie("username", "", { expires: 7 });
				$.cookie("password", "", { expires: 7 });
			}
		});
		var username = $.cookie("username");
		var password = $.cookie("password");
		if (username && password) {
			$("#userName").val(username);
			$("#passWord").val(password);
		}else {
			
		}
	});
</script>
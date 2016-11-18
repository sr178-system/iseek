<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>重置密码</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,IE=8">
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="css/bootstrap.min.css">  	
		<link rel="stylesheet" href="css/bootstrapValidator.css">  		
		<link rel="stylesheet" href="css/reg-2.css">  			
		<script src="js/jquery.min.js"></script>	
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrapValidator.js"></script>	
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
		             mobile: {
		                 message: 'The phone is not valid',
		                 validators: {
		                     notEmpty: {
		                         message: '手机号码不能为空'
		                     },
		                     stringLength: {
		                         min: 11,
		                         max: 11,
		                         message: '请输入11位手机号码'
		                     },
		                     regexp: {
		                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
		                         message: '请输入正确的手机号码'
		                     }
		                 }
		             },
		             username: {
		                 message: '登录名',
		                 validators: {
		                     notEmpty: {
		                         message: '登陆名不能为空'
		                     },
		                     stringLength: {
		                         min: 2,		            
		                         message: '至少2个字符以上'
		                     }
		                     // regexp: {
		                     //     regexp: /^[\w]{8}$/,
		                     //     message: '请输入正确的验证码(包含数字字母)'
		                     // }
		                 }
		             },
		         }
		     }).on('success.form.bv', function (e) {
				// Prevent form submission
				//e.preventDefault();
				//console.log('send');	
			});
		 });
		</script>
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<div class="header">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="reset-header.html"></iframe>
</div>
<div class="container">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">重置密码</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">验证手机</a>
	</div>	
</div>
<div class="container">
<form class="form-horizontal"  role="form" method="post" action="resetpass?st=1">
	<div class="form-group">
		<label for="username" class="col-sm-2 control-label">登陆名：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="username" name="username" placeholder="请输入登陆名">
		</div>
	</div>
	<div class="form-group">
		<label for="mobile" class="col-sm-2 control-label">手机号码：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入您的手机号码">
		</div>		
	</div>
	<div class="page-header"></div>
	<button type="submit" class="btn btn-primary">继续</button>
</form>
</div>
<div class="footer">
<!-- 	<div class="panel-footer custom-panel-footer text-center">
		<p>Copyright ©i-Seek. All Rights Reserved.    京ICP证080047号    京公网安备11000002000006号</p>
	</div> -->
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</body>
</html>
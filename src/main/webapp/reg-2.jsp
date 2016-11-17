<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>reg-2</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="/css/bootstrap.min.css">  	
		<link rel="stylesheet" href="/css/bootstrapValidator.css">  		
		<link rel="stylesheet" href="/css/reg-2.css">  			
		<script src="/js/jquery.min.js"></script>	
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/bootstrapValidator.js"></script>		
		<script type="text/javascript">
		$(function(){
			$("#send-code").click(function(){
			    var phone = document.getElementById('mobile').value;
			    if(!phone){
			    	print_s("手机号码不能为空！");
			        return false; 		    	
			    }else if(!(/^1[34578]\d{9}$/.test(phone))){ 
			        //alert("手机号码有误，请重填");  
			        print_s("请输入正确的手机号码！");
			        return false; 
			    }
				var sendData =  {
						mobile: phone,
		                xx: 1
		            };
				$.post('sendSms',sendData,function(data){
					//print(JSON.stringify(data));
					if(data.flag==0){
						print_s("发送成功！验证码为="+data.rc.verifyCode);
					}else{
						print_s("发送错误："+data.msg);
					}
				});
			})
			
			
			$("#goon").click(function(){
			    var phone = document.getElementById('mobile').value;
			    var code = document.getElementById('code').value;
			    if(!phone){
			    	print_s("手机号码不能为空！");
			        return false; 		    	
			    }else if(!(/^1[34578]\d{9}$/.test(phone))){ 
			        //alert("手机号码有误，请重填");  
			        print_s("请输入正确的手机号码！");
			        return false; 
			    }
			   
				var sendData =  {
						mobile: phone,
		                verifyCode: code,
		                st:1
		            };
				$.post('reg2',sendData,function(data){
					if(data.flag==0){
						print_s("验证成功！",function(){window.location.href="/reg3?mobile="+phone; });
						
					}else{
						alert("验证码错误!");
					}
				});
			})
			
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
		             code: {
		                 message: '验证码',
		                 validators: {
		                     notEmpty: {
		                         message: '验证码不能为空'
		                     },
		                     stringLength: {
		                         min: 6,
		                         max: 6,
		                         message: '请输入正确长度的验证码'
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
				e.preventDefault();
				console.log('send');	
			});
		 });
		</script>
   </head>
<body>
<div class="header">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="header.html"></iframe>
</div>
<div class="container">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">用户注册</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">验证手机</a>
	</div>	
</div>
<div class="container">
<form class="form-horizontal"  role="form">
	<div class="form-group">
		<label for="mobile" class="col-sm-2 control-label">手机号码：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入您的手机号码">
		</div>
		<a href="javascript:;" class="btn btn-default" id="send-code">发送验证码</a>
	</div>

	<div class="form-group">
		<label for="code" class="col-sm-2 control-label">短信验证码：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="code" name="code" placeholder="请输入手机短信验证码">
		</div>
	</div>
	<div class="page-header"></div>
	<button type="button" class="btn btn-primary" id="goon" name="goon">继续</button>
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
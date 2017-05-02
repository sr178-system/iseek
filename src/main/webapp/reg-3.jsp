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
		<link rel="stylesheet" href="css/reg-2.css">  			
		<script src="js/jquery.min.js"></script>	
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrapValidator.js"></script>	
		<script src="js/jquery.md5.js"></script>	
		<script type="text/javascript">
		$(function(){
			$('.radio label').click(function(){
				$(this).parent(".radio").children("label").removeClass('radio-checked') && $(this).addClass('radio-checked');
			})			
		    // validate form
		    $("form.required-validate").each(function() {
		        var $form = $(this);
		        $form.bootstrapValidator();
		        // 修复bootstrap validator重复向服务端提交bug
		        $form.on('success.form.bv', function(e) {
		            // Prevent form submission
		            //e.preventDefault();
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
			        username: {//验证input项：验证规则
			         message: 'The username is not valid',                
			         validators: {
			             notEmpty: {//非空验证：提示消息
			                 message: '登陆名不能为空'
			             },
			             // stringLength: {
			             //     min: 6,
			             //     max: 30,
			             //     message: '用户名长度必须在6到30之间'
			             // },
			             // threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
			             // remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
			             //     url: 'exist2.do',//验证地址
			             //     message: '用户已存在',//提示消息
			             //     delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
			             //     type: 'POST'//请求方式
			             //     /**自定义提交数据，默认值提交当前input value
			             //      *  data: function(validator) {
			             //           return {
			             //               password: $('[name="passwordNameAttributeInYourForm"]').val(),
			             //               whatever: $('[name="whateverNameAttributeInYourForm"]').val()
			             //           };
			             //        }
			             //      */
			             // },
			             regexp: {
			                 regexp: /^[a-zA-Z0-9_\.]+$/,
			                 message: '用户名由数字字母下划线和.组成'
			             }
			         }
			        },
			        password: {
			         message:'密码无效',
			         validators: {
			             notEmpty: {
			                 message: '密码不能为空'
			             },
			             // stringLength: {
			             //     min: 6,
			             //     max: 30,
			             //     message: '用户名长度必须在6到30之间'
			             // },
			             identical: {//相同
			                 field: 'password', //需要进行比较的input name值
			                 message: '两次密码不一致'
			             },
			             different: {//不能和用户名相同
			                 field: 'username',//需要进行比较的input name值
			                 message: '不能和登陆名相同'
			             },
			             regexp: {
			                 regexp: /^[a-zA-Z0-9_\.]+$/,
			                 message: '密码只能由字母、数字、点和下划线'
			             }
			         }
			        },
			        repassword: {
			         message: '密码无效',
			         validators: {
			             notEmpty: {
			                 message: '密码不能为空'
			             },
			             // stringLength: {
			             //     min: 6,
			             //     max: 30,
			             //     message: '用户名长度必须在6到30之间'
			             // },
			             identical: {//相同
			                 field: 'password',
			                 message: '两次密码不一致'
			             },
			             different: {//不能和用户名相同
			                 field: 'username',
			                 message: '不能和登陆名相同'
			             },
			             regexp: {//匹配规则
			                 regexp: /^[a-zA-Z0-9_\.]+$/,
			                 message: '密码只能由字母、数字、点和下划线'
			             }
			         }
			        },
			        email: {
			         validators: {
			             notEmpty: {
			                 message: '邮箱不能为空'
			             },
			             emailAddress: {
			                 message: '请输入正确的邮箱地址如：123@qq.com'
			          }
			            //,callback: {
			                //  message: '邮箱已经被占用',
			                //  callback: function (value, validator) {
			                //      var res = true;
			                //      if (value.match(/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/i)) {
			                //          $.ajax({
			                //              url: '{:U("user/register/checkemail")}',
			                //              type: 'post',
			                //              dataType: 'json',
			                //              async: false,
			                //              data: {email: value},
			                //              success: function (data) {
			                //                  if (data.status != 'success') {
			                //                      res = false;
			                //                  }
			                //              }
			                //          });
			                //      }
			                //      return res;
			                //  }
			                // }
			            }
			        },             
			        nickname: {//验证input项：验证规则
			         message: 'The username is not valid',                
			         validators: {
			             notEmpty: {//非空验证：提示消息
			                 message: '昵称不能为空'
			             }
			         }
			        }
			    }
			}).on('success.form.bv', function (e) {
	            var nowpassword = $("#password").val();
	            var md5Password = $.md5('5X#6423D79C74b6b'+nowpassword+'AB8471%VAED8A76E');
				$("#password").val(md5Password);
			});		    
		 });
		
		
		</script>
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<div class="header">
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="header.html"></iframe>
</div>
<div class="container">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">用户注册</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">填写资料</a>
	</div>	
</div>
<form class="form-horizontal" role="form" method="post" action="reg3?st=1&mobile=${mobile}">
<div class="container" style="margin-left: 35%;">
	<div class="form-group">
		<label for="username" class="col-sm-2 control-label">登陆名：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="username" name="username" placeholder="请输入登陆名">
		</div>		
	</div>
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">密  码：</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
		</div>
	</div>
	<div class="form-group">
		<label for="repassword" class="col-sm-2 control-label">确认密码：</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" id="repassword" name="repassword" placeholder="请输入密码">
		</div>
	</div>
	<div class="form-group">
		<label for="nickname" class="col-sm-2 control-label">昵  称：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="nickname" name="nickname" placeholder="请输入昵称">
		</div>		
	</div>	
	<div class="form-group">
		<label for="sex" class="col-sm-2 control-label">性  别：</label>
		<div class="col-sm-6 radio radio-margin">
		  <label class="checkbox-inline radio-checked">
		    <input type="radio" name="sex" id="sex-1" value="1" checked>男
		  </label>
		  <label class="checkbox-inline">
		    <input type="radio" name="sex" id="sex-2" value="2">女
		  </label>			
		</div>		
	</div>	
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">邮  箱：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱地址">
		</div>		
	</div>
	</div>
	<div class="container">		
	<div class="page-header"></div>
	<button type="submit" class="btn btn-primary"  style="margin-left: 35%;">继续</button>
    </div>
</form>
<div class="footer">
<!-- 	<div class="panel-footer custom-panel-footer text-center">
		<p>Copyright ©i-Seek. All Rights Reserved.    京ICP证080047号    京公网安备11000002000006号</p>
	</div> -->
	<iframe frameborder=0 scrolling="no" border=0 width=100% height=60 src="footer.html"></iframe>
</div>
</div>
</body>
</html>
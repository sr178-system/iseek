<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>会员管理-编辑</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  	
		<link rel="stylesheet" href="../css/bootstrapValidator.css">  		
		<link rel="stylesheet" href="../css/reg-2.css">  			
		<script src="../js/jquery.min.js"></script>	
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/bootstrapValidator.js"></script>	
		<script src="../js/jquery.md5.js"></script>		
		<link rel="stylesheet" type="text/css" href="../scripts/jquery.datetimepicker.css"/>
        <script src="../scripts/jquery.datetimepicker.js"></script>		
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
			        password: {
			         message:'密码无效',
			         validators: {
			        	 notEmpty: {
			                 message: '密码不能为空'
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
			                 message: '确认密码不能为空'
			             },
			             identical: {//相同
			                 field: 'password',
			                 message: '两次密码不一致'
			             },			        
			             regexp: {//匹配规则
			                 regexp: /^[a-zA-Z0-9_\.]+$/,
			                 message: '密码只能由字母、数字、点和下划线'
			             }
			         }
			        }, 
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
			        email: {
			         validators: {
			             notEmpty: {
			                 message: '邮箱不能为空'
			             },
			             emailAddress: {
			                 message: '请输入正确的邮箱地址如：123@qq.com'
			          }			
			            }
			        }, 			            
			        nickename: {//验证input项：验证规则
			         message: 'The username is not valid',                
			         validators: {
			             notEmpty: {//非空验证：提示消息
			                 message: '昵称不能为空'
			             }
			         }
			        }
			    }
			}).on('success.form.bv', function (e) {
			    // Prevent form submission
			   // e.preventDefault();
			   // console.log('send');    
				 var nowpassword = $("#password").val();
				 var repassword = $("#repassword").val();
				 if(nowpassword==''||repassword==''){
					 print_s("密码不能为空！",function(){});
					 e.preventDefault();
				 }
				 if(nowpassword!=''&&repassword!=''){
					 var md5Password = $.md5('5X#6423D79C74b6b'+nowpassword+'AB8471%VAED8A76E');
					 $("#password").val(md5Password);
				 }
			});		    
		 });
		</script>
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<c:if test="${code==2000}"><script type="text/javascript">print_s("添加成功。",function(){location.href="userlist";});</script></c:if>
		<script type="text/javascript">
			var code = '${code}';
			if(code!=0&&code!=2000){
				print_s("${desc}",function(){history.go(-1);});
			}
		</script>
<div class="">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">首页</a> > 
	    <a href="userlist" class="custom-font-14">会员管理</a> > 
	    <a href="javascript:;" class="custom-font-14 font-color">编辑</a>
	</div>	
</div>
<div class="">
<form class="form-horizontal" role="form" method="post" action="useradd?st=1">
	<div class="form-group">
		<label for="username" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>登 陆 名：</label>
        <div class="col-sm-3">
			<input type="text" class="form-control" id="loginname" name="loginname">
		</div>	
	</div>
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>密  码：</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">			
		</div>
		<div class="col-sm-3" style="line-height:34px;">（不修改密码请留空）</div>
	</div>	
	<div class="form-group">
		<label for="repassword" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>确认密码：</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" id="repassword" name="repassword" placeholder="请输入密码">
		</div>
	</div>
	<div class="form-group">
		<label for="nickname" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>昵称：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="nickename" name="nickename">
		</div>		
	</div>	
	<div class="form-group">
		<label for="sex" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>性  别：</label>
		<div class="col-sm-6 radio radio-margin">
		  <label class="checkbox-inline radio-checked" style="width: 100px;">
		    <input type="radio" name="sex" id="sex-1" value="1" checked>男
		  </label>
		  <label class="checkbox-inline" style="width: 100px;">
		    <input type="radio" name="sex" id="sex-2" value="2">女
		  </label>			
		</div>		
	</div>		
	<div class="form-group">
		<label for="mobile" class="col-sm-2 control-label"><span style="color:#f00404"> * </span>手机号码：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="mobile" name="mobile" >
		</div>		
	</div>	
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">邮  箱：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="email" name="email" >
		</div>		
	</div>
	<div class="form-group">
		<label for="userTime" class="col-sm-2 control-label">会员有效期至：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="memberExpireTimeStr" name="memberExpireTimeStr">
		</div>		
	</div>			
	<div class="container" style="padding-left: 48px;padding-top: 50px;">		
	<button type="submit" class="btn btn-default">保存</button>
    <a type="button" class="btn btn-default" href="userlist">取消</a>
	</div>
</form>
</div>

<script type="text/javascript">
				$('#memberExpireTimeStr').datetimepicker({
					yearOffset : 0,
					lang : 'ch',
					timepicker : false,
					format : 'Y-m-d',
					formatDate : 'Y-m-d',
				//		minDate:'1970/01/01', // yesterday is minimum date
				//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
				});
			</script>
</body>
</html>

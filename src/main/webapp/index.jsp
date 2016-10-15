<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>泸州市江阳区安全生产移动执法系统管理后台</title>
	<link rel="stylesheet" type="text/css" href="/css/easyui.css">
	<script type="text/javascript" src="/scripts/jquery.min.js"></script>
	<script type="text/javascript" src="../scripts/jquery.cookie.js"></script>
	<script type="text/javascript" src="/scripts/jquery.easyui.min.js"></script>
    <script language="javascript" src="/js/ajax.js"></script>
	<SCRIPT type=text/javascript>
		function logins() {
			if (Form.userName.value == "") {
				alert("请写入您的用户名!");
				return;
			}
			if (Form.passWord.value == "") {
				alert("请写入登录密码!");
				return;
			}
			var ajaxobj = new Ajax();
			ajaxobj.url = "/admin/adminlogin?userName=" + Form.userName.value
					+ "&passWord=" + Form.passWord.value;
			ajaxobj.callback = function() {
				var responseMsg = eval('(' + ajaxobj.gettext() + ')');
				if (responseMsg.code != 0) {
					if (responseMsg.code == 1) {
						alert("用户名或密码错误");
					} else if (responseMsg.code == 2) {
						alert("该用户已被禁用，请及时联系管理员！");
					}
				} else {
					location.href = '/admin/adminindex';
				}
			}
			ajaxobj.send();
		}
	

	</SCRIPT>
</head>
<body>

<div class="easyui-layout login" data-options="fit:true">
	<div class="easyui-window loginbox" title="">
		<form class="cb" name="Form" id="Form" onSubmit="return false" method="POST">
			<p class="lxq"></p> 
			<div>
				<p><label>用户名：</label><input type="text" name="userName" id="userName"></p>
				<p><label>密　码：</label><input type="password" name="passWord" id="passWord"></p>
				<p style="color:#0952a1;"><label></label><input id="rember_me" name="rember_me" type="checkbox" checked="checked" style="border:none"> 记住密码</p>
				<p><label></label><a href="javascript:logins()" id="loginbut"><img src="images/login.jpg" /></a></p>
			</div>
		</form>
	</div>
</div>
</body>
</html>
<script type="text/javascript">
		window.alert = function (msg) {//覆盖原来的alert函数
			$.messager.alert("提示","<div class='ptext'>"+msg+"</div>").dialog({
				title:"提示",
				width:370,
		   	 	height:200,
		   	 	modal:false
			});
			}
		
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
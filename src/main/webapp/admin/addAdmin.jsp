<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<c:if test="${code==7}"><script type="text/javascript">alert("该用户名[${adminUserName}]已被占用！请重新注册。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==2000}"><script type="text/javascript">alert("添加用户成功。",function(){location.href='/admin/adminList';});</script></c:if>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="3"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span><a href="/admin/adminList">管理员管理</a></span>>添加</p>
    		</div>
    		<div>
    			<form class="form form1" method="POST" action="addAdmin?st=1" name="FormAddAdmin" id="FormAddAdmin">
    				<p><label><b>*</b>登录名：</label><input type="text" name="adminUserName" id="adminUserName" onKeyUp="value=value.replace(/[\W]/g,'')"></p>
					<p><label><b>*</b>密　码：</label><input type="password"  name="passWord" id="passWord"></p>
					<p><label><b>*</b>确认密码:</label><input type="password"  name="passWord2" id="passWord2"></p>
					<p><label><b>*</b>姓　名：</label><input type="text" name="name" id="name"></p>
					<p class="sexs"><label>性　别：</label><input type="radio" checked="checked" name="sex" id="sex" value="1">男　　<input type="radio" name="sex" value="2">女</p>
					<div style="position: relative;">
					<p><label><b>*</b>部门：</label><input type="text" name="departMent" id="departMent" autocomplete="off">
					<div class="zgxlcd">
							<c:forEach items="${dps}" var="info">
					          <p>${info}</p>
					       </c:forEach> 
						</div></p>
					</div>
					<p><label>电话号码：</label><input type="text" name="call" id="call"></p>
					<p><label>备　注：</label></p>
					<p><textarea name="remark" id="remark"></textarea></p>
					<p class="fbnt"><a href="#" onClick="checkParam()">保存</a> <a href="/admin/adminList">取消</a></p>
    			</form>
    		</div>
    </div>
 </div>
</body>
</html>
 <script type="text/javascript">

 function checkParam(){
   if($('#adminUserName').val()==''){
	   alert('用户名不能为空！');
	   $('#adminUserName').focus().select();
	   return;
	}
   if(checkParamLenght($('#adminUserName').val(),32)){
	   alert('用户名不能超过32个字符！');
	   $('#adminUserName').focus().select();
	   return;
   }
   if($('#passWord').val()==''){
	   alert('密码不能为空！');
	   $('#passWord').focus().select();
	   return;
	}
   if(checkParamLenght($('#passWord').val(),32)){
	   alert('密码不能超过32个字符！');
	   $('#passWord').focus().select();
	   return;
	}
   if($('#passWord').val()!=$('#passWord2').val()){
	   alert('密码和确认密码不一致！');
	   $('#passWord').focus().select();
	   return;
	}
    if($('#name').val()==''){
	   alert('名字不能为空！');
	   $('#name').focus().select();
	   return;
	}
    if(checkParamLenght($('#name').val(),16)){
 	   alert('名字不能超过16个字符！');
 	   $('#name').focus().select();
 	   return;
 	}
    if($('#departMent').val()==''){
 	   alert('部门不能为空！');
 	   $('#departMent').focus().select();
 	   return;
 	}
    if($('#call').val()!='' && checkParamLenght($('#call').val(),32)){
  	   alert('电话号码不能超过32个字符！');
	   $('#call').focus().select();
	   return;
  	}
    if($('#remark').val()!='' && checkParamLenght($('#remark').val(),500)){
   	   alert('备注不能超过500个字符！');
	   $('#remark').focus().select();
	   return;
   	}
    $('#FormAddAdmin').submit();
 }
 
 
</script>
<script type="text/javascript">
	
	$("#departMent").keyup(function() {
		if($(this).val()=='' || $(this).val()==""){
			return;
		}
		//alert("str= "+$(this).val());
		var obj = {  
				 "departMent" : $(this).val()  
				}; 
        //this.value; //可取得目前的文字內容
		$.post('searchDepartMent',obj,function(data){
			//alert(JSON.stringify(data));
			if(data.code==0){
				$(".zgxlcd").empty();
				var dps = data.dps;
				for(var i=0;i<dps.length;i++){
					$(".zgxlcd").append("<p>"+dps[i]+"</p>");
				}
				$(".zgxlcd").show();
				bindClickToP();
			}else{
				alert("网络连接失败！");
			}
			
		});
    });
	$("#departMent").blur(function(){
			//$(".zgxlcd").hide();
			setTimeout("$('.zgxlcd').hide()",100);
	});
	function bindClickToP(){
		$(".zgxlcd p").one("click",function(){
				$("#departMent").val($(this).text());
				$(".zgxlcd").hide();
		})();
	}
</script>
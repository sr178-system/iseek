<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<c:if test="${code==7}"><script type="text/javascript">alert("用户不存在。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==2001}"><script type="text/javascript">alert("修改用户成功！",function(){location.href='/admin/userList';});</script></c:if>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="4"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span><a href="/admin/userList">执法人员管理</a></span>>编辑</p>
    		</div>
    		<div>
    			<form class="form form1" method="POST" action="editUser?st=1&adminUserName=${user.userName}" name="FormAddAdmin" id="FormAddAdmin">
    				<p><label><span style="font-size:12px;color:red">*</span>登录名：</label>${user.userName}</p>
					<p><label>密　码：</label><input type="password"  name="passWord" id="passWord"> 如不修改密码，请留空</p>
					<p><label>确认密码：</label><input type="password"  name="passWord2" id="passWord2"> 如不修改密码，请留空</p>
					<p><label><span style="font-size:12px;color:red">*</span>姓　名：</label><input type="text" name="name" id="name" value="${user.name}"></p>
					<p class="sexs"><label>性　别：</label><input type="radio" <c:if test="${user.sex==1}">checked="checked"</c:if> name="sex" id="sex" value="1">男　　<input type="radio" <c:if test="${user.sex==2}">checked="checked"</c:if> name="sex" id="sex" value="2">女</p>
					<p><label><span style="font-size:12px;color:red">*</span>部门：</label><select name="departMent" id="departMent">
					        <c:set var="cun" value="${user.departMent}"></c:set>
					       <s:iterator var="data" value="dps">
					          <option value="${data}" <c:if test="${cun==data}">selected</c:if>>${data}</option>
					       </s:iterator>
					</select></p>
					<p><label>电话号码：</label><input type="text" name="call" id="call" value="${user.call}"></p>
					<p><label>备　注：</label></p>
					<p><textarea name="remark" id="remark">${user.remark}</textarea></p>

					<p class="fbnt"><a href="#" onClick="checkParam()">保存</a> <a href="/admin/adminList">取消</a></p>
    			</form>
    		</div>
    </div>
 </div>
</body>
</html>
 <script type="text/javascript">
		function checkParam() {
			if ($('#passWord').val() != ''
				&& checkParamLenght($('#passWord').val(), 32)) {
				alert('密码不能超过32个字符！');
				$('#passWord').focus().select();
				return;
			}
			if ($('#passWord').val() != ''
					&& $('#passWord').val() != $('#passWord2').val()) {
				alert('密码和确认密码不一致！如不修改请留空');
				$('#passWord').focus().select();
				return;
			}
			if ($('#name').val() == '') {
				alert('名字不能为空！');
				$('#name').focus().select();
				return;
			}
			if (checkParamLenght($('#name').val(), 16)) {
				alert('名字不能超过16个字符！');
				$('#name').focus().select();
				return;
			}
			if ($('#call').val() != ''
					&& checkParamLenght($('#call').val(), 32)) {
				alert('电话号码不能超过32个字符！');
				$('#call').focus().select();
				return;
			}
			if ($('#remark').val() != ''
					&& checkParamLenght($('#remark').val(), 500)) {
				alert('备注不能超过500个字符！');
				$('#remark').focus().select();
				return;
			}
			if ($('#departMent').val() == '') {
				alert('请选择该用户的所属部门！');
				$('#departMent').focus().select();
				return;
			}
			$('#FormAddAdmin').submit();
		}

		$('#birthday').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y/m/d',
			formatDate : 'Y/m/d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>
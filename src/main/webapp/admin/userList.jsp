<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="4"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>执法人员管理</span></p>
    		</div>
    		<div>
				<table class="table1 table2" width="100%">
					<tr class="t2top">
						<td colspan="10">
							<ul>
								<li><a href="/admin/addUser">添加 +</a></li>
								<li><a href="#" onclick="del()">删除</a></li>
								<li><a href="#" onclick="editStatus(0)">启用</a></li>
								<li><a href="#" onclick="editStatus(1)">停用</a></li>
							</ul>
							<form action="/admin/userList" method="post">
							<div>
								登录名：<input type="text" name="uname" value="${uname}"/>　
								姓名：<input type="text" name="name" value="${name}"/>　
								部门：<select name="departMent"><option value="">选择部门</option>
							<s:iterator var="data" value="dps">
					          <option value="${data}" <c:if test="${departMent==data}">selected</c:if>>${data}</option>
					       </s:iterator>
								</select>　
								<input type="submit" value=" 查询 " />
							</div>
							</form>
						</td>
					</tr>
					<tr> 
						<th width="40px"><input class="setz" type="checkbox" /></th>
						<th width="10%">登录名</th>
						<th width="10%">状态</th>
						<th width="10%">姓名</th>
						<th width="7%">性别</th>
						<th width="13%">部门</th>
						<th width="15%">电话号码</th>
						<th width="13%">备注</th>
						<th width="10%">最后修改人</th>
						<th width="8%">操作</th>
					</tr>
					<s:iterator var="data" value="dataList">
					<tr>
						<td><input type="checkbox" name="userNames" value="${data.userName}"/></td>
						<td>${data.userName}</td>
						<c:if test="${data.status==0}"><td>已启用</td></c:if><c:if test="${data.status==1}"><td class="red">已禁用</td></c:if>
						<td>${data.name}</td>
						<td><c:if test="${data.sex==1}">男</c:if><c:if test="${data.sex==2}">女</c:if></td>
						<td>${data.departMent}</td>
						<td>${data.call}</td>
						<td style="text-align: left;">${data.remark}</td>
						<td>${data.lastEditName}</td>
						<td><a href="/admin/editUser?adminUserName=${data.userName}">编辑</a></td>
					</tr>
					</s:iterator>
				</table>
				<div class="page cb">
					 <aldtags:pageTag paraStr="uname,${uname},name,${name},departMent,${departMent}"/>
				</div>

    		</div>
    </div>

 </div>
<script type="text/javascript">
	var selectInput = $(".table2 td input");//选择需要删除的元素
	//弹窗
	function del(){
		var selok = $('.table2 td input:checked');
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要删除这些用户吗？</div>",function(e){
			if(e){
				$.post('deleteu',selok,function(data){
					if(data.code==0){
						alert("成功删除了"+selok.size()+"个",function(){
							location.href="userList";
						});
					}else{
						alert("删除失败，错误码"+data.code);
					}
				})
			}
		}).dialog({
			title:"提示",
			width:370,
	   	 	height:200,
	   	 	modal:false
		});
	}
	
	//弹窗
	function editStatus(status){
		var selok = $('.table2 td input:checked');
		var desc = "";
		if(status==0){
			desc="启用";
		}else{
			desc="禁用";
		}
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要"+desc+"这些用户吗？</div>",function(e){
			if(e){
				$.post('editStatusu?status='+status,selok,function(data){
					if(data.code==0){
						alert("操作成功！",function(){
							location.href="userList";
						});
					}else{
						alert("操作失败，错误码"+data.code);
					}
				})
			}
		}).dialog({
			title:"提示",
			width:370,
	   	 	height:200,
	   	 	modal:false
		});
	}

	//全选
	$(".setz").change(function(){
		selectInput.prop("checked",this.checked);
	});

</script>
</body>
</html>
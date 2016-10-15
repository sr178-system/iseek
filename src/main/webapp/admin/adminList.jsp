<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="3"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>管理员管理</span></p>
    		</div>
    		<div>
				<table class="table1 table2" width="100%">
					<tr class="t2top">
						<td colspan="9">
							<ul>
								<li><a href="/admin/addAdmin">添加 +</a></li>
								<li><a href="#" onclick="del()">删除</a></li>
								<li><a href="#" onclick="editStatus(0)">启用</a></li>
								<li><a href="#" onclick="editStatus(1)">停用</a></li>
							</ul>
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
						<th width="23%">备注</th>
						<th width="8%">操作</th>
					</tr>
					<s:iterator var="data" value="dataList">
					<tr>
						<td><c:if test="${data.userName!='admin'}"><input type="checkbox" name="adminUserNames" value="${data.userName}"  /></c:if></td>
						<td>${data.userName}</td>
						<c:if test="${data.status==0}"><td>已启用</td></c:if><c:if test="${data.status==1}"><td class="red">已禁用</td></c:if>
						<td>${data.name}</td>
						<td><c:if test="${data.sex==1}">男</c:if><c:if test="${data.sex==2}">女</c:if></td>
						<td>${data.departMent}</td>
						<td>${data.call}</td>
						<td style="text-align: left;">${data.remark}</td>
						<td><a href="/admin/editAdmin?adminUserName=${data.userName}">编辑</a></td>
					</tr>
					</s:iterator>
				</table>
				<div class="page cb">
					 <aldtags:pageTag/>
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
				$.post('delete',selok,function(data){
					if(data.code==0){
						alert("成功删除了"+selok.size()+"个",function(){
							location.href="adminList";
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
				$.post('editStatus?status='+status,selok,function(data){
					if(data.code==0){
						alert("操作成功！",function(){
							location.href="adminList";
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
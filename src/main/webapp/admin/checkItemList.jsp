<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="5"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>检查项管理</span></p>
    		</div>
    		<div class="bulletin">
    			<div class="b2top">
    				<ul>
						<li><a href="#" onclick="addBefor()">添加 +</a></li>
						<li><a href="#" onclick="del()">删除</a></li>
					</ul>
    			</div>
    			<div class="tbox" style="width: 380px">
				<table class="table1 table4">
				   <tr> 
						<th width="40px"><input class="setz" type="checkbox" /></th>
						<th>检查项名称</th>
					</tr>
				   <s:iterator var="data" value="list">
					<tr> 
						<td><input type="checkbox" name="ids" value="${data.id}" id="ids"/></td>
						<td><a href="#" onClick="editBefor('${data.id}','${data.itemTitle}','${data.itemContent}')">${data.itemTitle}</a></td>
					</tr>
					</s:iterator>
				</table>
				</div>
				<div class="fbnew">
					<form name="FormItem" id="FormItem">
					    <input type="hidden"  name="id" id="id"/>
						<p><b>检查项名称</b></p>
						<p><input type="text" name="title" id="title"/></p>
						<p><b>说明：</b></p>
						<p><textarea name="content1" id="content1"></textarea></p>
						<p class="fbnt"><a href="#" onClick="add()">保存</a></p>
					</form>
				</div>
    		</div>
    </div>
 </div>
<script type="text/javascript">
    var selectInput = $(".table1 td input");//选择需要删除的元素
	
	//编辑前的操作
	function editBefor(id,title,content){
		$("#id").val(id)
		$("#title").val(title)
		$("#content1").val(content);
		$("#title").focus().select();
	}
	//添加前的操作
	function addBefor(){
		$("#id").val("");
		$("#title").val("");
		$("#content1").val("");
		$("#title").focus().select();
	}
	//添加
	function add(){
		if($("#title").val()==""){
			alert('检查项名称不能为空！');
			return;
		}
		if($("#content1").val()==""){
			alert('检查项说明不能为空！');
			return;
		}
		var desc = "添加";
		if($("#id").val()!=""){
			desc = "修改";
		}
		var sendData = $("#FormItem").serialize();
		$.post('addItem',sendData,function(data){
			if(data.code==0){
				alert(desc+"成功！",function(){
					location.href="checkItemList";
				});
			}else{
				alert("添加失败，错误码"+data.code);
			}
		})
	}
	//弹窗
	function del(){
		var selok = $('.table4 td input:checked');
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要删除这些检查项吗？</div>",function(e){
			if(e){
				$.post('deleteItem',selok,function(data){
					if(data.code==0){
						alert("成功删除了"+selok.size()+"个。",function(){
							location.href="checkItemList";
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
	function pop(){
		var selok = $('.table2 td input:checked');
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要删除这条记录吗？</div>",function(e){
			if(e){
				//$.get('indexxxx?',selok,function(data){
					//if(data){
						alert("删除了"+selok.size()+"个");
					//}
				//})
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

	$(".table1 tr").hover(function(){
		$(this).toggleClass("trhover")
	});
</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="6"/></jsp:include>
<div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>通知公告</span></p>
    		</div>
    		<div class="bulletin">
    			<div class="b2top">
    				<ul>
						<li><a href="#" onclick="addBefor()">添加 +</a></li>
						<li><a href="#" onclick="del()">删除</a></li>
						<li><a href="#" onClick="editStatus(1)">启用</a></li>
						<li><a href="#" onClick="editStatus(0)">停用</a></li>
						<li><a href="#" onClick="editStatus(2)">置顶</a></li>
						<li><a href="#" onClick="editStatus(1)">取消置顶</a></li>
					</ul>
    			</div>
    			<div class="tbox">
				<table class="table1 table5">
					<tr> 
						<th width="40px"><input class="setz" type="checkbox" /></th>
						<th width="70%">标题</th>
						<th width="10%">发布日期</th>
						<th width="15%">状态</th>
					</tr>
					<s:iterator var="data" value="list">
					<tr>
						<td><input type="checkbox" name="ids" id="ids" value="${data.id}"/></td>
						<td><a href="#" onClick="editBefor(${data.id})">${data.noticeTitle}</a>
						</td>
						<td><fmt:formatDate value="${data.addTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<c:if test="${data.status==0}"><td class="red">已停用</td></c:if>
						<c:if test="${data.status==1}"><td>已启用</td></c:if>
						<c:if test="${data.status==2}"><td class="red">[置顶]</td></c:if>                                             
					</tr>
					</s:iterator>
				</table>
				</div>
				<div class="fbnew">
					<form name="FormNotice" id="FormNotice">
					    <input type="hidden" value="" name="id" id="id"/>
						<p><b>标题：</b></p>
						<p><input type="text" value="" name="title" id="title"/></p>
						<p><b>内容：</b></p>
						<p><textarea name="content1" id="content1"></textarea></p>
						<p class="fbnt"><a href="#" onClick="add()">发布</a></p>
					</form>
				</div>
    		</div>
    </div>
 </div>
<script type="text/javascript">
	var selectInput = $(".table1 td input");//选择需要删除的元素
	
	//弹窗
	function editStatus(status){
		var selok = $('.table1 td input:checked');
		var desc = "";
		if(status==0){
			desc="停用";
		}else if(status==1){
			desc="启用";
		}else if(status==2){
			desc="置顶";
		}
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要"+desc+"这些公告吗？</div>",function(e){
			if(e){
				$.post('editNoticeStatus?status='+status,selok,function(data){
					if(data.code==0){
						alert("操作成功！",function(){
							location.href="noticeList";
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
	
	//编辑前的操作
	function editBefor(id,title,content){
		$.post('getOne?id='+id,null,function(data){
			if(data.code==0){
				$("#id").val(id)
				$("#title").val(data.notice.noticeTitle)
				$("#content1").val(data.notice.noticeContent);
				$("#title").focus().select();
			}else{
				alert("添加失败，错误码"+data.code);
			}
		})
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
			alert('公告名称不能为空！');
			return;
		}
		if($("#content1").val()==""){
			alert('公告内容不能为空！');
			return;
		}
		var desc = "添加";
		if($("#id").val()!=""){
			desc = "修改";
		}
		var sendData = $("#FormNotice").serialize();
		$.post('addNotice',sendData,function(data){
			if(data.code==0){
				alert(desc+"成功！",function(){
					location.href="noticeList";
				});
			}else{
				alert("添加失败，错误码"+data.code);
			}
		})
	}
	//弹窗
	function del(){
		var selok = $('.table5 td input:checked');
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要删除这些公告吗？</div>",function(e){
			if(e){
				$.post('deleteNotice',selok,function(data){
					if(data.code==0){
						alert("成功删除了"+selok.size()+"个。",function(){
							location.href="noticeList";
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
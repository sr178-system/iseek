<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<c:if test="${code==1}"><script type="text/javascript">alert("类别名称不能为空。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==2}"><script type="text/javascript">alert("大项名称不能为空。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==3}"><script type="text/javascript">alert("子项名称不能为空。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==4}"><script type="text/javascript">alert("结果名称不能为空。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==5}"><script type="text/javascript">alert("类别名称已存在。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==2000}"><script type="text/javascript">alert("添加成功。");</script></c:if>
<c:if test="${code==2001}"><script type="text/javascript">alert("修改成功。");</script></c:if>
<c:if test="${code==2002}"><script type="text/javascript">alert("保存成功。");</script></c:if>
<c:if test="${code==2003}"><script type="text/javascript">alert("保存成功。");</script></c:if>
<div class="easyui-layout" data-options="fit:true">
<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="5"/></jsp:include>

   <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>检查项管理</span>><span><c:if test="${empty id}">添加</c:if><c:if test="${not empty id}">编辑</c:if></span></p>
    		</div>
    		<div class="bulletin">
    				<form class="form form1" action="addOrEditCheckItem?id=${id}&st=1" method="post" id="checkItemForm" name="checkItemForm">
    					<p><label><b>*</b>检查类别：</label><input type="text" value="${bigCheck.itemTitle}" name="title" id="title"></p>
						<p class="cb" style="padding-bottom: 50px;"><label class="l"><b>*</b>所属部门：</label>
							<select class="l" style="padding: 5px;" name="departMent" id="departMent">
								<s:iterator var="data" value="dps">
					              <option value="${data}" <c:if test="${bigCheck.departMent==data}">selected</c:if>>${data}</option>
					            </s:iterator>
							</select>
							<a href="#" class="jcglbja2" onClick="submitA()">保存</a>
						</p>
    			<div class="tbox tbox6">
    			<strong>大项管理：</strong>
    			<p><input class="setz" type="checkbox" style="border:none"/><a href="#" onclick="pop()">删除</a></p>
    			<div class="gyn29">
				<table class="table1 table6 click1">
				<s:iterator var="data" value="downList">
					         <tr><td><input type="checkbox" name="ids" value="${data.id}" />${data.itemTitle}<input type="hidden" value="${data.id}" id='hiddenid' name='hiddenid'/></td></tr>
				</s:iterator>
				</table>
				</div>
				</div>
				<div class="tbox tbox6">
				<strong>子项管理：</strong>
				<p><input class="setz" type="checkbox" style="border:none"/><a href="#" onclick="pop()">删除</a></p>
    			<div class="gyn29">
				<table class="table1 table6 click2">
					
				</table>
				</div>
				</div>
				<div class="tbox tbox6">
				<strong>结果选项：</strong>
				<p><input class="setz" type="checkbox" style="border:none"/><a href="#" onclick="pop()">删除</a></p>
    			<div class="gyn29">
				<table class="table1 table6 click3">
					
				</table>
				</div>
				</div>
				<div class="fbnew" style="margin-top:0;">
					<p><label><b>*</b>大项名称：</label><input class="input1" type="text" value=""  name="firstItemName"></p>
					<p><label><b>*</b>子项名称：</label><input class="input2"  type="text" value="" name="secondItemName"></p>
					<p><label><b>*</b>结果选项：</label><input class="input3"  type="text" value="" name="resultItemName"></p>
					<div class="jcglbjst"><input style="width: auto;" type="checkbox" name="successOrFail" value="1"> 是否为不通过标识</div>
					<p class="tisps">说明：如果选择为不通过标识，检查人员在检查过程中勾选了改项，则在后台检查记录中，该项会用红色标注，方便人员重点查看。</p>
					<p><a href="#" class="jcglbja" onClick="submitB()">添加</a></p>
				</div>


				</form>
    		</div>
    </div>

 </div>
<script type="text/javascript">

	var selectInput = $(".table1 td input:checked");//选择需要删除的元素

	//弹窗
	function pop(){
		var selok = $('.table1 td input:checked');
		if(!selok.size()){ return;};
		$.messager.confirm("提示","<div class='ptext'>确定要删除吗？</div>",function(e){
			if(e){
				$.post('deleteSmallCheckItems',selok,function(data){
					if(data.code==0){
						alert("成功删除了"+selok.size()+"个",function(){location.href="/admin/addOrEditCheckItem?id=${id}";});
					}else{
						alert("删除失败！");
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
		$(this).parents(".tbox6").find("input").prop("checked",this.checked);
	});

	$(".table1 tr").hover(function(){
		$(this).toggleClass("trhover")
	});

	$(".click1 tr td").click(function(){
		var innerid = $(this).find("input[name='hiddenid']").val(); 
		//alert(innerid);
		$.post('requestDownList?parentId='+innerid,function(data){
			//alert(JSON.stringify(data));
			if(data.code!=0){
				alert("网络请求失败！");
				return;
			}else{
				$(".click2 tr td").parent().remove();
				var downList = data.downList;
				for(var i=0;i<downList.length;i++){
					$(".click2").append("<tr><td><input type='checkbox' name='ids' value='"+downList[i].id+"'/>"+downList[i].itemTitle+"<input type='hidden' id='hiddenid' name='hiddenid' value='"+downList[i].id+"'/></td></tr>");
				}
				bindClick2Tr();
			}
		})
		$(".click1 tr td").css("background-color","#FFF");
		$(this).css("background-color","#7ecdf4");
		$(".input1").val($(this).text());
		$(".click3 tr td").parent().remove();
		$(".input2").val("");
		$(".input3").val("");
		$("[name=successOrFail]:checkbox").prop("checked", false);
	});
	
    function bindClick2Tr(){
		$(".click2 tr").on('click','td',function(){
			var innerid = $(this).find("input[name='hiddenid']").val();
			$.post('requestDownList?parentId='+innerid,function(data){
				//alert(JSON.stringify(data));
				if(data.code!=0){
					alert("网络请求失败");
					return;
				}else{
					$(".click3 tr td").parent().remove();
					var downList = data.downList;
					for(var i=0;i<downList.length;i++){
						$(".click3").append("<tr><td><input type='checkbox' name='ids' value='"+downList[i].id+"'/>"+downList[i].itemTitle+"<input type='hidden' id='hiddenid' name='hiddenid' value='"+downList[i].id+"'/>"+"<input type='hidden' id='hiddensf' name='hiddensf' value='"+downList[i].successOrFail+"'/></td></tr>");
					}
					bindClick3Tr();
				}
			})
			$(".click2 tr td").css("background-color","#FFF");
			$(this).css("background-color","#7ecdf4");
			$(".input2").val($(this).text());
			$(".input3").val("");
			$("[name=successOrFail]:checkbox").prop("checked", false);
		});
    }
    
    function bindClick3Tr(){
		$(".click3 tr td").click(function(){
			var sf = $(this).find("input[name='hiddensf']").val();
			//alert(sf);
			$(".click3 tr td").css("background-color","#FFF");
			$(this).css("background-color","#7ecdf4");
			$(".input3").val($(this).text());
			if(sf==0){
				$("[name=successOrFail]:checkbox").prop("checked", true);
			}else{
				$("[name=successOrFail]:checkbox").prop("checked", false);
			}
			
		});
    }
	
    function submitB(){
    	$("#checkItemForm").submit();
    }
    
    function submitA(){
    	var title = $('#title').val();
    	var departMent = $('#departMent').val();
    	if(title==''){
    		alert("类别名称不能为空。");
    		return;
    	}
    	if(departMent==''){
    		alert("部门不能为空。");
    		return;
    	}
    	var obj = {  
    			 "title" : title,
				 "departMent" : departMent
				}; 
    	$.post('addOrEditBigCheckItem?id=${id}',obj,function(data){
			//alert(JSON.stringify(data));
			if(data.code!=0){
				if(data.code==5){
					alert("已存在的类别名称。");
					return;
				}else if(data.code==6){
					alert("修改的类别不存在.");
					return;
				}else if(data.code==1){
					alert("类别名称不能为空.");
					return;
				}
				alert("未知错误,code="+data.code);
			}else{
				 alert("保存成功。");
			}
		})
    }
</script>
</body>
</html>
 
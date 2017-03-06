<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib2.jsp"%>
<!DOCTYPE html>
<html>
   <head>
		<title>资讯管理</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,IE=8">
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">  		
		<link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css" /> 			
		<link rel="stylesheet" href="../css/reg-2.css">  	
		<link rel="stylesheet" href="../css/message3.css"> 		
		<script src="../js/jquery.min.js"></script>	
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/fileinput.js" type="text/javascript"></script>
		<script src="../js/bootstrap.min.js"></script>        
        <script src="../js/fileinput_locale_zh.js" type="text/javascript"></script>		
		<script type="text/javascript">
		$(function () { 
			 $("#checkbox").click(function(){
			    var isChecked = $(this).prop("checked");
			    $("input[type='checkbox']").prop("checked", isChecked);
			    if(isChecked){
			    	$("input[type='checkbox']").parent("label").addClass("active-box");
			    }else{
			    	$("input[type='checkbox']").parent("label").removeClass("active-box");
			    }
			})
		    $(".chebox-label").click(function(){
		    	//alert($(this).children("input[type='checkbox']").prop("checked"))
			    if($(this).children("input[type='checkbox']").prop("checked")){
			    	$(this).addClass("active-box");
			    }else{
			    	$(this).removeClass("active-box");
			    }			    				    	
		    })			 
		    if($("#table-list").height()>$(".td-h").height()){
		    	$(".td-h").css("padding-right","1px");
		    	$(".thead").css("padding-right","16px");
		    }
		})
		
		
						//弹窗
	function del(){
		var selok = $('.table td input:checked');
		if(!selok.size()){ return;};
		if(confirm("确定要删除这些资讯吗？")){
			$.post('deletenews',selok,function(data){
				if(data.flag==0){
					print_s("成功删除了"+selok.size()+"个",function(){location.href="message";});
				}else{
					print_s("删除失败，"+data.msg);
				}
			})
		}
		
	}
		</script>		
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<c:if test="${code==2000}"><script type="text/javascript">print_s("添加成功。",function(){location.href="message";});</script></c:if>
<div class="">
	<div class="page-header">
	    <a href="javascript:;" class="custom-font-14">首页</a> > 	    
	    <a href="javascript:;" class="custom-font-14 font-color">资讯管理</a>
	</div>	
</div>
<div class="">
<form class="form-horizontal" role="form" method="post" action="addnews">
	<div class="form-group">
 		<label class="col-sm-12 control-label text-left p5 font-weight" style="padding-left:0;">
 			<span style="color:#f00404"> * </span>资讯页大图：
 		</label>
		<div class="col-sm-4 image-1"><img alt="资讯页大图" src="/uploads/attach/${config.bigPictureUrl}"></div>	
		<div class="col-sm-1" style="padding-top:80px;"><input type="file" name="attach" id="uploadify2" /></div>
	</div>	
	<div class="form-group">
		<label class="col-sm-12 control-label text-left p5 font-weight" style="padding-left:0;">
			<span style="color:#f00404"> * </span>资讯页小图：
		</label>
		<div class="col-sm-4 image-2"><img alt="资讯页小图" src="/uploads/attach/${config.smallPictureUrl}"></div>
		<div class="col-sm-1" style="padding-top:103px;"><input type="file" name="attach" id="uploadify1" /></div>	
	</div>
	<div class="row">
		<div class="col-xs-6">
			<p class="text-left">
				<label class="chebox-label"><input type="checkbox" id="checkbox"/></label>
				<button type="button" class="btn btn-default" onclick="del()">删除</button>
			</p>
			<table class="table table-bordered table-hover text-center">							
				<thead>
					<tr>					
						<td class="text-left">更新日期</td>
						<td>显示文字 </td>
						<td>链接URL</td>					
					</tr>
				</thead>
				<tbody>
				<s:iterator var="data" value="newsList">
					<tr>
						<td class="text-left">
							<label class="chebox-label"><input type="checkbox" value="${data.newsId}" name="ids" /></label><fmt:formatDate value="${data.updatedTime}" type="both" pattern="yyyy.MM.dd"/>
						</td>
						<td>${data.newTitle}</td>
						<td>${data.newsUrl}</td>										
					</tr>
				</s:iterator>
				</tbody>				
			</table>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-sm-12 control-label text-left p5 font-weight"><span style="color:#f00404"> * </span>显示文字：：</label>
				<div class="col-sm-8">
					<input type="text" name="content" id="content" class="form-control" placeholder=""/>
				</div>		
			</div>	
			<div class="form-group">
				<label class="col-sm-12 control-label text-left p5 font-weight"><span style="color:#f00404"> * </span>链接URL：：</label>
				<div class="col-sm-8">
					<input type="text" name="url" id="url" class="form-control" placeholder=""/>
				</div>		
			</div>					
			<div class="" style="padding-left: 15px;padding-top: 0px;">		
				<button type="submit" class="btn btn-default">添加</button>	
			</div>
		</div>
	</div>		
</form>
</div>
</body>
</html>
<script src="../js/uploadify/jquery.uploadify-3.1.js" type="text/javascript"></script>
 <script type="text/javascript">
        $(function () {
            $("#uploadify2").uploadify({
                //指定swf文件
               'swf': '/js/uploadify/uploadify.swf',
                //后台处理的页面
                'uploader': '/admin/uploadAttach;jsessionid=${pageContext.session.id}',
                //按钮显示的文字
                'buttonText': '上传',
               // 'buttonImage':'/images/addatach.png',
                //显示的高度和宽度，默认 height 30；width 120
                'height': 29,
                'width': 50,
                //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'fileTypeDesc': 'attach Files',
                'fileObjName':'attach',
                //允许上传的文件后缀
                'fileTypeExts': '*.*',
                //发送给后台的其他参数通过formData指定
                'formData': { 'jsessionid': '${pageContext.session.id}','type':'2'},
                //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                //'queueID': 'fileQueue',
                //选择文件后自动上传
                'auto': true,
                'removeTimeout' : 0,
                //设置为true将允许多文件上传
                'multi': false,
                onUploadSuccess: function (file, data, response) {//上传完成时触发（每个文件触发一次）
                    var res =  $.parseJSON(data);
                    if(res.flag==0){
                    	print_s("上传成功",function(){location.href="message";});
                    }else{
                    	print_s("上传失败",function(){location.href="message";});
                    }
                    
                },

                'onUploadError': function (file, errorCode, errorMsg, errorString) {//当单个文件上传出错时触发
                	print_s('文件：' + file.name + ' 上传失败: ' + errorString);
                }
            });
            
            $("#uploadify1").uploadify({
                //指定swf文件
                'swf': '/js/uploadify/uploadify.swf',
                //后台处理的页面
                'uploader': '/admin/uploadAttach;jsessionid=${pageContext.session.id}',
                //按钮显示的文字
                'buttonText': '上传',
                //'buttonImage':'/images/addatach.png',
                //显示的高度和宽度，默认 height 30；width 120
                'height': 29,
                'width': 50,
                //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'fileTypeDesc': 'attach Files',
                'fileObjName':'attach',
                //允许上传的文件后缀
                'fileTypeExts': '*.*',
                //发送给后台的其他参数通过formData指定
                'formData': { 'jsessionid': '${pageContext.session.id}','type':'1'},
                //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                //'queueID': 'fileQueue',
                //选择文件后自动上传
                'auto': true,
                'removeTimeout' : 0,
                //设置为true将允许多文件上传
                'multi': false,
                onUploadSuccess: function (file, data, response) {//上传完成时触发（每个文件触发一次）
                    var res =  $.parseJSON(data);
                    if(res.flag==0){
                    	print_s("上传成功",function(){location.href="message";});
                    }else{
                    	print_s("上传失败",function(){location.href="message";});
                    }
                    
                },

                'onUploadError': function (file, errorCode, errorMsg, errorString) {//当单个文件上传出错时触发
                	print_s('文件：' + file.name + ' 上传失败: ' + errorString);
                }
            });      
        });
     
    </script>
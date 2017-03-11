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
		    if($("#table-list").height()<381){		    	
		    	$(".thead").css("padding-right","0");
		    	$("#table-list").removeClass("td-b-r-0").addClass("td-b-r-1");			
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
		
		if($("#table-list").height()<381){		    	
	    	$("#up-txt").removeClass("td-w-23").addClass("td-w-2");
	    	$("#up-link").removeClass("td-w-46").addClass("td-w-51");
	    	$("#table-list").removeClass("td-b-r-0").addClass("td-b-r-1");			
	    }
		</script>		
   </head>
<body>
<jsp:include page="/common/dialog.jsp" flush="true"></jsp:include>
<c:if test="${code==2000}"><script type="text/javascript">print_s("添加成功。",function(){location.href="message";});</script></c:if>
<div class="form-horizontal">
	
	<div class="form-group">
 		<label class="col-sm-12 control-label text-left p5 font-weight" style="padding-left:0;">
 			<span style="color:#f00404"> * </span>资讯页大图（图片大小：840x120像素）：
 		</label>
		<div class="col-sm-4 image-1">
			<form class="form-horizontal" role="form" method="post" action="/admin/uploadAttach?type=2" enctype="multipart/form-data">
				<input id="max-file" class="file" type="file" name="attach" multiple data-min-file-count="1" value="<c:if test="${not empty config.bigPictureUrl}">/uploads/attach/${config.bigPictureUrl}</c:if>">
			</form>
		</div>	
		<!-- <div class="col-sm-1" style="padding-top:80px;"><button type="button" class="btn btn-default">上传</button></div>	 -->
	</div>	
	<div class="form-group">
		<label class="col-sm-12 control-label text-left p5 font-weight" style="padding-left:0;">
			<span style="color:#f00404"> * </span>资讯页小图（图片大小：240x200像素）：
		</label>
		<div class="col-sm-4 image-2">
			<form class="form-horizontal" role="form" method="post" action="/admin/uploadAttach?type=1" enctype="multipart/form-data">
				<input id="min-file" class="file" type="file" name="attach" multiple data-min-file-count="1" value="<c:if test="${not empty config.smallPictureUrl}">/uploads/attach/${config.smallPictureUrl}</c:if>">
			</form>		
		</div>
		<!-- <div class="col-sm-1" style="padding-top:103px;"><button type="button" class="btn btn-default">上传</button></div> -->
	</div>
	<div class="row">
		<div class="col-xs-6">			
			<p class="text-left">
				<label class="chebox-label"><input type="checkbox" id="checkbox"/></label>
				<button type="button" class="btn btn-default" onclick="del()">删除</button>
			</p>
			<div class="thead">
				<table class="table table-bordered table-hover text-center td-m row" style="border:0;margin: 0;">							
				<thead>
					<tr>					
						<td class="text-left col-xs-3 td-b-0 td-b-l-0" id="up-txt" style="border-left: 0 !important;">更新日期</td>
						<td class="col-xs-5 td-b-0" id="up-link">显示文字 </td>
						<td class="td-b-0 col-xs-4" style="border-right: 0;">链接URL</td>					
					</tr>
				</thead>
			</table>
			</div>
			<div class="td-h" style="padding-left: 0;">
				<table class="table table-bordered table-hover text-center td-b-r-0 td-b-l-0 row" id="table-list" style="margin: 0;">
					<tbody>	
					<s:iterator var="data" value="newsList">				
					<tr>
						<td class="text-left td-t-0 col-xs-3 td-b-l-0 td-p-r">
							<label class="chebox-label"><input type="checkbox" value="${data.newsId}" name="ids" /></label><fmt:formatDate value="${data.updatedTime}" type="both" pattern="yyyy.MM.dd"/>
						</td>
						<td class="td-t-0 col-xs-5">
							<div class="td-txt">${data.newTitle}</div>
						</td>
						<td class="td-t-0 col-xs-4 td-b-r-0">
							<div class="td-link">
								${data.newsUrl}
							</div>
						</td>										
					</tr>
					</s:iterator>
					</tbody>					
				</table>
			</div>	
		</div>
		<div class="col-xs-6" style="padding-top: 25px;padding-left: 40px;">
		<form class="form-horizontal" role="form" method="post" action="addnews">
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
			</form>
		</div>
	</div>		
</div>
<script type="text/javascript">
	var imageurl=$("#max-file").attr("value");
	var minImage=$("#min-file").attr("value");
	
	// 资讯大图
	if(imageurl){
	    $("#max-file").fileinput({        
	        // showUpload: false,   //显示上传按钮    
	        showCaption: false,     //file文本框
	        allowedFileExtensions : ['jpg', 'png','gif'],//支持文件格式        
	        initialPreview: [
	            "<img src='"+imageurl+"' class='file-preview-image' style='width:auto;height:100px;'/>",        
	        ],//预览图
	        maxFileSize: 1000,//限制文件上传大小
	    })
	}else{
	    $("#max-file").fileinput({        
	        // showUpload: false,        
	        showCaption: false,        
	        allowedFileExtensions : ['jpg', 'png','gif'],	        	    	
	        maxFileSize: 1000,
	    })
	}
	// 资讯小图
	if(minImage){
	    $("#min-file").fileinput({        
	        // showUpload: false,        
	        showCaption: false,        
	        allowedFileExtensions : ['jpg', 'png','gif'],        
	        initialPreview: [
	            "<img src='"+minImage+"' class='file-preview-image' style='width:auto;height:100px;'/>",        
	        ],
	        maxFileSize: 1000,
	    })
	}else{
	    $("#min-file").fileinput({        
	        // showUpload: false,        
	        showCaption: false,        
	        allowedFileExtensions : ['jpg', 'png','gif'],	        	    	
	        maxFileSize: 1000,
	    })
	}
	$("#max-file").change(function(){
		$(".image-1").css("background","#f2f2f2")
	})
	$("#min-file").change(function(){
		$(".image-2").css("background","#f2f2f2")
	})	
	$(".fileinput-remove").on("click",function(){		
		$(this).parent(".file-input").parent(".image-1").css("background","url('../image/image-1.png') no-repeat top");
		$(this).parent(".file-input").parent(".image-2").css("background","url('../image/image-2.png') no-repeat top");
	})
	
	$(".fileinput-upload-button").click(function(){
      $(this).parent(".file-input").parent("form").submit();
    })
    
</script>
</body>
</html>
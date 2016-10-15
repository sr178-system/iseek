<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<c:if test="${code==1}"><script type="text/javascript">alert("标题不能为空。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==2}"><script type="text/javascript">alert("内容不能为空。",function(){history.go(-1);});</script></c:if>
<c:if test="${code==2000}"><script type="text/javascript">alert("添加成功。",function(){location.href='/admin/noticeList';});</script></c:if>
<c:if test="${code==2001}"><script type="text/javascript">alert("修改成功。",function(){location.href='/admin/noticeList';});</script></c:if>
<link href="/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<div class="easyui-layout" data-options="fit:true">
<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="6"/></jsp:include>
<div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span><a href="/admin/noticeList">通知公告</a></span>><span><c:if test="${empty id}">添加</c:if><c:if test="${not empty id}">编辑</c:if></span></p>
    		</div>
   		<div class="bulletin">

				<div class="fbnew" style="margin-top: 10px;">
					<form action="/admin/addOrEditNotice?st=1&id=${id}" method="post" id="noticeForm" name="noticeForm">
						<p><b>标题：</b></p>
						<p><input type="text" name="title" id="title" value="${title}"/></p>
						<p><b>内容：</b></p>
						<p><textarea name="content1" id="content1">${content1}</textarea></p>
						<p><input type="file" name="attach" id="uploadify" /><input type="hidden" name="attachMent" id="attachMent" /></p>
						<div id="fileQueue" ></div>
                        <div class="filelink">
                           <c:if test="${not empty attachMent}">
                               <c:set value="${fn:split(attachMent, ',')}"
												var="attch" />
								<c:forEach items="${attch}" var="s">
								     <c:set value="${fn:split(s, ':')}"
												var="temp" />
									<p><span>${temp[0]}(${temp[2]})</span><a href='#'>删除</a><input type='hidden' value='${s}' /></p>			 
								</c:forEach>
                           
                           </c:if>
                        
                        </div>
						<p class="fbnt"><a href="#" onClick="check()">发布</a></p>
	
					</form>
				</div>
    		</div>
    </div>

 </div>
<script type="text/javascript">
	$(".table1 tr").hover(function(){
		$(this).toggleClass("trhover")
	});

	$("#files").change(function(){
		$(".filelink").append("<p><img src='img-mini.jpg' /><span>xxxx名字.jpg  234.MB</span><a href='#'>删除</a></p>");
	});

	$(".filelink").on('click','a',function(){
		$(this).parent().remove();
	})

</script>

 <script src="/js/uploadify/jquery.uploadify-3.1.js" type="text/javascript"></script>
 <script type="text/javascript">
        $(function () {
            $("#uploadify").uploadify({
                //指定swf文件
                'swf': '/js/uploadify/uploadify.swf',
                //后台处理的页面
                'uploader': '/admin/uploadAttach;jsessionid=${pageContext.session.id}',
                //按钮显示的文字
                'buttonText': '添加附件',
                'buttonImage':'/images/addatach.png',
                //显示的高度和宽度，默认 height 30；width 120
                'height': 29,
                'width': 90,
                //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'fileTypeDesc': 'attach Files',
                'fileObjName':'attach',
                //允许上传的文件后缀
                'fileTypeExts': '*.*',
                //发送给后台的其他参数通过formData指定
                'formData': { 'jsessionid': '${pageContext.session.id}'},
                //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                //'queueID': 'fileQueue',
                //选择文件后自动上传
                'auto': true,
                'removeTimeout' : 0,
                //设置为true将允许多文件上传
                'multi': false,
                onUploadSuccess: function (file, data, response) {//上传完成时触发（每个文件触发一次）
                	//alert(data);
                    var res =  $.parseJSON(data);
                	//alert(res.serverFileName+"-"+res.clientFileName+"-"+res.size);
                	$(".filelink").append("<p><span>"+res.clientFileName+"("+res.size+")</span><a href='#'>删除</a><input type='hidden' value='"+res.clientFileName+":"+res.serverFileName+":"+res.size+"' /></p>");
                },

                'onUploadError': function (file, errorCode, errorMsg, errorString) {//当单个文件上传出错时触发
                    alert('文件：' + file.name + ' 上传失败: ' + errorString);
                }
            });
        });
        
      function check(){
    	if($("#title").val()==""){
  			alert('公告名称不能为空！');
  			return;
  		}
  		if($("#content1").val()==""){
  			alert('公告内容不能为空！');
  			return;
  		}
    	
    	
    	var files = $(".filelink").find("input[type='hidden']"); 
    	var attachMent = "";
        files.each(function(){ 
        	if(attachMent==""){
        		attachMent = $(this).val();
        	}else{
        		attachMent = attachMent+","+$(this).val();
        	}
        });
        
        $("#attachMent").val(attachMent);
        
        $("#noticeForm").submit();
    	return;
      }   
    </script>
</body>
</html>
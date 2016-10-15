<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<script type="text/javascript">
  function fuck(str){
	  if(str=='输入企业名称搜索'){
		  str='';
	  }
	  location.href="/adminindex?searchCp="+str;
	  return;
  }
  
  function urlEncode(param){
	 return encodeURI(url);
  }
</script>
<div class="easyui-layout" data-options="fit:true">
<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="1"/></jsp:include>
    
 </div>

</body>
</html>
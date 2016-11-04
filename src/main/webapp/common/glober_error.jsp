<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet" href="/css/bootstrap.min.css">  
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/scripts/jquery.easyui.min.js"></script>
<script type="text/javascript">
	var code = '${code}';
		print_s("[${desc}]",function(){history.go(-1);});
</script>

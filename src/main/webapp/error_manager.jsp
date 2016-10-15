<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script type="text/javascript">
	var erroCodeNum = '${erroCodeNum}';
		alert("系统发生异常,请联系管理员，错误码:["+erroCodeNum+"]");
		history.go(-1);
</script>

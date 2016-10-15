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
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>检查统计</span></p>
    		</div>
    		<div>
				<table class="table1 table3" width="100%" oncontextmenu='return false' ondragstart='return false'>
					<tr class="t1top">
						<td colspan="8" style="text-align: right;">
						<input type="text" id="searchCp" name="searchCp" value="<c:if test="${not empty searchCp}">${searchCp}</c:if><c:if test="${empty searchCp}">输入企业名称搜索</c:if>" onfocus="if(this.value==this.defaultValue){this.value=''}" onblur="if(this.value==''){this.value=this.defaultValue}">
						<a href="#" onClick="fuck(document.getElementById('searchCp').value)"><span></span></a>
						</td>
					</tr>
					<tr>
						<th width="10%">企业名称</th>
						<th width="10%">最近检查日期</th>
						<th width="10%">检查项</th>
						<th width="10%">检查人员</th>
						<th width="7%">最近执法日期</th>
						<th width="10%">执法文书照片</th>
						<th width="10%">执法人员</th>
						<th width="10%">操作</th>
					</tr>
					<s:iterator var="data" value="dataList">
					<tr>
						<td>${data.cpName}</td>
						<td><fmt:formatDate value="${data.checkRecord.checkTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td><c:set value="1" var="i" /><c:forEach items="${data.itemsNames}" var="it"><c:if test="${i==1}">${it}</c:if><c:if test="${i>1}">，${it}</c:if><c:set value="${i+1}" var="i" /></c:forEach></td>
						<td>${data.checkRecord.checkerName}</td>
						<td><fmt:formatDate value="${data.enforceRecord.enforceTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td>
							<c:if test="${not empty data.enforceRecord.resource1Names}">
							<c:set value="${fn:split(data.enforceRecord.resource1Names, ',')}" var="pics" />
							<c:forEach items="${pics}" var="s">
								<a href="/uploads/${s}" data-lightbox="example-set" title="执法图片"><img src="/uploads/${s}" /></a>			
							</c:forEach>
							</c:if>
                        </td>
						<td>${data.enforceRecord.enforceName}</td>
						<td><a href="/checkRecordList?cpName=<en:urlEncode key="${data.cpName}"/>&indexPage=0&pageSize=10" >详情>></a></td>
					</tr>
					</s:iterator>
				</table>
				<div class="page cb">
				     <aldtags:pageTag para1="searchCp" value1="${searchCp}"/>
				</div>

    		</div>
    </div>
 </div>

</body>
</html>
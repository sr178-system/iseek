<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<script type="text/javascript">
  function fuck(str){
	  if(str=='输入执法人员姓名搜索'){
		  str='';
	  }
	  location.href="/jcdc?searchUn="+str;
	  return;
  }
</script>
<div class="easyui-layout" data-options="fit:true">
<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="2"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>检查督查</span></p>
    		</div>
    		<div>
				<table class="table1 table3" width="100%" oncontextmenu='return false' ondragstart='return false'>
					<tr class="t1top">
						<td colspan="9" style="text-align: right;">
						<input type="text" id="searchUn" name="searchUn" value="<c:if test="${not empty searchUn}">${searchUn}</c:if><c:if test="${empty searchUn}">输入执法人员姓名搜索 </c:if>" onfocus="if(this.value==this.defaultValue){this.value=''}" onblur="if(this.value==''){this.value=this.defaultValue}">
						<a href="#" onClick="fuck(document.getElementById('searchUn').value)"><span></span></a>
						</td>
					</tr>
					<tr>
						<th width="10%">执法人员登录名</th>
						<th width="10%">执法人员姓名</th>
						<th width="10%">最近检查日期</th>
						<th width="10%">被检查企业</th>
						<th width="7%">签到照片</th>
						<th width="10%">最近执法日期</th>
						<th width="10%">被执法企业</th>
						<th width="20%">执法文书照片</th>
						<th width="10%">操作</th>
					</tr>
					<s:iterator var="data" value="dataList">
					<tr>
						<td>${data.userName}</td>
						<td>${data.enforceRecord.enforceName}</td>
						<td><fmt:formatDate value="${data.checkRecord.checkTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td>${data.checkRecord.cpName}</td>
						<td>
							<c:if test="${not empty data.checkRecord.resource1Names}">
							<c:set value="${fn:split(data.checkRecord.resource1Names, ',')}" var="pics" />
							<c:forEach items="${pics}" var="s">
								<a href="/uploads/${s}" data-lightbox="example-set" title="签到图片"><img src="/uploads/${s}" /></a>			
							</c:forEach>
							</c:if>
                        </td>
						<td><fmt:formatDate value="${data.enforceRecord.enforceTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td>${data.enforceRecord.cpName}</td>
						<td>
							<c:if test="${not empty data.enforceRecord.resource1Names}">
							<c:set value="${fn:split(data.enforceRecord.resource1Names, ',')}" var="pics" />
							<c:forEach items="${pics}" var="s">
								<a href="/uploads/${s}" data-lightbox="example-set" title="执法图片"><img src="/uploads/${s}" /></a>			
							</c:forEach>
							</c:if>
                        </td>
						<td><a href="enforceRecordList?efUserName=${data.userName}&indexPage=0&pageSize=10">详情>></a></td>
					</tr>
					</s:iterator>
				</table>
				<div class="page cb">
				     <aldtags:pageTag para1="searchUn" value1="${searchUn}"/>
				</div>
    		</div>
    </div>
 </div>

</body>
</html>
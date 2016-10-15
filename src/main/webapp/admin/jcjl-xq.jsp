<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<div class="easyui-layout" data-options="fit:true">
<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="1"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    		 <p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>检查记录</span>><span>详情</span></p>
    		 <div class="jcjlxs" >
    		 	<a style="float: right;" href="javascript:;" id="dyhh" onclick="preview('printScale')">打印</a>		
    		 	<div id="printScale">
    		 	<h5>泸州市江阳区安全生产移动执法系统检查记录:</h5>
				<table class="table1 table9" oncontextmenu="return false" ondragstart="return false" style="table-layout: fixed;" width="950px">
					<tbody>
						<tr align="center">
							<td>检查日期</td>
							<td><fmt:formatDate value="${bean.checkRecord.checkTime}" type="both" pattern="yyyy.MM.dd"/></td>
							<td>被检查单位</td>
							<td>${bean.checkRecord.cpName}</td>
						</tr>
						<tr align="center">
							<td>检查类别</td>
							<td>${bean.checkRecord.checkItemName}</td>
							<td>检查人员</td>
							<td>${bean.checkRecord.checkerName}</td>
						</tr>
						<tr align="center">
							<td>现场负责人</td>
							<td>${bean.checkRecord.resPersonName}</td>
							<td>联系电话</td>
							<td>${bean.checkRecord.resPersonCall}</td>
						</tr>
						<tr align="center">
							<td>签到地点</td>
							<td><a href="#" onClick="openwindow('/admin/map.html?position=${bean.checkRecord.position}')">点击查看地图</a></td>
							<td>签到照片</td>
							<td>
							<c:if test="${not empty bean.checkRecord.resource1Names}">
											<c:set value="${fn:split(bean.checkRecord.resource1Names, ',')}"
												var="pics" />
											<c:forEach items="${pics}" var="s">
												<a href="/uploads/${s}" data-lightbox="example-set"
													title="签到图片"><img src="/uploads/${s}" /></a>
											</c:forEach>
										</c:if>
							</td>
						</tr>
						<tr align="center">
							<td>企业负责人签名照片</td>
							<td>
							   <c:if test="${not empty bean.checkRecord.resource3Names}">
											<c:set value="${fn:split(bean.checkRecord.resource3Names, ',')}"
												var="pics" />
											<c:forEach items="${pics}" var="s">
												<a href="/uploads/${s}" data-lightbox="example-set"
													title="签到图片"><img src="/uploads/${s}" /></a>
											</c:forEach>
										</c:if>
							</td>
							<td>陪同人员签名照片</td>
							<td>
								<c:if test="${not empty bean.checkRecord.resource4Names}">
											<c:set value="${fn:split(bean.checkRecord.resource4Names, ',')}"
												var="pics" />
											<c:forEach items="${pics}" var="s">
												<a href="/uploads/${s}" data-lightbox="example-set"
													title="签到图片"><img src="/uploads/${s}" /></a>
											</c:forEach>
										</c:if>
							</td>
						</tr>
						
					</tbody>
				</table>
    		 	<h5>检查详情:</h5>
				<table class="table1 table100"  oncontextmenu="return false" ondragstart="return false" style="table-layout: fixed;" width="950px">
					<tbody>
					<tr>
						<th width="160px">检查大项</th>
						<th width="150px">检查子项</th>
						<th width="115px">检查结果</th>
						<th width="210px">说明</th>
						<th width="210px">取证照片</th>
					</tr>
					<c:set var="first" value="0"></c:set>
					<c:set var="whileBigId" value="-1"></c:set>
					<s:iterator var="checkData" value="bean.checkDetails">
						<c:set var="curBigId" value="${checkData.checkBigId}"></c:set>
						<c:if test="${whileBigId!=curBigId}">
							     <c:set var="first" value="0"></c:set>
							     <c:set var="whileBigId" value="${checkData.checkBigId}"></c:set>
						</c:if>
						<tr align="center">
							<c:if test="${first==1}">
							  <td style="WORD-WRAP:break-word;" width="150px">${checkData.checkSmallTitle}</td>
							  <td style="WORD-WRAP:break-word;" width="115px">
							      ${checkData.result.resultList}
							  </td>
							  <td style="WORD-WRAP:break-word;display: block; border: none;" width="210px">${checkData.result.description}</td>
							  <td style="WORD-WRAP:break-word;" width="210px">
							       <c:forEach items="${checkData.result.resource}" var="s">
													<a href="/uploads/${s}" data-lightbox="example-set"
														title="检查照片"><img src="/uploads/${s}" /></a>
									</c:forEach>
							  </td>
							</c:if>
						    <c:if test="${first==0}">
							  <td rowspan="${checkData.secondSize}" style="WORD-WRAP:break-word;" width="160px">${checkData.checkBigTitle}</td><!-- rowspan="2" 项有几例，这个rowspan就是几 --> 
							  <td style="WORD-WRAP:break-word;" width="150px">${checkData.checkSmallTitle}</td>
							  <td style="WORD-WRAP:break-word;" width="115px">
							      ${checkData.result.resultList}
							  </td>
							  <td style="WORD-WRAP:break-word;display: block; border: none;" width="210px">${checkData.result.description}</td>
							  <td style="WORD-WRAP:break-word;" width="210px">
							       <c:forEach items="${checkData.result.resource}" var="s">
													<a href="/uploads/${s}" data-lightbox="example-set"
														title="检查照片"><img src="/uploads/${s}" /></a>
									</c:forEach>
							  </td>
							  <c:set var="first" value="1"></c:set>
							</c:if>
							
						    </tr>
					</s:iterator>
				</tbody></table>
				<c:if test="${not empty  bean.enforceList}">
    		 	<h5>执法文书:</h5>
    		 	<table class="table1 table100" oncontextmenu="return false" ondragstart="return false" style="table-layout: fixed;" width="950px">
					<tbody>
					<tr>
						<th width="200px">执法日期</th>
						<th width="250px">执法人员</th>
						<th width="500px">执法文书照片</th>
					</tr>
					<s:iterator var="data" value="bean.enforceList">
					<tr align="center">
						<td><fmt:formatDate value="${data.enforceTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td>${data.enforceName}</td>
						<td>
							<c:if test="${not empty data.resource1Names}">
							<c:set value="${fn:split(data.resource1Names, ',')}" var="pics" />
							<c:forEach items="${pics}" var="s">
								<a href="/uploads/${s}" data-lightbox="example-set" title="执法图片"><img src="/uploads/${s}" /></a>			
							</c:forEach>
							</c:if>
						</td>
					</tr>
					</s:iterator>
				</tbody></table>
				</c:if>
				</div>	
    		 </div>
    		</div>
    		<div class="form form1">
    		
    		</div>
    </div>
 </div>
<script type="text/javascript">
	function preview(myDiv){  
		var newstr = document.getElementById(myDiv).innerHTML;
	    var oldstr = document.body.innerHTML;
	    document.body.innerHTML = newstr;
	    window.print();
	    document.body.innerHTML = oldstr;
	}
</script>
  <SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
}
//-->
</SCRIPT>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<link rel="stylesheet" type="text/css" href="/scripts/jquery.datetimepicker.css"/>
<script src="/scripts/jquery.datetimepicker.js"></script>
<div class="easyui-layout" data-options="fit:true">
<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="1"/></jsp:include>
   <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><span>检查记录</span></p>
    		</div>
    		<div>
				<table class="table1 table2" width="100%" oncontextmenu='return false' ondragstart='return false'>
					<tr class="t1top">
						<td colspan="8">
							<div class="jrssubmit">
							    <form action="/admin/adminindex" method="post">
								起始日期：<input class="jrsdate" type="text" name="startDate" id="startDate" value="${startDate}"/>　
								终止日期：<input class="jrsdate" type="text" name="endDate" id="endDate" value="${endDate}"/>　
								单位名称：<input type="text" name="searchCp" value="${searchCp}"/>　
								检查人员：<input type="text" name="checkName" value="${checkName}"/>
								检查类别：<select name="checkId"><option value="">全部</option>
								<s:iterator var="bigItem" value="bigCheckList">
								   <option value="${bigItem.id}" <c:if test="${checkId==bigItem.id}">selected</c:if>>${bigItem.itemTitle}</option>
								</s:iterator>
								</select>　
								检查结果：<select name="checkResult"><option value="" <c:if test="${empty checkResult}">selected</c:if>>全部</option>
								<option value="1" <c:if test="${checkResult==1}">selected</c:if>>全部通过</option>
								<option value="0" <c:if test="${checkResult==0}">selected</c:if>>未全部通过</option>
								</select>　
								<button type="submit">查询</button>
								</form>
							</div>
						</td>
					</tr>
					<tr>                               　　　　　　　　　　　      
						<th width="12%">检查日期</th>
						<th width="12%">被检查单位名称</th>
						<th width="12%">检查类别</th>
						<th width="12%">检查人员</th>
						<th width="12%">检查结果</th>
						<th width="12%">现场负责人</th>
						<th width="12%">联系电话</th>
						<th width="8%">操作</th>
					</tr>
					<s:iterator var="data" value="dataList">
					<tr>
						<td><fmt:formatDate value="${data.checkTime}" type="both" pattern="yyyy.MM.dd"/></td>
						<td>${data.cpName}</td>
						<td>${data.checkItemName}</td>
						<td>${data.checkerName}</td>
						<td><c:if test="${data.passStatus==0}"><font class="red">未全部通过</font></c:if>
						   <c:if test="${data.passStatus==1}">全部通过</c:if>
						</td>
						<td>${data.resPersonName}</td>
						<td>${data.resPersonCall}</td>
						<td><a href="/admin/recordDetails?recordId=${data.id}">详情</a></td>
					</tr>
					</s:iterator>
				</table>
				<div class="page cb">
					 <aldtags:pageTag paraStr="startDate,${startDate},endDate,${endDate},searchCp,${searchCp},checkName,${checkName},checkId,${checkId},checkResult,${checkResult}"/>
				</div>

    		</div>
    </div>
 </div>

</body>
</html>
 <script type="text/javascript">
		$('#startDate').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
		$('#endDate').datetimepicker({
			yearOffset : 0,
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		//		minDate:'1970/01/01', // yesterday is minimum date
		//		maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});
	</script>
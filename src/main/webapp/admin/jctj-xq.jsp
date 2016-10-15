<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/admin/head.jsp"%>
<div class="easyui-layout" data-options="fit:true">

<jsp:include page="/admin/nav.jsp" flush="true"><jsp:param name="current" value="1"/></jsp:include>
    <div id="content" region="center">
    		<div class="crumb">
    			<p>您当前的位置：<a href="/admin/adminindex">首页</a>><a href="/admin/adminindex">检查统计</a>><span>详情</span></p>
    		</div>
    		<div class="detilym" oncontextmenu='return false' ondragstart='return false'>
    			<div class="dtitle">
    				企业名称：${cpName}
    			</div>
    			<div class="dlink">
    				<ul>
					<s:iterator var="data" value="list">
						<c:if test="${data.type==1}">
							<li>
								<div>
									<p>
										<b>检查日期：</b>
										<fmt:formatDate value="${data.times}" type="both"
											pattern="yyyy.MM.dd" />
									</p>
									<p>
										<b>检查项目：</b>${data.checkItemNames}</p>
									<p>
										<b>取证照片：</b>
									</p>
									<p>
										<c:if test="${not empty data.resource2Names}">
											<c:set value="${fn:split(data.resource2Names, ',')}"
												var="pics" />
											<c:forEach items="${pics}" var="s">
												<a href="/uploads/${s}" data-lightbox="example-set"
													title="取证图片"><img src="/uploads/${s}" /></a>
											</c:forEach>
										</c:if>
									</p>
									<p>
										<b>企业负责人签名照片：</b>
									</p>
									<p>
										<c:if test="${not empty data.resource3Names}">
											<c:set value="${fn:split(data.resource3Names, ',')}"
												var="pics" />
											<c:forEach items="${pics}" var="s">
												<a href="/uploads/${s}" data-lightbox="example-set"
													title="签字图片"><img src="/uploads/${s}" /></a>
											</c:forEach>
										</c:if>
									</p>
									<p>
										<b>检查人员：</b>${data.name}</p>
								</div>
							</li>
						</c:if>
						<c:if test="${data.type==2}">
							<li>
								<div>
									<p>
										<b>执法日期：</b>
										<fmt:formatDate value="${data.times}" type="both"
											pattern="yyyy.MM.dd" />
									</p>
									<p>
										<b>执法文书照片：</b>
									</p>
									<p>
										<c:if test="${not empty data.resource1Names}">
											<c:set value="${fn:split(data.resource1Names, ',')}"
												var="pics" />
											<c:forEach items="${pics}" var="s">
												<a href="/uploads/${s}" data-lightbox="example-set"
													title="执法文书图片"><img src="/uploads/${s}" /></a>
											</c:forEach>
										</c:if>
									</p>
									<p>
										<b>执法人员：</b>${data.name}</p>
								</div>
							</li>
						</c:if>
					</s:iterator>
				</ul>
    				<p>
    				<a class="mores" name="pos" href="#pos">点击加载更多▼</a>
    				</p>
    			</div>
    		</div>
    </div>
 </div>
<script type="text/javascript">
    var indexPage = ${indexPage};
	$(".mores").click(function(){
		$.get('/admin/checkListJson?cpName='+encodeURI('${cpName}')+'&indexPage='+(++indexPage)+"&pageSize=${pageSize}#pos",function(e){
			if(e.code!=0){
				alert('加载出错！');
				return;
			}
			if(e.list==null || e.list.length==0){
				alert('已全部加载完成！');
				return;
			}else{
				var html = "";
				for(var i in e.list){
					html = html +"<li><div>";
					var item = e.list[i];
					var times = new Date();
					times.setTime(item["timesc"]);
					if(item["type"]==1){
						html=html+"<p><b>检查日期：</b>";
						html=html+times.format("yyyy.MM.dd");//.fromat("yyyy.MM.dd");
						html=html+"</p>";
						html=html+"<p><b>检查项目：</b>";
						if(item["checkItemNames"]!=null){
							html=html+item["checkItemNames"];
						}
						html=html+"</p>";
						html=html+"<p><b>取证照片：</b></p><p>";
						if(item["resource2Names"]!=null&&item["resource2Names"]!=""){
							var pics = item["resource2Names"].split(",");
							for(var j in pics){
								html=html+"<a href=\"/uploads/"+pics[j]+"\" data-lightbox=\"example-set\" title=\"取证图片\"><img src=\"/uploads/"+pics[j]+"\" /></a>";
							}
						}
						html=html+"</p>";
						html=html+"<p><b>企业负责人签名照片：</b></p><p>";
						if(item["resource3Names"]!=null&&item["resource3Names"]!=""){
							var pics3 = item["resource3Names"].split(",");
							for(var j in pics3){
								html=html+"<a href=\"/uploads/"+pics3[j]+"\" data-lightbox=\"example-set\" title=\"签字图片\"><img src=\"/uploads/"+pics3[j]+"\" /></a>";
							}
						}
						html=html+"</p>";
						html=html+"<p><b>检查人员：</b>";
						html = html+item["name"];
						html=html+"</p>";
					}else if(item["type"]==2){
						html=html+"<p><b>执法日期：</b>";
						html=html+times.format("yyyy.MM.dd");
						html=html+"</p>";
						html=html+"<p><b>执法文书照片：</b></p><p>";
						if(item["resource1Names"]!=null&&item["resource1Names"]!=""){
							var pics = item["resource1Names"].split(",");
							for(var j in pics){
								html=html+"<a href=\"/uploads/"+pics[j]+"\" data-lightbox=\"example-set\" title=\"执法文书图片\"><img src=\"/uploads/"+pics[j]+"\" /></a>";
							}
						}
						html=html+"<p><b>执法人员：</b>";
						html = html+item["name"];
						html=html+"</p>";
					}
					html = html +"</li></div>";
				}
				$(".dlink ul").html($(".dlink ul").html()+html);
			}
		});
	});
	
	Date.prototype.format = function(format) {
	       var date = {
	              "M+": this.getMonth() + 1,
	              "d+": this.getDate(),
	              "h+": this.getHours(),
	              "m+": this.getMinutes(),
	              "s+": this.getSeconds(),
	              "q+": Math.floor((this.getMonth() + 3) / 3),
	              "S+": this.getMilliseconds()
	       };
	       if (/(y+)/i.test(format)) {
	              format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
	       }
	       for (var k in date) {
	              if (new RegExp("(" + k + ")").test(format)) {
	                     format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                            ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	              }
	       }
	       return format;
	}
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>入库统计</h2>
<form method="get" action="${pageContext.request.contextPath}/query/inStockStats">
<div class="filter-bar">
<div class="form-group"><label>统计维度</label><select name="type"><option value="year" ${type=='year'?'selected':''}>按年</option><option value="quarter" ${type=='quarter'?'selected':''}>按季度</option><option value="month" ${type=='month'?'selected':''}>按月</option></select></div>
<div class="form-group"><label>商品名称</label><input type="text" name="goodsName" value="${goodsName}"></div>
<div class="form-group"><label>商品分类</label><select name="categoryId"><option value="">全部</option><c:forEach items="${categoryList}" var="c"><option value="${c.categoryId}" ${c.categoryId==categoryId?'selected':''}>${c.categoryName}</option></c:forEach></select></div>
<div class="form-group"><label>开始时间</label><input type="date" name="startTime" value="${startTime}"></div>
<div class="form-group"><label>结束时间</label><input type="date" name="endTime" value="${endTime}"></div>
<button type="submit" class="btn btn-primary btn-sm">统计</button>
</div>
</form>
<div class="table-wrap mt-12"><table class="data-table">
<tr><th>时间周期</th><th>入库总量</th><th>入库总金额</th><th>记录数</th></tr>
<c:forEach items="${statsList}" var="s">
<tr><td>${s.period}</td><td>${s.total_quantity}</td><td>${s.total_amount}</td><td>${s.record_count}</td></tr>
</c:forEach>
<c:if test="${empty statsList}"><tr><td colspan="4" style="text-align:center;">暂无数据</td></tr></c:if>
</table></div>
</div>

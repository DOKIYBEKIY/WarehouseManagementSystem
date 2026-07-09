<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>入库记录查询</h2>
<form method="get" action="${pageContext.request.contextPath}/query/inStock">
<div class="filter-bar">
<div class="form-group"><label>商品名称</label><input type="text" name="goodsName" value="${goodsName}"></div>
<div class="form-group"><label>商品分类</label><select name="categoryId"><option value="">全部</option><c:forEach items="${categoryList}" var="c"><option value="${c.categoryId}" ${c.categoryId==categoryId?'selected':''}>${c.categoryName}</option></c:forEach></select></div>
<div class="form-group"><label>开始时间</label><input type="date" name="startTime" value="${startTime}"></div>
<div class="form-group"><label>结束时间</label><input type="date" name="endTime" value="${endTime}"></div>
<button type="submit" class="btn btn-primary btn-sm">查询</button>
</div>
</form>
<div class="table-wrap mt-12"><table class="data-table">
<tr><th>编号</th><th>商品名称</th><th>仓库</th><th>货主</th><th>数量</th><th>单价</th><th>总金额</th><th>操作员</th><th>入库时间</th></tr>
<c:forEach items="${inList}" var="s">
<tr><td>${s.inId}</td><td>${s.goodsName}</td><td>${s.warehouseName}</td><td>${s.ownerName}</td><td>${s.quantity}</td><td>${s.unitPrice}</td><td>${s.totalAmount}</td><td>${s.operatorName}</td><td>${s.inTime}</td></tr>
</c:forEach>
<c:if test="${empty inList}"><tr><td colspan="9" style="text-align:center;">暂无数据</td></tr></c:if>
</table></div>
</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>库存查询</h2>
<form method="get" action="${pageContext.request.contextPath}/query/inventory">
<div class="filter-bar">
<div class="form-group"><label>商品名称</label><input type="text" name="goodsName" value="${goodsName}"></div>
<div class="form-group"><label>货主名称</label><input type="text" name="ownerName" value="${ownerName}"></div>
<div class="form-group"><label>仓库</label><select name="warehouseId"><option value="">全部</option><c:forEach items="${warehouseList}" var="w"><option value="${w.warehouseId}" ${w.warehouseId==warehouseId?'selected':''}>${w.warehouseName}</option></c:forEach></select></div>
<button type="submit" class="btn btn-primary btn-sm">查询</button>
</div>
</form>
<div class="table-wrap mt-12"><table class="data-table">
<tr><th>编号</th><th>商品编码</th><th>商品名称</th><th>仓库</th><th>货主</th><th>库存数量</th><th>预警值</th><th>状态</th></tr>
<c:forEach items="${invList}" var="i">
<tr>
  <td>${i.inventoryId}</td><td>${i.goodsCode}</td><td>${i.goodsName}</td><td>${i.warehouseName}</td><td>${i.ownerName}</td><td>${i.quantity}</td><td>${i.warningQuantity}</td>
  <td><c:if test="${i.quantity <= i.warningQuantity}"><span class="tag tag-warn">库存不足</span></c:if><c:if test="${i.quantity > i.warningQuantity}"><span class="tag tag-on">正常</span></c:if></td>
</tr>
</c:forEach>
<c:if test="${empty invList}"><tr><td colspan="8" style="text-align:center;">暂无数据</td></tr></c:if>
</table></div>
</div>

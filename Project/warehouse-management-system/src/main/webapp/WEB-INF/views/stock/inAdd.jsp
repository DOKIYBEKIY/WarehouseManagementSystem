<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>货物入库登记</h2>
<form method="post" action="${pageContext.request.contextPath}/stock/in/save" class="mt-12">
<div class="form-group"><label>商品</label><select name="goodsId" required><option value="">请选择商品</option><c:forEach items="${goodsList}" var="g"><option value="${g.goodsId}">${g.goodsName} (${g.goodsCode})</option></c:forEach></select></div>
<div class="form-group"><label>仓库</label><select name="warehouseId" required><option value="">请选择仓库</option><c:forEach items="${warehouseList}" var="w"><option value="${w.warehouseId}">${w.warehouseName}</option></c:forEach></select></div>
<div class="form-group"><label>货主</label><select name="ownerId" required><option value="">请选择货主</option><c:forEach items="${ownerList}" var="o"><option value="${o.ownerId}">${o.ownerName}</option></c:forEach></select></div>
<div class="form-group"><label>入库数量</label><input type="number" name="quantity" min="1" required></div>
<div class="form-group"><label>入库单价</label><input type="number" step="0.01" name="unitPrice" required></div>
<div class="form-group"><label>备注</label><input type="text" name="remark"></div>
<button type="submit" class="btn btn-primary">保存</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/stock/in/list">返回</a>
</form>
</div>

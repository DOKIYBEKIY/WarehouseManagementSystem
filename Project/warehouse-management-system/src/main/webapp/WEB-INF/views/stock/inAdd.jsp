<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>货物入库登记</h2>
<br>

<form method="post" action="${pageContext.request.contextPath}/stock/in/save">

<p>商品：</p>
<select name="goodsId" required>
    <option value="">请选择商品</option>
    <c:forEach items="${goodsList}" var="g">
        <option value="${g.goodsId}">${g.goodsName} (${g.goodsCode}) - ￥${g.price}</option>
    </c:forEach>
</select>
<br><br>

<p>仓库：</p>
<select name="warehouseId" required>
    <option value="">请选择仓库</option>
    <c:forEach items="${warehouseList}" var="w">
        <option value="${w.warehouseId}">${w.warehouseName} (${w.warehouseCode})</option>
    </c:forEach>
</select>
<br><br>

<p>货主：</p>
<select name="ownerId" required>
    <option value="">请选择货主</option>
    <c:forEach items="${ownerList}" var="o">
        <option value="${o.ownerId}">${o.ownerName}</option>
    </c:forEach>
</select>
<br><br>

<p>入库数量：</p>
<input type="number" name="quantity" min="1" required>
<br><br>

<p>入库单价：</p>
<input type="number" step="0.01" name="unitPrice" required>
<br><br>

<p>备注：</p>
<input type="text" name="remark">
<br><br>

<button type="submit">保存</button>
<a href="${pageContext.request.contextPath}/stock/in/list"><button type="button">返回</button></a>

</form>

</div>

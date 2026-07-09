<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>库存查询</h2>
<br>

<form method="get" action="${pageContext.request.contextPath}/query/inventory">

<p>商品名称：</p>
<input type="text" name="goodsName" value="${goodsName}">

<p>货主名称：</p>
<input type="text" name="ownerName" value="${ownerName}">

<p>仓库：</p>
<select name="warehouseId">
    <option value="">全部</option>
    <c:forEach items="${warehouseList}" var="w">
        <option value="${w.warehouseId}" ${w.warehouseId==warehouseId?'selected':''}>${w.warehouseName}</option>
    </c:forEach>
</select>
<br><br>

<button type="submit">查询</button>

</form>

<br><br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>编号</th>
    <th>商品编码</th>
    <th>商品名称</th>
    <th>仓库</th>
    <th>货主</th>
    <th>库存数量</th>
    <th>预警值</th>
    <th>状态</th>
</tr>

<c:forEach items="${invList}" var="i">
<tr>
    <td>${i.inventoryId}</td>
    <td>${i.goodsCode}</td>
    <td>${i.goodsName}</td>
    <td>${i.warehouseName}</td>
    <td>${i.ownerName}</td>
    <td>${i.quantity}</td>
    <td>${i.warningQuantity}</td>
    <td>
        <c:if test="${i.quantity <= i.warningQuantity}">
            <span style="color:red;">库存不足</span>
        </c:if>
        <c:if test="${i.quantity > i.warningQuantity}">
            正常
        </c:if>
    </td>
</tr>
</c:forEach>

<c:if test="${empty invList}">
<tr><td colspan="8" align="center">暂无数据</td></tr>
</c:if>

</table>

</div>

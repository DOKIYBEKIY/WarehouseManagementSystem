<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>入库记录查询</h2>
<br>

<form method="get" action="${pageContext.request.contextPath}/query/inStock">

<p>商品名称：</p>
<input type="text" name="goodsName" value="${goodsName}">

<p>商品分类：</p>
<select name="categoryId">
    <option value="">全部</option>
    <c:forEach items="${categoryList}" var="c">
        <option value="${c.categoryId}" ${c.categoryId==categoryId?'selected':''}>${c.categoryName}</option>
    </c:forEach>
</select>

<p>开始时间：</p>
<input type="date" name="startTime" value="${startTime}">

<p>结束时间：</p>
<input type="date" name="endTime" value="${endTime}">
<br><br>

<button type="submit">查询</button>

</form>

<br><br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>编号</th>
    <th>商品名称</th>
    <th>仓库</th>
    <th>货主</th>
    <th>数量</th>
    <th>单价</th>
    <th>总金额</th>
    <th>操作员</th>
    <th>入库时间</th>
</tr>

<c:forEach items="${inList}" var="s">
<tr>
    <td>${s.inId}</td>
    <td>${s.goodsName}</td>
    <td>${s.warehouseName}</td>
    <td>${s.ownerName}</td>
    <td>${s.quantity}</td>
    <td>${s.unitPrice}</td>
    <td>${s.totalAmount}</td>
    <td>${s.operatorName}</td>
    <td>${s.inTime}</td>
</tr>
</c:forEach>

<c:if test="${empty inList}">
<tr><td colspan="9" align="center">暂无数据</td></tr>
</c:if>

</table>

</div>

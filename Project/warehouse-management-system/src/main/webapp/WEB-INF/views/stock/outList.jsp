<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>出库管理</h2>
<br>

<a href="${pageContext.request.contextPath}/stock/out/add">
<button>新增出库</button>
</a>

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
    <th>出库时间</th>
    <th>操作</th>
</tr>

<c:forEach items="${outList}" var="s">
<tr>
    <td>${s.outId}</td>
    <td>${s.goodsName}</td>
    <td>${s.warehouseName}</td>
    <td>${s.ownerName}</td>
    <td>${s.quantity}</td>
    <td>${s.unitPrice}</td>
    <td>${s.totalAmount}</td>
    <td>${s.operatorName}</td>
    <td>${s.outTime}</td>
    <td>
        <a href="${pageContext.request.contextPath}/stock/out/detail/${s.outId}">详情</a>
    </td>
</tr>
</c:forEach>

</table>

</div>

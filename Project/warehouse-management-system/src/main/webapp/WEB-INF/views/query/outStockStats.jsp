<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>出库统计</h2>
<br>

<form method="get" action="${pageContext.request.contextPath}/query/outStockStats">

<p>统计维度：</p>
<select name="type">
    <option value="year" ${type=='year'?'selected':''}>按年</option>
    <option value="quarter" ${type=='quarter'?'selected':''}>按季度</option>
    <option value="month" ${type=='month'?'selected':''}>按月</option>
</select>

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

<button type="submit">统计</button>

</form>

<br><br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>时间周期</th>
    <th>出库总量</th>
    <th>出库总金额</th>
    <th>记录数</th>
</tr>

<c:forEach items="${statsList}" var="s">
<tr>
    <td>${s.period}</td>
    <td>${s.total_quantity}</td>
    <td>${s.total_amount}</td>
    <td>${s.record_count}</td>
</tr>
</c:forEach>

<c:if test="${empty statsList}">
<tr><td colspan="4" align="center">暂无数据</td></tr>
</c:if>

</table>

</div>

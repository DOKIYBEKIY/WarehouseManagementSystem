<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>价格历史 - ${goodsName}</h2>
<br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>编号</th>
    <th>原价格</th>
    <th>新价格</th>
    <th>修改人</th>
    <th>修改时间</th>
</tr>

<c:forEach items="${historyList}" var="h">
<tr>
    <td>${h.historyId}</td>
    <td>${h.oldPrice}</td>
    <td>${h.newPrice}</td>
    <td>${h.updateUserName}</td>
    <td>${h.updateTime}</td>
</tr>
</c:forEach>

<c:if test="${empty historyList}">
<tr><td colspan="5" align="center">暂无价格变更记录</td></tr>
</c:if>

</table>

<br>
<a href="${pageContext.request.contextPath}/goods/list"><button>返回</button></a>

</div>
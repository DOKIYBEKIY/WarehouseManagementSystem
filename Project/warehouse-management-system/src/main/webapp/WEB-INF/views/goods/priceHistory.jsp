<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>价格历史 - ${goodsName}</h2>
<div class="table-wrap"><table class="data-table">
<tr><th>编号</th><th>原价格</th><th>新价格</th><th>修改人</th><th>修改时间</th></tr>
<c:forEach items="${historyList}" var="h">
<tr><td>${h.historyId}</td><td>${h.oldPrice}</td><td>${h.newPrice}</td><td>${h.updateUserName}</td><td>${h.updateTime}</td></tr>
</c:forEach>
<c:if test="${empty historyList}"><tr><td colspan="5" style="text-align:center;">暂无价格变更记录</td></tr></c:if>
</table></div>
<a class="btn btn-outline mt-12" href="${pageContext.request.contextPath}/goods/list">返回</a>
</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>入库管理</h2>
<a class="btn btn-primary mt-12" href="${pageContext.request.contextPath}/stock/in/add" style="display:inline-block;">新增入库</a>
<div class="table-wrap"><table class="data-table">
<tr><th>编号</th><th>商品名称</th><th>仓库</th><th>货主</th><th>数量</th><th>单价</th><th>总金额</th><th>操作员</th><th>入库时间</th><th>操作</th></tr>
<c:forEach items="${inList}" var="s">
<tr><td>${s.inId}</td><td>${s.goodsName}</td><td>${s.warehouseName}</td><td>${s.ownerName}</td><td>${s.quantity}</td><td>${s.unitPrice}</td><td>${s.totalAmount}</td><td>${s.operatorName}</td><td>${s.inTime}</td><td><a href="${pageContext.request.contextPath}/stock/in/detail/${s.inId}">详情</a></td></tr>
</c:forEach>
</table></div>
</div>

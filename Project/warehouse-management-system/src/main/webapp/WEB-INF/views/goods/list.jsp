<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>物资信息管理</h2>
<br>

<a href="${pageContext.request.contextPath}/goods/add"><button>新增物资</button></a>

<br><br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>编号</th>
    <th>物资编码</th>
    <th>物资名称</th>
    <th>分类</th>
    <th>规格</th>
    <th>单位</th>
    <th>价格</th>
    <th>状态</th>
    <th>操作</th>
</tr>

<c:forEach items="${goodsList}" var="g">
<tr>
    <td>${g.goodsId}</td>
    <td>${g.goodsCode}</td>
    <td>${g.goodsName}</td>
    <td>${g.categoryName}</td>
    <td>${g.specification}</td>
    <td>${g.unit}</td>
    <td>${g.price}</td>
    <td>
        <c:if test="${g.status==1}">正常</c:if>
        <c:if test="${g.status==0}">停用</c:if>
    </td>
    <td>
        <a href="${pageContext.request.contextPath}/goods/edit/${g.goodsId}">修改</a>
        &nbsp;
        <a href="${pageContext.request.contextPath}/goods/delete/${g.goodsId}"
           onclick="return confirm('确定删除吗？')">删除</a>
        &nbsp;
        <a href="${pageContext.request.contextPath}/goods/priceHistory/${g.goodsId}">价格历史</a>
    </td>
</tr>
</c:forEach>

</table>

</div>

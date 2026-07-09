<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>新增物资</h2>
<br>

<c:if test="${not empty error}">
    <p style="color:red;font-weight:bold;">${error}</p>
    <br>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/goods/save">

<p>物资编码：</p>
<input name="goodsCode">
<br><br>

<p>物资名称：</p>
<input name="goodsName">
<br><br>

<p>商品分类：</p>
<select name="categoryId">
    <option value="">请选择分类</option>
    <c:forEach items="${categoryList}" var="cat">
        <option value="${cat.categoryId}">${cat.categoryName}</option>
    </c:forEach>
</select>
<br><br>

<p>规格：</p>
<input name="specification">
<br><br>

<p>单位：</p>
<input name="unit">
<br><br>

<p>价格：</p>
<input name="price">
<br><br>

<button type="submit">保存</button>
<a href="${pageContext.request.contextPath}/goods/list"><button type="button">返回</button></a>

</form>

</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>修改商品分类</h2>
<br>

<c:if test="${not empty error}">
    <p style="color:red;font-weight:bold;">${error}</p>
    <br>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/category/update">

<input type="hidden" name="categoryId" value="${category.categoryId}">

<p>分类名称：</p>
<input type="text" name="categoryName" value="${category.categoryName}">
<br><br>

<p>描述：</p>
<textarea name="description">${category.description}</textarea>
<br><br>

<button type="submit">保存修改</button>
<a href="${pageContext.request.contextPath}/category/list"><button type="button">返回</button></a>

</form>

</div>

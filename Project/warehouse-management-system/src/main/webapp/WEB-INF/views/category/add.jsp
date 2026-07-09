<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>新增商品分类</h2>
<br>

<c:if test="${not empty error}">
    <p style="color:red;font-weight:bold;">${error}</p>
    <br>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/category/save">

<p>分类名称：</p>
<input type="text" name="categoryName" required>
<br><br>

<p>描述：</p>
<textarea name="description"></textarea>
<br><br>

<button type="submit">保存</button>
<a href="${pageContext.request.contextPath}/category/list"><button type="button">返回</button></a>

</form>

</div>

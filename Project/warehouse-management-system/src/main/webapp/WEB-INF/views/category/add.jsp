<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>新增商品分类</h2>
<form method="post" action="${pageContext.request.contextPath}/category/save" class="mt-12">
<div class="form-group"><label>分类名称</label><input type="text" name="categoryName" required></div>
<div class="form-group"><label>描述</label><textarea name="description"></textarea></div>
<button type="submit" class="btn btn-primary">保存</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/category/list">返回</a>
</form>
</div>

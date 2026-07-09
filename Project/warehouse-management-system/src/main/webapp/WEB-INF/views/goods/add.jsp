<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>新增物资</h2>
<form method="post" action="${pageContext.request.contextPath}/goods/save" class="mt-12">
<div class="form-group"><label>物资编码</label><input name="goodsCode"></div>
<div class="form-group"><label>物资名称</label><input name="goodsName"></div>
<div class="form-group"><label>商品分类</label><select name="categoryId"><option value="">请选择分类</option><c:forEach items="${categoryList}" var="cat"><option value="${cat.categoryId}">${cat.categoryName}</option></c:forEach></select></div>
<div class="form-group"><label>规格</label><input name="specification"></div>
<div class="form-group"><label>单位</label><input name="unit"></div>
<div class="form-group"><label>价格</label><input name="price"></div>
<button type="submit" class="btn btn-primary">保存</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/goods/list">返回</a>
</form>
</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>修改物资</h2>
<form method="post" action="${pageContext.request.contextPath}/goods/update" class="mt-12">
<input type="hidden" name="goodsId" value="${goods.goodsId}">
<div class="form-group"><label>物资编码</label><input name="goodsCode" value="${goods.goodsCode}" readonly></div>
<div class="form-group"><label>物资名称</label><input name="goodsName" value="${goods.goodsName}"></div>
<div class="form-group"><label>商品分类</label><select name="categoryId"><c:forEach items="${categoryList}" var="cat"><option value="${cat.categoryId}" ${cat.categoryId==goods.categoryId?'selected':''}>${cat.categoryName}</option></c:forEach></select></div>
<div class="form-group"><label>规格</label><input name="specification" value="${goods.specification}"></div>
<div class="form-group"><label>单位</label><input name="unit" value="${goods.unit}"></div>
<div class="form-group"><label>价格</label><input name="price" value="${goods.price}"></div>
<div class="form-group"><label>状态</label><select name="status"><option value="1" ${goods.status==1?'selected':''}>启用</option><option value="0" ${goods.status==0?'selected':''}>停用</option></select></div>
<button type="submit" class="btn btn-primary">保存修改</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/goods/list">返回</a>
</form>
</div>

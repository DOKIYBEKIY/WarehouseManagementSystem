<%@ page contentType="text/html;charset=UTF-8" %>
<div class="card">
<h2>修改货主</h2>
<form method="post" action="${pageContext.request.contextPath}/owner/update" class="mt-12">
<input type="hidden" name="ownerId" value="${owner.ownerId}">
<div class="form-group"><label>货主名称</label><input type="text" name="ownerName" value="${owner.ownerName}" required></div>
<div class="form-group"><label>联系电话</label><input type="text" name="phone" value="${owner.phone}"></div>
<div class="form-group"><label>邮箱</label><input type="text" name="email" value="${owner.email}"></div>
<div class="form-group"><label>联系地址</label><input type="text" name="address" value="${owner.address}"></div>
<div class="form-group"><label>备注</label><input type="text" name="remark" value="${owner.remark}"></div>
<button type="submit" class="btn btn-primary">保存修改</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/owner/list">返回</a>
</form>
</div>

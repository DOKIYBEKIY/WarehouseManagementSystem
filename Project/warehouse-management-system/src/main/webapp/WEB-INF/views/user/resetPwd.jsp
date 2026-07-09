<%@ page contentType="text/html;charset=UTF-8" %>
<div class="card">
<h2>重置密码</h2>
<form method="post" action="${pageContext.request.contextPath}/user/resetPwd" class="mt-12">
<input type="hidden" name="userId" value="${userId}">
<div class="form-group"><label>新密码</label><input type="password" name="newPassword" required></div>
<button type="submit" class="btn btn-primary">保存</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/user/list">返回</a>
</form>
</div>

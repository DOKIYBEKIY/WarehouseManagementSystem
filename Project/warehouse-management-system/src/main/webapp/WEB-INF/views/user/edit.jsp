<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>修改用户</h2>
<form method="post" action="${pageContext.request.contextPath}/user/update" class="mt-12">
<input type="hidden" name="userId" value="${user.userId}">
<div class="form-group"><label>登录账号</label><input type="text" value="${user.username}" readonly></div>
<div class="form-group"><label>真实姓名</label><input type="text" name="realName" value="${user.realName}" required></div>
<div class="form-group"><label>手机号</label><input type="text" name="phone" value="${user.phone}"></div>
<div class="form-group"><label>邮箱</label><input type="text" name="email" value="${user.email}"></div>
<div class="form-group"><label>角色</label><select name="roleId" required><c:forEach items="${roleList}" var="r"><option value="${r.roleId}" ${r.roleId==user.roleId?'selected':''}>${r.roleName}</option></c:forEach></select></div>
<button type="submit" class="btn btn-primary">保存修改</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/user/list">返回</a>
</form>
</div>

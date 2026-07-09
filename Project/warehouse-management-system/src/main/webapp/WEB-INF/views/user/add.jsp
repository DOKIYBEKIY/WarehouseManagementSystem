<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>新增用户</h2>
<form method="post" action="${pageContext.request.contextPath}/user/save" class="mt-12">
<div class="form-group"><label>登录账号</label><input type="text" name="username" required></div>
<div class="form-group"><label>登录密码</label><input type="password" name="password" required></div>
<div class="form-group"><label>真实姓名</label><input type="text" name="realName" required></div>
<div class="form-group"><label>手机号</label><input type="text" name="phone"></div>
<div class="form-group"><label>邮箱</label><input type="text" name="email"></div>
<div class="form-group"><label>角色</label><select name="roleId" required><option value="">请选择角色</option><c:forEach items="${roleList}" var="r"><option value="${r.roleId}">${r.roleName}</option></c:forEach></select></div>
<button type="submit" class="btn btn-primary">保存</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/user/list">返回</a>
</form>
</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>新增用户</h2>
<br>

<form method="post" action="${pageContext.request.contextPath}/user/save">

<p>登录账号：</p>
<input type="text" name="username" required>
<br><br>

<p>登录密码：</p>
<input type="password" name="password" required>
<br><br>

<p>真实姓名：</p>
<input type="text" name="realName" required>
<br><br>

<p>手机号：</p>
<input type="text" name="phone">
<br><br>

<p>邮箱：</p>
<input type="text" name="email">
<br><br>

<p>角色：</p>
<select name="roleId" required>
    <option value="">请选择角色</option>
    <c:forEach items="${roleList}" var="r">
        <option value="${r.roleId}">${r.roleName}</option>
    </c:forEach>
</select>
<br><br>

<button type="submit">保存</button>
<a href="${pageContext.request.contextPath}/user/list"><button type="button">返回</button></a>

</form>

</div>

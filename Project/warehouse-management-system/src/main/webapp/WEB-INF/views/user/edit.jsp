<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>修改用户</h2>
<br>

<form method="post" action="${pageContext.request.contextPath}/user/update">

<input type="hidden" name="userId" value="${user.userId}">

<p>登录账号：</p>
<input type="text" value="${user.username}" readonly>
<br><br>

<p>真实姓名：</p>
<input type="text" name="realName" value="${user.realName}" required>
<br><br>

<p>手机号：</p>
<input type="text" name="phone" value="${user.phone}">
<br><br>

<p>邮箱：</p>
<input type="text" name="email" value="${user.email}">
<br><br>

<p>角色：</p>
<select name="roleId" required>
    <c:forEach items="${roleList}" var="r">
        <option value="${r.roleId}" ${r.roleId==user.roleId?'selected':''}>${r.roleName}</option>
    </c:forEach>
</select>
<br><br>

<button type="submit">保存修改</button>
<a href="${pageContext.request.contextPath}/user/list"><button type="button">返回</button></a>

</form>

</div>

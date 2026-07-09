<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>用户管理</h2>
<br>

<a href="${pageContext.request.contextPath}/user/add">
<button>新增用户</button>
</a>

<br><br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>编号</th>
    <th>登录账号</th>
    <th>真实姓名</th>
    <th>手机号</th>
    <th>邮箱</th>
    <th>角色ID</th>
    <th>状态</th>
    <th>操作</th>
</tr>

<c:forEach items="${userList}" var="u">
<tr>
    <td>${u.userId}</td>
    <td>${u.username}</td>
    <td>${u.realName}</td>
    <td>${u.phone}</td>
    <td>${u.email}</td>
    <td>
        <c:if test="${u.roleId==1}">系统管理员</c:if>
        <c:if test="${u.roleId==2}">仓库管理员</c:if>
        <c:if test="${u.roleId==3}">统计员</c:if>
    </td>
    <td>
        <c:if test="${u.status==1}">正常</c:if>
        <c:if test="${u.status==0}">停用</c:if>
    </td>
    <td>
        <a href="${pageContext.request.contextPath}/user/edit/${u.userId}">修改</a>
        &nbsp;
        <a href="${pageContext.request.contextPath}/user/resetPwd/${u.userId}">重置密码</a>
        &nbsp;
        <a href="${pageContext.request.contextPath}/user/delete/${u.userId}"
           onclick="return confirm('确定删除吗？')">删除</a>
    </td>
</tr>
</c:forEach>

</table>

</div>

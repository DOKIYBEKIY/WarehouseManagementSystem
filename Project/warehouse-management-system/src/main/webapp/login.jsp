<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>仓库物资管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
</head>
<body>

<div class="login-container">

<div class="system-title">
<h1>仓库物资管理系统</h1>
<p>Warehouse Management System</p>
</div>

<c:if test="${not empty error}">
<div class="login-error">${error}</div>
</c:if>

<div class="login-box">
<h2>用户登录</h2>

<form action="${pageContext.request.contextPath}/login" method="post">

<div class="input-group">
<label>账号</label>
<input type="text" name="username" placeholder="请输入用户名" required>
</div>

<div class="input-group">
<label>密码</label>
<input type="password" name="password" placeholder="请输入密码" required>
</div>

<button class="login-btn" type="submit">登录</button>

</form>

</div>

<div class="footer">&copy; 2026 Warehouse Management System</div>

</div>

</body>
</html>

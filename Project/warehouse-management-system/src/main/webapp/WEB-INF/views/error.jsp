<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>权限不足</title>
<style>
body{font-family:"Microsoft YaHei",sans-serif;background:#1a1a2e;display:flex;justify-content:center;align-items:center;min-height:100vh;margin:0;}
.card{background:#fff;padding:48px 60px;border-radius:12px;box-shadow:0 8px 32px rgba(0,0,0,.3);text-align:center;max-width:420px;}
.card h1{font-size:72px;margin:0;color:#e74c3c;}
.card h2{color:#333;margin:16px 0 8px;}
.card p{color:#666;margin:8px 0 24px;}
.card a.btn{display:inline-block;padding:10px 28px;background:#3498db;color:#fff;text-decoration:none;border-radius:6px;font-size:14px;transition:background .2s;}
.card a.btn:hover{background:#2980b9;}
</style>
</head>
<body>
<div class="card">
<h1>403</h1>
<h2>权限不足</h2>
<p>您没有访问该功能的权限</p>
<a class="btn" href="${pageContext.request.contextPath}/login.jsp">返回登录</a>
</div>
</body>
</html>

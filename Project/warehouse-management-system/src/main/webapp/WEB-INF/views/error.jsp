<%@ page contentType="text/html;charset=UTF-8" %>


<html>

<head>

<title>
权限不足
</title>


<style>

body{

font-family:"Microsoft YaHei";

background:#f5f6fa;

text-align:center;

padding-top:100px;

}


.box{

background:white;

width:400px;

margin:auto;

padding:40px;

border-radius:15px;

box-shadow:0 5px 20px #ccc;

}


</style>


</head>


<body>


<div class="box">


<h1>
403
</h1>


<h2>
权限不足
</h2>


<p>
您没有访问该功能的权限
</p>


<a href="${pageContext.request.contextPath}/login.jsp">
返回登录
</a>


</div>


</body>


</html>
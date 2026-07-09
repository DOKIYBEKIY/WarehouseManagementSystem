<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>${title}</title>

<style>

*{margin:0;padding:0;box-sizing:border-box;}

body{font-family:"Microsoft YaHei";background:#f5f6fa;}

.container{display:flex;height:100vh;}

.sidebar{width:240px;background:#263445;color:white;padding:25px 15px;}

.logo{font-size:22px;font-weight:bold;padding:15px;margin-bottom:25px;}

.menu a{
    display:block;
    padding:13px 18px;
    margin-bottom:8px;
    color:#ddd;
    text-decoration:none;
    border-radius:8px;
}

.menu a:hover{background:#34495e;color:white;}

.menu .active{background:#667eea;color:white;}

.main{flex:1;}

.header{
    height:70px;
    background:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 30px;
    box-shadow:0 2px 10px #ddd;
}

.user-box{display:flex;align-items:center;gap:20px;}

.username{background:#f1f3f8;padding:8px 15px;border-radius:20px;}

.logout{color:#e74c3c;text-decoration:none;}
.logout:hover{text-decoration:underline;}

.content{padding:30px;}

.card{
    background:white;
    border-radius:15px;
    padding:30px;
    box-shadow:0 5px 20px #ddd;
}

</style>
</head>

<body>

<div class="container">

<div class="sidebar">
<div class="logo">仓库管理系统</div>

<div class="menu">

<!-- ========== 管理员 ========== -->
<c:if test="${user.roleId==1}">

<a class="${active=='category'?'active':''}" href="${pageContext.request.contextPath}/category/list">商品分类管理</a>
<a class="${active=='goods'?'active':''}" href="${pageContext.request.contextPath}/goods/list">物资信息管理</a>
<a class="${active=='warehouse'?'active':''}" href="${pageContext.request.contextPath}/warehouse/manage/list">仓库管理</a>
<a class="${active=='owner'?'active':''}" href="${pageContext.request.contextPath}/owner/list">货主管理</a>
<a class="${active=='user'?'active':''}" href="${pageContext.request.contextPath}/user/list">用户管理</a>
<a class="${active=='inStock'?'active':''}" href="${pageContext.request.contextPath}/stock/in/list">入库管理</a>
<a class="${active=='outStock'?'active':''}" href="${pageContext.request.contextPath}/stock/out/list">出库管理</a>
<a class="${active=='inventory'?'active':''}" href="${pageContext.request.contextPath}/query/inventory">库存查询</a>
<a class="${active=='inStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/inStock">入库记录</a>
<a class="${active=='outStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/outStock">出库记录</a>
<a class="${active=='inStockStats'?'active':''}" href="${pageContext.request.contextPath}/query/inStockStats">统计分析</a>

</c:if>

<!-- ========== 仓库管理员 ========== -->
<c:if test="${user.roleId==2}">

<a class="${active=='goods'?'active':''}" href="${pageContext.request.contextPath}/goods/list">物资查询</a>
<a class="${active=='warehouse'?'active':''}" href="${pageContext.request.contextPath}/warehouse/manage/list">仓库管理</a>
<a class="${active=='inStock'?'active':''}" href="${pageContext.request.contextPath}/stock/in/list">货物入库</a>
<a class="${active=='outStock'?'active':''}" href="${pageContext.request.contextPath}/stock/out/list">货物出库</a>
<a class="${active=='inventory'?'active':''}" href="${pageContext.request.contextPath}/query/inventory">库存查询</a>
<a class="${active=='warning'?'active':''}" href="${pageContext.request.contextPath}/query/warning">库存预警</a>
<a class="${active=='inStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/inStock">入库记录</a>
<a class="${active=='outStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/outStock">出库记录</a>

</c:if>

<!-- ========== 查询员 ========== -->
<c:if test="${user.roleId==3}">

<a class="${active=='inventory'?'active':''}" href="${pageContext.request.contextPath}/query/inventory">库存查询</a>
<a class="${active=='warning'?'active':''}" href="${pageContext.request.contextPath}/query/warning">库存预警</a>
<a class="${active=='inStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/inStock">入库记录</a>
<a class="${active=='outStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/outStock">出库记录</a>
<a class="${active=='inStockStats'?'active':''}" href="${pageContext.request.contextPath}/query/inStockStats">入库统计</a>
<a class="${active=='outStockStats'?'active':''}" href="${pageContext.request.contextPath}/query/outStockStats">出库统计</a>

</c:if>

</div>
</div>

<div class="main">
<div class="header">
<h2>${title}</h2>
<div class="user-box">
<div class="username">${user.username}</div>
<a class="logout" href="${pageContext.request.contextPath}/logout">退出登录</a>
</div>
</div>

<div class="content">
<jsp:include page="${contentPage}"/>
</div>
</div>

</div>

</body>
</html>

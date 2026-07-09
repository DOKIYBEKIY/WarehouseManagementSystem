<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

<title>${title}</title>


<style>


*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}


body{

    font-family:"Microsoft YaHei";

    background:#f5f6fa;

}


/*整体*/

.container{

    display:flex;

    height:100vh;

}



/*侧边栏*/

.sidebar{

    width:240px;

    background:#263445;

    color:white;

    padding:25px 15px;

}



.logo{

    font-size:22px;

    font-weight:bold;

    padding:15px;

    margin-bottom:25px;

}



/*菜单*/


.menu a{

    display:block;

    padding:13px 18px;

    margin-bottom:8px;

    color:#ddd;

    text-decoration:none;

    border-radius:8px;

}



.menu a:hover{

    background:#34495e;

    color:white;

}



.menu .active{

    background:#667eea;

    color:white;

}




/*右侧*/


.main{

    flex:1;

}



/*顶部*/


.header{

    height:70px;

    background:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 30px;

    box-shadow:0 2px 10px #ddd;

}



/*用户区域*/


.user-box{

    display:flex;

    align-items:center;

    gap:20px;

}



.username{

    background:#f1f3f8;

    padding:8px 15px;

    border-radius:20px;

}



.logout{

    color:#e74c3c;

    text-decoration:none;

}



.logout:hover{

    text-decoration:underline;

}



/*内容*/


.content{

    padding:30px;

}



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



<!-- 左侧 -->


<div class="sidebar">


<div class="logo">

仓库管理系统

</div>


<div class="menu">


<!-- =================管理员菜单================= -->

<c:if test="${user.roleId==1}">


<a href="${pageContext.request.contextPath}/category/list">
商品分类管理
</a>


<a href="${pageContext.request.contextPath}/goods/list">
物资信息管理
</a>


<a href="#">
仓库管理
</a>


<a href="#">
用户管理
</a>


<a href="#">
入库管理
</a>


<a href="#">
出库管理
</a>


<a href="#">
统计分析
</a>


</c:if>




<!-- =================仓库管理员菜单================= -->

<c:if test="${user.roleId==2}">


<a href="${pageContext.request.contextPath}/goods/list">
物资查询
</a>


<a href="#">
货物入库
</a>


<a href="#">
货物出库
</a>


<a href="#">
库存查询
</a>


<a href="#">
库存预警
</a>


</c:if>




<!-- =================查询员菜单================= -->

<c:if test="${user.roleId==3}">


<a href="${pageContext.request.contextPath}/goods/list">
商品查询
</a>


<a href="#">
库存查询
</a>


<a href="#">
出入库记录
</a>


<a href="#">
统计分析
</a>


</c:if>


</div>


</div>





<!-- 右侧 -->


<div class="main">


<div class="header">


<h2>

${title}

</h2>



<div class="user-box">


<div class="username">

👤 ${user.username}

</div>


<a class="logout"
href="${pageContext.request.contextPath}/logout">

退出登录

</a>


</div>


</div>



<div class="content">


<jsp:include page="${contentPage}"/>


</div>


</div>



</div>


</body>


</html>
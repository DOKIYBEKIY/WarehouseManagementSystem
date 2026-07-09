<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html>

<head>

<title>管理员控制中心</title>


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}


body{

    font-family:"Microsoft YaHei";

    background:#f4f6f9;

}


/*整体布局*/

.container{

    display:flex;

    height:100vh;

}



/*左侧菜单*/

.sidebar{

    width:240px;

    background:#2c3e50;

    color:white;

    padding:30px 20px;

}


.logo{

    font-size:22px;

    font-weight:bold;

    margin-bottom:40px;

}



.menu a{

    display:block;

    color:white;

    text-decoration:none;

    padding:14px;

    margin-bottom:10px;

    border-radius:8px;

}


.menu a:hover{

    background:#34495e;

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



.content{

    padding:30px;

}


.card{

    background:white;

    padding:30px;

    border-radius:15px;

    box-shadow:0 5px 20px #ddd;

}



</style>


</head>



<body>


<div class="container">


<!-- 左侧菜单 -->

<div class="sidebar">


<div class="logo">

仓库管理系统

</div>



<div class="menu">


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


</div>


</div>





<!-- 主区域 -->


<div class="main">


<div class="header">


<h2>
管理员中心
</h2>


<div>

当前用户：
<b>${user.username}</b>


&nbsp;&nbsp;


<a href="${pageContext.request.contextPath}/logout">

退出登录

</a>


</div>


</div>





<div class="content">


<div class="card">


<h2>
欢迎使用仓库物资管理系统
</h2>


<br>


<p>
管理员拥有系统全部管理权限。
</p>


<br>


<p>
当前已开放：
商品分类管理、物资信息管理
</p>



</div>


</div>


</div>



</div>


</body>


</html>
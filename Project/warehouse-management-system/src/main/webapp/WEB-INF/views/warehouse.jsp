<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>

<html>


<head>

<title>仓库管理员中心</title>


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



.container{

display:flex;

height:100vh;

}



.sidebar{

width:230px;

background:#1abc9c;

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

background:#16a085;

}



.main{

flex:1;

}



.header{

height:70px;

background:white;

padding:0 30px;

display:flex;

justify-content:space-between;

align-items:center;

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



<div class="sidebar">


<div class="logo">

仓库管理

</div>


<div class="menu">


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



</div>


</div>




<div class="main">


<div class="header">


<h2>
仓库管理员中心
</h2>


<div>

当前用户：
<b>${user.username}</b>


&nbsp;&nbsp;


<a href="${pageContext.request.contextPath}/logout">

退出

</a>


</div>


</div>



<div class="content">


<div class="card">


<h2>
欢迎回来
</h2>


<br>


<p>
您可以进行货物入库、出库以及库存管理操作。
</p>


</div>


</div>



</div>


</div>



</body>


</html>
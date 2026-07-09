<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>

<html>


<head>

<title>查询统计中心</title>


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

background:#34495e;

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

background:#2c3e50;

}


.main{

flex:1;

}



.header{

height:70px;

background:white;

display:flex;

justify-content:space-between;

align-items:center;

padding:0 30px;

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

查询统计

</div>



<div class="menu">


<a href="#">

货物查询

</a>


<a href="#">

出入库查询

</a>


<a href="#">

统计分析

</a>


</div>


</div>




<div class="main">


<div class="header">


<h2>
查询统计中心
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
欢迎使用查询系统
</h2>


<br>


<p>
您可以查询库存信息以及出入库记录。
</p>


</div>


</div>



</div>


</div>


</body>


</html>
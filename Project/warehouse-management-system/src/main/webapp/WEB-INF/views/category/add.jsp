<%@ page contentType="text/html;charset=UTF-8" %>


<html>

<head>

<title>
新增分类
</title>

</head>


<body>


<h2>
新增商品分类
</h2>


<form method="post"
action="${pageContext.request.contextPath}/category/add">


分类名称：

<input type="text"
name="categoryName">


<br><br>


分类描述：

<input type="text"
name="description">


<br><br>


<button type="submit">

保存

</button>


</form>


</body>


</html>
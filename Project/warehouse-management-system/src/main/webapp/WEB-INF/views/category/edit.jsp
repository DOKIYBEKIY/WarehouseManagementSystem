<%@ page contentType="text/html;charset=UTF-8" %>


<div class="card">


<h2>
修改商品分类
</h2>



<form method="post"
action="${pageContext.request.contextPath}/category/update">



<input type="hidden"
name="categoryId"
value="${category.categoryId}">



<p>
分类名称：
</p>


<input
type="text"
name="categoryName"
value="${category.categoryName}">



<br><br>


<p>
描述：
</p>


<textarea
name="description">${category.description}</textarea>



<br><br>



<button type="submit">

保存修改

</button>



</form>


</div>
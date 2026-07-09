<%@ page contentType="text/html;charset=UTF-8" %>


<div class="card">


<h2>
商品分类管理
</h2>


<br>


<a href="${pageContext.request.contextPath}/category/add">

新增分类

</a>


<br><br>



<table border="1"
width="100%"
cellpadding="10">


<tr>

<th>ID</th>

<th>分类名称</th>

<th>描述</th>

<th>状态</th>

<th>操作</th>

</tr>



<c:forEach items="${categoryList}" var="c">


<tr>


<td>${c.categoryId}</td>


<td>${c.categoryName}</td>


<td>${c.description}</td>


<td>

${c.status==1?'正常':'禁用'}

</td>


<td>

删除

</td>


</tr>


</c:forEach>



</table>



</div>
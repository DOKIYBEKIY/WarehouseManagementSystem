<%@ page contentType="text/html;charset=UTF-8" %>


<div class="card">


<h2>
新增仓库
</h2>


<br>


<form method="post"
action="${pageContext.request.contextPath}/warehouse/manage/save">


仓库编码：

<input type="text"
name="warehouseCode"
required>


<br><br>



仓库名称：

<input type="text"
name="warehouseName"
required>


<br><br>



仓库地址：

<input type="text"
name="location"
required>


<br><br>



容量：

<input type="number"
step="0.01"
name="capacity">


<br><br>



管理员：

<input type="text"
name="managerName">


<br><br>



备注：

<input type="text"
name="remark">


<br><br>



<button type="submit">
保存
</button>


<a href="${pageContext.request.contextPath}/warehouse/manage/list">

返回

</a>


</form>


</div>
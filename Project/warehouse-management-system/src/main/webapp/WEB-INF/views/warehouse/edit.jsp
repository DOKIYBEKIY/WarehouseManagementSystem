<%@ page contentType="text/html;charset=UTF-8" %>


<div class="card">


<h2>
修改仓库
</h2>


<br>


<form method="post"
action="${pageContext.request.contextPath}/warehouse/manage/update">



<input type="hidden"
name="warehouseId"
value="${warehouse.warehouseId}">



仓库编码：

<input type="text"
name="warehouseCode"
value="${warehouse.warehouseCode}"
readonly>


<br><br>



仓库名称：

<input type="text"
name="warehouseName"
value="${warehouse.warehouseName}"
required>


<br><br>



仓库地址：

<input type="text"
name="location"
value="${warehouse.location}"
required>


<br><br>



容量：

<input type="number"
step="0.01"
name="capacity"
value="${warehouse.capacity}">


<br><br>



管理员：

<input type="text"
name="managerName"
value="${warehouse.managerName}">


<br><br>



状态：

<select name="status">


<option value="1"
${warehouse.status==1?'selected':''}>
启用
</option>


<option value="0"
${warehouse.status==0?'selected':''}>
停用
</option>


</select>



<br><br>



备注：

<input type="text"
name="remark"
value="${warehouse.remark}">


<br><br>



<button type="submit">

保存修改

</button>



<a href="${pageContext.request.contextPath}/warehouse/manage/list">

返回

</a>



</form>


</div>
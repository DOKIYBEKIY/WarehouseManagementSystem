<%@ page contentType="text/html;charset=UTF-8" %>



<div class="card">


<h2>
修改物资
</h2>


<br>



<form method="post"
action="${pageContext.request.contextPath}/goods/update">


<input type="hidden"
name="goodsId"
value="${goods.goodsId}">



<p>
物资编码：
</p>


<input name="goodsCode"
value="${goods.goodsCode}">



<br><br>



<p>
物资名称：
</p>


<input name="goodsName"
value="${goods.goodsName}">



<br><br>




<p>
分类ID：
</p>


<input name="categoryId"
value="${goods.categoryId}">



<br><br>




<p>
规格：
</p>


<input name="specification"
value="${goods.specification}">



<br><br>




<p>
单位：
</p>


<input name="unit"
value="${goods.unit}">



<br><br>




<p>
价格：
</p>


<input name="price"
value="${goods.price}">



<br><br>



<button type="submit">

保存修改

</button>



</form>



</div>
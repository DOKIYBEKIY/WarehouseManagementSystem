<%@ page contentType="text/html;charset=UTF-8" %>



<div class="card">


<h2>
新增物资
</h2>


<br>



<form method="post"
action="${pageContext.request.contextPath}/goods/save">


<p>
物资编码：
</p>

<input name="goodsCode">



<br><br>


<p>
物资名称：
</p>

<input name="goodsName">



<br><br>



<p>
分类ID：
</p>

<input name="categoryId">



<br><br>



<p>
规格：
</p>

<input name="specification">



<br><br>



<p>
单位：
</p>

<input name="unit">



<br><br>



<p>
价格：
</p>

<input name="price">



<br><br>



<button type="submit">

保存

</button>



</form>



</div>
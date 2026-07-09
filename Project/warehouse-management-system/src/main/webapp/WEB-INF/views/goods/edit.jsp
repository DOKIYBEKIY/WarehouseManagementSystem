<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>


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
商品分类：
</p>


<select name="categoryId">


<c:forEach
items="${categoryList}"
var="cat">


<option 
value="${cat.categoryId}"
<c:if test="${cat.categoryId==goods.categoryId}">
selected
</c:if>
>


${cat.categoryName}


</option>


</c:forEach>


</select>



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
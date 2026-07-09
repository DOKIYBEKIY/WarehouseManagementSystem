<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card">

<h2>修改货主</h2>
<br>

<form method="post" action="${pageContext.request.contextPath}/owner/update">

<input type="hidden" name="ownerId" value="${owner.ownerId}">

<p>货主名称：</p>
<input type="text" name="ownerName" value="${owner.ownerName}" required>
<br><br>

<p>联系电话：</p>
<input type="text" name="phone" value="${owner.phone}">
<br><br>

<p>邮箱：</p>
<input type="text" name="email" value="${owner.email}">
<br><br>

<p>联系地址：</p>
<input type="text" name="address" value="${owner.address}">
<br><br>

<p>备注：</p>
<input type="text" name="remark" value="${owner.remark}">
<br><br>

<button type="submit">保存修改</button>
<a href="${pageContext.request.contextPath}/owner/list"><button type="button">返回</button></a>

</form>

</div>

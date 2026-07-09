<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card">

<h2>新增货主</h2>
<br>

<form method="post" action="${pageContext.request.contextPath}/owner/save">

<p>货主名称：</p>
<input type="text" name="ownerName" required>
<br><br>

<p>联系电话：</p>
<input type="text" name="phone">
<br><br>

<p>邮箱：</p>
<input type="text" name="email">
<br><br>

<p>联系地址：</p>
<input type="text" name="address">
<br><br>

<p>备注：</p>
<input type="text" name="remark">
<br><br>

<button type="submit">保存</button>
<a href="${pageContext.request.contextPath}/owner/list"><button type="button">返回</button></a>

</form>

</div>

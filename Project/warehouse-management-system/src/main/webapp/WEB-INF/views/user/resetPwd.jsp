<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card">

<h2>重置密码</h2>
<br>

<form method="post" action="${pageContext.request.contextPath}/user/resetPwd">

<input type="hidden" name="userId" value="${userId}">

<p>新密码：</p>
<input type="password" name="newPassword" required>
<br><br>

<button type="submit">保存</button>
<a href="${pageContext.request.contextPath}/user/list"><button type="button">返回</button></a>

</form>

</div>

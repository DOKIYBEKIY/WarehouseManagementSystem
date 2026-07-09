<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">

<h2>货主管理</h2>
<br>

<a href="${pageContext.request.contextPath}/owner/add">
<button>新增货主</button>
</a>

<br><br>

<table border="1" width="100%" cellspacing="0" cellpadding="10">
<tr>
    <th>编号</th>
    <th>货主名称</th>
    <th>联系电话</th>
    <th>邮箱</th>
    <th>地址</th>
    <th>备注</th>
    <th>状态</th>
    <th>操作</th>
</tr>

<c:forEach items="${ownerList}" var="o">
<tr>
    <td>${o.ownerId}</td>
    <td>${o.ownerName}</td>
    <td>${o.phone}</td>
    <td>${o.email}</td>
    <td>${o.address}</td>
    <td>${o.remark}</td>
    <td>
        <c:if test="${o.status==1}">正常</c:if>
        <c:if test="${o.status==0}">停用</c:if>
    </td>
    <td>
        <a href="${pageContext.request.contextPath}/owner/edit/${o.ownerId}">修改</a>
        &nbsp;
        <a href="${pageContext.request.contextPath}/owner/delete/${o.ownerId}"
           onclick="return confirm('确定删除吗？')">删除</a>
    </td>
</tr>
</c:forEach>

</table>

</div>

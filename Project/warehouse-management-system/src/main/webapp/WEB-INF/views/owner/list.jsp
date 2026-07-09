<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>货主管理</h2>
<a class="btn btn-primary mt-12" href="${pageContext.request.contextPath}/owner/add" style="display:inline-block;">新增货主</a>
<div class="table-wrap"><table class="data-table">
<tr><th>编号</th><th>货主名称</th><th>联系电话</th><th>邮箱</th><th>地址</th><th>备注</th><th>状态</th><th>操作</th></tr>
<c:forEach items="${ownerList}" var="o">
<tr>
  <td>${o.ownerId}</td><td>${o.ownerName}</td><td>${o.phone}</td><td>${o.email}</td><td>${o.address}</td><td>${o.remark}</td>
  <td><c:if test="${o.status==1}"><span class="tag tag-on">正常</span></c:if><c:if test="${o.status==0}"><span class="tag tag-off">停用</span></c:if></td>
  <td><a href="${pageContext.request.contextPath}/owner/edit/${o.ownerId}">修改</a><a class="danger" href="${pageContext.request.contextPath}/owner/delete/${o.ownerId}" onclick="return confirm('确定删除吗？')">删除</a></td>
</tr>
</c:forEach>
</table></div>
</div>

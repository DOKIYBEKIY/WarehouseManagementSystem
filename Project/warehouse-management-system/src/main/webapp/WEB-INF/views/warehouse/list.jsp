<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>仓库管理</h2>
<a class="btn btn-primary mt-12" href="${pageContext.request.contextPath}/warehouse/manage/add" style="display:inline-block;">新增仓库</a>
<div class="table-wrap"><table class="data-table">
<tr><th>编号</th><th>仓库编码</th><th>仓库名称</th><th>地址</th><th>容量</th><th>管理员</th><th>状态</th><th>操作</th></tr>
<c:forEach items="${warehouseList}" var="w">
<tr>
  <td>${w.warehouseId}</td><td>${w.warehouseCode}</td><td>${w.warehouseName}</td><td>${w.location}</td><td>${w.capacity}</td><td>${w.managerName}</td>
  <td><c:if test="${w.status==1}"><span class="tag tag-on">启用</span></c:if><c:if test="${w.status==0}"><span class="tag tag-off">停用</span></c:if></td>
  <td><a href="${pageContext.request.contextPath}/warehouse/manage/edit/${w.warehouseId}">修改</a><a class="danger" href="${pageContext.request.contextPath}/warehouse/manage/delete/${w.warehouseId}" onclick="return confirm('确定删除吗？')">删除</a></td>
</tr>
</c:forEach>
</table></div>
</div>

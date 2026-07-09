<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>商品分类管理</h2>
<a class="btn btn-primary mt-12" href="${pageContext.request.contextPath}/category/add" style="display:inline-block;">新增分类</a>
<div class="table-wrap"><table class="data-table">
<tr><th>编号</th><th>分类名称</th><th>描述</th><th>状态</th><th>操作</th></tr>
<c:forEach items="${categoryList}" var="c">
<tr>
  <td>${c.categoryId}</td><td>${c.categoryName}</td><td>${c.description}</td>
  <td><c:if test="${c.status==1}"><span class="tag tag-on">正常</span></c:if><c:if test="${c.status==0}"><span class="tag tag-off">停用</span></c:if></td>
  <td><a href="${pageContext.request.contextPath}/category/edit/${c.categoryId}">修改</a><a class="danger" href="${pageContext.request.contextPath}/category/delete/${c.categoryId}" onclick="return confirm('确定删除吗？')">删除</a></td>
</tr>
</c:forEach>
</table></div>
</div>

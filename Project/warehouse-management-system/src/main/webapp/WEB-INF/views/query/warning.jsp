<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<h2>库存预警</h2>
<div class="table-wrap"><table class="data-table">
<tr><th>编号</th><th>商品编码</th><th>商品名称</th><th>仓库</th><th>货主</th><th>当前库存</th><th>预警值</th></tr>
<c:forEach items="${warningList}" var="i">
<tr>
  <td>${i.inventoryId}</td><td>${i.goodsCode}</td><td>${i.goodsName}</td><td>${i.warehouseName}</td><td>${i.ownerName}</td>
  <td><span class="tag tag-warn">${i.quantity}</span></td><td>${i.warningQuantity}</td>
</tr>
</c:forEach>
<c:if test="${empty warningList}"><tr><td colspan="7" style="text-align:center;">暂无库存预警</td></tr></c:if>
</table></div>
</div>

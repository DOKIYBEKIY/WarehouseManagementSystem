<%@ page contentType="text/html;charset=UTF-8" %>
<div class="card">
<h2>修改仓库</h2>
<form method="post" action="${pageContext.request.contextPath}/warehouse/manage/update" class="mt-12">
<input type="hidden" name="warehouseId" value="${warehouse.warehouseId}">
<div class="form-group"><label>仓库编码</label><input type="text" name="warehouseCode" value="${warehouse.warehouseCode}" readonly></div>
<div class="form-group"><label>仓库名称</label><input type="text" name="warehouseName" value="${warehouse.warehouseName}" required></div>
<div class="form-group"><label>仓库地址</label><input type="text" name="location" value="${warehouse.location}" required></div>
<div class="form-group"><label>容量</label><input type="number" step="0.01" name="capacity" value="${warehouse.capacity}"></div>
<div class="form-group"><label>管理员</label><input type="text" name="managerName" value="${warehouse.managerName}"></div>
<div class="form-group"><label>状态</label><select name="status"><option value="1" ${warehouse.status==1?'selected':''}>启用</option><option value="0" ${warehouse.status==0?'selected':''}>停用</option></select></div>
<div class="form-group"><label>备注</label><input type="text" name="remark" value="${warehouse.remark}"></div>
<button type="submit" class="btn btn-primary">保存修改</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/warehouse/manage/list">返回</a>
</form>
</div>

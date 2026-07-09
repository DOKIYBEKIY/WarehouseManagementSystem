<%@ page contentType="text/html;charset=UTF-8" %>
<div class="card">
<h2>新增仓库</h2>
<form method="post" action="${pageContext.request.contextPath}/warehouse/manage/save" class="mt-12">
<div class="form-group"><label>仓库编码</label><input type="text" name="warehouseCode" required></div>
<div class="form-group"><label>仓库名称</label><input type="text" name="warehouseName" required></div>
<div class="form-group"><label>仓库地址</label><input type="text" name="location" required></div>
<div class="form-group"><label>容量</label><input type="number" step="0.01" name="capacity"></div>
<div class="form-group"><label>管理员</label><input type="text" name="managerName"></div>
<div class="form-group"><label>备注</label><input type="text" name="remark"></div>
<button type="submit" class="btn btn-primary">保存</button>
<a class="btn btn-outline" href="${pageContext.request.contextPath}/warehouse/manage/list">返回</a>
</form>
</div>

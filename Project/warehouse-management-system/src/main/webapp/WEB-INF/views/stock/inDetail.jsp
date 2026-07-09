<%@ page contentType="text/html;charset=UTF-8" %>
<div class="card">
<h2>入库详情</h2>
<div class="table-wrap mt-12"><table class="data-table">
<tr><td width="20%"><b>入库编号</b></td><td>${record.inId}</td></tr>
<tr><td><b>商品名称</b></td><td>${record.goodsName} (${record.goodsCode})</td></tr>
<tr><td><b>仓库</b></td><td>${record.warehouseName}</td></tr>
<tr><td><b>货主</b></td><td>${record.ownerName}</td></tr>
<tr><td><b>入库数量</b></td><td>${record.quantity}</td></tr>
<tr><td><b>入库单价</b></td><td>${record.unitPrice}</td></tr>
<tr><td><b>总金额</b></td><td>${record.totalAmount}</td></tr>
<tr><td><b>操作员</b></td><td>${record.operatorName}</td></tr>
<tr><td><b>入库时间</b></td><td>${record.inTime}</td></tr>
<tr><td><b>备注</b></td><td>${record.remark}</td></tr>
</table></div>
<a class="btn btn-outline mt-12" href="${pageContext.request.contextPath}/stock/in/list">返回</a>
</div>

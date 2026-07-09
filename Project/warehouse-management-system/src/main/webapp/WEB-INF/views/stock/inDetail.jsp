<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card">

<h2>入库详情</h2>
<br>

<table border="1" width="60%" cellspacing="0" cellpadding="10">
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
</table>

<br>
<a href="${pageContext.request.contextPath}/stock/in/list"><button>返回</button></a>

</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title} - 仓库物资管理系统</title>
<style>
:root{--primary:#667eea;--primary-hover:#5563d8;--danger:#e74c3c;--success:#27ae60;--warning:#f39c12;--bg:#f0f2f5;--sidebar-bg:#1e2a3a;--sidebar-hover:#2c3e50;--white:#fff;--text:#333;--text-light:#888;--border:#e8e8e8;--radius:10px;--shadow:0 2px 12px rgba(0,0,0,.06);}
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:"Microsoft YaHei","PingFang SC",sans-serif;background:var(--bg);min-height:100vh;}

/* Sidebar */
.layout{display:flex;min-height:100vh;}
.sidebar{width:230px;background:var(--sidebar-bg);color:var(--white);padding:28px 0;position:fixed;top:0;left:0;bottom:0;overflow-y:auto;}
.sidebar-logo{padding:0 24px 28px;font-size:20px;font-weight:700;letter-spacing:1px;border-bottom:1px solid rgba(255,255,255,.08);margin-bottom:8px;}
.sidebar-logo span{color:var(--primary);}
.sidebar-nav{padding:8px 14px;}
.sidebar-nav a{display:block;padding:11px 16px;color:rgba(255,255,255,.7);text-decoration:none;border-radius:8px;font-size:14px;margin-bottom:2px;transition:all .15s;}
.sidebar-nav a:hover{background:var(--sidebar-hover);color:var(--white);}
.sidebar-nav a.active{background:var(--primary);color:var(--white);font-weight:500;}

/* Main */
.main{margin-left:230px;flex:1;display:flex;flex-direction:column;min-height:100vh;}
.topbar{height:60px;background:var(--white);display:flex;justify-content:space-between;align-items:center;padding:0 32px;box-shadow:var(--shadow);}
.topbar h2{font-size:18px;font-weight:600;color:var(--text);}
.topbar-right{display:flex;align-items:center;gap:16px;}
.user-tag{background:var(--bg);padding:6px 14px;border-radius:20px;font-size:13px;color:var(--text);}
.btn-logout{color:var(--danger);text-decoration:none;font-size:13px;font-weight:500;}
.btn-logout:hover{text-decoration:underline;}
.content{padding:28px 32px;flex:1;}

/* Card */
.card{background:var(--white);border-radius:var(--radius);padding:28px;box-shadow:var(--shadow);}

/* Table */
.table-wrap{overflow-x:auto;}
table.data-table{width:100%;border-collapse:collapse;margin-top:16px;}
table.data-table th{background:var(--bg);padding:12px 16px;text-align:left;font-size:13px;font-weight:600;color:var(--text-light);text-transform:uppercase;letter-spacing:.5px;white-space:nowrap;}
table.data-table td{padding:12px 16px;border-bottom:1px solid var(--border);font-size:14px;color:var(--text);}
table.data-table tr:hover td{background:#fafbfc;}
table.data-table a{color:var(--primary);text-decoration:none;font-size:13px;margin-right:8px;}
table.data-table a:hover{text-decoration:underline;}
table.data-table a.danger{color:var(--danger);}

/* Forms */
.form-group{margin-bottom:18px;}
.form-group label{display:block;margin-bottom:5px;font-size:13px;font-weight:500;color:#555;}
.form-group input,.form-group select,.form-group textarea{width:100%;max-width:420px;padding:9px 14px;border:1.5px solid var(--border);border-radius:8px;font-size:14px;outline:none;transition:border .2s;}
.form-group input:focus,.form-group select:focus,.form-group textarea:focus{border-color:var(--primary);}
.form-group textarea{min-height:80px;resize:vertical;}

/* Buttons */
.btn{padding:9px 22px;border:none;border-radius:8px;font-size:14px;font-weight:500;cursor:pointer;transition:all .2s;text-decoration:none;display:inline-block;}
.btn-primary{background:var(--primary);color:var(--white);}
.btn-primary:hover{background:var(--primary-hover);}
.btn-outline{background:var(--white);color:var(--primary);border:1.5px solid var(--primary);}
.btn-outline:hover{background:var(--primary);color:var(--white);}
.btn-sm{padding:5px 14px;font-size:12px;}
.mt-12{margin-top:12px;}
.mb-16{margin-bottom:16px;}

/* Toast */
.toast-container{position:fixed;top:20px;right:24px;z-index:9999;display:flex;flex-direction:column;gap:8px;}
.toast{padding:12px 20px;border-radius:8px;font-size:14px;font-weight:500;box-shadow:0 4px 20px rgba(0,0,0,.12);animation:slideIn .3s ease;max-width:380px;}
.toast-error{background:#fff0f0;color:#c0392b;border-left:4px solid #e74c3c;}
.toast-success{background:#f0fff4;color:#27ae60;border-left:4px solid #27ae60;}
.toast-warning{background:#fff8e1;color:#e67e22;border-left:4px solid #f39c12;}
@keyframes slideIn{from{transform:translateX(120%);opacity:0;}to{transform:translateX(0);opacity:1;}}

/* Status tags */
.tag{padding:3px 10px;border-radius:12px;font-size:12px;font-weight:500;}
.tag-on{background:#e8f5e9;color:#27ae60;}
.tag-off{background:#ffebee;color:#e74c3c;}
.tag-warn{background:#fff3e0;color:#e65100;}

/* Filter bar */
.filter-bar{display:flex;flex-wrap:wrap;gap:12px;align-items:flex-end;margin-bottom:20px;}
.filter-bar .form-group{margin-bottom:0;}
.filter-bar .form-group input,.filter-bar .form-group select{max-width:180px;}
</style>
</head>
<body>

<div class="layout">

<!-- Sidebar -->
<div class="sidebar">
  <div class="sidebar-logo">仓库管理</div>
  <div class="sidebar-nav">

    <!-- admin -->
    <c:if test="${user.roleId==1}">
      <a class="${active=='category'?'active':''}" href="${pageContext.request.contextPath}/category/list">商品分类管理</a>
      <a class="${active=='goods'?'active':''}" href="${pageContext.request.contextPath}/goods/list">物资信息管理</a>
      <a class="${active=='warehouse'?'active':''}" href="${pageContext.request.contextPath}/warehouse/manage/list">仓库管理</a>
      <a class="${active=='owner'?'active':''}" href="${pageContext.request.contextPath}/owner/list">货主管理</a>
      <a class="${active=='user'?'active':''}" href="${pageContext.request.contextPath}/user/list">用户管理</a>
      <a class="${active=='inStock'?'active':''}" href="${pageContext.request.contextPath}/stock/in/list">入库管理</a>
      <a class="${active=='outStock'?'active':''}" href="${pageContext.request.contextPath}/stock/out/list">出库管理</a>
      <a class="${active=='inventory'?'active':''}" href="${pageContext.request.contextPath}/query/inventory">库存查询</a>
      <a class="${active=='inStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/inStock">入库记录</a>
      <a class="${active=='outStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/outStock">出库记录</a>
      <a class="${active=='inStockStats'?'active':''}" href="${pageContext.request.contextPath}/query/inStockStats">统计分析</a>
    </c:if>

    <!-- warehouse -->
    <c:if test="${user.roleId==2}">
      <a class="${active=='goods'?'active':''}" href="${pageContext.request.contextPath}/goods/list">物资查询</a>
      <a class="${active=='warehouse'?'active':''}" href="${pageContext.request.contextPath}/warehouse/manage/list">仓库管理</a>
      <a class="${active=='inStock'?'active':''}" href="${pageContext.request.contextPath}/stock/in/list">货物入库</a>
      <a class="${active=='outStock'?'active':''}" href="${pageContext.request.contextPath}/stock/out/list">货物出库</a>
      <a class="${active=='inventory'?'active':''}" href="${pageContext.request.contextPath}/query/inventory">库存查询</a>
      <a class="${active=='warning'?'active':''}" href="${pageContext.request.contextPath}/query/warning">库存预警</a>
      <a class="${active=='inStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/inStock">入库记录</a>
      <a class="${active=='outStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/outStock">出库记录</a>
    </c:if>

    <!-- query -->
    <c:if test="${user.roleId==3}">
      <a class="${active=='inventory'?'active':''}" href="${pageContext.request.contextPath}/query/inventory">库存查询</a>
      <a class="${active=='warning'?'active':''}" href="${pageContext.request.contextPath}/query/warning">库存预警</a>
      <a class="${active=='inStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/inStock">入库记录</a>
      <a class="${active=='outStockQuery'?'active':''}" href="${pageContext.request.contextPath}/query/outStock">出库记录</a>
      <a class="${active=='inStockStats'?'active':''}" href="${pageContext.request.contextPath}/query/inStockStats">入库统计</a>
      <a class="${active=='outStockStats'?'active':''}" href="${pageContext.request.contextPath}/query/outStockStats">出库统计</a>
    </c:if>

  </div>
</div>

<!-- Main -->
<div class="main">
  <div class="topbar">
    <h2>${title}</h2>
    <div class="topbar-right">
      <span class="user-tag">&#x1F464; ${user.username}</span>
      <a class="btn-logout" href="${pageContext.request.contextPath}/logout">退出登录</a>
    </div>
  </div>

  <div class="content">
    <c:if test="${not empty error || not empty success}">
    <div class="toast-container" id="toastBox">
      <c:if test="${not empty error}"><div class="toast toast-error">${error}</div></c:if>
      <c:if test="${not empty success}"><div class="toast toast-success">${success}</div></c:if>
    </div>
    </c:if>

    <jsp:include page="${contentPage}"/>
  </div>
</div>

</div>

<!-- Toast auto-dismiss -->
<script>
(function(){
  var box=document.getElementById('toastBox');
  if(box){setTimeout(function(){box.style.display='none';},4000);}
})();
</script>

</body>
</html>

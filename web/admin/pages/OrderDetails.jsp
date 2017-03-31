<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/12
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        pageContext.setAttribute("basePath", basePath);
    %>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>曲别针 | 管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/bootstrap/css/bootstrap.min.css">
    <%--<!-- Font Awesome -->--%>
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/skins/_all-skins.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">

        <!-- Logo -->
        <a href="${pageScope.basePath}admin/adminMain.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>Q</b>BZ</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>曲别针</b>管理系统</span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${session.admin.adminName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                <p>
                                    <s:if test="%{session.admin.adminType==0}">高级管理员</s:if>
                                    <s:if test="%{session.admin.adminType==1}">公告管理员</s:if>
                                    <s:if test="%{session.admin.adminType==2}">内容管理员</s:if>

                                    <small>上次登录时间：${session.admin.lastLoginTime}</small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">详细</a>
                                </div>
                                <div class="pull-right">
                                    <a href="/admin/logout.action" class="btn btn-default btn-flat">登出</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>

        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageScope.basePath}admin/dist/img/user2-160x160.jpg" class="img-circle"
                         alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${session.admin.adminName}</p>
                </div>
            </div>
            <!-- search form -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="treeview">
                    <a href="${pageScope.basePath}admin/adminMain.jsp">
                        <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        <span class="pull-right-container">
            </span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>订单管理</span>
                        <span class="pull-right-container">
            </span>
                    </a>
                </li>
                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-users"></i>
                        <span>用户管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="${pageScope.basePath}admin/pages/UserSearch.jsp"><i class="fa fa-circle-o"></i>查询用户</a>
                        </li>
                        <li><a href="${pageScope.basePath}admin/pages/AddUser.jsp"><i
                                class="fa fa-circle-o"></i>添加用户</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-edit"></i> <span>公告</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="${pageScope.basePath}admin/pages/SearchNotice.jsp"><i class="fa fa-circle-o"></i>查询公告</a>
                        </li>
                        <li><a href="${pageScope.basePath}admin/pages/addNotice.jsp"><i class="fa fa-circle-o"></i>发布公告</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-share"></i> <span>商品管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="#"><i class="fa fa-circle-o"></i> 二手商品
                                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${pageScope.basePath}admin/pages/Search2HandGoods.jsp"><i
                                        class="fa fa-circle-o"></i>查询商品</a></li>
                                <li>
                                    <a href="${pageScope.basePath}admin/pages/Add2HandGoods.jsp"><i
                                            class="fa fa-circle-o"></i>添加商品 <span class="pull-right-container"><i
                                            class="fa fa-angle-left pull-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-circle-o"></i> 求购信息
                                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-circle-o"></i>查询</a></li>
                                <li>
                                    <a href="#"><i class="fa fa-circle-o"></i>添加 <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-circle-o"></i> 易物信息
                                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-circle-o"></i>查询</a></li>
                                <li>
                                    <a href="#"><i class="fa fa-circle-o"></i>添加 <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>


            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Dashboard
                <small>Version 2.0</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <section class="invoice">
            <!-- title row -->
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i> 订单详情
                        <small class="pull-right" id="date-small"></small>
                    </h2>
                </div>
                <!-- /.col -->
            </div>
            <!-- info row -->
            <div class="row invoice-info">

                <!-- /.col -->
                <div class="col-sm-5 invoice-col">
                    用户信息
                    <address id="user-address">
                        <strong>${orderdto.udto.userName}</strong><br>
                        ${orderdto.udto.address}<br>
                        ${orderdto.udto.province}-${orderdto.udto.city}<br>
                        电话: ${orderdto.udto.mobile}<br>
                        邮箱: ${orderdto.udto.email}
                    </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-5 invoice-col" id="orderinfo-div">
                    <b>订单信息</b><br>
                    <br><s:property value='%{orderdto.orderId}'/>
                    <b>订单编号:</b> ${orderdto.orderId}<br>
                    <b>生成日期:</b>${orderdto.createTime}<br>
                    <b>交易状态:</b> ${orderdto.orderStatus}
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- Table row -->

            <div class="row">
                <h4>订单中商品</h4>
                <div class="col-xs-12 table-responsive">
                    <table class="table table-striped" id="detail-table">
                        <thead>
                        <tr>
                            <th>数量</th>
                            <th>商品</th>
                            <th>卖家</th>
                            <th>描述</th>
                            <th>价格</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="%{orderdto.sgList}" id="sgdto">
                            <tr>
                                <td><s:property value="#sgdto.goodsCount"/></td>
                                <td><s:property value="#sgdto.goodsTitle"/></td>
                                <td><s:property value="#sgdto.authorId"/></td>
                                <td><s:property value="#sgdto.goodsDescribe"/></td>
                                <td>￥<s:property value="#sgdto.goodsPrice"/>*<s:property
                                        value="#sgdto.goodsCount"/></td>
                            </tr>
                        </s:iterator>
                        <%--TODO--%>
                        </tbody>
                    </table>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- this row will not appear when printing -->
            <div class="row no-print">
                <div class="col-xs-12">
                    <a href="invoice-print.html" target="_blank" class="btn btn-default"><i
                            class="fa fa-print"></i>打印</a>
                    <button type="button" class="btn btn-primary" style="margin-right: 5px;">
                        <i class="fa fa-download"></i> 打印到PDF
                    </button>
                </div>
            </div>
        </section>
        <!-- /.content -->
        <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 0.0.1
        </div>
        <strong>Copyright &copy; 2016 <a href="#">Jialin</a>.</strong> All rights
        reserved.
    </footer>


</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="${pageScope.basePath}admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageScope.basePath}admin/bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageScope.basePath}admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageScope.basePath}admin/plugins/fastclick/fastclick.js"></script>
<!-- bootstrap datepicker -->
<script src="${pageScope.basePath}admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- AdminLTE App -->
<script src="${pageScope.basePath}admin/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageScope.basePath}admin/dist/js/demo.js"></script>
<!-- page script -->
<script type="text/javascript">

</script>
</body>
</html>

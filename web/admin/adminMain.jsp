<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/12
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
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
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="active treeview">
                    <a href="${pageScope.basePath}admin/adminMain.jsp">
                        <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        <span class="pull-right-container">
            </span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="${pageScope.basePath}admin/pages/SearchOrder.jsp">
                        <i class="fa fa-files-o"></i>
                        <span>订单管理</span>
                        <span class="pull-right-container">
            </span>
                    </a>
                </li>
                <li class="treeview">
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
                                <li><a href="${pageScope.basePath}admin/pages/SearchAskToBuy.jsp"><i
                                        class="fa fa-circle-o"></i>查询</a></li>
                                <li>
                                    <a href="${pageScope.basePath}admin/pages/AddAskToBuy.jsp"><i
                                            class="fa fa-circle-o"></i>添加 <span class="pull-right-container">
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

        <!-- Main content -->
        <section class="content">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">商品总数</span>
                            <span class="info-box-number" id="goodsCount">90</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">用户数量</span>
                            <span class="info-box-number" id="userCount">41,410</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->

                <!-- fix for small devices only -->
                <div class="clearfix visible-sm-block"></div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">订单数量</span>
                            <span class="info-box-number" id="orderCount">760</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <%--<div class="col-md-3 col-sm-6 col-xs-12">--%>
                <%--<div class="info-box">--%>
                <%--<span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>--%>

                <%--<div class="info-box-content">--%>
                <%--<span class="info-box-text">New Members</span>--%>
                <%--<span class="info-box-number">2,000</span>--%>
                <%--</div>--%>
                <%--<!-- /.info-box-content -->--%>
                <%--</div>--%>
                <%--<!-- /.info-box -->--%>
                <%--</div>--%>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- PRODUCT LIST -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Recently Added Products</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                                class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                                class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <ul class="products-list product-list-in-box" id="goods-list">
                                        <!-- /.item -->
                                    </ul>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-center">
                                    <a href="${pageScope.basePath}admin/pages/Search2HandGoods.jsp" class="uppercase">查看更多</a>
                                </div>
                                <!-- /.box-footer -->
                            </div>
                            <!-- /.box -->

                        </div>
                        <!-- /.col -->

                        <div class="col-md-6">
                            <!-- USERS LIST -->
                            <div class="box box-danger">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Latest Members</h3>

                                    <div class="box-tools pull-right">
                                        <span class="label label-danger"></span>
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                                class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                                class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <ul class="users-list clearfix" id="user-list">

                                    </ul>
                                    <!-- /.users-list -->
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-center">
                                    <a href="${pageScope.basePath}admin/pages/UserSearch.jsp"
                                       class="uppercase">查看更多 </a>
                                </div>
                                <!-- /.box-footer -->
                            </div>
                            <!--/.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- TABLE: LATEST ORDERS -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Latest Orders</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                        class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                        class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive">
                                <table id="order-list" class="table no-margin">
                                    <thead>
                                    <tr>
                                        <th width="15%">订单ID</th>
                                        <th width="15%">状态</th>
                                        <th width="30%">创建时间</th>
                                        <th width="20%">买家ID</th>
                                        <th width="20%">价格</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">
                            <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New
                                Order</a>
                            <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All
                                Orders</a>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->

            </div>
            <!-- /.row -->
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
<!-- FastClick -->
<script src="${pageScope.basePath}admin/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageScope.basePath}admin/dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="${pageScope.basePath}admin/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${pageScope.basePath}admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageScope.basePath}admin/dist/js/demo.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        var user = "${session.admin}";
        if (user == "") {
            location.href = "${pageScope.basePath}admin/adminLogin.jsp";
        }
        $.ajax({
            url: "${pageScope.basePath}admin/SearchUser.action",
            type: "get",
            data: {"udto.userId": ""},
            success: function (data) {
                var ind = 0;
                $.each(data.userList, function (index, user) {
                    var liString = " <li>" +
                        "<img src='viewImg.action?imgpath=" + user.picImg + "' alt='User Image'>" +
                        "<a class='users-list-name' href='${pageScope.basePath}admin/getUserInfoDetail.action?udto.userId=" + user.userId + "'>" + user.userName + "</a> " +
                        "<span class='users-list-date'>" + user.createTime + "</span>" +
                        "</li>";
                    $("#user-list").append(liString);
                    ind++;
                    if (ind > 7) {
                        return false;
                    }
                });
            }, error: function () {

                $("#user-list").append(" <li>" +
                    "<span class='users-list-date'>无新用户</span>" +
                    "</li>")
            }
        });

        $.ajax({
            url: "${pageScope.basePath}admin/get2HandGoodsList.action",
            type: "get",
            data: {"sgdto.goodsId": ""},
            success: function (data) {
                var ind = 0;
                $.each(data.sgList, function (index, goods) {
                    var liString = " <li class='item'><div class='product-img'>" +
                        " <img src='viewImg.action?imgpath=" + goods.goodsImg + "' alt='Product Image'> " +
                        "</div> <div class='product-info'> <a href='get2HandGoodsDetail.action?sgdto.goodsId=" + goods.goodsId + "' class='product-title'>" + goods.goodsTitle + " " +
                        "<span class='label label-warning pull-right'>￥" + goods.goodsPrice + "</span></a> " +
                        "<span class='product-description'>" + goods.goodsDescribe + ".</span> " +
                        "</div> </li>";
                    $("#goods-list").append(liString);
                    ind++;
                    if (ind > 3) {
                        return false;
                    }
                })
            }, error: function () {

                $("#goods-list").append(" <li>" +
                    "<span class='users-list-date'>无新商品</span>" +
                    "</li>")
            }
        });
        $.ajax({
            url: "${pageScope.basePath}admin/getOrderByUser.action",
            type: "get",
            data: {"orderdto.userId": ""},
            success: function (data) {
                var ind = 0;
                $.each(data.orderList, function (index, order) {

                    if (order.orderStatus == 1) {
                        var status = "交易完成";
                    } else {
                        var status = "未完成";
                    }
                    var liString = "<tr><td><a href='pages/examples/invoice.html'>" + order.orderId + "</a></td> " +
                        "<td><span class='label label-success'>" + status + "</span></td>" +
                        "<td>" + order.createTime + "</td>" +
                        " <td><div class='sparkbar' data-color='#00a65a' data-height='20'>" + order.userId + "</div></td>" +
                        " <td><div class='sparkbar' data-color='#00a65a' data-height='20'>￥"
                        + order.sumPrice +
                        "</div></td></tr>";
                    $("#order-list").append(liString);
                    ind++;
                    if (ind > 8) {
                        return false;
                    }
                })
            }, error: function () {

                $("#order-list").append("<tr><td colspan='5' class='users-list-date'>无新商品</td></tr>")
            }
        });


        $.ajax({
            url: "${pageScope.basePath}admin/getCount.action",
            type: "get",
            success: function (data) {
                $("#goodsCount").html(data.countMap.sc);
                $("#userCount").html(data.countMap.uc);
                $("#orderCount").html(data.countMap.oc);
            }, error: function () {
                $("#goodsCount").html("未知");
                $("#userCount").html("未知");
                $("#orderCount").html("未知");
            }
        });
    });

</script>
</body>
</html>
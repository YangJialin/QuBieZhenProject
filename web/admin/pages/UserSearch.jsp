<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/12
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/plugins/datepicker/datepicker3.css">
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
        <a href="${pageScope.basePath}/admin/adminMain.jsp" class="logo">
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
                    <input type="text" name="q" class="form-control" placeholder="Search${pageScope.basePath}admin.">
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
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">请输入检索信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

                            <form class="form-horizontal" id="main-form">

                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputEmail" class="col-sm-3 control-label">邮箱:</label>

                                                <div class="col-sm-9">
                                                    <input type="email" class="form-control" id="inputEmail"
                                                           placeholder="邮箱" name="udto.email">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputMobile" class="col-sm-3 control-label">电话:</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputMobile"
                                                           placeholder="电话" name="udto.mobile">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputUserName" class="col-sm-3 control-label">用户名:</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputUserName"
                                                           placeholder="用户名" name="udto.userName">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputShowName" class="col-sm-3 control-label">昵称:</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputShowName"
                                                           placeholder="昵称" name="udto.showName">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputSex" class="col-sm-3 control-label">性别:</label>
                                                <div class="col-sm-6">
                                                    <select class="form-control" id="inputSex" name="udto.sex">
                                                        <option selected="selected"></option>
                                                        <option value=""></option>
                                                        <option value="1">男</option>
                                                        <option value="0">女</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="birthday" class="col-sm-3 control-label">生日:</label>
                                                <div class="input-group date col-sm-6">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <%--<input type="text" class="form-control pull-right" id="datepicker" name="udto.birthday">--%>
                                                    <input type="date" class="form-control pull-right" id="birthday"
                                                           name="udto.birthday">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputAU" class="col-sm-3 control-label">认证状态:</label>
                                                <div class="col-sm-6">
                                                    <select class="form-control" id="inputAU"
                                                            name="udto.isAuthentication">
                                                        <option selected="selected" value=""></option>
                                                        <option value="0">未认证</option>
                                                        <option value="1">已认证</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="inputAV" class="col-sm-3 control-label">账号状态:</label>
                                                <div class="col-sm-6">
                                                    <select class="form-control" id="inputAV" name="udto.isAvalible">
                                                        <option selected="selected" value=""></option>
                                                        <option value="1">正常</option>
                                                        <option value="2">冻结</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">

                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="inputProvince"
                                                           class="col-sm-3 control-label">省份:</label>
                                                    <div class="col-sm-4">
                                                        <select class="form-control" id="inputProvince"
                                                                name="udto.province">
                                                            <option selected="selected"></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="inputCity" class="col-sm-3 control-label">城市:</label>
                                                    <div class="col-sm-4">
                                                        <select class="form-control" id="inputCity" name="udto.city">
                                                            <option selected="selected"></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <button type="button" class="btn btn-info pull-right" id="search-btm">查询</button>
                                    <button type="reset" class="btn pull-right btn-default">重置</button>&nbsp;

                                </div>
                                <!-- /.box-footer -->
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <div class="box box-success" id="body-box" hidden="hidden">
                        <div class="box-header">
                            <h3 class="box-title">Data Table With Full Features</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="table" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>电话</th>
                                    <th>邮箱</th>
                                    <th>用户名</th>
                                    <th>昵称</th>
                                    <th>性别</th>
                                    <th>生日</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>电话</th>
                                    <th>邮箱</th>
                                    <th>用户名</th>
                                    <th>昵称</th>
                                    <th>性别</th>
                                    <th>生日</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
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
<!-- DataTables -->
<script src="${pageScope.basePath}admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageScope.basePath}admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageScope.basePath}admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageScope.basePath}admin/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageScope.basePath}admin/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageScope.basePath}admin/dist/js/demo.js"></script>
<!-- page script -->
<script>
    $(document).ready(function () {
        var msg = "${requestScope.addUserMsg}";
        if (msg != "") {
            alert(msg);
        }
        $("#inputProvince option:gt(0)").remove();

        $.getJSON("${pageScope.basePath}admin/getProvince.action",
            function (data) {
                $.each(data.provinceList, function (ind, pr) {
                    var trString = "<option value='" + pr.provinceId + "'>" + pr.privinceName + "</optionva>";
                    $("#inputProvince").append(trString);

                });
            });
    });

    $(function () {
        $("#inputProvince").change(function () {
            $("#inputCity option:gt(0)").remove();
            var prid = $("#inputProvince").val();
            $.ajax({
                url: "${pageScope.basePath}admin/getCity.action",
                data: {"prdto.provinceId": prid},
                success: function (data) {
                    $.each(data.cityList, function (index, city) {
                        var trString = "<option value='" + city.cityId + "'>" + city.cityName + "</optionva>";
                        $("#inputCity").append(trString);

                    });
                }
            });

        });

        $("#search-btm").click(function () {
            $("#body-box").show();
            $.ajax({
                url: "/admin/SearchUser.action",
                type: "POST",
                data: $("form#main-form").serialize(),
                success: function (data) {
                    $("#table tr:gt(0)").remove();
                    $.each(data.userList, function (index, user) {
                        if (user.sex == 1) {
                            var sex = "男";
                        } else if (user.sex == 0) {
                            var sex = "女";
                        }
                        var trString = "<tr><td>" + user.userId + "</td>" +
                            "<td>" + user.mobile + "</td>" +
                            "<td>" + user.email + "</td>" +
                            "<td>" + user.userName + "</td>" +
                            "<td>" + user.showName + "</td>" +
                            "<td>" + sex + "</td>" +
                            "<td>" + user.birthday + "</td>" +
                            "<td>" + user.createTime + "</td>" +
                            "<td><a href='getUserInfoDetail.action?udto.userId=" + user.userId + "'>查看详情</a></td></tr>";
                        $("#table").append(trString);
                    })
                }, error: function () {
                    $("#table tr:gt(0)").remove();
                    $("#table").append("<tr><th colspan='9' style='color: red;text-align:center;'>查询无结果</th></tr>")
                }

            });

        });


        $('#table').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });

    });

</script>
</body>
</html>

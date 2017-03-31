<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/5
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("basePath", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageScope.basePath}/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageScope.basePath}/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageScope.basePath}/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageScope.basePath}/style.css">
    <link rel="stylesheet" href="${pageScope.basePath}/css/responsive.css">
    <!-- AdminLTE App -->
    <script src="${pageScope.basePath}admin/dist/js/app.min.js"></script>
    <script src="${pageScope.basePath}/js/jquery-3.1.1.min.js"></script>
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <script>

    </script>
    <title>曲别针二手交易网站</title>

</head>
<body>
<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu" id="user-menu2">
                    <ul>
                        <li><a href="pages/userPage.jsp"><i class="fa fa-user"></i>我的曲别针</a></li>
                        <li><a href="#"><i class="fa fa-heart"></i>愿望单</a></li>
                        <li><a href="pages/cart.jsp"><i class="fa fa-user"></i>购物车</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->


<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    <h1><a href="${pageScope.basePath}index.jsp">曲别针<span>Mark</span></a></h1>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->

<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageScope.basePath}index.jsp">主页</a></li>
                    <li class="active"><a href="${pageScope.basePath}pages/SecendHandsGoodsShop.jsp">闲置物品</a></li>
                    <li><a href="${pageScope.basePath}#">求购</a></li>
                    <li><a href="${pageScope.basePath}#">换客</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">用户信息</h2>
                    <div class="col-md-6">
                        <img class="profile-user-img2 img-responsive img-circle" src="${session.user.picImg}"
                             alt="User profile picture">

                        <h3 class="profile-username text-center">用户名：${session.user.userName}</h3>

                        <p class="text-center">昵称：${session.user.showName}</p>
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <p class="text-center">邮箱：${session.user.email}</p>
                            </li>
                            <li class="list-group-item">
                                <p class="text-center">电话：${session.user.mobile}</p>
                            </li>
                            <li class="list-group-item">
                                <p class="text-center">积分：${session.user.score}</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="single-sidebar">

                </div>
            </div>

            <div class="col-md-9">
                <div class="product-content-right">
                    <section class="content">
                        <div role="tabpanel">
                            <ul class="product-tab " role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#home" aria-controls="home" role="tab" data-toggle="tab">发布商品</a>
                                </li>
                                <li role="presentation">
                                    <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">发布求购</a>
                                </li>
                                <li role="presentation">
                                    <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">发布易物</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home">

                                    <div class="product-content-right">
                                        <section class="content">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="box box-primary">
                                                        <div class="box-header">
                                                            <h3 class="box-title">请输入商品信息</h3>
                                                        </div>
                                                        <!-- /.box-header -->
                                                        <div class="box-body">

                                                            <form action="${pageScope.basePath}addSecendHandGoods.action"
                                                                  method="post"
                                                                  enctype="multipart/form-data"
                                                                  class="form-horizontal" id="main-form">

                                                                <div class="box-body">
                                                                    <div class="row">
                                                                        <div class="col-md-7">
                                                                            <div class="form-group">
                                                                                <label for="inputTitle"
                                                                                       class="col-sm-3 control-label">商品标题:</label>

                                                                                <div class="col-sm-9">
                                                                                    <input type="text"
                                                                                           class="form-control"
                                                                                           id="inputTitle"
                                                                                           placeholder="标题"
                                                                                           name="sgdto.goodsTitle">
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-7">
                                                                            <div class="form-group">
                                                                                <label for="inputDescribe"
                                                                                       class="col-sm-3 control-label">商品描述:</label>

                                                                                <div class="col-sm-9">
                                                    <textarea class="form-control" id="inputDescribe"
                                                              placeholder="商品描述" name="sgdto.goodsDescribe"></textarea>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-7">
                                                                            <div class="form-group">
                                                                                <label for="inputType"
                                                                                       class="col-sm-3 control-label">类别:</label>
                                                                                <div class="col-sm-9">
                                                                                    <select class="form-control"
                                                                                            id="inputType"
                                                                                            name="sgdto.goodsType">
                                                                                        <option selected="selected"></option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-md-7">
                                                                            <div class="form-group">
                                                                                <label for="inputPrice"
                                                                                       class="col-sm-3 control-label">价格:</label>

                                                                                <div class="col-sm-9">
                                                                                    <input type="text"
                                                                                           class="form-control"
                                                                                           id="inputPrice"
                                                                                           placeholder="价格"
                                                                                           name="sgdto.goodsPrice">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-7" hidden="hidden">
                                                                            <div class="form-group">
                                                                                <label for="inputAuthor"
                                                                                       class="col-sm-3 control-label">所属用户:</label>
                                                                                <div class="col-sm-6">
                                                                                    <input class="form-control"
                                                                                           value="${session.user.userId}"
                                                                                           id="inputAuthor"
                                                                                           name="sgdto.authorId">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-7">
                                                                            <div class="form-group">
                                                                                <label class="col-sm-3 control-label"
                                                                                       for="exampleInputFile">商品图片:</label>
                                                                                <div class="col-sm-8">
                                                                                    <input type="file"
                                                                                           id="exampleInputFile"
                                                                                           name="uploadFile">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-10">
                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    <div class="form-group">
                                                                                        <label for="inputProvince"
                                                                                               class="col-sm-5 control-label">所在地省份:</label>
                                                                                        <div class="col-sm-7">
                                                                                            <select class="form-control"
                                                                                                    id="inputProvince"
                                                                                                    name="province">
                                                                                                <option selected="selected"></option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <div class="form-group">
                                                                                        <label for="inputCity"
                                                                                               class="col-sm-4 control-label">城市:</label>
                                                                                        <div class="col-sm-8">
                                                                                            <select class="form-control"
                                                                                                    id="inputCity"
                                                                                                    name="city">
                                                                                                <option selected="selected"></option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /.box-body -->
                                                                <div class="box-footer">
                                                                    <button type="submit"
                                                                            class="btn btn-info pull-right"
                                                                            id="submit-btm">发布
                                                                    </button>
                                                                    <button type="reset"
                                                                            class="btn  btn-warning">重置
                                                                    </button>
                                                                    &nbsp;

                                                                </div>
                                                                <!-- /.box-footer -->
                                                            </form>
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


                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab1">
                                    <div class="product-content-right">
                                        <section class="content">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <form action="${pageScope.basePath}addAskToBuy.action"
                                                          method="post" id="notice-form">

                                                        <section class="content">

                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="box box-info">
                                                                        <div class="box-header">
                                                                            <h3 class="box-title">求购信息发布编辑
                                                                                <small>Simple and fast</small>
                                                                            </h3>

                                                                        </div>
                                                                        <!-- /.box-header -->
                                                                        <div class="box-body pad">
                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-3 control-label">标题：</label>
                                                                                        <div class="col-sm-9">
                                                                                            <input type="text"
                                                                                                   class="form-control"
                                                                                                   name="askdto.askTitle">
                                                                                            <input type="text"
                                                                                                   id="reUserId"
                                                                                                   name="askdto.udto.userId"
                                                                                                   hidden="hidden"
                                                                                                   value="${session.user.userId}">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div class="row">
                                                                                <div class="col-md-12">

                                        <textarea class="textarea" name="askdto.askDetails"
                                                  placeholder="求购内容"
                                                  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="box-footer">
                                                                            <input type="button" id="publish-btm"
                                                                                   class="btn btn-primary pull-right"
                                                                                   value="发布">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /.col-->
                                                            </div>
                                                            <!-- ./row -->

                                                        </section>
                                                    </form>

                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.row -->
                                        </section>
                                        <!-- /.content -->
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab2">

                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- /.content -->


                </div>
            </div>
        </div>

    </div>
</div>
<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>Copyright &copy; 2016.DJTU All rights reserved.<a
                            href="${pageScope.basePath}admin/adminLogin.jsp">管理入口 </a></p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer bottom area -->

<!-- Latest jQuery form server -->
<script src="${pageScope.basePath}js/jquery-1.8.3.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="${pageScope.basePath}js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="${pageScope.basePath}js/owl.carousel.min.js"></script>
<script src="${pageScope.basePath}js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="${pageScope.basePath}js/jquery.easing.1.3.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${pageScope.basePath}admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Main Script -->
<script src="${pageScope.basePath}js/main.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {
            var msg = "${requestScope.addUserMsg}";
            if (msg != "") {
                alert(msg);
            }
            $("#inputProvince option:gt(0)").remove();
            $("#inputAuthor option:gt(0)").remove();
            $("#inputType option:gt(0)").remove();

            $.getJSON("${pageScope.basePath}admin/getProvince.action",
                function (data) {
                    $.each(data.provinceList, function (ind, pr) {
                        var trString = "<option value='" + pr.provinceId + "'>" + pr.privinceName + "</optionva>";
                        $("#inputProvince").append(trString);

                    });
                });
            $.getJSON("${pageScope.basePath}admin/SearchUser.action?udto.userId=" + "",
                function (data) {
                    $.each(data.userList, function (ind, user) {
                        var trString = "<option value='" + user.userId + "'>" + user.userName + "</optionva>";
                        $("#inputAuthor").append(trString);

                    });
                });
            $.getJSON("${pageScope.basePath}admin/getGoodsType.action",
                function (data) {
                    $.each(data.goodsTypeList, function (ind, type) {
                        var trString = "<option value='" + type.typeId + "'>" + type.typeName + "</optionva>";
                        $("#inputType").append(trString);

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
                        $.each(data.cityList, function (ind, city) {
                            var trString = "<option value='" + city.cityId + "'>" + city.cityName + "</optionva>";
                            $("#inputCity").append(trString);

                        });
                    }
                });

            });
        });
    });

    $(function () {
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();

        $("#publish-btm").click(function () {
            $("#notice-form").submit();
        })
    });
</script>
</body>
</html>

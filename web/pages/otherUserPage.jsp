<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/22
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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

    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/bootstrap/css/bootstrap.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

    <!-- AdminLTE App -->
    <script src="${pageScope.basePath}admin/dist/js/app.min.js"></script>
    <script src="${pageScope.basePath}/js/jquery-3.1.1.min.js"></script>
    <title>曲别针二手交易网站</title>

</head>
<body>
<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu" id="user-menu2">
                    <ul>
                        <li><a href="${pageScope.basePath}pages/userPage.jsp"><i class="fa fa-user"></i>我的曲别针</a></li>
                        <li><a href="#"><i class="fa fa-heart"></i>愿望单</a></li>
                        <li><a href="${pageScope.basePath}pages/cart.jsp"><i class="fa fa-user"></i>购物车</a></li>
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
                    <li><a href="${pageScope.basePath}pages/SecendHandsGoodsShop.jsp">闲置物品</a></li>
                    <li><a href="${pageScope.basePath}#">求购</a></li>
                    <li><a href="${pageScope.basePath}#">换客</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div class="single-product-area" style="background-color: whitesmoke">
    <div class="container">
        <div class="row">
            <section class="content">

                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="box box-primary">
                            <div class="box-body box-profile">
                                <img class="profile-user-img img-responsive img-circle"
                                     src="<s:url action='viewImg'><s:param name='imgpath'>${udto.picImg}</s:param></s:url>"
                                     alt="User profile picture">

                                <h3 class="profile-username text-center">${udto.userName}</h3>

                                <p class="text-muted text-center">${udto.showName}</p>

                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>发布商品数</b> <a class="pull-right" id="fabushangpinshu"></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>购买次数</b> <a class="pull-right" id="dingdanshu"></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>积分</b> <a class="pull-right">${udto.score}</a>
                                    </li>
                                </ul>
                                <strong><i class="fa fa-book margin-r-5"></i>邮箱</strong>

                                <p class="text-muted">
                                    ${udto.email} </p>

                                <hr>

                                <strong><i class="fa fa-map-marker margin-r-5"></i> 地址</strong>

                                <p class="text-muted">${udto.province},${udto.city}, ${udto.address}</p>

                                <hr>

                                <hr>

                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#activity" data-toggle="tab">发布的商品 </a></li>
                                <li><a href="#ask-to-buy" data-toggle="tab">发布的求购</a></li>
                                <li><a href="#chenge-goods" data-toggle="tab">发布的易物</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="active tab-pane" id="activity">
                                    <table cellspacing="0" id="cart-table" class="shop_table cart">
                                        <thead>
                                        <tr>
                                            <th class="product-thumbnail" width="20%">图片</th>
                                            <th class="product-name" width="30%">名称</th>
                                            <th class="product-price" width="15%">单价</th>
                                            <th class="product-price" width="15%">时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>

                                </div>
                                <!-- /.tab-pane -->


                                <div class="tab-pane" id="ask-to-buy">
                                    <table cellspacing="0" id="ask-table" class="shop_table cart">
                                        <thead>
                                        <tr>
                                            <th class="product-thumbnail" width="20%">图片</th>
                                            <th class="product-name" width="30%">名称</th>
                                            <th class="product-price" width="15%">单价</th>
                                            <th class="product-price" width="15%">时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane" id="chenge-goods">

                                    <table cellspacing="0" id="chenge-table" class="shop_table cart">
                                        <thead>
                                        <tr>
                                            <th class="product-thumbnail" width="20%">图片</th>
                                            <th class="product-name" width="30%">名称</th>
                                            <th class="product-price" width="15%">单价</th>
                                            <th class="product-price" width="15%">时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>

                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.nav-tabs-custom -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

            </section>
            <!-- /.content -->

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

<!-- Main Script -->
<script src="${pageScope.basePath}js/main.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {

            <!-- 查询购买商品数，订单数-->
            $.getJSON("${pageScope.basePath}getUserSellBuyCount.action?udto.userId=${udto.userId}",
                function (data) {
                    $("#fabushangpinshu").html(data.udto.countSell);
                    $("#dingdanshu").html(data.udto.countBuy);
                });

            $.getJSON("${pageScope.basePath}admin/getProvince.action",
                function (data) {
                    $.each(data.provinceList, function (ind, pr) {
                        var trString = "<option value='" + pr.provinceId + "'>" + pr.privinceName + "</optionva>";
                        $("#inputProvince").append(trString);

                    });
                });

            //查询用户发布的商品
            $.ajax({
                url: "${pageScope.basePath}admin/get2HandGoodsList.action",
                data: {"sgdto.authorId":${udto.userId}},
                type: "get",
                success: function (data) {
                    $.each(data.sgList, function (index, sgdto) {
                        var cartString = "<tr class='cart_item'>" +
                            "<td class='product-thumbnail'>" +
                            "<a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + sgdto.goodsId + "'>" +
                            "<img width='145' height='145' alt='poster_1_up' class='shop_thumbnail' src=viewImg.action?imgpath=" + sgdto.goodsImg + "></a>" +
                            "</td>" +
                            "<td class='product-name'>" +
                            "<a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + sgdto.goodsId + "'>" + sgdto.goodsTitle + "</a>" +
                            "</td>" +
                            "<td class='product-price'>" +
                            "<span class='amount'>" + sgdto.goodsPrice + "</span>" +
                            "</td>" +
                            "<td class='product-subtotal'>" +
                            "<span class='amount'>" + sgdto.createTime + "</span>" +
                            "</td>" +
                            "</tr>";
                        $("#cart-table option:gt(0)").remove();
                        $("#cart-table").append(cartString);

                    })

                }
            })
        });

    })
</script>
</body>
</html>

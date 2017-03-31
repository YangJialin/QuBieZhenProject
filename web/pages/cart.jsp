<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/20
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        pageContext.setAttribute("basePath", basePath);
    %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="${pageScope.basePath}admin/bootstrap/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageScope.basePath}css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageScope.basePath}css/owl.carousel.css">
    <link rel="stylesheet" href="${pageScope.basePath}style.css">
    <link rel="stylesheet" href="${pageScope.basePath}css/responsive.css">


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

            <div class="col-sm-4 pull-right">
                <div class="row">
                    <div class="col-md-6">
                        <div class="shopping-item">
                            <a href="#">我要发布</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="shopping-item">
                            <a href="pages/cart.html"><i class="fa fa-shopping-cart"></i>&nbsp;<span id="cartCountPrice"
                                                                                                     class="cart-amunt"></span>
                                <span id="cartCountNum-span" class="product-count"></span></a>
                        </div>
                    </div>

                </div>


            </div>
        </div>
    </div>
</div>

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
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">快捷搜索</h2>
                    <form action="">
                        <input type="text" placeholder="关键字...">
                        <input type="submit" value="搜索">
                    </form>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">在售商品</h2>
                    <div class="thubmnail-recent">
                        <img src="../img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="../img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="../img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="../img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Recent Posts</h2>
                    <ul>
                        <li><a href="">Sony Smart TV - 2015</a></li>
                        <li><a href="">Sony Smart TV - 2015</a></li>
                        <li><a href="">Sony Smart TV - 2015</a></li>
                        <li><a href="">Sony Smart TV - 2015</a></li>
                        <li><a href="">Sony Smart TV - 2015</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form method="post" action="#">
                            <table cellspacing="0" id="cart-table" class="shop_table cart">
                                <thead>
                                <tr>
                                    <th class="product-remove" width="10%">&nbsp;</th>
                                    <th class="product-thumbnail" width="20%">图片</th>
                                    <th class="product-name" width="30%">名称</th>
                                    <th class="product-price" width="15%">单价</th>
                                    <th class="product-quantity" width="10%">数量</th>
                                    <th class="product-subtotal" width="15%">价格</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td>合计：</td>
                                    <td colspan="2"></td>
                                    <td class="actions" colspan="3">
                                        <input type="button" value="更新购物车" name="update_cart" class="button"
                                               onclick="window.location.reload();">
                                        <input type="button" value="结算" name="proceed" id="pay-btn"
                                               class="checkout-button button alt wc-forward"
                                               onclick="location.href='${pageScope.basePath}createOrder.action'">

                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </form>
                    </div>
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
                            href="<%=path %>/admin/adminLogin.jsp">管理入口 </a></p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer bottom area -->

<!-- Latest jQuery form server -->
<script src="../js/jquery-1.8.3.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="../js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="../js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="../js/main.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({//购物车
            url: "${pageScope.basePath}getCartCount.action",
            data: {"cartdto.userId":${session.user.userId}},
            type: "get",
            success: function (data) {
                var countNum = data.cartdto.goodsCount;
                var countPrice = data.cartdto.goodsPriceCount;
                $("#cartCountNum-span").html(countNum);
                $("#cartCountPrice").html("￥" + countPrice);

            }
        });

        //加载购物车中内容
        $.ajax({
            url: "${pageScope.basePath}getCartDetail.action",
            data: {"cartdto.userId":${session.user.userId}},
            type: "get",
            success: function (data) {
                $.each(data.cartList, function (index, cart) {
                    var cartString = "<tr class='cart_item'>" +
                        "<td class='product-remove'>" +
                        "<a title='移出购物车' class='remove' href='${pageScope.basePath}deleteFromCart.action?cartdto.cartId=" + cart.cartId + "'>×</a>" +
                        "</td>" +
                        "<td class='product-thumbnail'>" +
                        "<a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + cart.goodsId + "'>" +
                        "<img width='145' height='145' alt='poster_1_up' class='shop_thumbnail' src='" + cart.sgdto.goodsImg + "'></a>" +
                        "</td>" +
                        "<td class='product-name'>" +
                        "<a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + cart.goodsId + "'>" + cart.sgdto.goodsTitle + "</a>" +
                        "</td>" +
                        "<td class='product-price'>" +
                        "<span class='amount'>" + cart.sgdto.goodsPrice + "</span>" +
                        "</td>" +
                        "<td class='product-quantity'>" +
                        "<div class='quantity buttons_added'>" +
                        "<input type='number' size='4' class='input-text qty text' title='Qty' value='" + cart.goodsCount + "' min='0' step='1'>" +
                        "</div>" +
                        "</td>" +
                        "<td class='product-subtotal'>" +
                        "<span class='amount'>" + cart.goodsPriceCount + "</span>" +
                        "</td>" +
                        "</tr>";
                    $("#cart-table option:gt(0)").remove();
                    $("#cart-table").append(cartString);

                })

            }
        })
    });

</script>
</body>
</html>
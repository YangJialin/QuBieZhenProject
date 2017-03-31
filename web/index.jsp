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
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=path %>/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=path %>/style.css">
    <link rel="stylesheet" href="<%=path %>/css/responsive.css">

    <script src="<%=path %>/js/jquery-3.1.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: "${pageScope.basePath}admin/get2HandGoodsList.action",
                type: "get",
                data: {"sgdto.goodsId": ""},
                success: function (data) {
                    $.each(data.sgList, function (index, sg) {

                        var divString = " <div class='single-wid-product'> " +
                            "<a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + sg.goodsId + "'><img src='viewImg.action?imgpath=" + sg.goodsImg + "' alt='' class='product-thumb'></a> " +
                            "<h2><a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + sg.goodsId + "'>" + sg.goodsTitle + "</a></h2> <div class='product-wid-rating'> " +
                            "<i class='fa fa-star'></i> <i class='fa fa-star'></i> <i class='fa fa-star'></i> <i class='fa fa-star'></i> " +
                            "<i class='fa fa-star'></i> </div> <div class='product-wid-price'> " +
                            "<ins>￥" + sg.goodsPrice + "</ins> </div> </div>";

                        $("#new-product").append(divString);
                        var ind = index;
                        if (ind == 4) {
                            return false;
                        }
                    })
                }, error: function () {
                    $("#hot-product").append("<h2>无商品</h2>")
                }

            });
        })

    </script>
    <title>曲别针二手交易网站</title>

</head>
<body>
<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu" id="user-menu1">
                    <ul>
                        <li><a href="#"><i class="fa fa-user"></i>购物车</a></li>
                        <li><a href="pages/login.jsp"><i class="fa fa-user"></i>登录</a></li>
                        <li><a href="pages/register.jsp"><i class="fa fa-user"></i>注册</a></li>
                    </ul>
                </div>
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
                    <li class="active"><a href="${pageScope.basePath}index.jsp">主页</a></li>
                    <li><a href="${pageScope.basePath}pages/SecendHandsGoodsShop.jsp">闲置物品</a></li>
                    <li><a href="${pageScope.basePath}pages/AskToBuyShop.jsp">求购</a></li>
                    <li><a href="${pageScope.basePath}#">换客</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div class="slider-area">
    <div class="zigzag-bottom"></div>
    <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

        <div class="slide-bulletz">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="carousel-indicators slide-indicators">
                            <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                            <li data-target="#slide-list" data-slide-to="1"></li>
                            <li data-target="#slide-list" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="single-slide">
                    <div class="slide-bg slide-one"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>二手交易</h2>
                                            <p>让你的闲置物品变废为宝，发挥余热！</p>
                                            <a href="" class="readmore">了解更多</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-two"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>求购商品</h2>
                                            <p>什么东西买不到？来这问问！</p>
                                            <a href="" class="readmore">了解更多</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-three"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>以物易物</h2>
                                            <p>这是最古老的交易方式，今天焕发新生。</p>
                                            <p>听说过曲别针换别墅的故事吗？</p>
                                            <a href="" class="readmore">了解更多</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div> <!-- End slider area -->

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-refresh"></i>
                    <p>环保生活</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-truck"></i>
                    <p>同城交易</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-lock"></i>
                    <p>信息安全</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-gift"></i>
                    <p>发现好货</p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End promo area -->

<div class="product-widget-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">最高关注</h2>
                    <a href="pages/SecendHandsGoodsShop.jsp" class="wid-view-more">查看更多</a>

                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-2.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Apple new mac book 2015</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-3.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Apple new i phone 6</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-3.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Apple new i phone 6</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-3.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Apple new i phone 6</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">最近查看</h2>
                    <a href="pages/SecendHandsGoodsShop.jsp" class="wid-view-more">查看更多</a>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-4.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Sony playstation microsoft</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-1.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Sony Smart Air Condtion</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-2.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Samsung gallaxy note 4</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="pages/single-product.html"><img src="img/product-thumb-2.jpg" alt=""
                                                                 class="product-thumb"></a>
                        <h2><a href="pages/single-product.html">Samsung gallaxy note 4</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$400.00</ins>
                            <del>$425.00</del>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget" id="new-product">
                    <h2 class="product-wid-title">最新</h2>
                    <a href="pages/SecendHandsGoodsShop.jsp" class="wid-view-more">查看更多</a>

                </div>
            </div>
        </div>
    </div>
</div> <!-- End product widget area -->


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
<script src="<%=path %>/js/jquery-1.8.3.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="<%=path %>/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="<%=path %>/js/owl.carousel.min.js"></script>
<script src="<%=path %>/js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="<%=path %>/js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="<%=path %>/js/main.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {
            var user = "${session.user}";
            if (user != "") {
                $("#user-menu1").hide();
                $("#user-menu2").show();
            } else {
                $("#user-menu1").show();
                $("#user-menu2").hide();
            }
        });
    })
</script>
</body>
</html>

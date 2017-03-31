<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/20
  Time: 16:02
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
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageScope.basePath}css/bootstrap.min.css">

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
                <div class="user-menu" id="user-menu1">
                    <ul>
                        <li><a href="#"><i class="fa fa-user"></i>购物车</a></li>
                        <li><a href="pages/login.jsp"><i class="fa fa-user"></i>登录</a></li>
                        <li><a href="pages/register.jsp"><i class="fa fa-user"></i>注册</a></li>
                    </ul>
                </div>
                <div class="user-menu" id="user-menu2" hidden="hidden">
                    <ul>
                        <li><a href="#"><i class="fa fa-user"></i>我的曲别针</a></li>
                        <li><a href="#"><i class="fa fa-heart"></i>愿望单</a></li>
                        <li><a href="#"><i class="fa fa-user"></i>购物车</a></li>
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
                            <a href="${pageScope.basePath}pages/releaseGoods.jsp">我要发布</a>
                        </div>
                    </div>
                    <div class="col-md-6" id="cart-div" hidden="hidden">
                        <div class="shopping-item">
                            <a href="${pageScope.basePath}pages/cart.jsp"><i class="fa fa-shopping-cart"></i>&nbsp;<span
                                    id="cartCountPrice" class="cart-amunt"></span>
                                <span id="cartCountNum-span" class="product-count"></span></a>
                        </div>
                    </div>

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

<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <form>
                <div class="col-md-12">
                    <div class="row">
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col-md-11">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="inputLoca" class="col-sm-4 control-label">区域:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="inputLoca" name="sgdto.goodsLocation">
                                            <option selected="selected"
                                                    value="${session.user.province}-${session.user.city}">本地
                                            </option>
                                            <option value="${session.user.province}">全省</option>
                                            <option value="">全国</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="inputType" class="col-sm-4 control-label">类别:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="inputType" name="sgdto.goodsType">
                                            <option selected="selected"></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="inputTimeRange" class="col-sm-6 control-label">发布时间:</label>
                                    <div class="col-sm-6">
                                        <select class="form-control" id="inputTimeRange" name="sgdto.timeRange">
                                            <option value="" selected="selected">全部时间</option>
                                            <option value="7">一周内</option>
                                            <option value="30">一个月</option>
                                            <option value="365">全年</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-sm-4 control-label">价格:</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="inputPriceLow"
                                                   placeholder="起" name="sgdto.goodsPriceLow">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="inputPriceHigh"
                                                   placeholder="止" name="sgdto.goodsPriceHigh">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12 pull-right">
                                <div class="form-group">
                                    <button type="button" class="btn pull-right btn-danger" id="search-btn">检索</button>
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row" id="main-div">

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
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
    $(document).ready(function () {
        var user = "${session.user.userId}";
        if (user != "") {
            $("#user-menu1").hide();
            $("#user-menu2").show();
            $("#cart-div").show();
            $.ajax({//购物车
                url: "${pageScope.basePath}getCartCount.action",
                data: {"cartdto.userId": user},
                type: "get",
                success: function (data) {
                    var countNum = data.cartdto.goodsCount;
                    var countPrice = data.cartdto.goodsPriceCount;
                    $("#cartCountNum-span").html(countNum);
                    $("#cartCountPrice").html("￥" + countPrice);

                }
            })

        } else {
            $("#user-menu1").show();
            $("#user-menu2").hide();
            location.href = "/pages/login.jsp";
        }


        $.ajax({
            url: "/admin/get2HandGoodsList.action",
            type: "get",
            data: {"sgdto.goodsId": ""},
            success: function (data) {
                var userId = "${session.user.userId}";
                $.each(data.sgList, function (index, sg) {
                    var divString = "<div class='col-md-3 col-sm-6'> " +
                        "<div class='single-shop-product'> " +
                        "<div class='product-upper'> <img src='viewImg.action?imgpath=" + sg.goodsImg + "' alt=''>" +
                        "</div> <h2><a href='${pageScope.basePath}get2HandGoodsDetail.action?sgdto.goodsId=" + sg.goodsId + "'>" + sg.goodsTitle + "</a></h2> " +
                        "<div class='product-carousel-price'> <ins>￥" + sg.goodsPrice + "</ins> " +
                        "</div> <div class='product-option-shop'> " +
                        "<a class='add_to_cart_button' id='add_to_cart_button' data-quantity='1' data-product_sku='' data-product_id='70'rel='nofollow' onclick='addToCart(" + sg.goodsId + "," + sg.goodsPrice + ")' href=''>加入购物车</a> " +
                        "</div></div></div>";
                    $("#main-div").append(divString);
                })
            }, error: function () {
                $("#table").append("<tr><th colspan='8' style='color: red;text-align:center;'>无商品</th></tr>")
            }

        });
    });
    $("#search-btn").click(function () {
        $.ajax({
            url: "/admin/get2HandGoodsList.action",
            type: "get",
            data: $("form").serialize(),
            success: function (data) {
                $("#main-div").empty();
                $.each(data.sgList, function (index, sg) {
                    var divString = "<div class='col-md-3 col-sm-6'> " +
                        "<div class='single-shop-product'> " +
                        "<div class='product-upper'> <img src='viewImg.action?imgpath=" + sg.goodsImg + "' alt=''>" +
                        "</div> <h2><a href=''>" + sg.goodsTitle + "</a></h2> " +
                        "<div class='product-carousel-price'> <ins>￥" + sg.goodsPrice + "</ins> " +
                        "</div> <div class='product-option-shop'> " +
                        "<a class='add_to_cart_button' data-quantity='1' data-product_sku='' data-product_id='70'rel='nofollow' href='#'>加入购物车</a> " +
                        "</div></div></div>";
                    $("#main-div").append(divString);
                })
            }, error: function () {
                $("#table").append("<tr><th colspan='8' style='color: red;text-align:center;'>查询无结果</th></tr>")
            }

        });
    });

    function addToCart(goodsId, goodsPrice) {
        var userId = "${session.user.userId}";
        if (userId != "") {
            $.ajax({//加入购物车
                url: "${pageScope.basePath}addToCart.action",
                data: {
                    "cartdto.userId": userId,
                    "cartdto.goodsId": goodsId,
                    "cartdto.goodsCount": 1,
                    "cartdto.goodsPriceCount": goodsPrice
                },
                type: "post",
                success: function () {
                    $.ajax({//购物车
                        url: "${pageScope.basePath}getCartCount.action",
                        data: {"cartdto.userId": userId},
                        type: "get",
                        success: function (data) {
                            var countNum = data.cartdto.goodsCount;
                            var countPrice = data.cartdto.goodsPriceCount;
                            $("#cartCountNum-span").html(countNum);
                            $("#cartCountPrice").html("￥" + countPrice);

                        }
                    })
                }
            })
        }

    }

</script>
</body>
</html>

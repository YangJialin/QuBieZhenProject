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

            <div class="col-sm-4 pull-right">
                <div class="row">
                    <div class="col-md-6">
                        <div class="shopping-item">
                            <a href="#">我要发布</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="shopping-item">
                            <a href="pages/cart.jsp"><i class="fa fa-shopping-cart"></i>&nbsp;<span id="cartCountPrice"
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
                    <form id="easy-search">
                        <input type="text" name="sgdto.goodsTitle" placeholder="关键字...">
                        <input type="button" id="easy-search-btn" value="搜索">
                    </form>
                </div>

                <div id="easy-search-div" class="single-sidebar">
                    <h2 class="sidebar-title">在售商品</h2>
                    <div class="thubmnail-recent">
                        <img src="../img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>

                </div>

            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="">主页</a>
                        <a href="">二手商城</a>
                        <a href="">${sgdto.goodsTitle}</a>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">
                                <div class="product-main-img">
                                    <img src="viewImg.action?imgpath=${sgdto.goodsImg}" alt="商品图片">
                                </div>

                                <div class="product-gallery">
                                    <img src="../img/product-thumb-1.jpg" alt="">
                                    <img src="../img/product-thumb-2.jpg" alt="">
                                    <img src="../img/product-thumb-3.jpg" alt="">
                                    <img src="../img/product-thumb-4.jpg" alt="">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name">${sgdto.goodsTitle}</h2>
                                <div class="product-inner-price">
                                    <ins>￥${sgdto.goodsPrice}</ins>
                                </div>
                                <form class="cart">
                                    <div class="quantity">
                                        <input type="number" id="inputCountNum" size="4" class="input-text qty text"
                                               title="Qty" value="1"
                                               name="cartdto.goodsCount" min="1" step="1">
                                    </div>
                                    <button class="add_to_cart_button" type="button" id="add_to_cart_button">加入购物车
                                    </button>
                                </form>

                                <div class="product-inner-category">
                                    <p>坐标: <a href="">${sgdto.goodsLocation}</a>.</p>
                                </div>

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home"
                                                                                  role="tab" data-toggle="tab">详细</a>
                                        </li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab"
                                                                   data-toggle="tab">我要购买</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>商品描述</h2>
                                            <p>${sgdto.goodsDescribe}</p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="profile">
                                            <h2>交易方式选择：</h2>
                                            <div class="row" align="center">
                                                <div class="col-md-6"><p><input type="button"
                                                                                class="exchange_way_button" value="在线交易"
                                                                                id="online-btn"
                                                                                title="进入结算页面"></p></div>
                                                <div class="col-md-6"><p><input type="button"
                                                                                class="exchange_way_button" value="线下交易"
                                                                                id="offline-btn"
                                                                                title="交换联系方式与卖家线下交易"></p></div>


                                            </div>

                                            <div id="offline-div" class="submit-review" hidden="hidden">
                                                <h5>请确认个人联系方式：</h5>
                                                <p><label for="inputMobile">电话</label> <input id="inputMobile"
                                                                                              name="name" type="text"
                                                                                              value="${session.user.mobile}">
                                                </p>
                                                <p><label for="inputEmail">邮箱</label> <input id="inputEmail"
                                                                                             name="email" type="email"
                                                                                             value="${session.user.email}">
                                                </p>
                                                <p><label for="inputReview">留言：</label>
                                                    <textarea name="review" id="inputReview" cols="30"
                                                              rows="10"></textarea></p>
                                                <p><input type="submit" class="pull-right" value="购买"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>

                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#activity" data-toggle="tab">留言</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="activity">


                                <!-- Post -->
                                <%--<div class="post clearfix">--%>
                                <%--<div class="user-block">--%>
                                <%--<img class="img-circle img-bordered-sm"--%>
                                <%--src="${pageScope.basePath}admin/dist/img/user7-128x128.jpg"--%>
                                <%--alt="用户头像">--%>
                                <%--<span class="username">--%>
                                <%--<a href="#">评论者昵称</a>--%>
                                <%--<a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>--%>
                                <%--</span>--%>
                                <%--<span class="description">发布于 - 时间</span>--%>
                                <%--</div>--%>
                                <%--<!-- /.user-block -->--%>
                                <%--<p>这里是评论的内容</p>--%>
                                <%--<ul class="list-inline">--%>
                                <%--<li><a href="#" class="link-black text-sm"><i--%>
                                <%--class="fa fa-thumbs-o-up margin-r-5"></i>赞</a>--%>
                                <%--</li>--%>
                                <%--<li class="pull-right">--%>
                                <%--<a href="#" class="link-black text-sm"><i--%>
                                <%--class="fa fa-comments-o"></i>回复</a></li>--%>
                                <%--</ul>--%>
                                <%--<hr>--%>
                                <%--</div>--%>
                                <!-- /.post -->
                            </div>
                            <hr>
                            <form id="leaveMessageForm" class="form-horizontal">
                                <div class="form-group margin-bottom-none">
                                    <input type="text" hidden="hidden" name="msgdto.goodsId" value="${sgdto.goodsId}">
                                    <input type="text" hidden="hidden" name="msgdto.marketUserId"
                                           value="${session.user.userId}">
                                    <div class="col-sm-9">
                                        <textarea id="msgArea" class="form-control input-sm"
                                                  name="msgdto.messageDetails" placeholder="评论内容"></textarea>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="button" id="leaveMessage-btn"
                                                class="btn btn-danger pull-right btn-block btn-sm">
                                            发布
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="related-products-wrapper">
                            <h2 class="related-products-title">相似商品</h2>
                            <div class="related-products-carousel"> <%--滚轴--%>

                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img src="../img/product-1.jpg" alt="">
                                        <div class="product-hover">
                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入到购物车</a>
                                            <a href="" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                        </div>
                                    </div>

                                    <h2><a href="">Sony Smart TV - 2015</a></h2>

                                    <div class="product-carousel-price">
                                        <ins>$700.00</ins>
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

        var user = "${session.user.userId}";
        if (user != "") {
            $("#user-menu1").hide();
            $("#user-menu2").show();
            $("#cart-div").show();
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
            })

        } else {
            $("#user-menu1").show();
            $("#user-menu2").hide();

        }

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
        $.ajax({
            url: "getLeaveMessage.action",
            data: {"msgdto.goodsId": "${sgdto.goodsId}"},
            type: "get",
            success: function (data) {
                $.each(data.msgList, function (index, message) {
                    var messageString = "<div class='post clearfix'>" +
                        "<div class='user-block'>" +
                        "<img class='img-circle img-bordered-sm' src='viewImg.action?imgpath=" + message.udto.picImg + "' alt='用户头像'>" +
                        "<span class='username'>" +
                        "<a href='viewUser.action?udto.userId=" + message.udto.userId + "'>" + message.udto.showName + "</a>" +
                        "<a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>" +
                        "</span>" +
                        "<span class='description'>" + message.createTime + "</span>" +
                        "</div>" +

                        "<p>" + message.messageDetails + "</p>" +
                        "<ul class='list-inline'>" +
                        "<li class='pull-right'>" +
                        "<a href='javascript:void(0)' class='link-black text-sm' " +
                        "onclick=\"replyMessage('" + message.udto.showName + "');return false;\"" +
                        "<i class='fa fa-comments-o'></i>回复</a></li>" +
                        "</ul>" +
                        "</div>";
                    $("#activity").append(messageString);

                })

            }
        })
    });

    $("#add_to_cart_button").click(function () {
        var goodsCountNum = $("#inputCountNum").val();
        var goodsPriceCount = goodsCountNum *${sgdto.goodsPrice};
        $.ajax({//加入购物车
            url: "${pageScope.basePath}addToCart.action",
            data: {
                "cartdto.userId":${session.user.userId},
                "cartdto.goodsId":${sgdto.goodsId},
                "cartdto.goodsCount": goodsCountNum,
                "cartdto.goodsPriceCount": goodsPriceCount
            },
            type: "post",
            success: function () {
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
                })
            }
        })
    });
    $("#offline-btn").click(function () {
        $("#offline-div").show();
    });

    $("#leaveMessage-btn").click(function () {
        $.ajax({
            url: "addLeaveMessage.action",
            data: $("form#leaveMessageForm").serialize(),
            type: "post",
            success: function () {
                $("#activity").empty();
                $.ajax({
                    url: "${pageScope.basePath}getLeaveMessage.action",
                    data: {"msgdto.goodsId": "${sgdto.goodsId}"},
                    type: "get",
                    success: function (data) {
                        $.each(data.msgList, function (index, message) {
                            var messageString = "<div class='post clearfix'>" +
                                "<div class='user-block'>" +
                                "<img class='img-circle img-bordered-sm' src='viewImg.action?imgpath=" + message.udto.picImg + "' alt='用户头像'>" +
                                "<span class='username'>" +
                                "<a href='viewUser.action?udto.userId=" + message.udto.userId + "'>" + message.udto.userName + "</a>" +
                                "<a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>" +
                                "</span>" +
                                "<span class='description'>" + message.createTime + "</span>" +
                                "</div>" +

                                "<p>" + message.messageDetails + "</p>" +
                                "<ul class='list-inline'>" +
                                "<li class='pull-right'>" +
                                "<a href='javascript:void(0)' class='link-black text-sm' onclick=\"replyMessage('" + message.udto.showName + "');return false;\"><i class='fa fa-comments-o'></i>回复</a></li>" +
                                "</ul>" +
                                "<hr>" +
                                "</div>";
                            $("#activity").append(messageString);

                        })

                    }
                })
            }
        })
    });

    $("#easy-search-btn").click(function () {
        $("#easy-search-div div").remove();
        $.ajax({
            url: "${pageScope.basePath}admin/get2HandGoodsList.action",
            data: $("form#easy-search").serialize(),
            type: "get",
            success: function (data) {
                $.each(data.sgList, function (index, sgdto) {
                    var messageString = "<div class='thubmnail-recent'> " +
                        "<img src='viewImg.action?imgpath=" + sgdto.goodsImg + "' class='recent-thumb' alt=''> " +
                        "<h2><a href=''>" + sgdto.goodsTitle + "</a></h2> " +
                        "<div class='product-sidebar-price'> <ins>￥" + sgdto.goodsPrice + "</ins></div></div>";
                    $("#easy-search-div").append(messageString);
                })
            }
        })
    });

    function replyMessage(data) {
        $("#msgArea").focus();
        $("#msgArea").html("回复：" + data + " ");

    }
</script>
</body>
</html>
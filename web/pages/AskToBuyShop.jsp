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

    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}admin/dist/css/AdminLTE.min.css">


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
                            <div class="col-md-4 pull-right">
                                <div class="form-group">
                                    <label for="inputTitle" class="col-sm-4 control-label">关键字:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputTitle" name="askdto.askTitle">
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
            url: "getAskToBuyList.action",
            data: {"askdto.askId": ""},
            type: "get",
            success: function (data) {
                $.each(data.askList, function (index, ask) {
                    var askString = " <div class='col-md-4'> " +
                        "<div class='box box-widget'> " +
                        "<div class='box-header with-border'> " +
                        "<div class='user-block'> " +
                        "<img class='img-circle' src=viewImg.action?imgpath=" + ask.udto.picImg + " alt='User Image'> " +
                        "<span class='username'><a href='getOtherUserInfo.action?udto.userId=" + ask.udto.userId + "'>" + ask.udto.showName + "</a></span> " +
                        "<span class='description'>发布时间 - " + ask.createTime + "</span> " +
                        "<h4>" + ask.askTitle + "</h4> " +
                        "</div> </div> " +
                        "<div class='box-body'> " + ask.askDetails + " </div>" +
                        " <div class='box-footer'>" +
                        "<input type='button' class='btn btn-primary  pull-left' onclick='showInfo(" + index + ")' value='联系Ta'>" +
                        "<div id='" + index + "-div' hidden='hidden'><span class='description'>电话：" + ask.udto.mobile + "</span><br>" +
                        "<span class='description'>邮箱：" + ask.udto.email + "</span>" +
                        " </div></div> " +
                        "</div> </div>";
                    $("#main-div").append(askString);

                })

            }
        })

    });
    $("#search-btn").click(function () {
        $.ajax({
            url: "/getAskToBuyList.action",
            type: "get",
            data: $("form").serialize(),
            success: function (data) {
                $("#main-div").empty();
                $.each(data.askList, function (index, ask) {
                    var askString = " <div class='col-md-4'> " +
                        "<div class='box box-widget'> " +
                        "<div class='box-header with-border'> " +
                        "<div class='user-block'> " +
                        "<img class='img-circle' src=viewImg.action?imgpath=" + ask.udto.picImg + " alt='User Image'> " +
                        "<span class='username'><a href='getOtherUserInfo.action?udto.userId=" + ask.udto.userId + "'>" + ask.udto.showName + "</a></span> " +
                        "<span class='description'>发布时间 - " + ask.createTime + "</span> " +
                        "<h4>" + ask.askTitle + "</h4> " +
                        "</div> </div> " +
                        "<div class='box-body'> " + ask.askDetails + " </div>" +
                        " <div class='box-footer'>" +
                        "<input type='button' class='btn btn-primary  pull-left' onclick='showInfo(" + index + ")' value='联系Ta'>" +
                        "<div id='" + index + "-div' hidden='hidden'><span class='description'>电话：" + ask.udto.mobile + "</span><br>" +
                        "<span class='description'>邮箱：" + ask.udto.email + "</span>" +
                        " </div></div> " +
                        "</div> </div>";
                    $("#main-div").append(askString);
                })
            }, error: function () {
                $("#main-div").append("<tr><th colspan='8' style='color: red;text-align:center;'>查询无结果</th></tr>")
            }

        });
    });
    function showInfo(index) {
        $("#" + index + "-div").show();
    }

</script>
</body>
</html>

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

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageScope.basePath}/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageScope.basePath}/style.css">
    <link rel="stylesheet" href="${pageScope.basePath}/css/responsive.css">

    <script src="${pageScope.basePath}/js/jquery-3.1.1.min.js"></script>
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
<div class="content-wrapper" style="margin-left:0">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            订单
            <small>(请勿刷新页面)</small>
        </h1>

    </section>
    <!-- Main content -->
    <section class="invoice">
        <!-- title row -->
        <div class="row">
            <div class="col-xs-12">
                <h2 class="page-header">
                    <i class="fa fa-globe"></i> 曲别针闲置物品交易,在线支付.
                    <small class="pull-right" id="date-small"></small>
                </h2>
            </div>
            <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">

            <!-- /.col -->
            <div class="col-sm-5 invoice-col">
                您的信息
                <address id="user-address">
                    <strong>${session.user.userName}</strong><br>
                    ${session.user.address}<br>
                    ${session.user.province}-${session.user.city}<br>
                    电话: ${session.user.mobile}<br>
                    邮箱: ${session.user.email}
                </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-5 invoice-col" id="orderinfo-div">
                <b>订单信息</b><br>
                <br>
                <b>订单编号:</b> 4F3S8J<br>
                <b>生成日期:</b> 2/22/2014<br>
                <b>交易状态:</b> 交易中
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- Table row -->
        <div class="row">
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

                    </tbody>
                </table>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <div class="row">
            <!-- accepted payments column -->
            <div class="col-xs-6">
                <p class="lead">支付方式:</p>
                <img src="${pageScope.basePath}admin/dist/img/credit/visa.png" alt="Visa">
                <img src="${pageScope.basePath}admin/dist/img/credit/mastercard.png" alt="Mastercard">
                <img src="${pageScope.basePath}admin/dist/img/credit/american-express.png" alt="American Express">
                <img src="${pageScope.basePath}admin/dist/img/credit/paypal2.png" alt="Paypal">

                <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                    本站提供多种支付方式，方便您完成对心爱之物的购买，请注意输入密码时的周边环境，祝您购物愉快！ </p>
            </div>
            <!-- /.col -->
            <div class="col-xs-6">
                <p class="lead" id="pay-line"></p>

                <div class="table-responsive">
                    <table class="table" id="respon-table">

                    </table>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- this row will not appear when printing -->
        <div class="row no-print">
            <div class="col-xs-12">
                <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i>打印</a>
                <button type="button" class="btn btn-primary" style="margin-right: 5px;">
                    <i class="fa fa-download"></i> 打印到PDF
                </button>

                <button type="button" class="btn btn-success pull-right" id="paynow-btn"><i
                        class="fa fa-credit-card"></i> 立即支付
                </button>
                <button type="button" class="btn btn-danger pull-right" id="cancel-btn"><i
                        class="fa fa-credit-card"></i> 取消订单
                </button>

            </div>
        </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
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

            var d = new Date();
            var datestr = "日期:" + d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
            $("#date-small").html(datestr);
            $("#pay-line").html("支付期限：" + datestr);


            $.ajax({
                url: "${pageScope.basePath}getOrderDetail.action",
                data: {"orderdto.orderId":${orderdto.orderId}},
                type: "get",
                success: function (data) {

                    if (data.orderdto.orderStatus == 0) {
                        var orderStutas = "交易中";
                    } else {
                        var orderStutas = "交易结束";
                    }
                    var orderinfo = "<b>订单信息</b><br>" +
                        " <br> <b>订单编号:</b>" + data.orderdto.orderId + "<br>" +
                        " <b>生成日期:</b>" + data.orderdto.createTime + "<br>" +
                        " <b>交易状态:</b> " + orderStutas;
                    $("#orderinfo-div").html(orderinfo);

                    var sum = data.orderdto.sumPrice + 10;
                    var f = "<tr> <th style='width:50%'>小计:</th> <td>￥" + data.orderdto.sumPrice + "</td> </tr> <tr> <th>邮费:</th> <td>￥10.00</td> </tr> <tr> <th>应付金额:</th> <td>￥" + sum + "</td> </tr>";
                    $("#respon-table").append(f);

                    $.each(data.orderdto.sgList, function (index, sgdto) {
                        var tb = " <tr> <td>" + sgdto.goodsCount + "</td> " +
                            "<td>" + sgdto.goodsTitle + "</td>" +
                            " <td>" + sgdto.authorId + "</td> " +
                            "<td>" + sgdto.goodsDescribe + "</td>" +
                            " <td>￥" + sgdto.goodsPrice * sgdto.goodsCount + "</td> </tr>";
                        $("#detail-table").append(tb);
                    })
                }
            })

        });

        $("#paynow-btn").click(function () {
            $.ajax({
                url: "${pageScope.basePath}payOrder.action",
                data: {"orderdto.orderId":${orderdto.orderId}},
                type: "get",
                success: function (data) {
                    if (confirm("支付成功")) {
                        location.href = "${pageScope.basePath}pages/userPage.jsp";
                    }
                }
            })
        })
    })
</script>
</body>
</html>

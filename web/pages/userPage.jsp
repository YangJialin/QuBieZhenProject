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
    <script type="text/javascript">
        //下面用于图片上传预览功能
        function setImagePreview(avalue) {
            var docObj = document.getElementById("doc");

            var imgObjPreview = document.getElementById("preview");
            if (docObj.files && docObj.files[0]) {
                //火狐下，直接设img属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '150px';
                imgObjPreview.style.height = '180px';
                //imgObjPreview.src = docObj.files[0].getAsDataURL();

                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
            }
            else {
                //IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById("localImag");
                //必须设置初始大小
                localImagId.style.width = "150px";
                localImagId.style.height = "180px";
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch (e) {
                    alert("您上传的图片格式不正确，请重新选择!");
                    return false;
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
            return true;
        }

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
                    <li class="active"><a href="${pageScope.basePath}index.jsp">主页</a></li>
                    <li><a href="${pageScope.basePath}pages/SecendHandsGoodsShop.jsp">二手商场</a></li>
                    <li><a href="${pageScope.basePath}#">易物</a></li>
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
                                     src="<s:url action='viewImg'><s:param name='imgpath'>${session.user.picImg}</s:param></s:url>"
                                     alt="User profile picture">

                                <h3 class="profile-username text-center">${session.user.userName}</h3>

                                <p class="text-muted text-center">${session.user.showName}</p>

                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>发布商品数</b> <a class="pull-right" id="fabushangpinshu"></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>购买次数</b> <a class="pull-right" id="dingdanshu"></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>积分</b> <a class="pull-right">${session.user.score}</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                        <!-- About Me Box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">我的信息</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <strong><i class="fa fa-book margin-r-5"></i>邮箱</strong>

                                <p class="text-muted">
                                    ${session.user.email} </p>

                                <hr>

                                <strong><i class="fa fa-map-marker margin-r-5"></i> 地址</strong>

                                <p class="text-muted">${session.user.province},${session.user.city}, ${session.user.address}</p>

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
                                <li><a href="#timeline" data-toggle="tab">交易记录</a></li>
                                <li><a href="#settings" data-toggle="tab">个人设置</a></li>
                                <li><a href="#userImg" data-toggle="tab">上传头像</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="active tab-pane" id="activity">
                                    <table cellspacing="0" id="cart-table" class="shop_table cart">
                                        <thead>
                                        <tr>
                                            <th class="product-thumbnail" width="20%">图片</th>
                                            <th class="product-name" width="25%">名称</th>
                                            <th class="product-price" width="15%">单价</th>
                                            <th class="product-price" width="20%">时间</th>
                                            <th class="product-price" width="20%">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>

                                </div>
                                <!-- /.tab-pane -->


                                <div class="tab-pane" id="timeline">
                                    <!-- The timeline -->
                                    <ul class="timeline timeline-inverse">
                                        <!-- timeline time label -->
                                        <li class="time-label">
                                            <span class="bg-red">10 Feb. 2014</span>
                                        </li>
                                        <!-- /.timeline-label -->
                                        <!-- timeline item -->
                                        <li>
                                            <i class="fa fa-user bg-aqua"></i>

                                            <div class="timeline-item">
                                                <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                                                <h3 class="timeline-header no-border"><a href="#">Sarah Young</a>
                                                    accepted your friend request
                                                </h3>
                                            </div>
                                        </li>
                                        <!-- END timeline item -->

                                        <li>
                                            <i class="fa fa-clock-o bg-gray"></i>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.tab-pane -->

                                <div class="tab-pane" id="settings">
                                    <form action="modifyUser.action" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="inputName" class="col-sm-2 control-label">用户名</label>

                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" name="udto.userName"
                                                       id="inputName" placeholder="Name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>

                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" name="udto.email"
                                                       id="inputEmail" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputShowName" class="col-sm-2 control-label">昵称</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="udto.showName"
                                                       id="inputShowName" placeholder="Name">
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputSex" class="col-sm-4 control-label">性别:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="inputSex" name="udto.sex">
                                                            <option selected="selected"></option>
                                                            <option value="1">男</option>
                                                            <option value="0">女</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">

                                                    <label for="birthday" class="col-sm-4 control-label">生日:</label>
                                                    <div class="input-group date col-sm-8">
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
                                        <div class="form-group">
                                            <label for="inputMobile" class="col-sm-2 control-label">电话:</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="inputMobile"
                                                       placeholder="电话" name="udto.mobile">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputProvince"
                                                           class="col-sm-4 control-label">省份:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="inputProvince"
                                                                name="udto.province">
                                                            <option selected="selected"></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputCity" class="col-sm-4 control-label">城市:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="inputCity" name="udto.city">
                                                            <option selected="selected"></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputAddress" class="col-sm-2 control-label">地址:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="inputAddress"
                                                       placeholder="地址" name="udto.address">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-danger">提交</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" id="userImg">

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                        <tr>
                                            <td height="101" align="center">
                                                <div id="localImag">
                                                    <img id="preview"
                                                         src="<s:url action='viewImg'><s:param name='imgpath'>${session.user.picImg}</s:param></s:url>"
                                                         style="display: block; width: 300px;height: 400px;"></div>
                                            </td>
                                        </tr>
                                        <form action="modifyUserImg.action" method="post" enctype="multipart/form-data"
                                              class="form-horizontal" id="main-form">
                                            <tr>
                                                <td align="center" style="padding-top:10px;">
                                                    <input type="file"
                                                           name="uploadFile"
                                                           id="doc"
                                                           style="width:150px;"
                                                           onchange="setImagePreview();">
                                                    <input type="text" name="udto.userId" value="${session.user.userId}"
                                                           hidden="hidden">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="padding-top:10px;">
                                                    <input class="btn btn-danger" type="submit" style="width:100px;"
                                                           value="上传">
                                                </td>
                                            </tr>
                                        </form>
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
            var msg = "${requestScope.Msg}";
            if (msg != "") {
                alert(msg);
            }
            <!-- 查询购买商品数，订单数-->
            $.getJSON("${pageScope.basePath}getUserSellBuyCount.action?udto.userId=${session.user.userId}",
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
                data: {"sgdto.authorId":${session.user.userId}},
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
                            "<td class='product-subtotal'>" +
                            "<a href='#' class='btn btn-primary btn-block'><b>修改</b></a>" +
                            "</td>" +
                            "</tr>";
                        $("#cart-table option:gt(0)").remove();
                        $("#cart-table").append(cartString);

                    })

                }
            });
            //填充用户信息
            var userId = "${session.user.userId}";
            $.ajax({
                url: "${pageScope.basePath}admin/getUserInfoDetailforModify.action",
                data: {"udto.userId": userId},
                success: function (data) {
                    var udto = data.udto;
                    $("#inputEmail").val(udto.email);
                    $("#inputName").val(udto.userName);
                    $("#inputShowName").val(udto.showName);
                    $("#inputSex").val(udto.sex);
                    $("#birthday").val(udto.birthday);
                    $("#inputMobile").val(udto.mobile);
                    $("#inputProvince").val(udto.province);
                    $("#inputCity option:gt(0)").remove();
                    $.ajax({
                        url: "${pageScope.basePath}admin/getCity.action",
                        data: {"prdto.provinceId": udto.province},
                        success: function (data) {
                            $.each(data.cityList, function (ind, city) {
                                var trString = "<option value='" + city.cityId + "'>" + city.cityName + "</optionva>";
                                $("#inputCity").append(trString);

                            });
                        }
                    });

                    $("#inputCity").val(udto.city);
                    $("#inputAddress").val(udto.address);
                }
            })
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
    })
</script>
</body>
</html>

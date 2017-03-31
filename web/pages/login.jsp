<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/5
  Time: 22:50
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
    <title>曲别针 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageScope.basePath}css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageScope.basePath}css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageScope.basePath}css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageScope.basePath}css/blue.css">

</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${pageScope.basePath}index.jsp"><b>曲别针</b>Mark</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录打开新世界</p>

        <form action="${pageScope.basePath}login.action" method="post">
            <div class="form-group has-feedback">
                <input type="email" class="form-control" name="udto.email" placeholder="邮箱">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="udto.password" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <a href="#">忘记密码 </a><br>
        <a href="register.jsp" class="text-center">注册新用户</a>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="${pageScope.basePath}js/jquery-3.1.1.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageScope.basePath}js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageScope.basePath}js/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>


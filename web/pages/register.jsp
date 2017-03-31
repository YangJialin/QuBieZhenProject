<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2016/12/5
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>曲别针 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../css/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="../index.jsp"><b>曲别针</b>Mark</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">注册新用户</p>

        <form action="../register.action" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="udto.userName" placeholder="用户名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" name="udto.email" placeholder="邮箱">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="udto.password" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="再输一次密码">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 我同意 <a href="#">《用户协议》</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" id="submit-btm" class="btn btn-primary btn-block btn-flat" onclick="return ">
                        注册
                    </button>
                </div>
                <!-- /.col -->
            </div>
        </form>
        <a href="login.jsp" class="text-center">我已经有账号</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<script src="../js/jquery-3.1.1.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../js/icheck.min.js"></script>
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


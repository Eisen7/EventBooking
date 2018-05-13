<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0050)https://v4.bootcss.com/docs/4.0/examples/checkout/ -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v4.bootcss.com/favicon.ico">

    <title>Checkout example for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../../down/form_files/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../down/form_files/form-validation.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        function updateUserInfo() {
            $.ajax({
                url: "/updateUserInfo.do",
                type: "POST",
                dataType: "json",
                data: $("#userForm").serialize(),
                success: function (data) {
                    alert(data.data);
                    if (data.state === 0) {
                        window.location.href = "/userInfo.do";
                    } else {
                        window.location.href = "/index.jsp";
                    }
                }
            })
        }

    </script>


</head>

<body class="bg-light">
<nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark">
    <a class="navbar-brand" href="/classList.do"> 主页 </a>
    <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/classList.do">选课管理 <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/userInfo.do">用户设置</a>
            </li>
        </ul>
    </div>
    <form class="form-inline my-2 my-lg-0" action="/logout.do" method="post">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">注销</button>
    </form>
</nav>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="../../down/form_files/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>更新您的个人信息</h2>
        <p class="lead">更新以及查看您的个人信息</p>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">您的登陆次数为</span>
                <span class="badge badge-secondary badge-pill">${user.loginCount}次</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <h6 class="my-0">Login Type</h6>
                        <small>登陆身份</small>
                    </div>
                    <span class="text-success">${user.userType==0?"管理员":"普通用户"}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Login Name</h6>
                        <small class="text-muted">您的登陆名</small>
                    </div>
                    <span class="text-muted">${user.username}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Email</h6>
                        <small class="text-muted">您的邮箱地址</small>
                    </div>
                    <span class="text-muted">${user.email}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Last Login Time</h6>
                        <small class="text-muted">上次登录时间</small>
                    </div>
                    <span class="text-muted">${lastLoginDate}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between">
                    <span>Mobile Phone</span>
                    <strong>${user.mobilePhone}</strong>
                </li>
            </ul>


        </div>

        <div class="col-md-8 order-md-1">
            <form class="form-signin" id="userForm">
                <img class="mb-4" src="../resources/bootstrap-solid.svg" alt="" width="72" height="72">
                <h1 class="h3 mb-3 font-weight-normal">Event-Booking Sign up</h1>

                LoginName can't update<input type="text" name="username" class="form-control" placeholder="Your LoginName" required="" autofocus="" readonly="readonly" value="${user.username}">
                <label for="email" class="sr-only">Email address</label>
                Email address<input type="email" name="email" id="email" class="form-control" placeholder="Email address" required="" autofocus="" value="${user.email}" }>
                Mobile Phone <input type="text" name="mobilePhone" class="form-control" placeholder="Mobile Phone" required="" autofocus="" value="${user.mobilePhone}">
                Address<input type="text" name="address" class="form-control" placeholder="Address" required="" autofocus="" ${user.address}>
                <label for="password" class="sr-only">Password</label>
                Password<input type="password" name="password" id="password" class="form-control" placeholder="Password" required="" autofocus="" value="${user.password}">


                <div class="mb-3" style="display: inline">点击下面按钮即可更新</div>

                <button class="btn btn-lg btn-primary btn-block" type="button" id="loginButton" onclick="updateUserInfo()">Update your message</button>

            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">© 2018 By SilkRoad</p>
    </footer>
</div>

</body>
</html>